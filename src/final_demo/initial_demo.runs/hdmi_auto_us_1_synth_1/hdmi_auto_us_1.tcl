# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a200tsbg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir G:/ECE532/initial_demo/initial_demo.cache/wt [current_project]
set_property parent.project_path G:/ECE532/initial_demo/initial_demo.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys_video:part0:1.1 [current_project]
set_property ip_repo_paths {
  g:/ECE532/temp_milestone.xpr/project_1/project_1.ipdefs/repo_0_0
  g:/ECE532/temp_milestone.xpr/project_1/project_1.ipdefs/input_from_mb_extended_0_0_0
  g:/ECE532/temp_milestone.xpr/project_1/project_1.ipdefs/impl_0_0
} [current_project]
set_property ip_output_repo g:/ECE532/initial_demo/initial_demo.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1.xci
set_property used_in_synthesis false [get_files -all g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_clocks.xdc]
set_property used_in_implementation false [get_files -all g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_clocks.xdc]
set_property used_in_implementation false [get_files -all g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir G:/ECE532/initial_demo/initial_demo.runs/hdmi_auto_us_1_synth_1 -new_name hdmi_auto_us_1 -ip [get_ips hdmi_auto_us_1]]

if { $cached_ip eq {} } {
close [open __synthesis_is_running__ w]

synth_design -top hdmi_auto_us_1 -part xc7a200tsbg484-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix hdmi_auto_us_1_ hdmi_auto_us_1.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ hdmi_auto_us_1_stub.v
 lappend ipCachedFiles hdmi_auto_us_1_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ hdmi_auto_us_1_stub.vhdl
 lappend ipCachedFiles hdmi_auto_us_1_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ hdmi_auto_us_1_sim_netlist.v
 lappend ipCachedFiles hdmi_auto_us_1_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ hdmi_auto_us_1_sim_netlist.vhdl
 lappend ipCachedFiles hdmi_auto_us_1_sim_netlist.vhdl
set TIME_taken [expr [clock seconds] - $TIME_start]

 config_ip_cache -add -dcp hdmi_auto_us_1.dcp -move_files $ipCachedFiles -use_project_ipc  -synth_runtime $TIME_taken  -ip [get_ips hdmi_auto_us_1]
}

rename_ref -prefix_all hdmi_auto_us_1_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef hdmi_auto_us_1.dcp
create_report "hdmi_auto_us_1_synth_1_synth_report_utilization_0" "report_utilization -file hdmi_auto_us_1_utilization_synth.rpt -pb hdmi_auto_us_1_utilization_synth.pb"

if { [catch {
  file copy -force G:/ECE532/initial_demo/initial_demo.runs/hdmi_auto_us_1_synth_1/hdmi_auto_us_1.dcp g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force G:/ECE532/initial_demo/initial_demo.runs/hdmi_auto_us_1_synth_1/hdmi_auto_us_1.dcp g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force G:/ECE532/initial_demo/initial_demo.runs/hdmi_auto_us_1_synth_1/hdmi_auto_us_1_stub.v g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force G:/ECE532/initial_demo/initial_demo.runs/hdmi_auto_us_1_synth_1/hdmi_auto_us_1_stub.vhdl g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force G:/ECE532/initial_demo/initial_demo.runs/hdmi_auto_us_1_synth_1/hdmi_auto_us_1_sim_netlist.v g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force G:/ECE532/initial_demo/initial_demo.runs/hdmi_auto_us_1_synth_1/hdmi_auto_us_1_sim_netlist.vhdl g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir G:/ECE532/initial_demo/initial_demo.ip_user_files/ip/hdmi_auto_us_1]} {
  catch { 
    file copy -force g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_stub.v G:/ECE532/initial_demo/initial_demo.ip_user_files/ip/hdmi_auto_us_1
  }
}

if {[file isdir G:/ECE532/initial_demo/initial_demo.ip_user_files/ip/hdmi_auto_us_1]} {
  catch { 
    file copy -force g:/ECE532/initial_demo/initial_demo.srcs/sources_1/bd/hdmi/ip/hdmi_auto_us_1/hdmi_auto_us_1_stub.vhdl G:/ECE532/initial_demo/initial_demo.ip_user_files/ip/hdmi_auto_us_1
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
