// Switch debug, precisa do macro de debug para poder ser mudado
global.debug = false // Mudar depois



/// Cores do jogo atualmente (a sequencia vai da cor mais escura ate a mais clara)
global.cor1 = make_colour_rgb(63, 63, 116)
global.cor2 = make_colour_rgb(61, 73, 145)
global.cor3 = make_colour_rgb(48, 96, 130)
global.cor4 = make_colour_rgb(91, 110, 225)


/// Os upgrades desbloqueados
global.upgrade_tiro_fraco = true
global.upgrade_dash = true
global.upgrade_meele = true
global.upgrade_tiro_carregado = true
global.upgrade_escudo = false
global.upgrade_aura = false


// Game font
global.font = font_add_sprite_ext(spr_font, "!\"$%'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~", false, 1)