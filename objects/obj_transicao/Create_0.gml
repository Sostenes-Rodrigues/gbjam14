///
timer_piece_effect_restart = 0
timer_piece_effect = 0

//
grid_size = sprite_get_width(spr_quad_grid)

/// Numero de linhas e colunas na grid da transicao
cols = GB_WIDTH div grid_size
lins = GB_HEIGHT div grid_size

grid_number = cols * lins

grid_number_atu_half = 0

///
grid_transi = ds_grid_create(cols, lins)
ds_grid_clear(grid_transi, false)


//
estado = "in"   // out

///
next_color_dark = global.cor1
next_color_light = global.cor4

//
next_room = noone



//
method_mid = function(){
    
}

//
method_end = function(){
    
}