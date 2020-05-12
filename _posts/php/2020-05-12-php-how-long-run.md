---
layout: post
title: PHP 实现显示网站运行时间
categories: [PHP]
description: 使用 PHP 实现显示网站运行时间
keywords: PHP, time, share
---

记录一下使用 PHP 来实现 网站的运行时间。    

```
<?php
// 设置时区
date_default_timezone_set('Asia/Shanghai');
/**
 * 转换时间，格式 **年**天**时**分
 */
function getBuildTime(){
    // 在下面按格式输入本站创建的时间
    $site_create_time = strtotime('2020-03-07 22:15:00');
    $time = time() - $site_create_time;
    if(is_numeric($time)){
        $value = array(
            "years" => 0, "days" => 0, "hours" => 0,
            "minutes" => 0, "seconds" => 0,
        );
        if($time >= 31556926){
            $value["years"] = floor($time/31556926);
            $time = ($time%31556926);
        }
        if($time >= 86400){
            $value["days"] = floor($time/86400);
            $time = ($time%86400);
        }
        if($time >= 3600){
            $value["hours"] = floor($time/3600);
            $time = ($time%3600);
        }
        if($time >= 60){
            $value["minutes"] = floor($time/60);
            $time = ($time%60);
        }
        $value["seconds"] = floor($time);
        
        echo $value['years'].'年'.$value['days'].'天'.$value['hours'].'小时'.$value['minutes'].'分';
    }else{
        echo '';
    }
}
echo "网站已运行:" . getBuildTime();
?>
```
