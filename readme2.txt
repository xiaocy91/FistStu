序号	工具	问题出处	解决方法	是否需要处理	时间
1	hibbox	"西安研发：李伟
miami平台产品JSN，用Hibox抓取dump，是空的"	"US:是user版本的问题，fasboot锁了。由于研发阶段
They:测试手机都是user版本的，出了问题没法抓日志

处理方法：不是Hibbox工具问题，不做处理"	N	2018/4/22

2	hibbox	"袁旦：
hibbox抓包时，30_baselog概率性不生成"	"没有导完日志,因为dump中bbox.bin没有解析出来，所有日志不完整。
处理办法：不处理"	N	2018/4/22

3	hibbox	"西安：蔡志鹏
hibbox工具打开后，提示找不到设备，但是设备已经连接好了"	"处理办法：
fastboot、adb环境变量没设置好，用hibbox中的fastboot重新设置了环境变量就好了"	Y	2018/4/25


4	hibbox	"程利华：
1、hibbox清除log，会把snoop目录清楚掉？
2、用工具导出/data/vendor/log目录，和手动导的不一样？"	"1、导出日志会全部导出，不仅仅为snoop；
2、清楚日志全部清楚，包括snoop日志；
处理办法：可以提需求，否则不做处理"	Y	2018/5/9


	hibbox	"秦永恒
  ""rom""中(""0x15"",""samsang"")，(0x11，toshiba),(0x45,sandisk)，为什么0x11没有解析出来？对应的hibbox文件为utfs_ddr_.py文件！
"	"ufs_addr_.py文件对rom的解析有错误
处理办法:没有提需求，不做修改！"	Y	2018/5/14
