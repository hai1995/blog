---
layout:post
title:js 递归 实现 1+2+3+4+5+...+100 之间 求和
categories:[javascript]
description:js 递归 实现 任意两数 之间 求和
keywords: javascript,recursion,sum
---

#### 递归在实际开发中，容易遇到，这里记录一个小练习

```
<script>
 function add(num1,num2){
	var num = num1+num2;
        if(num2+1>100){
	 return num;
	}else{
	  return add(num,num2+1)
        }
 }
var sum =add(1,2);
</script>
```
