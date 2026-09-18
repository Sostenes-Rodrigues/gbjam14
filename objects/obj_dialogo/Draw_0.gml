//
draw_self()


// Se tem texto para desenhar
if is_string(text){
    draw_set_font(global.font)
    
    var _margem_x = 4
    var _w = string_height("I")
    
    
    /// Desenho o texto atual
    draw_text_ext(bbox_left + _margem_x, bbox_top + 5, text_write, _w * 1.5, sprite_width - 2 * _margem_x)
    
    /// Nome
    draw_sprite_ext(sprite_index, 0, bbox_left + 26, bbox_top - 3, 0.45, 0.54, 0, c_white, 1)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(bbox_left + 26, bbox_top - 3, array_texts_names[array_text_count])
    draw_set_halign(-1)
    draw_set_valign(-1)
    
    
    draw_set_font(-1)
}