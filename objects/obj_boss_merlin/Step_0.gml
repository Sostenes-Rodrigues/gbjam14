// Inherit the parent event
event_inherited();


/// Bloqueando os tiros do player
var _inst_shot = collision_circle(x, y - sprite_height / 2, 25, obj_player_hitbox, false, true)
with (_inst_shot) {
	instance_destroy(_inst_shot)
}