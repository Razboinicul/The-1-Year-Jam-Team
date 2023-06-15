extends Node
class_name Interpreter
var script_filename = null
var _script = """var str hi Hello World!
print var:hi"""
var obj
var vars = {}

func run():
	_script = _script.split("\n")
	for i in len(_script):
		run_instruction(i)

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
		var a = args
		var type = args[0]
		var var_name = args[1]
		a.remove(0)
		a.remove(0)
		if type == "str":
			var text = """"""
			for i in a: text += i+" "
			vars[var_name] = text
		else:
			bsod("Var type '"+type+"' does not exist")
	else:
		bsod("Command '"+cmd+"' does not exist")

func bsod(reason):
	var bsod = preload("res://BSOD.tscn").instance()
	bsod.reason = reason
	obj.add_child(bsod)

func check_var(var_name):
	if var_name in vars.keys(): return vars[var_name]
	else: return var_name
