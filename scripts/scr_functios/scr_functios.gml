// Converte uma cor do formato RGB do GameMaker para os valores usados pelo shader.
function colour_to_shader(_colour)
{
    // Obtém o componente vermelho da cor.
    var _red = colour_get_red(_colour);

    // Obtém o componente verde da cor.
    var _green = colour_get_green(_colour);

    // Obtém o componente azul da cor.
    var _blue = colour_get_blue(_colour);

    // Converte RGB de 0-255 para RGB de 0-1 e retorna os três valores.
    return [_red / 255, _green / 255, _blue / 255];
}