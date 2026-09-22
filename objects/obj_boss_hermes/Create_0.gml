// Inherit the parent event
event_inherited();



#region Unique Variables
/// Vida do inimigo
life_max = 52
//life_max = 3
life = life_max

// Velocidade de movimento (Se precisar)
spd_max = 2

// O Upgrade dado ao ser derrotado
my_upgrade = "upgrade_dash"
my_upgrade_title = "Hermes's\n Shoes"
my_upgrade_desc = ["Allows you to dash when you press the \“Z\”"]

// Nome do boss
my_name = "Hermes"

// Minha musica tema
my_music = snd_music_hermes

big_text_yscale_desc = 1.2

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_2D436010
#endregion


/// Variaveis para os estados
timer_attack_restart = 1.8 * FPS_GAME
timer_attack = 1 * FPS_GAME
// Direcao do ataque
dir = 0
//
in_att = false

#region Estados
estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
        
        
        spdh = 0
        spdv = 0
        
        //
        sprite_index = spr_hermes_idle
        image_index = 0
        image_speed = 1
        
        //
        timer_attack = timer_attack_restart
    }
    
    
    // Passando otempo dos ataques
    timer_attack --
    if (timer_attack < 1) {
    	// Indo para o estado de ataque
        estado = estado_charge
        
        image_index = 0
    }
}

estado_charge = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "charge"){
        estado_txt = "charge"
        
        
        spdh = 0
        spdv = 0
        
        //
        sprite_index = spr_hermes_charge_dash
        
        //
        in_att = !in_att
        
        //
        if in_att{
            image_speed = 1
        }
        else {
        	image_speed = -1
        }
    }
    
    
    if in_att{
        // Se a animacao chegou ao fim
        if (image_index >= image_number -2){
            estado = estado_dash
        }
    }
    else{
        // Se a animacao chegou ao fim
        if (image_index < 1){
            estado = estado_idle
        }
    }
}

estado_dash = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "dash"){
        estado_txt = "dash"
        
        
        //
        sprite_index = spr_hermes_charge_dash
        image_speed = 0
        image_index = image_number - 1
        
        // A direcao de mim para o player
        dir = point_direction(x, y, obj_player.x, obj_player.y)
        spdh = lengthdir_x(spd_max, dir)
        spdv = lengthdir_y(spd_max, dir)
    }
    
    
    // Se colidir com uma parede
    if place_meeting(x + spdh, y + spdv, obj_coli){
        estado = estado_charge
    }
}
#endregion
