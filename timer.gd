extends Timer

var maxtime = 5
var mintime = 1

func _ready() -> void:
	randtime()
	timeout.connect(randtime)
	
func _start() -> void:
	randtime()
	start()
	
func randtime():
	set_wait_time(randf_range(mintime, maxtime))
