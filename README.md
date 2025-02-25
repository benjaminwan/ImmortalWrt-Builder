# ImmortalWrt-Builder

### 使用方法
1. Fork本项目:右上角fork按钮，Create a new fork
2. 在你的fork项目里，顶部页签，切换到Actions页面
3. 在Actions页面里，左侧栏找到并进入"immortalwrt x86_64 24.10"
4. 点击右侧Run workflow按钮，填写必要的选项，再使用绿色的“Run workflow”启动编译
5. 如果只想临时启动一次编译，可以选择不上传Release，最后在workflow运行完毕后，点击进入，下载Artifacts(Artifacts不是永久的，过几天就会被清理)

### 其它说明
- 文件名含vmdk的固件用于虚拟机
- 文件名含efi的固件需要设备支持uefi启动，不含的固件用legacy方式启动
- ext4固件，分区可读写，不能恢复出厂
- squashfs固件，系统分区只读，有一个专用分区用于存储配置，所以可以支持恢复出厂
