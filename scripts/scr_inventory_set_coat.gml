//If false is passed in, set global variable to false and exit script
if(!argument0)
{
    global.hascoat = false;
    exit;
}

//Destroy coat in room, if the player has already picked it up
if(instance_exists(obj_tempcoat))
{
    with(obj_tempcoat)
        instance_destroy();
}

//Spawn inventory coat if player has picked it up
instance_create(960,0,obj_tempinventorycoat);
global.hascoat = true;
