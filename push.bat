git status
ECHO OFF
git add *
SET /P VAR1=請輸入註解(不用加雙引號)：
git commit -m "%VAR1%"
git push
ECHO ON
git status
pause