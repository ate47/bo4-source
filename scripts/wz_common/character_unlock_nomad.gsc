#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock_fixup;
#using scripts\wz_common\character_unlock;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;

#namespace character_unlock_nomad;

// Namespace character_unlock_nomad/character_unlock_nomad
// Params 0, eflags: 0x2
// Checksum 0x902ed361, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_nomad", &__init__, undefined, #"character_unlock_nomad_fixup");
}

// Namespace character_unlock_nomad/character_unlock_nomad
// Params 0, eflags: 0x0
// Checksum 0xff53d15e, Offset: 0xe8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"nomad_unlock", &function_2613aeec);
}

// Namespace character_unlock_nomad/character_unlock_nomad
// Params 1, eflags: 0x0
// Checksum 0xc65b91a5, Offset: 0x128
// Size: 0xec
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_player_killed(&on_player_killed);
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"wz_escape_supply_stash_parent", #"supply_stash_cu07", 1);
            return;
        }
        item_world_fixup::function_e70fa91c(#"supply_stash_parent_dlc1", #"supply_stash_cu07", 6);
    }
}

// Namespace character_unlock_nomad/character_unlock_nomad
// Params 0, eflags: 0x0
// Checksum 0xe26751bc, Offset: 0x220
// Size: 0x144
function on_player_killed() {
    if (!isdefined(self.laststandparams)) {
        return;
    }
    attacker = self.laststandparams.attacker;
    if (!isplayer(attacker)) {
        return;
    }
    if (!attacker util::isenemyteam(self.team)) {
        return;
    }
    if (!attacker character_unlock::function_f0406288(#"nomad_unlock")) {
        return;
    }
    if (!isdefined(attacker.var_520e7d03)) {
        attacker.var_520e7d03 = 0;
    }
    if (!isdefined(attacker.var_9854aa3a) || !isinarray(attacker.var_9854aa3a, self)) {
        attacker.var_520e7d03++;
    }
    if (attacker.var_520e7d03 >= 2) {
        attacker character_unlock::function_c8beca5e(#"nomad_unlock", #"hash_7eb32c4c67ae13fe", 1);
    }
}

