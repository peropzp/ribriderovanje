$fn = $preview ? 64 : 128;

//////////////////////////////////////////////////////////
//export

//dsvBody();
//dsvPlug();
//topPlate();
//holderLeft();
//holderRight(); 
//scrubber();
//plug();
//sensors();
//pPortMale();

//grid();
//caseCylinder();
//caseBase();



////////////////////////////////////////////////////////////
//model
translate([150,0,0]) rotate([0,0,-90]) color("purple",1) dsvBody();
translate([150,0,0]) color("blue",1) dsvPlug();
color("cyan",1) topPlate();
color("blue",1) translate([53,10,-10])  holderLeft();
color("blue",1) translate([-53,10,-10]) holderRight(); 
color("red",1)    translate([0,29,0]) scrubber();
color("silver",1) {
    translate([0,29,25]) grid();
    translate([0,29,265]) grid();
}
color("green",1) translate ([-70,0,0]) plug(); 
color("green",1) translate ([70,0,0]) sensors();

//translate([550,0,0]) rotate([0,-90,90]) color("silver",1) caseCylinder ();
//translate([150,0,500]) rotate([0,-90,90]) color("silver",1) caseBase();
color("magenta",1) {
    translate ([0,-57,0]) pPortMale();
    translate ([0,29,-5]) pPortMale();
}


///////////////////////////////////////////////////////////////////////////

color("black",1) {
    translate([0,-58,-15]) pPortFemale();
    translate([0,27,-20]) pPortFemale();
}
module pPortFemale() {
    difference() {
        cylinder(15,28,28);
        translate([0,0,-1]) cylinder(18,16,16);
    }
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
            }
    }
}

//boce
translate([0,50,320])
 linear_extrude(350) circle(50);
translate([0,-50,320])
 linear_extrude(350) circle(50);
////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
//dsv
module dsvBody() {
    difference() {
        union() {
            cylinder(80, 23, 23); //tuba za ventil
            translate([0,25,40]) cylinder(60, 23, 23); //tuba za crevo 1
            translate([0,-25,50]) cylinder(50, 23, 23); //tuba za crevo 2
            translate([-23,-25,50]) cube([46, 50, 32]); //spoj tuba za creva
            translate([-23,0,40]) cube([46, 25, 32]); //dodatak za duzu tubu
            translate([5,15,38]) rotate([-90,30,0])  //usnik
                union() {
                    cylinder(50, 10,10);
                    translate([0,20,0]) cylinder(50, 10,10);
                    translate([-10,0,0]) cube([20,20,50]);
                    translate([0,0,49]) {
                        cylinder(1, 11,11);
                        translate([0,20,0]) cylinder(1, 11,11);
                        translate([-11,0,0]) cube([22,22,1]);
                    }
            }
            translate([-10,20,0]) cube([20,5,25]); //kocka za sraf

        }
        translate([0,0,-1]) cylinder(76, 16, 16); //rupa za venti l
        translate([0,0,-1]) cylinder(56, 19.1, 19.1); //rupa za venti l
        translate([0,25,81]) cylinder(21, 20, 20); //rupa za pecurku 1
        translate([0,25,55]) cylinder(46, 19, 19); //rupa za crevo 1
        translate([0,-25,81]) cylinder(21, 20, 20); //rupa za pecurku 2
        translate([0,-25,55]) cylinder(46, 19, 19); //rupa za crevo 2

//        translate([0,-25,82]) //prsten za crevo 1
//            difference() {
//                    cylinder(16, 24, 24);
//                    cylinder(16, 22, 22);
//            }

//        translate([0,25,82]) //prsten za crevo 2
//            difference() {
//                    cylinder(16, 24, 24);
//                    cylinder(16, 22, 22);
//            }
            
//        translate([-10,-3,82]) cube([20,6,20]); //ispravka za glodalicu izmedju creva

        translate([5,10,38]) rotate([-90,30,0]) //rupa od usnika
            union() {
                cylinder(55, 8,8);
                translate([0,20,0]) cylinder(55, 8,8);
                translate([-8,0,0]) cube([16,20,55]);
            }

        translate([5,48,38]) rotate([-90,30,0])  //prsten za usnik
            difference() {
                union() {
                    cylinder(12, 12,12);
                    translate([0,20,0]) cylinder(12, 12,12);
                    translate([-12,0,0]) cube([24,24,12]);
                }
                union() {
                    cylinder(15, 10,10);
                    translate([0,20,0]) cylinder(15, 10,10);
                    translate([-10,0,0]) cube([20,20,15]);
                }
            }

        translate([0,15,5]) rotate([-90,0,0]) cylinder(20,2,2); //rupa za sraf
    }

}
//////////////////////////////////////////////////////////////////////////////////
//dsv cep
module dsvPlug() {
    color("green",1)
        difference() {
            union() {
                cylinder(55, 19, 19);
                translate([0,0,-7])cylinder(7, 12, 19);
            }
            rotate_extrude() translate([17.1,50,0]) square([2,3]); //oring
            translate([-4,15,-1]) cube([8,8,49]); //slic za sraf
            translate([-3,0,0]) rotate([0,0,20]) translate([0,15.5,42]) cube(6);//zakljucavanje za sraf
            translate([20,0,-2]) rotate([0,-90,0]) cylinder(40, 2, 2); //rupa za kanap
        }
            
}
///////////////////////////////////////////////////////////////////////////////////
 //poklopac 
module topPlate() {
     difference() {
         cylinder(20,89,89); 
         translate([0,29,-1]) cylinder(22, 55.1, 55.1); //scruber
         translate([70,0,-1]) cylinder(22, 17.6, 16.5); //celije levo
         translate([-70,0,-1]) cylinder(22, 17.6, 16.5); //desno
         translate([0,-57,-1]) cylinder(22, 19, 19); //p-port
         translate([0,-57,5]) cylinder(16, 29, 29); //p-port matica 
    }
}
///////////////////////////////////////////////////////////////////////////////////
//osiguraci
module holderLeft() {
    difference() {
        linear_extrude(10) polygon(points=[[0,0],[33,0],[0,40]]);
        translate([13,15,-1]) cylinder(12,2,2); //rupa za sraf
        translate([-52,19,5])cylinder(6,57,57);
        translate([-52,19,-1])cylinder(12,55,55);
        translate([18,-10,5])cylinder(6,19,19);
        translate([18,-10,-1])cylinder(12,17.5,17.5);
    }
}   

module holderRight() {
   mirror([180,0,0])  holderLeft();
}
/////////////////////////////////////////////////////////////////////////////
//scrubber
module scrubber() {
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
        for(b = [10 : 10 : 10])
            translate([0,0,b])
                union() {
                    for(a = [0 : 15 : 350]) 
                        rotate([0,0,a + b])
                            translate([50,0,-10]) 
                                rotate([0,90,0]) cylinder(10,5,5);
                }
    }
}
//////////////////////////////////////////////////////////////////////////////
//resetka
module grid() {
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


//////////////////////////////////////////////////////////////////////////////
//cep
module plug() {
    difference() {
        union() {
            cylinder(25, 17.5,17.5);
            translate([0,0,-5]) cylinder(5, 19, 19);
        }
        rotate_extrude() translate([15.6,6,0]) square([2,3]);  //oring
        rotate_extrude() translate([15.6,12,0]) square([2,3]); //oring
        translate([0,0,-6]) cylinder(27, 3, 3); //rupa za gas
    }
}
///////////////////////////////////////////////////////////////////////////////
//celije
module sensors() {
    difference() {
        union() {
            cylinder(200, 17.5,17.5);
            translate([0,0,-5]) cylinder(5, 19, 19);
        }
        rotate_extrude() translate([15.6,6,0]) square([2,3]); //oring
        rotate_extrude() translate([15.6,12,0]) square([2,3]); //oring
        translate([0,0,20]) cylinder(231, 15.5, 15.5);
        translate([0,0,-6]) cylinder(27, 3, 3);
        translate([0,-10,20]) cylinder(60, 14, 14);
        translate([0,-10,100]) cylinder(30, 14, 14);
        translate([0,-10,150]) cylinder(30, 14, 14);
    }
}
///////////////////////////////////////////////////////////////////////////////
//p-port za creva
module pPortMale() {
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
}
///////////////////////////////////////////////////////////////////////////////
//oklop valjak - 950g
module caseCylinder (){
    difference() {
        cube([559,300,1]);
        for(a = [25 : 30 : 545]) {
            for(b = [30 : 30 : 270]) {
                translate([a,b,-5]) cylinder(10, 10, 10);
            }
        }
    }
}
////////////////////////////////////////////////////////////////////////////////
module caseBase() {
    difference() {
        cylinder(2,89,89);
        for(a = [0 : 30 : 350])
            rotate([0,0,a + 15]) translate([70,0,-5]) cylinder(10, 12, 12);
        translate([-40,0,-5]) cylinder(10, 15, 15);
        translate([40,0,-5]) cylinder(10, 15, 15);

    }
}

