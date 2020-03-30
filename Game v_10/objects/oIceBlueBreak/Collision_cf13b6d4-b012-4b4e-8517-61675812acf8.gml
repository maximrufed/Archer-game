if (other.sprite_index == sArrow2) {
	instance_destroy();
	with (other) {
		stop = 0;
		life_time = 1;
		life_change = 0;
	}
}