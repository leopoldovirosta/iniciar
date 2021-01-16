#!/bin/bash
#####################################
# Iniciar Aplicacion con Kdialog    #
#           Leo Virosta             #
#           Version: 3.0            #
#        16 de Enero de 2021        #
#####################################
clear
ans=1

function confirmar() {
  kdialog --title "Iniciar aplicacion v3.0" \
    --yesno "Confirma que quieres iniciar $respuesta" 0 0
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
	respuesta=$(kdialog --title "Iniciar aplicacion v3.0" \
        --combobox "Selecciona la aplicación que quieres iniciar" \
		"Processing" "Uiflow M5 Stick")
	
    ans=$?
    if [ $ans -eq 0 ]
    then
        if [ -z "$respuesta" ]
        then
            kdialog --error "no has seleccionado ninguna aplicacion"
            ans=1
        else
    	    confirmar
    	    if [ $ans -eq 0 ]
		    then
			    case "$respuesta" in
				    "Processing") processing ;;
    			    "Uiflow M5 Stick") uiflow ;;
			    esac
		    fi
        fi
    else
		clear
    	exit 1
	fi
done