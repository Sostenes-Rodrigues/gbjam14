//
image_yscale = 1.4



//
array_texts = ["aa bb cc dd ee ff hh ii kk oo pp", "zddgfjhd ftyguif"]

array_texts_names = ["Player", "???"]

//
array_text_len = array_length(array_texts)

//
array_text_count = 0


// String do texto atual
text = array_texts[array_text_count]

// Quantidade de caracteres no texto atual
text_len = string_length(text)

// Numero de caracteres a serem escritos
text_count = 1


// String Escrita na tela
text_write = ""

// Velocidade do efeito da maquina de escrever
spd_write = 0.2


//
inst_father = noone


restart_variables = function(){
    //
    array_text_len = array_length(array_texts)
    
    // String do texto atual
    text = array_texts[array_text_count]
    
    // Quantidade de caracteres no texto atual
    text_len = string_length(text)
    
    // Numero de caracteres a serem escritos
    text_count = 1
    
    
    // String Escrita na tela
    text_write = ""
}




big_text = ""
big_text_yscale = 1

//
can_continue = false
alarm[0] = 1.5 * FPS_GAME


///
obj_player.spdh = 0
obj_player.spdv = 0
obj_player.image_speed = 0
obj_player.image_index = 0