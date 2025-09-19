function chi = eng_chi_square(text)
% 计算简化的卡方统计（用于区分可读英文与随机字母）
engFreq = [8.167,1.492,2.782,4.253,12.702,2.228,2.015,6.094,6.966,0.153,0.772,4.025,2.406,6.749,7.507,1.929,0.095,5.987,6.327,9.056,2.758,0.978,2.361,0.150,1.974,0.074];
engFreq = engFreq / sum(engFreq);
text = lower(text);
counts = zeros(26,1);
total = 0;
for i = 1:length(text)
    c = text(i);
    if c >= 'a' && c <= 'z'
        counts(double(c)-double('a')+1) = counts(double(c)-double('a')+1) + 1;
        total = total + 1;
    end
end
if total == 0
    chi = inf;
    return;
end
obs = counts / total; % 观测到的字母频率
chi = sum((obs - engFreq').^2 ./ (engFreq' + eps)); % 卡方统计
end
