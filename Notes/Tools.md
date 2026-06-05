#  临时 

```
RPCS3 Eden 瘦身


```

# 游戏

```

每次更新完电脑驱动程序，索尼的绝大多数游戏、RPCS3
都需要重新构建着色器


---------------------------

笔记本
部分Steam、部分Cracks、Tools

16T机械硬盘
Cracks、模拟器、ROMs、电影

百度网盘
Cracks、模拟器、ROMs、Tools





```

#### PC游戏设置

```
通常游戏内独立设置
开启垂直同步
关闭动态模糊
其余特效全开
优选无边框全屏


解决应用程序比例错误
鼠标右键->属性->兼容性->更改所有用户设置->更改高DPI设置->
高DPI缩放替代->替代高DPI缩放行为(勾选)->应用程序->确定
案例：
奥日与黑暗森林、迈阿密热线、恶霸鲁尼、洞窟物语+、超级食肉男孩、忍者龙剑传-西格玛1、忍者龙剑传-西格玛2、忍者龙剑传-3刀锋边缘、银河历险记1、银河历险记3、植物精灵、传说之下、爷爷的城市、桥、生化危机4、FBneo、DeSmuME、BlastEm、侠盗猎车手三部曲重制版、最终幻想10、最终幻想12、最终幻想13-3、SNK VS 卡普空-千年之战、里奥的财富、暗喻幻想、海腹川背-新鲜可口、加拿大不归路

解决手柄无反应(针对STEAM游戏)
先打开手柄，再打开应用程序
禁用STEAM输入，可解决STEAM游戏不识别8BIT手柄问题
案例：
铁甲飞龙重制版、绝境北方、大神绝景版

部分CPU不支持，会闪退或者进不去
案例：
出击飞龙HD、字母人

鬼泣HD合集修改分辨率设置及设置为无边框
C:\Program Files (x86)\Steam\userdata\352556638\631510\remote

最终幻想7 Remastered 高清计划
不要更新第七天堂
不然进不去



```

#### Steam

```js
为了库内游戏名称排列统一，使用英文界面
游戏内尽量设置中文
打开后，直接显示库页面
关闭开机自启、弹窗、好友列表
网不好就关掉云存档，用的不多
开启Steam令牌

理性购买
重置版 重置版 重设版 HD版 重装上阵 大师合集 传奇合集 遗产合集 重启 重载 重生 过渡版
终极版 黄金版 豪华版 典藏版 年度版 导演剪辑版 完整版 完全版 决定版
预购版 限定版 捆绑包
奥德赛 崛起 起源 复仇 审判 无限 重生 进化 暗影 影 
标准版 一般版 普通版

我的Steam：
用户ID(64位)：76561198312822366
用户ID(32位)：352556638
Steam名称：bbbbzhang
替换steam存档前，关闭steam云同步

我的Epic
AccountId：15f3787c5399402cacd56a6ef04e1550
UserName：bbbbzhangE




```

#### Cracks

```js
处理流程
下载解压
修改破解配置文件
修改游戏文件夹名
删除多余文件
压缩成rar存至E盘、上传至百度网盘
编辑Tools.md文件
想玩时，从E盘复制游戏文件，或从度盘下载

同一个游戏，A的存档转给B(A和B拥有不同的userId)
1、确认A和B的存档位置
2、确认A和B的userId
3、将A存档的userId信息改为B的信息
4、将A转换后的存档文件，覆盖到B的存档位置

破解配置文件修改

#SteamId=0修改为
SteamId=76561198312822366

#AccountId=0修改为 
AccountId=352556638

account = 0x123修改为
account = 352556638

011000011503965e
;SteamUserID  =1503965e
;SteamUserIDH =01100001

用户名修改为 
bbbbzhang

语言修改为 
schinese tchinese

socialClubId
UserName=BBBBZHANG
UserId=BBBBZHANG

Goldberg
游戏根目录和C:\Users\19654\AppData\Roaming\Goldberg SteamEmu Saves文件夹，
里面的steam_settings里面的userName和userId均设置为自己的steam信息

Tenoke
tenoke.ini保存格式为utf-8

Goldberg破解的标识
force_steamid.txt
account_name.txt
configs.user.ini

SKIDROW
会在C:\Users\19654\Documents生成一个与破解游戏配置文件里面的用户名同名的文件夹

破解小组
Tenoke、EMPRESS、CODEX、RUNE、Razor1911、Goldberg、FLT、GOG、3DM、aliat、CPY、DOGE、SmartSteamEmu、RELOADED、HOODLUM、STEAMPUNKS、DARKSiDERS、DARKZER0

破解游戏存档位置
C:\Users\Public\Documents\EMPRESS
C:\Users\Public\Documents\Steam\RUNE
C:\Users\Public\Documents\Epic\CODEX
C:\Users\Public\Documents\Steam\CODEX
C:\Users\19654\AppData\Roaming\Steam\CODEX
C:\Users\19654\AppData\Roaming\Goldberg SocialClub Emu Saves
C:\Users\19654\AppData\Roaming\Goldberg SteamEmu Saves
C:\Users\19654\AppData\Roaming\Goldberg UplayEmu Saves
C:\Users\19654\AppData\Roaming\FLT
C:\Users\19654\Documents\SKIDROW
C:\Users\19654\AppData\Roaming\.1911
C:\Users\19654\AppData\Roaming\CPY_SAVES
C:\Users\19654\AppData\Roaming\HOODLUM
C:\Users\19654\AppData\Roaming\SmartSteamEmu
C:\Users\19654\AppData\Roaming\DOGE
C:\Users\19654\Documents
C:\Users\19654\Documents\My Games
C:\Users\19654\Saved Games
C:\Users\19654\AppData\Local
C:\Users\19654\AppData\LocalLow
C:\Users\19654\AppData\Roaming
根目录Profile
根目录3DMGAME
根目录SteamData

破解游戏配置文件
steam_emu.ini
SteamConfig.ini
steam_api.ini
epic_emu.ini
steamclient64.ini
cpy.ini
flt.ini
EMP.ini
ds.ini
steam_rld.ini
3DMGAME.ini
tenoke.ini
valve.ini
socialclub_emu.ini
根目录steam_settings
根目录SteamEmu

可以删的文件
goggame-galaxyFileList.ini
installscript.vdf
steam_installscript.bat
steam_installscript.vdf
installscript_sdk.vdf
eos_installscript.vdf
InstallerMessage.exe
InstallerMessage_RunlScript.vdf
运行库文件
游戏原声音乐
游戏壁纸
游戏pdf画册
eula文件夹
eula文件
宣传广告的html文件
BattlEye文件夹
readme文件
webcache.zip

tenoke祖传bug
一堆游戏的成就解锁有问题，他是用ini收录成就列表的，但默认不支持utf8，造成不少中文游戏一得到成就就跳出，比如炼金工作室系列，除非把ini里的成就项全删了

寻找存档位置
搜索引擎：XXX(游戏名)破解版/正版存档位置
在游戏根目录的ini或者txt文件查看说明
在游戏文件夹中寻找


```

#### 3DS

```
3DS破解
不会，百度

3DS系统升级 
直接联网升级，不建议汉化系统直接升级

3DS luma
升级 网上下最新包
进入 按住select再开机

3DS字库
下载Chinese_system_install包

3DS 存档导入导出 
checkpoint

3DS 更换TF卡
B9S系统 格式化为FAT32 后直接复制
也可以在DiskGenuis里面克隆分区

3DS CTRtransfer
自制TF卡升级系统的方式
CTRTransfer相当于重装系统，用CTRTransfer镜像可覆盖现有的ctrnand

3DS下载安装CIA使用FBI软件

3DS按住start再开机
进入破解系统选择页

3DS 打开homebrew
在"下载游戏"应用程序里面按下 L 下 select
然后选择指定选项
再次进入
homebrew系统及软件格式为3dsx

3DS卸载汉化，重新汉化后，桌面游戏图标都没了，的解决办法
https://tieba.baidu.com/p/847070277
```

#### PSN

```
PS4降级补丁
有些破解版机子版本太低，新出的游戏不一定支持低版本，所以需要降级补丁

keystone
可以使存档在正版机器上面使用


ps4购买需知
光驱可不可以正常使用，是不是原装的
机子有没有拆过
机子版本是什么，看一下机子底部的贴纸
手柄是原装手柄吗，一代还是二代
手柄充电线还在吗
还有哪些配件呢
有没有购买记录，机子买回来多久了呢
包个邮可以吗
手柄是第几代

```

#### NS

```js
特斯拉插件删除方法
特斯拉依靠ovl-loader启动器，
删掉tf：atmosphere/contents/420000000007E51A/flag/boot2.flag文件,等同卸载特斯拉插件。
但是这个只是停用特斯拉平台。在tf：atmosphere/contents/下面还有其它带有启动器的插件。

TF卡要格式化成FAT32


```

#### Emulator

```
删除游戏时
Cemu、Citra、Dolphin、PPSSPP、RPCS3、Eden 均删除本体、更新、DLC

便携版
Citra  添加 user 文件夹后，模拟器的配置可以放在模拟器应用程序的路径里面
Dolphin  添加 portable.txt 文件后，模拟器的配置可以放在模拟器应用程序的路径里面
DuckStation  添加 portable.txt 文件后，模拟器的配置可以放在模拟器应用程序的路径里面
Cemu、PCSX2、PPSSPP、RetroArch、RPCS3、Eden  本来就是便携版
Blastem  非便携版

即时存档
Citra、PPSSPP、PCSX2  即时存档易出错
Cemu、RPCS3、Eden、Blastem  无即时存档
Dolphin、DuckStation、RetroArch  使用体验良好

频繁更新
Cemu、Dolphin、DuckStation、PCSX2、RetroArch、RPCS3、ShadPS4

偶尔更新
PPSSPP

可能不更新了
Citra、YUZU

C盘
C:\Users\19654\Documents\Tools\Emulator
C:\\Users\\19654\\Documents\\Tools\\Emulator
C:/Users/19654/Documents/Tools/Emulator

D盘
D:\Tools\Emulator
D:\\Tools\\Emulator
D:/Tools/Emulator

E盘
E:\Tools\Emulator
E:\\Tools\\Emulator
E:/Tools/Emulator




```

##### Cemu

```
配置路径
Cemu/settings.xml

默认配置路径
C:\Users\19654\AppData\Local\Cemu

塞尔达传说-黄昏公主HD 汉化版 
更新包安装失败


```

##### Citra

```
配置路径
Citra/nightly/user/config

默认配置路径
C:\Users\19654\AppData\Roaming\Citra

Citra/nightly/user/load/mods
类似于实机的luma/title

Citra无加速快捷键

luma补丁位置
游戏列表-》鼠标右键“打开Mod位置”-》Luma补丁里面的romfs文件夹复制到此处位置
如果Luma补丁里面有exefs文件夹，某些情况下同样需要复制到此处位置

洞窟物语3D
设置原生分辨率

DQ8汉化版字幕存放位置
3DS实机 sdmc文件夹(根目录)
模拟器 Citra/nightly/user/sdmc

勇气默示录 1.1汉化说明
1.1补丁仅修复了几个小bug，新增了测试版存档继承功能，可以选择安装，不安装也不会有任何问题。
使用实机的玩家（卡带/破解）安装后联网后请勿再次下载提示的更新，会覆盖一部分内容导致几处文本变回日文。
模拟器玩家如果进入游戏时显示为英文，请将游戏推进到可以自由活动后，于菜单中将游戏文本语言改为-->Japanese。

勇者斗恶龙11 20211011汉化说明
修复补丁的安装方法如下：
1.实机，按住Select键开机调出菜单，确保已勾选“Enable game patching”。将“luma”文件夹复制到SD卡根目录。
2.模拟器，在Citra中右键安装的游戏，选择“打开Mod位置”，（以Windows为例，一般情况下应是“C:\Users\用户名\AppData\Roaming\Citra\load\mods\00040000001BFC00”）将补丁文件夹下的“luma\titles\00040000001BFC00”中的“romfs”文件夹复制到刚刚打开的Mod文件夹。

勇者斗恶龙怪兽篇2 1.1汉化说明
使用方法：
1、安装游戏本体的汉化版
2、先安装升级补丁的cia文件（Dragon Quest Monsters 2 Iru to Ruka no Fushigi na Fushigi na Kagi_JPN_V1.1-TLX）
3-1、实机将压缩包里的00040000000CF500文件夹解压到3DS tf卡根目录/Luma/titles/
3-2、模拟器将压缩包里的00040000000CF500文件夹解压到mods文件夹下
2023.6.21 湮没骑士の镇魂歌

Citra mmj模拟器
2025.10.13，玩家用钞能力请模拟器的作者重新修改，看出来这个模拟器受众很广泛，很多玩家都喜欢。虽然我没将其和其他模拟器的运行效果进行对比，但是根据这件事情，推断出它的运行效果应该很好，难以被替代。


```

##### Dolphin

```
配置路径
Dolphin/Config

洛克人9、10 已安装DLC



------------------------
安卓海豚模拟器MMJ

版本10150和11453数据通用，新版有MotionPlus功能

常规设置
启用双核心 Sync On Skip Idle JIT分支优化
图形设置
图形后端OpenGl 打开Vulkan多线程
增强设置
3倍分辨率 缩放EFB纹理 强制24位色 特殊多级纹理检测
黑科技设置
跳过CPU访问 忽略格式更改 只将EFB复制到纹理 延时复制到内存 GPU纹理解码 只将XFB复制到纹理 
界面设置
关闭错误弹窗 关闭显示屏幕日志 关闭使用游戏名称数据库

部分Wii游戏进游戏选择手柄，选NGC手柄或者水平Wii手柄，单独设置手柄映射
关震动 隐藏虚拟手柄

魂斗罗-重生 恶魔城-重生
关闭 启用双核心

横版游戏
星之卡比 毛线卡比 新超马 节奏天国 
洛克人9 洛克人10 超级纸片马力欧
设置为横版单手柄

银河战士prime2
不能扫描
目前无解

生化危机4
调整显示缩放120%

洛克人9 10
关闭宽屏显示

马力欧银河
捡星星，关闭跳过CPU访问

黄昏公主大地图卡
开金手指 海拉尔加速


```

##### DuckStation

```
配置路径
DuckStation/settings.ini

记忆卡设置为:全部游戏共用记忆卡
记忆卡名字:duckstation_shared_card_1.mcd
所有游戏的存档都会在一个mcd文件里面




```

##### PCSX2

```
配置路径
PCSX2/gamesettings
PCSX2/inis

高分辨率部分游戏显示有问题
由于模拟器更新，即时存档经常失效


```

##### PPSSPP

```
配置路径
PPSSPP/memstick/PSP/SYSTEM

合金弹头XX、合金装备-和平行者 已安装DLC

极魔界村关闭"跳过缓冲效果"，可解决闪烁



```

##### RetroArch

```
设置/列表/管理列表/选择列表/指定默认核心
修改的是playlists里面的default_core_path和default_core_name
启动游戏后，playlists具体游戏里的core_path和core_name会自动变为default_core_path和default_core_name

选择游戏/设置核心关联
修改的是playlists里面，指定游戏的和core_path和core_name

未指定默认核心时
初次启动游戏，须"设置核心关联"，设置完毕后，playlists里的core_path和core_name会自动变为选择的核心

不"设置核心关联"时，即core_path和core_name是DETECT，无法进行游戏
所以，每点开一个游戏，该游戏相关的core_path和core_name会自动改变

PPSSPP模拟器的系统文件夹里面的重要文件夹
RetroArch/saves/PSP/SYSTEM
PPSSPP/memstick/PSP/SYSTEM
PPSSPP/memstick/PSP/GAME

恶魔城-被夺走的刻印 汉化版 需melonDS DS打开
恶魔城-被夺走的刻印 美版 需DeSmuMe或melonDS DS打开
melonDS均无法打开

存档格式不对的话，改后缀名
srm->sav		gba
dsv->sav		nds
srm->mcd	ps1

闹鬼城 
M难，K简单

PCE模拟器的bios
syscard3.pce

使用了BIOS字库的游戏，如果想要正确显示中文，必须让模拟器加载专用BIOS



```

##### RPCS3

```
配置路径
RPCS3/config
RPCS3/GuiConfigs

PKG安装数据、更新、DLC
RPCS3/dev_hdd0/game

存档
RPCS3/dev_hdd0/home/00000001/savedata

RPCS3模拟器官网
https://rpcs3.net/

exdata
RPCS3/dev_hdd0/home/00000001/exdata
rap文件相当于游戏运行所需要的证书文件

缓存
RPCS3/cache
RPCS3/dev_hdd1/caches

PS3固件名称
PS3UPDAT.PUP

神秘海域2港版DLC(多人网战)装不上

无加速快捷键

尼尔-人工生命
先安装游戏资料、DLC再覆盖该补丁？？？
先安装汉化补丁，再安装游戏DLC，再打开游戏安装游戏数据

1update
2dlc
3crack
exdata

死机频繁
马克思佩恩3、黑色洛城、最后生还者

设置里面的Pads可以设置控制器

BCAS官方中文光盘版
BLUS官方美版光盘版
BLJS和BLJM是日版，部分BLJM带中文（忍者龙剑传3刀锋边缘）
BLAS也是中文光盘版
NPUB美版数字版（下载版）
NPJB日版下载版
前两个字母是BL代表蓝光光盘游戏，前两个字母是NP代表PSN数字下载版游戏
第三个字母表示地址 其中 J 表示日版，E表示欧洲，U表示美国，H表示香港，表示亚洲

更换电脑后，加载游戏闪退
删除RPCS3/cache
RPCS3/dev_hdd1/caches



```

##### Eden

```
配置路径
Eden/user/config

游戏目录设置
Eden/user/config/qt-config.ini  ->  Paths\gamedirs\

固件
Eden/user/nand/system/Contents/registered

玩NS游戏需要做的准备：
NS模拟器、游戏ROM、固件、密钥
未安装固件虽然可以进入游戏，但游戏可能不显示文字

存档
Eden/user/nand/user/save
(user/nand/user/save/0000000000000000/63C3B824B82A9B98B6818BFD192D43D2
63C3B824B82A9B98B6818BFD192D43D2目录名字和switch用户信息有关系)

密钥
Eden/user/keys

更新、DLC
Eden/user/nand/user/Contents/registered

汉化补丁
Eden/user/sdmc/atmosphere/contents

不要设置抗锯齿
 
OpenGL模式
异形战机Final2、大神

原始分辨率
重力回路

无加速快捷键

点击设置闪退
原因：控制器配置不能保存中文名称

传说之下汉化补丁
Eden/user/sdmc/atmosphere/contents/010080B00AD66000/romfs

勇者斗恶龙1&2重制版
安装完DLC 2、4、5，便无法进入游戏，模拟器和实机都是

YUZU识别不了需要NS固件为20.0+的游戏文件

密特罗德Prime4
不支持底座模式插件
需要21.0.0系统






```

##### Blastem

```
Blastem 配置路径
C:\Users\19654\AppData\Local\blastem


无加速快捷键



```

# Life

#### IDEA相关

```js
-D 是 –save-dev 的简写
devDependencies即开发依赖，只在开发时使用，产品上线时不需要

-S 是 –save 的简写
dependencies即生产依赖，在生产环境中使用

箭头函数返回对象，又不想加return时 得给对象加圆括号

https://cdn.jsdelivr.net/gh/bbbbzhang/Pictures@ease/images/

-f 或 --force：将强制 npm 获取远程资源，即使磁盘上存在本地副本也是如此。
–legacy-peer-deps：在安装时忽略所有 peerDependencies，采用 npm 版本 4 到版本 6 的样式。


打开终端
Alt+F12

格式化
Ctrl+Alt+I

查找替换
Ctrl+R

关闭查找替换
ESC

复制整行
Ctrl+D

剪切一行，相当于删除
Ctrl+X

注释
Ctrl+Shift+/
Ctr+/

注释写TODO，意思是代做，可以别识别到
// TODO

鼠标右键指定文件
打开于->Explorer

JDK18中文乱码



```

#### 去掉不用的右键菜单

```
Windows Registry Editor Version 5.00

;百度云管家
[-HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\YunShellExt]
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\YunShellExt]
[-HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers\YunShellExt]

;坚果云/NutStore
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\NutstoreExt]
[-HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\NutstoreExt]

;Open in Visual Studio
[-HKEY_CLASSES_ROOT\Directory\shell\AnyCode]
[-HKEY_CLASSES_ROOT\Directory\Background\shell\AnyCode]

;Intel核显
[-HKEY_CLASSES_ROOT\Directory\background\shellex\ContextMenuHandlers\igfxDTCM]

;通过QQ发送到；{53D2405C-48AB-4C8A-8F59-CE0610F13BBC}
[-HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\QQShellExt]
[-HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\QQShellExt]
[-HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers\QQShellExt]

;UltraISO
[-HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\UltraISO]
[-HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\UltraISO]
[-HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\UltraISO]

;格式工厂/Format Factory
[-HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\FormatFactoryShell]
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\FormatFactoryShell]

;火萤
[-HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\HYWindow]
[-HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\{FB67D662-16CF-49A6-AACC-C62191537290}]
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\{FB67D662-16CF-49A6-AACC-C62191537290}]
[-HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers\{FB67D662-16CF-49A6-AACC-C62191537290}]

;Open with Code
[-HKEY_CLASSES_ROOT\*\shell\VSCode]

;包含到库中/Include In Library
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked]
"{3dad6c5d-2167-4cae-9914-f99e41c12cfa}"="Include In Library"

;恢复以前的版本/Restore Previous Versions
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked]
"{596AB062-B4D2-4215-9F74-E9109B0A8153}"="Restore Previous Versions"

;共享/Share
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked]
"{e2bf9676-5f8f-435c-97eb-11607a5bedf7}"="Share"

;Cast to Device
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked]
"{7AD84985-87B4-4a16-BE58-8B72A5B390F7}"="Cast to Device"

;授予访问权限/Give access to
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked]
"{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}"="Give access to"

;兼容性疑难解答/Troubleshoot compatibility
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked]
"{1d27f844-3a1f-4410-85ac-14651078412d}"="Troubleshoot compatibility"

;Pin to start
[-HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\PintoStartScreen]
[-HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\PintoStartScreen]

;Pin to taskbar
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}]

;Start Menu Pin?不清楚和PintoStartScreen的区别
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}]

;Pin to Access/固定到快速访问
[-HKEY_CLASSES_ROOT\Folder\shell\pintohome]
[-HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\pintohome]




上面的某些如果没用可以考虑试一下下面的

;未知，我当时记录的是Give access to但是后来用了没效果
[-HKEY_CLASSES_ROOT\Directory\shell\UpdateEncryptionSettings]

;Include Folder to Library
[-HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location]

;Restore Previous Versions
[-HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}]
[-HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}]
[-HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}]
[-HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}]

;Share
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\Sharing]
[-HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\Sharing]
[-HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\Sharing]
[-HKEY_CLASSES_ROOT\Directory\shellex\CopyHookHandlers\Sharing]
[-HKEY_CLASSES_ROOT\Directory\shellex\PropertySheetHandlers\Sharing]
[-HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\Sharing]
[-HKEY_CLASSES_ROOT\Drive\shellex\PropertySheetHandlers\Sharing]
[-HKEY_CLASSES_ROOT\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing]
[-HKEY_CLASSES_ROOT\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing]
```

#### 关闭拖动窗口布局

```
控制面板
查看方式为大图标
轻松使用设置中心
使鼠标更易于使用
勾选将窗口移动到屏幕边缘时不要自动排列窗口

FN键锁定(微星GP66)
FN+ESC
```

#### 重新启用Windows快速启动

```
管理员命令提示符窗口，
输入：powercfg /h on命令 - 启用Windows快速启动  重启
C盘多占用8G

```

#### 解压错误修复方法

```
使用winrar5.0以上解压，否则会提示压缩包损坏

如果解压过程中提示文件检验错误或文件损坏，请先拍照记录出错的压缩包和出错的文件，待解压完毕后修复出错的压缩包：

具体操作：
 双击出错的压缩包，工具-修复压缩文件，待提示修复完成，
 把新生成的fix开头的压缩包，替换掉原压缩包，再单独解压出错的文件，放入对应位置即可。
 或者全部重新解压一遍
```

#### 恢复快捷方式小箭头

```bat
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
pause
```

#### 去除快捷方式小箭头

```bat
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
pause
```

#### 修复白色异常快捷方式

```bat
@echo off 
taskkill /f /im explorer.exe 
CD /d %userprofile%\AppData\Local 
DEL IconCache.db /a 
start explorer.exe
cho 执行完成
```

#### 系统自动创建ModifiableWindowsApps等空文件夹删除解决方法

```
文件夹来源：Windows 更新、微软应用商店或游戏更新（例如Xbox）将一个名为“ModifiableWindowsApps（可修改的视窗应用）”的新文件夹添加到"Program Files"文件夹中。该文件夹包含某些PC游戏的数据，并与PC游戏模组功能相关联。


困扰：
这些权限级别高的空文件夹（ModifiableWindowsApps）、（WindowsApps）出现在了其他不同的（本不该出现的）多个驱动器上；即使删除了这些文件夹，在重启后可能会恢复。


解决办法：
”以管理员身份“运行命令提示符
依次运行以下命令：

takeown /F "D:\Program Files" /A /R /D Y
icacls "D:\Program Files" /T /grant administrators:F
rd /s /q "D:\Program Files" 

或者删除电脑上的“游戏服务”软件，根治


```

#### win11的右键菜单还原为win10版

```
按“win键 + X”，在弹出的快捷菜单中，选择“Windows终端（管理员）”：
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
在任务管理器中，重启一下“Windows资源管理器”。

恢复Win11的右键菜单
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /va /f

```

#### 笔记本合上盖子后，重新开盖屏幕缩放变化的解决方法

```
将缩放比例，改为自己手填的缩放比例200%，不用系统下拉的选项。


```

#### 鼠标失灵

```
罗技g304鼠标按键双击
其实就是微动有静电 哈气给静电去掉

罗技g304鼠标回滚
可以试试倒放鼠标，滚轮在大腿或者床单上来回滚狂滚几下，亲测治好了
我的过保了直接拆开，取出滚轮擦干净灰再装上就没事了
用风筒对准滚轮，边转动边吹，清除内部灰尘


```

#### 电脑连不上网

```
网络重置
```

#### 关机时有程序阻止关机

```
右键选中开始菜单，打开“运行”，输入“gpedit.msc”并回车打开组策略。
进入“管理模板”下的“系统”，双击打开“关机选项”。
双击打开右边的“关闭会阻止或取消关机的应用程序的自动终止功能”。
```

#### 找不到组策略编辑器(gpedit.msc)

```
家庭版的win系统默认没有gpedit.msc

在记事本中输入以下内容：
@echo off
pushd "%~dp0"

dir /b %systemroot%\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >gp.txt

dir /b %systemroot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>gp.txt

for /f %%i in ('findstr /i . gp.txt 2^>nul') do dism /online /norestart /add-package:"%systemroot%\servicing\Packages\%%i"
pause

保存记事本，文件名设为【gpedit.bat】，保存类型选择【所有文件】
右键【gpedit.bat】文件，选择【以管理员身份运行】
出现 请按任意键继续 即可成功
```

#### 部分电脑使用potplayer会出现画面卡住声音继续软件死机的现象

```
未找到解决办法

```

#### 如何完美备份windows系统及设置

```
未找到解决办法

```

#### 禁止windows正在向microsoft报告

```
在系统桌面右键点击屏幕左下角的开始按钮，选择弹出菜单中的运行菜单。 接着在打开的运行窗口输入命令gpedit.msc。 这时就会打开本地组策略编辑器窗口依次点击计算机配置/管理模板/windows组件的菜单。 接下来在展开的菜单中找到Windows错误报告的设置项。 右键点击右侧的禁用windows错误报告的设置项选择编辑的菜单。 在打开的编辑窗口选择已启用的选项就可以了。
```

#### 关闭动画效果

```
可提高性能

按下 Windows + I 快捷键打开「设置」。
点击左侧面板中的「辅助功能」。
再点击右侧的「视觉效果」选项。
启用或禁用「动画效果」选项。
```

#### 此电脑顶部有白条

```
111


```

#### 红米笔记本切换性能模式

```
Fn+K


```

#### 小米笔记本进入U盘启动界面

```
F2进入bios，关闭安全启动，保存并退出
开机时按F12，选择U盘启动


```

#### 关闭win更新后的引导界面

```
设置 系统 通知 其他设置 取消勾选
```

#### GitHub的存储空间政策

```
每个项目的最大空间限制
根据 GitHub 官方文档，每个公共项目的最大存储空间为 1GB。对于私有项目，尽管没有明确的限制，但 GitHub 强烈建议开发者将单个项目的大小控制在 1GB 以内，以保证良好的性能和可管理性。

文件大小限制
单个文件的最大大小为 100MB。
大于 100MB 的文件将无法通过普通的 Git 操作上传。
对于超过 100MB 的文件，GitHub 建议使用 Git Large File Storage (LFS) 进行管理。
```

#### STEAM启动游戏慢

```
关闭着色器加载

```

#### 无法压缩卷

```
win11在压缩券时出现如下问题：无法将卷压缩到超出任何不可移动的文件所在的点。有关完成该操作的详细信息，请参阅应用程序日志中的“defrag”事件。

解决办法
鼠标右击开始菜单→运行→输入：
SYSDM.CPL
（按下Enter键）
切换到“系统保护”选项卡→关闭这里所有分区的系统保护，
同时删除一下还原点。
然后鼠标左键单击任务栏搜索框，输入：
cmd
鼠标左键单击以“管理员身份运行”，输入：
sfc /SCANNOW
（按下Enter键）
Dism /Online /Cleanup-Image /ScanHealth
（按下Enter键）
Dism /Online /Cleanup-Image /CheckHealth
（按下Enter键）
DISM /Online /Cleanup-image /RestoreHealth
（按下Enter键）
CHKDSK c:/f
（按下Enter键）
看到：
“是否计划在下次系统重新启动时检查这个卷”
按
Y
（个人建议每个盘都修复一下），
然后再重启就会自动修复刚才没修复过的盘。
（重启后不要按任何键，否则可能终止修复）
完成后再尝试压缩卷。


```

#### 解压ISO

```
解压ISO时，遇到重名文件，先移出来，等解压完成后，再覆盖进去

```



#### 应用程序文件分类

```
本体文件夹、配置文件夹、存档文件夹

ProgramData文件夹，包含不是用户特定的全局应用程序数据，可供计算机上的所有用户使用。任何全局数据都放在这里。
AppData文件夹，包含用户特定的首选项和配置文件配置，并进一步分为三个子文件夹：
 1.Roaming漫游文件夹，包含可以从用户配置文件从计算机移动到计算机的数据
 2.Local本地文件夹，包含无法与用户配置文件一起移动的数据。
 3.LocalLow文件夹，包括低级访问数据，例如。在受保护的模式下运行时浏览器的临时文件。

```

#### WIN快捷指令

```
任务管理器快捷键
Ctrl+Alt+Del

FN + WIN 锁住win键

WIN+E 打开此电脑

WIN+V 剪切板

打开管理员终端
CTRL+SHIFT再打开
WIN+X 然后 按A

打开任务管理器
CTRL+SHIFT+ESC

CTRL+W 关闭浏览器页面

系统配置
WIN+R 输入 msconfig

注册表
WIN+R 输入 regedit

打开开始菜单
WIN+X

清理电脑卸载残留
控制面板
\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall
都删掉之后，控制面板\程序\程序和功能底下绝大多数软件都没了



```















