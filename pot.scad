//medidas para el potenciometro y tornillo

module pot(pa,pd,smooth){
    translate([0,0,-0.1])   
    cylinder(h=pa+0.1,d=pd,$fn=smooth);
}

module pot2(pa,pd,smooth){
    translate([0,0,-0.1])   
    cylinder(h=pa/10+0.1,d=pd*2,$fn=smooth);
}
    
module screw(ta,td,alt,smooth,z){
    rotate([0,0,z])
    translate([0,0,alt/2]) 
    rotate([0,90,0])  
    cylinder(h=ta+0.1+10,d=td,$fn=smooth);
    
    //espacio para la tuerca M3
    translate([0,9,alt/2])
    rotate([90,90,0])
    cylinder(h=2.7,d=6.5,$fn=6);

    translate([0,9-1.35,0])
    cube([5.629,2.7,10],true);
}