

spawn_square = function(_map, _ground = false) {
	instance_destroy(obj_square)
	
	var _spacing = sprite_get_width(spr_square_white)
	
	for (var col = 0; col < _map.width; col += 1) {
		for (var row = 0; row < _map.height; row += 1) {
			//show_debug_message(string(col)+" , "+string(row))
			with(instance_create_layer(col * _spacing, row * _spacing, layer, obj_square)) {
				if (_ground) {
					if (row > 128 - 45 && row < 128 - 35)
						set_color(_map.map[col][row], 75, 105);
						//set_color(_map.map[col][row]);
					else
						set_color(_map.map[col][row]);
				} else 
					set_color(_map.map[col][row]);
			}
		}
	}
}

ite				= 0;
ite_rdy			= true;
num_iterations	= 30;
current_level	= 0;
all_maps		= array_create(20, noone);

randomize();
all_maps[0] = new cellular_automata(128, 128, 0.50, all_maps[0]);
all_maps[0].iterate(num_iterations);
spawn_square(all_maps[0], true);