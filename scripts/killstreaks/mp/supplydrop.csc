#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\supplydrop_shared.csc;

#namespace supplydrop;

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x2
// Checksum 0xae7de509, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"supplydrop", &__init__, undefined, #"killstreaks");
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xf577d75, Offset: 0xc8
// Size: 0x14
function __init__() {
    init_shared();
}

