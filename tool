标记	时间	问题	实现

##################################
	2018/6/1	
dmesg日志被冲的异常
	

1、在startup_mntn_test_0002.py中找，因为用例调用了searchKey方法，searchKey方法在util.py中，在searchKey中先使用adb shell dmesg，在dmesg中找关键字，找不到就在/data/log/android_logskmsgcat-log中面找，最后返回结果;kmsgcat日志中要找到时间突变的位置，只找从结尾开始到时间突变为止的内容;
2、全局查找，在.Get()判断下面中，有search方法，添加查找kmsgcat日志的方法;
3.然后需要在startup_mntn_test_0002用例启动的时候，需要做删除kmsgcat-log日志的操作，以免之前的日志对现在的测试有影响，在pylib/startup.py中添加删除日志的操作;


		
关闭狗测试等待时间不够
	
修改了startup_mntn_test_0006,在安卓开启和关闭狗时，代码为if show: sleep(5)，因为fastboot重启需要等待5秒，然后用例就pass了;

		
hava平台用例失败分析方法


	
hava问题分析:
1.任务一:设备在线，但是fastboot oem boot起不来;
2.任务二:设备不在线，挂掉了，startup_mntn_0006执行后单板挂掉了。最后林俊杰定位为用例问题，用例中watch_dog中第十三和十四位该改成0;
3.任务三:设备在线，查看dmesg log都是空的。那怎么办，在执行了adb命令后突然就killed了，那有可能是超时了，看看用例开始执行时间，到最后挂掉的时间，一共花了4个小时，因为设置了最长执行时间，所以超时了;
4.任务四:设备在线，但是log目录下是空的，没有找到dmesg log，看用例中，如果找到关键字就通过，如果没有找到关键字就把日志记录到dmesg中，但是这里teardown部分写的log是只生成一个目录，没有往目录里写日志文件，那设计用例是不是有问题？

















标记	时间	需求类型	需求详情	问题

##################################
	2018/3/22	
Hibbox需求
	
1、弹框增加数据分析平台链接；
2、ftp_log.log中增加debug字段；
	
status:closed
1、责任人查询错误。
读取excel表格，步长不应该为5，儿应该为4，导致读取到责任人数据不对；
2、解析lpm3.bin出问题。
它数据本身有问题，跟工具无关；


##################################
	2018/4/3	
Hibbox需求
	
CONN版本适配
	
status:in process
1、多个bbox解析问题
hibbox无法同时解析多个版本的bbox.bin函数，因为每次解析时是传入的文件夹，应该改成以单个文件传入的方式，一个文件解析完了，再解析另外一个，不能同时解析多个，这样变量共用，会出问题


##################################
	2018/4/25	
dump需求
	
1、dump增加删除日志功能；
2、dump增加生成责任人blame.txt，生成上传日志ftp_log.log；
	
status:in process
hiBbox中ftp_log中生成责任人desc、责任人工号num有问题

				
				
				

##################################
	2018/5/25	Hibbox需求	
hibbox2.0项目hibbox工具适配:
1、IRQ中diaginfo;
2、top_head.txt适配excetion_trace;
3、top_head.txt适配area_s;
	
status:closed
1、bbox.bin应该二进制方式打开文件；
2、c语言结构体中使用char存放int类型，节省空间；
3、area_s中fomat为QI4X，必须有4X进行补齐；

				
				
				
				
				
				

##################################
	2018/5/27	
dump需求
	
dump中保持跟hibbox工具一致：
1、导出和删除vendor/log;
2、miami平台670变成710；
3、异常复位责任人修改；
	
closed:
1、导出vendor日志后，目录为/18_vendor_log，多了一个斜杠；
2、linux版本中dump脚本没有更新，打包错误；
3、无法导出vendor日志
3.1、dump.py中ddrdump方法中，ELEM.ANDROID_VERSION版本没有获取，根据版本过滤的args参数没有vendor，所以后面没有导出vendor日志；

in process:
1、无法删除vendor日志；












