# VLSI-EXP

这是东南大学计算机科学与工程学院《VLSI系统导论》的课程实验。使用电路仿真工具 HSPICE 完成了下列四个实验：

- [EXP1 - CMOS 反相器的构造](./EXP1_INVERTER/实验报告.pdf)
- [EXP2 - 相同逻辑不同结构的延迟测量](./EXP2_PDELAY/实验报告.pdf)
- [EXP3 - 22 管 DFF 的建立时间测量](./EXP3_TSETUP/实验报告.pdf)
- [EXP4 - 6 管 SRAM Bitcell 的读写](./EXP4_RAM/实验报告.pdf)

## EXP0

为了帮助你快速上手 SPICE 的基本使用，还提供了 [EXP0](./EXP0_INTRO)。它搭建了一个形如下图的电路：

```
[+]····R1=5Ω··············R2=10Ω····[-]
 |_______________DC=6V_______________|
```

测得了通过 R1 的电流 I(R1) = 400mA，R1 压降 2V，R2 压降 4V。

## 准备

- 为了顺利完成实验，你需要基本的管级电路知识。可以参考下面的学习材料：

  - 课本：《数字集成电路：电路、系统与设计》
  - 我个人总结的 [复习笔记](https://www.cnblogs.com/zxuuu/p/14027716.html)

- 你还需要基本的 SPICE 语言功底和 HSPICE + Avanwaves 软件使用基础。可以参考下面的学习材料：

  - [HSPICE 简明教程](https://wenku.baidu.com/view/f5f565a9c77da26925c5b04d.html)
  - [HSPICE 仿真及 MOS 模型](https://wenku.baidu.com/view/c066b15f561252d380eb6ec1.html)
  - 多用谷歌和百度

- 准备 MOS 管模型文件

  由于模型文件可能涉及厂商相关协议，因此没有被上传到 GitHub。本项目使用的模型文件如下：

  ```
  l0040ll_lpe_v1p4_1r_n11ll.mdl
  l0040ll_lpe_v1p4_1r_p11ll.mdl
  l0040ll_v1p4_1r.lib
  l0040ll_v1p4_1r.mdl
  ```

  你需要获得这四个文件，并将其放在 `/model` 文件夹中。这样，你就能在引入模型库后使用 NMOS 器件 n11ll_ckt 和 PMOS 器件 p11ll_ckt 了。

## 注意

- 实验的过程和结果、代码，都不保证没有错误

- DO NOT COPY!

  >**《东南大学学生学术道德规范条例》**
  >
  >第九条    有下列行为之一的，应当被认定为违反学术道德的行为：
  >
  >1、侵占、抄袭、剽窃他人学术成果（包括论文成果、技术报告、软件程序和研究数据及课程论文等）；

