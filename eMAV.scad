$fn=64;
module roundedCube (width, len, height) {
    translate([-1*(len/2) + width/2, 0, 0]) cylinder(height, width/2, width/2, $fn=128);
    translate([(len/2) - width/2, 0, 0]) cylinder(height, width/2, width/2, $fn=128);
    translate([-1*(len/2) + width/2, -width / 2, 0]) cube([len - width, width, height]);
}

//roundedCorners(32,72,5,16);
module roundedCorners(width, len, height, radius) {
    translate([0,width/2 - radius/2,0]) rotate([0,90,0]) roundedCube (radius,len,height);
    translate([0,(-1) * width/2 + radius/2,0]) rotate([0,90,0]) roundedCube (radius,len,height);
    translate([0,0,len/2 - radius/2]) rotate([90,0,90]) roundedCube (radius,width,height);
    translate([0,0,-(len/2 - radius/2)]) rotate([90,0,90]) roundedCube (radius,width,height);
    translate([0, -(width-radius)/2,-(len-radius)/2]) cube([height, width-radius, len-radius]);
}

//MavValve();
module MavValve () {
    cylinder(6.35, 11.2, 11.2);
    translate([0,0,6.34]) cylinder(5.6, 8.6, 8.6);
    translate([0,0,11.9]) cylinder(15, 7.5, 7.5);
    translate([0,0,26.8]) cylinder(10, 6.5, 6.5);
    translate([0,0,-5]) cylinder(5, 10, 10);
}

module mav() {
    difference() {
        translate([0,3,0]) cylinder(90,25,25); //cylinder fi50
        translate([-26,-65,-1]) cube([52,50,94]); //bottom cut
        translate([-26,27,-1]) cube([52,50,94]); //top cut
        //translate([-26,8,-1]) cube([52,50,84]); //slice
        
        //hole for batteries and controler
        translate([0,10,46]) rotate([0,0,90]) roundedCorners(32,70,17.1,5);
        
        //cable hole
        translate([10,16,-1]) rotate([0,0,0]) cylinder(20,6,6);

        //optics hole
        translate([-5,20,-1]) rotate([0,0,0]) cylinder(20,1,1);

        //piezo hole
        translate([0,16,75]) rotate([0,0,0]) cylinder(20,6,6);

        //o2 Valve
        translate([27,0,19]) rotate([0,-90,0]) MavValve();

        //dil Valve
        translate([27,0,57]) rotate([0,-90,0]) MavValve();
        translate([27,0,57]) rotate([0,-90,0]) cylinder(45,6.5,6.5);
        
        //solenoid - out connection
        translate([12,-16,38]) rotate([-90,0,0]) cylinder(20,2,2);

/*
        //cmf
        translate([26,2,38]) rotate([0,-90,0]) cylinder(2,7,7);
        translate([25,2,38]) rotate([0,-90,0]) cylinder(20,5,5);
        translate([25,2,38]) rotate([0,-90,0]) cylinder(33,2,2);
*/
        //solenoid
        translate([26,5,38]) rotate([0,-90,0]) cylinder(7,5.5,5.5);
        translate([20,5,38]) rotate([0,-90,0]) cylinder(20,4,4);
        translate([25,5,38]) rotate([0,-90,0]) cylinder(33,1.75,1.75);

        
        //out
        translate([12,-8,-1]) cylinder(3, 5.5, 5.5);
        translate([12,-8,-1]) cylinder(10, 5, 5);
        translate([12,-6,-1]) cylinder(55, 2, 2);
        
        //O2
        translate([-9,10,-1]) cylinder(3, 5.5, 5.5);
        translate([-9,10,-1]) cylinder(10, 5, 5);
        translate([-9,7,-1]) cylinder(41, 2, 2);

        //dil
        translate([-14,-8,-1]) cylinder(3, 5.5, 5.5);
        translate([-14,-8,-1]) cylinder(10, 5, 5);
        translate([-15,-6,-1]) cylinder(60, 2, 2);

    }
}

mav();

//o2 Valve
color("green") translate([27,0,19]) rotate([0,-90,0]) MavValve();
//dil Valve
color("black") translate([27,0,57]) rotate([0,-90,0]) MavValve();
        
/*
//baterije 14500
translate([-7.5,17.5,20]) color("green") {
    cylinder(52,7.5,7.5);
    translate([15,0,0])cylinder(52,7.5,7.5);
}
//kontroler
translate([-15,10,15]) color("blue") cube([30,12,4]);
*/
