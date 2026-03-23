extends Node2D
@onready var character = $CanvasLayer2/Control/Novel_Character
@onready var dialogUi = $CanvasLayer2/DialogueUI


var dialogLines : Array= []

# Called when the node enters the scene tree for the first time.
#okay so saveLoad is basically the save file so anything saveLoad.VARIABLE_NAME is stuff that needs to be saved
#If you need to look at global variables look up singletons
func _ready() -> void:
	#if SaveLoad.saveFileData.dialogIndex == TYPE_NIL:
		#for if smth bad happens it starts from beginning
		#SaveLoad.saveFileData.dialogIndex = 0
	dialogLines = load_dialogue("res://scripts/Story/chapter1.json")
	
	processCurLine()
func load_dialogue(file_path):
	#Check if file exists
	if not FileAccess.file_exists(file_path):
		print(file_path+" does not exist")
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	#parse json format into text
	var json_content = JSON.parse_string(content)
	#returns the dialogue
	return json_content
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("nextLine"):
		if dialogUi.animateText:
			#causes the text to immediately reveal itself
			dialogUi.skipTextAnimation()
		elif (SaveLoad.saveFileData.dialogIndex<len(dialogLines)-1):
			#This is the code that outputs the text one letter at a time, makes it look like they are talking
			SaveLoad.saveFileData.dialogIndex+=1
			processCurLine()
		else:
			SaveLoad.saveFileData.dialogIndex = 0
	
	
func parseLine(line: String):
	var lineInfo = line.split(":")
	assert(len(lineInfo)>=2)
	return {
		"speakerName": lineInfo[0],
		"dialogLine": lineInfo[1]
	}

#Switches out the character and speaker text to match character talking
func processCurLine():
	var lineInfo = parseLine(dialogLines[SaveLoad.saveFileData.dialogIndex])
	dialogUi.changeLine(lineInfo["speakerName"], lineInfo["dialogLine"])
	character.changeChar(lineInfo["speakerName"])
