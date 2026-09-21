// O desenho dos controls
draw_self()


/// Mensagem para sair
draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)


draw_set_colour(global.cor1)
draw_text(x + 1, bbox_bottom + 14 + 1, "Press any\nvalid button\nto continue")

draw_set_colour(global.cor4)
draw_text(x, bbox_bottom + 14, "Press any\nvalid button\nto continue")


draw_set_font(-1)
draw_set_halign(-1)
draw_set_valign(-1)