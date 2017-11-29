/// Load Crops into Farm

with(obj_game_manager)
{
    show_debug_message("Loading crops...");
    
    // <-- load crop data -->
    crops = ds_map_size(save_crops);
    crop = ds_map_find_first(save_crops);
    for(i=0;i<crops;i+=1)
    {
        // get state of crop
        state = ds_map_find_value(save_crops, crop);
        
        show_debug_message("Loading Crop: " + string(crop));
    
        // split crop key
        arr = scr_split_str(crop, "_");
        // crop-object_name | x | y
        debug_str = "X: " + string(arr[2]);
        debug_str2 = "Y: " + string(arr[3]);
        show_debug_message("Loading Crop@: " + string(arr[0]) + "_" + string(arr[1]) + "/" + debug_str + debug_str2);
        obj = asset_get_index(arr[0] + "_" + arr[1]);
        c = instance_create(real(arr[2]),real(arr[3]),obj);
        c.image_index = state;
        
        // get next crop in save
        crop = ds_map_find_next(save_crops, crop);
    }
    
    
    // <-- load inventory data -->
    
    
    // <-- load player data? -->
}
