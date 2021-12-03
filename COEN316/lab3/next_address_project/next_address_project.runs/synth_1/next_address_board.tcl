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
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /nfs/home/n/n_kawwas/COEN316/lab3/next_address_project/next_address_project.cache/wt [current_project]
set_property parent.project_path /nfs/home/n/n_kawwas/COEN316/lab3/next_address_project/next_address_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo /nfs/home/n/n_kawwas/COEN316/lab3/next_address_project/next_address_project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  /nfs/home/n/n_kawwas/COEN316/lab3/next_address.vhd
  /nfs/home/n/n_kawwas/COEN316/lab3/next_address_board.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /nfs/home/n/n_kawwas/COEN316/lab3/next_address.xdc
set_property used_in_implementation false [get_files /nfs/home/n/n_kawwas/COEN316/lab3/next_address.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top next_address_board -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef next_address_board.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file next_address_board_utilization_synth.rpt -pb next_address_board_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
