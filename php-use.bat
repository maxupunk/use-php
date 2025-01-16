@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Diretório base onde estão as versões do PHP
set PHP_DIR=C:\laragon\bin\php

:: Verificar se o caminho está no PATH
echo %PATH% | find /i "%PHP_DIR%\php-use" >nul
if errorlevel 1 (
    echo O caminho %PHP_DIR%\php-use não está no PATH. Adicionando...
    setx PATH "%PATH%;%PHP_DIR%\php-use"
    :: Atualizar o PATH para a sessão atual
    set PATH=%PATH%;%PHP_DIR%\php-use
) else (
    echo O caminho %PHP_DIR%\php-use já está no PATH.
)

:: Entrar no diretório base
cd /d "%PHP_DIR%"

:: Verificar se a pasta php-use existe
if not exist "php-use" (
  for /d %%F in (php-*) do (
    for /f "tokens=2 delims=-" %%A in ("%%~nxF") do (
      if "%%A" neq "" (
        ren "%%F" "php-use"
        goto :list_versions
      )
    )
  )
)

:list_versions
:: Listar pastas de PHP disponíveis
echo Listando versões disponíveis:
set i=0
for /d %%F in (php-*) do (
  if "%%~nxF" neq "php-use" (
    for /f "tokens=2 delims=-" %%A in ("%%~nxF") do (
      if "%%A" neq "" (
        set /a i+=1
        set "version[!i!]=%%~nxF"
        echo !i! - %%~nxF
      )
    )
  )
)

:: Solicitar ao usuário a escolha de uma versão
set /p choice=Escolha o número correspondente à versão desejada:

:: Validar a escolha
if not defined version[%choice%] (
  echo Escolha inválida.
  pause
  exit /b
)

:: Obter a pasta escolhida
set "selected_version=!version[%choice%]!"

:: Ler a versão do arquivo snapshot.txt
if exist "%PHP_DIR%\php-use\snapshot.txt" (
  for /f "tokens=2 delims=: " %%A in ('findstr /i "Version:" "%PHP_DIR%\php-use\snapshot.txt"') do (
    set "snapshot_version=%%A"
  )
  ) else (
  echo O arquivo snapshot.txt não foi encontrado em %selected_version%.
  pause
  exit /b
)

:: Confirmar a versão encontrada
if not defined snapshot_version (
  echo Não foi possível encontrar a versão no arquivo snapshot.txt.
  pause
  exit /b
)

:: Renomear a pasta php-use para php-"versão"
if exist "%PHP_DIR%\php-use" (
  ren "%PHP_DIR%\php-use" "php-%snapshot_version%"
)

:: Renomear a pasta selecionada para php-use
ren "%PHP_DIR%\%selected_version%" "php-use"

:: Exibir mensagem de sucesso
echo A pasta php-use foi atualizada para a versão %selected_version%.
