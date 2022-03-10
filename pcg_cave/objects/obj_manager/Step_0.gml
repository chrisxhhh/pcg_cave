

--timer;

if (current_level == 0) {
	player_depth = round(obj_player.y / 16) - 78;
} else if (current_level >= 0) {
	player_depth = 20 + 100 * (current_level - 1) + round(obj_player.y / 16); 
}

