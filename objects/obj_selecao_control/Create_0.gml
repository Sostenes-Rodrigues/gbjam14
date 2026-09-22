if !audio_is_playing(snd_music_menu){
    audio_play_sound(snd_music_menu, 0, true)
}


// Para nao poder ser funcional ate acabar a transicao
active = false


#region Metodos das acoes dos botoes
action_play = function(){
    active = false
    
    var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
    _inst_transi.next_room = rm_fase1
}

action_controls = function(){
    active = false
    
    var _inst_transi = instance_create_layer(0, 0, "Transi", obj_transicao)
    _inst_transi.next_room = rm_view_controls
}

action_fullscreen = function(){
    if window_get_fullscreen(){
        window_set_fullscreen(false)
    }
    else{
        window_set_fullscreen(true)
    }
}

action_exit = function(){
    active = false
    
    game_end()
}
#endregion


/// Nomes e acoes de cada botao
array_names  = ["Play", "Controls", "Fullscreen", "Exit"]
array_action = [action_play, action_controls, action_fullscreen, action_exit]


// Numero de botoes
button_length = array_length(array_names)

// Selecao do botao atual
current_button_ind = 0