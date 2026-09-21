// Numero de quadros do jogo
#macro FPS_GAME game_get_speed(gamespeed_fps)

/// Control Debug Mode
#macro TARGET_DEBUG 0
#macro target_debug:TARGET_DEBUG 1



/// Tamanho da tela do meio
#macro GB_WIDTH 160
#macro GB_HEIGHT 144

#macro GB_XX (256 - GB_WIDTH) / 2


/// As cores originais
#macro COR1_ORI make_colour_rgb(63, 63, 116)
#macro COR2_ORI make_colour_rgb(61, 73, 145)
#macro COR3_ORI make_colour_rgb(48, 96, 130)
#macro COR4_ORI make_colour_rgb(91, 110, 225)