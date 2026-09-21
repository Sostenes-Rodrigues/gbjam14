// Inherit the parent event
event_inherited();



#region Unique Variables
/// Vida do inimigo
life_max = 220
//life_max = 3
life = life_max

// Velocidade de movimento (Se precisar)
spd_max = 1

// O Upgrade dado ao ser derrotado
my_upgrade = "upgrade_escudo"
my_upgrade_title = "Olympus\nShield"
my_upgrade_desc = ["Standing still without attacking activates the shield, it blocks projectiles in front of you"]

// Nome do boss
my_name = "Athena"

// Minha musica tema
//my_music = snd_music_

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_54BF4E91
#endregion

///
timer_attack_restart = 2 * FPS_GAME
timer_attack = timer_attack_restart

#region Estados
estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
        
        
        sprite_index = spr_atenas_idle
        
        timer_attack = timer_attack_restart
    }
    
    
    timer_attack --
    if (timer_attack < 1){
        //estado = choose(estado_attack, estado_shield)
        estado = estado_attack
    }
}

estado_attack = function(){
    static __can_attack = true
    
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "attack"){
        estado_txt = "attack"
        
        
        sprite_index = spr_atenas_attack
        image_index = 0
        
        timer_attack = timer_attack_restart
        
        __can_attack = true
    }
    
    
    if (image_index == 13){
        if __can_attack{
            __can_attack = false
            
            var _inst_lanca = instance_create_depth(x - 10, y - 10, depth - 1, obj_boss_athena_lanca)
            with (_inst_lanca) {
                speed = 1.5
            	direction = point_direction(x, y, obj_player.x, obj_player.y)
                image_angle = direction
            }
        }
    }
    
    if (image_index >= image_number - 1){
        // Voltando ao estado parado
        estado = estado_idle
    }
}

estado_shield = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "shield"){
        estado_txt = "shield"
        
        
        sprite_index = spr_atenas_defesa
        image_index = 0
        
        timer_attack = timer_attack_restart
    }
    
    
    if (image_index >= image_number - 1){
        timer_attack --
        
        if (timer_attack < 1){
            estado = estado_idle
        }
    }
}
#endregion