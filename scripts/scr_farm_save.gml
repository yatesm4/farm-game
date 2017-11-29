/// Save Game
var val, val2, val3, i, arr, c, obj;
var gm = obj_game_manager;
with(obj_game_manager)
{
    // <-- save player data -->
    
    // Save current date onto save file
    with(obj_time_manager)
    {
        val3 = ds_map_find_value(gm.save_data,"SaveDate");
        current = string(season) + "/" + string(day) + "/" + string(year);
        if(!is_undefined(val3))
        {
            // created key found
            ds_map_replace(gm.save_data,"SaveDate",current);
        }
        else 
        {
            // create created key
            ds_map_add(gm.save_data,"SaveDate",current);
        }
    }
    
    // <-- save inventory data -->
    
    
    // secure the save
    ds_map_secure_save(save_data,file_name);
    ds_map_secure_save(save_crops,crops_file_name);
    ds_map_secure_save(save_inv,inventory_file_name);
}
