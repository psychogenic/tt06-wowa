v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 50 -20 50 10 {
lab=VSS}
N 50 -80 220 -80 {
lab=ADJ}
C {sky130_fd_pr/cap_mim_m3_2.sym} 50 -50 0 0 {name=C1 model=cap_mim_m3_2 W=10 L=10 MF=5 spiceprefix=X}
C {devices/lab_pin.sym} 50 10 0 0 {name=p9 lab=VSS}
C {devices/lab_pin.sym} 220 -80 2 0 {name=p10 lab=ADJ}
