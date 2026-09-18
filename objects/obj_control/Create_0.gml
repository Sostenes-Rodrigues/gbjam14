//
alarm[0] = 2 * FPS_GAME

#region Shader troca de cores
// Guarda o identificador da primeira cor antiga dentro do shader.
u_color1_old = shader_get_uniform(shd_palette, "color1_old");

// Guarda o identificador da primeira cor nova dentro do shader.
u_color1_new = shader_get_uniform(shd_palette, "color1_new");

// Guarda o identificador da segunda cor antiga dentro do shader.
u_color2_old = shader_get_uniform(shd_palette, "color2_old");

// Guarda o identificador da segunda cor nova dentro do shader.
u_color2_new = shader_get_uniform(shd_palette, "color2_new");

// Guarda o identificador da terceira cor antiga dentro do shader.
u_color3_old = shader_get_uniform(shd_palette, "color3_old");

// Guarda o identificador da terceira cor nova dentro do shader.
u_color3_new = shader_get_uniform(shd_palette, "color3_new");

// Guarda o identificador da quarta cor antiga dentro do shader.
u_color4_old = shader_get_uniform(shd_palette, "color4_old");

// Guarda o identificador da quarta cor nova dentro do shader.
u_color4_new = shader_get_uniform(shd_palette, "color4_new");








// Define a primeira cor antiga usando RGB de 0 até 255.
color1_old = COR1_ORI

// Define a primeira cor nova usando RGB de 0 até 255.
color1_new = global.cor1

// Define a segunda cor antiga usando RGB de 0 até 255.
color2_old = COR2_ORI

// Define a segunda cor nova usando RGB de 0 até 255.
color2_new = global.cor2

// Define a terceira cor antiga usando RGB de 0 até 255.
color3_old = COR3_ORI

// Define a terceira cor nova usando RGB de 0 até 255.
color3_new = global.cor3

// Define a quarta cor antiga usando RGB de 0 até 255.
color4_old = COR4_ORI

// Define a quarta cor nova usando RGB de 0 até 255.
color4_new = global.cor4
#endregion