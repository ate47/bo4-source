// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_diego;

// Namespace character_unlock_diego/character_unlock_diego
// Params 0, eflags: 0x2
// Checksum 0xa3bf6dee, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_diego", &__init__, undefined, #"character_unlock_diego_fixup");
}

// Namespace character_unlock_diego/character_unlock_diego
// Params 0, eflags: 0x0
// Checksum 0x4ea59da7, Offset: 0xf0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"diego_unlock", &function_2613aeec);
}

// Namespace character_unlock_diego/character_unlock_diego
// Params 1, eflags: 0x0
// Checksum 0x347d33cb, Offset: 0x130
// Size: 0x34
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_downed(&on_player_downed);
    }
}

// Namespace character_unlock_diego/character_unlock_diego
// Params 0, eflags: 0x0
// Checksum 0xb886eeef, Offset: 0x170
// Size: 0x11c
function on_player_downed() {
    if (isdefined(self.laststandparams)) {
        attacker = self.laststandparams.attacker;
        if (!isplayer(attacker)) {
            return;
        }
        if (self.laststandparams.smeansofdeath != "MOD_HEAD_SHOT") {
            return;
        }
        if (!attacker util::isenemyteam(self.team)) {
            return;
        }
        if (!attacker character_unlock::function_f0406288(#"diego_unlock")) {
            return;
        }
        if (!isdefined(attacker.var_7128013a)) {
            attacker.var_7128013a = 0;
        }
        attacker.var_7128013a++;
        if (attacker.var_7128013a == 1) {
            attacker character_unlock::function_c8beca5e(#"diego_unlock", #"hash_7d0b41a17f2e9a9", 1);
        }
    }
}

