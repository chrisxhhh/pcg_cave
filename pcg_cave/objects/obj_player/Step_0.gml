
hspd = ( keyboard_check(ord("D")) - keyboard_check(ord("A")) ) * mspd;

// collision check: 
var tile_ind = tilemap_get_at_pixel(tilemapID, x, y); 
if (tile_ind < 0) {
	show_debug_message("failed to check for collision here, index = "+string(tile_ind)); 	
} 

if (tilemap_get_at_pixel(tilemapID, x-sprite_xoffset-1, y) != empty_tile) {
	collided_left = true; 
} 
if (tilemap_get_at_pixel(tilemapID, x+sprite_xoffset+1, y) != empty_tile ) {
	collided_right = true; 
} 
if (tilemap_get_at_pixel(tilemapID, x, y-sprite_yoffset-1) != empty_tile) {
	collided_top = true; 
} 
if (tilemap_get_at_pixel(tilemapID, x, y+sprite_yoffset+1) != empty_tile) {
	collided_bottom = true; 
} 

show_debug_message("collided_bottom = " + string(collided_bottom)); 

hspd = hspd * !collided_left * !collided_right;  
x += hspd; 
y += (grav * !collided_bottom); 