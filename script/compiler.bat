@echo off
cls
REM ALTERE AS VARIAVEIS PARA SEUS RESPECTIVOS DIRETORIOS
SET MICROC_BASE="C:\Users\Public\Documents\Mikroelektronika\mikroC PRO for PIC"
SET PROJETO_BASE="C:\Users\mathe\Desktop\firmware-placa-central-controladora-pic18f4550"

SET COMPILADOR=%MICROC_BASE%"\mikroCPIC1618.exe"
SET PIC_MCU="P18F4550"
SET ARQUIVO_PROJETO=%PROJETO_BASE%"\central_controle.mcppi"
SET ARQUIVOS_DEFINES=%MICROC_BASE%"\Defs\"
SET ARQUIVOS_P18=%MICROC_BASE%"\uses\P18\"
SET DIRETORIO_PROJECT=%PROJETO_BASE%"\"
SET LIBRARIES=%PROJETO_BASE%"\library"

REM ADICONE AS SUAS PASTAS COM OS ARQUIVOS .H
SET LIB_FRAMEWORK=-SP %LIBRARIES%\framework\timer0\ -SP %LIBRARIES%\framework\interrupt\ -SP %LIBRARIES%\framework\gpio\ -SP %LIBRARIES%\framework\usb\ -SP %LIBRARIES%\framework\pwm\ -SP %LIBRARIES%\framework\adc\ -SP %LIBRARIES%\framework\soft_timer\ -SP %LIBRARIES%\framework\math\ -SP %LIBRARIES%\framework\lcd\

REM ADICIONE SEUS ARQUIVOS .C
SET SRC_FRAMEWORK="timer0.c" "interrupt.c" "gpio.c" "USBdsc.c" "usb.c" "pwm.c" "adc.c" "soft_timer.c" "math.c" "lcd.c"

REM ADICIONE AS SUAS PASTAS COM OS ARQUIVOS .H
SET LIB_SYSTEM=-SP %LIBRARIES%\system\

REM ADICIONE AS SUAS PASTAS COM OS ARQUIVOS .H
SET LIB_TASKS=-SP %LIBRARIES%\tasks\ -SP %LIBRARIES%\tasks\blink_portd\ -SP %LIBRARIES%\tasks\livre\ -SP %LIBRARIES%\tasks\contagem_binaria\ -SP %LIBRARIES%\tasks\controle_pid\ -SP %LIBRARIES%\tasks\controle_on_off\ -SP %LIBRARIES%\tasks\semaforo\ -SP %LIBRARIES%\tasks\painel_comando\

REM ADICIONE SEUS ARQUIVOS .C
SET SRC_TASKS="tasks.c" "blink_portd.c" "livre.c" "contagem_binaria.c" "controle_pid.c" "controle_on_off.c" "semaforo.c" "painel_comando.c"

SET BIBLIOTECAS_H=%LIB_SYSTEM% %LIB_FRAMEWORK% %LIB_TASKS%
SET BIBLIOTECAS_C=%SRC_FRAMEWORK% %SRC_TASKS%

echo %BIBLIOTECAS_H%

%COMPILADOR% -MSF -DBG -p%PIC_MCU% -DL -O11111114 -fo20 -N%ARQUIVO_PROJETO% -SP%ARQUIVOS_DEFINES% -SP%ARQUIVOS_P18% -SP%DIRETORIO_PROJECT% %BIBLIOTECAS_H% -IP%ARQUIVOS_P18% "main.c" %BIBLIOTECAS_C% "USBdsc.c" "__Lib_Math.mcl" "__Lib_MathDouble.mcl" "__Lib_System.mcl" "__Lib_Delays.mcl" "__Lib_USB_genHID.mcl" 
