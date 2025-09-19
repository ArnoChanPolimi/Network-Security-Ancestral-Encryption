function w = simple_word_match_score(text, wordlist)
% 统计明文中匹配到的 high-frequency 单词数（小写匹配）
tokens = regexp(lower(text), '[a-z]+', 'match');
w = 0;
for i = 1:numel(tokens)
    t = tokens{i};
    if any(strcmp(wordlist, t))
        w = w + 1;
    end
end
end
