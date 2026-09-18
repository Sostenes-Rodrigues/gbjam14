
// Ativa o nosso shader.
shader_set(shd_palette);

// Converte a primeira cor antiga e envia para o shader.
shader_set_uniform_f_array(u_color1_old, colour_to_shader(color1_old));

// Converte a primeira cor nova e envia para o shader.
shader_set_uniform_f_array(u_color1_new, colour_to_shader(color1_new));

// Converte a segunda cor antiga e envia para o shader.
shader_set_uniform_f_array(u_color2_old, colour_to_shader(color2_old));

// Converte a segunda cor nova e envia para o shader.
shader_set_uniform_f_array(u_color2_new, colour_to_shader(color2_new));

// Converte a terceira cor antiga e envia para o shader.
shader_set_uniform_f_array(u_color3_old, colour_to_shader(color3_old));

// Converte a terceira cor nova e envia para o shader.
shader_set_uniform_f_array(u_color3_new, colour_to_shader(color3_new));

// Converte a quarta cor antiga e envia para o shader.
shader_set_uniform_f_array(u_color4_old, colour_to_shader(color4_old));

// Converte a quarta cor nova e envia para o shader.
shader_set_uniform_f_array(u_color4_new, colour_to_shader(color4_new));