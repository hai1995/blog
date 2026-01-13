---
layout: post
title: js实现网站运行时长
categories: [Javascript]
description: 使用 javascript 实现网站运行时长
keywords: javascript, web, runtime
---

###  js实现网站运行时长

```
<span id="runtime" aria-live="polite"></span>
<script>
(function(){
  // 起始日期（UTC）：2016-12-01 00:00:00Z
  const START_DATE_UTC = new Date(Date.UTC(2016, 11, 1, 0, 0, 0)); // 月份从 0 开始，11 = 12 月

  function pad(n){ return String(n).padStart(2, '0'); }

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

    if (nowTs < startTs) {
      // 起始时间在未来，显示倒计时（紧凑格式）
      let diff = startTs - nowTs;
      const SECOND = 1000;
      const MINUTE = 60 * SECOND;
      const HOUR = 60 * MINUTE;
      const DAY = 24 * HOUR;
      const days = Math.floor(diff / DAY); diff -= days * DAY;
      const hours = Math.floor(diff / HOUR); diff -= hours * HOUR;
      const minutes = Math.floor(diff / MINUTE); diff -= minutes * MINUTE;
      const seconds = Math.floor(diff / SECOND);
      el.textContent = `尚未开始 ${days}天 ${pad(hours)}:${pad(minutes)}:${pad(seconds)}`;
      return;
    }

    // 计算整年数（基于 UTC，处理闰年/2月29日等情况）
    let years = new Date(nowTs).getUTCFullYear() - START_DATE_UTC.getUTCFullYear();
    const anniversary = new Date(START_DATE_UTC.getTime());
    anniversary.setUTCFullYear(START_DATE_UTC.getUTCFullYear() + years);
    if (anniversary.getTime() > nowTs) {
      years--;
      anniversary.setUTCFullYear(START_DATE_UTC.getUTCFullYear() + years);
    }

    // 从最近的周年开始计算剩余时间
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
