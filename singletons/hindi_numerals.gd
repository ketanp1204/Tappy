extends Node

var hindi_num_dict = { '0': '०', '1': '१', '2': '२', '3': '३', '4': '४', '5': '५', '6': '६', '7': '७', '8': '८', '9': '९'}

func get_hindi_num_string(v: int) -> String:
	var num_str: String = str(v)
	var hin_str: String = ''
	for c in num_str:
		hin_str += hindi_num_dict[c]
	
	return hin_str
