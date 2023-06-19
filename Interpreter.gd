extends Node
class_name Interpreter
var script_filename = null
var _script = """title Test App
var str hi Hello World!
print var:hi
var label test 100 250 var:hi
var rect noice 100 100 15 25"""
var obj
var title_bar
var app_control
var vars = {}

func run():
	_script = _script.split("\n")
	for l in len(_script):
		run_instruction(l)

func run_instruction(i):
	var cmd = _script[i].split(" ")[0]
	var args = _script[i].split(" ")
	for arg in len(args): args[arg] = args[arg].replace("\n", "")
	args.remove(0)
	if cmd == "print":
		var text = """"""
		for i in args: 
			if "var:" in i:
				text += check_var(i.replace("var:", ""))+" "
			else:
				text += i+" "
		print(text)
	elif cmd == "var":
		var x
		var y
		var sx
		var sy
		var a = args
		var type = args[0]
		var var_name = args[1]
		if type == "label":
			x = int(args[2])
			y = int(args[3])
			a.remove(0)
			a.remove(0)
		if type == "rect":
			x = int(args[2])
			y = int(args[3])
			sx = int(args[4])
			sy = int(args[5])
			a.remove(0)
			a.remove(0)
			a.remove(0)
			a.remove(0)
		a.remove(0)
		a.remove(0)
		if type == "str":
			var text = """"""
			for i in a: text += check_var(i.replace("var:", ""))+" "
			vars[var_name] = text
		elif type == "label":
			var text = """"""
			for i in a: text += check_var(i.replace("var:", ""))+" "
			var l = Label.new()
			l.rect_global_position = Vector2(x, y)
			l.text = text
			app_control.add_child(l)
		elif type == "rect":
			var rect = ColorRect.new()
			rect.rect_global_position = Vector2(x, y)
			rect.set_size(Vector2(sx, sy))
			#rect.color = Color.black
			app_control.add_child(rect)
		else:
			bsod("Var type '"+type+"' does not exist")
	elif cmd == "title":
		var text = """"""
		for i in args: text += check_var(i.replace("var:", ""))+" "
		if title_bar != null: title_bar.text = text
	else:
		bsod("Command '"+cmd+"' does not exist")

func bsod(reason):
	var bsod = preload("res://BSOD.tscn").instance()
	bsod.reason = reason
	obj.add_child(bsod)

func check_var(var_name):
	if var_name in vars.keys(): return vars[var_name]
	else: return var_name

func make_mesh(args):
	pass
