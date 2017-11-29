/// Script to process the end of the day
// Save crops, inventory, player data, etc. Then load next day

with(obj_time_manager)
{
    // advance day
    day += 1;
    // if 29, advance season - reset day to 1
    if(day>28)
    {
        day = 1;
        season += 1;
    }
    //if season 5, advance year - reset season to 1 
    if(season>4)
    {
        season = 1;
        year += 1;
    }
}

// for every wheat object
with (obj_Wheat)
    {
    // if wheat isnt fully grown
    if (image_index < 5)
    {
        // advance state
        image_index += 1;
    }
}

instance_deactivate_all(false); // Deactive all objects (including controls)
// everything is now inactive
instance_create(0,0,obj_days_end_manager); // Days End Menu is now active
