#!/bin/bash

export WKLD=dhrystone
export PROC=m8500
program_file="./dhrystone"

${IMPERAS_ISS} \
    --program  ${program_file} \
    --processorvendor mips.com --processorname riscv \
    --variant M8500 --override iss/cpu0/add_Extensions=MACSU \
    --extlib iss/cpu0_hart0/stf=imperas.com/intercept/riscvStfTracer/1.0 \
    --override iss/cpu0*/Smcsrind=T \
    --override iss/cpu0*/Zmmul=F \
    --override iss/cpu0/simulateexceptions=T \
    --override CLIC_version=0.10-draft-20250317 \
    --override iss/cpu0*/stf/traceFile=${WKLD}_${PROC}.stf \
    --override iss/cpu0*/stf/verbose=T \
    --override iss/cpu0*/stf/traceMemRead=T \
    --override iss/cpu0*/stf/traceMemWrite=T \
    \
    --logfile ${WKLD}_${PROC}.stf.run.log \
    --verbose \
    "$@" \
