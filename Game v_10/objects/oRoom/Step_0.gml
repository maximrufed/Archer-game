if (place_meeting(x, y, oPlayer)) {
	image_alpha = max(0, image_alpha - 0.01);
} else {
	image_alpha = min(1, image_alpha + 0.01);
}