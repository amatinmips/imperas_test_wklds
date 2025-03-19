#!/bin/bash

${IMPERAS_ISS} \
    --program /home/amatin/work/imperas_test_wklds/hello_world/m8500/helloworld_m8500.elf \
    --processorvendor mips.com --processorname riscv \
    --variant M8500 --override iss/cpu0/add_Extensions=MACSU \
    \
    --reportmemory \
    --loadphysical \
    --extlib iss/cpu0_hart*/stf=imperas.com/intercept/riscvStfTracer/1.0 \
    --override iss/cpu0/defaultsemihost=T \
    --override iss/cpu0/stf/traceFile=helloworld_m8500.stf \
    --override iss/cpu0/stf/verbose=T \
    --override iss/cpu0/stf/traceMemRead=T \
    --override iss/cpu0/stf/traceMemWrite=T \
    \
    --logfile helloworld_m8500.stf.run.log \
    --verbose \
    "$@" \
 
