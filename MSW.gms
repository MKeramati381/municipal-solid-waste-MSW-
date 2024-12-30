*code part 2

$title MSWsupplychain

sets
m municipal /m1/
v kind of vehicle /v1,v2,v3/
p plant /p1,p2,p3/
t period /1*12/
s separation center /s1,s2/
L landfill /L1/
w kind of waste /w1,w2,w3/
d Distribution center /d1,d2/
k kind of recyclable waste /k1,k2/
j kind of recycling technology /j1,j2/;

scalar miu /0.95/;

parameters

c(v)       cost of transportation per Kilometer /v1 0.2,v2 0.34,v3 0.5/

VC(v)      capacity of vehicle /v1 2,v2 6,v3 10/

CG(m)      cost of buying each unit of recyclable waste /m1 44.5/

B(W)       binary parameter  /w1 0, w2 1, w3 0/

x(v)       binary parameter  /v1 1,v2 1,v3 0/

fff(p)     binary parameter  /p1 0,p2 0,p3 1/

iii(p)     binary parameter  /p1 0,p2 1,p3 0/;

table ttt(w,p) binary parameter

      p1    p2   p3
w1    0     0    0

w2    0     1    0

w3    0     0    0;

table bbb(w,p) binary parameter
      p1    p2   p3
w1    1     0    0

w2    0     0    0

w3    0     0    1;

table ggg(w,p) binary parameter
      p1    p2   p3
w1    1     0    0

w2    0     0    0

w3    0     0    0;



table Col(w,m,t)  collection cost
        1   2   3   4   5   6   7   8   9   10  11  12

w1.m1   5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8

w2.m1   5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8

w3.m1   5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8 5.8;

table sec(w,s,t) seperation cost
        1   2   3   4   5   6   7   8   9   10  11  12

w1.s1   20  20  20  20  20  20  20  20  20  20  20  20

w2.s1   15  15  15  15  15  15  15  15  15  15  15  15

w3.s1   30  30  30  30  30  30  30  30  30  30  30  30;

table opc(w,p,t) operation cost in each plant
        1   2   3   4   5   6   7   8   9   10  11  12

w1.p1   60  60  60  60  60  60  60  60  60  60  60  60

w1.p2   100 100 100 100 100 100 100 100 100 100 100 100

w1.p3   100 100 100 100 100 100 100 100 100 100 100 100

w2.p1   100 100 100 100 100 100 100 100 100 100 100 100

w2.p2   70  70  70  70  70  70  70  70  70  70  70  70

w2.p3   100 100 100 100 100 100 100 100 100 100 100 100

w3.p1   100 100 100 100 100 100 100 100 100 100 100 100

w3.p2   100 100 100 100 100 100 100 100 100 100 100 100

w3.p3   40  40  40  40  40  40  40  40  40  40  40  40 ;

table LAC(L,t) landfillig cost
        1   2   3   4   5   6   7   8   9   10  11  12

L1      22  22  22  22  22  22  22  22  22  22  22  22;

table IC(w,p,t) cost of storege
        1   2   3   4   5   6   7   8   9   10  11  12

w1.p1   2   2   2   2   2   2   2   2   2   2   2   2

w1.p2   100 100 100 100 100 100 100 100 100 100 100 100

w1.p3   100 100 100 100 100 100 100 100 100 100 100 100

w2.p1   100 100 100 100 100 100 100 100 100 100 100 100

w2.p2   2   2   2   2   2   2   2   2   2   2   2   2

w2.p3   100 100 100 100 100 100 100 100 100 100 100 100

w3.p1   100 100 100 100 100 100 100 100 100 100 100 100

w3.p2   100 100 100 100 100 100 100 100 100 100 100 100

w3.p3   2   2   2   2   2   2   2   2   2   2   2   2;

table A(w,m,t) the total amount of waste produced in the city
        1        2        3         4         5          6        7          8           9            10         11          12

w1.m1   503      607      567       583       579        545      547        610         552          584        563         571

w2.m1   22       16       18        17        17         20       23         19          18           16         17          25

w3.m1   322      366      349       355       350        332      335        369         360          352        330         345;

table G(w,m,t) amount of bought recyclable waste from city
        1   2   3   4   5   6   7   8   9   10  11  12

w1.m1   0   0   0   0   0   0   0   0   0   0   0   0

w2.m1   133 113 120 125 119 121 116 108 112 116 126 138

w3.m1   0   0   0   0   0   0   0   0   0   0   0   0;

table MIC(W,P) maximum inventory capacity of each plant
        p1  p2  p3
w1      50   0   0

w2      0    50  0

w3      0    0   50;

table Cap(L,t) maximum landfill capacity
        1   2   3   4   5   6   7   8   9   10  11  12

L1      400 400 400 400 400 400 400 400 400 400 400 400;

table capMin(w,p) mimimum operate capacity
        p1  p2  p3
w1      150 0   0

w2      0   50  0

w3      0   0   100;

table capMax(w,p) maximum operate capacity
        p1  p2  p3
w1      550 0   0

w2      0   200 0

w3      0   0   350;

table capE(d,t) input capacity of distribution center
        1   2   3   4   5   6   7   8   9   10  11  12
d1      300 300 300 300 300 300 300 300 300 300 300 300

d2      300 300 300 300 300 300 300 300 300 300 300 300;

table capR(k,d,t) input capacity of distribution center fo recycled waste
        1   2   3   4   5   6   7   8   9   10  11  12
k1.d1   100 100 100 100 100 100 100 100 100 100 100 100

k2.d1   100 100 100 100 100 100 100 100 100 100 100 100

k1.d2   100 100 100 100 100 100 100 100 100 100 100 100

k2.d2   100 100 100 100 100 100 100 100 100 100 100 100;

table capB(d,t) input capacity of distribution center for bio fertilizer
        1   2   3   4   5   6   7   8   9   10  11  12
d1      100 100 100 100 100 100 100 100 100 100 100 100

d2      100 100 100 100 100 100 100 100 100 100 100 100;

table dis(m,s) distance between city and seperation centre
        s1
m1      25 ;

table dis2(s,p) distance between seperation centre and plants
        p1  p2  p3
s1      22  2   26;

table dis3(s,l) distance between seperation centre and landfill
        l1
s1      22;

table dis4(p,l) distance between plants and landfill
        l1
p1      4

p2      21

p3      3;

table dis5(m,p) distance between city and plants
        p1  p2  p3
m1      35  27  47;

table dis6(p,d)
        d1  d2
p1      8   10

p2      13  16

p3      0   0;

table dis7(j,d)
        d1  d2
j1      13  16

j2      13  16;

table dis8(d,m)
        m1
d1      9

d2      7;

table prE(m,t) electricity price in the city
        1   2   3   4   5   6   7   8   9   10  11  12

m1      0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1;


table prR(k,m,t) recycled product price in the city
        1    2    3    4    5    6    7    8    9    10   11   12

k1.m1   900  900  900  900  900  900  900  900  900  900  900  900

k2.m1   1900 1900 1900 1900 1900 1900 1900 1900 1900 1900 1900 1900;

table prB(m,t) bio fertilizer price in the city
        1   2   3   4   5   6   7   8   9   10  11  12

m1      0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4;

table DE(m,t) demand of electricity in the city
        1   2   3   4   5   6   7   8   9   10  11  12
m1      250 250 250 250 250 250 250 250 250 250 250 250;

table DR(k,m,t) demand of recycled materials in the city
        1   2   3   4   5   6   7   8   9   10  11  12
k1.m1   40  40  40  40  40  40  40  40  40  40  40  40

k2.m1   30  30  30  30  30  30  30  30  30  30  30  30;

table DB(m,t) demand of bio fertilizer in the city
        1   2   3   4   5   6   7   8   9   10  11  12
m1      100 100 100 100 100 100 100 100 100 100 100 100;

table landa(w,p) product electricity factor
        p1      p2     p3
w1      0.40    0      0

w2      0       0      0

w3      0       0      0.53;

table y(k,j,t) amount the kind of recycleable waste
        1       2      3       4       5       6       7       8       9       10     11      12
k1.j1   0.45    0.45   0.45    0.45    0.45    0.45    0.45    0.45    0.45    0.45   0.45    0.45

k2.j2   0.55    0.55   0.55    0.55    0.55    0.55    0.55    0.55    0.55    0.55   0.55    0.55;

table alfa(k,j,t) production of recycled materials factor
        1       2      3       4       5       6       7       8       9       10     11      12
k1.j1   0.9     0.9    0.9     0.9     0.9     0.9     0.9     0.9     0.9     0.9    0.9     0.9

k2.j2   0.8     0.8    0.8     0.8     0.8     0.8     0.8     0.8     0.8     0.8    0.8     0.8;

table beta(w,p) operate factor
        p1      p2     p3
w1      0.07    0      0

w2      0       0.12   0

w3      0       0      0.1;

variables
Z
mmm
nnn
positive variable  qcol(w,m,t)

positive variable  qtms(w,m,s,t)

positive variable  qins(w,s,t)

positive variable  qtsp(w,s,p,t)

positive variable  qsep(w,s,t)

positive variable  qNsep(w,s,t)

positive variable  qope(w,p,t)

positive variable  qstL(s,L,t)

positive variable  qinv(w,p,t)

positive  variable  qinp(w,p,t)

positive variable  qinL(L,t)

positive variable  qrtmp(w,m,p,t)

positive variable  qrc(w,m,t)

positive variable  qinRP(w,p,t)

positive variable  Tqip(w,p,t)

positive variable  qeg(w,p,t)

positive variable  qrp(k,j,t)

positive variable  qbp(t)

positive variable  qRS(k,j,t)

positive variable  qreR(t)

positive variable  qrel(t)

positive variable  qted(p,d,t)

positive variable  inED(d,t)

positive variable  qtrd(k,j,d,t)

positive variable  inRD(k,d,t)

positive variable  qtbd(d,t)

positive variable  inBD(d,t)

positive variable  qtem(d,m,t)

positive variable  qtrm(k,d,m,t)

positive variable  qtbm(d,m,t)

positive variable  inEM(m,t)

positive variable  inRM(k,m,t)

positive variable  inBM(m,t)

positive variable  elop(w,p,t)

positive variable  Tel(t)

positive variable  Frel(p,t)

positive variable  trel(p,l,t)

positive variable  TreR(p,l,t)

integer variable   N1(m,s,v,t)

integer variable   N2(s,p,v,t)

integer variable   N3(s,l,v,t)

integer variable   N4(p,l,v,t)

integer variable   N5(m,p,v,t)

integer variable   N6(j,d,v,t)

integer variable   N7(p,d,v,t)

integer variable   N8(d,m,v,t)

integer variable   N9(d,m,v,t)

positive variable  qoRP(t);

Equations
ObjectiveFunction
co1(w,m,t)
co2(w,m,t)
co3(w,m,t)
co4(w,m,t)
co5(w,s,t)
co6(w,s,t)
co7(s,t)
co8(w,s,t)
co9(w,p,t)
co10(w,p,t)
co11(w,p,t)
co12(w,p,t)
co13(w,p,t)
co14(w,p,t)
co15(w,p,t)
co16(w,p,t)
co17(w,p,t)
co18(w,p,t)
co19(t)
co20(t)
co21(k,j,t)
co22(k,j,t)
co23(t)
co24(t)
co25(t)
co26(t)
co27(p,t)
co28(t)
co29(l,t)
co30(l,t)
co31(p,t)
co32(d,t)
co33(d,t)
co34(k,j,t)
co35(k,d,t)
co36(k,d,t)
co37(t)
co38(d,t)
co39(d,t)
co40(d,t)
co41(m,t)
co42(m,t)
co43(k,d,t)
co44(k,m,t)
co45(k,m,t)
co46(d,t)
co47(m,t)
co48(m,t)
*e1;
 ;
********************************* ObjectiveFunction ****************************

ObjectiveFunction   .. Z =e=-( sum((m,t),PrE(m,t)*inEM(m,t)) +
sum((k,m,t),PrR(k,m,t)*inRM(k,m,t)) + sum((m,t),prB(m,t)*inBM(m,t)));

********************************** cost objective ***************************************
* -(sum((w,m,t),col(w,m,t)*qcol(w,m,t))+ sum((w,m,t),qrc(w,m,t)*cg(m))+
*sum((w,s,t),SEC(w,s,t)*qsep(w,s,t))+ sum((w,p,t),OPC(w,p,t)*qope(w,p,t))+
*sum((w,p,t),IC(w,p,t)*qinv(w,p,t))+ sum((l,t),LAC(l,t)*qinL(l,t))+
*sum(v,c(v))*(sum((m,l,p,s,t,v,j,d),dis(m,s)*n1(m,s,v,t)+dis2(s,p)*n2(s,p,v,t)+
*dis3(s,l)*n3(s,l,v,t)+dis4(p,l)*n4(p,l,v,t)+dis5(m,p)*n5(m,p,v,t)+dis7(j,d)*n6(j,d,v,t)+
*dis6(p,d)*n7(p,d,v,t)+dis8(d,m)*n8(d,m,v,t)+dis8(d,m)*n9(d,m,v,t))));

********************************************************************************

co1(w,m,t)    ..  qcol(w,m,t) =e= A(w,m,t);

co2(w,m,t)    ..  qrc(w,m,t)*B(w) =e= G(w,m,t);

co3(w,m,t)    ..  qcol(w,m,t) =e= sum(s,qtms(w,m,s,t));

co4(w,m,t)    ..  qrc(w,m,t) =e= sum(p,qrtmp(w,m,p,t)*ttt(w,p));

co5(w,s,t)    ..  qinS(w,s,t) =e= sum(m,qtms(w,m,s,t));

co6(w,s,t)    ..  qinS(w,s,t) - qsep(w,s,t) =e= qNsep(w,s,t);

co7(s,t)      ..  sum(w,qNsep(w,s,t)) =e= sum(L,qstL(s,l,t));

co8(w,s,t)    ..  qsep(w,s,t) =e= sum(p,qtsp(w,s,p,t));

co9(w,p,t)    ..  sum(s,qtsp(w,s,p,t)) =e= qinP(w,p,t);

co10(w,p,t)   ..  qinRP(w,p,t) =e= sum(m,qrtmp(w,m,p,t))*ttt(w,p);

co11(w,p,t)   ..  qinP(w,p,t) + qinRP(w,p,t) =e= Tqip(w,p,t);

co12(w,p,t)   ..  capMin(w,p) =l= qope(w,p,t);

co13(w,p,t)   ..  capMax(w,p) =g= qope(w,p,t);

co14(w,p,t)   ..  qinv(w,p,'1') =e= Tqip(w,p,'1') - qope(w,p,'1');

co15(w,p,t)$(ord(t)>1)     .. qinv(w,p,t) =e= Tqip(w,p,t) - qope(w,p,t) + qinv(w,p,t-1);

co16(w,p,t)   .. qinv(w,p,t) =l= MIC(w,p);

co17(w,p,t)   .. qope(w,p,t)*bbb(w,p) =e= elop(w,p,t);

co18(w,p,t)   .. qeg(w,p,t) =e= elop(w,p,t)*landa(w,p);

co19(t)       .. sum((w,p),qeg(w,p,t)) =e= Tel(t);

co20(t)       .. sum((w,p),qope(w,p,t)*ttt(w,p)) =e= qoRP(t);

co21(k,j,t)   .. qRS(k,j,t) =e= qoRP(t)*y(k,j,t);

co22(k,j,t)   .. qRS(k,j,t)*alfa(k,j,t) =e= qRP(k,j,t);

co23(t)       .. qreR(t) =e= qoRP(t) - sum((k,j),qRP(k,j,t));

co24(t)       .. qrel(t) =e= sum((w,p),elop(w,p,t)*beta(w,p));

co25(t)       .. qBp(t) =e= sum((w,p),elop(w,p,t)*ggg(w,p)*beta(w,p));

co26(t)       .. sum(p,Frel(p,t)*fff(p)) =e= qrel(t) - qBp(t);

co27(p,t)     .. Frel(p,t) =e= sum(l,trel(p,l,t));

co28(t)       .. qreR(t) =e= sum((p,l),treR(p,l,t)*iii(p));

co29(l,t)     .. qinL(l,t) =e= sum(s,qstL(s,l,t)) + sum(p,trel(p,l,t)) + sum(p,TreR(p,l,t));

co30(l,t)     .. qinL(l,t) =l= cap(l,t);

co31(p,t)     .. sum(d,qted(p,d,t)) =e= sum(w,qeg(w,p,t))*miu;

co32(d,t)     .. inED(d,t) =e= sum(p,qted(p,d,t));

co33(d,t)     .. inED(d,t) =l= capE(d,t);

co34(k,j,t)   .. sum(d,qtrd(k,j,d,t)) =e= qRP(k,j,t);

co35(k,d,t)   .. inRD(k,d,t) =e= sum(j,qtrd(k,j,d,t));

co36(k,d,t)   .. inRD(k,d,t) =l= capR(k,d,t);

co37(t)       .. sum(d,qtbd(d,t)) =e= qBp(t);

co38(d,t)     .. inBD(d,t) =e= qtbd(d,t);

co39(d,t)     .. inBD(d,t) =l= capB(d,t);

co40(d,t)     .. sum(m,qtem(d,m,t)) =e= inED(d,t)*miu;

co41(m,t)     .. sum(d,qtem(d,m,t)) =e= inEM(m,t);

co42(m,t)     .. inEM(m,t) =l= DE(m,t);

co43(k,d,t)   .. inRD(k,d,t) =e= sum(m,qtrm(k,d,m,t));

co44(k,m,t)   .. sum(d,qtrm(k,d,m,t)) =e= inRM(k,m,t);

co45(k,m,t)   .. inRM(k,m,t) =l= mmm*DR(k,m,t);

co46(d,t)     .. sum(m,qtbm(d,m,t)) =e= inBD(d,t);

co47(m,t)     .. sum(d,qtbm(d,m,t)) =e= inBM(m,t);

co48(m,t)     .. inBM(m,t) =l= DB(m,t);

*e1(w,p,t)   ..qinP(w,p,t) =g= 100;
********************************** remove vehicale ******************************

*CO49(w,m,s,t) ..  sum(v,VC(v)*N1(m,s,v,t)) =g= qtms(w,m,s,t);

*CO50(w,s,p,t) ..  sum(v,VC(v)*N2(s,p,v,t)) =g= qtsp(w,s,p,t);

*CO51(s,L,t) ..  sum(v,VC(v)*N3(s,L,v,t)) =g= qstL(s,L,t);

*CO52(p,L,t) ..  sum(v,VC(v)*N4(p,L,v,t)) =g= trel(p,L,t);

*CO53(w,m,p,t) ..  sum(v,VC(v)*N5(m,p,v,t)) =g= qrtmp(w,m,p,t)*ttt(w,p);

model MSWsupplychain /ObjectiveFunction, co1,co2,co3,co4,co5,co6,co7,co8,co9,co10,co11,co12,co13,co14,co15,co16,co17,co18
co19,co20,co21,co22,co23,co24,co25,co26,co27,co28,co29,co30,co31,co32,co33,co34,co35,co36,co37,co38,co39,co40,co41,co42,
co43,co44,co45, co46,co47,co48/;
*Option limrow = 1000, limcol = 1000;
option optca=0,optcr=0;
option mip=cplex;

option iterlim=1000;
option reslim=1000;



solve MSWsupplychain using mip maximizing Z;

display Z.l ,qcol.l, qrc.l, qinS.l, qsep.l, qNsep.l, qstL.l, qinRP.l, qinP.l, Tqip.l
qope.l, qinv.l, elop.l, qeg.l, Tel.l, qinRP.l, qRS.l, qinRP.l, qrel.l, qBp.l, Frel.l
qreR.l, qinL.l, inED.l, qRP.l, inRD.l, inBD.l, inED.l, inRM.l, inEM.l, inBM.l;
