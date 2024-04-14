v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 80 -120 80 -70 {
lab=GND}
N 200 -130 210 -130 {
lab=A}
N 190 -130 200 -130 {
lab=A}
N 190 -130 190 -120 {
lab=A}
N 260 -90 260 -60 {
lab=GND}
N 660 -130 670 -130 {
lab=A}
N 650 -130 660 -130 {
lab=A}
N 320 -280 370 -280 {
lab=Q}
N 370 -280 370 -170 {
lab=Q}
N 190 -280 260 -280 {
lab=A}
N 190 -280 190 -130 {
lab=A}
N 650 -280 650 -130 {
lab=A}
N 650 -280 720 -280 {
lab=A}
N 780 -280 830 -280 {
lab=Q2}
N 830 -280 830 -170 {
lab=Q2}
N 190 -60 260 -60 {
lab=GND}
N 720 -90 720 -60 {
lab=GND}
N 80 -210 80 -180 {
lab=VDD}
C {devices/code_shown.sym} 110 -710 0 0 {name=MODLES1 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/vsource.sym} 80 -150 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/gnd.sym} 260 -60 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 80 -210 0 0 {name=l3 lab=VDD}
C {devices/ipin.sym} 190 -130 0 0 {name=p3 lab=A

}
C {devices/opin.sym} 370 -170 0 0 {name=p4 lab=Q
}
C {devices/vsource.sym} 190 -90 0 0 {name=V2 value=3.3 savecurrent=false}
C {devices/simulator_commands_shown.sym} 110 -570 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
.include ~/design/Git/Chipathon2023/transmission-gate/TOP_pex_extracted.spice
.control
save all
dc V2 0 3.3 0.05
plot -0.001/i(v3)
plot -0.001/i(v4)
wrdata ~/inv_dc.txt v(q)
write inv_dc.raw
.endc
"}
C {sw.sym} 360 -150 0 0 {name=x1}
C {devices/gnd.sym} 720 -60 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 720 -210 0 0 {name=l4 lab=VDD}
C {devices/ipin.sym} 650 -130 0 0 {name=p1 lab=A

}
C {devices/opin.sym} 830 -170 0 0 {name=p2 lab=Q2
}
C {sw_rc.sym} 710 -160 0 0 {name=x2 prefix=TOP}
C {devices/vdd.sym} 260 -210 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} 80 -70 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 290 -280 3 0 {name=V3 value=0.001 savecurrent=false}
C {devices/vdd.sym} 210 -170 0 0 {name=l7 lab=VDD}
C {devices/vdd.sym} 670 -170 0 0 {name=l8 lab=VDD}
C {devices/vsource.sym} 750 -280 3 0 {name=V4 value=0.001 savecurrent=false}
