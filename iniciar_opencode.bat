@echo off
title Opencode AI Agent
echo Iniciando o agente do Opencode...

"C:\Program Files\nodejs\node.exe" "C:\Users\genez\AppData\Roaming\npm\node_modules\opencode-ai\bin\opencode" %*

echo.
echo Processo encerrado! Pressione qualquer tecla para fechar a janela.
pause >nul
