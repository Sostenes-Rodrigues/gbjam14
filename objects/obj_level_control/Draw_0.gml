var _x_gui = camera_get_view_x(view_camera[0])
var _y_gui = camera_get_view_y(view_camera[0])


/// Vida do player
if instance_exists(obj_player){
    var _life = obj_player.life
    
    for (var i = 0; i < _life; i++) {
    	var _margem_x = 9 * i
        draw_sprite(spr_player_life, 0, 7 + GB_XX + _margem_x + _x_gui, 7 + _y_gui)
    }
}


/// As paredes da tela
draw_sprite_stretched(spr_level_background, 0, _x_gui, _y_gui, GB_XX, GB_HEIGHT)
draw_sprite_stretched(spr_level_background, 0, _x_gui + camera_get_view_width(view_camera[0]) - GB_XX, _y_gui, GB_XX, GB_HEIGHT)