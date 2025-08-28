@echo off 
chcp 65001 > nul

echo Скрипт запущен: %date% %time% >> C:\Scr\log.txt
echo Выполняю полезные действия...
echo %date% %time% >> C:\Scr\otchet.txt
dir C:\Scr\test_dir >> C:\Scr\otchet.txt 
echo. >> C:\Scr\otchet.txt
echo Файлы, содержащие '@test_string' в первой строке: >> C:\Scr\otchet.txt
echo ================================================== >> C:\Scr\otchet.txt

REM Перебираем все файлы в директории
for %%F in (C:\Scr\test_dir\*) do (
    REM Проверяем, является ли объект файлом
    if exist "%%F" (
        REM Считываем первую строку из файла
        set "firstline="
        <"%%F" set /p firstline=
        
        REM Проверяем, содержит ли первая строка нужный текст
        if "!firstline!"=="@test_string" (
            echo Найден файл: %%F >> C:\Scr\otchet.txt
            echo   Содержимое первой строки: !firstline! >> C:\Scr\otchet.txt
        )
    )
)

echo Задание выполнено успешно!
Если у вас включена отложенная расширение переменных, этот скрипт должен работать. Если нет, вот альтернативная версия с явным включением отложенного расширения:

bat
@echo off 
setlocal enabledelayedexpansion
chcp 65001 > nul

echo Скрипт запущен: %date% %time% >> C:\Scr\log.txt
echo Выполняю полезные действия...
echo %date% %time% >> C:\Scr\otchet.txt
dir C:\Scr\test_dir >> C:\Scr\otchet.txt 

echo. >> C:\Scr\otchet.txt
echo Файлы, содержащие '@test_string' в первой строке: >> C:\Scr\otchet.txt
echo ================================================== >> C:\Scr\otchet.txt

REM Перебираем все файлы в директории
for %%F in (C:\Scr\test_dir\*) do (
    REM Пропускаем каталоги
    if not exist "%%F\" (
        REM Считываем первую строку из файла
        set "firstline="
        <"%%F" set /p firstline=
        
        REM Проверяем, содержит ли первая строка нужный текст
        if "!firstline!"=="@test_string" (
            echo Найден файл: %%F >> C:\Scr\otchet.txt
            echo   Содержимое первой строки: !firstline! >> C:\Scr\otchet.txt
        )
    )
)

echo Задание выполнено успешно!
