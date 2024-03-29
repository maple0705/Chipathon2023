v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 380 -640 380 -560 {
lab=#net1}
N 240 -530 240 -500 {
lab=GND}
N 240 -640 240 -590 {
lab=#net1}
N 240 -640 380 -640 {
lab=#net1}
N 120 -560 200 -560 {
lab=#net2}
N 240 -560 260 -560 {
lab=GND}
N 240 -530 260 -530 {
lab=GND}
N 260 -560 260 -530 {
lab=GND}
C {devices/vsource.sym} 380 -530 0 0 {name=VDS value=3.3 savecurrent=false}
C {devices/gnd.sym} 380 -500 0 0 {name=l3 lab=GND}
C {devices/simulator_commands_shown.sym} 620 -850 0 0 {name="DC Analysis"
simulator=ngspice
only_toplevel=false 
value=".control
save all

let wsw=2.8u
let lsw=0.28u

dowhile wsw <= 16*2.8u
	alter @m.xmn.m0[w] = wsw
	dowhile lsw <= 16*0.28u
		alter @m.xmn.m0[l] = lsw
		dc VGS 0 3.3 0.1
		show m >> ~/design/xschem/fet_03v3/nfet_03v3_dcop.txt
		let lsw = 2 * lsw
	end
	let lsw=0.28u
	let wsw = 2 * wsw
end

plot dc1.i(vds) dc2.i(vds) dc4.i(vds) dc25.i(vds)
write nfet_03v3_dc.raw
.endc
"}
C {devices/code_shown.sym} 40 -850 0 0 {name=s1 only_toplevel=false 
format="tcleval( @value )"
value=".include $::180MCU_MODELS/design.ngspice
.lib $180MCU_MODELS/sm141064.ngspice ss
.lib $180MCU_MODELS/sm141064.ngspice cap_mim
.lib $180MCU_MODELS/sm141064.ngspice bjt_typical
.lib $180MCU_MODELS/sm141064.ngspice res_typical
.lib $180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $180MCU_MODELS/sm141064.ngspice mimcap_typical
.include $::180MCU_STDCELLS/gf180mcu_fd_sc_mcu7t5v0.spice"}
C {devices/gnd.sym} 120 -500 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 120 -530 0 0 {name=VGS value=3.3 savecurrent=false}
C {pdk/gf180mcuD/libs.tech/xschem/symbols/nfet_03v3.sym} 220 -560 0 0 {name=MN
L=0.28u
W=2.8u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/gnd.sym} 240 -500 0 0 {name=l1 lab=GND}
