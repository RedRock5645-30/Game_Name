extends Node2D
@onready var character = $CanvasLayer2/Control/Novel_Character
@onready var dialogUi = $CanvasLayer2/DialogueUI


const dialogLines : Array[String] = [
	"Chunni: Time to face the Fortress of Generic High",
	"Chunni: Wading through the sea of corporeal figures and metal towers, I slowly approach the fated chamber enumerated with 113, the cage in which I am destined to spend my foreseeable days. A–",
	"???: Ah! You must be the new student. I’m Mr. Sensei.",
	"Chunni: Tch. What a loser.",
	"Chunni: Huh, that's an interesting name…",
	"Noelle:...Oopsie! Well, I’m here now aren’t I?",
	"Matty: N-no, what? Invisibility potion ?...No it's just that I’m wearing my…"
	
]

# Called when the node enters the scene tree for the first time.
#okay so saveLoad is basically the save file so anything saveLoad.VARIABLE_NAME is stuff that needs to be saved
#If you need to look at global variables look up singletons
func _ready() -> void:
	#if SaveLoad.saveFileData.dialogIndex == TYPE_NIL:
		#for if smth bad happens it starts from beginning
		#SaveLoad.saveFileData.dialogIndex = 0
	processCurLine()

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
	
func processCurLine():
	var lineInfo = parseLine(dialogLines[SaveLoad.saveFileData.dialogIndex])
	dialogUi.changeLine(lineInfo["speakerName"], lineInfo["dialogLine"])
	character.changeChar(lineInfo["speakerName"])
