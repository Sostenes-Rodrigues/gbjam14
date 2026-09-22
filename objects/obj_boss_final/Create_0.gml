// Inherit the parent event
event_inherited();


#region Unique Variables
/// Vida do inimigo
life_max = 55
life_max = 3
life = life_max

// Velocidade de movimento (Se precisar)
spd_max = 2

// O Upgrade dado ao ser derrotado
my_upgrade = "end"
my_upgrade_title = ""
my_upgrade_desc = [""]

// Nome do boss
my_name = "?????"

// Minha musica tema
my_music = snd_music_final_boss

big_text_yscale_desc = 1.2

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_59EFCA8E
#endregion


/// Variaveis para os estados
timer_attack_restart = 1.8 * FPS_GAME
timer_attack = 1 * FPS_GAME


#region Estados
estado_entrar = function(){
    // Tempo para o boss se apresentar
    static __timer_enter = 2.5 * FPS_GAME
    
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "entrar"){
        estado_txt = "entrar"
        
        
        spdh = 0
        spdv = 0
        
        // Reiniciando o timer
        __timer_enter = 2.5 * FPS_GAME
        
        /// Parando o player
        with (obj_player) {
        	estado = estado_espera
        }
        
        /// Fechando a porta
        alarm[1] = 30
        
        // Paro todos os sons
        audio_stop_all()
    }
    
    
    __timer_enter --
    if (__timer_enter < 1){
        // Risada
        audio_play_sound(snd_sfx_final_boss_rindo, 5, false)
        
        /// Toco minha musica
        if audio_exists(my_music){
            audio_play_sound(my_music, 0, true)
        }
        
        estado = estado_transf1
    }
}

estado_transf1 = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "transf1"){
        estado_txt = "transf1"
        
        
        sprite_index = npc_revelacao
        image_index = 0
    }
    
    
    if (image_index >= image_number - 1){
        estado = estado_transf2
    }
}

estado_transf2 = function(){
    static __time = 2 * FPS_GAME
    
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "transf2"){
        estado_txt = "transf2"
        
        
        sprite_index = npc_revelacao_rindo
        image_index = 0
    }
    
    
    __time --
    if (__time < 1){
        estado = estado_transf3
    }
}

estado_transf3 = function(){
    static __time_boss = 1.5 * FPS_GAME
    
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "transf3"){
        estado_txt = "transf3"
        
        
        sprite_index = real_face
        image_index = 0
        
        y -= 20
    }
    
    
    __time_boss --
    if (__time_boss < 1){
        estado = estado_fala1
    }
}

estado_fala1 = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "fala1"){
        estado_txt = "fala1"
        
        
        sprite_index = real_face
        image_index = 0
        
        /// Criando a instancia do dialogo
        var _x_gui = camera_get_view_x(view_camera[0])
        var _y_gui = camera_get_view_y(view_camera[0])
        
        var _inst_dia = instance_create_layer(_x_gui + GB_XX + GB_WIDTH / 2, _y_gui + GB_HEIGHT * 0.8, "UI", obj_dialogo)
        with (_inst_dia) {
            inst_father = other.id
            
            array_texts = ["HAHAHA, it really was a great show", "You deserve your wish"]
            array_texts_names = ["?????", "?????"]
            
            method_end = function(){
                if instance_exists(obj_boss_final){
                    var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
                    _inst_transi.next_room = rm_end
                    
                    // Risada
                    audio_play_sound(snd_sfx_final_boss_rindo, 5, false)
                }
            }
            
            restart_variables()
        }
    }
}

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


#endregion