---
layout: post
title: js 多维数组转为一维数组
categories: [javascript]
description: js 数组转换
keywords: javascript, array, reduce
---

#### 记录一下 多维数组 转为 一维数组 的几种方式

### 目标多维数组
```
	var manyArray = [1, [2, [3, [4, [5]]]]]
```

## 1、 使用 reduce 转换 

```
<script>

 function arrayExchange(arr){
	return arr.reduce((pre, cur) => pre.concat( Array.isArray(cur) ? arrayExchange(cur): cur ) , [])
 }

console.log(arrayExchange(manyArray))

</script>
```

## 2、 使用 循环 转换

```
let flatten = (nestedList) => { 
	let result = []; 
	let fn = function (target, ary) { 
		for (let i = 0; i < ary.length; i++) { 
			let item = ary[i]; 
			if (Array.isArray(ary[i])) { 
				fn(target, item); 
			} else { 
				target.push(item); 
			} 
		} 
	}
	fn(result, nestedList) 
	return result;
}
```