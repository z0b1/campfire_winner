/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 6C4072FE
/// @DnDArgument : "key" "ord("W")"
var l6C4072FE_0;
l6C4072FE_0 = keyboard_check_pressed(ord("W"));
if (l6C4072FE_0)
{
	/// @DnDAction : YoYo Games.Movement.Add_Motion
	/// @DnDVersion : 1
	/// @DnDHash : 3324FB38
	/// @DnDParent : 6C4072FE
	/// @DnDArgument : "dir" "image_angle"
	/// @DnDArgument : "speed" "1"
	motion_add(image_angle, 1);
}