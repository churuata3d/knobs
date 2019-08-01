// Parametric Fender Style Knob
// GNU GPL v3
// Churuata3D www.churuata3d.com
// Churuata3D <info@churuata3d.com>
// https://www.instagram.com/churuata3d/
// https://www.facebook.com/churuata3d

//medidas en mm
dia1=19;
dia2=dia1-((dia1*36/100));
alt1=2;
alt2=11;
//diametro del potenciometro
pd=6;
//altura del potenciometro
pa=10;

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

    translate([0,0,-0.1])   
    cylinder(h=pa,r=pd,$fn=20);
    
    translate([0,(dia1/2)-1,16])
    sphere(2,$fn=20);
    

}

