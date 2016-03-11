///Fetch Input

left = keyboard_check(ord('A')) || keyboard_check(vk_left);
right = keyboard_check(ord('D')) || keyboard_check(vk_right);
jump = keyboard_check(ord('W')) || keyboard_check(vk_up) || keyboard_check(vk_space);
crouch = keyboard_check(ord('S')) || keyboard_check(vk_down) || keyboard_check(vk_control);
sprint = keyboard_check(vk_shift);
interact = keyboard_check(ord('E')) || keyboard_check(ord('Z'));
