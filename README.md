

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

