// Inherit the parent event
event_inherited();



#region Unique Variables
/// Vida do inimigo
life_max = 200
//life_max = 3
life = life_max

// Velocidade de movimento (Se precisar)
spd_max = 1

// O Upgrade dado ao ser derrotado
my_upgrade = "upgrade_aura"
my_upgrade_title = "Anubis\nNecklace"
my_upgrade_desc = ["An aura around the player that deals damage to enemies"]

// Nome do boss
my_name = "Anubis"

// Minha musica tema
//my_music = snd_music_

// O ID da instancia da porta que devo fecha oa comecar
inst_door = inst_4AD23127
#endregion


#region Estados
estado_idle = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "idle"){
        estado_txt = "idle"
    }
    
    
    
}
#endregion