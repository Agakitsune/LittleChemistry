extends Button

signal _on_pressed_symbol(symbol)

@export var main_color: Color

@export var atomic_n: int
@export var atomic_symbol: String

var has_focus: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = main_color
	style.bg_color.a = 0.6
	$Main.set("theme_override_styles/panel", style)
	$N.text = str(atomic_n)
	$Symbol.text = atomic_symbol

func _on_mouse_entered():
	$Main.get("theme_override_styles/panel").bg_color.a = 0.9


func _on_mouse_exited():
	if not has_focus:
		$Main.get("theme_override_styles/panel").bg_color.a = 0.6


func _on_focus_entered():
	has_focus = true


func _on_focus_exited():
	has_focus = false
	$Main.get("theme_override_styles/panel").bg_color.a = 0.6


func _on_pressed():
	_on_pressed_symbol.emit(atomic_symbol)
