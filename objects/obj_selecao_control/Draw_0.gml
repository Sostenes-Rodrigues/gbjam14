draw_set_font(global.font)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)


/// Desenhando os botoes
for (var i = 0; i < button_length; i++) {
	var _xx = room_width * 0.35
    var _yy = room_height * 0.58 + 14 * i
    
    if (i == current_button_ind){
        _xx += 4
        
        //
        draw_rectangle_colour(_xx - 3, _yy - 5, _xx + 90, _yy + 5, global.cor2, global.cor2, global.cor2, global.cor2, false)
        
        /// Sombra
        draw_set_colour(global.cor4)
    	draw_text(_xx + 1, _yy + 1, array_names[i])
        
        /// Texto
        draw_set_colour(global.cor1)
    	draw_text(_xx, _yy, array_names[i])
    }
    else {
        //
        draw_rectangle_colour(_xx - 3, _yy - 5, _xx + 90, _yy + 5, global.cor2, global.cor2, global.cor2, global.cor2, false)
        
        /// Sombra
        draw_set_colour(global.cor1)
    	draw_text(_xx + 1, _yy + 1, array_names[i])
        
        /// Texto
        draw_set_colour(global.cor4)
    	draw_text(_xx, _yy, array_names[i])
    }
}


draw_set_colour(c_white)
draw_set_font(-1)
draw_set_halign(-1)
draw_set_valign(-1)