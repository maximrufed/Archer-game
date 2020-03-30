if (!oPlayer.alive) return;

if (oPlayer.shift) return;

x = oPlayer.x;
y = oPlayer.y;

image_angle = point_direction(x, y, mouse_x, mouse_y);

if (image_angle > 90 && image_angle < 270) {
	image_angle -= 45;
	image_yscale = -1;
} else {
	image_angle += 45;
	image_yscale = 1;
}

tick++;

// Bow
if (image_index == 0) {
	if (mouse_check_button(mb_right)) {
		sprite_index = sBow2;
		arrow_type = 2;
	} else if (mouse_check_button(mb_left)) {
		sprite_index = sBow1;
		arrow_type = 1;
	}
}


if ((mouse_check_button(mb_left) && arrow_type == 1) || (mouse_check_button(mb_right) && arrow_type == 2)) {
	if (tick >= slow_tick) {
		image_index = min(3, image_index + 1);
		tick = 0;
	}
} else {
	if (image_index == 3) {
		// push arrow
		with(instance_create_layer(x, y, "Inst_bow", oArrow)) {
			var dir = point_direction(other.x, other.y, mouse_x, mouse_y);
			xspd = lengthdir_x(15, dir);
			yspd = lengthdir_y(15, dir);
			if (other.arrow_type == 1) {
				sprite_index = sArrow1;
			} else if (other.arrow_type == 2) {
				sprite_index = sArrow2;
			} else if (other.arrow_type == 0) {
				sprite_index = sArrow;
			}
		}
	}
	image_index = 0;
}
