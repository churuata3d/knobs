// Parametric Electro-Harmonix Style Knob
// GNU GPL v3
// Churuata3D www.churuata3d.com
// Churuata3D <info@churuata3d.com>
// https://www.instagram.com/churuata3d/
// https://www.facebook.com/churuata3d


//cilindro externo tamano de la perilla
//desde 15mm hasta 35mm se puede ajustar perfectamente

use <pot.scad>;

dia=20;
alt=10;
rad=dia/2;

//bevel size (from 0 to 5)
size=1.5;
smooth=60;

//cilindro interno
dia2=dia-size;
alt2=size;

//marca de volumen
vol=dia/50;
sizeVol=dia/4;
pos=rad-sizeVol/size; 
smoothVol=50;

//diametro del potenciometro
pd=6;
//altura del potenciometro
pa=10;
//diametro del tornillo
td=3;
//altura del tornillo
ta=10;
altScrew=alt;
//orientacion del hueco
z=90;

difference(){
    union(){
        rotate_extrude(convexity = 100, $fn = smooth)
        translate([rad-size, alt, 0])
        circle(r = size, $fn = smooth);
        cylinder(d=dia,h=alt, $fn = smooth);

        translate([0,0,alt])
        cylinder(d=dia2-size,h=alt2,$fn = smooth);
    }

    translate([0,pos,alt+size])
    hull() {
        translate([0,-sizeVol,0]) sphere(vol,$fn=20);
        sphere(vol,$fn=smoothVol);
                    
    }
    pot(pa,pd,smooth);
    pot2(pa,pd,smooth);
    screw(ta,td,altScrew,smooth,z);   
    
}

