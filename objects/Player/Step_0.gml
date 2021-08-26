/// @description Insert description here
// You can write your code in this editor
//Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(vk_down);

//get player input gamepad
pad_right = gamepad_button_check(0, gp_padr);
pad_left = gamepad_button_check(0, gp_padl);
pad_up = gamepad_button_check_pressed(0, gp_padu);
pad_down = gamepad_button_check_pressed(0, gp_padd);

move_right = 0;
move_left = 0;


if(pad_right || pad_left){
	move_right = pad_right;
	move_left = pad_left;
}else{
	move_right = key_right;
	move_left = key_left;
}

if(pad_up || pad_down){
	move_up = pad_up;
	move_down = pad_down;
}else{
	move_up = key_up;
	move_down = key_down;
}


//Calculate Movement
var move = move_right - move_left;

hsp = move * drivesp;

/*Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
    while (!place_meeting(x+sign(hsp),y,oWall))
    {
        x = x + sign(hsp);
    }
    hsp = 0;
}*/
x = x + hsp;

/*Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
    while (!place_meeting(x,y+sign(vsp),oWall))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}*/

if (move_up && lane != 2) {
	y = y - vertical_height;
	lane = lane + 1;
} else if (move_down && lane != 0) {
	y = y + vertical_height;
	lane = lane - 1;
}


y = y + vsp;

/*
vertical movement functionality:

if vertical button is pressed,
move to goal destination

if it is at goal destination already, do not allow it to move any further
*/