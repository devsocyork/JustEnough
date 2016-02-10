l_boundarydoor = collision_rectangle(x,y,x + sprite_width, y + sprite_height,obj_boundarydoor,0,1);

global.transitioning = true;
var eff = instance_create(0,0,obj_fadetoblack);
global.playerxpos = l_boundarydoor.roomposx;
global.playerypos = l_boundarydoor.roomposy;
eff.newroom = asset_get_index(l_boundarydoor.levelstring)
