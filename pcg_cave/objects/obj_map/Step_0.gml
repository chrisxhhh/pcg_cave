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


if (keyboard_check_pressed(ord("1"))) {
	spawn_square(my_map);
} else if (keyboard_check_pressed(ord("2"))) {
	spawn_square(map2);
} else if (keyboard_check_pressed(ord("3"))) {
	spawn_square(map3);
}