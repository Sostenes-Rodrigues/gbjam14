// Rodando o efeito da maquina de escrever
text_count = clamp(text_count + spd_write, 1, text_len)

// Se terminei de escrever o texto
if (text_count >= text_len){
    // Se apertei um botao
    if keyboard_check_pressed(vk_anykey){
        // Se ainda tem outros textos
        if (array_text_count < array_text_len - 1){
            array_text_count += 1
            
            //
            restart_variables()
        }
        // Se acabou o texto
        else {
            io_clear()
            
        	//
            with (obj_player) {
                player_in_grid_move = false
            	estado = estado_idle
            }
            
            //
            with (inst_father) {
            	in_dialogue = false
            }
            
            // Me destruindo
            instance_destroy(id)
        }
    }
}
// Se ainda nao terminei de escrever o texto atual
else{
    // Se apertei um botao
    if keyboard_check_pressed(vk_anykey){
        text_count = text_len
    }
}


//
text_write = string_copy(text, 1, text_count)