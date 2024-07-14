@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo The script requested a admin previleuge...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
title cloudwind installer / @w3dcloudriver
:menu
cls
echo ========================================================================================================================
echo      l             d                  d 
echo      l             d       ii         d 
echo  ccc l ooo u  u  ddd w   w    nnn   ddd  
echo c    l o o u  u d  d w w w ii n  n d  d 
echo  ccc l ooo  uuu  ddd  w w  ii n  n  ddd 
echo ========================================================================================================================
echo Hello! 
echo This is installer of cloudwind - custom for windows 10.
echo All custom tested on KirbyOS 27.06.2024 21H1.
echo ========================================================================================================================
echo W     W  AA  RRRR  N   N III N   N  GGG  !!!
echo W     W A  A R   R NN  N  I  NN  N G     !!! 
echo W  W  W AAAA RRRR  N N N  I  N N N G  GG !!!
echo  W W W  A  A R R   N  NN  I  N  NN G   G 
echo   W W   A  A R  RR N   N III N   N  GGG  !!!
echo ========================================================================================================================
echo You do everything at your own risk. 
echo I am not responsible for your system, if something happens to the system - reinstall or restore the system.
echo This script only for windows 10! On 11 this script doesn`t work.
echo ========================================================================================================================
echo 1 - install.
echo * - exit.
echo ========================================================================================================================
set /p choice="Select option: "
echo ========================================================================================================================
if %choice% == 1 goto install
if %choice% == * goto close

:install
echo installing ultrauxthemepatcher(do not reboot)...
set current_dir=%~dp0
"%current_dir%bin\themepatcher.exe"
echo installed ultrauxthemepatcher.
echo setting wallpaper...
set wallpaper_path=%current_dir%\bin\wp.png
set system_wallpaper_path=C:\Windows\Web\Wallpaper\wp.png
copy "%wallpaper_path%" "%system_wallpaper_path%"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%system_wallpaper_path%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
echo wallpaper installed.
echo installing font...
set font_path=%current_dir%\bin\font.ttf
start "" "%font_path%"
press any key after font install is finished.
timeout 99
echo font installed.
echo initing font...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Light (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Semibold (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Symbol (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI" /t REG_SZ /d "JetBrains Mono" /f
echo inited! needed a reboot.
echo installing a theme...
set theme_archive=%current_dir%\bin\t.zip
set extract_path=C:\Windows\Resources\Themes
tar -xf "%theme_archive%" -C "%extract_path%"
echo installed.
echo installing oldnewexplorer...
set oldnewexplorer_archive=%current_dir%\bin\one.zip
set extractone_path=C:\Windows\Web\Wallpaper\OldNewExplorer
set current_dir=%~dp0
set program_path=%extractone_path%\OldNewExplorerCfg.exe
set image_path=%current_dir%bin\settingone.png
mkdir "%extractone_path%"
tar -xf "%oldnewexplorer_archive%" -C "%extractone_path%"
start "" "%program_path%"
start "" "%image_path%"
echo setup the config as shown in the screenshot.
echo setting a theme...
set theme_path="C:\Windows\Resources\Themes\Catppuccin.theme"
RUNDLL32.EXE shell32.dll,Control_RunDLL desk.cpl,,1
start "" %theme_path%
echo done.
timeout 10
goto end

:end
cls
title instalation has finished / @w3dcloudriver
echo =======================================================================================================================
echo Thanks for using my script for install a cloudwind!
echo The script maked by w3dcloud and chatgpt.
echo For finish the instalation, u need a reboot.
echo Would you like to reboot?
echo 1 - reboot.
echo * - no, thanks.
echo ========================================================================================================================
set /p choiceonend="Select option: "
echo ========================================================================================================================
if %choiceonend% == 1 goto reboot
if %choiceonend% == * goto close

:reboot
echo Thanks for using my script!
echo The computer reboots after 5 seconds.
shutdown -r -t 5

:close
echo The script has killed. Press any key to close a script.
pause