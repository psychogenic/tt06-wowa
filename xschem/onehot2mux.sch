v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1470 -370 2270 30 {flags=graph
y1=0
y2=1.9
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1e-11
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=sel
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1460 -1530 2260 -1130 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1e-11
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="in0
in1"
color="7 8"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1480 50 2280 450 {flags=graph
y1=-0.0019
y2=1.9
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1e-11
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=sel_n
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1450 -1050 2250 -650 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1e-11
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=out
color=7
dataset=-1
unitx=1
logx=0
logy=0
}
N -250 -190 -100 -190 {
lab=SEL}
N -20 -190 20 -190 {
lab=SEL_N}
N 70 -130 70 -90 {
lab=SEL_N}
N 70 -30 70 -10 {
lab=SEL}
N 70 110 70 130 {
lab=SEL_N}
N 70 40 70 50 {
lab=SEL}
N 110 -60 170 -60 {
lab=OUT}
N 170 -60 170 80 {
lab=OUT}
N 110 80 170 80 {
lab=OUT}
N 170 10 190 10 {
lab=OUT}
N 10 -60 30 -60 {
lab=IN1}
N 10 80 30 80 {
lab=IN0}
N 70 -130 90 -130 {
lab=SEL_N}
C {sky130_tests/passgate.sym} 70 -60 0 0 {name=x1 W_N=2 L_N=0.2 W_P=2 L_P=0.2 VCCBPIN=VCC VSSBPIN=VSS m=2}
C {devices/ipin.sym} -250 -190 0 0 {name=p1 lab=SEL}
C {devices/ipin.sym} 10 80 0 0 {name=p2 lab=IN0}
C {devices/ipin.sym} 10 -60 0 0 {name=p3 lab=IN1}
C {devices/opin.sym} 190 10 0 0 {name=p4 lab=OUT}
C {devices/ipin.sym} -250 -300 0 0 {name=p5 lab=VCC}
C {devices/ipin.sym} -250 -270 0 0 {name=p6 lab=VSS}
C {devices/lab_pin.sym} 20 -190 2 0 {name=p8 sig_type=std_logic lab=SEL_N}
C {sky130_tests/passgate.sym} 70 80 0 0 {name=x3 W_N=2 L_N=0.2 W_P=2 L_P=0.2 VCCBPIN=VCC VSSBPIN=VSS m=2}
C {sky130_tests/lvtnot.sym} -60 -190 0 0 {name=x5 m=1 
+ W_N=1 L_N=0.15 W_P=2 L_P=0.35 
+ VCCPIN=VCC VSSPIN=VSS}
C {devices/lab_pin.sym} 70 -10 0 0 {name=p7 sig_type=std_logic lab=SEL}
C {devices/lab_pin.sym} 90 -130 2 0 {name=p9 sig_type=std_logic lab=SEL_N}
C {devices/lab_pin.sym} 70 130 0 0 {name=p10 sig_type=std_logic lab=SEL_N}
C {devices/lab_pin.sym} 70 40 0 0 {name=p11 sig_type=std_logic lab=SEL}
C {sky130_fd_pr/corner.sym} -800 60 0 0 {name=CORNER only_toplevel=true corner=tt_mm}
C {devices/code.sym} -780 -130 0 0 {name=stimuli only_toplevel=true value="
** this experimental option enables mos model bin 
** selection based on W/NF instead of W
.option chgtol=4e-16 method=gear

.param VCCGAUSS = agauss(1.8, 0.05, 1)
.param VCC = 'VCCGAUSS'
** use following line to remove VCC variations
* .param VCC = 1.8
.param VDLGAUSS = agauss(0.9, 0.23, 1)
.param VDL = VDLGAUSS
** use following line to remove input common mode variations
* .param VDL =  0.9
.param TEMPGAUSS = agauss(40, 30, 1)
.option temp = 'TEMPGAUSS'
** use following line to remove temperature variations
* .option temp = 25
.param DELTA = 0.002

.include stimuli_onehot2mux.cir

.control
  setseed  8
  reset
  let run = 1
  save all
  op
  write onehot2mux.raw
  reset
  set appendwrite
  dowhile run < = 5
    save all
    tran 1n 1000n uic
    write onehot2mux.raw
    let run = run + 1
    reset
  end
  quit 0
.endc
"}
C {devices/launcher.sym} 600 20 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/onehot2mux.raw tran"
}
