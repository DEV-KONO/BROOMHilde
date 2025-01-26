extends Timer

var maxtime = 2
var mintime = .5

func _ready() -> void:
	randtime()
	timeout.connect(randtime)
	
func _start() -> void:
	randtime()
	start()
	
func randtime():
	set_wait_time(randf_range(mintime, maxtime))


func _on_timeout() -> void:
	pass # Replace with function body.
