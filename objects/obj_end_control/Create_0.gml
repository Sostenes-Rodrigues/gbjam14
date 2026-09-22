audio_stop_all()

if !audio_is_playing(snd_music_creditos){
    audio_play_sound(snd_music_creditos, 0, true)
}

alarm[0] = 4 * FPS_GAME