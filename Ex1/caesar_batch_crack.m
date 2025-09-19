function caesar_batch_crack(listPath)
% caesar_batch_crack  批量破解简单的凯撒密码（单文件实现）
% 用法:
%   caesar_batch_crack('list.txt')
% 或
%   caesar_batch_crack() % 默认使用 ./list.txt
%
% 输入文件每行一个密文（可带空格/标点），脚本对每行输出最佳解。
%
% 评分策略（简化版）：
%  1) countWords = 候选明文中匹配到的高频英文单词数量（主要评分，越大越好）
%  2) chi = 字母频率与英文期望的卡方（次要评分，越小越好）
% 最终选择：先按 countWords 最大，若多候选 tie-break 用 chi 最小。
clc;
addpath('utils');

if nargin < 1 || isempty(listPath)
    listPath = 'list.txt';
end

% 高频词表（非常短的内置列表，按需可扩展）
wordset = load_wordlist('CommonWords.txt');

% 读取文件
fid = fopen(listPath,'r','n','UTF-8');
if fid < 0
    error('Cannot open file: %s\n', listPath);
end

lineNo = 0;
fprintf('Reading from %s ...\n', listPath);
while ~feof(fid)
    raw = fgetl(fid);
    lineNo = lineNo + 1;
    if ~ischar(raw)
        continue;
    end
    ciphertext = strtrim(raw);
    if isempty(ciphertext)
        fprintf('Line %d: (empty) skipped\n', lineNo);
        continue;
    end

    % 对这一行做 26 种位移
    candidates = cell(26,1);
    wordScores = zeros(26,1);
    chiScores = zeros(26,1);
    for k = 0:25
        pt = caesar_decrypt_basic(ciphertext, k);
        candidates{k+1} = pt;
        wordScores(k+1) = simple_word_match_score(pt, wordset);
        chiScores(k+1) = eng_chi_square(pt);
    end

    % 先选 wordScores 最大的候选
    maxWord = max(wordScores);
    idxs = find(wordScores == maxWord);
    if numel(idxs) == 1
        bestIdx = idxs;
    else
        % 多个候选相同word score -> 选 chi 最小
        [~,minpos] = min(chiScores(idxs));
        bestIdx = idxs(minpos);
    end

    bestPlain = candidates{bestIdx};
    bestShift = bestIdx - 1;

    % 输出结果：原行、最佳解、及 top3 候选（按 wordScore, tie-break chi）
    fprintf('Line %d: %s\n', lineNo, ciphertext);
    fprintf('  Best: shift=%2d -> %s\n', bestShift, bestPlain);

    % 输出 top3 以便人工核查
    % 按 (wordScore desc, chi asc) 排序
    order = (1:26)';
    T = table(order, wordScores, chiScores, candidates, 'VariableNames', {'idx','wscore','chi','pt'});
    T = sortrows(T, {'wscore','chi'}, {'descend','ascend'});
    topK = min(3,height(T));
    fprintf('  Top %d candidates:\n', topK);
    for j = 1:topK
        idx = T.idx(j);
        fprintf('    rank %d: shift=%2d w=%d chi=%.2f -> %s\n', j, idx-1, T.wscore(j), T.chi(j), T.pt{j});
    end
    fprintf('\n');
end

fclose(fid);
fprintf('Done. Processed %d lines.\n', lineNo);

end

