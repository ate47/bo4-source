// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/wz_common/character_unlock.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace character_unlock_ix_scarlett;

// Namespace character_unlock_ix_scarlett/character_unlock_ix_scarlett
// Params 0, eflags: 0x2
// Checksum 0x9ed606b6, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ix_scarlett", &__init__, undefined, #"character_unlock_ix_scarlett_fixup");
}

// Namespace character_unlock_ix_scarlett/character_unlock_ix_scarlett
// Params 0, eflags: 0x1 linked
// Checksum 0x7f140f0c, Offset: 0xd8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"ix_scarlett_unlock", &function_2613aeec);
}

// Namespace character_unlock_ix_scarlett/character_unlock_ix_scarlett
// Params 1, eflags: 0x1 linked
// Checksum 0xe90b9813, Offset: 0x118
// Size: 0x34
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_stash_open(&function_fcd28111);
    }
}

// Namespace character_unlock_ix_scarlett/character_unlock_ix_scarlett
// Params 1, eflags: 0x1 linked
// Checksum 0x16ab845a, Offset: 0x158
// Size: 0xbc
function function_fcd28111(params) {
    if (!isdefined(params.activator)) {
        return;
    }
    activator = params.activator;
    if (!isplayer(activator)) {
        return;
    }
    if (!activator character_unlock::function_f0406288(#"ix_scarlett_unlock")) {
        return;
    }
    if (self.stash_type === 1) {
        activator character_unlock::function_c8beca5e(#"ix_scarlett_unlock", #"hash_74fceff1a255277d", 1);
    }
}

