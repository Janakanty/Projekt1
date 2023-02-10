extends Node


#DO FUNKCJI MOŻNA DOSTAC SIĘ Z KAŻDEGO MIEJSCA W GRZE PRZEZ ŚCIEŻKĘ: 

#get_tree().root.get_node("main/music_machine")

#^ PO KROPCE WYWOŁUJESZ METODĘ NP. get_tree().root.get_node("main/music_machine").play_music("res://music/Motyw przewodni gry.wav", 0)

func _ready():
		play_music(2, "res://music/scena 0.wav", 0)
		
func chanel(number) -> AudioStreamPlayer:
		var ch = 0
		match number:
				1: ch = $chanel1
				2: ch = $chanel2
				3: ch = $chanel3
				4: ch = $chanel4
		return ch
	
func play_music(chanel_nr, music_path, time_to_max_loud) -> void:
		var chanel = chanel(chanel_nr)
		if time_to_max_loud != 0:
				chanel.volume_db = -80
		var music_tween = get_node("Tween_louder")
		music_tween.interpolate_property(chanel, "volume_db", -80, 0, time_to_max_loud, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		music_tween.start()
		chanel.stream = load(music_path)
		chanel.play()


func stop_music(chanel_nr, time_to_quiet) -> void:
		var chanel = chanel(chanel_nr)
		var music_tween = get_node("Tween_quiter")
		music_tween.interpolate_property(chanel, "volume_db", 0, -80, time_to_quiet, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		music_tween.start()
		yield($Tween_quiter,"tween_completed")
		chanel.stop()
