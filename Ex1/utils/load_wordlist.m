function wordset = load_wordlist(filename)
% load_wordlist 读取英文单词列表
% 输入:
%   filename - 文本文件路径，每行一个英文单词
% 输出:
%   wordset - 单元格数组，每个元素是一个单词（小写）

if nargin < 1 || isempty(filename)
    filename = 'CommonWords.txt';
end

fid = fopen(filename, 'r', 'n', 'UTF-8');
if fid < 0
    error('Cannot open wordlist file: %s\n', filename);
end

wordset = {};
while ~feof(fid)
    line = fgetl(fid);
    if ischar(line) && ~isempty(strtrim(line))
        wordset{end+1,1} = lower(strtrim(line)); % 转小写
    end
end

fclose(fid);

end
