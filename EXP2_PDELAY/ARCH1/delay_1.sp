.TITLE DELAY TEST (METHOD 1) BY ZHUOXU

.OPTIONS POST BRIEF
.OP
.LIB "../../model/l0040ll_v1p4_1r.lib" tt
.TEMP 25
.GLOBAL gnd! vcc!

$ CMOS八输入与非门
.SUBCKT nand8 vi1 vi2 vi3 vi4 vi5 vi6 vi7 vi8 vo
* *** PMOS ***
XP1 vo vi1 vcc! vcc! p11ll_ckt w=240n l=40n $ A, PMOS
XP2 vo vi2 vcc! vcc! p11ll_ckt w=240n l=40n $ B, PMOS
XP3 vo vi3 vcc! vcc! p11ll_ckt w=240n l=40n $ C, PMOS
XP4 vo vi4 vcc! vcc! p11ll_ckt w=240n l=40n $ D, PMOS
XP5 vo vi5 vcc! vcc! p11ll_ckt w=240n l=40n $ E, PMOS
XP6 vo vi6 vcc! vcc! p11ll_ckt w=240n l=40n $ F, PMOS
XP7 vo vi7 vcc! vcc! p11ll_ckt w=240n l=40n $ G, PMOS
XP8 vo vi8 vcc! vcc! p11ll_ckt w=240n l=40n $ H, PMOS
* *** NMOS ***
XN1 vo vi1 c1 c1 n11ll_ckt w=180n l=40n $ A, NMOS
XN2 c1 vi2 c2 c2 n11ll_ckt w=180n l=40n $ B, NMOS
XN3 c2 vi3 c3 c3 n11ll_ckt w=180n l=40n $ C, NMOS
XN4 c3 vi4 c4 c4 n11ll_ckt w=180n l=40n $ D, NMOS
XN5 c4 vi5 c5 c5 n11ll_ckt w=180n l=40n $ E, NMOS
XN6 c5 vi6 c6 c6 n11ll_ckt w=180n l=40n $ F, NMOS
XN7 c6 vi7 c7 c7 n11ll_ckt w=180n l=40n $ G, NMOS
XN8 c7 vi8 gnd! gnd! n11ll_ckt w=180n l=40n $ H, NMOS
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
Xnand8 1 2 3 4 5 6 7 8 9 nand8
Xinv 9 10 inv
$ 输入变化和测量
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
+ TARG V(10) VAL=0.5V RISE=1
.MEASURE tpHL TRIG V(1) VAL=0.5V FALL=1
+ TARG V(10) VAL=0.5V FALL=1

.END