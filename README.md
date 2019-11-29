# fine_counter1
Implementation of fine counter on FPGA by using tapped delay line topology.

External start pulse (topstart) is delayed by a delay module. So, topstart acts as start pulse and delayed start pulse acts as stop pulse for tapped delay line logic. Each tap in the delay module gives a fixed delay of 78 ps when idelaye2 primitive is configured in fixed mode. 
