/*This declares the start of the text section, which typically contains executable code.*/
.section .text
/*This line declares the label start as a global symbol, making it accessible to the linker.*/
.global start

/*This is a label named start, marking the beginning of the code.*/
start:
    /*This instruction reads the Multiprocessor Affinity Register (MPIDR_EL1), which contains information about the processor, into the general-purpose register x0*/
    mrs x0, mpidr_el1

    /* This bitwise AND operation masks out all but the lower two bits of the value in x0. The result represents the CPU core number stored in x0*/
    and x0, x0, #3

    /* The code compares the value in x0 with 0 and branches to kernel_entry if they are equal (zero condition)*/
    cmp x0, #0
    beq kernel_entry

/* If the comparison in the previous step fails, it enters an infinite loop labeled end.*/
end:
    b end

/*This is a label indicating the start of the code that prepares for entering the kernel.*/
kernel_entry:
    /*Set stack pointer to 0x80000*/
    mov sp, #0x80000

    /* Call KMain function (presumably a kernel main function)*/
    bl KMain

    /* After returning from KMain, it branches to the infinite loop labeled end*/
    b end
