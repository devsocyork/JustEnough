///Fetch Input

input_left = keyboard_check(ord('A')) || keyboard_check(vk_left);
input_right = keyboard_check(ord('D')) || keyboard_check(vk_right);
input_jump = keyboard_check(ord('W')) || keyboard_check(vk_up) || keyboard_check(vk_space);
input_crouch = keyboard_check(ord('S')) || keyboard_check(vk_down) || keyboard_check(vk_control);
input_sprint = keyboard_check(vk_shift);
input_interact = keyboard_check(ord('E')) || keyboard_check(ord('Z'));
