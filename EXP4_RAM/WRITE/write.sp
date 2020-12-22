.TITLE SRAM BITCELL (6 TUBE) WRITE

.OPTIONS POST BRIEF
.OP
.LIB "../../model/l0040ll_v1p4_1r.lib" tt
.TEMP 25
.GLOBAL gnd! vcc!

V1 vcc! 0 1.0V
V2 gnd! 0 0V

$ bitcell
.PARAM WN1=270n WN2=180n WP=180n L=40n
$ inverters
XM1 Q QR gnd! gnd! n11ll_ckt w='WN1' l='L'
XM2 Q QR vcc! vcc! p11ll_ckt w='WP' l='L'
XM3 QR Q gnd! gnd! n11ll_ckt w='WN1' l='L'
XM4 QR Q vcc! vcc! p11ll_ckt w='WP' l='L'
$ access
XM5 BL WL Q gnd! n11ll_ckt w='WN2' l='L'
XM6 BLR WL QR gnd! n11ll_ckt w='WN2' l='L'

VWL WL gnd! PWL
+ 0ns 0.0V
+ 10ns 0.0V
+ 11ns 1.0V

VBL BL gnd! PWL
+ 0ns 0.0V
+ 30ns 0.0V

VBLR BLR gnd! PWL
+ 0ns 1.0V
+ 30ns 1.0V

.IC V(Q)=1.0V V(QR)=0V

.TRAN 0.1n 30n

.END