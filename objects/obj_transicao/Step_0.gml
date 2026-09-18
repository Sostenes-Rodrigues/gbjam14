timer_piece_effect --

if (timer_piece_effect < 1){
    timer_piece_effect = timer_piece_effect_restart
    
    
    var _col = grid_number_atu_half div lins
    var _lin = grid_number_atu_half % lins
    
    if (estado == "in"){
        if (grid_number_atu_half < grid_number / 2){
            ds_grid_set(grid_transi, _col, _lin, true)
            ds_grid_set(grid_transi, (cols - 1) - _col, (lins - 1) - _lin, true)
            
            
            grid_number_atu_half ++
            
            _col = grid_number_atu_half div lins
            _lin = grid_number_atu_half % lins
            ds_grid_set(grid_transi, _col, _lin, true)
            ds_grid_set(grid_transi, (cols - 1) - _col, (lins - 1) - _lin, true)
            
            
            grid_number_atu_half ++
        }
        else {
            estado = "out"
            
            ///
            global.cor1 = next_color_dark
            global.cor4 = next_color_light
            
            
            method_mid()
            
            if (next_room != noone){
                room_goto(next_room)
            }
        }
    }
    else if (estado == "out"){
        if (grid_number_atu_half > 0){
            ds_grid_set(grid_transi, _col, _lin, false)
            ds_grid_set(grid_transi, (cols - 1) - _col, (lins - 1) - _lin, false)
            
            grid_number_atu_half --
            
            _col = grid_number_atu_half div lins
            _lin = grid_number_atu_half % lins
            ds_grid_set(grid_transi, _col, _lin, false)
            ds_grid_set(grid_transi, (cols - 1) - _col, (lins - 1) - _lin, false)
            
            grid_number_atu_half --
        }
        else{
            //
            method_end()
            
            instance_destroy(id)
        }
    }
}