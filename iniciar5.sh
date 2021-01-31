#!/bin/bash
#####################################
# Iniciar Aplicacion con YAD        #
#           Leo Virosta             #
#           Version: 5.0            #
#        16 de Enero de 2021        #
#####################################
clear
ans=1

function confirmar() {
  yad --title "Iniciar aplicacion v5.0" \
    --width=250 \
    --mouse \
    --text-align=center \
    --text "Confirma que quieres iniciar $respuesta" \
    --button=Si:0 \
    --button=No:1
  ans=$?
}

function processing() {
  cd ~/processing-354
  ./processing  
}

function uiflow() {
  cd ~/uiflow-desktop-ide/bin
  ./uiflow-desktop-ide  
}

# 0 si se responde positivamente y 1 negativamente
while [ $ans -eq 1 ]
do
	respuesta=$(yad --list \
        --title "Iniciar aplicacion v5.0" \
        --button=Aceptar:0 \
        --button=Cancelar:1 \
        --center \
        --height=200 \
        --text="Selecciona la aplicación que quieres iniciar" \
        --radiolist \
        --print-column=2 \
        --column="" \
        --column="Aplicacion" \
		1 "Processing" 2 "Uiflow M5 Stick")
	
    ans=$?
    if [ $ans -eq 0 ]
    then
    	confirmar
    	if [ $ans -eq 0 ]
		then
		    case "$respuesta" in
		    "Processing") processing ;;
    	    "Uiflow M5 Stick") uiflow ;;
		    esac
        fi
    else
		clear
    	exit 1
	fi
done