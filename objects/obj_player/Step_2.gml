// Colisao horizontal
if place_meeting(x + spdh, y, obj_coli){
    while (!place_meeting(x + sign(spdh), y, obj_coli)) {
    	x += sign(spdh)
    }
    
    if (spdh > 0){
        x = floor(x)
    }
    if (spdh < 0){
        x = ceil(x)
    }
    
    spdh = 0
}

x += spdh


// Colisao vertical
if place_meeting(x, y + spdv, obj_coli){
    while (!place_meeting(x, y + sign(spdv), obj_coli)) {
    	y += sign(spdv)
    }
    
    if (spdv > 0){
        y = floor(y)
    }
    if (spdv < 0){
        y = ceil(y)
    }
    
    spdv = 0
}

y += spdv