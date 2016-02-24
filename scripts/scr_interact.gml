//Had to use step event for this script, can't find a way to detect leaving a collision otherwise

//Check for collisions with interactable objects
var l_colobject = collision_rectangle(x,y,x + sprite_width,y + sprite_height,obj_interactable,0,1);

//If the player is colliding with a door and they are not busy, execute the following code
if(l_colobject and l_colobject.interactable and not global.transitioning)
{
    //Move interaction object to above player, or create one if one does not exist
    if(instance_exists(obj_tempinteract))
    {
        obj_tempinteract.x = x;
        obj_tempinteract.y = y-96;
    }
    else
    {
        instance_create(x, y - 96, obj_tempinteract);
    }
    
    //Execute different actions depending on what the player is interacting with
    if(keyboard_check_pressed(ord('E')))
    {   
        //If the player is interacting with a person, display speech bubble with custom animation, else check for doors/items etc
        if(object_is_ancestor(l_colobject.object_index, obj_talkable))
        {
            show_debug_message(string(object_get_parent(l_colobject)));
            show_debug_message(string(obj_talkable));
            
            global.current_speech_target = l_colobject;
            l_colobject.interactable = false;            
            instance_create(l_colobject.x - 128, l_colobject.y - 150, obj_speechbubble);
            instance_create(l_colobject.x - 128, l_colobject.y - 150, obj_tempspeechanimation);
        }
        else if(object_get_name(l_colobject.id.object_index) == "obj_tempdoor" or object_get_name(l_colobject.id.object_index) =="obj_tempforegrounddoor")
        {
            //If object is door, take player to its room
            global.transitioning = true;
            var l_eff = instance_create(0,0,obj_fadetoblack);
            global.playerxpos = l_colobject.roomposx;
            global.playerypos = l_colobject.roomposy;
            l_eff.newroom = asset_get_index(l_colobject.levelstring);
        }
        else if(object_get_name(l_colobject.id.object_index) == "obj_tempchair")
        {
            //TEMP: If the player has collected all level items, finish level
            if(global.hascoat and global.hastiara)
            {
                global.transitioning = true;
                var l_eff = instance_create(0,0,obj_fadetoblack);
                global.playerxpos = 576;
                global.playerypos = 576;
                l_eff.newroom = asset_get_index("rm_finishlevel")
            }
            else
            {
                //Tell player to get items
            }
        }
        else if(object_get_name(l_colobject.id.object_index) == "obj_tempcoat")
        {
            //Pick up coat
            global.hascoat= true;
            with(l_colobject)
                instance_destroy();
            instance_create(896,0,obj_tempinventorycoat);
        }
        else if(object_get_name(l_colobject.id.object_index) == "obj_temptiara")
        {
            //Pick up tiara
            global.hastiara = true;
            with(l_colobject)
                instance_destroy();
            instance_create(960,0,obj_tempinventorytiara);
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
