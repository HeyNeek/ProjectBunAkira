/// @description Insert description here
// You can write your code in this editor
//Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

//get player input gamepad
pad_right = gamepad_button_check(0, gp_padr);

pad_left = gamepad_button_check(0, gp_padl);

move_right = 0;

move_left = 0;

if(pad_right || pad_left){
	move_right = pad_right;
	move_left = pad_left;
}else{
	move_right = key_right;
	move_left = key_left;
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
y = y + vsp;