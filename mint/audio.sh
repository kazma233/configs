# 解决插入前面板耳机孔后，后面板耳机孔无法播放声音

# 针对card 1操作，无需修改
amixer --card=1 sset 'Auto-Mute Mode' Disabled
# 验证设置（应显示Disabled）
amixer --card=1 get 'Auto-Mute Mode'

sudo alsactl store  # 保存到/etc/asound.state，重启自动加载
