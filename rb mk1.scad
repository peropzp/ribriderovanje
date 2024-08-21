
 //poklopac 
 difference() {
     cylinder(20,89,89); 
     translate([0,29,-1]) cylinder(22, 55.1, 55.1); //scruber
     translate([69,0,-1]) cylinder(22, 16.1, 16.1); //celije levo
     translate([-69,0,-1]) cylinder(22, 16.1, 16.1); //desno
     translate([0,-57,-1]) cylinder(22, 19, 19); //p-port
     translate([0,-57,10]) cylinder(16, 29, 29); //p-port matica 
     translate([48,-10,-1]) cylinder(6,5,5);  //rupe za osigurace
     translate([48,-10,-1]) cylinder(18,2,2);  //rupe za osigurace
     translate([-48,-10,-1]) cylinder(6,5,5);
     translate([-48,-10,-1]) cylinder(18,2,2);  //rupe za osigurace
}

//osiguraci
color("blue",1) {
    translate([48,-10,-10]) rotate([0,0,45]) {
        difference() {
            union() {
                cylinder(15,5,5);
                intersection() {
                    cylinder(5,10,10);
                    translate([-3,-3,0])
                    linear_extrude(10) polygon(points=[[0,0],[30,0],[0,30]]);
                }
            }
            translate([0,0,-1]) cylinder(17,2.5,2.5);
        }
    }
    translate([-48,-10,-10]) rotate([0,0,45]) {
        difference() {
            union() {
                cylinder(15,5,5);
                intersection() {
                    cylinder(5,10,10);
                    translate([-3,-3,0])
                    linear_extrude(10) polygon(points=[[0,0],[30,0],[0,30]]);
                }
            }
            translate([0,0,-1]) cylinder(17,2.5,2.5);
        }
    }
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
            //rupe za disanje
            translate([0,0,260])
            for(b = [0 : 10 : 30])
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
    for(a = [25 : 215 : 240])
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
        cylinder(25, 16,16);
        translate([0,0,-5]) cylinder(5, 18, 18);
    }
    rotate_extrude() translate([14.5,8,0]) square([2,2]);
    rotate_extrude() translate([14.5,12,0]) square([2,2]);
    translate([0,0,-6]) cylinder(27, 3, 3);
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


