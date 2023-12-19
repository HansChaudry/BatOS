/* This is a linker script The linker script is detailed, specifying the entry point, loading address, and sections for text, read-only data, data, and bss */
ENTRY(start)

SECTIONS{
    /*Sets the current address location (.) to 0x80000. This is the loading address for the program.*/
    . = 0x80000;

    /*text: Contains the executable code.*/
    .text : {
        *(.text)
    }

    /*rodata: Holds read-only data, such as constant values or strings.*/
    .rodata : {
        *(.rodata)
    }

    /*data: Stores initialized global and static variables.*/
    /*Aligns the current address location to a 16-byte boundary before defining the .data section. This ensures that the data section starts at an address that is a multiple of 16.*/
    . = ALIGN(16);
    .data : {
        *(.data)
    }

    /*bss: Represents uninitialized data; it stands for "Block Started by Symbol."*/
    .bss : {
        *(.bss)
    }
}