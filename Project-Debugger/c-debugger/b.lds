ENTRY(nomain)

SECTIONS
{
    . = 0x0 + SIZEOF_HEADERS;
    .tinytext : { *(.text) *(.data) *(.rodata) }
    /DISCARD/ : {*(.comment)}
}