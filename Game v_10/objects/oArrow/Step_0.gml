life_time += life_change;

if (life_time <= 0) {
	// repeat(10) {
	instance_create_layer(x, y, "Instances", oeff_white);
	if (sprite_index == sArrow1) {
		instance_create_layer(x, y, "Instances", oeff_red);
	} else {
		instance_create_layer(x, y, "Instances", oeff_blue);			
	}
	// }
	instance_destroy();
}

if (!stop) {
	yspd += grv;

	x += xspd;
	y = y + yspd;

	image_angle = point_direction(0, 0, xspd, yspd) - 45;
}