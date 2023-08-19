// Atian COD Tools GSC decompiler test
#include scripts/mp_common/teams/teamset.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace teamset_allies;

// Namespace teamset_allies/teamset_allies
// Params 0, eflags: 0x2
// Checksum 0x7ad7ab16, Offset: 0x138
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"teamset_allies", &__init__, undefined, undefined);
}

// Namespace teamset_allies/teamset_allies
// Params 0, eflags: 0x1 linked
// Checksum 0xf8e78520, Offset: 0x180
// Size: 0xc4
function __init__() {
    init("free");
    foreach (team in level.teams) {
        if (team == #"axis") {
            continue;
        }
        init(team);
    }
    teamset::customteam_init();
}

// Namespace teamset_allies/teamset_allies
// Params 1, eflags: 0x1 linked
// Checksum 0x4a030325, Offset: 0x250
// Size: 0x13a
function init(team) {
    teamset::init();
    level.teamprefix[team] = "vox_st";
    level.teampostfix[team] = "st6";
    game.music["spawn_" + team] = "SPAWN_ST6";
    game.music["spawn_short" + team] = "SPAWN_SHORT_ST6";
    game.music["victory_" + team] = "VICTORY_ST6";
    game.voice[team] = "vox_st6_";
    game.flagmodels[team] = "p8_mp_flag_pole_1_blackops";
    game.carry_flagmodels[team] = "p8_mp_flag_carry_1_blackops";
    game.flagmodels[#"neutral"] = "p8_mp_flag_pole_1";
}

