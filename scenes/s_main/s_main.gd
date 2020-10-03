extends Spatial

#-----------------SCENE--SCRIPT------------------#
#    Close your game faster by clicking 'Esc'    #
#   Change mouse mode by clicking 'Shift + F1'   #
#------------------------------------------------#

export var fast_close := true
export var debug_mode := true
var mouse_mode: String = "CAPTURED"

##################################################

func _ready() -> void:
	if fast_close:
		if debug_mode:
			print("DEBUG MODE ACTIVATED")
		print("[ESC] to close")
		print("[SHIFT] + [F1] to uncapture mouse")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and fast_close:
		get_tree().quit() # bye

	if event.is_action_pressed("mouse_input") and fast_close:
		match mouse_mode: # Switch kw in Godot
			"CAPTURED":
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				mouse_mode = "VISIBLE"
			"VISIBLE":
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				mouse_mode = "CAPTURED"
