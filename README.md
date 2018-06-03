



提交代码步骤

1.首先进入到hione/vender/tools/hibbox/mntn目录；

2.然后repo sync --no--tags同步最新代码；

3!代码同步后用compare和最新的代码对比；

4.repo start 分支名称，建立一个新的分支；
(repo start branchname，等价于git branch branchname加上git checkout branchname，等价于git -b branch branchname。)

5.将修改过的代码合并到最新拉下来的代码；

6使用git status .来查看修改的文件有哪些；

7，然后git add . 添加修改，再git commit .提交修改；

8.repo upload来提交当前的代码；
(repo upload等价于git push操作，只是git是直接提交到远程仓库，然后repo是提交到代码审核的服务器上，这个涉及到gerrit框架设计。)

8.提交时需要填写单号，描述就是update hibbox version to V271，如果是开发就填feafure，如果是修改缺陷问题提交代码就填debug，让后保存后就自动提交，如果不保存就不提交；

9如果重新修改后，再次提交，单号不变，但是提交时使用git commit -amend。git commit -amend会在最后一次提交的基础上去提交，不会重新提交新的；

-----------------------------------------------------------------------------------------------------------------------------------

版本验证步骤

1.执行usb2.0，修改case中xloader中路径为emily或者alps，运行后输入image的路径；
问题:usb2.0是基于HIDS工具的，所以要先安装该工具！

2.执行usb3.0前，要把image中没用的xml删除，然后执行，没有失败就成功了；

3.插入sdcard后，执行protest_main以后，没有报错就成功了；

4.执行小绿版操作，连接小绿版播号，看wiki，然后执行uart命令，打开设备管理器，看是否有uart93口，打开sscome串口工具，输入回车，工具会输出打印；

5.再cmd中执行命令后，然后在串口中查看日志，日志打印的东西会多点；

6.执行gevent -l后，拔掉usb才可以休眠，然后再打开屏膜，手动触模，cmd命令窗口可以打印很多东西；

7.枚举升级，使用小绿版，拨号到0011和1000，然后看设备管理中是否出现com1.0口，出现该口以后重启手机，然后IDT烧写升级；

6.验证fastboot的时间，这个不需要连接串口，手机只需要连接usb就可以，这时设备管理器里有PCU_UI端口，打开串口工具sscome，输入at^fblock=1就是锁住了，等于0就是不锁；

8.遇到的问题

8.1ALPS手机，用枚举类型强制升级，升级到fastboot模式就出错了。解决方法:执行IDT-tools-clear usb map data，然后再烧写，速度很慢，但是可以烧写成功；

8.2执行at^fblock以后，导致/data目录没有写权限了。解决办法:锁了旁路以后不要忘记解锁；另外，有的user版本确实没有写权限，此时需要执行adb root和adb amount命令就有root权限了，然后执行push操作。

8.3使用小绿板执行uart命令后，导致无法识别SD卡。解决办法:需要将执行的命令再反着执行一遍。



----------------------------------------------------------------------------------------------------------------------------


hava用例运行	"hava维测步骤:
1.当一个用例出错以后，要看这个用例在本地运行是否通过，本地运行需要配置环境，包括在android.xml中配置SN号，设为当前手机的SN号;然后，在jython中新建一个运行配置名为mntn，配置运行入口为kempt/start.py文件，运行参数为work_block和selected_file_path。配置好以后，选中case中的某一个脚本，运行是选mntn运行。
2.先看hava平台的运行脚本是基于哪个平台的，本次平台是芝加哥平台，所以需要曼哈顿手机，运行后，如果没有错误，说明可能是环境问题。
3、看hava上的日志，日志怎么看，需要先看代码，代码中如果执行false就记录下日志，如果执行pass就不会记录日志。
4.找到hava平台记录日志的地方，为Log/dmsg.log，这个log是在运行该脚本的。
点进去这个任务，对应了一台电脑，电脑上对应了两个单板，然后找到任务对应的单板。
5、putty连接到执行任务的电脑，找到mntn目录，里面又有两个日子目录，找到对应单板的日志目录，根据hava上log找到dmsg.log文件。
6.使用scp命令，将日志复制到自己的编译云上去。
6、在自己的云上，根据报的错误来看dmsg日志，报错""找不到关键字pref""，搜索pref确实没有找到，找到负责perf解析的负责人张琪，最后定位为log被冲掉了。
7.然后hava上定位问题，状态为closed，描述为dmsg日志被冲，填上对应的单号(以前遇到同样问题，所以已经有单号了)。"
hava代码提交	"hava代码合并步骤新:
1.repo sync 更新代码
2.然后进入到mntn目录，看是否有分支，使用命令git branch，否则就要新建分支;
3.git add文件，git commit文件，如果错了可以使用reset撤销提交，提交的的单号固定，描述就写你为什么提交，如果是新代码就是feature，如果是修复bug就是debugfix;
4.然后repo上传你提交的代码;"
hava用例上线	"hava用例上线的步骤:
1.配置jekins时，一个任务一般跑所有的用例，但是配置四个shell时，是为了可以同时跑这么多个，而不是一个一个跑;
2.有一个设备是单独给我用的，所以，在该设备上配置了一个任务跑所有要验证的用例，一个任务每天跑，所以有很多任务;
3.我需要统计所有任务，即jekins每天下发同样的任务，所以多了很多相同的任务！
4.把每个任务的运行结果导出来，把每个用例和运行结果复制到同一张表里面;每天都通过的用例上线;
"
hava用例上线统计	"hava用例上线统计:
1.导出全部用例，统计出全部成功的，筛选出全部失败的;统计是插入函数count(区域，值)，区域为整行，值为TRUE或者FAIL，计算出单行的;然后，格式刷其他行的;
2.用例编号mntn_startup_001.py，用例描述是启动日志，用例结果是fail，成功次数14，失败次数为1，失败原因是没找到关键字，进展是2018/5/31暂无进展，状态是pass(上线)或者cancel(取消);
3.选中一行或者某一列，按ctrl+alt+L可以筛选数据，筛选出FAIL的正行标红，筛选出PASS的全部标绿;
4.有多的用例，需要删除的，这里irq的用例不要了，还有一种类型的用例也不早要了。ctrl+alt+L选中后，筛选中关键字为irq的，全部删除;
5.然后添加上统计，特性，该特性总共多少，通过多少，失败多少;最后总结说明重复用例删除了;
6.日志丢失了，无法分析，解决办法:找到result bundle，里面失败用例在前，成功用例在后，一般日志保存在跑的第一个用例里面，所以要么是第一个失败的用例里面，要么是第一个成功的用例里面;
"
hava问题分析	"hava问题分析:
1.任务一:设备在线，但是fastboot oem boot起不来;
2.任务二:设备不在线，挂掉了，startup_mntn_0006执行后单板挂掉了。最后林俊杰定位为用例问题，用例中watch_dog中第十三和十四位该改成0;
3.任务三:设备在线，查看dmesg log都是空的。那怎么办，在执行了adb命令后突然就killed了，那有可能是超时了，看看用例开始执行时间，到最后挂掉的时间，一共花了4个小时，因为设置了最长执行时间，所以超时了;
4.任务四:设备在线，但是log目录下是空的，没有找到dmesg log，看用例中，如果找到关键字就通过，如果没有找到关键字就把日志记录到dmesg中，但是这里teardown部分写的log是只生成一个目录，没有往目录里写日志文件，那设计用例是不是有问题？

"
hava用例修改	"hava用例修改:
有一个dmesg日志被冲的问题，找不到reset复位关键字的时候，就去其他地方找？？所以应该怎么修改？？"


-------------------------------------------------------------------------
bbox.bin文件结构讲解	"bbox.bin文件结构:
1、bbox.bin留给AP的，一共8M，每行是512字节，第一行就是给top_head.txt文件的，其中top_head.txt中，因为是64位的手机，每一个内存就是两个字节;
2.bbox.bin文件整体是，第一行信息，预留，ap，剩下是给AC,NOC这些数据，这一共8M；之后就是给其它数据，LMP、vedio音频、monut摄像;
3.top_head.txt是AP第一行数据解析出来的，version一个字节，music一个字节！等等其它;


"
bbox2.0项目hibbox工具适配-代码修改	"bboxbin适配代码修改
1.这次版本还是0x202,只是bboxapversion变成了1000b;之前的版本也是0x202,但是ap版本是1000a;
2.这个current version是怎么用的？
3.head_top.py中修改了ap中IRQ中结构，IRQ中有task_info,cpu_info这些信息，然后本次增加了一个diag_info，diag_info之前是percup的，就是说每个cpu该信息都不一样，都会被记录下来;diag_info不是percup的，信息都是一样、公用的;
4.IRQ中所有的task_info、diag_info都加了r_idx和count字段;
5.代码修改
5.1、在ap/hook_head.py中定义，当前head_ringbuffer_format1_0_B=""IIIIII72s""，还有head_ringbuffer_format1_0_2和
head_ringbuffer_format1_0_4是之前的;
5.2. 在ap/hook_head.py中定义各个字符串，head_ringbuffer=enum(task,cup,diaginfo,max);
5.3、在ap/hook_ringbuffer.py中，定义head_ringbuffer_struct=(""iis"",""ssii"",""256s"");
5.4、在ap/hook_hea.py文件，hook_ringbuffer_obj={
task_info:task_obj;
cpu_info:cpu_obj;
diag_info:diag_obj;
}
5.5在ap/hook_head.py文件中，有两个对象，一个diag_obj，一个新的diag_with_idx_count的对象，并将值赋予给hook_ringbuffer_obj;
5.6在comm/version.py中，version_manage方法中，根据v_hex版本值来判断，是使用新bufferring的对象，还是旧的ringbuffer对象？？？？？？
5.7在arg_parse.py文件中，直接调用v.hook_format()方法，返回所需要的v对象？？？？？
"
bbox2.0项目hibbox工具适配-bbox二进制文件查看	"bbox.bin文件查看方法:
1.根据bbox.bin第一行文件解析出来的top_head.txt文件，找到conn位置，diag位置，文件第一行空间为0x200，然后后面预留0x100,所以ap开始的位置是0x300;
2.比如，现在要找conn在文件中的位置，可以看到conn位置为0x7000b20，所以看conn的位置为0x0000b20开始;
3.看diaginfo时，可以直接在文件中搜索关键词diaginfo，然后diaginfo第一行占用了两行办，然后diaginfo后面的所有数据为256s,因为bbox.bin每行为16个字节，所以diaginfo的数据占16行;"
其他异常修复	"bbox2.0项目hibbox版本其他异常修复:
1.适配IRQ中diaginfo，且IRQ中个模块数据新增i_rdx和count字段；
2.新增boardid获取平台，解决miami从670修改到710后产生的检测不到平台的问题；另外，把所有涉及到670的都改成710;
3.解决，识别不到平台，不弹框显示的问题
3.1如何查看版本号
看版本号，比如当前版本为kirin970，打开bbox.bin文件，划到九千多的位置，就是版本号了，直接将970改成710就是成功修改了版本号了。
3.2、检查get_var的PLAT_FORM变量，当离线解析bbox.bin文件时，如果选择了平台，就会调用get_var中的set_plat_form方法，所以当PLAT_FORM有值时，说明已经手动设置过，判断手动设置的平台是否在定义的平台信息中;如果没有值，就弹框提示没有平台;
注意:PLAT_FORM是全局变量，所以弹框选择后是一直有值的，所以，下次弹框前要把值清零！！！

其他修改:
NOC 980适配
"
工具发布	"工具发布:
1、parse_script.py中about.py修改版本号为2.7.3；
2、parse_script.py中update.log中，增加版本修改日志；
3.使用ftp.py修改服务器上的version;"

-----------------------------------------------------------------------------------------------------

