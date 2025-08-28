@echo off 
chcp 65001 > nul

REM Простой вариант - установим время начала на ближайшие несколько минут
schtasks /create /tn "TestTaskEvery2Min" /tr "C:\Scr\myscr.bat" /sc minute /mo 2 /st 00:01 /ru SYSTEM

if %errorlevel% equ 0 (
    echo Задача создана успешно! Будет выполняться каждые 2 минуты.
    echo Первый запуск через 1 минуту.
    schtasks /run /tn "TestTaskEvery2Min"
) else (
    echo Ошибка при создании задачи.
    echo Убедитесь, что:
    echo 1. Запускаете от имени администратора
    echo 2. Путь C:\Scr\myscr.bat существует
)

pause
