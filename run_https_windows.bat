@echo off
REM run_https_windows.bat
REM Windows batch script to set SSL environment variables and start the app with uv

REM --- 配置区域：根据实际路径修改下面两个值 ---
setlocal
set "SSL_CERTFILE=D:\Program Files\OpenSSL-Win64\cert.crt"
set "SSL_KEYFILE=D:\Program Files\OpenSSL-Win64\private.key"
set "PORT=443"

echo --------------------------------------------------
echo SSL_CERTFILE=%SSL_CERTFILE%
echo SSL_KEYFILE=%SSL_KEYFILE%
echo PORT=%PORT%
echo --------------------------------------------------

REM 如果工程使用虚拟环境(venv)，并且 activate 脚本存在，则尝试激活它（可选）
if exist "venv\Scripts\activate.bat" (
    echo Activating virtual environment...
    call "venv\Scripts\activate.bat"
) else (
    echo No venv activation script found at venv\Scripts\activate.bat - continuing without venv activation
)

echo Starting server (this will block the console)...
echo If you bind to port 443 you may need to run this script as Administrator.

REM 启动应用（使用 uv 命令）
uv run main.py

endlocal
