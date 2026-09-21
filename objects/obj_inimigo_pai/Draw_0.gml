draw_self()


/// Desenhando o titulo
if (estado_txt == "entrar"){
    var _x_gui = camera_get_view_x(view_camera[0])
    var _y_gui = camera_get_view_y(view_camera[0])
    
    var _x_mid = _x_gui + GB_XX + GB_WIDTH / 2
    var _y_mid = _y_gui + GB_HEIGHT / 2
    
    draw_set_font(global.font)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)

    
    // Big Text
    draw_sprite_ext(sprite_index, 0, x, y - 70, 1.05, 1.05 * big_text_yscale, 0, c_white, 1)
    draw_set_colour(global.cor1)
    draw_text_transformed(_x_mid + 1, _y_mid - 40 + 1, my_name, 2, 2, 0)
    draw_set_colour(global.cor4)
    draw_text_transformed(_x_mid, _y_mid - 40, my_name, 2, 2, 0)
    
    
    draw_set_halign(-1)
    draw_set_valign(-1)
    
    draw_set_font(-1)
    draw_set_colour(c_white)
}