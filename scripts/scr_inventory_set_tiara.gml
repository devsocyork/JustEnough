//If false is passed in, set global variable to false and exit script
if(!argument0)
{
    global.hastiara = false;
    exit;
}

//Destroy tiara in room
if(instance_exists(obj_temptiara))
{
    with(obj_temptiara)
        instance_destroy();
}

//Spawn inventory tiara
instance_create(896,0,obj_tempinventorytiara);
global.hastiara = true;
