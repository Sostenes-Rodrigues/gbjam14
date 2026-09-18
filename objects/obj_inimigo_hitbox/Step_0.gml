if type_meele{
    if instance_exists(inst_father){
        x = inst_father.x
        y = inst_father.y
    }
}
else{
    if place_meeting(x, y, obj_coli){
        instance_destroy(id)
    }
}