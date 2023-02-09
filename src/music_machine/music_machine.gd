extends Node


#DO FUNKCJI MOŻNA DOSTAC SIĘ Z KAŻDEGO MIEJSCA W GRZE PRZEZ ŚCIEŻKĘ: 

#get_tree().root.get_node("main/music_machine")

#^ PO KROPCE WYWOŁUJESZ METODĘ NP. get_tree().root.get_node("main/music_machine").play_music("res://music/Motyw przewodni gry.wav", 0)

func _ready():
		$channel1.stream = load("res://music/ambient.wav")
		$channel1.play()
		
func channel(number) -> AudioStreamPlayer:
		var ch = 0
		match number:
				1: ch = $channel1
				2: ch = $channel2
				3: ch = $channel3
				4: ch = $channel4
		return ch
	
func play_music(channel_nr, music_path, time_to_max_loud) -> void:
		if time_to_max_loud != 0:
				channel(channel_nr).volume_db = -80
		var music_tween = get_node("Tween_play")
		music_tween.interpolate_property(channel(channel_nr), "volume_db", -80, 0, time_to_max_loud, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		music_tween.start()
		channel(channel_nr).stream = load(music_path)
		channel(channel_nr).play()


func play_music_stop() -> void:
		$channel1.stop()
		$channel2.stop()
		$channel3.stop()
		$channel4.stop()

func play_music_start() -> void:
		$channel1.play()
