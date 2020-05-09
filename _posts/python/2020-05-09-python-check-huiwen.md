---
layout: post
title: Python 递归法检测字符串是否是回文
categories: [Python]
description: 使用 Python 递归法检测字符串是否是回文
keywords: python
---

##### 使用 Python 递归方式 来检测 一个字符串 是否是 回文(例如: ababa)  

源代码上:  

```
# 检测字符串是否是 回文字符串
# 回文概念: 从前往后念 与 从后往前念 都一样。
def hui_wen(str):
    # 基线条件
    # 如果字符串的长度小于 2 位，那么改字符串就为 回文字符串
    if len(str) < 2:
        # 是 回文
        return True

    # 如果字符串的 第一位 与 最后一位 不相等，那么不为 回文字符串
    elif str[0] != str[-1]:
        # 不是 回文
        return False

    # 递归条件
    # 如果字符串长度 大于 2 位，那么 去除字符串首尾，再次进行判断(递归)
    return hui_wen(str[1:-1])

# 测试 运行
# print('ababa 是否为回文:',hui_wen('ababa'))
```
