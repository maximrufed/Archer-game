if (!alive) return;

// Get inputs
keyshift = keyboard_check(vk_shift);
keyleft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyright = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyspace = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
//keyboard_check_pressed(vk_space) || 

// Calculate movements
var move = keyright - keyleft; // 1 - right | 0 - none | -1 - left

xsp = move * spd_walk;

ysp = ysp + grv;

if (keyspace && !keyshift && place_meeting(x, y + 1, oWall)) {
	ysp = -spd_jump;
}

// Moving player
fy = 0;

if (place_meeting(x, y + ysp, oWall)) {
	fy = 1;
}

f = 0;

while (!place_meeting(x + sign(xsp), y, oWall) && xsp != 0) {
	x += sign(xsp);
	xsp -= sign(xsp);
	f = 1;
}

ey = ysp;

if (1) {
	repeat(abs(round(ey))) {
		if (!f && xsp != 0 && !place_meeting(x + sign(xsp), y, oWall)) {
			while (!place_meeting(x + sign(xsp), y, oWall) && xsp != 0) {
				x += sign(xsp);
				xsp -= sign(xsp);
			}
			xsp = 0;
			f = 1;
		}
		
		if (!place_meeting(x, y + sign(ey), oWall) && ey != 0) {
			y += sign(ey);
			ey -= sign(ey);
		}
	}
}

if (fy) ysp = 0;

//Animation
if (place_meeting(x, y + 1, oWall)) {
	if (xsp = 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerWalk;
	}
	image_speed = 1;
} else {
	sprite_index = sPlayerAir;
	image_speed = 0;
	if (ysp > 0) image_index = 0;
	else image_index = 1;
}



// Shift
if (keyshift) {
	shift = 1;
	if (sprite_index == sPlayer) {
		sprite_index = ssPlayer;
	} else if (sprite_index == sPlayerWalk) {
		sprite_index = ssPlayerWalk;
	} else if (sprite_index == sPlayerAir) {
		sprite_index = ssPlayerAir;
	}
} else {
	shift = 0;
	if (sprite_index == ssPlayer) {
		sprite_index = sPlayer;
	} else if (sprite_index == ssPlayerWalk) {
		sprite_index = sPlayerWalk;
	} else if (sprite_index == ssPlayerAir) {
		sprite_index = sPlayerAir;
	}
	if (place_meeting(x, y, oWall)) {
		shift = 1;
		if (sprite_index == sPlayer) {
			sprite_index = ssPlayer;
		} else if (sprite_index == sPlayerWalk) {
			sprite_index = ssPlayerWalk;
		} else if (sprite_index == sPlayerAir) {
			sprite_index = ssPlayerAir;
		}
	}
}

/*
if (move == -1) image_xscale = -1;
else if (move == 1) image_xscale = 1;
*/
// /*
var dir = point_direction(x, y, mouse_x, mouse_y);
if (dir > 90 && dir < 270) {
	image_xscale = -1;
} else {
	image_xscale = 1;
}
// */