#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_scarlett;

// Namespace character_unlock_scarlett/character_unlock_scarlett
// Params 0, eflags: 0x2
// Checksum 0xb0f59b9f, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_scarlett", &__init__, undefined, #"character_unlock_scarlett_fixup");
}

// Namespace character_unlock_scarlett/character_unlock_scarlett
// Params 0, eflags: 0x0
// Checksum 0x6356142d, Offset: 0xf0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"scarlett_unlock", &function_2613aeec);
}

// Namespace character_unlock_scarlett/character_unlock_scarlett
// Params 1, eflags: 0x0
// Checksum 0x65db0b3a, Offset: 0x130
// Size: 0x34
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_player_killed(&on_player_killed);
    }
}

// Namespace character_unlock_scarlett/character_unlock_scarlett
// Params 0, eflags: 0x0
// Checksum 0xc57b9ff0, Offset: 0x170
// Size: 0x12c
function on_player_killed() {
    if (!isdefined(self.laststandparams)) {
        return;
    }
    attacker = self.laststandparams.attacker;
    inflictor = self.laststandparams.einflictor;
    mod = self.laststandparams.smeansofdeath;
    if (!isplayer(attacker) || !isvehicle(inflictor) || mod !== "MOD_CRUSH") {
        return;
    }
    if (!attacker util::isenemyteam(self.team)) {
        return;
    }
    if (!attacker character_unlock::function_f0406288(#"scarlett_unlock")) {
        return;
    }
    attacker character_unlock::function_c8beca5e(#"scarlett_unlock", #"hash_698918780b4406f1", 1);
}

