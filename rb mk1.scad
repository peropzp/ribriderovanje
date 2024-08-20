
 //poklopac 

 difference() {
 cylinder(20,89,89); 
 translate([0,29,-1]) cylinder(22, 55.1, 55.1); //scruber
 translate([69,0,-1]) cylinder(22, 16.1, 16.1); //celije
 translate([0,-57,-1]) cylinder(22, 19, 19); //p-port
 translate([0,-57,10]) cylinder(16, 29, 29); //p-port matica 
}


color("black",1) {
    translate([0,-58,-15])
    difference() {
        cylinder(15,28,28);
        translate([0,0,-1]) cylinder(18,16,16);
    }
}


color("black",1) {
    translate([0,27,-20])
    difference() {
        cylinder(15,28,28);
        translate([0,0,-1]) cylinder(18,16,16);
    }
}



//scrubber
color("red",1) {
    translate([0,29,0])
        difference() {
            union () {
                cylinder(290,55,55);
                translate([0,0,-5]) cylinder(5,57,57);
            }
            translate([0,0,-2]) cylinder(300,48,48);
            translate([0,0,25]) cylinder(300,52,52);
            translate([0,0,-6])cylinder(12,19,19);
            rotate_extrude() translate([53.5,8,0]) square([2,2]);
            rotate_extrude() translate([53.5,12,0]) square([2,2]);
            //rupe za drzac
            translate([50,0,260]) rotate([0,90,0]) cylinder(10,3,3);
            translate([-60,0,260]) rotate([0,90,0]) cylinder(10,3,3);
            translate([0,60,260]) rotate([90,90,0]) cylinder(10,3,3);
            translate([0,-50,260]) rotate([90,90,0]) cylinder(10,3,3);
        }
    }


//zatvarac
color("blue",1) {
    translate([0,29,255])
    difference() {
        union() {
            cylinder(6,52,52);
            translate([51,0,3]) rotate([0,90,0]) cylinder(3,2.5,2.5);
            translate([-54,0,3]) rotate([0,90,0]) cylinder(3,2.5,2.5);
            translate([0,54,3]) rotate([90,90,0]) cylinder(3,2.5,2.5);
            translate([0,-51,3]) rotate([90,90,0]) cylinder(3,2.5,2.5);
        }
        translate([0,0,-1]) cylinder(8,49,49);
        translate([5,5,-1]) cube([52,52,10]);
    }
}


//celije
color("green",1)
translate ([69,0,0])
difference() {
    union() {
        cylinder(220, 16,16);
        translate([0,0,-5]) cylinder(5, 18, 18);
    }
    translate([0,0,20]) cylinder(201, 14, 14);
    translate([0,0,-6]) cylinder(27, 3, 3);
    translate([10,10,20]) cylinder(60, 14, 14);
    translate([10,10,85]) cylinder(60, 14, 14);
    translate([10,10,150]) cylinder(60, 14, 14);
    rotate_extrude() translate([14.5,8,0]) square([2,2]);
    rotate_extrude() translate([14.5,12,0]) square([2,2]);
}



//oklop
color("silver",0.5) {
 difference() {
 cylinder(300, 90, 90) ;
 translate([0,0,-1]) cylinder(300, 89, 89) ;
 }
translate([-30,0,300])
 linear_extrude(300) circle(10);
translate([30,0,300])
 linear_extrude(300) circle(10);
 
 translate([-30,0,300])
 rotate([0,90,0])
 linear_extrude(60) circle(10);
 
 translate([-30,0,300])
    rotate([90,0,0])
        linear_extrude(60) circle(10);

  translate([30,0,300])
    rotate([-90,0,0])
        linear_extrude(60) circle(10);
}


//boce
translate([0,50,320])
 linear_extrude(350) circle(50);
translate([0,-50,320])
 linear_extrude(350) circle(50);


