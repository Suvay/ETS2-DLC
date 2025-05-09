@echo off
SETLOCAL ENABLEEXTENSIONS

:: === CONFIG ===
SET "RAR_NAME=ETS2-ALL-DLCs-v1.54.1.0_Mosbymods.de.rar"
SET "RAR_PASS=mosbymods.de"
SET "DOWNLOAD_LINK=https://www.dropbox.com/scl/fi/qg0ueewnfdaz143tyxa36/ETS2-ALL-DLCs-v1.54.1.0_Mosbymods.de.rar?rlkey=46balkkoytvhvcvnpzclij8wp&st=g99d4456&dl=1"
SET "WORKDIR=%USERPROFILE%\Downloads\ETS2Extracted"
SET "TARGET=F:\SteamLibrary\steamapps\common\Euro Truck Simulator 2"
SET "7Z=%ProgramFiles%\7-Zip\7z.exe"

:: === CREATE WORKDIR ===
IF NOT EXIST "%WORKDIR%" mkdir "%WORKDIR%"
cd /d "%WORKDIR%"

:: === DOWNLOAD FILE WITH REAL PROGRESS BAR ===
echo.
echo === DOWNLOADING %RAR_NAME% ===
curl -# -L -o "%RAR_NAME%" "%DOWNLOAD_LINK%"

IF NOT EXIST "%RAR_NAME%" (
    echo.
    echo [ERROR] Failed to download file.
    pause
    exit /b
)

:: === EXTRACT RAR FILE ===
echo.
echo === EXTRACTING %RAR_NAME% ===
"%7Z%" x "%RAR_NAME%" -p%RAR_PASS% -o"%WORKDIR%" -y

:: === MOVE DLC FILES ===
echo.
echo === MOVING DLC FILES ===
SET "DLCFOLDER=%WORKDIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de"

call :movefile "%DLCFOLDER%\dlc_balkan_e.scs" "Balkan East"
call :movefile "%DLCFOLDER%\dlc_balkan_w.scs" "Balkan West"
call :movefile "%DLCFOLDER%\dlc_balt.scs" "Baltic"
call :movefile "%DLCFOLDER%\dlc_east.scs" "Going East"
call :movefile "%DLCFOLDER%\dlc_fr.scs" "France"
call :movefile "%DLCFOLDER%\dlc_greece.scs" "Greece"
call :movefile "%DLCFOLDER%\dlc_iberia.scs" "Iberia"
call :movefile "%DLCFOLDER%\dlc_it.scs" "Italy"
call :movefile "%DLCFOLDER%\dlc_north.scs" "Scandinavia"

:: === COPY PATCH FILES TO bin folders ===
echo.
echo === COPYING PATCH FILES ===
xcopy /Y "%DLCFOLDER%\steamapps\common\Euro Truck Simulator 2\bin\win_x64\*" "%TARGET%\bin\win_x64\" >nul
echo bin\win_x64 FILES MOVED AND PASSED

xcopy /Y "%DLCFOLDER%\steamapps\common\Euro Truck Simulator 2\bin\win_x86\*" "%TARGET%\bin\win_x86\" >nul
echo bin\win_x86 FILES MOVED AND PASSED

echo.
echo === ALL FILES MOVED AND REPLACED SUCCESSFULLY ===
pause
exit /b

:: === MOVEFILE FUNCTION ===
:movefile
SET "SRC=%~1"
SET "LABEL=%~2"
IF EXIST "%SRC%" (
    move /Y "%SRC%" "%TARGET%\"
    echo DLC - %LABEL% MOVED AND PASSED
)
exit /b
