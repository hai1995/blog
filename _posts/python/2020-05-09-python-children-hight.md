---
layout: post
title: Python 孩子身高预测
categories: [Python]
description: 使用 Python 来预测孩子的身高，基于遗传学公式。
keywords: python, children, height, 身高预测
---

## 前言

孩子的身高一直是我比较关注的问题，相信很多父母也和我一样，想知道孩子未来能长多高。

实际上，身高约有 70% 是由遗传基因决定的，后天因素影响约占 30%。科学家根据大量数据统计，得出了以下预测公式：

- **男孩身高** = 45.99 + 0.78 × (父亲身高 + 母亲身高) / 2 ± 5.29
- **女孩身高** = 37.85 + 0.75 × (父亲身高 + 母亲身高) / 2 ± 5.29

今天，我们就用 Python 来实现这个预测系统。

## 源代码

```python
def calculate_height(father_height, mother_height, gender):
    """
    根据父母身高预测孩子身高
    
    Args:
        father_height: 父亲身高 (cm)
        mother_height: 母亲身高 (cm)
        gender: 孩子性别 ('男' 或 '女')
    
    Returns:
        预测身高范围 (最小值, 最大值)
    """
    mid_parent_height = (father_height + mother_height) / 2
    
    if gender == '男':
        # 男孩身高预测公式
        min_height = 45.99 + 0.78 * mid_parent_height - 5.29
        max_height = 45.99 + 0.78 * mid_parent_height + 5.29
    elif gender == '女':
        # 女孩身高预测公式
        min_height = 37.85 + 0.75 * mid_parent_height - 5.29
        max_height = 37.85 + 0.75 * mid_parent_height + 5.29
    else:
        return None, None
    
    return min_height, max_height


def main():
    while True:
        print('=' * 60)
        print('  欢迎来到「孩子身高预测系统」')
        print('=' * 60)
        print('  1、预测查询')
        print('  2、退出系统')
        print('-' * 60)
        
        choice = input('请选择功能 (1/2): ').strip()
        
        if choice == '1':
            try:
                father = float(input('请输入父亲身高 (cm): '))
                mother = float(input('请输入母亲身高 (cm): '))
                gender = input('请输入孩子性别 (男/女): ').strip()
                
                min_h, max_h = calculate_height(father, mother, gender)
                
                if min_h is None:
                    print('⚠️  请正确输入孩子性别！')
                else:
                    print(f'\n📊 预测结果:')
                    print(f'   孩子的身高预估在 {min_h:.1f}cm ~ {max_h:.1f}cm 之间')
                    print(f'   仅供参考，实际身高会受到营养、运动、睡眠等多种因素影响。\n')
                    
            except ValueError:
                print('⚠️  请输入有效的数字！\n')
                
        elif choice == '2':
            print('\n感谢使用，再见！👋')
            break
        else:
            print('⚠️  请选择正确的功能项 (1 或 2)！\n')


if __name__ == '__main__':
    main()
```

## 运行效果

![运行效果图]({{ site.baseurl }}/images/posts/python/pythonchildrenhight.png)

## 总结

本文实现了一个简单的身高预测程序，主要涉及以下知识点：

- **循环结构**：`while True` 配合 `break` 实现菜单循环
- **条件判断**：`if-elif-else` 处理多种情况
- **函数封装**：将计算逻辑封装到 `calculate_height` 函数中
- **异常处理**：`try-except` 处理用户输入错误
- **格式化输出**：使用 f-string 格式化输出结果

> ⚠️ **注意**：身高预测公式仅供参考。实际身高会受到遗传、营养、运动、睡眠、疾病等多种因素的综合影响。
