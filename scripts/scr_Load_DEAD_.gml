day = current_day;
month = current_month;
var time, plants, i, sectionX, sectionY, sectionDate, obj, createdDay, createdMonth;
var seedCount = 0;
var playerX = 496;
var playerY = 72;
var cost = 0;
if (file_exists("Save.sav"))
{
    // Load Save
    ini_open("Save.sav");
    // Get the time and plant count from save data
    plants = ini_read_real("Save1","PlantCount",0);
    // Load players prev cords
    playerX = ini_read_real("Save1","PlayerX",496);
    playerY = ini_read_real("Save1","PlayerY",72);
    seedCount = ini_read_real("Save1","Seeds",0);
    with (obj_Player) {
        // set players pos in game to prev cords
        show_debug_message("Setting player cords to " + string(playerX) + "-" + string(playerY));
        phy_position_x = playerX;
        phy_position_y = playerY;
        seeds = seedCount
    }
    // loop through each plant in the save data
    for (i=1;i<(plants + 1);i+=1)
    {
        sectionX = "Plant" + string(i) + "-X";
        sectionY = "Plant" + string(i) + "-Y";
        sectionDate = "Plant" + string(i) + "-Date";
        // get x and y of plant
        objX = ini_read_real("Plants",sectionX,0);
        objY = ini_read_real("Plants",sectionY,0);
        objDate = ini_read_string("Plants",sectionDate,0);
        show_debug_message("Drawing wheat at: " + string(objX) + "-" + string(objY) + ". Date: " + string(objDate));
        // create plant instance at x and y
        obj = instance_create(objX,objY,asset_get_index("obj_Wheat"));
        
        // split the objDate string
        var msg = string(objDate); //string to split
        var splitBy = "/"; //string to split the first string by
        var slot = 0;
        var splits; //array to hold all splits
        var str2 = ""; //var to hold the current split we're working on building

        var a;
        for (a = 1; a < (string_length(msg)+1); a++) {
            var currStr = string_copy(msg, a, 1);
            if (currStr == splitBy) {
                splits[slot] = str2; //add this split to the array of all splits
                slot++;
                str2 = "";
            } else {
                str2 = str2 + currStr;
                splits[slot] = str2;
            }
        }
        
        // compare objDate with todays date
        createdMonth = real(splits[0]);
        createdDay = real(splits[1]);
        
        if(current_day > createdDay)
        {
            // the object was created before today
            show_debug_message("Object was created before today.");
            cost = current_day - createdDay;
            
        }
        
        // set plant to its stage (image index)
        obj.image_index = cost;
        
        // get the tiledLand object at the plants position
        tiled = instance_position(objX,objY,obj_tiledLand);
        if(tiled){
            // set the seeded attribute of the tiledLand to true
            tiled.seeded = true;
        }
    }
    ini_close();
}
else
{
    // Load fresh game settings
    
    // spawn 10 seeds in the shed
    for (i = 0; i < 10; i += 1) {
        instance_create(560,256,obj_Seeds);
    }
}
