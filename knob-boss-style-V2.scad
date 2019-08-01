// Parametric Boss Style V2 Knob
// GNU GPL v3
// Churuata3D www.churuata3d.com
// Churuata3D <info@churuata3d.com>
// https://www.instagram.com/churuata3d/
// https://www.facebook.com/churuata3d

//medidas en mm
dia1=15;
dia2=dia1-2;
dia3=dia2-1;
//diff
alt1=12;
alt2=2;
alt3=alt2/2.4;
//altura del tope
alt4=0.5;

//diametro del potenciometro
pd=6;
//altura del potenciometro
pa=10;
//diametro del tornillo
td=2;
//altura del tornillo
ta=10;
poli=14;
smooth=100;
lessmooth=50;
topeRedondeo=35;
//ancho del volumen
volW=1.5;
//alto del volumen
volA=0.5;

//numero de huecos vol
volH=14;

difference(){

    union(){
        //bottom
        translate([0,0,0])   
        cylinder(h=alt2,d=dia1,$fn=smooth);
        //bottom up
        translate([0,0,2])
        cylinder(h=alt2/2,r1=dia1/2,r2=dia2/2,$fn=smooth);
        //middle        
        translate([0,0,alt3])
        cylinder(h=alt1-(alt3),d=dia2,$fn=smooth);
        //top bottom
        translate([0,0,alt1])
        cylinder(h=alt4,d1=dia2,d2=dia3,$fn=smooth);
        //top
        translate([0,0,alt1+alt4])
        cylinder(h=alt4,d1=dia3,d2=dia3,$fn=smooth);        
        
    }
    
    //huecos en circulo
    difference(){
    for(i=[0:volH]){
        //tantos 360/ numero de veces que se especifico arriba
        rotate([0,-90,i*360/volH])
        translate([alt1/2,0,dia2/2-volA*2])
        minkowski()
        {
          cube([10,volW/64,volW],$fn=lessmooth);
          cylinder(r=volW/2,h=volW/2,$fn=lessmooth);
        }

    }

    translate([0,0,alt1/2-alt2])
    cylinder(h=alt1+alt2,d=dia3,$fn=smooth); 

}


    //comentar si no se quiere el hueco del potenciometro
    translate([0,0,-0.1])   
    cylinder(h=pa+0.1,d=pd,$fn=smooth);
    
    //comentar si no se quiere el hueco del tornillo
    translate([0,0,alt2*2]) 
    rotate([0,90,0])  
    cylinder(h=ta+0.1+10,d=td,$fn=smooth);
    
    //raya volumen tope
    translate([-dia1/2,-volW/2,alt1+volA+0.01])
    cube([dia1,volW,volA],false);
    
    difference(){
        //raya volumen lateral
        translate([-dia1/2-volA,-volW/2,-volA])
        cube([volW*2,volW,dia1],false);

        translate([0,0,-alt3])
        cylinder(h=dia1+alt2,d=dia3,$fn=smooth);
    }

}



