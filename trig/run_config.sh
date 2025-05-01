${IMPERAS_ISS} \
        --program $file \
        --processorvendor mips.com --processorname riscv \
        --variant M8500 --override iss/cpu0/add_Extensions=MACSU \
        --override iss/cpu0/mstatus_FS=1 \
        --extlib iss/cpu0_hart0/stf=imperas.com/intercept/riscvStfTracer/1.0 \
        --override CLIC_version=0.10-draft-20250317 \
        --override iss/cpu0/stf/traceFile=$file.stf \
        --override iss/cpu0/Smcsrind=T \
        --override iss/cpu0/stf/verbose=T \
        --override iss/cpu0/stf/traceMemRead=T \
        --override iss/cpu0/stf/traceMemWrite=T \
        \
        --logfile $file.stf.run.log \
        --verbose
