.TITLE DELAY TEST (METHOD 3) BY ZHUOXU

.OPTIONS POST BRIEF
.OP
.LIB "../../model/l0040ll_v1p4_1r.lib" tt
.TEMP 25
.GLOBAL gnd! vcc!

$ CMOS四输入与非门
.SUBCKT nand4 vi1 vi2 vi3 vi4 vo
XP1 vo vi1 vcc! vcc! p11ll_ckt w=240n l=40n $ A, PMOS
XP2 vo vi2 vcc! vcc! p11ll_ckt w=240n l=40n $ B, PMOS
XP3 vo vi3 vcc! vcc! p11ll_ckt w=240n l=40n $ C, PMOS
XP4 vo vi4 vcc! vcc! p11ll_ckt w=240n l=40n $ D, PMOS
XN1 vo vi1 c1 c1 n11ll_ckt w=180n l=40n $ A, NMOS
XN2 c1 vi2 c2 c2 n11ll_ckt w=180n l=40n $ B, NMOS
XN3 c2 vi3 c3 c3 n11ll_ckt w=180n l=40n $ C, NMOS
XN4 c3 vi4 gnd! gnd! n11ll_ckt w=180n l=40n $ D, NMOS
.ENDS

$ CMOS二输入或非门
.SUBCKT nor2 vi1 vi2 vo
XP2 c1 vi2 vcc! vcc! p11ll_ckt w=240n l=40n $ B, PMOS
XP1 vo vi1 c1 c1 p11ll_ckt w=240n l=40n $ A, PMOS
XN1 vo vi1 gnd! gnd! n11ll_ckt w=180n l=40n $ A, NMOS
XN2 vo vi2 gnd! gnd! n11ll_ckt w=180n l=40n $ B, NMOS
.ENDS

$ 设置VCC和GND
V1 vcc! 0 1.0V
V2 gnd! 0 0V

$ 构建电路
Xnand4_1 1 2 3 4 9 nand4
Xnand4_2 5 6 7 8 10 nand4
Xnor2 9 10 11 nor2

$ 输入区间变化
Vin1 1 gnd! PULSE(0 1.0V 20p 20p 20p 200p 400p)
Vin2 2 gnd! 1.0V
Vin3 3 gnd! 1.0V
Vin4 4 gnd! 1.0V
Vin5 5 gnd! 1.0V
Vin6 6 gnd! 1.0V
Vin7 7 gnd! 1.0V
Vin8 8 gnd! 1.0V

.TRAN 1p 400p
.MEASURE tpLH TRIG V(1) VAL=0.5V RISE=1
+ TARG V(11) VAL=0.5V RISE=1
.MEASURE tpHL TRIG V(1) VAL=0.5V FALL=1
+ TARG V(11) VAL=0.5V FALL=1

.END