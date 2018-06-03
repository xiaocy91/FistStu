序号	工具	问题	原因及解决方法
1	hibbox	"西安研发：李伟
miami平台产品JSN，用Hibox抓取dump，是空的"	"是否工具问题:N
原因:是user版本的问题，fasboot锁了。由于研发阶段，测试手机都是user版本的，出了问题没法抓日志；"
2	hibbox	"袁旦：
hibbox抓包时，30_baselog概率性不生成"	"是否工具问题:N
原因：没有导完日志,因为dump中bbox.bin没有解析出来，所有日志不完整。"
3	hibbox	"西安：蔡志鹏
hibbox工具打开后，提示找不到设备，但是设备已经连接好了"	"是否工具问题:N
原因：fastboot、adb环境变量没设置好，用hibbox中的fastboot重新设置了环境变量就好了"
4	hibbox	"程利华：
1、hibbox清除log，会把snoop目录清楚掉？
2、用工具导出/data/vendor/log目录，和手动导的不一样？"	"是否工具问题:N
原因：
1、导出日志会全部导出，不仅仅为snoop；
2、清楚日志全部清楚，包括snoop日志；
处理办法：可以提需求，否则不做处理"
5	hibbox	"秦永恒
  ""rom""中(""0x15"",""samsang"")，(0x11，toshiba),(0x45,sandisk)，为什么0x11没有解析出来？对应的hibbox文件为utfs_ddr_.py文件！
"	"是否工具问题:Y
原因：
ufs_addr_.py文件对rom的解析有错误
处理办法:没有提需求，不做修改！"
6	hibbox	"西安研发：李伟
fastboot导出的文件都是0kb,且fastboot oem ddrdump show命令可以使用，只是导出来的文件是空的，且烧写的软件版本是eng版本？？？"	"是否工具问题:N
原因：目前miami平台有问题，终端把fastboot锁了，所以fastboot不能导日志；
处理办法：版本问题，不做处理；"



-------------------------------------------------------------------------------------------



需求类型	需求详情	问题
Hibbox需求	"1、弹框增加数据分析平台链接；
2、ftp_log.log中增加debug字段；"	"1、已经解决：责任人查询错误。
读取excel表格，步长不应该为5，儿应该为4，导致读取到责任人数据不对；
2、待解决-不处理：解析lpm3.bin出问题，它数据本身有问题，跟工具无关；"
Hiibbox需求	CONN版本适配	"待解决：多个bbox解析问题
hibbox无法同时解析多个版本的bbox.bin函数，因为每次解析时是传入的文件夹，应该改成以单个文件传入的方式，一个文件解析完了，再解析另外一个，不能同时解析多个，这样变量共用，会出问题"
dump需求	"1、dump增加删除日志功能；
2、dump增加生成责任人blame.txt，生成上传日志ftp_log.log；"	"待解决：hiBbox中ftp_log中生成责任人desc、责任人工号num有问题
"
		
		
		
Hibbox需求	hibbox2.0项目hibbox工具适配	"已经解决：
1、bbox.bin应该二进制方式打开文件；
2、c语言结构体中使用char存放int类型，节省空间；
3、area_s中fomat为QI4X，必须有4X进行补齐；"
		
		
		
		
