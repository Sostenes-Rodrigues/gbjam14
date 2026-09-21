/// Vida do inimigo
life_max = 3
life = life_max

/// Variaveis do movimento do player
spdh = 0
spdv = 0
spd = 0
spd_max = 0.5

// O Upgrade dado ao ser derrotado
my_upgrade = "upgrade_tiro_fraco"
my_upgrade_title = "Garrafa"
my_upgrade_desc = ["faz alguma porra"]

// Nome do boss
my_name = "Noone"

big_text_yscale = 1

// Minha musica tema
my_music = noone

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_2D436010


#region Estados
estado_txt = ""


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
        // Vou para o estado de parado
        estado = estado_idle
        
        /// Toco minha musica
        if audio_exists(my_music){
            audio_play_sound(my_music, 0, true)
        }
        
        /// Player pode se mover
        with (obj_player) {
        	estado = estado_idle
        }
    }
}
estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
        
        spdh = 0
        spdv = 0
    }
}
estado_death = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "death"){
        estado_txt = "death"
        
        
        spdh = 0
        spdv = 0
        
        /// Retornando a velocidade da sprite e deixando ela no
        image_speed = 1
        image_index = 0
        
        x = floor(x)
        y = floor(y)
        
        // Parrando os possiveis danos ao player
        instance_destroy(obj_inimigo_hitbox)
        
        /// Explosao
        show_debug_message("Boss Explodindo")
        
        // Se tenho o poder
        if variable_global_exists(my_upgrade){
            // Ativando o upgrade
            variable_global_set(my_upgrade, true)
            
            /// Congelando o player
            with (obj_player) {
            	player_in_grid_move = true
                estado = estado_espera
            }
            
            /// Efeito que ganhou um poder
            /// Criando a instancia do dialogo
            var _x_gui = camera_get_view_x(view_camera[0])
            var _y_gui = camera_get_view_y(view_camera[0])
            
            var _inst_dia = instance_create_layer(_x_gui + GB_XX + GB_WIDTH / 2, _y_gui + GB_HEIGHT * 0.8, "UI", obj_dialogo)
            with (_inst_dia) {
                inst_father = other.id
                
            	array_texts = other.my_upgrade_desc
                big_text = other.my_upgrade_title
                array_texts_names = [""]
                
                restart_variables()
            }
        }
        
        /// Abrindo a porta
        var _inst_door_nea = inst_door
        _inst_door_nea.open = true
    }
    
    
    /// Garrantindo que esteja parado
    spdh = 0
    spdv = 0
    
    // Paro todos os sons
    audio_stop_all()
    
    // Volto a musica padrao
    //audio_play_sound(snd_music_, 0, true)
    
    // Me destruindo
    instance_destroy(id)
}

estado_espera = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "espera"){
        estado_txt = "espera"
        
        spdh = 0
        spdv = 0
    }
}

estado = estado_espera
#endregion