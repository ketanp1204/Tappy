extends Control

const SliderMenuOption = preload("res://scenes/options_menu/ui_nodes/slider_menu_option.gd")

@onready var sfx_volume_slider = $MC/VBoxContainer/SFXVolumeSlider
@onready var music_volume_slider = $MC/VBoxContainer/MusicVolumeSlider


var sfx_bus_index
var music_bus_index
var config = ConfigFile.new()


# Emits close signal and saves the options
func go_back():
	save_options()
	SignalManager.close_options.emit()


# Called from outside initializes the options menu
func on_open():
	sfx_volume_slider.h_slider.grab_focus()
	
	sfx_bus_index = AudioServer.get_bus_index(OptionsConstants.sfx_bus_name)
	music_bus_index = AudioServer.get_bus_index(OptionsConstants.music_bus_name)
	
	load_options()

func _on_sfx_volume_slider_value_changed(value):
	set_volume(sfx_bus_index, value)

func _on_music_volume_slider_value_changed(value):
	set_volume(music_bus_index, value)

# Sets the volume for the given audio bus
func set_volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

# Saves the options when the options menu is closed
func save_options():
	config.set_value(OptionsConstants.section_name,OptionsConstants.sfx_volume_key_name, sfx_volume_slider.h_slider.value)
	config.set_value(OptionsConstants.section_name, OptionsConstants.music_volume_key_name, music_volume_slider.h_slider.value)
	
	config.save(OptionsConstants.config_file_name)

# Loads options and sets the controls values to loaded values. Uses default values if config file
# does not exist
func load_options():
	var err = config.load(OptionsConstants.config_file_name)
	
	var sfx_volume = config.get_value(OptionsConstants.section_name, OptionsConstants.sfx_volume_key_name, 1)
	var music_volume = config.get_value(OptionsConstants.section_name, OptionsConstants.music_volume_key_name, 1)
	
	sfx_volume_slider.h_slider.value = sfx_volume
	music_volume_slider.h_slider.value = music_volume

func _input(event):
	if event.is_action_pressed("ui_cancel") && visible:
		accept_event()
		go_back()


func _on_exit_button_pressed():
	get_tree().quit()
