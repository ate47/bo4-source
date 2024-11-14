#using scripts\mp_common\teams\teamset;

#namespace teamset_multiteam;

// Namespace teamset_multiteam/teamset_multiteam
// Params 0, eflags: 0x0
// Checksum 0xc0a0e8d, Offset: 0x178
// Size: 0xc6
function main() {
    teamset::init();
    toggle = 0;
    foreach (team in level.teams) {
        if (toggle % 2) {
            init_axis(team);
        } else {
            init_allies(team);
        }
        toggle++;
    }
}

// Namespace teamset_multiteam/teamset_multiteam
// Params 1, eflags: 0x0
// Checksum 0x8b2e4dcb, Offset: 0x248
// Size: 0x102
function init_allies(team) {
    level.teamprefix[team] = "vox_st";
    level.teampostfix[team] = "st6";
    game.music["spawn_" + team] = "SPAWN_ST6";
    game.music["spawn_short" + team] = "SPAWN_SHORT_ST6";
    game.music["victory_" + team] = "VICTORY_ST6";
    game.voice[team] = "vox_st6_";
    game.flagmodels[team] = "mp_flag_allies_1";
    game.carry_flagmodels[team] = "mp_flag_allies_1_carry";
}

// Namespace teamset_multiteam/teamset_multiteam
// Params 1, eflags: 0x0
// Checksum 0xaba8ead2, Offset: 0x358
// Size: 0x102
function init_axis(team) {
    level.teamprefix[team] = "vox_pm";
    level.teampostfix[team] = "init_axis";
    game.music["spawn_" + team] = "SPAWN_PMC";
    game.music["spawn_short" + team] = "SPAWN_SHORT_PMC";
    game.music["victory_" + team] = "VICTORY_PMC";
    game.voice[team] = "vox_pmc_";
    game.flagmodels[team] = "mp_flag_axis_1";
    game.carry_flagmodels[team] = "mp_flag_axis_1_carry";
}

