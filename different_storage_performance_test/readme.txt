step:
1.�Ѳ����õ��ļ��ŵ�CPFILE�ļ�����
2.������different_storage_performance_test�ļ��п�����/dataĿ¼��
	���ͨ��adb push �������Ҫ����adb root��ȡrootȨ��
	adb root
	adb push different_storage_performance_test /data/different_storage_performance_test
3.ȷ��Ҫ���ԵĴ洢������ȷ������ʹ��
4.���нű�(���ַ�ʽ)
	a.�Զ����ģʽ
		�Զ�������Ӵ洢��������Ӧ����
		sh different_storage_performance_test.sh
	b.����ѡ��ģʽ
		��Ҫ�ڽű�����������������Ӧ����
		sh different_storage_performance_test.sh 0~7
		0 print help massage
		1 Emmc Test
		2 SD Card Test
		3 USB Flash Disk Test
		4 Emmc and SD Card Test
		5 Emmc and USB Flash Disk Test
		6 SD Card and USB Flash Disk Test
		7 Emmc,SD Card and USB Flash Disk Test
5.log�ļ������ڽű�ͬ�ļ�����different_storage_performance_test.log

note:
1.ÿ�ο��������ӡ��ο������ٶ�,��byte/s��KB/s��MB/s��������,ÿ��������֮����ӡһ��ƽ���ٶ�
2.�����ļ���һ��Ҫֱ�ӱ�����/dataĿ¼�£������޷���ȷ����