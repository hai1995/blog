---
layout: post
title: JavaScript 合并两个数组的 5 种方法及性能对比
categories: [Javascript]
description: 详细讲解 JavaScript 中合并数组的各种方法，包括 concat、for循环、apply、展开运算符等，并提供性能对比和适用场景分析
keywords: javascript, 数组, concat, spread operator, 数组合并, 性能优化
---

在实际开发中，我们经常需要将两个或多个数组合并成一个。比如：

```javascript
let a = [1, 2, 3];
let b = [4, 5, 6];
```

需求是将两个数组合并成一个新数组 `[1, 2, 3, 4, 5, 6]`。本文将详细介绍 5 种不同的实现方法，并分析各自的优缺点。

## 方法 1：concat() - 最直观的方法

`Array.prototype.concat()` 是 JavaScript 数组对象提供的内置方法，用于连接两个或多个数组，并返回一个新数组。

```javascript
let a = [1, 2, 3];
let b = [4, 5, 6];
let c = a.concat(b); // [1, 2, 3, 4, 5, 6]
console.log(a); // [1, 2, 3] - 原数组不变
console.log(b); // [4, 5, 6] - 原数组不变
```

**特点：**
- 不改变原数组，返回新数组
- 可以一次合并多个数组：`a.concat(b, c, d)`
- 语法简洁直观

**缺点：**
- 每次调用都会创建新数组，内存开销较大
- 对于大数据量或频繁合并的场景，性能可能成为瓶颈

**适用场景：**
- 需要保留原数组不变的情况
- 合并次数少，数据量不大的场景
- 需要链式调用时：`a.concat(b).filter(...).map(...)`

## 方法 2：for 循环 - 最基础的方法

通过遍历其中一个数组，将其元素逐个添加到另一个数组中。

```javascript
let a = [1, 2, 3];
let b = [4, 5, 6];

for (let i = 0; i < b.length; i++) {
  a.push(b[i]);
}
// 现在 a = [1, 2, 3, 4, 5, 6]
```

或者使用 `for...of` 循环（ES6）：
```javascript
for (let item of b) {
  a.push(item);
}
```

**注意：** 原文章中使用的是 `for...in` 循环，但 `for...in` 主要用于遍历对象属性，遍历数组时可能会遍历到非数字键或原型链上的属性。建议使用 `for` 循环、`for...of` 或 `forEach`。

**特点：**
- 不创建新数组，直接修改原数组
- 内存效率高
- 代码相对冗长

**缺点：**
- 代码不够简洁优雅
- 需要手动处理循环逻辑

**优化建议：**
```javascript
// 优化版：选择较短的数组进行遍历，减少循环次数
function mergeArrays(arr1, arr2) {
  let longer = arr1.length >= arr2.length ? arr1 : arr2;
  let shorter = arr1.length >= arr2.length ? arr2 : arr1;
  
  for (let i = 0; i < shorter.length; i++) {
    longer.push(shorter[i]);
  }
  return longer;
}
```

## 方法 3：apply() - 巧用函数参数

利用函数的 `apply()` 方法将数组作为参数传递。

```javascript
let a = [1, 2, 3];
let b = [4, 5, 6];

a.push.apply(a, b);
// 现在 a = [1, 2, 3, 4, 5, 6]
```

**原理分析：**
`a.push.apply(a, b)` 相当于：
```javascript
a.push(4, 5, 6); // 将 b 数组的元素作为单独参数传入
```

**特点：**
- 一行代码解决问题
- 不创建新数组，直接修改原数组
- 比 for 循环更简洁

**缺点：**
- 对于超大数组（如超过 10 万个元素），可能遇到调用栈限制
- 语法相对晦涩，可读性稍差

## 方法 4：展开运算符（Spread Operator）- 现代方案

ES6 引入的展开运算符提供了一种更简洁的语法。

```javascript
let a = [1, 2, 3];
let b = [4, 5, 6];

// 方法 4.1：创建新数组（不改变原数组）
let c = [...a, ...b]; // [1, 2, 3, 4, 5, 6]

// 方法 4.2：修改原数组
a.push(...b);
// 现在 a = [1, 2, 3, 4, 5, 6]
```

**特点：**
- 语法极其简洁
- 可读性强
- 支持一次合并多个数组：`[...a, ...b, ...c]`

**缺点：**
- 展开大数组时有一定性能开销
- ES6+ 语法，需要考虑浏览器兼容性

## 方法 5：reduce() - 函数式编程

使用 `reduce()` 方法实现数组合并。

```javascript
let a = [1, 2, 3];
let b = [4, 5, 6];

let c = b.reduce((arr, item) => {
  arr.push(item);
  return arr;
}, [...a]); // [1, 2, 3, 4, 5, 6]
```

或者更简洁的写法：
```javascript
let c = b.reduce((arr, item) => (arr.push(item), arr), [...a]);
```

**特点：**
- 函数式编程风格
- 适合在函数式编程场景中使用

**缺点：**
- 对于简单合并来说过于复杂
- 性能不如其他方法

## 性能对比

为了帮助选择合适的方法，以下是各种方法的性能特点：

| 方法 | 内存使用 | 执行速度 | 代码简洁度 | 适用场景 |
|------|----------|----------|------------|----------|
| `concat()` | 高（创建新数组） | 中等 | ★★★★★ | 需要保留原数组 |
| `for` 循环 | 低（修改原数组） | 快 | ★★★☆☆ | 性能敏感的大数据量 |
| `apply()` | 低（修改原数组） | 快 | ★★★★☆ | 中等数据量，追求简洁 |
| 展开运算符 | 中等 | 中等 | ★★★★★ | 现代项目，代码简洁优先 |
| `reduce()` | 高（创建新数组） | 慢 | ★★☆☆☆ | 函数式编程场景 |

## 最佳实践建议

1. **根据需求选择方法：**
   - 需要**保留原数组**不变 → 使用 `concat()` 或 `[...a, ...b]`
   - 需要**修改原数组** → 使用 `push(...b)` 或 `push.apply(a, b)`
   - **大数据量**性能优先 → 使用 `for` 循环或 `apply()`
   - **代码简洁**优先 → 使用展开运算符

2. **处理超大数组：**
   ```javascript
   // 分批次合并，避免内存溢出或调用栈限制
   function mergeLargeArrays(arr1, arr2, chunkSize = 10000) {
     for (let i = 0; i < arr2.length; i += chunkSize) {
       const chunk = arr2.slice(i, i + chunkSize);
       arr1.push.apply(arr1, chunk);
     }
     return arr1;
   }
   ```

3. **类型安全合并：**
   ```javascript
   function safeMerge(arr1, arr2) {
     if (!Array.isArray(arr1) || !Array.isArray(arr2)) {
       throw new TypeError('两个参数都必须是数组');
     }
     return arr1.concat(arr2);
   }
   ```

4. **合并并去重：**
   ```javascript
   // ES6+ 方法：使用 Set 去重
   let unique = [...new Set([...a, ...b])];
   
   // ES5 方法
   let combined = a.concat(b);
   let unique = combined.filter((item, index) => 
     combined.indexOf(item) === index
   );
   ```

## 总结

JavaScript 提供了多种数组合并的方法，各有适用场景：
- **`concat()`** 最标准，但内存开销大
- **`for` 循环** 最基础，性能好但代码冗长  
- **`apply()`** 性能好且简洁，但有调用栈限制
- **展开运算符** 最现代简洁，但需要考虑兼容性
- **`reduce()`** 函数式风格，但性能较差

在实际开发中，建议根据具体需求选择合适的方法。对于现代项目，展开运算符 `[...a, ...b]` 通常是首选；对于性能敏感的大数据场景，`apply()` 或 `for` 循环更合适；当需要保留原数组时，`concat()` 是不二之选。

记住，没有绝对最好的方法，只有最适合当前场景的方案。