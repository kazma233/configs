新增`/etc/systemd/system/rclone-onedrive.service`文件，配置如下
```
[Unit]
Description=Rclone Mount OneDrive to NTFS Disk
After=network.target network-online.target local-fs.target
Wants=network-online.target
RequiresMountsFor=/mnt/STORE

[Service]
Type=notify
ExecStart=/usr/bin/rclone mount remote:/ /mnt/STORE/OneDrive \
  --allow-other \
  --allow-non-empty \
  --vfs-cache-mode full \
  --buffer-size 64M \
  --transfers 8 \
  --vfs-cache-max-size 20G \
  --vfs-cache-max-age 24h \
  --vfs-read-ahead 128M \
  --cache-dir /mnt/STORE/rclone-cache
ExecStop=/usr/bin/fusermount -u /mnt/STORE/OneDrive
Restart=on-failure
RestartSec=5
User=%i
Group=%i

[Install]
WantedBy=multi-user.target
```

```
--allow-other
允许非挂载用户访问挂载目录（比如你用普通用户挂载，其他用户 / 程序也能读 /mnt/STORE/OneDrive）。
官方说明：默认仅挂载用户可访问，需配合 fuse 的 allow_other 权限（Linux 下需确保 /etc/fuse.conf 中 user_allow_other 已开启）。

--allow-non-empty
允许挂载到非空目录（比如 /mnt/STORE/OneDrive 里已有文件，仍能正常挂载）。
官方说明：默认 rclone 禁止挂载到非空目录，防止覆盖数据；仅在确认目录内文件无冲突时使用。

--daemon
作用：让 rclone mount 后台运行（守护进程模式），关闭终端后挂载不会中断。

--vfs-read-ahead
预读取128M数据，视频拖拽更流畅

--cache-dir /mnt/STORE/rclone-cache 
把缓存放到NTFS硬盘，不占系统盘
```

自己测试下
```
rclone mount remote:/ /mnt/STORE/OneDrive \
  --allow-other \
  --allow-non-empty \
  --vfs-cache-mode full \
  --buffer-size 64M \
  --transfers 8 \
  --vfs-cache-max-size 20G \
  --vfs-cache-max-age 24h \
  --vfs-read-ahead 128M \
  --cache-dir /mnt/STORE/rclone-cache
  --daemon
```

``` sh
# 刷新系统服务配置
sudo systemctl daemon-reload

# 设置开机自启
sudo systemctl enable rclone-onedrive@$USER

# 立即启动服务（不用重启系统）
sudo systemctl start rclone-onedrive@$USER

# 查看服务状态（确认无报错，显示 active (running) 就是成功）
sudo systemctl status rclone-onedrive@$USER
```

总结
- 通过 fstab 配置，你的 NTFS 硬盘 /dev/sda1 会在开机时自动挂载到 /mnt/STORE，且权限为当前用户可读写；
- 通过 systemd 服务，OneDrive 会在硬盘挂载完成、网络就绪后，自动挂载到 /mnt/STORE/OneDrive，缓存优化适配视频 / 相册播放；
- 核心保障：RequiresMountsFor=/mnt/STORE 确保只有硬盘挂载成功后，OneDrive 才会挂载，避免挂载失败。
