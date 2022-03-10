
mspd = 1; 
hspd = 0; 

grav = 2;
jump_power = 3; 

TlayerID = layer_get_id("Tiles_Floor"); 
tilemapID = layer_tilemap_get_id(TlayerID); 

collided_top = false; 
collided_bottom = false; 
collided_left = false; 
collided_right = false; 

empty_tile = 110;

