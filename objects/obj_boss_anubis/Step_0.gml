// Inherit the parent event
event_inherited();


if global.upgrade_aura{
    instance_destroy(id)
    
    
    with (obj_player) {
    	estado = estado_idle
    }
}