/// Escudo
if (dir_view == 90){
    if global.upgrade_escudo{
        if escudo_enable{
            draw_sprite_ext(spr_escudo_segurado, 0, x, y, 1, 1, dir_view, c_white, 1)
        }
        else {
        	draw_sprite_ext(spr_escudo_guardado, 0, x, y, 1, 1, dir_view, c_white, 1)
        }
    }
}


/// Me desenhando + efeito de dano
// Se e para rodar o efeito de tomar dano
if (timer_invi > 0){
    timer_visual_take_damage --
    if (timer_visual_take_damage < 1){
        timer_visual_take_damage = timer_visual_take_damage_restart
        
        draw_self()
    }
}
else {
	draw_self()
}


/// Escudo
if (dir_view != 90){
    if global.upgrade_escudo{
        if escudo_enable{
            draw_sprite_ext(spr_escudo_segurado, 0, x, y, 1, 1, dir_view, c_white, 1)
        }
        else {
        	draw_sprite_ext(spr_escudo_guardado, 0, x, y, 1, 1, dir_view, c_white, 1)
        }
    }
}