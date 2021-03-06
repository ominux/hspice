*OTA_outter
.option brief = 1
*.protect
.lib 'rf018.l' TT
*.unprotect
.option brief = 0
.options ABSTOL=1e-7 RELTOL=1e-7
+ POST=1 CAPTAB ACCURATE=1 INGOLD=1

.param wp = 3.2u wn = 400n	mp = 2 mn = 2
M1 1d 1d vdd vdd pch w = wp l = 200n m = mp
M3 iout 1d vdd vdd pch w = wp l = 200n m = mp
M2 1d inn vss vss nch w = wn l = 200n m = mn
M4 iout inp vss vss nch w = wn l = 200n m = mn

Vo	iout	gnd	dc = 1.2v

vd	vdd	gnd	dc = 1.8v
vs	vss	gnd	dc = 0v
.param vdc = 0.25v	vdiff = 0
Vinp inp gnd dc = 'vdc + vdiff/2' 
Vinn inn gnd dc = 'vdc - vdiff/2 '

.op
.dc vdiff -0.3 0.3 0.01
.probe dc I(m1)	I(m2)	I(m3)	I(m4)	I(vo)

.end