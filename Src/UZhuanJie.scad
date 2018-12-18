/* 定义变量 */
wU = 16;	//宽度
hU = 16;	//长度
lT = 8;	//T螺丝槽间距
//螺丝
LSd = 3.2;	//螺丝直径
LSh = 3;	//螺丝长度
LMd = 5.2;	//螺帽直径
LMt = 2.5;	//螺帽厚度
LSxd = 10;	//螺丝位置间隔

/* 模块 */
/* 螺丝 */
module LuoSiT(_x) {
	translate([-_x, 0]) {
		translate([0, -(LSh)/2]) square(size=[LSd, LSh+LMt], center=true);
		translate([0, -LSh-LMt/2 ]) square(size=[LMd, LMt], center=true);
	}
}
module LuoSiO(_x) {
	$fn = LSd*20;
	translate([-_x, 0]) {
		circle(d = LSd);
	}
}


module UZhuanJie() {
	// linear_extrude(height=4, center=true, convexity=10, twist=0)
	difference()
	{
		union()
		{
			circle($fn=40,d=wU);
			translate([0, (hU-wU/2)/2, 0]) square(size=[wU, hU-wU/2], center=true);
		}
		translate([0, hU-wU/2, 0]) {
			LuoSiT(lT/2);
			LuoSiT(-lT/2);
		}
		translate([0,-hU/5]) LuoSiO(0);
	}
}