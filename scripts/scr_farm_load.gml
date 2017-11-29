/// Load Game
var val, val2, val3, crops, crop, arr, c, j, i;
var cropX, cropY, playerX, playerY, state;

/*
TODO
    load SaveDate from ds_map
    compare SaveDate with current date
*/

with(obj_game_manager)
{
    show_debug_message("Loading save...");
    
    // <-- load inventory data -->
    
    
    // <-- load player data? -->
}


// cheat | add seeds at load of farm
for(i=0;i<10;i+=1)
{
    instance_create(560,256,obj_Seeds);
}







