// Atian COD Tools GSC decompiler test
#using scripts\core_common\player\player_stats.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_spectre;

// Namespace character_unlock_spectre/character_unlock_spectre
// Params 0, eflags: 0x2
// Checksum 0x6493bcb7, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_spectre", &__init__, undefined, #"character_unlock_spectre_fixup");
}

// Namespace character_unlock_spectre/character_unlock_spectre
// Params 0, eflags: 0x1 linked
// Checksum 0xb51e165e, Offset: 0xe0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"spectre_unlock", &function_2613aeec);
}

// Namespace character_unlock_spectre/character_unlock_spectre
// Params 1, eflags: 0x1 linked
// Checksum 0x3152780d, Offset: 0x120
// Size: 0x74
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_453c77a41df1963c", &function_27709af9);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
    }
}

// Namespace character_unlock_spectre/character_unlock_spectre
// Params 1, eflags: 0x1 linked
// Checksum 0xa1791132, Offset: 0x1a0
// Size: 0xc4
function function_1c4b5097(item) {
    var_a6762160 = item.var_a6762160;
    if (var_a6762160.name === #"cu34_item") {
        if (self character_unlock::function_f0406288(#"spectre_unlock")) {
            if (self stats::get_stat_global(#"hash_41f134c3e727d877") >= 20) {
                self character_unlock::function_c8beca5e(#"spectre_unlock", #"hash_27023afb3f91aba5", 1);
            }
        }
    }
}

// Namespace character_unlock_spectre/character_unlock_spectre
// Params 0, eflags: 0x1 linked
// Checksum 0x8e559929, Offset: 0x270
// Size: 0x84
function function_27709af9() {
    if (self character_unlock::function_f0406288(#"spectre_unlock")) {
        if (self stats::get_stat_global(#"hash_41f134c3e727d877") >= 20) {
            self character_unlock::function_c8beca5e(#"spectre_unlock", #"hash_27023afb3f91aba5", 1);
        }
    }
}

