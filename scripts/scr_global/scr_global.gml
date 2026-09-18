// Switch debug, precisa do macro de debug para poder ser mudado
global.debug = false // Mudar depois



/// Cores do jogo atualmente (a sequencia vai da cor mais escura ate a mais clara)
global.cor1 = make_colour_rgb(56, 28, 46);
global.cor2 = make_colour_rgb(105, 109, 109)
global.cor3 = make_colour_rgb(255, 166, 84)
global.cor4 = make_colour_rgb(255, 215, 101)


/// Os upgrades desbloqueados
global.upgrade_tiro_fraco = false
global.upgrade_dash = false
global.upgrade_tiro_carregado = false
global.upgrade_meele = false
global.upgrade_escudo = false
global.upgrade_aura = false


// Game font
global.font = font_add_sprite_ext(spr_font, "!\"$%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~", false, 1)