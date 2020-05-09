### **最常用的SQLAlchemy列类型**

类型名

Python类型

说 明

Integer

int

普通整数,一般是 32 位

SmallInteger

int

取值范围小的整数,一般是 16 位

BigInteger

int 或 long

不限制精度的整数

Float

float

浮点数

Numeric

decimal.Decimal

定点数

String

str

变长字符串

Text

str

变长字符串,对较长或不限长度的字符串做了优化

Unicode

unicode

变长 Unicode 字符串

UnicodeText

unicode

变长 Unicode 字符串,对较长或不限长度的字符串做了优化

Boolean

bool

布尔值

Date

datetime.date

日期

Time

datetime.time

时间

DateTime

datetime.datetime

日期和时间

Interval

datetime.timedelta

时间间隔

Enum

str

一组字符串

PickleType

任何 Python 对象

自动使用 Pickle 序列化

LargeBinary

str

二进制文件

### **最常使用的SQLAlchemy列选项**

选项名

说 明

primary_key

如果设为 True ,这列就是表的主键

unique

如果设为 True ,这列不允许出现重复的值

index

如果设为 True ,为这列创建索引,提升查询效率

nullable

如果设为 True ,这列允许使用空值;如果设为 False ,这列不允许使用空值

default

为这列定义默认值
