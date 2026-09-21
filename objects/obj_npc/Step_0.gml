#region Mudando o dialogo
/*
if global.upgrade_aura{                 /// ao vencer o penultimo boss
    my_dialogue = ["carro", "sorvete"]
    my_dialogue_names = ["Rodolfo", "Carla"]
    
    my_big_text = ""
}
else if global.upgrade_escudo{          /// ao vencer o quinta boss
    
}
else if global.upgrade_tiro_carregado{  /// ao vencer o quarto boss
    
}
else if global.upgrade_meele{           /// ao vencer o terceiro boss
	
}
else if global.upgrade_dash{            /// ao vencer o segundo boss
	
}
*/


if global.upgrade_tiro_fraco{      /// ao vencer o primeiro boss
    my_dialogue = ["Start by going to the...", "upper-left corner, then proceed...", "clockwise, after the four...", "challengers, move upward."]
    my_dialogue_names = ["Herald", "Herald", "Herald", "Herald"]
}
else {                                  /// ao chegar
	my_dialogue = ["Hello, stranger.", "You must be quite ambitious...", "to enter this dungeon.", "Who are you?", 
    "I am the herald of this place.", "If you are here, you seek to face...", "the champions to have a wish granted.", 
    "Do you have the guts for it?", "Yes, I have nothing left to lose"]
    my_dialogue_names = ["???", "???", "???", "Armando", "Herald", "Herald", "Herald", "Herald", "Armando"]
}
#endregion


if !in_dialogue{
    if place_meeting(x, y, obj_player){
        if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_rshift) or keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("X")){
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
                
                big_text = other.my_big_text
                
                restart_variables()
            }
            
            /// Congelando o player
            with (obj_player) {
            	player_in_grid_move = true
                estado = estado_espera
            }
            
            // Faco o jogador ter o primero poder
            global.upgrade_tiro_fraco = true
        }
    }
}


