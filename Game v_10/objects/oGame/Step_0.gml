var space = keyboard_check_pressed(vk_space);
if (space && !oPlayer.alive) {
	oPlayer.alive = 1;
	oPlayer.x = 100;
	oPlayer.y = 100;
}