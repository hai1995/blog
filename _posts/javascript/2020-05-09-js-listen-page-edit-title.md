---
layout: post
title: javascript 监听页面停留，并修改title
categories: [Javascript]
description: 使用 javascript 监听页面停留，并修改title的方法
keywords: javascript, listen, edit, title
---
javascript 实现 监听用户当前是否停留在此页面，并且修改页面title。  

源代码:  
```
(function () {
        // 判断用户是否观看当前页面，浏览器兼容
        let state, visibilityChange;
        if (typeof document.hidden !== 'undefined') {
            visibilityChange = 'visibilitychange';
            state = 'visibilityState';
        } else if (typeof document.mozHidden !== 'undefined') {
            visibilityChange = 'mozvisibilitychange';
            state = 'mozVisibilityState';
        } else if (typeof document.msHidden !== 'undefined') {
            visibilityChange = 'msvisibilitychange';
            state = 'msVisibilityState';
        } else if (typeof document.webkitHidden !== 'undefined') {
            visibilityChange = 'webkitvisibilitychange';
            state = 'webkitVisibilityState';
        }
        // 监听用户是否观看当前页面
        const that = this;
        document.addEventListener(visibilityChange, function () {
            if (document[state] === 'hidden') {
                //已离开当前页面
                document.title = "★工具箱★快回来哟~"
            } else if (document[state] === 'visible') {
　　　　//返回了当前页面
                document.title = "工具箱"
            }
        }, false)
    }())
```
