/// @description Insert description here
// You can write your code in this editor

set_color = function(_val, _empty = 65, _solid = 115) {
	_val = min(_val, 250)
	//if (_val > _solid) {
	//	//image_blend = make_color_rgb(map_value(_val, 0, 255, 15, 35), _val, map_value(_val, 0, 255, 35, 75));  
	//	image_blend = c_black;
	//} else if (_val > _empty) {
	//	//image_blend = make_color_rgb(map_value(_val, 0, 255, 200, 212), map_value(_val, 0, 255, 112, 154), map_value(_val, 0, 255, 75, 100));  
	//	//image_blend = c_black;
	//} else {
	//	//image_blend = make_color_rgb(_val, map_value(_val, 0, 255, 35, 175), map_value(_val, 0, 255, 70, 255));  
	//	image_blend = c_black;
	//}	
	var _func1 = (256 - 1.75 * (_val - _solid)) - 50;
	var _func2 = 2.75 * _val;
	var _func3 = 5 * abs(_val - 90) + 100;
	if (_val > _solid) {
		image_blend = make_color_rgb(_func1, _func1, _func1);
	} else if (_val > _empty) {
		image_blend = make_color_rgb(_func3, 0, 0);
	} else {
		image_blend = make_color_rgb(_func2, _func2, _func2);
	}
	
	if (_val < 93 && _val > 87) {
		image_blend = c_blue;
	}
}
