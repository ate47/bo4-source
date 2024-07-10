#using scripts\core_common\system_shared.csc;

#namespace zm_office_ffotd;

// Namespace zm_office_ffotd/zm_office_ffotd
// Params 0, eflags: 0x2
// Checksum 0xcbffd82c, Offset: 0x70
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_office_ffotd", &__init__, undefined, undefined);
}

// Namespace zm_office_ffotd/zm_office_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xb8
// Size: 0x4
function __init__() {
    
}

