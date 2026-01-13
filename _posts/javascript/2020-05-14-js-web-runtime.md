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
  // 起始日期：使用 UTC ��间创建（例如 2016-12-01T00:00:00Z）
  // 这样不同时区的用户都会得到相同的“已运行”时长
  const START_DATE_UTC = new Date(Date.UTC(2016, 11, 1, 0, 0, 0)); // 月份从 0 开始，11 = 12 月

  function updateRuntime(){
    const now = new Date(); // current instant
    const nowTs = now.getTime();
    const startTs = START_DATE_UTC.getTime();

    const el = document.getElementById('runtime');
    if (!el) return;

    if (nowTs < startTs) {
      // 如果起始时间在未来，显示倒计时样式提示
      const remainingMs = startTs - nowTs;
      const SECOND = 1000;
      const MINUTE = 60 * SECOND;
      const HOUR = 60 * MINUTE;
      const DAY = 24 * HOUR;

      let diff = remainingMs;
      const days = Math.floor(diff / DAY); diff -= days * DAY;
      const hours = Math.floor(diff / HOUR); diff -= hours * HOUR;
      const minutes = Math.floor(diff / MINUTE); diff -= minutes * MINUTE;
      const seconds = Math.floor(diff / SECOND);

      el.textContent = `尚未开始（距离开始：${days} 天 ${hours} 小时 ${minutes} 分钟 ${seconds} 秒）`;
      return;
    }

    // 计算整年数（基于 UTC，处理闰年/2月29日等情况）
    let years = new Date(nowTs).getUTCFullYear() - START_DATE_UTC.getUTCFullYear();

    // 生成“本周年”UTC时间点（把起始日期的 UTC 年份改为 startYear + years）
    const anniversary = new Date(START_DATE_UTC.getTime());
    anniversary.setUTCFullYear(START_DATE_UTC.getUTCFullYear() + years);

    // 如果本周年还未到达（例如今天还没到起始日的月份/日/时间），就退回到上一周年
    if (anniversary.getTime() > nowTs) {
      years--;
      anniversary.setUTCFullYear(START_DATE_UTC.getUTCFullYear() + years);
    }

    // 从最近的周年开始计算剩余毫秒数（已扣除整年）
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

    el.textContent = `已运行 ${years} 年 ${days} 天 ${hours} 小时 ${minutes} 分钟 ${seconds} 秒`;
  }

  // 先更新一次，然后每秒更新
  updateRuntime();
  setInterval(updateRuntime, 1000);
})();
</script>
```
