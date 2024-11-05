$fn = $preview ? 64 : 128;

//////////////////////////////////////////////////////////
//export

//                    cylinder(50, 11,11);
//                    translate([0,20,0]) cylinder(50, 11,11);
//                    translate([-11,0,0]) cube([22,20,50]);
                    
//                    union() {
//                        circle(11);
//                        translate([0,-11,0]) square([20,22]);
//                        translate([20,0,0]) circle(11);
//                    }    


//dsvBody();
//hoseConnector();
//dsvMouthpiece();
//dsvPlug();
//topPlate();
//holderLeft();
//holderRight(); 
//scrubber();
//scrubberBase();
//scrubberTube();
//plug();
//adv();
//sensorsPlug();
//sensors();
//pPortMale();
//scruberTool();

//grid();
//sieve();
//caseCylinder();
//caseBase();

//2d
//grid2d();
//sieve2d();
//caseCylinder2d();
//caseBase2d();

/*

////////////////////////////////////////////////////////////
//model
translate([150,0,0]) rotate([0,0,-90]) color("purple",1) dsvBody();
translate([150,0,0]) color("blue",1) dsvPlug();
color("cyan",1) topPlate();
color("blue",1) translate([53,10,-10])  holderLeft();
color("blue",1) translate([-53,10,-10]) holderRight(); 
color("red",1)    translate([0,29,0]) scrubber();
color("silver",1) {
    translate([0,29,20]) grid();
    translate([0,29,280]) grid();
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
translate([0,50,720]) rotate([180,0,-90]) tank();

translate([0,-50,720]) rotate([180,0,-90]) tank();

////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
module regulator() {
    cylinder(50,13,13);
    translate([-45,0,0]) rotate([0,90,00]) cylinder(85,20,20);
}


//tank();
module tank() {
    translate([0,0,50]) union() {
        sphere(r = 50);
        cylinder(270,50,50);
        translate([0,0,270]) sphere(r = 50);
        translate([0,0,310]) cylinder(35,15,15);
        translate([0,30,345]) rotate([90,0,0]) cylinder(85,15,15);
        translate([0,-15,345]) rotate([90,0,0]) cylinder(40,20,20);
        translate([0,60,345]) rotate([90,0,0]) regulator();
    }
}
*/
///////////////////////////////////////////////////////////////////////////
//dsv
//dsv();
module dsv() {
    color("green",1) difference() {
        dsvBody();
//        translate([0,-50,-10]) cube(123);
    }
    
    color("blue",1) difference() {
        translate([0,5,0]) dsvMouthpiece();
//        translate([0,20,10]) cube([30,100,40]);
    }

    color("cyan",1) difference() {
        translate([0,-26,110]) rotate([0,180,0]) hoseConnector();
//        translate([0,-47,75]) cube(44);
    }
    
    color("magenta",1) difference() {
        dsvPlug();
//        translate([0,-19,-6]) cube([20,38,61]);
    }

}
//dsvMouthpiece();    
module dsvMouthpiece() {

    difference() {
        union() {
            translate([5,15,38]) rotate([-90,00,0])  //usnik
                union() {
                    cylinder(50, 11,11);
                    translate([0,20,0]) cylinder(50, 11,11);
                    translate([-11,0,0]) cube([22,20,50]);
            }
        }
        translate([5,10,38]) rotate([-90,00,0]) //rupa od usnika
            union() {
                cylinder(60, 8,8);
                translate([0,20,0]) cylinder(60, 8,8);
                translate([-8,0,0]) cube([16,20,60]);
            }
    }

}
//////////////////////////////////////////////////////////////////////////////////
//dsvBody();
module dsvBody() {

    difference() {
        union() {
            //translate([-27,-23,0]) cube([54, 50, 50]); //tuba za ventil
            translate([0,26,0]) cylinder(85, 27, 27); //tuba za crevo 1
            translate([0,-26,0]) cylinder(85, 27, 27); //tuba za crevo 2
            translate([-27,-27,0]) cube([54, 54, 85]);
        }
        translate([0,0,-1]) cylinder(76, 17, 17); //rupa za venti l
        translate([0,0,-1]) cylinder(56, 19.2, 19.2); //rupa za venti 2
        translate([0,26,75]) cylinder(21, 23, 23); //rupa za pecurku 1
        translate([0,26,55]) cylinder(46, 21, 21); //rupa za crevo 1
        translate([0,-26,75]) cylinder(21, 23, 23); //rupa za pecurku 2
        translate([0,-26,55]) cylinder(46, 21, 21); //rupa za crevo 2
        
        translate([5,25,38]) rotate([-90,30,0])  //rupa za usnik
            union() {
                cylinder(50, 11,11);
                translate([0,20,0]) cylinder(50, 11,11);
                translate([-11,0,0]) cube([22,20,50]);
                translate([0,0,-15]) {
                    cylinder(20, 8,8);
                    translate([0,20,0]) cylinder(60, 8,8);
                    translate([-8,0,0]) cube([16,20,60]);
                }
        }
        //rupa za sraf
        translate([0,15,5]) rotate([-90,0,0]) cylinder(50,2.5,2.5); 
    }

}
//hoseConnector();
module hoseConnector() {

    difference() {
        union() {
            cylinder(2, 24, 24); //tuba za crevo 1
            cylinder(35, 23, 23); //tuba za crevo 2
        }
        translate([0,0,-1]) cylinder(37, 19, 19); //rupa za pecurku 1
        translate([0,0,-1]) cylinder(34, 20, 20); //rupa za crevo 1
    }
}

//////////////////////////////////////////////////////////////////////////////////
//dsv cep
//dsvPlug();
module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        translate([rdim,rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);

        translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
    }
}
module dsvPlug() {
        difference() {
            union() {
                cylinder(55, 19, 19);
                translate([0,0,-7])cylinder(7, 12, 19);
            }
            rotate_extrude() translate([17.5,50,0]) square([2,2]); //oring
            translate([-3,22,-7]) rotate([90,0,0]) roundedcube(6 ,55 ,6,3);
            translate([20,0,-2]) rotate([0,-90,0]) cylinder(40, 2, 2); //rupa za kanap
        }
}
///////////////////////////////////////////////////////////////////////////////////
mashroom2d();
module mashroom() {
    
    difference() {
        cylinder(5, 20, 20);
        translate([0,0,-1]) cylinder(7, 16.5, 16.5);
    }
    difference() {
        cylinder(2, 2.5, 2.5);
        translate([0,0,-1]) cylinder(4, 1, 1);
    }
    
    for(a = [0 : 36 : 360]) {
        rotate([0,0,a]) translate([2,-0.5,0]) cube([17,1,2]);
    }
}

module mashroom2d() {
    
    difference() {
        circle(20);
        circle(16.5);
    }
    difference() {
        circle(2);
        circle(1);
    }
    
    for(a = [0 : 36 : 360]) {
        rotate([0,0,a]) translate([2,-0.5,0]) square([17,1]);
    }
}





///////////////////////////////////////////////////////////////////////////////////
 //poklopac 
//topPlate();
module topPlate() {
     difference() {
         cylinder(15,90,90); 
         translate([0,29,-1]) cylinder(22, 55.1, 55.1); //scruber
         translate([70,0,-1]) cylinder(22, 17.7, 17.7); //celije levo
         translate([-70,0,-1]) cylinder(22, 17.7, 17.7); //desno
         translate([0,-57,-1]) cylinder(22, 19, 19); //p-port
         translate([0,-57,5]) cylinder(16, 28, 28); //p-port matica 
    }
}
///////////////////////////////////////////////////////////////////////////////////
//osiguraci
module holderLeft() {
    difference() {
        linear_extrude(10) polygon(points=[[0,0],[35,0],[0,40]]);
        translate([9,23,-1]) cylinder(12,2,2); //rupa za sraf
        translate([18,13,-1]) cylinder(12,2,2); //rupa za sraf
        translate([9,13,-1]) cylinder(12,2,2); //rupa za sraf
        translate([-52,19,5])cylinder(6,57,57);
        translate([-52,19,-1])cylinder(12,55,55);
        translate([18,-10,5])cylinder(6,19,19);
        translate([18,-10,-1])cylinder(12,17.5,17.5);
        translate([28,-7,-1]) rotate([0,0,45]) cube(12); //coskovi
        translate([0,-7,-1]) rotate([0,0,45]) cube(12);
        translate([0,24,-1]) rotate([0,0,45]) cube(12);
    }
}   

module holderRight() {
   mirror([180,0,0])  holderLeft();
}
/////////////////////////////////////////////////////////////////////////////
//scrubber
module scrubber() {
    color("red",1) scrubberBase();
    color("green",0.5) translate([0,0,13]) scrubberTube();
}
//scrubberBase();
module scrubberBase() {

    difference() {
        union () {
            cylinder(20,55,55);
            translate([0,0,-5]) cylinder(5,57,57);
        }
        translate([0,0,10]) 
            difference() {
                cylinder(11,56,56);
                translate([0,0,-1]) cylinder(13,52,52);
            }
       
        translate([0,0,0]) cylinder(30,46,46);
        translate([0,0,-6])cylinder(7,19,19); //rupa za pport
        rotate_extrude() translate([53.5,2,0]) square([2,2]); //oring
        rotate_extrude() translate([53.5,6,0]) square([2,2]); // oring
         //nareckani obod
/*        difference() {
            translate([0,0,-6]) cylinder(7, 60, 60);
            translate([0,0,-7]) cylinder(9, 55,55);
                for(a = [0 : 10 : 360]) {
                    if((a != 10) && (a!=20) && (a!=30)
                        &&(a != 200) && (a!=210) && (a!=220))
                        rotate([0,0,a]) translate([54,-2.5,-6]) cube(7,5,7);
                }
        }*/
    }
}
module scrubberTube() {

    difference() {
        union () {
            cylinder(280,55,55);
        }
        translate([0,0,-1]) cylinder(282,52,52);
        translate([0,0,272])
            union() {
                for(a = [0 : 15 : 350]) 
                    rotate([0,0,a])
                        translate([50,0,0]) 
                            rotate([0,90,0]) cylinder(10,5,5);
            }
    }

}
//////////////////////////////////////////////////////////////////////////////
//resetka
module grid() {
    union() {
        difference() {
            cylinder(2,52,52);
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
//resetka2d
//grid2d();
module grid2d() {
    union() {
        difference() {
            circle(52);
            circle(49);
        }
        difference() {
            circle(8);
            circle(3);
        }
        difference() {
            circle(30);
            circle(29);
        }
        for(a = [0 : 30 : 330]) {
            rotate([0,0,a]) translate([3,-1.5,0]) square([48,3]);
        }
    }
}


//////////////////////////////////////////////////////////////////////////////
//sito
module sieve() {
        difference() {
            cylinder(0.5,51.5,51.5);
            translate([0,0,-1]) cylinder(4,3,3);
            for(a = [8 : 1.5 : 49]) {
                for(b = [0 : 90/a : 360]) {
                  rotate([0,0,b+a]) translate([a,0,-1]) cylinder(2,0.65,0.65, $fn=6);
                }
            }
        }
}

//sieve2d();
module sieve2d() {
        difference() {
            circle(51.5);
            circle(3);
/*            for(a = [8 : 1.5 : 49]) {
                for(b = [0 : 90/a : 360]) {
                  rotate([0,0,b+a]) translate([a,0,0]) circle(0.65, $fn=6);
                }
            }*/
        }
}


//////////////////////////////////////////////////////////////////////////////
//sabijac
module scrubberTool() {
        difference() {
            cylinder(100,51.5,51.5);
            translate([0,0,-1]) cylinder(102,3,3);
        }
}
    
//////////////////////////////////////////////////////////////////////////////
//cep
//plug();
module plug() {
    difference() {
        union() {
            cylinder(20, 17.5,17.5);
            translate([0,0,-5]) cylinder(5, 19, 19);
        }
//        translate([0,0,13]) 
//            difference() {
//                cylinder(20,18,18);
//                translate([0,0,-1]) cylinder(22,15.5,15.5);
//            }

        rotate_extrude() translate([16,2,0]) square([2,2]); //oring
        rotate_extrude() translate([16,6,0]) square([2,2]); //oring
        translate([0,0,-6]) cylinder(27, 3, 3);
        
 /*       difference() { //grooves
            translate([0,0,-6]) cylinder(7, 20, 20);
            translate([0,0,-6]) cylinder(7, 17.5,17.5);
                for(a = [0 : 30 : 330]) {
                    if((a != 240) && (a!=270)&& (a!=300))
                        rotate([0,0,a]) translate([17,-2.5,-6]) cube(5,5,7);
                }
        }*/
    }
}
///////////////////////////////////////////////////////////////////////////////
//celije
//inputPlug();
module inputPlug() {
    difference() {
        plug();
        translate([0,0,10]) 
            difference() {
                cylinder(20,18,18);
                translate([0,0,-1]) cylinder(22,15.5,15.5);
            }
    }
}

//sensorsPlug();
module sensorsPlug() {
    difference() {
        plug();
        translate([0,0,10]) 
            difference() {
                cylinder(20,18,18);
                translate([0,0,-1]) cylinder(22,14,14);
            }
    }
}
    
        
    
module sensors() {
    difference() {
        cylinder(200, 17.5,17.5);
        translate([0,0,-1]) cylinder(202, 15.5, 15.5);
        translate([0,-10,20]) cylinder(60, 14, 14);
        translate([0,-10,100]) cylinder(30, 14, 14);
        translate([0,-10,150]) cylinder(30, 14, 14);
    }
}
///////////////////////////////////////////////////////////////////////////////
//adv
//adv();
module adv() {
    difference() { 
        plug();
        translate([0,0,-6]) cylinder(27, 7.2, 7.2);
        translate([0,0,1]) cylinder(27, 9.5, 9.5);
    }
}


///////////////////////////////////////////////////////////////////////////////
//p-port za creva
//pPortMale();
module pPortMale() {
    difference() {
        union() {
            cylinder(11, 16.5,16.5);
            translate([0,0,-3]) cylinder(3,16.5, 16.5);
            translate([0,0,-43]) cylinder(40,18,18);
            translate([0,0,-45]) cylinder(3,20, 20);
        }
        rotate_extrude() translate([15.5,-8,0]) square([3,2.5]);  //opruga
        rotate_extrude() translate([15,4,0]) square([2,2]);  //oring
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

//caseCylinder2d ();
module caseCylinder2d (){
    difference() {
        square([570,300]);
        for(a = [30 : 15 : 545]) {
            for(b = [30 : 15 : 270]) {
                translate([a,b,0]) circle(5);
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
//caseBase2d();
module caseBase2d() {
    difference() {
        circle(91);
        for(a = [0 : 15 : 350])
            rotate([0,0,a + 15]) translate([70,0,0]) circle(5);
        for(a = [25 : 20 : 140])
            rotate([0,0,a + 15]) translate([50,0,0]) circle(5);
        for(a = [205 : 20 : 320])
            rotate([0,0,a + 15]) translate([50,0,0]) circle(5);
        for(a = [30 : 30 : 140])
            rotate([0,0,a + 15]) translate([30,0,0]) circle(5);
        for(a = [210 : 30 : 320])
            rotate([0,0,a + 15]) translate([30,0,0]) circle(5);
        for(a = [0 : 90 : 350])
            rotate([0,0,a + 15]) translate([10,0,0]) circle(5);
        translate([-40,0,0]) circle(15);
        translate([40,0,0]) circle(15);

    }
}
