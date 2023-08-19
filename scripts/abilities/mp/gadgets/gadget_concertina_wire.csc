// Atian COD Tools GSC decompiler test
#include scripts/abilities/ability_util.csc;
#include scripts/abilities/ability_power.csc;
#include scripts/abilities/ability_player.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/abilities/gadgets/gadget_concertina_wire.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/struct.csc;

#namespace concertina_wire;

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x2
// Checksum 0x34f6e6a7, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_concertina_wire", &__init__, undefined, undefined);
}

// Namespace concertina_wire/gadget_concertina_wire
// Params 0, eflags: 0x1 linked
// Checksum 0x6bcc7301, Offset: 0x118
// Size: 0x1c
function __init__() {
    init_shared("concertina_wire_settings");
}

