@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
title Discord multi tool Coded by Cone
set /p "token-" < token.txt
:main
cls
echo        $$$$$$\   $$$$$$\  $$\   $$\ $$$$$$$$\ 
echo      $$  __$$\ $$  __$$\ $$$\  $$ |$$  _____|
echo      $$ /  \__|$$ /  $$ |$$$$\ $$ |$$ |      
echo      $$ |      $$ |  $$ |$$ $$\$$ |$$$$$\    
echo      $$ |      $$ |  $$ |$$ \$$$$ |$$  __|   
echo      $$ |  $$\ $$ |  $$ |$$ |\$$$ |$$ |      
echo      \$$$$$$  | $$$$$$  |$$ | \$$ |$$$$$$$$\ 
echo      \______/  \______/ \__|  \__|\________|
echo Remember to sub on YT Channel https://www.youtube.com/@conek1493
echo 1. Mass DM Channels
set /p choice="Chose a option $"
if %choice%=="1" goto mdc
echo enter valid option
goto main
echo enter valid option
:mdc
cls
set /p "message-Enter desired message to send $>"
set /p "token-" < token.txt
for /f "tokens=" %%A in (chennel_id.txt) do (
    call :sendMessage "%AA"
)
:sendMessage
cls
set "channel-%1~1"
set "url=https://discord.com/api/v9/channels/%channel%/messages"
echo Sending message %message%to channel ID %channel%
:send
curl -X POST -H "Authorization %token%" -H "Conetent-Type: application/json -d "{\"content\:\"%message%"}" %url%
if %errorLevel% neq 0 (
    echo Rate limited, trying again in 5 seconds
    timeout /t 5 /nobreak >nul
    goto send
)
cls
echo Message sent

pause > nul

