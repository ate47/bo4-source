// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\perks.gsc;

#namespace zm_bgb_head_drama;

// Namespace zm_bgb_head_drama/zm_bgb_head_drama
// Params 0, eflags: 0x2
// Checksum 0x27459fc3, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_head_drama", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_head_drama/zm_bgb_head_drama
// Params 0, eflags: 0x1 linked
// Checksum 0x8c9460fa, Offset: 0x100
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_head_drama", "time", 300, &enable, &disable, undefined);
}

// Namespace zm_bgb_head_drama/zm_bgb_head_drama
// Params 0, eflags: 0x1 linked
// Checksum 0xee415823, Offset: 0x180
// Size: 0x24
function enable() {
    self perks::perk_setperk("specialty_locdamagecountsasheadshot");
}

// Namespace zm_bgb_head_drama/zm_bgb_head_drama
// Params 0, eflags: 0x1 linked
// Checksum 0xa4a0b6fd, Offset: 0x1b0
// Size: 0x24
function disable() {
    self perks::perk_unsetperk("specialty_locdamagecountsasheadshot");
}

