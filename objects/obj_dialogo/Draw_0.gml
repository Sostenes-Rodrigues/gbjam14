//
draw_self()


// Se tem texto para desenhar
if is_string(text){
    draw_set_font(global.font)
    
    var _margem_x = 4
    var _w = string_height("I")
    
    
    /// Desenho o texto atual
    draw_text_ext_colour(bbox_left + _margem_x, bbox_top + 5, text_write, _w * 1.5, sprite_width - 2 * _margem_x, global.cor4, global.cor4, global.cor4, global.cor4, 1)
    
    /// Nome
    if (array_texts_names[0] != ""){
        draw_sprite_ext(sprite_index, 0, bbox_left + 26, bbox_top - 3, 0.45, 0.54, 0, c_white, 1)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_text_colour(bbox_left + 26, bbox_top - 3, array_texts_names[array_text_count], global.cor4, global.cor4, global.cor4, global.cor4, 1)
    }
    
    
    // Big Text
    if (big_text != ""){
        draw_sprite_ext(sprite_index, 0, x, y - 70, 1.05, 1.05 * big_text_yscale, 0, c_white, 1)
        draw_set_colour(global.cor1)
        draw_text_transformed(x + 1, y - 70 + 1, big_text, 2, 2, 0)
        draw_set_colour(global.cor4)
        draw_text_transformed(x, y - 70, big_text, 2, 2, 0)
    }
    
    
    draw_set_halign(-1)
    draw_set_valign(-1)
    
    draw_set_font(-1)
    draw_set_colour(c_white)
}