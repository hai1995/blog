---
layout: post
title: Python 递归法检测字符串是否是回文
categories: [Python]
description: 使用 Python 递归法检测字符串是否是回文，深入理解递归思想。
keywords: python, 递归, 回文, 算法
---

## 什么是回文？

**回文**是指正读和反读都相同的字符串，例如：

- `ababa`
- `上海自来水来自海上`
- `level`
- `radar`

## 递归解法

### 核心思路

递归的核心思想是将大问题分解为小问题：

1. **基线条件**：字符串长度小于 2，一定是回文
2. **递归条件**：比较首尾字符，如果相等则去掉首尾继续判断

### 代码实现

```python
def is_palindrome(s):
    """
    检测字符串是否是回文（递归版）
    
    Args:
        s: 待检测的字符串
    
    Returns:
        bool: 是回文返回 True，否则返回 False
    """
    # 基线条件：长度小于 2，一定是回文
    if len(s) < 2:
        return True
    
    # 如果首尾字符不相等，不是回文
    if s[0] != s[-1]:
        return False
    
    # 递归条件：去掉首尾，继续检测
    return is_palindrome(s[1:-1])
```

### 运行示例

```python
# 测试
test_strings = ['ababa', 'hello', 'radar', 'python', '上海自来水来自海上']

for s in test_strings:
    result = '是' if is_palindrome(s) else '不是'
    print(f'"{s}" {result}回文')
```

**输出：**

```
"ababa" 是回文
"hello" 不是回文
"radar" 是回文
"python" 不是回文
"上海自来水来自海上" 是回文
```

## 递归过程图解

以 `ababa` 为例：

```
is_palindrome('ababa')
├── s[0]='a', s[-1]='a' → 相等
└── is_palindrome('bab')
    ├── s[0]='b', s[-1]='b' → 相等
    └── is_palindrome('b')
        └── len('b') < 2 → True
```

## 其他解法对比

### 切片法（最简洁）

```python
def is_palindrome_slice(s):
    return s == s[::-1]
```

### 双指针法（非递归）

```python
def is_palindrome_two_pointer(s):
    left, right = 0, len(s) - 1
    while left < right:
        if s[left] != s[right]:
            return False
        left += 1
        right -= 1
    return True
```

## 总结

| 方法 | 时间复杂度 | 空间复杂度 | 特点 |
|------|-----------|-----------|------|
| 递归 | O(n) | O(n) | 代码简洁，需注意栈溢出 |
| 切片 | O(n) | O(n) | 最简洁 |
| 双指针 | O(n) | O(1) | 效率最优 |
