SETLOCAL ENABLEEXTENSIONS

:: === CONFIG ===
SET "EXTRACTED_DIR=%USERPROFILE%\Downloads\ETS2Extracted"  :: Set the folder where the extracted files are located
SET "TARGET=F:\SteamLibrary\steamapps\common\Euro Truck Simulator 2"

:: === MOVE DLC FILES ===
echo.
echo === MOVING DLC FILES ===

call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_balkan_e.scs" "Balkan East"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_balkan_w.scs" "Balkan West"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_balt.scs" "Baltic"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_east.scs" "Going East"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_fr.scs" "France"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_greece.scs" "Greece"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_iberia.scs" "Iberia"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_it.scs" "Italy"
call :movefile "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\dlc_north.scs" "Scandinavia"

:: === COPY DLLs AND CREAMAPI.INI ===
echo.
echo === COPYING DLL AND CREAMAPI.INI ===

xcopy /Y "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\steamapps\common\Euro Truck Simulator 2\bin\win_x64\steam_api64.dll" "%TARGET%\bin\win_x64\"
echo steam_api64.dll FILE MOVED AND PASSED

xcopy /Y "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\steamapps\common\Euro Truck Simulator 2\bin\win_x64\steam_api64_o.dll" "%TARGET%\bin\win_x64\"
echo steam_api64_o.dll FILE MOVED AND PASSED

xcopy /Y "%EXTRACTED_DIR%\ETS2-ALL-DLCS-v1.54.1.0_Mosbymods.de\steamapps\common\Euro Truck Simulator 2\creamapi.ini" "%TARGET%\steamapps\common\Euro Truck Simulator 2\"
echo creamapi.ini FILE MOVED AND PASSED

echo.
echo === ALL FILES MOVED SUCCESSFULLY ===
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
