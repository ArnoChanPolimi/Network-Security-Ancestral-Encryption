%% ------------------- helpers -------------------
function pt = caesar_decrypt_basic(text, shift)
% 将字母向后移 shift 位做“解密”，保持大小写与非字母不变

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
