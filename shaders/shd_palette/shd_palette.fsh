// Declara as coordenadas X/Y do pixel que estamos processando.
varying vec2 v_vTexcoord;

// Declara a cor que o GameMaker aplica ao desenho.
varying vec4 v_vColour;

// Declara a primeira cor que queremos procurar.
uniform vec4 color1_old;

// Declara a primeira cor pela qual vamos substituir.
uniform vec4 color1_new;

// Declara a segunda cor que queremos procurar.
uniform vec4 color2_old;

// Declara a segunda cor pela qual vamos substituir.
uniform vec4 color2_new;

// Declara a terceira cor que queremos procurar.
uniform vec4 color3_old;

// Declara a terceira cor pela qual vamos substituir.
uniform vec4 color3_new;

// Declara a quarta cor que queremos procurar.
uniform vec4 color4_old;

// Declara a quarta cor pela qual vamos substituir.
uniform vec4 color4_new;

// Função principal executada para cada pixel.
void main()
{
    // Pega a cor do pixel da imagem que está sendo desenhada.
    vec4 pixel = texture2D(gm_BaseTexture, v_vTexcoord);

    // Verifica se o pixel possui exatamente a primeira cor antiga.
    if (pixel.rgb == color1_old.rgb)

        // Se possuir, troca pela primeira cor nova.
        pixel.rgb = color1_new.rgb;

    // Verifica se o pixel possui exatamente a segunda cor antiga.
    if (pixel.rgb == color2_old.rgb)

        // Se possuir, troca pela segunda cor nova.
        pixel.rgb = color2_new.rgb;

    // Verifica se o pixel possui exatamente a terceira cor antiga.
    if (pixel.rgb == color3_old.rgb)

        // Se possuir, troca pela terceira cor nova.
        pixel.rgb = color3_new.rgb;

    // Verifica se o pixel possui exatamente a quarta cor antiga.
    if (pixel.rgb == color4_old.rgb)

        // Se possuir, troca pela quarta cor nova.
        pixel.rgb = color4_new.rgb;

    // Envia o pixel modificado de volta para a tela.
    gl_FragColor = pixel * v_vColour;
}