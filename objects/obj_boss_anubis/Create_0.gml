// Inherit the parent event
event_inherited();



#region Unique Variables
/// Vida do inimigo
life_max = 200
//life_max = 3
life = life_max

// Velocidade de movimento (Se precisar)
spd_max = 1

// O Upgrade dado ao ser derrotado
my_upgrade = "upgrade_aura"
my_upgrade_title = "Anubis\nNecklace"
my_upgrade_desc = ["An aura around the player...", "that deals damage to enemies"]

// Nome do boss
my_name = "Anubis"

// Minha musica tema
my_music = snd_music_anubis

big_text_yscale_desc = 1.3

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_4AD23127
#endregion

///
timer_att_restart = 3 * FPS_GAME
timer_att = 1 * FPS_GAME

timer_invo_restart = 0.3 * FPS_GAME
timer_invo = 0

#region Estados
estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
        
        
        sprite_index = spr_anubis_idle
        image_index = 0
    }
    
    
    timer_att --
    if (timer_att < 1){
        estado = estado_charge
    }
}

estado_charge = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "charge"){
        estado_txt = "charge"
        
        sprite_index = spr_anubis_charge_attack
        image_index = 0
    }
    
    
    if (image_index >= image_number - 1){
        estado = estado_attack
    }
}

estado_attack = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "attack"){
        estado_txt = "attack"
        
        
        sprite_index = spr_anubis_attack
        image_index = 0
        
        timer_att = timer_att_restart * 1.2
    }
    
    
    /// Invocando uma fileira de ataques
    timer_invo --
    if (timer_invo < 1){
        timer_invo = timer_invo_restart
        
        var _x_gui = camera_get_view_x(view_camera[0])
        var _y_gui = camera_get_view_y(view_camera[0])
        
        var _x_mid = _x_gui + GB_XX + GB_WIDTH / 2
        
        for (var i = 0; i < 7; i++) {
            var _xx = _x_mid + 5 + i * sprite_get_width(spr_shoot_big) * 2.5
        	var _inst_fire = instance_create_depth(_xx, _y_gui + GB_HEIGHT * 0.14, depth - 1, obj_inimigo_hitbox)
            _inst_fire.sprite_index = spr_shoot_big
            _inst_fire.image_xscale = 2
            _inst_fire.image_yscale = 2
            _inst_fire.vspeed = 1.5
        }
        
        for (var i = 0; i < 7; i++) {
            var _xx = _x_mid - 5 - i * sprite_get_width(spr_shoot_big) * 2.5
        	var _inst_fire = instance_create_depth(_xx, _y_gui + GB_HEIGHT * 0.14, depth - 1, obj_inimigo_hitbox)
            _inst_fire.sprite_index = spr_shoot_big
            _inst_fire.image_xscale = 2
            _inst_fire.image_yscale = 2
            _inst_fire.vspeed = 1.5
        }
    }
    
    /// Saindo desse estado
    timer_att --
    if (timer_att < 1){
        timer_att = timer_att_restart
        
        estado = estado_idle
    }
}
#endregion