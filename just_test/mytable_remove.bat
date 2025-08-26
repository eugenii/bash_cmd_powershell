@echo off 
chcp 65001 > nul


schtasks /delete /tn "TestTaskEvery2Min" /f
echo Задача удалена.
pause