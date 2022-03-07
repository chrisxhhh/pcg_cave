// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cellular_automata(_width, _height, _spawn_chance) constructor{
	width = _width
	height = _height
	
	
	//create initial grid in a nested array with initial value 0
	map = array_create(width,0)
	for (var i = 0; i < width;i += 1){
		map[i] = array_create(height,0)	
	}
	
	
	for (var col = width-1; col >= 0; col -= 1){
		for (var row=height-1; row>= 0 ; row -=1){
			//set each cell 60 or 10 depend on _spawn_chance
			//this is first generation of the map
			map[col][row]= random(1) <= _spawn_chance? 60 : 10
			//show_debug_message(map[col][row])
		}
	}
	
	//where PCG actually happen
	//this function will repeat _num times
	static iterate = function(_num){
		repeat(_num){
			//create next generation map
			show_debug_message("one loop")
			var _new_map = array_create(width,0)
			for (var i = 0; i < width;i += 1){
				_new_map[i] = array_create(height,0)	
			}
			show_debug_message("1")
			//pcg!!
			for(var col = 0; col < width; col+=1){
				for (var row = 0; row < height; row += 1){
					//show_debug_message(string(col)+" , "+string(row))
					//show_debug_message(map[col][row])
					//check neighbors
					var _col_dif, _row_dif, _count
					_count = 0
					for(var col_offset = -1; col_offset < 2; col_offset += 1){
						//show_debug_message(string(col_offset))
						for(var row_offset = -1; row_offset < 2; row_offset +=1){
							//this two value find the position of the neighbor
							_col_dif = col + col_offset;
							_row_dif = row + row_offset;
							if _col_dif < 0 or _col_dif >= width or _row_dif < 0 or _row_dif >= height{
								//out of boundary, dont check
								continue;
							}else if col_offset == 0 and row_offset == 0{
								//checking self
								continue;
							}else{
								_count += map[_col_dif][_row_dif]	
							}
						}
					}
					//show_debug_message("finish neighbor")
					//avg value of neighbors
					_count /= 8
					var _self = map[col][row]
					//show_debug_message(map[col][row])
					//apply rules to each cell
					//can be tested and changed later
					if _count < 40{
						_new_map[col][row] = _self + (random(_count - _self))
					}else if (_self > _count){
						_new_map[col][row] = _self + (random_range(-10,10))
					}else {
						_new_map[col][row] = _self + (random(_count/5))	
					}
					
				}
			}
			
			//show_debug_message("2")
			//replace the old map with the new generation
			map = _new_map
			
		}
	}
	
}