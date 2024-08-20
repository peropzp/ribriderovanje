
 //poklopac 
 
 difference() {
 rotate_extrude() square([88,25]);
 translate([0,20,0]) rotate_extrude() square([55,25]);
 translate([65,-15,0]) rotate_extrude() square([16,25]);
 translate([-65,-15,0]) rotate_extrude() square([16,25]);
}

//scrubber
color("red",1)
translate([0,20,0])
difference() {
    rotate_extrude() square([55,250]);
    translate([0,0,5]) rotate_extrude() square([48,250]);
    translate([0,0,20]) rotate_extrude() square([52,250]);
    rotate_extrude() square([19,10]);
}

color("green",1)
translate ([65,-15,0])
difference() {
    rotate_extrude() square([16,220]);rotate_extrude() square([4,220]);
    translate([0,0,20]) rotate_extrude() square([14,250]);
    translate([10,10,20]) rotate_extrude() square([10,60]);
    translate([10,10,85]) rotate_extrude() square([10,60]);
    translate([10,10,150]) rotate_extrude() square([10,60]);
}

//oklop
color("silver",0.5) {
 difference() {
 rotate_extrude() square([89,300]);
 rotate_extrude() square([88,299]);
 }
translate([-5,-50,300])
 linear_extrude(300) circle(10);
translate([-5,50,300])
 linear_extrude(300) circle(10);
}
translate([-50,0,320])
 linear_extrude(350) circle(50);
translate([50,0,320])
 linear_extrude(350) circle(50);
