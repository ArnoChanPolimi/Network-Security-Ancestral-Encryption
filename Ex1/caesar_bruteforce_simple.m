function caesar_bruteforce_simple(ciphertext)
% caesar_bruteforce_simple - 暴力列出凯撒密码所有 26 种位移的可能明文
%
% 用法:
%   caesar_bruteforce_simple('Twt rxewtg ztn xh uxuittc')
%
% 输入:
%   ciphertext - 需要破解的密文字符串
clc; 

if nargin < 1
    error('请提供密文字符串作为输入，例如: caesar_bruteforce_simple(''Twt rxewtg ztn xh uxuittc'')');
end

fprintf('Ciphertext: %s\n\n', ciphertext);

for shift = 0:25
    plaintext = decrypt_caesar(ciphertext, shift);
    fprintf('Shift %2d : %s\n', shift, plaintext);
end

end

%% ------------------- helper -------------------
function pt = decrypt_caesar(text, shift)
% 将字母向后移 shift 位做“解密”，保持大小写和非字母不变
pt = char(text);
for i = 1:numel(text)
    c = text(i);
    if c >= 'A' && c <= 'Z'
        idx = double(c) - double('A');
        newIdx = mod(idx - shift, 26);
        pt(i) = char(newIdx + double('A'));
    elseif c >= 'a' && c <= 'z'
        idx = double(c) - double('a');
        newIdx = mod(idx - shift, 26);
        pt(i) = char(newIdx + double('a'));
    else
        pt(i) = c;
    end
end
end
