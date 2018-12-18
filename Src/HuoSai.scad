/* �������� */
h = 9;		//�����߶�
L = 180;		//�����뻬�۵ľ���
H = 75;		//���۸߶�
d = 7;		//���ۿ���
tick = 5;	//���ۺ���
//��˿
LSd = 3.2;	//��˿ֱ��
LSh = 2;	//��˿����
LMd = 5.2;	//��ñֱ��
LMt = 2.5;	//��ñ����
LSxd = 10;	//��˿λ�ü���

/* ģ�� */
/* ���� */
//����Բ����
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
/* �� */
module Gan() {
	hull()
	{
		translate([-L, 0, 0]) circle(d = h);
		circle(d = h);
	}
}
/* ��˿ */
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

/* װ�� */
module HuoSai() {
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
			LuoSiO(L-9*LSxd);
		}
	}
}

HuoSai();