if active{
    if keyboard_check_pressed(vk_enter){
        var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
        _inst_transi.next_color_dark = global.cor1
        _inst_transi.next_color_light = global.cor4
        
        _inst_transi.next_room = rm_fase1
    }
}