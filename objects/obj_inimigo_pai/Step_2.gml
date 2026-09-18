// Colisao horizontal
if place_meeting(x + spdh, y, obj_coli){
    while (!place_meeting(x + sign(spdh), y, obj_coli)) {
    	x += sign(spdh)
    }
    spdh = 0
}

x += spdh


// Colisao vertical
if place_meeting(x, y + spdv, obj_coli){
    while (!place_meeting(x, y + sign(spdv), obj_coli)) {
    	y += sign(spdv)
    }
    spdv = 0
}

y += spdv