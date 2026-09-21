// Se o player nao esta no meio da transicao de grid
if !player_in_grid_move{
    // Resetando o uso do escudo
    escudo_enable = false
    
    /// Recebendo os inputs do player
    left = keyboard_check(vk_left)
    right = keyboard_check(vk_right)
    down = keyboard_check(vk_down)
    up = keyboard_check(vk_up)
    
    button_b = keyboard_check(ord("Z"))
    button_a = keyboard_check(ord("X"))
    
    select = keyboard_check_pressed(vk_shift)
    start = keyboard_check_pressed(vk_enter)
    
    /// Se o player teria algum movimento pelos inputs
    spd = spd_max
    spdh = (right - left) * spd
    spdv = (down - up) * spd
    
    // Rodando os estados
    estado()
    
    
    /// Ataque da aura
    if global.upgrade_aura{
        aura_timer_part --
        if (aura_timer_part < 1){
            aura_timer_part = irandom_range(aura_timer_part_min, aura_timer_part_max)
            
            var _dir = irandom(359)
            var _x_dist = lengthdir_x(aura_raio, _dir)
            var _y_dist = lengthdir_y(aura_raio, _dir)
            var _inst_part_aura = instance_create_layer(x + _x_dist, y + _y_dist, "Effect", obj_part_aura)
    
            
            /// Dando dano
            var _inst_enemy = collision_circle(x, y, aura_raio, obj_inimigo_pai, false, true)
            with (_inst_enemy) {
            	life -= 0.03
            }
        }
    }
}


/// Passando o tempo de ficar invencivel
timer_invi = clamp(timer_invi - 1, 0, timer_invi_restart)

/// Passando o tempo do meele
timer_meele = clamp(timer_meele - 1, 0, timer_meele_restart)

// Atualizando a posicao da camera
camera_set_view_pos(view_camera[0], floor(cam_pos_x), floor(cam_pos_y))


// Passando o tempo para usar o dash
timer_dash = clamp(timer_dash - 1, 0, timer_dash_restart)


/// Ajustar profundidade
var _inst_npc_nea = instance_nearest(x, y, obj_npc)
if _inst_npc_nea{
    if (y < _inst_npc_nea.y){
        depth = _inst_npc_nea.depth + 1
    }
    else {
    	depth = _inst_npc_nea.depth - 1
    }
}