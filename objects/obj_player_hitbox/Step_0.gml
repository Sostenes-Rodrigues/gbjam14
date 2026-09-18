if type_meele{
    if instance_exists(obj_player){
        x = obj_player.x
        y = obj_player.y
        
        var _inst_ene = instance_place(x, y, obj_inimigo_pai)
        if _inst_ene{
            if (save_inst_hit == noone){
                save_inst_hit = _inst_ene
                
                _inst_ene.life -= damage
                _inst_ene.image_alpha = 0
                _inst_ene.alarm[0] = 1
            }
        }
    }
}
else{
    if place_meeting(x, y, obj_coli){
        instance_destroy(id)
    }
    
    var _inst_ene = instance_place(x, y, obj_inimigo_pai)
        if _inst_ene{
            _inst_ene.life -= damage
            _inst_ene.image_alpha = 0
            _inst_ene.alarm[0] = 1
            
            instance_destroy(id)
        }
}