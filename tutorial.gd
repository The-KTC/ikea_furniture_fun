extends Node2D
var storyline=["Welcome, one day you've bought a desk but you're too daft to build it yourself. You don't know what to do, so you frantically call the Ikea head office in Sweden...                                     (press your left mouse button to continue)",
"They said on the phone that it was very easy to build and that you were just too incompetent to do it. You hung up in anger and are now sulking about what to do. But then...",
"you realise that you can practise building by playing this wonderful game, so you're going to start building some cabinets right away...."]
var textlabel=null
var char_index = 0
var typing_speed = 8 # höher = langsamer
var tmp=0
var current_text=""
var storylineTextNummer=0
# Called when the node enters the scene tree for the first time.
func _ready():
	textlabel=get_node("Node/textlabel")
	tmp=typing_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if storylineTextNummer == 3:
		get_tree().change_scene_to_file("res://level1.tscn")
	elif char_index < storyline[storylineTextNummer].length():
		if tmp <= 0:
			current_text += storyline[storylineTextNummer][char_index]
			char_index += 1
			textlabel.text = current_text
			#print(current_text)
			#await get_tree().create_timer(typing_speed).timeout
			tmp=typing_speed
		else:
			tmp-=1

func _input(event):
	if event.is_action_pressed("mouseLeft"):
		textlabel.text=""
		current_text=""
		char_index = 0
		storylineTextNummer+=1
		if storylineTextNummer==1:
			get_node("Node/man1").visible = false
			get_node("Node/man2").visible=true
		if storylineTextNummer==2:
			get_node("Node/man2").visible = false
			get_node("Node/man3").visible=true
