@ECHO OFF &TITLE CDecrypt �ű�
color 2F
Cls

set PDR=%~dp0CDecrypt\
set WAY=%~dp1
cd "%WAY%"

ECHO ��ʼ���� CDecrypt......

"%PDR%CDecrypt.exe" title.tmd title.tik "%PDR%ckey.bin"
md DecryptFiles
move code DecryptFiles
move meta DecryptFiles
move content DecryptFiles

ECHO �������, ������˳�......
pause>NUL
