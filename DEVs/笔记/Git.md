# Git

#### 简介

```
版本控制软件
帮助人们进行某些文件的版本管理

分类
本地
单机运行
	
集中化
版本信息全部都记录在一台服务器上，几乎每个操作都要联网

分布式
版本信息在每一个使用者的电脑上都存在，几乎每个操作都不需要联网，只有在代码同步的时候需要联网

好处
操作简单
易于对比
易于回溯
协作方便

特点
Git基于文件快照的形式记录版本，svn是基于差异记录版本
每台电脑都有完整的版本信息
只有最后同步代码时需要联网

文件后面的字母
A:增加的文件.
C:文件的一个新拷贝.
D:删除的一个文件.
M:文件的内容或者mode被修改了.
R:文件名被修改了。
T:文件的类型被修改了。
U:文件没有被合并(你需要完成合并才能进行提交)
X:未知状态。(很可能是遇到git的bug了，你可以向git提交bug report)
```

#### 简单配置

```
配置用户名和邮箱
git config --global user.name 'username'
git config --global user.email 'your_email@example.com'

Git 常用命令大全
https://segmentfault.com/a/1190000006032634

全局配置文件路径
C:\Users\username\.gitconfig

查看所有全局配置项
git config --list --global

查看指定的全局配置项
git config user.name
git config user.email

打开git命令的帮助手册
比如打开config的帮助手册，输入后自动打开浏览器，在浏览器显示帮助
git help config

获取git config命令的快速参考
git config -h
```

#### 生成SSH key（公钥和密钥）

```
打开 Git Bash
粘贴如下的命令，并将 your_email@example.com 替换为注册 Github 账号时填写的邮箱：

ssh-keygen -t rsa -b 4096 -C "邮箱"

连续敲击 3 次回车，
即可在 C:\Users\username\.ssh 目录中生成 id_rsa 和 id_rsa.pub 两个文件

在github配置公钥，并在本地检测是否配置成功
```

#### Git仓库

```
获取
1、将尚未进行版本控制的本地目录转换为 Git 仓库
2、从其它服务器克隆一个已存在的 Git 仓库

远程仓库于本地仓库的交互
git clone

本地仓库的一系列操作
git push/git pull
```

#### 工作区、暂存区、仓库区

```
工作区
编辑代码的文件夹
一般来说是项目的根路径
git会监听的是这个目录中的文件是否被修改, 是由有新增文件, 是否删除了文件

工作区中文件的4种状态

未跟踪（Untracked）
不被 Git 所管理的文件，针对新增的文件

未修改（Unmodified）
工作区中文件的内容和 Git 仓库中文件的内容保持一致

已修改（Modified）
工作区中文件的内容和 Git 仓库中文件的内容不一致
在之前版本中已经存在的文件, 但是现在在工作区修改了

已暂存（Staged）
工作区中被修改的文件已被放到暂存区，准备将修改后的文件保存到 Git 仓库中

Git 操作的终极结果
让工作区中的文件都处于“未修改”的状态。

暂存区
git add(添加到暂存区)

仓库区
git commit(添加到暂存区)

两个仓库，本地仓库、远程仓库

简单流程
修改工作区的文件 
git status
git add .
git commit -m "修改了"

绿色表示文件在暂存区
红色表示文件在工作区
```

#### 常用指令

```
clear
清空终端代码

q
退出窗口

cd
cd src/ 的意思是，查找现目录的下一层目录src

git init
在现有目录中初始化仓库
如果自己有一个尚未进行版本控制的项目目录，想要用 Git 来控制它，需要执行如下两个步骤：
1、 在项目目录中，通过鼠标右键打开“Git Bash” 
2、执行 git init 命令将当前的目录转化为 Git 仓库
命令会创建一个名为 .git 的隐藏目录，这个 .git 目录就是当前项目的 Git 仓库，里面包含了初始的必要文件，这些文件是 Git 仓库的必要组成部分

git clone 远程仓库的地址
将远程仓库克隆到本地

git status
检查文件的状态
出现在 Untracked files下面的文件就是未被跟踪的文件

git status -s
git status --short
以精简的方式显示文件状态
前面有红色的 ?? 标记的文件就是未被跟踪的文件

git add
跟踪新文件
eg:
git add index.html
把工作区中的index.html添加到了暂存区
此时再运行 git status 命令，会看到 index.html 文件在 Changes to be committed 这行的下面，
说明已被跟踪，并处于暂存状态

git add .
将当前工作区的操作行为添加至暂存区

git commit -m "信息"
提交更新
将暂存区中的文件提交到 Git 仓库中进行保存
eg:
git commit -m "上传了"
-m 选项后面是本次的提交消息，用来对提交的内容做进一步的描述

git commit -a -m "信息"
分支的第一次提交不能用git commit -a -m
跳过使用暂存区域，把所有已经跟踪过的文件暂存起来一并提交
Git 标准的工作流程是工作区 → 暂存区 → Git 仓库，
但有时候这么做略显繁琐，此时可以跳过暂存区，直接将工作区中的修改提交到 Git 仓库，
这时候 Git 工作的流程简化为了工作区 → Git 仓库。

git reset --hard 哈希值
回退到某个版本，后面加上需要回退到的版本的哈希值
eg：
git reset --hard 105b01e1efc0f9d28e35a93f0b32b107cdbe88c6

git reset head 文件路径
或
git reset head
将暂存区的文件添加到工作区

git checkout 文件路径
将工作区的文件修改为 未被修改过的状态，后面要加上文件路径
eg:
git checkout src/store/index.js

git checkout .
将工作区的全部文件修改为 未被修改过的状态

git rm -f 文件路径
强行从暂存区和工作区中删除修改后的文件

git rm -cached 文件路径
把文件从暂存区域移除，
但保留工作区中对应的文件

git log
git log --pretty=oneline
查看日志，以当前节点的状态为准

git reflog
查看全部日志

git diff
比较文件的不同
查看指定文件的修改细节

git mv [file] [newfile]
移动或重命名工作区文件

git mv -f [file] [newfile]
重命名

git rebase
假设Git目前只有一个分支master
开发人员的工作流程是
git clone master branch
在自己本地checkout -b local创建一个本地开发分支
在本地的开发分支上开发和测试
阶段性开发完成后（包含功能代码和单元测试），可以准备提交代码
首先切换到master分支，git pull拉取最新的分支状态
然后切回local分支
通过git rebase -i 将本地的多次提交合并为一个，以简化提交历史。

本地有多个提交时,如果不进行这一步,在git rebase master时会多次解决冲突(最坏情况下,每一个提交都会相应解决一个冲突)
git rebase master 将master最新的分支同步到本地，这个过程可能需要手动解决冲突(如果进行了上一步的话,只用解决一次冲突)
然后切换到master分支，git merge将本地的local分支内容合并到master分支
git push将master分支的提交上传
本地开发分支可以灵活管理
```

#### 分支相关指令

```
git branch
查看分支列表分支名字前面的 * 号表示：当前所处的分支

git branch 分支名称
创建新分支
基于当前分支，创建一个新的分支，新分支中的代码和当前分支完全一样

git checkout 分支名称
切换分支
切换到指定的分支上

git checkout -b 分支名称
分支的快速创建和切换
创建指定名称的新分支，并立即切换到新分支上
git branch和git checkout，的简写

git merge
合并分支
git checkout master
切换到master分支(主分支)
git merge login
在master分支上运行git merge命令，将login分支(子分支)的代码合并到master分支
注意
假设要把C分支的代码合并到A分支，
则必须
先切换到A分支上，再运行git merge命令，
来合并C分支

git branch -d +分支名称
删除分支
把功能分支的代码合并到 master 主分支上以后，可以使用该命令，删除对应的功能分支
```

#### 远程仓库相关指令

```
git push
把本地分支推送到远程

git push - u 远程仓库的别名 本地分支名称:远程分支名称
-u表示把本地分支和远程分支进行关联，只在第一次推送的时候需要带-u参数
eg:
git push -u origin payment : pay
如果希望远程分支的名称和本地分支名称保持一致，可以对命令进行简化
git push -u origin payment
注意
第一次推送分支需要带 -u 参数，
此后可以直接使用 git push 推送代码到远程分支

git remote show 远程仓库名称
查看远程仓库
查看远程仓库中，所有的分支列表的信息

git pull
拉取远程分支的最新的代码
如果拉下来需要改名字，则 git pull -b 分支名称
把远程分支最新的代码下载到本地对应的分支中

git push 远程仓库名称 --delete 远程分支名称
删除远程分支
eg：
git push origin --delete pay

git fetch
获取远程仓库代码
```

#### 分支

```
相当于是在某个节点开创出来的一个副本，为了保证主分支的稳定

在进行多人协作开发的时候，为了防止互相干扰，提高协同开发的体验，建议每个开发者都基于分支进行项目
功能的开发

主分支
在初始化本地 Git 仓库的时候，Git 默认已经帮我们创建了一个名字叫做 master 的分支，叫主分支
作用：用来保存和记录整个项目已完成的功能代码

功能分支
专门用来开发新功能的分支，它是临时从 master 主分支上分叉出来的，当新功能开发且测试完毕后，最终需要合并到 master 主分支上
```

#### 跟踪分支

```
从远程仓库中，把对应的远程分支下载到本地仓库，
保持本地分支和远程分支名称相同git checkout 远程分支的名称
eg:
git checkout pay

从远程仓库中，把对应的远程分支下载到本地仓库，
并把下载的本地分支进行重命名git checkout -b 本地分支名称 远程仓库名称/远程分支名称
eg:
git checkout -b payment origin/pay
```

#### 遇到冲突时的分支合并

```
如果在两个不同的分支中，对同一个文件进行了不同的修改，Git 就没法干净的合并它们。 
此时，我们需要打开这些包含冲突的文件然后 手动解决冲突
```

#### 忽略文件/版本忽略文件

```
有些文件无需纳入 Git 的管理，也不希望它们总出现在未跟踪文件列表。
.gitignore 的配置文件，列出要忽略的文件的匹配模式。

文件 .gitignore 的格式规范如下：
① 以 # 开头的是注释
② 以 / 结尾的是目录
③ 以 / 开头防止递归
④ 以 ! 开头表示取反
⑤ 可以使用 glob 模式进行文件和文件夹的匹配（glob 指简化了的正则表达式）

在这个文件中记录有哪些文件不受版本控制软件控制
编译生成的文件
编辑器产生的文件
项目开发过程中需要的临时文件

glob模式
① 星号 * 匹配零个或多个任意字符
② [abc] 匹配任何一个列在方括号中的字符 （此案例匹配一个 a 或匹配一个 b 或匹配一个 c） 
③ 问号 ? 只匹配一个任意字符
④ 在方括号中使用短划线分隔两个字符， 表示所有在这两个字符范围内的都可以匹配（比如 [0-9] 表示匹配
所有 0 到 9 的数字）
⑤ 两个星号 ** 表示匹配任意中间目录（比如 a/**/z 可以匹配 a/z 、 a/b/z 或 a/b/c/z 等）
```

#### 一些具体的场景

```
场景1:
我有一个空的文件夹, 我要在这个文件夹下编写代码, 我希望git能帮我进行版本管理
			在这个目录下git bash
			git init
			新增文件
			git add .
			git commit -m '增加了一些文件'
			新增\修改文件
			git add .
			git commit -m 'xxxxx'
			......

场景2:
我已经使用git形成了好几个版本, 我想回到某个版本去
			git log
				git reflog
			git reset --hard 哈希号

场景3:
我的工作区是干净的, 现在我修改了其中3个文件, 我想看看我究竟修改了哪些内容? 看完之后, 我发现只有其中2个文件是想提交形成一个新的版本的
			方式1
				git status
				git diff 文件1
				git diff 文件2
				git diff 文件3
				git add 文件1
				git add 文件2
				git commit -m 'xxxxx'
			方式2
				git status
				git diff 文件1
				git diff 文件2
				git diff 文件3
				git checkout 文件3
				git add .
				git commit -m 'xxxxx'

场景4:
我的工作区是干净的, 现在我修改了其中2个文件, 并且将其都放入了暂存区, 可是我突然意识到有一个文件我并不想提交, 并且我还想将其变回我未修改前的状态
			git status
			git reset HEAD 文件1
			git checkout 文件1

场景5:
我的工作区是干净的, 我现在想删除某个文件, 并且想提交形成一个版本
			在工作区中删除文件
			git status
			git add .
			git commit -m '删除某个文件'
```
