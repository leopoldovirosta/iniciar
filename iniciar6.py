#!/usr/bin/python3
#####################################
# Iniciar Aplicacion con Python     #
#           Leo Virosta             #
#           Version: 6.0            #
#        15 de Febrero de 2021      #
#####################################
import gi
import os, sys
try:
    gi.require_version('Gtk', '3.0')
except ValueError:
    exit(1)
from gi.repository import Gtk

dialog = Gtk.Dialog.new()
dialog.set_title('Iniciar aplicacion v6.0')
dialog.add_button('Aceptar', Gtk.ResponseType.YES)
dialog.add_button('Cancelar', Gtk.ResponseType.NO)
box = Gtk.Box.new(Gtk.Orientation.HORIZONTAL, 10)
box.set_margin_top(10)
box.set_margin_bottom(10)
dialog.get_content_area().add(box)

grid = Gtk.Grid.new()
grid.attach(Gtk.Label.new('Selecciona una aplicacion:'), 0, 0, 1, 1)
model = Gtk.ListStore(str)
model.append(['Processing'])
model.append(['Uiflow M5 Stick'])

componente = Gtk.ComboBox.new_with_model(model)
renderer_text = Gtk.CellRendererText()
componente.pack_start(renderer_text, True)
componente.add_attribute(renderer_text, 'text', 0)
componente.set_active(0)
grid.attach(componente, 1, 0, 1, 1)


box.pack_start(grid, True, True, 5)

dialog.show_all()

if dialog.run() == Gtk.ResponseType.YES:
    if (model.get_value(componente.get_active_iter(), 0)) == 'Processing':
        os.system("/home/leo/processing-354/processing 1")
        
        
    exit(0)






































































































































