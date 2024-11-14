#using scripts\wz_common\character_unlock_fixup;
#using scripts\wz_common\character_unlock;
#using scripts\mp_common\gametypes\globallogic;
#using script_71e26f08f03b7a7a;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;

#namespace character_unlock_menendez;

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 0, eflags: 0x2
// Checksum 0xf929c0b9, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_menendez", &__init__, undefined, #"character_unlock_menendez_fixup");
}

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 0, eflags: 0x0
// Checksum 0x711e648a, Offset: 0x100
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"menendez_unlock", &function_2613aeec);
}

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 1, eflags: 0x0
// Checksum 0x942365d2, Offset: 0x140
// Size: 0x5c
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_player_killed(&on_player_killed);
        character_unlock::function_d2294476(#"supply_drop_stash_cu20", 2, 3);
    }
}

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 0, eflags: 0x0
// Checksum 0xb7ec4c15, Offset: 0x1a8
// Size: 0x1d4
function on_player_killed() {
    function_b00fd65d();
    params = self.var_a1d415ee;
    if (!isdefined(params)) {
        if (!isdefined(self.laststandparams) || isdefined(self.laststandparams.bledout) && self.laststandparams.bledout) {
            return;
        }
        params = self.laststandparams;
    }
    attacker = params.attacker;
    weapon = params.sweapon;
    means = params.smeansofdeath;
    if (!isplayer(attacker) || !isdefined(weapon)) {
        return;
    }
    if (!attacker util::isenemyteam(self.team)) {
        return;
    }
    if (!attacker character_unlock::function_f0406288(#"menendez_unlock")) {
        return;
    }
    if (weapon.weapclass === "spread") {
        if (!isdefined(attacker.var_a028bb76)) {
            attacker.var_a028bb76 = 0;
        }
        attacker.var_a028bb76++;
        attacker function_15d026c0();
        if (attacker.var_a028bb76 >= 2) {
            attacker character_unlock::function_c8beca5e(#"menendez_unlock", #"hash_4bc3134998048aa7", 1);
        }
    }
}

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 0, eflags: 0x4
// Checksum 0xe8a2dd15, Offset: 0x388
// Size: 0x24
function private function_15d026c0() {
    self playsoundtoplayer(#"hash_3e5c00ae62aa9c91", self);
}

// Namespace character_unlock_menendez/character_unlock_menendez
// Params 0, eflags: 0x4
// Checksum 0xe3cba42c, Offset: 0x3b8
// Size: 0xb4
function private function_b00fd65d() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 4;
    var_49170438 = globallogic::totalalivecount();
    if (var_49170438 < maxteamplayers + 2) {
        namespace_3d2704b3::function_d0178153(#"supply_drop_stash_cu20");
    }
}

