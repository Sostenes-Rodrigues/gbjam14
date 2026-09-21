if test_open(){
    open = true
}


/// Se ficar em abrir ou fechar
if open{
    image_index = 1
    mask_index = spr_mask_empty
}
else {
	image_index = 0
    mask_index = -1
}