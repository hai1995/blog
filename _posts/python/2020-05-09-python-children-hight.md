---
layout: post
title: Python 孩子身高预测
categories: [python]
description: 使用 Python 来预测孩子的身高。
keywords: python, children, hight
---

Python 孩子身高预测:

源代码:

```
# 创建死循环，直至 用户自行 选择 退出
while True :
    # 分割线
    print('*'*60)
    print('*'*10,'欢迎来到 孩子身高 预测系统','*'*10)
    # 功能选择
    print('\t1、预测查询')
    print('\t2、退出系统')
    menus_select = input('请选择功能( 1、2 ):')

    # 对输入的内容进行判断
    if menus_select == '1' or menus_select == '预测查询' :
        father_height = float(input('请输入父亲身高:'))
        mother_height = float(input('请输入母亲身高:'))
        children_gender = input('请输入孩子性别(女 或 男):')

        if children_gender == '男':
            # 固定的计算公式
            boys_height_min = (45.99) + ((0.78 * (father_height + mother_height)) / 2) - (5.29)
            boys_height_max = (45.99) + ((0.78 * (father_height + mother_height)) / 2) + (5.29)
            boys_height_result = f'孩子的身高预估在: {boys_height_min}CM 与 {boys_height_max}CM 之间'
            print(boys_height_result)
        elif children_gender == '女':
            girls_height_min = (37.85) + ((0.75 * (father_height + mother_height)) / 2) - (5.29)
            girls_height_max = (37.85) + ((0.75 * (father_height + mother_height)) / 2) + (5.29)
            girls_height_result = f'孩子的身高预估在: {girls_height_min}CM 与 {girls_height_max}CM 之间'
            print(girls_height_result)
        else:
            print('请正确输入孩子性别')
    elif menus_select == '2' or menus_select == '退出系统' :
        break
    else :
        print('请选择正确的功能项')
    # 分割线
    print('*' * 60)
    print()
    print()
```
***
运行效果图:
![](/images/posts/python/pythonchildrenhight.png)
