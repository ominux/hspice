*researchTry2.sp
.protect
.lib 'rf018.l' TT
.unprotect
.options ABSTOL=1e-7 RELTOL=1e-7
+ POST=1 CAPTAB ACCURATE=1 INGOLD=1
***netlist***
*.subckt ct vdd vss v1 vb vI vo

***Derivator & Unit gain Buffer***

.param Rzv = 100k
C1 inx aco 100f
E1 aco gnd OPAMP gnd inx MAX=5 MIN=-5 1000
Rz inx gnd Rzv

R3 aco 2- 500G
C2 aco 2- 25f
E2 dco gnd OPAMP gnd 2- MAX=5 MIN=-5 1000
C3 2- dco 10p

R1 dco1 3- 300k
E3 3o gnd OPAMP gnd 3- MAX=5 MIN=-5 1000
R2 3- 3o 300k
Rdc 3o inx 45x
*Mm 3- 3- 3o 3o pch w = 150u l = 7.5u
*M1 inx inx 3o 3o pch w = 1u l = 7.5u
*Rfd dco1 inx 45X

*in gnd inx dc = 0.1u *ac = 1
vdco dco1 gnd ac = 1

it tt gnd 1u
Rt tt gnd 100k

.op
.ac dec 20 0.001 100k *sweep Rzv dec 1 1 1k
.probe ac vdb(dco) vdb(inx)
.end