//Had to use step event for this script, can't find a way to detect leaving a collision otherwise

//First check for collisions with background doors
colobject = collision_rectangle(x,y,x+64,y+128,obj_tempdoor,0,1);

//Now check for collisions with foreground doors
if(not colobject)
    colobject = collision_rectangle(x,y,x+64,y+128,obj_tempforegrounddoor,1,1);
    
//Im pretty sure there's a better way to do this, but check for collision with each interactable in sequence

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
        global.transitioning = true;
        var eff = instance_create(0,0,obj_fadetoblack);
        global.playerxpos = colobject.roomposx;
        global.playerypos = colobject.roomposy;
        eff.newroom = asset_get_index(colobject.levelstring)
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
