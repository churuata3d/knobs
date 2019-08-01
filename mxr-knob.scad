//medidas en mm
dia1=20.2;
dia2=15;
dia3=18;
//diff
alt1=11.45;
alt2=4;
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
topeRedondeo=35;
vol=0.4;


color("#333333"){
difference(){

    union(){

        difference(){
            intersection(){
                translate([0,0,-0.05])   
                cylinder(h=alt2,d=dia1,$fn=smooth);
                translate([0,0,-36.985])
                sphere(40,$fn=smooth);
            }
            rotate([0,0,360/14])
            translate([0,8.5,2]) sphere(vol,$fn=20);

        }

        difference(){
            intersection(){
                difference(){
                cylinder(h=alt1,d=dia2,$fn=poli);

                    for(i=[0:7]){
                        union() {
                        rotate([0,0,i*360/7])
                        translate([0,15.5,0])
                        cylinder(h=alt1,d=dia3,$fn=smooth,center=false);
                        }
                    }
                }

                    translate([0,0,-topeRedondeo+alt1])
                    sphere(topeRedondeo,$fn=smooth);
            }

            translate([0,0,alt1])
            hull() {
                rotate([0,0,360/14])
                translate([0,5,-0.4]) sphere(vol,$fn=20);
                sphere(vol,$fn=20);
                
            }

        }
    }

    //comentar si no se quiere el hueco del potenciometro
    translate([0,0,-0.1])   
    cylinder(h=pa+0.1,d=pd,$fn=smooth);
    
    //comentar si no se quiere el huevo del tornillo
    translate([0,0,6.5]) 
    rotate([90,90,360/14])  
    cylinder(h=ta+0.1+10,d=td,$fn=smooth);
}
}
