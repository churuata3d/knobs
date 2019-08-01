// Parametric chickenhead Style Knob
// GNU GPL v3
// Churuata3D www.churuata3d.com
// Churuata3D <info@churuata3d.com>
// https://www.instagram.com/churuata3d/
// https://www.facebook.com/churuata3d

use <pot.scad>;

diaExt=23.4;
dia=16.5;
dia2=13.3;
diaCenter=7;
dia3=20;
altTotal=14.5;
reSi=dia*1.75;
zlift=reSi*2-reSi*2.2;
alt1=12.5;
alt2=13.2;
punta=2;
diffAlt=altTotal-alt1;
smooth=100;
lessmooth=50;
//bisel de la parte posterior del knob
bisel=4;

//diametro del potenciometro
pd=6;
//altura del potenciometro
pa=10;
//diametro del tornillo
td=3;
//altura del tornillo
ta=10;
altScrew=alt2;
//orientacion del hueco
z=90;

#difference(){
    union(){
        difference(){
            //tope huevo
            translate([0,0,0])
            resize([dia,dia,reSi],true)
            rotate([90,0,0])
            sphere(r = dia,$fn=lessmooth);
            
            //cubo bottom
            translate([0,0,-altTotal])
            cube([dia+1,dia+1,altTotal*2],true);
            
            //cubo top
            translate([0,0,altTotal/2+altTotal-diffAlt])
            cube([altTotal,altTotal,altTotal],true);
        }

        difference(){
            union(){
                difference(){
                    //perilla
                    union(){
                        intersection(){
                            intersection(){
                                cylinder(h=altTotal,d=diaExt,$fn=lessmooth);
                                translate([-diaCenter/2,-diaExt/2,0])
                                cube([diaCenter,diaExt,altTotal]);
                            }
                            difference(){
                                rotate([0,90,0])
                                translate([0,0,-altTotal])
                                resize([diaExt+5.60,diaExt,altTotal*2],true)
                                cylinder(h=altTotal,d=diaExt,$fn=lessmooth);
                                translate([-diaExt,0,-altTotal-1])
                                cube([diaExt*2,diaExt,(altTotal*2)+2],false);
                            }
                        }

                        difference(){
                            intersection(){
                                union(){
                                    cylinder(h=altTotal-bisel,d=diaExt,$fn=lessmooth);
                                    cylinder(h=altTotal,d=diaExt-bisel*2,$fn=lessmooth);
                                    rotate_extrude(angle=360, convexity=10,$fn=lessmooth)
                                    translate([(diaExt/2)-bisel, altTotal-bisel]) circle(bisel,$fn=lessmooth);
                                }
                                translate([-diaCenter/2,-diaExt/2,0])
                                cube([diaCenter,diaExt,altTotal]);
                            }
                            translate([-(diaCenter/2)-1,-diaExt/2,0])
                            cube([diaCenter+2,diaExt/2,altTotal+1]);
                        }
                    }

                    //corte lateral con angulo
                    mirror([1,0,0]){
                        translate([punta/2,-diaExt/2,-1])
                        rotate([0,0,-6.25])
                        cube([diaExt,diaExt+1,diaExt],false);
                    }

                        translate([punta/2,-diaExt/2,-1])
                        rotate([0,0,-6.25])
                        cube([diaExt,diaExt+1,diaExt],false);
                    
                }

                difference(){
                    //perilla externa
                    union(){
                        intersection(){
                            intersection(){
                                union(){
                                    cylinder(h=altTotal-bisel-2,d=dia3,$fn=lessmooth);
                                    cylinder(h=altTotal-2,d=dia3-bisel*2,$fn=lessmooth);
                                    rotate_extrude(angle=360, convexity=10,$fn=lessmooth)
                                    translate([(dia3/2)-bisel, altTotal-bisel-2]) circle(bisel,$fn=lessmooth);
                                }
                                translate([-(diaCenter+2)/2,0,0])
                                cube([diaCenter+2,diaExt,altTotal]);
                            }

                        }

                    }
                    
                    //corte superior
                    translate([-(diaCenter+2)/2,-diaExt/2,altTotal-diffAlt])
                    cube([diaCenter+2,diaExt,altTotal]);

                    //corte lateral con angulo
                    mirror([1,0,0]){
                        translate([(punta/2),-diaExt/2,-1])
                        rotate([0,0,-9.65])
                        cube([diaExt,diaExt+1,diaExt],false);
                    }

                        translate([(punta/2),-diaExt/2,-1])
                        rotate([0,0,-9.65])
                        cube([diaExt,diaExt+1,diaExt],false);
                }

                }

                    //raya del volumen
                    union(){
                        rotate([90,0,-90])
                        resize([0,15,0],false)
                        rotate_extrude(angle=90, convexity=10)
                        translate([diaExt/2, 0]) circle(0.3,$fn=lessmooth);
                                        
                        //esfera al final de la raya del volumen        
                        //translate([0,-0.05,altTotal])
                        //sphere(0.3,$fn=lessmooth);
                    }
        }
    }

    //
    pot(pa,pd,smooth);
    pot2(pa,pd,smooth);
    screw(ta,td,altScrew,smooth,z);
}
