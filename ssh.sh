#!/bin/bash

# 安装 ufw
apt-get update
apt-get install ufw -y

# 关闭防火墙
ufw disable

# 修改 ssh 配置
sed -i 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# 重启 ssh 服务
service sshd restart
/etc/init.d/ssh restart

echo "脚本执行完成！"
