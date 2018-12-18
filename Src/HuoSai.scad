/* 定义变量 */
h = 9;		//导轨高度
L = 120;		//滑块与滑槽的距离
H = 75;		//滑槽高度
d = 7;		//滑槽宽度
tick = 3.5;	//滑槽厚度
//螺丝
LSd = 3.2;	//螺丝直径
LSh = 2;	//螺丝长度
LMd = 5.2;	//螺帽直径
LMt = 2.5;	//螺帽厚度
LSxd = 10;	//螺丝位置间隔

/* 模块 */
/* 滑槽 */
//类椭圆函数
module HuaCao_mod(_r) {
	$fn = _r*20;
	_H = H/2;
	hull() {
		translate([0, _H, 0]) {
			circle(r = _r, center = true);
		}
		translate([0, -_H, 0]) {
			circle(r = _r, center = true);
		}
	}
}
/* 杆 */
module Gan() {
	hull()
	{
		translate([-L, 0, 0]) circle(d = h);
		circle(d = h);
	}
}
/* 螺丝 */
module LuoSiT(_x) {
	translate([-_x, 0]) {
		translate([0, (h-LSh)/2]) square(size=[LSd, LSh+LMt], center=true);
		translate([0, (h-LMt)/2 - LSh ]) square(size=[LMd, LMt], center=true);
	}
}
module LuoSiO(_x) {
	$fn = LSd*20;
	translate([-_x, 0]) {
		circle(d = LSd);
	}
}

/* 装配 */
// linear_extrude(height=4, center=true, convexity=10, twist=0)
difference()
{
	union()
	{
		HuaCao_mod(d/2 + tick);
		Gan();
	}
	HuaCao_mod(d/2);
	// for (i=[1:2:6]) {
	// 	LuoSiT(L - i*LSxd);
	// }
	// for (i=[0:1:7]) {
	// 	LuoSiO(L - i*LSxd);
	// }
	hull()
	{
		LuoSiO(L-LSxd);
		LuoSiO(L-7*LSxd);
	}
}