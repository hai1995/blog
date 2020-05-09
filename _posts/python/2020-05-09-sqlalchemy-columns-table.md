---
layout: post
title: Python 最常用的SQLAlchemy列类型
categories: [Python]
description: Python 最常用的SQLAlchemy列类型
keywords: python
---
### **最常用的SQLAlchemy列类型**

<table>
    <thead style="margin: 0px; padding: 0px;">
        <tr style="margin: 0px; padding: 0px;" class="firstRow">
            <th style="margin: 0px; padding: 8px 14px; background-color: rgb(250, 250, 250); border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                类型名
            </th>
            <th style="margin: 0px; padding: 8px 14px; background-color: rgb(250, 250, 250); border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Python类型
            </th>
            <th style="margin: 0px; padding: 8px 14px; background-color: rgb(250, 250, 250); border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                说 明
            </th>
        </tr>
    </thead>
    <tbody style="margin: 0px; padding: 0px;">
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Integer
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                int
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                普通整数,一般是 32 位
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                SmallInteger
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                int
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                取值范围小的整数,一般是 16 位
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                BigInteger
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                int 或 long
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                不限制精度的整数
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Float
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                float
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                浮点数
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Numeric
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                decimal.Decimal
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                定点数
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                String
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                str
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                变长字符串
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Text
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                str
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                变长字符串,对较长或不限长度的字符串做了优化
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Unicode
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                unicode
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                变长 Unicode 字符串
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                UnicodeText
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                unicode
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                变长 Unicode 字符串,对较长或不限长度的字符串做了优化
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Boolean
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                bool
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                布尔值
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Date
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                datetime.date
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                日期
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Time
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                datetime.time
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                时间
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                DateTime
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                datetime.datetime
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                日期和时间
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Interval
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                datetime.timedelta
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                时间间隔
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                Enum
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                str
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                一组字符串
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                PickleType
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                任何 Python 对象
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                自动使用 Pickle 序列化
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                LargeBinary
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                str
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                二进制文件
            </td>
        </tr>
    </tbody>
</table>

### **最常使用的SQLAlchemy列选项**

<table>
    <thead style="margin: 0px; padding: 0px;">
        <tr style="margin: 0px; padding: 0px;" class="firstRow">
            <th style="margin: 0px; padding: 8px 14px; background-color: rgb(250, 250, 250); border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                选项名
            </th>
            <th style="margin: 0px; padding: 8px 14px; background-color: rgb(250, 250, 250); border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                说 明
            </th>
        </tr>
    </thead>
    <tbody style="margin: 0px; padding: 0px;">
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                primary_key
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                如果设为 True ,这列就是表的主键
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                unique
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                如果设为 True ,这列不允许出现重复的值
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                index
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                如果设为 True ,为这列创建索引,提升查询效率
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                nullable
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                如果设为 True ,这列允许使用空值;如果设为 False ,这列不允许使用空值
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                default
            </td>
            <td style="margin: 0px; padding: 8px 14px; border-color: rgb(192, 192, 192); border-collapse: collapse; min-width: 50px;">
                为这列定义默认值
            </td>
        </tr>
    </tbody>
</table>
