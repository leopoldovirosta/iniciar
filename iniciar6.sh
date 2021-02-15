#!/bin/bash
#####################################
# Iniciar Aplicacion con Python        #
#           Leo Virosta             #
#           Version: 6.0            #
#        15 de Febrero de 2021        #
#####################################

import gi
try:
    gi.require_version('Gtk', '3.0')
except ValueError:
    exit(1)
from gi.repository import Gtk

if __name__== '__main__':
    dialog = Gtk.MessageDialog(message_type=Gtk.MessageType.ERROR,text='Este es el mensaje')
    dialog.set_title('Iniciar aplicacion v6.0')
    try:
        dialog.run()
    except KeyboardInterrupt:
        pass