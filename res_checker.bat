@echo off

SET MAIN_DIR=res_checker
SET UTILS=%MAIN_DIR%\_utils

SET COPY_CMD=xcopy /Y /E /R /V
SET PATCH_CMD="%UTILS%\patch" -p0 --no-backup-if-mismatch --ignore-whitespace
SET TEE_CMD="%UTILS%\tee" -a "BiG World Debug.txt"

SET WEIDU=weidu.exe

SETLOCAL ENABLEDELAYEDEXPANSION

SET /A COUNTER=0

:res_check
IF EXIST "%WEIDU%" (
    "%WEIDU%" --noautoupdate --force-install 0 --nogame --log nul "%UTILS%\res_checker.tp2" --args "%UTILS%" | %TEE_CMD%
)

pause