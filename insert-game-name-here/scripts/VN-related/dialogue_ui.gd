extends Control

@onready var dialogLine = $Dialogue_Box/DialogueLine
@onready var speakerName = $SpeakerControl/SpeakerName


const ANIMATION_SPEED = 30;
var animateText:bool = false
var currVisibleCharacter : int = 0

func _process(delta: float) -> void:
	if animateText:
		if dialogLine.visible_ratio<1:
			dialogLine.visible_ratio += (1.0/dialogLine.text.length())*(ANIMATION_SPEED*delta)
			currVisibleCharacter = dialogLine.visible_characters
		else:
			animateText = false

func changeLine(speaker:String, dialog:String):
	speakerName.text = speaker
	dialogLine.text = dialog
	currVisibleCharacter = 0
	dialogLine.visible_characters = 0
	animateText = true

func skipTextAnimation():
	dialogLine.visible_ratio = 1
