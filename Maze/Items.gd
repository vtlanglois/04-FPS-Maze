extends Spatial

onready var Item = preload("res://Item/Item.tscn")
onready var Maze = get_node("/root/Game/Maze")
export var count = 50

func _ready():
	var locations = []
	for x in range(Maze.width-2):
		for z in range(Maze.height-2):
			locations.append(Vector3(((x+1)*Maze.tile_size)-1,0.1,((z+1)*Maze.tile_size)-1))
	locations.shuffle()
	for i in range(count):
		var item = Item.instance()
		item.translate(locations[i])
		add_child(item)
