---
layout: post
title: Kali Linux 配置数字小键盘自动开启（numlockx）
categories: [Linux]
description: 在 Kali Linux 中安装 numlockx 并配置开机自动开启数字小键盘，解决登录后数字键盘无法使用的问题。
keywords: kali linux, numlockx, 数字小键盘, lightdm
---

## 前言

在 Linux 系统中，数字小键盘（NumLock）默认通常是关闭状态，每次开机或登录后都需要手动按 NumLock 键开启，对于习惯使用数字小键盘输入数字的用户来说非常不便。

Kali Linux 系统默认未开启数字小键盘，且未预装 numlockx 工具，需手动安装该工具并设置开机自动启动，具体步骤如下：

## 什么是 numlockx？

numlockx 是一个专门用于控制 NumLock 状态的 Linux 工具，它可以在系统启动时自动开启数字小键盘，也支持通过命令行随时切换 NumLock 状态。

## 1. 安装 numlockx 工具

打开终端，执行以下命令，更新软件源并安装 numlockx：

```bash
sudo apt update && sudo apt install numlockx -y
```

## 2. 验证安装

安装完成后，可以通过以下命令测试 numlockx 是否正常工作：

```bash
# 开启 NumLock
numlockx on

# 关闭 NumLock
numlockx off

# 切换 NumLock 状态
numlockx toggle
```

## 3. 配置桌面环境自动启用 Num Lock

根据你使用的桌面登录管理器，选择对应配置方法，配置完成后重启系统即可生效。

### 方法一：LightDM 登录管理器（Kali 默认）

LightDM 是 Kali Linux 默认的登录管理器，直接编辑其配置文件即可：

1. 首先备份原配置文件：

```bash
sudo cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bak
```

2. 执行命令编辑配置文件：

```bash
sudo nano /etc/lightdm/lightdm.conf
```

3. 找到 `[Seat:*]` 部分，在该部分下添加一行配置（若已有该部分，直接添加；若无，可自行添加 `[Seat:*]` 后再添加）：

```ini
[Seat:*]
greeter-setup-script=/usr/bin/numlockx on
```

4. 保存并退出编辑器：按 `Ctrl+O` 确认保存，按 `Enter` 确认路径，再按 `Ctrl+X` 退出 nano。

### 方法二：GDM3 及其他桌面环境（如 XFCE、GNOME）

若使用 GDM3、XFCE、GNOME 等非默认桌面环境，可通过配置用户会话自动启动脚本实现：

1. 执行命令创建自动启动目录（若已存在则跳过）并编辑启动脚本：

```bash
mkdir -p ~/.config/autostart
nano ~/.config/autostart/numlockx.desktop
```

2. 在脚本中写入以下内容，保存并退出：

```ini
[Desktop Entry]
Type=Application
Name=NumLockX
Exec=/usr/bin/numlockx on
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
```

### 方法三：SDDM 登录管理器

如果使用 SDDM（常见于 KDE Plasma 桌面），编辑 SDDM 配置文件：

```bash
sudo nano /etc/sddm.conf
```

添加以下内容：

```ini
[General]
Numlock=on
```

## 4. 故障排除

如果在配置过程中遇到问题，可以尝试以下解决方案：

### 问题一：配置文件不存在

如果 `/etc/lightdm/lightdm.conf` 文件不存在，可以手动创建：

```bash
sudo nano /etc/lightdm/lightdm.conf
```

写入以下内容：

```ini
[Seat:*]
greeter-setup-script=/usr/bin/numlockx on
```

### 问题二：配置后未生效

1. 确保配置文件格式正确，`greeter-setup-script` 前没有多余的空格
2. 重启 lightdm 服务：`sudo systemctl restart lightdm`
3. 如果仍不生效，尝试完全重启系统

### 问题三：numlockx 命令找不到

检查 numlockx 是否正确安装：

```bash
which numlockx
dpkg -l | grep numlockx
```

如未安装，重新执行安装命令。

## 5. 小贴士：VirtualBox 虚拟机键盘优化

若 Kali 系统安装在 VirtualBox 虚拟机中，可通过以下设置优化键盘行为，避免 Num Lock 状态异常：

1. 打开 VirtualBox，选中你的 Kali 虚拟机，点击顶部「设置」；
2. 进入「系统」→「主板」选项卡，确保「启用绝对鼠标指针」已勾选（可提升鼠标与键盘协同体验）；
3. 切换到「输入」选项卡，取消勾选「捕获键盘」的自动行为，防止虚拟机自动接管 Num Lock 状态，导致数字小键盘异常。

## 总结

通过以上步骤，你可以轻松实现：

- 安装 numlockx 工具
- 根据桌面环境选择合适的配置方式
- 解决登录后数字小键盘无法使用的问题
- 优化 VirtualBox 虚拟机中的键盘体验

如果你的桌面环境不在上述列表中，可以尝试在桌面环境的设置中心搜索 "NumLock" 或 "数字键盘" 相关选项，大多数现代桌面环境都内置了此功能。
