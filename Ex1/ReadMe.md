Network-Security-Ancestral-Encryption

简介：一个用于教学与实验的凯撒/简单替换密码批量破解工具（MATLAB 实现）。
本仓库提供从文件读取密文、暴力列出 26 种位移候选、以及自动评分（高频词匹配 + 字母频率 χ²）以辅助判读的脚本与辅助文件。

主要特性

从文本文件（每行一条密文）批量处理。

暴力列出 26 种位移的所有候选明文，便于人工比对。

自动评分：高频英文单词匹配数为主，字母频率 χ² 做次级排序。

辅助函数全部集中在 utils/ 文件夹，便于管理和扩展。

目录结构
.
├─ README.md
├─ .gitignore
├─ caesar_batch_crack.m      # 主脚本：批量处理、自动评分与输出
├─ utils/                    # 所有辅助函数目录
│   ├─ load_wordlist.m       # 读取词表文件
│   ├─ caesar_decrypt_basic.m      # 凯撒解密（单条文本）
│   ├─ eng_chi_square.m  # 计算字母频率 χ²
│   └─ （可继续添加其它工具函数）
├─ CommonWords.txt           # 高频词表（每行一个单词）
├─ list.txt                  # 待解密密文（示例，每行一条）
├─ simple_word_match_score.m # 通过人工去检测和判断最佳结果 (只输出所有可能的结果，人工判断)
