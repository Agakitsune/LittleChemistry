extends Control

signal _on_pressed(index)

const table = ["H","He","Li","Be","B","C","N","O","F","Ne","Na","Mg","Al","Si","P","S","Cl","Ar","K","Ca","Sc","Ti","V","Cr","Mn","Fe","Co","Ni","Cu","Zn","Ga","Ge","As","Se","Br","Kr","Rb","Sr","Y","Zr","Nb","Mo","Tc","Ru","Rh","Pd","Ag","Cd","In","Sn","Sb","Te","I","Xe","Cs","Ba","La","Ce","Pr","Nd","Pm","Sm","Eu","Gd","Tb","Dy","Ho","Er","Tm","Yb","Lu","Hf","Ta","W","Re","Os","Ir","Pt","Au","Hg","Tl","Pb","Bi","Po","At","Rn","Fr","Ra","Ac","Th","Pa","U","Np","Pu","Am","Cm","Bk","Cf","Es","Fm","Md","No","Lr","Rf","Db","Sg","Bh","Hs","Mt","Ds","Rg","Cn","Nh","Fl","Mc","Lv","Ts","Og"]

@export var scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var index = 0
	for s in table:
		var button = scene.instantiate()
		button.atomic_symbol = s
		button.atomic_n = index + 1
		if index == 0:
			button.position = Vector2(0,0)
		elif index == 1:
			button.position = Vector2(1088,0)
		elif index < 18:
			var rest = (index - 2) % 8
			var line = (index - 2) / 8
			if rest < 2:
				button.position = Vector2(rest * 64, (line + 1) * 64)
			else:
				button.position = Vector2(1088 - ((7 - rest) * 64), (line + 1) * 64)
		elif index < 54:
			var rest = index % 18
			var line = index / 18
			button.position = Vector2(rest * 64, (line + 2) * 64)
		else:
			var rest = (index - 54) % 32
			var line = (index - 54) / 32
			if rest > 2 and rest < 17:
				button.position = Vector2(rest * 64, (line + 7) * 64 + 32)
			else:
				if rest < 3:
					button.position = Vector2(rest * 64, (line + 5) * 64)
				else:
					button.position = Vector2((rest - 14) * 64, (line + 5) * 64)
		add_child(button)
		button._on_pressed_symbol.connect(_on_symbol_pressed)
		index += 1
	pass # Replace with function body.

func _on_symbol_pressed(symbol):
	_on_pressed.emit(table.find(symbol))
