if !instance_exists(obj_transicao){
    if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_rshift) or keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("X")){
        var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
        _inst_transi.next_room = rm_selecao
        
        _inst_transi.method_end = function(){
            if instance_exists(obj_selecao_control){
                obj_selecao_control.active = true
            }
        }
    }
}