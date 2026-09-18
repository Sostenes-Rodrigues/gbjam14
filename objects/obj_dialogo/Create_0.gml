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
spd_write = 0.3


//
inst_father = noone


restart_variables = function(){
    // String do texto atual
    text = array_texts[array_text_count]
    
    // Quantidade de caracteres no texto atual
    text_len = string_length(text)
    
    // Numero de caracteres a serem escritos
    text_count = 1
    
    
    // String Escrita na tela
    text_write = ""
}