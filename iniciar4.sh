#!/bin/bash
#####################################
# Iniciar Aplicacion con Zenity     #
#           Leo Virosta             #
#           Version: 4.0            #
#        16 de Enero de 2021        #
#####################################
clear
ans=1

function confirmar() {
  zenity --question \
    --title "Iniciar aplicacion v4.0" \
    --width=250 \
    --text "Confirma que quieres iniciar $respuesta"
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
	respuesta=$(zenity --list \
        --title "Iniciar aplicacion v4.0" \
        --ok-label="Aceptar" \
        --cancel-label="Cancelar" \
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