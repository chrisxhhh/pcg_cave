// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cellular_automata(_width, _height, _spawn_chance, _prev = noone) constructor {
	
	width		= _width;
	height		= _height;
	special_x	= irandom_range(23, 103);
	special_y	= irandom_range(43, 83);
	prev		= _prev;
	
	//create initial grid in a nested array with initial value 0
	map = array_create(width, 0);
	for (var i = 0; i < width; ++i) {
		map[i] = array_create(height, 0);
	}
	
	initial = array_create(width, 0);
	for (var i = 0; i < width; ++i) {
		initial[i] = array_create(height, 0);
	}
	
	final = array_create(98, 0);
	for (var i = 0; i < 98; ++i) {
		initial[i] = array_create(98, 0);
	}
	
	//First room generation
	if (_prev == noone) {
		for (var col = width - 5; col >= 5; --col) {
			for (var row = height - 5; row >= 5; --row) {
				if row < 80
					map[col][row] = 70;
				else
					map[col][row] = random(1) <= _spawn_chance ? 60 : 10;
				initial[col][row] = map[col][row];
			}
		}
	}
	
	//Later room generation
	else {
		
		for (var col = width - 5; col >= 5; --col) {
			for (var row = 37; row >= 5; --row) {
				map[col][row] = prev.initial[col][width - row];
				initial[col][row] = map[col][row];
			}
		}
		
		for (var col = width - 5; col >= 5; --col) {
			for (var row = height - 5; row >= 38; --row) {
				map[col][row] = random(1) <= _spawn_chance ? 60 : 10;
				initial[col][row] = map[col][row];
			}
		}
	
	
		for (var col = special_x - 5; col < special_x + 5; ++col) {
			for (var row = special_y - 5; row < special_y + 5; ++row) {
				map[col][row] = 70;
			}
		}
		
	}
	
	static get_final_map = function(_ground = false) {
		for (var col = 0; col < 98; col++) {
			for (var row = 0; row < 98; row++) {
				if (_ground) {
					if (row <= 78) {
						final[col][row] = 1;	
					} else if (row > 78 && row < 88) {
						if (map[col + 15][row + 15] <= 105 && map[col + 15][row + 15] > 75) {
							//empty
							final[col][row] = 1;
						} else {
							//solid
							final[col][row] = 0;
						}
					} else {
						if (map[col + 15][row + 15] <= 115 && map[col + 15][row + 15] > 65) {
							//empty
							final[col][row] = 1;
						} else {
							//solid
							final[col][row] = 0;
						}
					}
				
				} else {
					if (map[col + 15][row + 15] < 93 && map[col + 15][row + 15] > 87) {
						// val between 87 and 93, 20% torch, 80% empty
						final[col][row] = random(1) <= 0.2 ? 2 : 1;
					} else if (map[col + 15][row + 15] <= 115 && map[col + 15][row + 15] > 65) {
						//empty
						final[col][row] = 1;
					} else {
						//solid
						final[col][row] = 0;
					}
				
				}
				if (col == 0 || col == 97) {
					final[col][row] = 0;
				}
			}
		}
	}
	
	
	
	//where PCG actually happen
	//this function will repeat _num times
	static iterate = function(_num = 1) {
		repeat(_num){
			//create next generation map
			var _new_map = array_create(width, 0);
			for (var i = 0; i < width; ++i) {
				_new_map[i] = array_create(height, 0);	
			}
			//show_debug_message("1")
			//pcg!!
			for(var col = 0; col < width; ++col) {
				for (var row = 0; row < height; ++row) {
					//check neighbors
					var _col_dif, _row_dif, _count;
					_count = 0
					for(var col_offset = -1; col_offset < 2; ++col_offset) {
						for(var row_offset = -1; row_offset < 2; ++row_offset) {
							//this two value find the position of the neighbor
							_col_dif = col + col_offset;
							_row_dif = row + row_offset;
							if (_col_dif < 0 || _col_dif >= width || _row_dif < 0 || _row_dif >= height) {
								//out of boundary, dont check
								continue;
							} else if (col_offset == 0 && row_offset == 0) {
								//checking self
								continue;
							} else {
								_count += map[_col_dif][_row_dif];
							}
						}
					}
					//avg value of neighbors
					_count /= 8;
					var _self = map[col][row];
					//apply rules to each cell
					//can be tested and changed later
					if (_count < 40) {
						//if average < 40, self approaches to average
						_new_map[col][row] = _self + (random(_count - _self));
					} else if (_self > _count) {
						//if self > average, self +- random(10)
						_new_map[col][row] = _self + (random_range(-10, 10));
					} else {
						//if self < average and count > 40, self + random(average/5)
						_new_map[col][row] = _self + (random(_count/5));
					}
					
				}
			}
			
			if (prev == noone) {
				for (var col = width - 5; col >= 5; --col) {
					for (var row = width - 45; row >= 5; --row) {
						if _new_map[col][row] >= 110 _new_map[col][row] = 110;
					}
				}
			} else {
				for (var col = special_x - 10; col < special_x + 10; ++col) {
					for (var row = special_y - 10; row < special_y + 10; ++row) {
						if _new_map[col][row] >= 110 _new_map[col][row] = 110;
					}
				}
			}
			
			
			//show_debug_message("2")
			//replace the old map with the new generation
			map = _new_map;
			
		}
	}
	
}