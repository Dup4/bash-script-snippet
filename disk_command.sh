#! /bin/bash

# 查看磁盘情况
sudo fdisk -l

# 查看逻辑卷信息
lvdisplay

# 操作某个 disk，比如 /dev/sda
fdisk /dev/sda

# mount a disk
mkdir /data00
mount /dev/sda /data00

# 开机自动挂载
vim /etc/fstab
/dev/sda /data00 ext4 defaults 0 0
mount -a # 可以立即挂在 `/etc/fstab` 里的所有条目

# 格式化
mkfs -t ext4 /dev/sda

# 查看磁盘分区的 UUID
sudo blkid
