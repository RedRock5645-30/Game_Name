extends Node2D
#pageNum starts at zero
var pageNum: int = 0

func _ready() -> void:
	$saveButton.texture_normal = load(SaveLoad.getThumbnail(0+(6*pageNum)))
	$saveButton/Label.text = "Save File "+str(1+(6*pageNum))
	$saveButton2.texture_normal = load(SaveLoad.getThumbnail(1+(6*pageNum)))
	$saveButton2/Label.text = "Save File "+str(2+(6*pageNum))
	$saveButton3.texture_normal = load(SaveLoad.getThumbnail(2+(6*pageNum)))
	$saveButton3/Label.text = "Save File "+str(3+(6*pageNum))
	$saveButton4.texture_normal = load(SaveLoad.getThumbnail(3+(6*pageNum)))
	$saveButton4/Label.text = "Save File "+str(4+(6*pageNum))
	$saveButton5.texture_normal = load(SaveLoad.getThumbnail(4+(6*pageNum)))
	$saveButton5/Label.text = "Save File "+str(5+(6*pageNum))
	$saveButton6.texture_normal = load(SaveLoad.getThumbnail(5+(6*pageNum)))
	$saveButton6/Label.text = "Save File "+str(6+(6*pageNum))
func _on_save_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")
	SaveLoad._load(0+(6*pageNum))


func _on_save_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")
	SaveLoad._load(1+(6*pageNum))

func _on_save_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")
	SaveLoad._load(2+(6*pageNum))

func _on_save_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")
	SaveLoad._load(3+(6*pageNum))


func _on_save_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")
	SaveLoad._load(4+(6*pageNum))


func _on_save_button_6_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/background.tscn")
	SaveLoad._load(5+(6*pageNum))

func reset_save_text()->void:
	$saveButton.texture_normal = load(SaveLoad.getThumbnail(0+(6*pageNum)))
	$saveButton/Label.text = "Save File "+str(1+(6*pageNum))
	$saveButton2.texture_normal = load(SaveLoad.getThumbnail(1+(6*pageNum)))
	$saveButton2/Label.text = "Save File "+str(2+(6*pageNum))
	$saveButton3.texture_normal = load(SaveLoad.getThumbnail(2+(6*pageNum)))
	$saveButton3/Label.text = "Save File "+str(3+(6*pageNum))
	$saveButton4.texture_normal = load(SaveLoad.getThumbnail(3+(6*pageNum)))
	$saveButton4/Label.text = "Save File "+str(4+(6*pageNum))
	$saveButton5.texture_normal = load(SaveLoad.getThumbnail(4+(6*pageNum)))
	$saveButton5/Label.text = "Save File "+str(5+(6*pageNum))
	$saveButton6.texture_normal = load(SaveLoad.getThumbnail(5+(6*pageNum)))
	$saveButton6/Label.text = "Save File "+str(6+(6*pageNum))

func _on_pre_page_btn_pressed() -> void:
	if pageNum>0:
		pageNum-=1
		reset_save_text()


func _on_next_page_btn_pressed() -> void:
	if pageNum<3:
		pageNum+=1
		reset_save_text()
