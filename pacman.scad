include <sae-units/sae-units.scad>
include <openscad-bushing/bushing.scad>

pacman_diameter = 5 * quarter_inch;
pacman_radius = 1/2 * pacman_diameter;
mouth_angle = 60;
eye_radius = pacman_radius / 4;
hole_radius = 2 * sixteenth_inch;
$fn = 100;

/*
	PACMAN!!!!!!
*/
rotate([90,45,0])
difference() {
	sphere(pacman_radius);	//pacman body
	rotate_extrude(angle = mouth_angle) {		// mouth area
		intersection() {
			circle(r=pacman_radius + 1);
			translate([pacman_radius + 1,0,0]) square(2 * pacman_radius,true);
		}
	}
	//eye indentations
	translate([0,pacman_radius,2 * (eye_radius )]) sphere(eye_radius);
	translate([0,pacman_radius,- 2 * (eye_radius )]) sphere(eye_radius);
}


/*
	hanging hole for key-ring
*/
rotate([0,-10,0])
translate([0,0,pacman_radius + .75 * sixteenth_inch ])
	rotate([90,0,0]) 
		bushing(
			height = eighth_inch, 
			outer_radius = eighth_inch, 
			inner_radius = sixteenth_inch);