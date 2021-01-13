#!/bin/bash
#####################################
# Iniciar Aplicacion con gxmessage  #
#           Leo Virosta             #
#           Version: 2.0            #
#        13 de Enero de 2021        #
#####################################
clear
ans=1

function confirmar() {
  gxmessage --title "Iniciar aplicacion v2.0" \
    --center \
    --buttons "Si:0,No:1" \
  	"Confirma que quieres iniciar $respuesta"
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
	gxmessage --title "Iniciar aplicacion v2.0" \
		--center \
        --nearmouse \
		--buttons "Processing:1,Uiflow M5 Stick:2,Salir:3" \
        "Selecciona una aplicacion"
    
    prog=$?
    if [ $prog -eq 3 ]
    then
        exit 1
    else
	    confirmar
	    if [ $ans -eq 0 ]
	    then
    		case $prog in
	    		1) processing ;;
		    	2) uiflow ;;
        
		    esac
        fi
	fi
done
