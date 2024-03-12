// Atian COD Tools GSC decompiler test
#using scripts\abilities\gadgets\gadget_concertina_wire.csc;
#using scripts\core_common\system_shared.csc;

#namespace concertina_wire;

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x2
// Checksum 0xe7fe3ba3, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_concertina_wire", &__init__, undefined, undefined);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x0
// Checksum 0x7c67c230, Offset: 0xe0
// Size: 0x1c
function __init__() {
    init_shared("concertina_wire_settings_wz");
}

