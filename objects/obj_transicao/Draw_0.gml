/// Desenhando os quadrados da transicao
// Para baixo e direita
for (var i = 0; i < grid_number; i++) {
	var _col = i div lins
	var _lin = i % lins
    
    
    if ds_grid_get(grid_transi, _col, _lin){
        var _xx = GB_XX + grid_size * _col + camera_get_view_x(view_camera[0])
        var _yy = grid_size * _lin + camera_get_view_y(view_camera[0])
        
        var _color = c_black
        var _sel_color1 = c_black
        var _sel_color2 = c_black
        
        if _col % 2 == 0{
            _sel_color1 = global.cor1
            _sel_color2 = global.cor4
        }
        else{
            _sel_color1 = global.cor4
            _sel_color2 = global.cor1
        }
        
        if (i % 2 == 0) _color = _sel_color1
        else _color = _sel_color2
        
        draw_set_colour(_color)
        draw_rectangle(_xx, _yy, _xx + grid_size - 1, _yy + grid_size - 1, false)
        draw_set_colour(c_white)
    }
}
