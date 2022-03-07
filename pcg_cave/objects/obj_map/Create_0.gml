/// @description Insert description here
// You can write your code in this editor

ite = 0;
ite_rdy = true;

spawn_square = function() {
	instance_destroy(obj_square)
	
	var _spacing = sprite_get_width(spr_square_white)
	
	for (var col=0; col < my_map.width;col += 1){
		for (var row = 0; row < my_map.height; row += 1){
			//show_debug_message(string(col)+" , "+string(row))
			with(instance_create_layer(col * _spacing, row * _spacing, layer, obj_square)) {
				set_color(other.my_map.map[col][row]);	
				r = row;
				c = col;
			}
		}
			
	}
}

randomize()
my_map = new cellular_automata(100, 100, 0.4)
//my_map.iterate();
spawn_square();