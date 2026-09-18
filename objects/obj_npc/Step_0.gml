if !in_dialogue{
    if place_meeting(x, y, obj_player){
        if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_lshift) or keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("X")){
            // Indicando que estou no dialogo
            in_dialogue = true
            
            /// Criando a instancia do dialogo
            var _x_gui = camera_get_view_x(view_camera[0])
            var _y_gui = camera_get_view_y(view_camera[0])
            
            var _inst_dia = instance_create_layer(_x_gui + GB_XX + GB_WIDTH / 2, _y_gui + GB_HEIGHT * 0.8, "UI", obj_dialogo)
            with (_inst_dia) {
                inst_father = other.id
                
            	array_texts = other.my_dialogue
                array_texts_names = other.my_dialogue_names
                
                restart_variables()
            }
            
            /// Congelando o player
            with (obj_player) {
            	player_in_grid_move = true
                estado = estado_espera
            }
        }
    }
}


