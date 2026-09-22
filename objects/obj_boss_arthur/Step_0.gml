// Inherit the parent event
event_inherited();


if global.upgrade_meele{
    instance_destroy(id)
    
    
    with (obj_player) {
    	estado = estado_idle
    }
}