/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_space) && ite_rdy) {
	instance_destroy(obj_square)
	ite_rdy = false;
	alarm[0] = 0.05 * room_speed;
	++ite;
	my_map.iterate();
	spawn_square();
}

//if (keyboard_check(vk_shift)) {
//	spawn_square();
//}

//if (keyboard_check(vk_enter)) {
//	instance_destroy(obj_square)
//}