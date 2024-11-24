#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_battery_fixup;

// Namespace character_unlock_battery_fixup/character_unlock_battery_fixup
// Params 0, eflags: 0x2
// Checksum 0x45905d39, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_battery_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_battery_fixup/character_unlock_battery_fixup
// Params 0, eflags: 0x0
// Checksum 0x7301d56f, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"battery_unlock", #"hash_7f410b145dce17bd", #"warmachine_wz_item", &function_d95e620c, #"hash_c5713430b8fb888");
}

// Namespace character_unlock_battery_fixup/character_unlock_battery_fixup
// Params 0, eflags: 0x0
// Checksum 0xd1d7d0d2, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_7801126f = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_2cd26947d8f311fa")) ? getgametypesetting(#"hash_2cd26947d8f311fa") : 0);
    return var_7801126f;
}

