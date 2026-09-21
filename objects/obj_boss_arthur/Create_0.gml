// Inherit the parent event
event_inherited();



#region Unique Variables
/// Vida do inimigo
life_max = 90
//life_max = 3
life = life_max

// Velocidade de movimento (Se precisar)
spd_max = 1

// O Upgrade dado ao ser derrotado
my_upgrade = "upgrade_meele"
my_upgrade_title = " Exca-\n libur"
my_upgrade_desc = ["Periodic meele attack...", "alongside the shot"]

// Nome do boss
my_name = "King\nArthur"

// Minha musica tema
my_music = snd_music_arthur

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_77578807
#endregion

/// Variaveis usadas nos estados
timer_att_restart = 3 * FPS_GAME
timer_att = 1 * FPS_GAME

#region Estados
estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
        
        
        sprite_index = spr_arthur_idle
        image_index = 0
        timer_att = timer_att_restart
    }
    
    
    //
    timer_att --
    if (timer_att < 1){
        estado = estado_charge
    }
}

estado_charge = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "charge"){
        estado_txt = "charge"
        
        
        sprite_index = spr_arthur_attack_charge
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
        
        
        sprite_index = spr_arthur_attack
        image_index = 0
    }
    
    
    if (image_index >= image_number - 1){
        // Criando a instancia do ataque meele
        var _inst_meele = instance_create_depth(x, y, depth - 1, obj_inimigo_hitbox)
        _inst_meele.sprite_index = spr_inimigo_attack_meele_side
        _inst_meele.image_index = 2
        _inst_meele.image_speed = 0
        _inst_meele.image_xscale = 3
        _inst_meele.image_yscale = 4.5
        _inst_meele.image_angle = point_direction(x, y, obj_player.x, obj_player.y)
        _inst_meele.direction = _inst_meele.image_angle
        _inst_meele.speed = 2.7
        _inst_meele.type_meele = true
        
        
        estado = estado_idle
    }
}
#endregion