extends CanvasLayer

@onready var score: Label = $HBoxContainer/Score
@onready var lives: Label = $HBoxContainer/Lifes

func _ready():
	update()
	Global.connect("stat_changed", update)
	
func update():
	update_score()
	update_life()

func update_score():
	score.text = str(Global.score)

func update_life():
	lives.text = str(Global.lives)
