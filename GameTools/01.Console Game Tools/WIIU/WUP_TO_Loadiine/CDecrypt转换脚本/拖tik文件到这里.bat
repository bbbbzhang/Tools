@ECHO OFF &TITLE CDecrypt 脚本
color 2F
Cls

set PDR=%~dp0CDecrypt\
set WAY=%~dp1
cd "%WAY%"

ECHO 开始调用 CDecrypt......

"%PDR%CDecrypt.exe" title.tmd title.tik "%PDR%ckey.bin"
md DecryptFiles
move code DecryptFiles
move meta DecryptFiles
move content DecryptFiles

ECHO 任务完成, 任意键退出......
pause>NUL
