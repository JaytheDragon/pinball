extends Bumper

# so these guys extend Bumper but also use Area2D
# the poiint is to have their own little area surrounding them

class tnt_bumper: 
	var blast:BlastRadius
	# Called when the node enters the scene tree for the first time.
	func _ready() -> void:
		pass # Replace with function body.


	# Called every frame. 'delta' is the elapsed time since the previous frame.
	func _process(delta: float) -> void:
		pass

	# The game logic for exploding in a radius
	func explode() -> void:
		for x:Node2D in blast.get_overlap():
			if x is Bumper: # it was that easy lmao
				pass # now i have to figure out how ot blow stuff up
	# Manages the area that has the explosion	
	# rn thinking on how to put coordinates in
	class BlastRadius extends Area2D:
			var radius = 25 # placeholder #
			
			func get_overlap() -> Array[Node2D]:
				return get_overlapping_bodies()
