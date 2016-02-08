//Destroy inventory tiara object if it exists in room
if(instance_exists(obj_tempinventorytiara))
{
    with(obj_tempinventorytiara)
        instance_destroy();
}

//Destroy inventory coat object if it exists in room
if(instance_exists(obj_tempinventorycoat))
{
    with(obj_tempinventorycoat)
        instance_destroy();
}

//Destroy a pickupable object on room enter, if the player has already picked it up
if(global.hastiara && instance_exists(obj_temptiara))
{
    with(obj_temptiara)
        instance_destroy();
}
if(global.hascoat && instance_exists(obj_tempcoat))
{
    with(obj_tempcoat)
        instance_destroy();
}

//Spawn inventory items if player has picked them up
if(global.hastiara)
    instance_create(896,0,obj_tempinventorytiara);
if(global.hascoat)
    instance_create(960,0,obj_tempinventorycoat);
