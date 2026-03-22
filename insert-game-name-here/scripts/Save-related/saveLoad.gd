#class_name Saver
extends Control
#Handles saving the game
const SAVE_PATH = "res://save/save"
const IMG_PATH = "res://save/thumbnail"
const VIEWPORT_WIDTH = 1920
const VIEWPORT_HEIGHT = 1080

var img
var saveFileNum:int = 0;

var load_mode = true
#checks if player is clicking on thumbnail to save or to load
#if true then load, if false then save


var saveFileData:SaveData = SaveData.new()
var dialogIndex:int
func open_save():
	img =  get_viewport().get_texture().get_image()
	img.resize(120, 80) # That's the size of the thumbnails for the save files
	load_mode = false
	get_tree().change_scene_to_file("res://scenes/Save-menu-related/save_files.tscn")
	get_tree().reload_current_scene()
	

func change_save_num(save_num:int):
	saveFileNum = save_num
func _save():
	img.save_png(IMG_PATH+str(saveFileNum)+".png")
	ResourceSaver.save(saveFileData, SAVE_PATH+str(saveFileNum)+".tres")

func _load(fileNum):
	if FileAccess.file_exists(SAVE_PATH+str(fileNum)+".tres"):
		saveFileData =  ResourceLoader.load(SAVE_PATH+str(fileNum)+".tres").duplicate(true)

func _ready():
	pass
	
func getThumbnail(saveNum)->String:
	var file_path = IMG_PATH+str(saveNum)+".png";
	if !FileAccess.file_exists(file_path):
		file_path = IMG_PATH+"Start.png";
	return file_path;
func _input(event):
	if event.is_action_pressed("Shoot"):
		open_save()
	if event.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/Save-menu-related/main_menu.tscn")
