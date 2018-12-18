use <HuoSai.scad>
use <UZhuanJie.scad>
rotate([90, 0, 0]) 
{
	translate([10*cos(360*$t),0,0]) color([0.8,0.7,0]) linear_extrude(height=4, center=true, convexity=10, twist=0)
		HuoSai();
    
    color([0.9,0.6,0]) translate([10*cos(360*$t),-20+10*sin(360*$t),3]) difference()
    {
        cylinder($fn=20,d=7,h=12,center=true);
        cylinder($fn=20,d=3,h=22,center=true);
    }
}

color([0.7,0.9,0]) translate([-100+10*cos(360*$t), 10, 0]) rotate([0, 0, 180]) 
{
	linear_extrude(height=6, center=true, convexity=10, twist=0)
		UZhuanJie();
    
    translate([0,-4,3]) difference()
    {
        cylinder($fn=20,d=7,h=10);
        cylinder($fn=20,d=3,h=22,center=true);
    }
}