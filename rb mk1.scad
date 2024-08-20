
 //poklopac 
 
 difference() {
 rotate_extrude() square([88,25]);
 translate([0,27,0]) rotate_extrude() square([55.5,25]);
 translate([0,27,0]) rotate_extrude() square([57,5]);
 translate([65,-10,0]) rotate_extrude() square([16.5,25]);
 translate([-35,-50,0]) rotate_extrude() square([19,25]);
 translate([-35,-50,10]) rotate_extrude() square([25,15]);
     
}

color("black",1) {
    translate([-35,-50,-15])
    difference() {
        cylinder(15,28,28);
        cylinder(15,17,17);
    }
}


//scrubber
color("red",1) {
    translate([0,27,0])
    difference() {
        union () {
            rotate_extrude() square([55,250]);
            rotate_extrude() square([57,5]);
        }
        translate([0,0,3]) rotate_extrude() square([48,250]);
        translate([0,0,25]) rotate_extrude() square([52,250]);
        rotate_extrude() square([19,10]);
        rotate_extrude() translate([53,8,0]) square([2,2]);
        rotate_extrude() translate([53,12,0]) square([2,2]);
    }
}
color("black",1) {
    translate([0,27,-15])
    difference() {
        cylinder(15,28,28);
        cylinder(15,17,17);
    }
}


//celije
color("green",1)
translate ([65,-10,0])
difference() {
    union() {
        rotate_extrude() square([16,220]);
        translate([0,0,-5]) cylinder(5, 22, 22);
    }
    translate([0,0,-5]) rotate_extrude() square([4,25]);
    translate([0,0,20]) rotate_extrude() square([14,200]);
    translate([10,10,20]) rotate_extrude() square([10,60]);
    translate([10,10,85]) rotate_extrude() square([10,60]);
    translate([10,10,150]) rotate_extrude() square([10,60]);
    rotate_extrude() translate([14,8,0]) square([2,2]);
    rotate_extrude() translate([14,12,0]) square([2,2]);

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
 
