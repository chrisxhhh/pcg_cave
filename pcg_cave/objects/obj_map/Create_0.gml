/// @description Insert description here
// You can write your code in this editor

ite = 0;
ite_rdy = true;

spawn_square = function(_map) {
	instance_destroy(obj_square)
	
	var _spacing = sprite_get_width(spr_square_white)
	
	for (var col = 0; col < _map.width; col += 1) {
		for (var row = 0; row < _map.height; row += 1) {
			//show_debug_message(string(col)+" , "+string(row))
			with(instance_create_layer(col * _spacing, row * _spacing, layer, obj_square)) {
				set_color(_map.map[col][row]);	
				r = row;
				c = col;
			}
		}
	}
}

randomize();
my_map = new cellular_automata(128, 128, 0.50);
my_map.iterate(30);
//spawn_square(my_map);

map2 = new cellular_automata(128, 128, 0.50, my_map);
map2.iterate(30);

map3 = new cellular_automata(128, 128, 0.50, map2);
map3.iterate(30);
