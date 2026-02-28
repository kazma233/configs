# 临时挂载
```
lsblk -f

# 不用指定 -t ntfs-3g，直接挂载
sudo mount /dev/sda1 /mnt/data

# 或显式指定内核驱动
sudo mount -t ntfs /dev/sda1 /mnt/data
```

# 长期挂载
为什么设 1000？
1000 是 Linux 第一个普通用户的默认 UID
单用户系统通常就是 1000
多用户系统可能是 1001, 1002...
可以使用`id`看你当前uid
```
sudo vim /etc/fstab

UUID=7CCAABDC69CE333F  /mnt/data  ntfs  defaults,uid=1000,gid=1000  0  0

UUID=xxx  /mnt/data  ntfs  defaults,uid=1000  0  0
│         │          │     │                  │  │
│         │          │     │                  │  └── 第6列：fsck检查顺序；0-Linux 的 fsck 不懂 NTFS，检查交给 Windows 或 ntfsfix
│         │          │     │                  └───── 第5列：dump备份标记；0-不dump备份，用 rsync/tar 等工具备份
│         │          │     └──────────────────────── 挂载选项
│         │          └────────────────────────────── 文件系统类型
│         └───────────────────────────────────────── 挂载点
└─────────────────────────────────────────────────── 设备标识

systemctl daemon-reload
```
