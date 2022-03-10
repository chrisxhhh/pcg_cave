/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_space) && ite_rdy) {
	instance_destroy(obj_square)
	ite_rdy = false;
	alarm[0] = 0.05 * room_speed;
	++ite;
	my_map.iterate();
	spawn_square(my_map);
}

//if (keyboard_check(vk_shift)) {
//	spawn_square();
//}

//if (keyboard_check(vk_enter)) {
//	instance_destroy(obj_square)
//}



if (keyboard_check_pressed(vk_down)) {
	++current_level;
	if (all_maps[current_level] == noone) {
		all_maps[current_level] = new cellular_automata(128, 128, 0.50, all_maps[current_level - 1]);
		all_maps[current_level].iterate(30);
	}
	spawn_square(all_maps[current_level], false);
} else if (keyboard_check_pressed(vk_up)) {
	if (current_level > 0) {
		--current_level;
		spawn_square(all_maps[current_level], current_level == 0 ? true : false);
	}
}