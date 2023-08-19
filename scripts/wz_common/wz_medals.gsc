// Atian COD Tools GSC decompiler test
#include scripts/wz_common/gametypes/warzone.gsc;
#include scripts/mp_common/player/player_record.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include script_1d29de500c266470;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/match_record.gsc;
#include scripts/core_common/loot_tracking.gsc;
#include scripts/core_common/gamestate.gsc;
#include scripts/core_common/contracts_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace wz_medals;

// Namespace wz_medals/wz_medals
// Params 0, eflags: 0x2
// Checksum 0x218717ce, Offset: 0xf8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_medals", &__init__, &__main__, undefined);
}

// Namespace wz_medals/wz_medals
// Params 0, eflags: 0x1 linked
// Checksum 0xacf45832, Offset: 0x148
// Size: 0x44
function __init__() {
    callback::on_revived(&function_843da215);
    callback::on_player_killed_with_params(&function_f4837321);
}

// Namespace wz_medals/wz_medals
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x198
// Size: 0x4
function __main__() {
    
}

// Namespace wz_medals/wz_medals
// Params 1, eflags: 0x1 linked
// Checksum 0x4265f897, Offset: 0x1a8
// Size: 0xec
function function_843da215(params) {
    if (!gamestate::is_state("playing") || !isplayer(params.reviver) || !isdefined(params.attacker)) {
        return;
    }
    if (params.attacker.team === params.reviver.team) {
        return;
    }
    weapon = getweapon(#"bare_hands");
    scoreevents::processscoreevent(#"revives", params.reviver, undefined, weapon);
}

// Namespace wz_medals/wz_medals
// Params 1, eflags: 0x1 linked
// Checksum 0xf6408d57, Offset: 0x2a0
// Size: 0x10c
function function_f4837321(params) {
    if (!isdefined(self.laststandparams) || !isdefined(self.var_a1d415ee)) {
        return;
    }
    original_attacker = self.laststandparams.attacker;
    var_8efbdcbb = self.var_a1d415ee.attacker;
    weapon = self.laststandparams.sweapon;
    if (!isdefined(original_attacker) || !isplayer(var_8efbdcbb) || !isdefined(weapon)) {
        return;
    }
    if (var_8efbdcbb.team === self.team) {
        return;
    }
    if (original_attacker != var_8efbdcbb) {
        scoreevents::processscoreevent(#"assists", var_8efbdcbb, undefined, weapon);
    }
}

