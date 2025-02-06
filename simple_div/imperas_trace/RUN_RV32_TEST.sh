#!/bin/bash

# Check Installation supports this example
#checkinstall.exe -p install.pkg --nobanner || exit

#CROSS=RISCV32
#make -C application CROSS=${CROSS}

# Reduce execution time

${IMPERAS_ISS} \
    --program /home/amatin/work/imperas_wklds/simple_div/*.elf \
    --processorvendor mips.com --processorname riscv \
    --variant M8500 --override iss/cpu0/add_Extensions=MACSU \
    \
    --extlib iss/cpu0/stf=imperas.com/intercept/riscvStfTracer/1.0 \
    --override iss/cpu0/stf/traceFile=/home/amatin/work/imperas_wklds/simple_div/imperas_trace/simple_div.stf \
    --override iss/cpu0/stf/verbose=T \
    --override iss/cpu0/stf/traceMemRead=T \
    --override iss/cpu0/stf/traceMemWrite=T \
    \
    --logfile /home/amatin/work/imperas_wklds/simple_div/imperas_trace/simple_div.stf.run.log \
    --verbose \
    "$@" \
 
