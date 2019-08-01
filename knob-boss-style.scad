// Parametric Boss Style Knob
// GNU GPL v3
// Churuata3D www.churuata3d.com
// Churuata3D <info@churuata3d.com>
// https://www.instagram.com/churuata3d/
// https://www.facebook.com/churuata3d

//medidas en mm
dia1=9;
diaDiff=0.6;
dia2=dia1-diaDiff;
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
lessmooth=20;
topeRedondeo=35;
//ancho del volumen
volW=diaDiff;
//alto del volumen
volA=0.5;

//numero de huecos vol
volH=16;

difference(){

    union(){

        //middle        
        translate([0,0,alt3])
        cylinder(h=alt1-(alt3),d1=dia1,d2=dia2,$fn=lessmooth);
        //top bisel
        rotate_extrude(convexity = 10, $fn = lessmooth)
        //ajustar el valor dia1/3+0.9 cuando se cambie el radio del bisel
        translate([dia1/3+0.9, alt1, 0])
        circle(r = 0.3, $fn = lessmooth);
        //top intern
        translate([0,0,alt1])
        cylinder(h=diaDiff/2,d=dia2-diaDiff,$fn=lessmooth);
        
    }
    
    //huecos en circulo
    rotate([0,0,360/volH-2+diaDiff*3])
    difference(){
    for(i=[0:volH-2]){
        //tantos 360/ numero de veces que se especifico arriba
        rotate([0,-diaDiff,i*360/volH])
        translate([dia2/2+0.5,0,alt3+1])

        hull() {
            translate([0,0,alt1]) sphere(diaDiff,$fn=lessmooth);
            sphere(diaDiff,$fn=lessmooth);
        }

    }
    
    
}
    //top hole
    translate([0,0,alt1-diaDiff/2])   
    cylinder(h=alt2,d=pd,$fn=smooth);

    //comentar si no se quiere el hueco del potenciometro
    translate([0,0,-0.1])   
    cylinder(h=pa+0.1,d=pd,$fn=smooth);
    
    //comentar si no se quiere el hueco del tornillo
    translate([-20,0,alt2*3]) 
    rotate([0,90,0])  
    cylinder(h=ta+0.1+10,d=td,$fn=smooth);
    
    union(){
    //guia de volumen
    translate([dia3/2-diaDiff/2-0.2,0,alt1-diaDiff-0.1])
    rotate([90,0,0])
    rotate_extrude(angle=90, convexity=10, $fn=smooth)
    translate([1, 0]) circle(diaDiff-0.2, $fn=lessmooth);
    
    translate([dia3,0,alt1+diaDiff/2]) 
    rotate([0,-90,0]) cylinder(r=diaDiff-0.2,h=6, $fn=lessmooth);
    
    translate([dia2-diaDiff*6-0.27,0,1.75]) 
    rotate([0,-2,0]) cylinder(r=diaDiff-0.2,h=alt1-diaDiff, $fn=lessmooth);
    
    translate([dia2-diaDiff*6-0.27,0,1.75]) 
    sphere(diaDiff-0.2, $fn=lessmooth);
    }   
}
