# Network-Security-Ancestral-Encryption

## 简介（Overview）

**Ex1 — 凯撒/简单替换密码批量破解（MATLAB）**

- **自动模式**：由 `caesar_batch_crack.m`（主脚本）配合 `utils/` 中的函数，自动对每行密文进行 26 种位移尝试并**给出程序判断的“最可能解”**（基于高频词匹配 + 字母频率 χ²）。  

- **人工辅助模式**：由 `caesar_bruteforce_simple.m` 提供“纯暴力输出”或更简单的候选列表，**仅列出所有位移后的候选结果，便于人工目测判断**（不作自动选择）。  

[![Feishu Doc](https://img.shields.io/badge/Feishu-文档-blue)](https://qvxdv122cwi.feishu.cn/docx/LX77dITqsoo2sWxKG10cN5uEnWZ?from=from_copylink)  
> **注**：该飞书文档通常为私有链接，点击后可能需要登录飞书或获得访问权限。

---

## 项目结构（可点击打开文件）
> 我把关键文件和 utils/ 下的重要函数列出来，点击即可跳转到 GitHub 文件页面。

- [caesar_batch_crack.m](./caesar_batch_crack.m) — 主脚本：批量处理、自动评分与输出
- [caesar_bruteforce_simple.m](./caesar_bruteforce_simple.m) — 简单的人工核验辅助
- [CommonWords.txt](./CommonWords.txt) — 高频词表
- [list.txt](./list.txt) — 待解密密文
 

<details>
<summary><strong>utils/ （折叠查看）</strong></summary>

- [utils/load_wordlist.m](./utils/load_wordlist.m) — 从 `CommonWords.txt` 读取高频词表并返回 `cell` array（全小写）。  
- [utils/caesar_decrypt_basic.m](./utils/caesar_decrypt_basic.m) — 凯撒解密函数（对单条字符串解密；保留大小写，非字母不变）。  
- [utils/eng_chi_square.m](./utils/eng_chi_square.m) — 计算字母频率 χ²（卡方统计），用于判断候选文本是否接近英文分布。  
- [utils/simple_word_match_score.m](./utils/simple_word_match_score.m) — 高频词匹配计数（用于 `wordScore`）。用于统计候选明文中匹配到的 high-frequency 单词数（小写匹配），自动模式用于打分，人工模式也可直接使用以辅助判断。  
- （可继续在 utils/ 添加其它工具函数）

</details>


---

## 快速开始

1. 克隆仓库：
```bash
git clone https://github.com/ArnoChanPolimi/Network-Security-Ancestral-Encryption.git
cd Network-Security-Ancestral-Encryption
