---
layout: post
title: Python 最常用的 SQLAlchemy 列类型
categories: [Python]
description: 整理了 SQLAlchemy 中最常用的列类型及其 Python 对应类型。
keywords: python, sqlalchemy, database, orm
---

## 前言

SQLAlchemy 是 Python 中最流行的 ORM 框架之一。本文整理了最常用的列类型，方便查阅。

## 常用列类型

| 类型名 | Python 类型 | 说明 |
|--------|-------------|------|
| Integer | int | 普通整数，通常 32 位 |
| SmallInteger | int | 小范围整数，通常 16 位 |
| BigInteger | int/long | 不限制精度的整数 |
| Float | float | 浮点数 |
| Numeric | decimal.Decimal | 定点数，适用于货币 |
| String | str | 变长字符串 |
| Text | str | 长文本，对较长字符串做了优化 |
| Unicode | unicode | Unicode 字符串 |
| UnicodeText | unicode | 长 Unicode 文本 |
| Boolean | bool | 布尔值 |
| Date | datetime.date | 日期 |
| Time | datetime.time | 时间 |
| DateTime | datetime.datetime | 日期和时间 |
| Interval | datetime.timedelta | 时间间隔 |
| Enum | str | 枚举类型 |
| PickleType | Python 对象 | 自动 Pickle 序列化 |
| LargeBinary | bytes | 二进制数据 |

## 常用列选项

| 选项名 | 说明 |
|--------|------|
| primary_key | 设为 True 表示该列为主键 |
| unique | 设为 True 表示该列值唯一 |
| index | 设为 True 为该列创建索引 |
| nullable | 设为 False 表示该列不允许为空 |
| default | 设置默认值 |

## 使用示例

```python
from sqlalchemy import create_engine, Column, Integer, String, Boolean, DateTime
from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime

Base = declarative_base()

class User(Base):
    __tablename__ = 'users'
    
    id = Column(Integer, primary_key=True)           # 主键
    username = Column(String(50), unique=True)       # 用户名，唯一
    email = Column(String(100), nullable=False)      # 邮箱，不允许空
    is_active = Column(Boolean, default=True)        # 是否激活，默认 True
    created_at = Column(DateTime, default=datetime.now)  # 创建时间
    
    def __repr__(self):
        return f'<User {self.username}>'
```

## 数值类型详解

```python
# 整数
Column(Integer)           # 32 位整数
Column(SmallInteger)     # 16 位整数
Column(BigInteger)        # 无限制整数

# 浮点数
Column(Float(precision=10))      # 浮点数，指定精度
Column(Numeric(10, 2))          # 定点数，共 10 位，小数点后 2 位（适合金额）
```

## 字符串类型详解

```python
Column(String(255))              # 变长字符串，最大 255 字符
Column(String)                   # 默认 255 字符
Column(Text)                     # 长文本，无长度限制
Column(Unicode(255))             # Unicode 字符串
Column(UnicodeText)             # 长 Unicode 文本
```

## 日期时间类型详解

```python
from datetime import datetime, date, time, timedelta

Column(Date)                     # 仅日期
Column(Time)                     # 仅时间
Column(DateTime)                 # 日期和时间
Column(Interval)                 # 时间间隔
```

## 注意事项

1. **String vs Text**：短字符串用 `String`，长文本用 `Text`
2. **Numeric vs Float**：涉及金钱计算时用 `Numeric`，避免浮点精度问题
3. **nullable**：主键列默认 `nullable=False`
4. **index**：频繁查询的列建议设置 `index=True` 提升性能
