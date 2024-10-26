#using scripts\core_common\rank_shared.gsc;
#using scripts\abilities\ability_power.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace scoreevents;

// Namespace scoreevents/scoreevents_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x6c178449, Offset: 0x140
// Size: 0xb8
function function_6f51d1e9(event, players, victim, weapon) {
    if (!isdefined(players)) {
        return;
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        processscoreevent(event, player, victim, weapon);
    }
}

// Namespace scoreevents/scoreevents_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x8e08fe88, Offset: 0x200
// Size: 0x674
function processscoreevent(event, player, victim, weapon, var_36f23f1f) {
    scoregiven = 0;
    if (isdefined(level.scoreinfo[event]) && isdefined(level.scoreinfo[event][#"is_deprecated"]) && level.scoreinfo[event][#"is_deprecated"]) {
        return scoregiven;
    }
    if (isdefined(level.disablescoreevents) && level.disablescoreevents) {
        return scoregiven;
    }
    if (!isplayer(player)) {
        return scoregiven;
    }
    pixbeginevent(#"processscoreevent");
    isscoreevent = 0;
    /#
        if (getdvarint(#"logscoreevents", 0) > 0) {
            if (!isdefined(level.var_10cd7193)) {
                level.var_10cd7193 = [];
            }
            eventstr = ishash(event) ? function_9e72a96(event) : event;
            if (!isdefined(level.var_10cd7193)) {
                level.var_10cd7193 = [];
            } else if (!isarray(level.var_10cd7193)) {
                level.var_10cd7193 = array(level.var_10cd7193);
            }
            level.var_10cd7193[level.var_10cd7193.size] = eventstr;
        }
    #/
    if (isdefined(level.challengesoneventreceived)) {
        player thread [[ level.challengesoneventreceived ]](event);
    }
    if (isdefined(level.var_6c0f31f5)) {
        profilestart();
        params = {};
        params.event = event;
        params.victim = victim;
        player [[ level.var_6c0f31f5 ]](params);
        profilestop();
    }
    if (isregisteredevent(event) && (!sessionmodeiszombiesgame() || level.onlinegame)) {
        if (isdefined(level.scoreongiveplayerscore)) {
            scoregiven = [[ level.scoreongiveplayerscore ]](event, player, victim, undefined, weapon, var_36f23f1f);
            if (scoregiven > 0) {
                player ability_power::power_gain_event_score(event, victim, scoregiven, weapon);
            }
        }
    }
    if (shouldaddrankxp(player) && (!isdefined(victim) || !(isdefined(victim.disable_score_events) && victim.disable_score_events))) {
        pickedup = 0;
        if (isdefined(weapon) && isdefined(player.pickedupweapons) && isdefined(player.pickedupweapons[weapon])) {
            pickedup = 1;
        }
        xp_difficulty_multiplier = 1;
        if (isdefined(level.var_3426461d)) {
            xp_difficulty_multiplier = [[ level.var_3426461d ]]();
        }
        player addrankxp(event, weapon, player.class_num, pickedup, isscoreevent, xp_difficulty_multiplier);
        if (isdefined(event) && isdefined(weapon) && isdefined(level.scoreinfo[event])) {
            var_6d1793bb = level.scoreinfo[event][#"medalnamehash"];
            if (isdefined(var_6d1793bb)) {
                specialistindex = player getspecialistindex();
                medalname = function_dcad256c(specialistindex, currentsessionmode(), 0);
                if (medalname == var_6d1793bb) {
                    player.ability_medal_count = (isdefined(player.ability_medal_count) ? player.ability_medal_count : 0) + 1;
                    player.pers["ability_medal_count" + specialistindex] = player.ability_medal_count;
                }
                medalname = function_dcad256c(specialistindex, currentsessionmode(), 1);
                if (medalname == var_6d1793bb) {
                    player.equipment_medal_count = (isdefined(player.equipment_medal_count) ? player.equipment_medal_count : 0) + 1;
                    player.pers["equipment_medal_count" + specialistindex] = player.equipment_medal_count;
                }
            }
        }
    }
    pixendevent();
    if (sessionmodeiscampaigngame() && isdefined(xp_difficulty_multiplier)) {
        if (isdefined(victim) && isdefined(victim.team)) {
            if (victim.team == #"axis" || victim.team == #"team3") {
                scoregiven *= xp_difficulty_multiplier;
            }
        }
    }
    return scoregiven;
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xcd39143e, Offset: 0x880
// Size: 0x16a
function shouldaddrankxp(player) {
    if (level.gametype == "fr") {
        return false;
    }
    if (level.gametype == "zclassic" && isdefined(level.var_5164a0ca) && level.var_5164a0ca) {
        return false;
    }
    if (isdefined(level.var_4f654f3a) && level.var_4f654f3a) {
        /#
            playername = "<dev string:x38>";
            if (isdefined(player) && isdefined(player.name)) {
                playername = player.name;
            }
            println("<dev string:x42>" + playername);
        #/
        return false;
    }
    if (!isdefined(level.rankcap) || level.rankcap == 0) {
        return true;
    }
    if (player.pers[#"plevel"] > 0 || player.pers[#"rank"] > level.rankcap) {
        return false;
    }
    return true;
}

// Namespace scoreevents/scoreevents_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3e35b6b6, Offset: 0x9f8
// Size: 0x9c
function uninterruptedobitfeedkills(attacker, weapon) {
    self endon(#"disconnect");
    wait 0.1;
    util::waittillslowprocessallowed();
    wait 0.1;
    if (isdefined(attacker)) {
        processscoreevent(#"uninterrupted_obit_feed_kills", attacker, self, weapon);
        attacker contracts::increment_contract(#"contract_mp_quad_feed");
    }
}

// Namespace scoreevents/scoreevents_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x294d3c02, Offset: 0xaa0
// Size: 0x64
function function_c046c773(waitduration, event, player, victim, weapon) {
    self endon(#"disconnect");
    wait waitduration;
    processscoreevent(event, player, victim, weapon);
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x90eaa5ff, Offset: 0xb10
// Size: 0x30
function isregisteredevent(type) {
    if (isdefined(level.scoreinfo[type])) {
        return 1;
    }
    return 0;
}

// Namespace scoreevents/scoreevents_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x886ebe9f, Offset: 0xb48
// Size: 0x4c
function decrementlastobituaryplayercountafterfade() {
    level endon(#"reset_obituary_count");
    wait 5;
    level.lastobituaryplayercount--;
    assert(level.lastobituaryplayercount >= 0);
}

// Namespace scoreevents/scoreevents_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2d42533b, Offset: 0xba0
// Size: 0x122
function function_2b96d7dc() {
    if (!isdefined(level.var_d1455682)) {
        return undefined;
    }
    table_name = function_6a9e36d6();
    if (!isdefined(table_name)) {
        return undefined;
    }
    args = strtok(table_name, "\");
    if (args.size) {
        table_name = "";
        foreach (index, arg in args) {
            table_name += arg;
            if (index < args.size - 1) {
                table_name += "/";
            }
        }
    }
    return hash(table_name);
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x40d2b611, Offset: 0xcd0
// Size: 0x25a
function getscoreeventtablename(gametype) {
    table_name = function_2b96d7dc();
    if (isdefined(table_name) && isdefined(isassetloaded("stringtable", table_name)) && isassetloaded("stringtable", table_name)) {
        return table_name;
    }
    if (!isdefined(gametype)) {
        gametype = "base";
    }
    prefix = #"gamedata/tables/mp/scoreinfo/mp_scoreinfo";
    if (sessionmodeiscampaigngame()) {
        prefix = #"gamedata/tables/cp/scoreinfo/cp_scoreinfo";
    } else if (sessionmodeiszombiesgame()) {
        prefix = #"gamedata/tables/zm/scoreinfo/zm_scoreinfo";
    } else if (sessionmodeiswarzonegame()) {
        prefix = #"gamedata/tables/wz/scoreinfo/wz_scoreinfo";
    }
    gametype = strreplace(gametype, "_hc", "");
    gametype = strreplace(gametype, "_cwl", "");
    gametype = strreplace(gametype, "_bb", "");
    tablename = prefix + "_" + gametype + ".csv";
    if (!(isdefined(isassetloaded("stringtable", tablename)) && isassetloaded("stringtable", tablename))) {
        tablename = prefix + "_base.csv";
    }
    if (isdefined(isassetloaded("stringtable", tablename)) && isassetloaded("stringtable", tablename)) {
        return tablename;
    }
    return tablename;
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x0
// Checksum 0x4813999a, Offset: 0xf38
// Size: 0xe8
function getscoreeventtableid(gametype) {
    scoreinfotableloaded = 0;
    tablename = getscoreeventtablename(gametype);
    scoreinfotableid = tablelookupfindcoreasset(tablename);
    if (!isdefined(scoreinfotableid)) {
        tablelookupfindcoreasset(getscoreeventtablename("base"));
    }
    if (isdefined(scoreinfotableid)) {
        scoreinfotableloaded = 1;
    }
    assert(scoreinfotableloaded, "<dev string:x70>" + function_9e72a96(getscoreeventtablename()));
    return scoreinfotableid;
}

// Namespace scoreevents/scoreevents_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb6f9d4df, Offset: 0x1028
// Size: 0x1ec
function givecratecapturemedal(crate, capturer) {
    if (isdefined(crate.owner) && isplayer(crate.owner)) {
        if (level.teambased) {
            if (capturer.team != crate.owner.team) {
                crate.owner playlocalsound(#"mpl_crate_enemy_steals");
                if (!isdefined(crate.hacker)) {
                    processscoreevent(#"capture_enemy_crate", capturer, undefined, undefined);
                }
            } else if (isdefined(crate.owner) && capturer != crate.owner) {
                crate.owner playlocalsound(#"mpl_crate_friendly_steals");
                if (!isdefined(crate.hacker)) {
                    level.globalsharepackages++;
                    processscoreevent(#"share_care_package", crate.owner, undefined, undefined);
                }
            }
            return;
        }
        if (capturer != crate.owner) {
            crate.owner playlocalsound(#"mpl_crate_enemy_steals");
            if (!isdefined(crate.hacker)) {
                processscoreevent(#"capture_enemy_crate", capturer, undefined, undefined);
            }
        }
    }
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x0
// Checksum 0x80d37d99, Offset: 0x1220
// Size: 0x46
function register_hero_ability_kill_event(event_func) {
    if (!isdefined(level.hero_ability_kill_events)) {
        level.hero_ability_kill_events = [];
    }
    level.hero_ability_kill_events[level.hero_ability_kill_events.size] = event_func;
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x0
// Checksum 0xf7da446a, Offset: 0x1270
// Size: 0x46
function register_hero_ability_multikill_event(event_func) {
    if (!isdefined(level.hero_ability_multikill_events)) {
        level.hero_ability_multikill_events = [];
    }
    level.hero_ability_multikill_events[level.hero_ability_multikill_events.size] = event_func;
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x0
// Checksum 0xbd8b4d61, Offset: 0x12c0
// Size: 0x46
function register_hero_weapon_multikill_event(event_func) {
    if (!isdefined(level.hero_weapon_multikill_events)) {
        level.hero_weapon_multikill_events = [];
    }
    level.hero_weapon_multikill_events[level.hero_weapon_multikill_events.size] = event_func;
}

// Namespace scoreevents/scoreevents_shared
// Params 1, eflags: 0x0
// Checksum 0xc5c04663, Offset: 0x1310
// Size: 0x46
function register_thief_shutdown_enemy_event(event_func) {
    if (!isdefined(level.thief_shutdown_enemy_events)) {
        level.thief_shutdown_enemy_events = [];
    }
    level.thief_shutdown_enemy_events[level.thief_shutdown_enemy_events.size] = event_func;
}

// Namespace scoreevents/scoreevents_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd26a5ace, Offset: 0x1360
// Size: 0xa4
function hero_ability_kill_event(ability, victim_ability) {
    if (!isdefined(level.hero_ability_kill_events)) {
        return;
    }
    foreach (event_func in level.hero_ability_kill_events) {
        if (isdefined(event_func)) {
            self [[ event_func ]](ability, victim_ability);
        }
    }
}

// Namespace scoreevents/scoreevents_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x41f47c2a, Offset: 0x1410
// Size: 0xa4
function hero_ability_multikill_event(killcount, ability) {
    if (!isdefined(level.hero_ability_multikill_events)) {
        return;
    }
    foreach (event_func in level.hero_ability_multikill_events) {
        if (isdefined(event_func)) {
            self [[ event_func ]](killcount, ability);
        }
    }
}

// Namespace scoreevents/scoreevents_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x89927ce4, Offset: 0x14c0
// Size: 0xa4
function hero_weapon_multikill_event(killcount, weapon) {
    if (!isdefined(level.hero_weapon_multikill_events)) {
        return;
    }
    foreach (event_func in level.hero_weapon_multikill_events) {
        if (isdefined(event_func)) {
            self [[ event_func ]](killcount, weapon);
        }
    }
}

// Namespace scoreevents/scoreevents_shared
// Params 0, eflags: 0x0
// Checksum 0xb262480b, Offset: 0x1570
// Size: 0x8e
function thief_shutdown_enemy_event() {
    if (!isdefined(level.thief_shutdown_enemy_event)) {
        return;
    }
    foreach (event_func in level.thief_shutdown_enemy_event) {
        if (isdefined(event_func)) {
            self [[ event_func ]]();
        }
    }
}

// Namespace scoreevents/scoreevents_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7445a52c, Offset: 0x1608
// Size: 0x34
function function_dcdf1105() {
    self callback::add_callback(#"fully_healed", &player_fully_healed);
}

// Namespace scoreevents/scoreevents_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb9f795c0, Offset: 0x1648
// Size: 0xe
function player_fully_healed() {
    self.var_ae639436 = undefined;
}

// Namespace scoreevents/scoreevents_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x98cafcf2, Offset: 0x1660
// Size: 0x10
function player_spawned() {
    profilestart();
    self.var_ae639436 = undefined;
    profilestop();
}

// Namespace scoreevents/scoreevents_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x92e2b475, Offset: 0x1678
// Size: 0xc4
function function_f40d64cc(attacker, vehicle, weapon) {
    if (!isdefined(weapon)) {
        return;
    }
    switch (weapon.statname) {
    case #"ultimate_turret":
        event = "automated_turret_vehicle_destruction";
        break;
    default:
        return;
    }
    victim = isdefined(vehicle) ? vehicle.owner : undefined;
    processscoreevent(event, attacker, victim, weapon);
}

