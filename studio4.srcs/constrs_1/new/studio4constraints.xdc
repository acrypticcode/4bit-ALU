# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
## Switches
set_property PACKAGE_PIN V17 [get_ports {sw1[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw1[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw1[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw1[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw1[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw1[2]}]  
set_property PACKAGE_PIN W17 [get_ports {sw1[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw1[3]}]
    
set_property PACKAGE_PIN W15 [get_ports {sw2[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw2[0]}]
set_property PACKAGE_PIN V15 [get_ports {sw2[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw2[1]}]
set_property PACKAGE_PIN W14 [get_ports {sw2[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw2[2]}]
set_property PACKAGE_PIN W13 [get_ports {sw2[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw2[3]}]
    
set_property PACKAGE_PIN V2 [get_ports {control[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {control[0]}]
set_property PACKAGE_PIN T3 [get_ports {control[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {control[1]}]
    
set_property PACKAGE_PIN T2 [get_ports {carry_in}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {carry_in}]

#7 segment display
set_property PACKAGE_PIN W7 [get_ports {segments[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]
set_property PACKAGE_PIN W6 [get_ports {segments[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property PACKAGE_PIN U8 [get_ports {segments[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property PACKAGE_PIN V8 [get_ports {segments[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property PACKAGE_PIN U5 [get_ports {segments[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property PACKAGE_PIN V5 [get_ports {segments[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property PACKAGE_PIN U7 [get_ports {segments[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]
	
set_property PACKAGE_PIN U2 [get_ports {anodes[0]}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]
set_property PACKAGE_PIN U4 [get_ports {anodes[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]
set_property PACKAGE_PIN V4 [get_ports {anodes[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]
set_property PACKAGE_PIN W4 [get_ports {anodes[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]

