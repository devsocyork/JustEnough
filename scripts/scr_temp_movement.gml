if(global.transitioning)
    exit;

var l_xtomove = 0;
var l_ytomove = 0;

if(keyboard_check(ord('W')) or keyboard_check(vk_up))
    y -= 8;
if(keyboard_check(ord('S')) or keyboard_check(vk_down))
    y += 8;
if(keyboard_check(ord('A')) or keyboard_check(vk_left))
    x -= 8;
if(keyboard_check(ord('D')) or keyboard_check(vk_right))
    x += 8;
    
x += l_xtomove;
y += l_ytomove;
