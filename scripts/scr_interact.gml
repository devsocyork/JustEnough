//Had to use step event for this script, can't find a way to detect leaving a collision otherwise

//Check for collisions with interactable objects
colobject = collision_rectangle(x,y,x+64,y+128,obj_interactable,0,1);

//If the player is colliding with a door and they are not busy, execute the following code
if(colobject and not global.transitioning)
{
    //Destroy last instance of the interaction button
    if(instance_exists(obj_tempinteract))
    {
        with(obj_tempinteract)
            instance_destroy();
    }
    
    //Create an interaction button above the player
    instance_create(x, y - 96, obj_tempinteract);
    
    //Fade to black and take the player to the level linked to the door they interacted with
    if(keyboard_check_pressed(ord('E')))
    {   
        //Execute different actions depending on what the object being interacted with is
        if(object_get_name(colobject.id.object_index) == "obj_tempdoor" or object_get_name(colobject.id.object_index) =="obj_tempforegrounddoor")
        {
            //If object is door, take player to its room
            global.transitioning = true;
            var eff = instance_create(0,0,obj_fadetoblack);
            global.playerxpos = colobject.roomposx;
            global.playerypos = colobject.roomposy;
            eff.newroom = asset_get_index(colobject.levelstring)
        }
        else if(object_get_name(colobject.id.object_index) == "obj_tempchair")
        {
            //TEMP: If the player has collected all level items, finish level
            if(global.hascoat and global.hastiara)
            {
                global.transitioning = true;
                var eff = instance_create(0,0,obj_fadetoblack);
                global.playerxpos = 576;
                global.playerypos = 576;
                eff.newroom = asset_get_index("rm_finishlevel")
            }
            else
            {
                //Tell player to get items
            }
        }
        else if(object_get_name(colobject.id.object_index) == "obj_tempcoat")
        {
            //Pick up coat
            global.hascoat = true
            with(colobject)
                instance_destroy();
            script_execute(scr_setinventory);
        }
        else if(object_get_name(colobject.id.object_index) == "obj_temptiara")
        {
            //Pick up tiara
            global.hastiara = true
            with(colobject)
                instance_destroy();
            script_execute(scr_setinventory);                
        }
    }   
}
else
{
    //If player is no longer colliding with an interactable object, remove the interaction button
    if(instance_exists(obj_tempinteract))
    {
        with(obj_tempinteract)
            instance_destroy();
    }
}
