.TITLE INVERTER (CMOS) BY ZHUOXU

.OPTIONS POST BRIEF
.OP
.LIB "../model/l0040ll_v1p4_1r.lib" tt
.TEMP 25
.GLOBAL gnd! vcc!

$ 反相器定义
.SUBCKT inv vi vo
XP vo vi vcc! vcc! p11ll_ckt w=240n l=40n $ PMOS
XN vo vi gnd! gnd! n11ll_ckt w=180n l=40n $ NMOS
.ENDS

$ 设置VCC和GND
V1 vcc! 0 1.0V
V2 gnd! 0 0V
$ 反相器接入
Xinv 1 2 inv
$ 输入区间变化
Vin 1 gnd!
.DC Vin 0 2.0V 0.01
$ 负载电容，1pF
CL 2 gnd! 1p

.END
