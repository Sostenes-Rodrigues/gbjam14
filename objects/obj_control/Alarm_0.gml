var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
_inst_transi.next_color_dark = global.cor1
_inst_transi.next_color_light = global.cor4

_inst_transi.next_room = rm_selecao

_inst_transi.method_end = function(){
    if instance_exists(obj_selecao_control){
        obj_selecao_control.active = true
    }
}