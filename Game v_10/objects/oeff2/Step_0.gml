image_alpha *= alpha_d;

if (image_alpha <= 0) {
	instance_destroy();
}