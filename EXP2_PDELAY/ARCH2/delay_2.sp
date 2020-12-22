.TITLE DELAY TEST (METHOD 2) BY ZHUOXU

.OPTIONS POST BRIEF
.OP
.LIB "../../model/l0040ll_v1p4_1r.lib" tt
.TEMP 25
.GLOBAL gnd! vcc!

$ CMOS二输入与非门
.SUBCKT nand2 vi1 vi2 vo
XP1 vo vi1 vcc! vcc! p11ll_ckt w=240n l=40n $ A, PMOS
XP2 vo vi2 vcc! vcc! p11ll_ckt w=240n l=40n $ B, PMOS
XN1 vo vi1 c1 c1 n11ll_ckt w=180n l=40n $ A, NMOS
XN2 c1 vi2 gnd! gnd! n11ll_ckt w=180n l=40n $ B, NMOS
.ENDS

$ CMOS二输入或非门
.SUBCKT nor2 vi1 vi2 vo
XP2 c1 vi2 vcc! vcc! p11ll_ckt w=240n l=40n $ B, PMOS
XP1 vo vi1 c1 c1 p11ll_ckt w=240n l=40n $ A, PMOS
XN1 vo vi1 gnd! gnd! n11ll_ckt w=180n l=40n $ A, NMOS
XN2 vo vi2 gnd! gnd! n11ll_ckt w=180n l=40n $ B, NMOS
.ENDS

$ CMOS反相器
.SUBCKT inv vi vo
XP vo vi vcc! vcc! p11ll_ckt w=240n l=40n $ PMOS
XN vo vi gnd! gnd! n11ll_ckt w=180n l=40n $ NMOS
.ENDS

$ 设置VCC和GND
V1 vcc! 0 1.0V
V2 gnd! 0 0V

$ 构建电路
$ Layer 1
Xnand2_1 1 2 9 nand2
Xnand2_2 3 4 10 nand2
Xnand2_3 5 6 11 nand2
Xnand2_4 7 8 12 nand2
$ Layer 2
Xnor2_1 9 10 13 nor2
Xnor2_2 11 12 14 nor2
$ Layer 3
Xnand2_5 13 14 15 nand2
$ Layer 4
Xinv 15 16 inv

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
+ TARG V(16) VAL=0.5V RISE=1
.MEASURE tpHL TRIG V(1) VAL=0.5V FALL=1
+ TARG V(16) VAL=0.5V FALL=1

.END