---
layout: post
title: js实现网站运行时长
categories: [Javascript]
description: 使用 JavaScript 实现网站运行时长统计功能，支持年、天、时、分、秒的精确显示
keywords: javascript, web, runtime
---

### 效果预览

在网页中显示类似 `已运行 9年 133天 10:08:45` 的格式。

### 实现原理

1. 使用 UTC 时间记录网站起始日期，避免时区和夏令时问题
2. 计算当前时间与起始时间的差值，分解为年、天、时、分、秒
3. 每秒更新一次显示

### 完整代码

```html
<span id="runtime" aria-live="polite"></span>
<script>
(function(){
  // 起始日期（UTC），修改为你的网站上线日期
  const START_DATE_UTC = new Date(Date.UTC(2016, 11, 1, 0, 0, 0));

  // 补零函数，确保时间单位保持两位数显示
  function pad(n){ return String(n).padStart(2, '0'); }

  // 格式化输出，根据数值动态显示单位
  function formatCompact(years, days, hours, minutes, seconds){
    const timePart = `${pad(hours)}:${pad(minutes)}:${pad(seconds)}`;
    const parts = [];
    if (years > 0) parts.push(`${years}年`);
    if (days > 0) parts.push(`${days}天`);
    parts.push(timePart);
    return parts.join(' ');
  }

  function updateRuntime(){
    const now = new Date();
    const nowTs = now.getTime();
    const startTs = START_DATE_UTC.getTime();
    const el = document.getElementById('runtime');
    if (!el) return;

    // 起始时间在未来，显示倒计时
    if (nowTs < startTs) {
      let diff = startTs - nowTs;
      const SECOND = 1000;
      const MINUTE = 60 * SECOND;
      const HOUR = 60 * MINUTE;
      const DAY = 24 * HOUR;
      const days = Math.floor(diff / DAY); diff -= days * DAY;
      const hours = Math.floor(diff / HOUR); diff -= hours * HOUR;
      const minutes = Math.floor(diff / MINUTE); diff -= minutes * MINUTE;
      const seconds = Math.floor(diff / MINUTE);
      el.textContent = `尚未开始 ${days}天 ${pad(hours)}:${pad(minutes)}:${pad(seconds)}`;
      return;
    }

    // 计算整年数（基于 UTC，正确处理闰年和时区问题）
    let years = new Date(nowTs).getUTCFullYear() - START_DATE_UTC.getUTCFullYear();
    const anniversary = new Date(START_DATE_UTC.getTime());
    anniversary.setUTCFullYear(START_DATE_UTC.getUTCFullYear() + years);
    if (anniversary.getTime() > nowTs) {
      years--;
      anniversary.setUTCFullYear(START_DATE_UTC.getUTCFullYear() + years);
    }

    // 从最近的周年纪念日开始计算剩余天数
    let diff = nowTs - anniversary.getTime();
    const SECOND = 1000;
    const MINUTE = 60 * SECOND;
    const HOUR = 60 * MINUTE;
    const DAY = 24 * HOUR;

    const days = Math.floor(diff / DAY);
    diff -= days * DAY;
    const hours = Math.floor(diff / HOUR);
    diff -= hours * HOUR;
    const minutes = Math.floor(diff / MINUTE);
    diff -= minutes * MINUTE;
    const seconds = Math.floor(diff / SECOND);

    el.textContent = `已运行 ${formatCompact(years, days, hours, minutes, seconds)}`;
  }

  // 初始化并每秒更新
  updateRuntime();
  setInterval(updateRuntime, 1000);
})();
</script>
```

### 使用说明

1. 将上述代码添加到网页的适当位置
2. 修改 `START_DATE_UTC` 为你的网站上线日期
3. 日期格式说明：`new Date(Date.UTC(年, 月-1, 日, 时, 分, 秒))`，月份从 0 开始计数

### 功能特性

- **UTC 时间处理**：避免不同时区显示不一致的问题
- **闰年/夏令时兼容**：基于 UTC 计算，确保日期边界正确
- **动态格式**：年数和天数仅在大于 0 时显示
- **倒计时支持**：起始日期在未来的情况下自动显示倒计时
- **无障碍支持**：使用 `aria-live="polite"` 确保屏幕阅读器可访问
