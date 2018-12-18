use <HuoSai.scad>
use <UZhuanJie.scad>
rotate([90, 0, 0]) 
	linear_extrude(height=4, center=true, convexity=10, twist=0)
		HuoSai();
translate([-100, 10, 0]) rotate([0, 0, 180]) 
	linear_extrude(height=4, center=true, convexity=10, twist=0)
		UZhuanJie();