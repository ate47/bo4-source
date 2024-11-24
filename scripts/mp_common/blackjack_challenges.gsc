#using scripts\core_common\callbacks_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\player\player_role;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\system_shared;

#namespace blackjack_challenges;

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x2
// Checksum 0xb01cd02d, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"blackjack_challenges", &__init__, undefined, undefined);
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x0
// Checksum 0x2ba4da3, Offset: 0x140
// Size: 0x24
function __init__() {
    callback::on_start_gametype(&start_gametype);
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x0
// Checksum 0xef31adfb, Offset: 0x170
// Size: 0xec
function start_gametype() {
    if (!isdefined(level.challengescallbacks)) {
        level.challengescallbacks = [];
    }
    waittillframeend();
    if (challenges::canprocesschallenges()) {
        challenges::registerchallengescallback("playerKilled", &challenge_kills);
        challenges::registerchallengescallback("roundEnd", &challenge_round_ended);
        challenges::registerchallengescallback("gameEnd", &challenge_game_ended);
        scoreevents::register_hero_ability_kill_event(&on_hero_ability_kill);
    }
    callback::on_connect(&on_player_connect);
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x0
// Checksum 0xd602f8a7, Offset: 0x268
// Size: 0x1c2
function on_player_connect() {
    player = self;
    if (challenges::canprocesschallenges()) {
        specialistindex = player player_role::get();
        isblackjack = specialistindex == 9;
        if (isblackjack) {
            player thread track_blackjack_consumable();
            if (!isdefined(self.pers[#"blackjack_challenge_active"])) {
                remaining_time = player consumableget("blackjack", "awarded") - player consumableget("blackjack", "consumed");
                if (remaining_time > 0) {
                    special_card_earned = player get_challenge_stat("special_card_earned");
                    if (!special_card_earned) {
                        player.pers[#"blackjack_challenge_active"] = 1;
                        player.pers[#"blackjack_unique_specialist_kills"] = 0;
                        player.pers[#"blackjack_specialist_kills"] = 0;
                        player.pers[#"blackjack_unique_weapon_mask"] = 0;
                        player.pers[#"blackjack_unique_ability_mask"] = 0;
                    }
                }
            }
        }
    }
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x0
// Checksum 0x667859df, Offset: 0x438
// Size: 0x22
function is_challenge_active() {
    return self.pers[#"blackjack_challenge_active"] === 1;
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 2, eflags: 0x0
// Checksum 0xd7939e01, Offset: 0x468
// Size: 0x16c
function on_hero_ability_kill(ability, victimability) {
    player = self;
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (!isdefined(player.isroulette) || !player.isroulette) {
        return;
    }
    if (player is_challenge_active()) {
        player.pers[#"blackjack_specialist_kills"]++;
        currentheroabilitymask = player.pers[#"blackjack_unique_ability_mask"];
        heroabilitymask = get_hero_ability_mask(ability);
        newheroabilitymask = heroabilitymask | currentheroabilitymask;
        if (newheroabilitymask != currentheroabilitymask) {
            player.pers[#"blackjack_unique_specialist_kills"]++;
            player.pers[#"blackjack_unique_ability_mask"] = newheroabilitymask;
        }
        player check_blackjack_challenge();
    }
}

/#

    // Namespace blackjack_challenges/blackjack_challenges
    // Params 0, eflags: 0x0
    // Checksum 0x6b4f4606, Offset: 0x5e0
    // Size: 0x4c
    function debug_print_already_earned() {
        if (getdvarint(#"scr_blackjack_sidebet_debug", 0) == 0) {
            return;
        }
        iprintln("<dev string:x38>");
    }

    // Namespace blackjack_challenges/blackjack_challenges
    // Params 0, eflags: 0x0
    // Checksum 0x6ca99c99, Offset: 0x638
    // Size: 0xa4
    function debug_print_kill_info() {
        if (getdvarint(#"scr_blackjack_sidebet_debug", 0) == 0) {
            return;
        }
        player = self;
        iprintln("<dev string:x67>" + player.pers[#"blackjack_specialist_kills"] + "<dev string:x84>" + player.pers[#"blackjack_unique_specialist_kills"]);
    }

    // Namespace blackjack_challenges/blackjack_challenges
    // Params 0, eflags: 0x0
    // Checksum 0x2f70069e, Offset: 0x6e8
    // Size: 0x4c
    function debug_print_earned() {
        if (getdvarint(#"scr_blackjack_sidebet_debug", 0) == 0) {
            return;
        }
        iprintln("<dev string:x92>");
    }

#/

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x0
// Checksum 0x51153d44, Offset: 0x740
// Size: 0x124
function check_blackjack_challenge() {
    player = self;
    /#
        debug_print_kill_info();
    #/
    special_card_earned = player get_challenge_stat("special_card_earned");
    if (special_card_earned) {
        /#
            debug_print_already_earned();
        #/
        return;
    }
    if (player.pers[#"blackjack_specialist_kills"] >= 4 && player.pers[#"blackjack_unique_specialist_kills"] >= 2) {
        player set_challenge_stat("special_card_earned", 1);
        player stats::function_dad108fa(#"blackjack_challenge", 1);
        /#
            debug_print_earned();
        #/
    }
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 1, eflags: 0x0
// Checksum 0x16590d16, Offset: 0x870
// Size: 0x22c
function challenge_kills(data) {
    attackeristhief = data.attackeristhief;
    attackerisroulette = data.attackerisroulette;
    attackeristhieforroulette = attackeristhief || attackerisroulette;
    if (!attackeristhieforroulette) {
        return;
    }
    victim = data.victim;
    attacker = data.attacker;
    player = attacker;
    weapon = data.weapon;
    if (!isdefined(weapon) || weapon == level.weaponnone) {
        return;
    }
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    if (attackeristhief) {
        if (weapon.isheroweapon === 1) {
            if (player is_challenge_active()) {
                player.pers[#"blackjack_specialist_kills"]++;
                currentheroweaponmask = player.pers[#"blackjack_unique_weapon_mask"];
                heroweaponmask = get_hero_weapon_mask(attacker, weapon);
                newheroweaponmask = heroweaponmask | currentheroweaponmask;
                if (newheroweaponmask != currentheroweaponmask) {
                    player.pers[#"blackjack_unique_specialist_kills"] = player.pers[#"blackjack_unique_specialist_kills"] + 1;
                    player.pers[#"blackjack_unique_weapon_mask"] = newheroweaponmask;
                }
                player check_blackjack_challenge();
            }
        }
    }
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 1, eflags: 0x0
// Checksum 0x8accb864, Offset: 0xaa8
// Size: 0x2a
function get_challenge_stat(stat_name) {
    return self stats::get_stat(#"tenthspecialistcontract", stat_name);
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 2, eflags: 0x0
// Checksum 0x386f42c0, Offset: 0xae0
// Size: 0x3a
function set_challenge_stat(stat_name, stat_value) {
    return self stats::set_stat(#"tenthspecialistcontract", stat_name, stat_value);
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 2, eflags: 0x0
// Checksum 0xcf1356ab, Offset: 0xb28
// Size: 0x182
function get_hero_weapon_mask(attacker, weapon) {
    if (!isdefined(weapon)) {
        return 0;
    }
    switch (weapon.name) {
    case #"hero_minigun":
        return 1;
    case #"hero_flamethrower":
        return 2;
    case #"hero_lightninggun":
    case #"hero_lightninggun_arc":
        return 4;
    case #"hero_firefly_swarm":
    case #"hero_chemicalgelgun":
        return 8;
    case #"hero_pineapple_grenade":
    case #"hero_pineapplegun":
        return 16;
    case #"hero_bowlauncher2":
    case #"hero_bowlauncher3":
    case #"hero_bowlauncher4":
    case #"hero_bowlauncher":
        return 64;
    case #"hero_gravityspikes":
        return 128;
    case #"hero_annihilator":
        return 256;
    default:
        return 0;
    }
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 1, eflags: 0x0
// Checksum 0xf52875ef, Offset: 0xcb8
// Size: 0x11a
function get_hero_ability_mask(ability) {
    if (!isdefined(ability)) {
        return 0;
    }
    switch (ability.name) {
    case #"gadget_clone":
        return 1;
    case #"gadget_heat_wave":
        return 2;
    case #"gadget_resurrect":
        return 8;
    case #"gadget_armor":
        return 16;
    case #"gadget_camo":
        return 32;
    case #"gadget_vision_pulse":
        return 64;
    case #"gadget_speed_burst":
        return 128;
    case #"gadget_combat_efficiency":
        return 256;
    default:
        return 0;
    }
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 1, eflags: 0x0
// Checksum 0x3dd7dd96, Offset: 0xde0
// Size: 0x94
function challenge_game_ended(data) {
    if (!isdefined(data)) {
        return;
    }
    player = data.player;
    if (!isdefined(player)) {
        return;
    }
    if (!isplayer(player)) {
        return;
    }
    if (isbot(player)) {
        return;
    }
    if (!player is_challenge_active()) {
        return;
    }
    player report_consumable();
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 1, eflags: 0x0
// Checksum 0x4052880f, Offset: 0xe80
// Size: 0x94
function challenge_round_ended(data) {
    if (!isdefined(data)) {
        return;
    }
    player = data.player;
    if (!isdefined(player)) {
        return;
    }
    if (!isplayer(player)) {
        return;
    }
    if (isbot(player)) {
        return;
    }
    if (!player is_challenge_active()) {
        return;
    }
    player report_consumable();
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x0
// Checksum 0xd9aaa8bf, Offset: 0xf20
// Size: 0xf8
function track_blackjack_consumable() {
    level endon(#"game_ended");
    self notify(#"track_blackjack_consumable_singleton");
    self endon(#"track_blackjack_consumable_singleton", #"disconnect");
    player = self;
    if (!isdefined(player.last_blackjack_consumable_time)) {
        player.last_blackjack_consumable_time = 0;
    }
    while (isdefined(player)) {
        random_wait_time = getdvarfloat(#"mp_blackjack_consumable_wait", 20) + randomfloatrange(-5, 5);
        wait random_wait_time;
        player report_consumable();
    }
}

// Namespace blackjack_challenges/blackjack_challenges
// Params 0, eflags: 0x0
// Checksum 0xa50b60cb, Offset: 0x1020
// Size: 0x162
function report_consumable() {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(player.timeplayed) || !isdefined(player.timeplayed[#"total"])) {
        return;
    }
    current_time_played = player.timeplayed[#"total"];
    time_to_report = current_time_played - player.last_blackjack_consumable_time;
    if (time_to_report > 0) {
        max_time_to_report = player consumableget("blackjack", "awarded") - player consumableget("blackjack", "consumed");
        consumable_increment = int(min(time_to_report, max_time_to_report));
        if (consumable_increment > 0) {
            player consumableincrement("blackjack", "consumed", consumable_increment);
        }
    }
    player.last_blackjack_consumable_time = current_time_played;
}

