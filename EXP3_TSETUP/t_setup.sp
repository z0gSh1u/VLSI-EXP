.TITLE T_SETUP MEASURE BY ZHUOXU

$ 基本配置
.OPTIONS POST BRIEF
.OP
.LIB "../model/l0040ll_v1p4_1r.lib" tt
.TEMP 25
.GLOBAL gnd! vcc!

$ CMOS反相器
.SUBCKT INV vi vo
XP vo vi vcc! vcc! p11ll_ckt w=240n l=40n
XN vo vi gnd! gnd! n11ll_ckt w=180n l=40n
.ENDS
$ CMOS传输门
.SUBCKT TRANSFER vi vo ctrl nCtrl
XP vi nCtrl vo vcc! p11ll_ckt w=240n l=40n
XN vi ctrl vo gnd! n11ll_ckt w=180n l=40n
.ENDS
$ 22管D触发器
.SUBCKT DFF D Q clk
Xclk clk nClk INV
XI1 D oI1 INV
XT1 oI1 oT1 nClk clk TRANSFER
XI3 oT1 oI3 INV
XI2 oI3 oI2 INV
XT2 oI2 oT1 clk nClk TRANSFER
XI4 oI3 oI4 INV
XT3 oI4 oT3 clk nClk TRANSFER
XI6 oT3 Q INV
XI5 Q oI5 INV
XT4 oI5 oT3 nClk clk TRANSFER
.ENDS

$ 电路网表
V1 vcc! 0 1.0V
V2 gnd! 0 0V
Xdff 1 2 3 DFF

.PARAM resetAt=20ps $ 将DFF内存的数据设为0
.PARAM clkRiseAt=200ps $ 时钟上升沿时间点
.PARAM dataRiseAt=100ps $ 数据上升沿时间点

$ 时钟上升沿信号
Vclk 3 gnd! PWL
+ 0.0ps 0.0V
+ 'resetAt-1ps' 0.0V
+ 'resetAt' 1.0V
+ 'resetAt+10ps' 1.0V
+ 'resetAt+11ps' 0.0V
+ 'clkRiseAt' 0.0V
+ 'clkRiseAt+1ps' 1.0V

$ 数据输入信号
Vin 1 gnd! PWL
+ 0.0ps 0.0V
+ 'dataRiseAt' 0.0V
+ 'dataRiseAt+1ps' 1.0V

$ 测量语句
.MEASURE tClkToQ TRIG V(3) VAL=0.5V RISE=2
+ TARG V(2) VAL=0.5V RISE=2
.MEASURE tSetup TRIG V(1) VAL=0.5V RISE=1
+ TARG V(3) VAL=0.5V RISE=2

$ 暂态分析区间与细粒度
* .TRAN 0.1ps 300ps SWEEP dataRiseAt 100ps 160ps 10ps
.TRAN 0.1ps 300ps SWEEP dataRiseAt 150ps 155ps 0.01ps

.END