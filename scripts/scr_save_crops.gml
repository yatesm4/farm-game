/// Save Crops to DS Map

// clear old save
ds_map_clear(obj_game_manager.save_crops);
show_debug_message("Old crops save erased");

// Create new save with current crops
with(obj_Crop)
{
    show_debug_message("Saving Crop: " + name);
    ds_map_add(obj_game_manager.save_crops,name,image_index);
}
