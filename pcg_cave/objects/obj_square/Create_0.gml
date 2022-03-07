/// @description Insert description here
// You can write your code in this editor

set_color = function(_val) {
	_val = min(_val, 250)
	if (_val > 115) {
		//image_blend = make_color_rgb(map_value(_val, 0, 255, 15, 35), _val, map_value(_val, 0, 255, 35, 75));  
		image_blend = c_black;
	} else if (_val > 65) {
		//image_blend = make_color_rgb(map_value(_val, 0, 255, 200, 212), map_value(_val, 0, 255, 112, 154), map_value(_val, 0, 255, 75, 100));  
		//image_blend = c_black;
	} else {
		//image_blend = make_color_rgb(_val, map_value(_val, 0, 255, 35, 175), map_value(_val, 0, 255, 70, 255));  
		image_blend = c_black;
	}	
}

r = 0;
c = 0;