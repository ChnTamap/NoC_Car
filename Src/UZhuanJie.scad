/* �������� */
wU = 20;	//����
hU = 20;	//����
lT = 8;	//T��˿�ۼ���
//��˿
LSd = 3.2;	//��˿ֱ��
LSh = 3;	//��˿����
LMd = 5.2;	//��ñֱ��
LMt = 2.5;	//��ñ����
LSxd = 10;	//��˿λ�ü���

/* ģ�� */
/* ��˿ */
module LuoSiT(_x) {
	translate([-_x, 0]) {
		translate([0, -(LSh)/2]) square(size=[LSd, LSh*4+LMt], center=true);
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

UZhuanJie();