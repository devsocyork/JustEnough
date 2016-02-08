boundarydoor = collision_rectangle(x,y,x+64,y+128,obj_boundarydoor,0,1);

global.transitioning = true;
var eff = instance_create(0,0,obj_fadetoblack);
global.playerxpos = boundarydoor.roomposx;
global.playerypos = boundarydoor.roomposy;
eff.newroom = asset_get_index(boundarydoor.levelstring)
