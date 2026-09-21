if type_meele{
    if instance_exists(inst_father){
        if (speed == 0){
            x = inst_father.x
            y = inst_father.y
        }
    }
}
else{
    if place_meeting(x, y, obj_coli){
        speed = 0
    }
}


if (speed == 0){
    image_angle = 0
}


alarm[0] ++