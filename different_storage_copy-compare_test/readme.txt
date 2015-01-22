step:
1.把测试用的文件放到CPFILE文件夹内
2.将整个different_storage_copy-compare_test文件夹拷贝到/data目录下
	如果通过adb push 命令拷贝需要先用adb root获取root权限
	adb root
	adb push different_storage_copy-compare_test /data/different_storage_copy-compare_test
3.确认要测试的存储连接正确并可以使用
4.运行脚本(两种方式)
	a.自动检测模式
		自动检测连接存储，进行相应测试
		sh different_storage_copy-compare_test.sh
	b.参数选择模式
		需要在脚本后加入参数来进行相应测试
		sh different_storage_copy-compare_test.sh 0~7
		0 print help massage
		1 Emmc Test
		2 SD Card Test
		3 USB Flash Disk Test
		4 Emmc and SD Card Test
		5 Emmc and USB Flash Disk Test
		6 SD Card and USB Flash Disk Test
		7 Emmc,SD Card and USB Flash Disk Test
5.log文件保存在脚本同文件夹下different_storage_copy-compare_test.log

note:
1.每项测试完成之后会打印以下信息让你去确定测试中复制的文件可用，你可以通过ES文件管理器等进行播放，看下是否可用
	***Please make sure that video at /sdcard/CPFILE can play normally***
2.测试文件夹一定要直接保存在/data目录下，否则无法正确运行