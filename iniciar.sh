#!/bin/bash
#######################
# Iniciar Aplicacion  #
# Leo Virosta         #
# Version: 1.0        #
# 12 de Enero de 2021 #
#######################
clear
ans=1

function confirmar() {
  dialog --title "Iniciar aplicacion v1.0" \
  	--yesno "Confirma que quieres iniciar $respuesta" 0 0
  ans=$?
}

function processing() {
  cd ~/processing-354
  ./processing  
}

function uiflow() {
  cd ~/uiflow-desktop-ide/bin
  sudo ./uiflow-desktop-ide  
}

# 0 si se responde positivamente y 1 negativamente
while [ $ans -eq 1 ]
do
	respuesta=$(dialog --title "Iniciar aplicacion v1.0" \
		--stdout \
		--radiolist "Selecciona una aplicacion:" 0 0 2 \
			Processing - on \
			"Uiflow M5 Stick" - off)

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
