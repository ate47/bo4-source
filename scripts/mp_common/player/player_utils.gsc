#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\hud_message_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\killstreaks_util;
#using scripts\killstreaks\mp\killstreaks;
#using scripts\mp_common\util;

#namespace player;

// Namespace player/player_utils
// Params 2, eflags: 0x0
// Checksum 0x8d3c5801, Offset: 0xf8
// Size: 0x10a
function figure_out_friendly_fire(victim, attacker) {
    if (level.hardcoremode && level.friendlyfire > 0 && isdefined(victim) && victim.is_capturing_own_supply_drop === 1) {
        return 2;
    }
    if (killstreaks::is_ricochet_protected(victim)) {
        return 2;
    }
    if (level.friendlyfire == 4 && isplayer(attacker)) {
        if (attacker.pers[#"teamkills_nostats"] < level.var_fe3ff9c1) {
            return 1;
        } else {
            return 2;
        }
    }
    if (isdefined(level.figure_out_gametype_friendly_fire)) {
        return [[ level.figure_out_gametype_friendly_fire ]](victim);
    }
    return level.friendlyfire;
}

// Namespace player/player_utils
// Params 0, eflags: 0x0
// Checksum 0x48bf67ed, Offset: 0x210
// Size: 0xfc
function freeze_player_for_round_end() {
    self hud_message::clearlowermessage();
    if (!function_8b1a219a()) {
        self closeingamemenu();
    }
    self val::set(#"freeze_player_for_round_end", "freezecontrols");
    self val::set(#"freeze_player_for_round_end", "disablegadgets");
    currentweapon = self getcurrentweapon();
    if (killstreaks::is_killstreak_weapon(currentweapon) && !currentweapon.iscarriedkillstreak) {
        self takeweapon(currentweapon);
    }
}

// Namespace player/player_utils
// Params 1, eflags: 0x0
// Checksum 0x465a6e7f, Offset: 0x318
// Size: 0x124
function function_c49fc862(team) {
    if (isdefined(level.takelivesondeath) && level.takelivesondeath && isdefined(level.teambased) && level.teambased && !(isdefined(level.var_a5f54d9f) && level.var_a5f54d9f)) {
        teamid = "team" + level.teamindex[team];
        if (isdefined(level.var_61952d8b[team]) && level.var_61952d8b[team]) {
            clientfield::set_world_uimodel("hudItems." + teamid + ".livesCount", level.playerlives[team]);
            return;
        }
        clientfield::set_world_uimodel("hudItems." + teamid + ".livesCount", game.lives[team]);
    }
}

// Namespace player/player_utils
// Params 0, eflags: 0x0
// Checksum 0x4b51e147, Offset: 0x448
// Size: 0x6c
function function_14e61d05() {
    return self hasperk(#"specialty_stunprotection") || self hasperk(#"specialty_flashprotection") || self hasperk(#"specialty_proximityprotection");
}

// Namespace player/player_utils
// Params 2, eflags: 0x0
// Checksum 0x7e817675, Offset: 0x4c0
// Size: 0x64
function function_cf3aa03d(func, threaded = 1) {
    array::add(level.var_da2045d0, {#callback:func, #threaded:threaded});
}

// Namespace player/player_utils
// Params 2, eflags: 0x0
// Checksum 0x3d5c16bf, Offset: 0x530
// Size: 0x64
function function_3c5cc656(func, threaded = 1) {
    array::add(level.var_fa66fada, {#callback:func, #threaded:threaded});
}

