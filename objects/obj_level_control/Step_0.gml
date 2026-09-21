/*
/// Sair para o menu
if keyboard_check_pressed(vk_enter){
    if !instance_exists(obj_transicao){
        var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
        _inst_transi.next_room = rm_selecao
        
        _inst_transi.method_end = function(){
            if instance_exists(obj_selecao_control){
                obj_selecao_control.active = true
            }
        }
    }
}
*/



if global.debug{
    /// Debug para ativar e desativar os upgrades
    /// Tiro fraco
    if keyboard_check_pressed(ord("T")){
        global.upgrade_tiro_fraco = !global.upgrade_tiro_fraco
    }
    
    /// Dash
    if keyboard_check_pressed(ord("Y")){
        global.upgrade_dash = !global.upgrade_dash
    }
    
    /// Tiro carregado
    if keyboard_check_pressed(ord("U")){
        global.upgrade_tiro_carregado = !global.upgrade_tiro_carregado
    }
    
    /// Ataque meele
    if keyboard_check_pressed(ord("I")){
        global.upgrade_meele = !global.upgrade_meele
    }
    
    /// Ataque escudo
    if keyboard_check_pressed(ord("O")){
        global.upgrade_escudo = !global.upgrade_escudo
    }
    
    /// Ataque aura
    if keyboard_check_pressed(ord("P")){
        global.upgrade_aura = !global.upgrade_aura
    }
}