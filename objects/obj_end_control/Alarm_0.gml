/// Criando a instancia do dialogo
var _x_gui = camera_get_view_x(view_camera[0])
var _y_gui = camera_get_view_y(view_camera[0])

var _inst_dia = instance_create_layer(_x_gui + GB_XX + GB_WIDTH / 2, _y_gui + GB_HEIGHT * 0.8, "UI", obj_dialogo)
with (_inst_dia) {
    inst_father = other.id
    
    array_texts = ["A game made for GBJam 14", "Programming: Sostenes Rodrigues", "Art: Joao Antonio", "Music and SFX: Juan", "Engine: Game Maker Studio 2", "Thanks for playing!"]
    array_texts_names = [""]
    
    method_end = function(){
        var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
        _inst_transi.next_room = rm_selecao
        
        _inst_transi.method_end = function(){
            if instance_exists(obj_selecao_control){
                obj_selecao_control.active = true
            }
        }
        
        global.upgrade_aura = false
        global.upgrade_dash = false
        global.upgrade_tiro_fraco = false
        global.upgrade_meele = false
        global.upgrade_tiro_carregado = false
        global.upgrade_escudo = false
        
        audio_stop_all()
    }
    
    restart_variables()
}