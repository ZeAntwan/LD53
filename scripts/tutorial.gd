extends Control


func _on_button_pressed():
	Events.emit_signal("gameready")
	visible = false
	pass # Replace with function body.
