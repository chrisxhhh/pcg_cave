/// @description Insert description here
// You can write your code in this editor

set_color = function(_val) {
	_val = min(_val, 250)
	if (_val > 135) {
		image_blend = make_color_rgb(map_value(_val, 0, 255, 15, 35), _val, map_value(_val, 0, 255, 35, 75));  
    } else if (_val > 100) {
		image_blend = make_color_rgb(map_value(_val, 0, 255, 200, 212), map_value(_val, 0, 255, 112, 154), map_value(_val, 0, 255, 75, 100));  
    } else {
		image_blend = make_color_rgb(_val, map_value(_val, 0, 255, 35, 175), map_value(_val, 0, 255, 70, 255));  
    }	
}

r = 0;
c = 0;