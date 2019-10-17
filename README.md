# fine_counter1
Implementation of fine counter on FPGA by using tapped delay line topology.

1) The branch named ipsectdlclkvhd contains project files on implementation of fine counter on FPGA with internal 100MHz clock. Start pulse is generated in the input section which is high only between actual arrival of event and next rising edge of clock. This start pulse is fed to the carry4 logic block. The flip-flops are sampled at the rising edge of clock pulse.
2) The branch ipsectdl_1vhd has project files on Implementation of fine counter on FPGA with internal 100MHz clock. Start pulse is generated in the input section which is high only between actual arrival of event and next rising edge of clock. This start pulse is fed to the carry4 logic block. The flip-flops are sampled at the negative edge of this start pulse.
