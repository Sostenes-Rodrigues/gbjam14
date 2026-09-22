if false{ // Bugado TARGET_DEBUG
    /// Switch debug mode
    if keyboard_check_pressed(vk_f3){
        global.debug = !global.debug
        
        show_debug_overlay(global.debug)
    }
    
    //
    if global.debug{
        if keyboard_check_pressed(ord("R")){
            room_restart()
        }
    }
}