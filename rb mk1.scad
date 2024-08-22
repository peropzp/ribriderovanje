$fn = $preview ? 64 : 128;

 //poklopac 
 difference() {
     cylinder(20,89,89); 
     translate([0,29,-1]) cylinder(22, 55.1, 55.1); //scruber
     translate([69,0,-1]) cylinder(22, 16.5, 16.5); //celije levo
     translate([-69,0,-1]) cylinder(22, 16.5, 16.5); //desno
     translate([0,-57,-1]) cylinder(22, 19, 19); //p-port
     translate([0,-57,5]) cylinder(16, 29, 29); //p-port matica 
}

//osiguraci
color("blue",1) 
    translate([52,10,-10]) 
        difference() {
            linear_extrude(10) polygon(points=[[0,0],[33,0],[0,40]]);
            translate([13,15,-1]) cylinder(12,2,2); //rupa za sraf
            translate([-52,19,5])cylinder(6,57,57);
            translate([-52,19,-1])cylinder(12,55,55);
            translate([17,-10,5])cylinder(6,18,18);
            translate([17,-10,-1])cylinder(12,16.5,16.5);
        }
   

color("blue",1)     
    translate([-51,10,-10]) 
        mirror([180,0,0])
        difference() {
            linear_extrude(10) polygon(points=[[0,0],[33,0],[0,40]]);
            translate([13,15,-1]) cylinder(12,2,2);
            translate([-52,19,5])cylinder(6,57,57);
            translate([-52,19,-1])cylinder(12,55,55);
            translate([17,-10,5])cylinder(6,18,18);
            translate([17,-10,-1])cylinder(12,16.5,16.5);
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
                cylinder(285,55,55);
                translate([0,0,-5]) cylinder(5,57,57);
            }
            translate([0,0,-2]) cylinder(300,48,48);
            translate([0,0,25]) cylinder(300,52,52);
            translate([0,0,-6])cylinder(12,19,19);
            rotate_extrude() translate([52.5,6,0]) square([3,3]);
            rotate_extrude() translate([52.5,12,0]) square([3,3]);
            //rupe za disanje
            translate([0,0,275])
            for(b = [0 : 10 : 10])
                translate([0,0,b])
                    union() {
                        for(a = [0 : 20 : 350]) 
                            rotate([0,0,a + b])
                                translate([50,0,-10]) 
                                    rotate([0,90,0]) cylinder(10,5,5);
                    }
        }
    }

//resetka
color("silver",1) {
    for(a = [25 : 230 : 255])
        translate([0,29,a])
        union() {
            difference() {
                cylinder(2,51.5,51.5);
                translate([0,0,-1]) cylinder(4,49,49);
            }
            difference() {
                cylinder(2,8,8);
                translate([0,0,-1]) cylinder(4,3,3);
            }
            difference() {
                cylinder(2,30,30);
                translate([0,0,-1]) cylinder(4,28,28);
            }
            for(a = [0 : 30 : 330]) {
                rotate([0,0,a]) translate([3,-1.5,0]) cube([48,3,2]);
            }
        }
}


//cep
color("green",1)
translate ([-69,0,0])
difference() {
    union() {
        cylinder(25, 16.4,16.4);
        translate([0,0,-5]) cylinder(5, 18, 18);
    }
    rotate_extrude() translate([14.5,6,0]) square([2,3]);  //oring
    rotate_extrude() translate([14.5,12,0]) square([2,3]); //oring
    translate([0,0,-6]) cylinder(27, 3, 3); //rupa za gas
}


//celije
color("green",1)
translate ([69,0,0])
difference() {
    union() {
        cylinder(220, 16.4,16.4);
        translate([0,0,-5]) cylinder(5, 18, 18);
    }
    translate([0,0,20]) cylinder(201, 14.5, 14.5);
    translate([0,0,-6]) cylinder(27, 3, 3);
    translate([10,10,20]) cylinder(60, 14, 14);
    translate([10,10,85]) cylinder(60, 14, 14);
    translate([10,10,150]) cylinder(60, 14, 14);
    rotate_extrude() translate([14.5,6,0]) square([2,3]); //oring
    rotate_extrude() translate([14.5,12,0]) square([2,3]); //oring
}


//p-port za creva
color("magenta",1)
translate ([0,-57,0])
difference() {
    union() {
        cylinder(11, 16.4,16.4);
        translate([0,0,-3]) cylinder(3,17.6, 16.4);
        translate([0,0,-43]) cylinder(40,17.6, 17.6);
        translate([0,0,-45]) cylinder(3,20, 20);
    }
    rotate_extrude() translate([15.5,-8,0]) square([2.5,2]);  //opruga
    rotate_extrude() translate([14.5,4,0]) square([2,3]);  //oring
    translate([0,0,-46]) cylinder(60, 13, 13); //rupa za gas
}


color("magenta",1)
translate ([0,29,-5])
difference() {
    union() {
        cylinder(11, 16.4,16.4);
        translate([0,0,-3]) cylinder(3,17.6, 16.4);
        translate([0,0,-43]) cylinder(40,17.6, 17.6);
        translate([0,0,-45]) cylinder(3,20, 20);
    }
    rotate_extrude() translate([15.5,-8,0]) square([2.5,2]);  //opruga
    rotate_extrude() translate([14.5,4,0]) square([2,3]);  //oring
    translate([0,0,-46]) cylinder(60, 13, 13); //rupa za gas
}

//oklop
color("silver",0.5) {
    union() {
        difference() {
            cylinder(300, 90, 90) ;
            translate([0,0,-1]) cylinder(300, 89, 89) ;
        }

        //nosac za boce
        translate([0,0,309]) 
            union(){    
             translate([-30,0,0]) cylinder(300, 10, 10);
             translate([30,0,0]) cylinder(300, 10, 10);
             translate([-75,0,0]) 
                rotate([0,90,0]) cylinder(150, 10, 10);
             translate([-30,60,0]) 
                rotate([90,0,0]) cylinder(120, 10, 10);
             translate([30,60,0]) 
                rotate([90,0,0]) cylinder(120, 10, 10);
             translate([-26,0,0]) cube([52, 1, 300]);
            }
    }
}


//boce
translate([0,50,320])
 linear_extrude(350) circle(50);
translate([0,-50,320])
 linear_extrude(350) circle(50);
