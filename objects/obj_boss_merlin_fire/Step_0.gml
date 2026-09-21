// Inherit the parent event
event_inherited();


if instance_exists(inst_target){
    direction = point_direction(x, y, inst_target.x, inst_target.y)
    
    var _inst_shot = instance_place(x, y, obj_player_hitbox)
    with (_inst_shot) {
    	if type_meele{
            other.inst_target = obj_boss_merlin
        }
    }
}


if (inst_target == obj_player){
    if place_meeting(x - hspeed, y - vspeed, obj_player){
        instance_destroy()
    }
}

if (inst_target == obj_boss_merlin){
    if place_meeting(x, y, obj_boss_merlin){
        obj_boss_merlin.life -= 30
        obj_boss_merlin.image_alpha = 0
        obj_boss_merlin.alarm[0] = 1
        
        if (obj_boss_merlin.life < 1){
            obj_boss_merlin.estado = obj_boss_merlin.estado_death
        }
        
        instance_destroy(id)
    }
}