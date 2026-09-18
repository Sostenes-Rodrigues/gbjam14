/// Vida do inimigo
life_max = 100
life = life_max

/// Variaveis do movimento do player
spdh = 0
spdv = 0
spd = 0
spd_max = 0.5

// O Upgrade dado ao ser derrotado
my_upgrade = ""


#region Estados
estado_txt = ""


estado_idle = function(){
    
}
estado_death = function(){
    // Se e o primeiro frame ao entrar nesse estado
    if (estado_txt != "death"){
        estado_txt = "death"
        
        /// Retornando a velocidade da sprite e deixando ela no
        image_speed = 1
        image_index = 0
        
        x = floor(x)
        y = floor(y)
        
        // Parrando os possiveis danos ao player
        instance_destroy(obj_inimigo_hitbox)
        
        /// Explosao
        
        
        // Se tenho o poder
        if variable_global_exists(my_upgrade){
            // Ativando o upgrade
            variable_global_set(my_upgrade, true)
            
            /// Efeito que ganhou um poder
        }
    }
    
    /// Garrantindo que esteja parado
    spdh = 0
    spdv = 0
}

estado_espera = function(){
    
}

estado = estado_espera
#endregion