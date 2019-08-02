// Parametric Fender Style Knob
// GNU GPL v3
// Churuata3D www.churuata3d.com
// Churuata3D <info@churuata3d.com>
// https://www.instagram.com/churuata3d/
// https://www.facebook.com/churuata3d

use <pot.scad>;

//medidas en mm
dia1=19;
dia2=dia1-((dia1*36/100));
alt1=2;
alt2=11;

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

smooth=100;
lessmooth=50;

difference(){
    
    union(){
    //base
    cylinder(h=alt1,r=dia1,$fn=20);
    //tope base
    translate([0,0,alt1])
    cylinder(h=alt1,r1=dia1,r2=dia2,$fn=20);

    //tope
    translate([0,0,alt1*2])
    cylinder(h=alt2,r=dia2,$fn=20);
    }
    
    //volumen
    translate([0,-(dia1/2)+1,16])
    sphere(2,$fn=20);

    pot(pa,pd,smooth);
    pot2(pa,pd,smooth);
    screw(ta,td,altScrew,smooth,z);    

}

