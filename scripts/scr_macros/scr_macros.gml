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
#macro COR1_ORI make_colour_rgb(56, 28, 46)
#macro COR2_ORI make_colour_rgb(105, 109, 109)
#macro COR3_ORI make_colour_rgb(255, 166, 84)
#macro COR4_ORI make_colour_rgb(255, 215, 101)