if active{
    if keyboard_check_pressed(vk_up){
        if (current_button_ind <= 0) current_button_ind = button_length - 1;
        else current_button_ind --;
    }
    
    if keyboard_check_pressed(vk_down){
        if (current_button_ind >= button_length - 1) current_button_ind = 0;
        else current_button_ind ++;
    }
    
    
    if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_rshift) or keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("X")){
        array_action[current_button_ind]()
    }
}