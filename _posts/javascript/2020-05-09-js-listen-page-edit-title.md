---
layout: post
title: JavaScript 监听页面可见性变化并动态修改 Title
categories: [Javascript]
description: 使用 Page Visibility API 监听用户切换标签页，动态修改页面标题，实现"有人叫你"效果
keywords: javascript, visibility, page, title, document.visibilityState
---

### 效果预览

当用户切换到其他标签页时，页面标题变为 `★工具箱★快回来哟~`；返回时恢复为 `工具箱`。

### 实现原理

利用 [Page Visibility API](https://developer.mozilla.org/zh-CN/docs/Web/API/Page_Visibility_API)，监听 `visibilitychange` 事件，根据 `document.visibilityState` 判断页面当前是否可见。

### 完整代码

```javascript
(function () {
  // 页面可见性变化时的回调函数
  const originalTitle = document.title; // 保存原始标题

  function handleVisibilityChange() {
    switch (document.visibilityState) {
      case 'visible':
        // 用户返回当前页面
        document.title = originalTitle;
        break;
      case 'hidden':
        // 用户离开当前页面（切换标签、最小化、锁屏等）
        document.title = '★工具箱★快回来哟~';
        break;
    }
  }

  // 监听可见性变化事件
  document.addEventListener('visibilitychange', handleVisibilityChange);
})();
```

### 旧版浏览器兼容写法

```javascript
(function () {
  // 检测各浏览器兼容的可见性属性
  let state = 'visibilityState';
  let visibilityChange = 'visibilitychange';

  if (typeof document.hidden === 'undefined') {
    if (typeof document.mozHidden !== 'undefined') {
      state = 'mozVisibilityState';
      visibilityChange = 'mozvisibilitychange';
    } else if (typeof document.msHidden !== 'undefined') {
      state = 'msVisibilityState';
      visibilityChange = 'msvisibilitychange';
    } else if (typeof document.webkitHidden !== 'undefined') {
      state = 'webkitVisibilityState';
      visibilityChange = 'webkitvisibilitychange';
    }
  }

  const originalTitle = document.title;

  document.addEventListener(visibilityChange, function () {
    if (document[state] === 'hidden') {
      document.title = '★工具箱★快回来哟~';
    } else if (document[state] === 'visible') {
      document.title = originalTitle;
    }
  }, false);
})();
```

### 使用说明

1. 将代码放入 `<script>` 标签中，可放在页面底部或通过外部文件引入
2. 修改 `originalTitle` 和离开时的提示文案
3. 无需其他依赖，直接使用原生 JavaScript API

### API 详解

| 属性/值 | 说明 |
|---------|------|
| `document.visibilityState` | 返回 `visible`（可见）或 `hidden`（隐藏） |
| `document.hidden` | 返回布尔值，表示页面是否隐藏 |
| `visibilitychange` | 可见性改变时触发的事件 |

### 适用场景

- 即时通讯工具（如微信网页版）提示新消息
- 邮件客户端提醒未读邮件
- 监控用户是否在浏览页面
- 实现"有人在叫你"的有趣效果
