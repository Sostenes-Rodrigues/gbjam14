/// Fazendo a camera comecar na grid que o player esta
var _start_camera_x = ((x - GB_XX) div GB_WIDTH) * GB_WIDTH
var _start_camera_y =  (y div GB_HEIGHT) * GB_HEIGHT

/// Posicoes da camera controladas pelo player
cam_pos_x = _start_camera_x
cam_pos_y = _start_camera_y

#region Variaveis de objeto
/// Lifes
life_max = 3
life = life_max

/// Inputs do player
left = false
right = false
down = false
up = false

button_b = false
button_a = false

select = false
start = false
 

/// Variaveis do movimento do player
spdh = 0
spdv = 0
spd = 0
spd_max = 1

// Varivel de controle se o player esta no meio da trasicao de grid
player_in_grid_move = false

///
timer_dash_restart = 3 * FPS_GAME
timer_dash = 0

timer_meele_restart = 2.5 * FPS_GAME
timer_meele = 0

//
dir_view = 270

///
timer_invi_restart = 1 * FPS_GAME
timer_invi = 0

///
timer_visual_take_damage_restart = 2
timer_visual_take_damage = 0

/// Para salvar a posicao onde entrei na grid
save_enter_x = xstart
save_enter_y = ystart


#region Escudo
escudo_enable = false

#endregion

#region Ataque da aura
aura_raio = 25
aura_timer_part_min = 2
aura_timer_part_max = 5
aura_timer_part = 0
#endregion
#endregion


#region Metodos
// Para ativar todas as instancias no local da grid atual
enable_insts_grid = function(){
    var _pos_left = camera_get_view_x(view_camera[0]) + GB_XX - 5
    var _pos_top  = camera_get_view_y(view_camera[0]) - 5
    instance_activate_region(_pos_left, _pos_top, GB_WIDTH + 10, GB_HEIGHT + 10, true)
    
    /// Se tem um boss nessa grid, ativo ele
    with (obj_inimigo_pai) {
    	estado = estado_entrar
    }
}


// Para desativar todas as instancias, menos o player e o level_control
disable_insts_grid = function(){
    /// Salvando o id da instancia do level_control
    var _id_level_control = noone
    with (obj_level_control) {
    	_id_level_control = id
    }
    /// Salvando o id da instancia do control
    var _id_control = noone
    with (obj_control) {
    	_id_control = id
    }
    /// Salvando o id da instancia do transicao
    var _id_transicao = noone
    with (obj_transicao) {
    	_id_transicao = id
    }
    
    /// Desativando todas as instancias, menos o player
    instance_deactivate_object(obj_inimigo_pai)
    instance_deactivate_object(obj_coli)
    instance_deactivate_object(obj_npc)
    
    instance_destroy(obj_inimigo_hitbox)
    instance_destroy(obj_player_hitbox)
    
    
    // Ativando a instancia do level_control
    instance_activate_object(_id_level_control)
    
    // Ativando a instancia do control
    instance_activate_object(_id_control)
    
    // Ativando a instancia do transicao
    instance_activate_object(_id_transicao)
    
    // Ativando as instancias do tween
    instance_activate_object(obj_tween)
}


// Metodo para quando a trasicao de grid acabar e avisar que o player pode se mover
callback_player_can_move = function(){
    player_in_grid_move = false
    
    /// Salvando a posicao onde entrei na grid
    save_enter_x = x
    save_enter_y = y
}


// Metodo para mover a cameta
move_camera = function(){
    /// Criando as minhas variaveis
    /// Variaveis para saber a posicao do player na grid
    static __gui_border_right = GB_XX + GB_WIDTH
    static __frames_to_transition = 0.8 * FPS_GAME
    static __len_player_in_transi = 24
    
    var _cam_pos_x = camera_get_view_x(view_camera[0])
    var _cam_pos_y = camera_get_view_y(view_camera[0])
    
    /// Saindo pela direita
    if (bbox_right > _cam_pos_x + __gui_border_right){
        // Impedindo o movimento do player
        player_in_grid_move = true
        
    	// Ajustando a posicao da camera
        tween(id, "cam_pos_x", cam_pos_x + GB_WIDTH, tween_animation.linear, __frames_to_transition, enable_insts_grid)
        
        /// Fazendo o player se mover um poquinho ao passar da room
        spdh = 0
        spdv = 0
        tween(id, "x", x + __len_player_in_transi, tween_animation.linear, __frames_to_transition * 1.2, callback_player_can_move)
        
        // Desativando todas as instancias, menos o player e o level_control
        disable_insts_grid()
        
        // Garantindo que o player nao vai rolar mais nada
        exit
    }
    /// Saindo pela esquerda
    else if (bbox_left < _cam_pos_x + GB_XX){
        // Impedindo o movimento do player
        player_in_grid_move = true
        
    	// Ajustando a posicao da camera
        tween(id, "cam_pos_x", cam_pos_x - GB_WIDTH, tween_animation.linear, __frames_to_transition, enable_insts_grid)
        
        /// Fazendo o player se mover um poquinho ao passar da room
        spdh = 0
        spdv = 0
        tween(id, "x", x - __len_player_in_transi, tween_animation.linear, __frames_to_transition * 1.2, callback_player_can_move)
        
        // Desativando todas as instancias, menos o player e o level_control
        disable_insts_grid()
        
        // Garantindo que o player nao vai rolar mais nada
        exit
    }
    /// Saindo por baixo
    else if (bbox_bottom > _cam_pos_y + GB_HEIGHT){
        // Impedindo o movimento do player
        player_in_grid_move = true
        
    	// Ajustando a posicao da camera
        tween(id, "cam_pos_y", cam_pos_y + GB_HEIGHT, tween_animation.linear, __frames_to_transition, enable_insts_grid)
        
        /// Fazendo o player se mover um poquinho ao passar da room
        spdh = 0
        spdv = 0
        tween(id, "y", y + __len_player_in_transi, tween_animation.linear, __frames_to_transition * 1.2, callback_player_can_move)
        
        // Desativando todas as instancias, menos o player e o level_control
        disable_insts_grid()
        
        // Garantindo que o player nao vai rolar mais nada
        exit
    }
    /// Saindo por cima
    else if (bbox_top < _cam_pos_y){
        // Impedindo o movimento do player
        player_in_grid_move = true
        
    	// Ajustando a posicao da camera
        tween(id, "cam_pos_y", cam_pos_y - GB_HEIGHT, tween_animation.linear, __frames_to_transition, enable_insts_grid)
        
        /// Fazendo o player se mover um poquinho ao passar da room
        spdh = 0
        spdv = 0
        tween(id, "y", y - __len_player_in_transi, tween_animation.linear, __frames_to_transition * 1.2, callback_player_can_move)
        
        // Desativando todas as instancias, menos o player e o level_control
        disable_insts_grid()
        
        // Garantindo que o player nao vai rolar mais nada
        exit
    }
}


// O para definir em quais estados o player pode tomar dano
tomar_dano = function(){
    // Se NAO estou com o tempo de invencivilidade
    if (timer_invi < 1){
        // Se toquei em uma hitbox de um inimigo
        var _inst_hitbox = instance_place(x, y, [obj_inimigo_hitbox, obj_inimigo_pai])
        if _inst_hitbox{
            //
            var _can_hurt = true
            //
            var _escudo_comp_dir = abs((_inst_hitbox.direction + 180) - 360)
            var _dir_player = dir_view
            
            // Executo codigos dentro dele
            with (_inst_hitbox) {
                // Se e a hitbox de um ataque
            	if (object_get_name(object_index) == "obj_inimigo_hitbox"){
                    // Se o ataque nao e meele, o player esta com o escudo segurado e esta no angulo de defesa
                    if !type_meele and other.escudo_enable and (abs(_dir_player - _escudo_comp_dir) < 90){
                        _can_hurt = false
                        
                        instance_destroy(id)
                    }
                }
            }
            
            
            // Posso tomar dano
            if _can_hurt {
            	life --
                
                if (life < 1){
                    estado = estado_death
                }
                
                timer_invi = timer_invi_restart
            }
        }
    }
}


//
move_player = function(){
    /// Corrigindo as velocidades
    var _dir = point_direction(0, 0, (right - left), (down - up))
    spdh = lengthdir_x(spd, _dir)
    spdv = lengthdir_y(spd, _dir)
    
    ///
    if (image_index < 1){
        image_index ++
    }
    
    // Testando se devo mover a camera (sai da grid)
    move_camera()
}


// Para ajustar o sprite e a direcao no estado de movimento
ajust_sprite_dir_move = function(){
    /// Ajustando a sprite e a direcao
    if (spdh > 0){
        sprite_index = spr_player_side
        image_xscale = 1
        dir_view = 0
    }
    else if (spdh < 0){
        sprite_index = spr_player_side
        image_xscale = -1
        dir_view = 180
    }
    else if (spdv > 0){
        sprite_index = spr_player_front
        image_xscale = 1
        dir_view = 270
    }
    else if (spdv < 0){
        sprite_index = spr_player_back
        image_xscale = 1
        dir_view = 90
    }
}

// Teste para ir para o estado_dash
trigger_estado_dash = function(){
    // Se tenho o poder do dash
    if global.upgrade_dash{
        // Se e para ir para o estado de dash
        if button_b{
            // Se acabou o tempo de espera pelo dash
            if (timer_dash < 1){
                // Resetando o tempo de usar o dash
                timer_dash = timer_dash_restart
                
                // Indo para o estado de dash
                estado = estado_dash
            }
        }
    }
}

// Teste para ir para o estado_attack
trigger_estado_attack = function(){
    // Se tenho algum poder de ataque
    if (global.upgrade_tiro_fraco or global.upgrade_tiro_carregado or global.upgrade_meele){
        // Se e para ir para o estado de attack
        if button_a{
            // Indo para o estado de dash
            estado = estado_attack
        }
    }
}
#endregion


#region Estado
estado_txt = ""

estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
        
        /// Zerando as velocidades
        spdh = 0
        spdv = 0
        
        x = floor(x)
        y = floor(y)
        
        /// Zerando a velocidade da sprite e deixando ela no parado
        image_speed = 0
        image_index = 0
    }
    
    
    /// Escudo
    if global.upgrade_escudo{
        escudo_enable = true
    }
    
    // Se o player esta se movendo 
    if ((abs(spdh) > 0) or (abs(spdv) > 0)){
        // Indo para o estado de movimento
        estado = estado_move
    }
    
    // Se e para ir para o estado de ataque
    trigger_estado_attack()
    
    // Teste para o estado dash
    trigger_estado_dash()
    
    // Podendo tomar dano
    tomar_dano()
}

estado_move = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "move"){
        estado_txt = "move"
        
        /// Retornando a velocidade da sprite e deixando ela no move
        image_speed = 1
        image_index = 1
    }
    
    
    // Se o player NAO esta se movendo 
    if !((abs(spdh) > 0) or (abs(spdv) > 0)){
        // Indo para o estado de parado
        estado = estado_idle
    }
    // Se ele ainda esta se movendo
    else{
        // O player pode se mover
        move_player()
        
        // Ajustando a sprite e a direcao
        ajust_sprite_dir_move()
    }
    
    // Se e para ir para o estado de ataque
    trigger_estado_attack()
    
    // Teste para o estado dash
    trigger_estado_dash()
    
    // Podendo tomar dano
    tomar_dano()
}

estado_attack = function(){
    // Para manter a direcao no ataque
    static __dir_attack = 0
    
    /// Timers para todos os ataques
    static __timer_tiro_fraco_restart = 0.4 * FPS_GAME
    static __timer_tiro_fraco = 0
    static __timer_tiro_carregado_restart = 2 * FPS_GAME
    static __timer_tiro_carregado = 0
    
    
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "attack"){
        estado_txt = "attack"
        
        x = floor(x)
        y = floor(y)
        
        /// Retornando a velocidade da sprite e deixando ela no move
        image_speed = 1
        image_index = 1
    }
    
    
    // Se o player esta se movendo 
    if ((abs(spdh) > 0) or (abs(spdv) > 0)){
        /// Retornando a velocidade da sprite e deixando ela no move
        image_speed = 1
        
        move_player()
    }
    else {
    	image_speed = 0
        image_index = 0
    }
    
    #region Attacks
    var _att_depth = 1
    if (dir_view == 270){
        _att_depth = -1
    }
    
    if global.upgrade_tiro_fraco{
        // Passando o tempo para o ataque do tiro fraco
        __timer_tiro_fraco --
        // Se acabou o tempo para o proximo ataque
        if (__timer_tiro_fraco < 1){
            // Resetando o tempo de espera
            __timer_tiro_fraco = __timer_tiro_fraco_restart
            
            // Criando a instancia do tiro
            var _inst_shoot = instance_create_depth(x, y, depth + _att_depth, obj_player_hitbox)
            _inst_shoot.sprite_index = spr_shoot
            _inst_shoot.speed = 2
            _inst_shoot.direction = dir_view
        }
    }
    
    if global.upgrade_tiro_carregado{
        // Passando o tempo para o ataque do tiro fraco
        __timer_tiro_carregado --
        // Se acabou o tempo para o proximo ataque
        if (__timer_tiro_carregado < 1){
            // Resetando o tempo de espera
            __timer_tiro_carregado = __timer_tiro_carregado_restart
            
            // Criando a instancia do tiro
            var _inst_shoot = instance_create_depth(x, y, depth + _att_depth, obj_player_hitbox)
            _inst_shoot.sprite_index = spr_shoot_big
            _inst_shoot.speed = 3
            _inst_shoot.direction = dir_view
            _inst_shoot.damage = 4
        }
    }
    
    if global.upgrade_meele{
        // Se acabou o tempo para o proximo ataque
        if (timer_meele < 1){
            // Resetando o tempo de espera
            timer_meele = timer_meele_restart
            
            // Criando a instancia do ataque meele
            var _inst_meele = instance_create_depth(x, y, depth + _att_depth, obj_player_hitbox)
            _inst_meele.sprite_index = spr_player_attack_meele_side
            _inst_meele.image_angle = dir_view
            _inst_meele.type_meele = true
            _inst_meele.damage = 30
        }
    }
    #endregion
    
    // Saindo do estado de ataque
    if !button_a{
        // Indo para o estado de parado
        estado = estado_idle
    }
    
    // Teste para o estado dash
    trigger_estado_dash()
    
    // Podendo tomar dano
    tomar_dano()
}

estado_dash = function(){
    /// Timer para duracao do dash
    static __timer_dash_restart = 0.2 * FPS_GAME
    static __timer_dash = __timer_dash_restart
    // Direcao do dash
    static __dir_dash = 0
    
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "dash"){
        estado_txt = "dash"
        
        /// Retornando a velocidade da sprite e deixando ela no move
        image_speed = 1
        image_index = 1
        
        x = floor(x)
        y = floor(y)
        
        
        // Resetando a duracao do dash
        __timer_dash = __timer_dash_restart
        
        __dir_dash = dir_view
        
        // Se o player esta se movendo
        if ((abs(spdh) > 0) or (abs(spdv) > 0)){
            __dir_dash = point_direction(0, 0, (right - left), (down - up))
        }
    }
    
    
    // Velocidades para o movimento do dash
    spdh = lengthdir_x(3, __dir_dash)
    spdv = lengthdir_y(3, __dir_dash)
    
    // Passando a duracao do dash
    __timer_dash --
    
    // Se acabou o tempo do dash
    if (__timer_dash < 1){
        // Voltando para o estado parado
        estado = estado_idle
        
        ///
        dash_save_spdh = 0
        dash_save_spdv = 0
    }
}

estado_death = function(){
    //
    static __can_trigger = true
    
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "death"){
        estado_txt = "death"
        
        /// Retornando a velocidade da sprite e deixando ela no
        image_speed = 1
        image_index = 0
        
        x = floor(x)
        y = floor(y)
        
        //
        __can_trigger = true
    }
    
    /// Garrantindo que esteja parado
    spdh = 0
    spdv = 0
    
    // Teria um teste de fim da animacao de morte aqui
    /// Resetando a grid
    if __can_trigger{
        __can_trigger = false
        
        //show_message("ati trigger") CHEGOU
        
        /// Deixando o boss parado
        var _inst_boss = instance_nearest(x, y, obj_inimigo_pai)
        with (_inst_boss) {
        	estado = estado_espera
        }
        
        // Criando a transicao
        var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
        
        with (_inst_transi) {
        	method_mid = function(){
                var _x_player = 0
                var _y_player = 0
                
                
                instance_destroy(obj_inimigo_hitbox)
                
                with (obj_player) {
                	x = save_enter_x
                    y = save_enter_y
                    
                    _x_player = save_enter_x
                    _y_player = save_enter_y
                    
                    
                }
                
                var _inst_boss = instance_nearest(_x_player, _y_player, obj_inimigo_pai)
                with (_inst_boss) {
                	x = xstart
                    y = ystart
                    
                    estado = estado_espera
                }
            }
            
            method_end = function(){
                var _x_player = 0
                var _y_player = 0
                
                with (obj_player) {
                    life = life_max
                    
                	estado = estado_idle
                    
                    _x_player = x
                    _y_player = y
                }
                
                var _inst_boss = instance_nearest(_x_player, _y_player, obj_inimigo_pai)
                with (_inst_boss) {
                    life = life_max
                    
                	estado = estado_entrar
                }
            }
        }
    }
}

estado_espera = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "espera"){
        estado_txt = "espera"
    }
    
    spdh = 0
    spdv = 0
}

estado = estado_idle
#endregion


// Desativando as instancias nao importantes na grid atual
disable_insts_grid()
// Ativando as instancias dessa grid
alarm[0] = 2