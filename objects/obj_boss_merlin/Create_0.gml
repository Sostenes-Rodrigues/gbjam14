// Inherit the parent event
event_inherited();



#region Unique Variables
/// Vida do inimigo
life_max = 120 // Rebote dar 30 de dano
//life_max = 3
life = life_max

// Velocidade de movimento (Se precisar)
spd_max = 1

// O Upgrade dado ao ser derrotado
my_upgrade = "upgrade_tiro_carregado"
my_upgrade_title = " Magic\n Staff"
my_upgrade_desc = ["Charge shot alongside the base shot"]

// Nome do boss
my_name = "\nMerlin\nthe\nWizard"

// Minha musica tema
my_music = snd_music_merlin

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_5148D04A
#endregion

///
timer_to_attack = 1 * FPS_GAME
timer_att_restart = 3 * FPS_GAME
timer_att = timer_att_restart

#region Estados
estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
    }
    
    
    timer_to_attack --
    if (timer_to_attack < 1){
        estado = estado_attack
    }
}

estado_attack = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "attack"){
        estado_txt = "attack"
        
        
        sprite_index = spr_merlin_atack
        timer_att = timer_att_restart
    }
    
    
    timer_att --
    if (timer_att < 1){
        timer_att = timer_att_restart
        
        var _fire = instance_create_depth(x - 3, y - sprite_height * 0.7, depth - 1, obj_boss_merlin_fire)
        _fire.sprite_index = spr_shoot_big
        _fire.speed = 1.8
        _fire.image_xscale = 3
        _fire.image_yscale = 3
        _fire.inst_target = obj_player
    }
}
#endregion