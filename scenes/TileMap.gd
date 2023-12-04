extends TileMap

var small_dot = preload("res://scenes/small.tscn")
var big_dot: = preload("res://scenes/big.tscn")

func _ready():
	tiles_1()
	tiles_2()
	
func tiles_1():
	var tiles1 = get_used_cells(2)
	#242 small dots
	for tiles in tiles1:
		var map_tiles = map_to_local(tiles)
		var new_dot_instance = small_dot.instantiate() as Area2D
		new_dot_instance.position = map_tiles
		$"../Dots".add_child(new_dot_instance)

func tiles_2():
	var tiles2 = get_used_cells(3)
	for tiles in tiles2:
		var map_tiles = map_to_local(tiles)
		var new_dot_instance = big_dot.instantiate() as Area2D
		new_dot_instance.position = map_tiles
		$"../Dots".add_child(new_dot_instance)

