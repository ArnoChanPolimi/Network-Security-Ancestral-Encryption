# Network-Security-Ancestral-Encryption

> Ex1 简介：一个简单的**凯撒/简单替换密码批量破解**工具（MATLAB 实现）。从文本文件（每行一条密文）批量处理。暴力列出 26 种位移的所有候选明文，便于人工比对。自动评分：高频英文单词匹配数为主，字母频率 χ² 做次级排序。辅助函数全部集中在 utils/ 文件夹，便于管理和扩展。

---

## 项目结构（可点击打开文件）
> 我把关键文件和 utils/ 下的重要函数列出来，点击即可跳转到 GitHub 文件页面。

- `caesar_batch_crack.m` — 主脚本：批量处理、自动评分与输出  
- `simple_word_match_score.m` — 简单的人工核验辅助（列出所有候选）  
- `CommonWords.txt` — 高频词表（每行一个单词）  
- `list.txt` — 待解密密文（示例，每行一条）  

<details>
<summary><strong>utils/ （折叠查看）</strong></summary>

- `utils/load_wordlist.m` — 读取词表文件（返回 cell array）  
- `utils/caesar_decrypt_basic.m` — 凯撒解密函数（对单条字符串解密）  
- `utils/eng_chi_square.m` — 计算字母频率 χ²（卡方检验）  
- （可继续在 utils/ 添加其它工具函数）

</details>

---

## 快速开始

1. 克隆仓库：
```bash
git clone https://github.com/ArnoChanPolimi/Network-Security-Ancestral-Encryption.git
cd Network-Security-Ancestral-Encryption
