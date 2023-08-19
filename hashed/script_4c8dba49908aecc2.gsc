// Atian COD Tools GSC decompiler test
#include scripts/killstreaks/killstreaks_util.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/mp_common/player/player_loadout.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include script_67c9a990c0db216c;
#include scripts/core_common/player/player_role.gsc;
#include scripts/abilities/ability_player.gsc;

#namespace namespace_9096c917;

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x4338b5c4, Offset: 0x210
// Size: 0x332
function init() {
    lui::add_luimenu("full_screen_movie", &full_screen_movie::register, "full_screen_movie");
    player::function_cf3aa03d(&function_1833fe3e);
    callback::on_spawned(&function_2162b140);
    level.var_86513cd0 = &function_c11071a8;
    level.var_edd52efc = &function_edd52efc;
    level.b_movie = 0;
    level.forcedplayerteam = #"allies";
    level.var_b0fade70 = 1;
    setdvar(#"botfill", 0);
    if (isdefined(level.is_dm) && level.is_dm) {
        setdvar(#"bot_maxfree", 10);
    } else {
        setdvar(#"bot_maxallies", 5);
        setdvar(#"bot_maxaxis", 5);
    }
    callback::add_callback(#"on_end_game", &on_end_game);
    function_ea5f46d2();
    level.ct_difficulty = getdvarstring(#"hash_3617a5f5fe554488", "(default)");
    if (level.ct_difficulty == "tutorial" || level.ct_difficulty == "easy") {
        level thread function_8599f7cb();
    } else {
        level thread function_6cc515f7(level.ct_difficulty);
    }
    if (level.ct_difficulty == "tutorial" || level.ct_difficulty == "easy") {
        if (isdefined(level.var_c7494a5d) && level.var_c7494a5d) {
            level.var_352d65e9 = 0.6;
        } else {
            level.var_352d65e9 = 0.8;
        }
    } else if (level.ct_difficulty == "hard") {
        level.var_352d65e9 = 1.15;
    } else {
        level.var_352d65e9 = 1;
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x1 linked
// Checksum 0xd3ac04b5, Offset: 0x550
// Size: 0xbc
function on_end_game(params) {
    setdvar(#"botfill", 0);
    setdvar(#"bot_maxfree", 0);
    setdvar(#"bot_maxallies", 0);
    setdvar(#"bot_maxaxis", 0);
    callback::remove_callback(#"on_end_game", &on_end_game);
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x56ed9150, Offset: 0x618
// Size: 0x5c
function initial_black() {
    initial_black = lui::get_luimenu("InitialBlack");
    if (isdefined(initial_black) && ![[ initial_black ]]->function_7bfd10e6(self)) {
        [[ initial_black ]]->open(self, 1);
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x19d012eb, Offset: 0x680
// Size: 0xa0
function function_92c29649() {
    self endon(#"death");
    initial_black = lui::get_luimenu("InitialBlack");
    if (isdefined(initial_black)) {
        [[ initial_black ]]->close(self);
        wait(1);
        [[ initial_black ]]->close(self);
        wait(1);
        [[ initial_black ]]->close(self);
        wait(1);
        [[ initial_black ]]->close(self);
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x43afea91, Offset: 0x728
// Size: 0x124
function function_c11071a8() {
    while (isloadingcinematicplaying()) {
        waitframe(1);
    }
    while (getnumconnectedplayers() == 0) {
        waitframe(1);
    }
    array::thread_all(getplayers(), &initial_black);
    while (!aretexturesloaded()) {
        waitframe(1);
    }
    wait(0.5);
    array::thread_all(getplayers(), &function_92c29649);
    player = getplayers()[0];
    if (isdefined(player)) {
        player thread function_b4ebcd8a();
        player function_9b717ff4();
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 2, eflags: 0x0
// Checksum 0xb7a62c82, Offset: 0x858
// Size: 0x9c
function function_3b69388(weapon, slot) {
    if (isdefined(self._gadgets_player[slot]) && self hasweapon(self._gadgets_player[slot])) {
        self gadgetpowerreset(slot, 1);
        self takeweapon(self._gadgets_player[slot]);
    }
    self giveweapon(weapon);
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x0
// Checksum 0xf9b87857, Offset: 0x900
// Size: 0xe4
function function_5e1029a() {
    player = undefined;
    while (!isdefined(player)) {
        player = getplayers()[0];
        waitframe(1);
    }
    specialist = player function_76785843();
    s_fields = getcharacterfields(specialist, currentsessionmode());
    str_map = s_fields.var_beedba3d;
    switchmap_load(str_map, s_fields.var_a19fcbe8);
    util::wait_network_frame(1);
    switchmap_switch();
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x13b1089a, Offset: 0x9f0
// Size: 0x94
function function_edd52efc() {
    specialist = getplayers()[0] function_76785843();
    /#
        assert(player_role::is_valid(specialist));
    #/
    if (player_role::is_valid(specialist)) {
        self player_role::set(specialist);
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x0
// Checksum 0x88094706, Offset: 0xa90
// Size: 0xa6
function get_roleindex(name) {
    sessionmode = currentsessionmode();
    playerroletemplatecount = getplayerroletemplatecount(sessionmode);
    for (i = 0; i < playerroletemplatecount; i++) {
        var_3c6fd4f7 = function_b14806c6(i, sessionmode);
        if (var_3c6fd4f7 == name) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x2e2f0c7b, Offset: 0xb40
// Size: 0x3ee
function function_8599f7cb() {
    level notify(#"hash_16a9990470202993");
    level endon(#"hash_16a9990470202993");
    var_d4002929 = 0;
    var_743bf28b = 0;
    level.b_movie = 1;
    s_result = undefined;
    s_result = level waittill(#"result");
    player = getplayers()[0];
    if (s_result.outcome.team === player.team) {
        var_d4002929 = 1;
    } else {
        level.b_movie = 0;
    }
    if (s_result.outcome.var_c1e98979 === 9 || s_result.outcome.var_aefc8b8d.var_c1e98979 === 9) {
        var_743bf28b = 1;
        level.b_movie = 0;
        return;
    } else {
        level thread function_8e22d234();
    }
    level waittill(#"hash_5562cfc90ce9dfe2");
    if (!var_d4002929) {
        return;
    }
    player = getplayers()[0];
    var_f77362e3 = player function_2037c576();
    fields = getscriptbundle(#"hash_7c41940a6a9678d7");
    if (var_f77362e3 == 9) {
        var_d6602dc0 = fields.var_b51717c3;
    } else {
        var_d6602dc0 = fields.var_3d800252[var_f77362e3].var_40a74d4a;
    }
    specialist = player function_76785843();
    if (isdefined(var_d6602dc0) && !var_743bf28b) {
        if (var_d4002929 && (level.ct_difficulty == "tutorial" || level.ct_difficulty == "easy")) {
            function_9a022fbc("open");
            if (var_f77362e3 < 9) {
                player function_d6095f2b(var_f77362e3 + 1);
            } else {
                player function_efa762f6(#"hash_76e7e78c3850134a");
            }
            player function_3b91934f(specialist, #"skirmish_completed");
            player function_a6cbcab(specialist, #"bronze");
            player function_ea859fe2();
            player thread function_51450191();
            player thread function_78a17c00();
            function_ccc3b1e3(var_d6602dc0);
            function_9a022fbc("close");
        } else {
            level.b_movie = 0;
        }
        player function_ea859fe2();
    } else {
        level.b_movie = 0;
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x1 linked
// Checksum 0xf52d41d1, Offset: 0xf38
// Size: 0x28c
function function_6cc515f7(str_difficulty) {
    level notify(#"hash_3d21813e6de72408");
    level endon(#"hash_3d21813e6de72408");
    var_d4002929 = 0;
    level.b_movie = 0;
    s_result = undefined;
    s_result = level waittill(#"result");
    player = getplayers()[0];
    specialist = player function_76785843();
    if (s_result.outcome.team === player.team) {
        var_d4002929 = 1;
    }
    if (s_result.outcome.var_c1e98979 === 9 || s_result.outcome.var_aefc8b8d.var_c1e98979 === 9) {
        var_743bf28b = 1;
        level.b_movie = 0;
        return;
    } else {
        level thread function_8e22d234();
    }
    if (var_d4002929) {
        if (str_difficulty == "medium") {
            if (!player function_8750c45b(specialist, #"silver")) {
                player function_a6cbcab(specialist, #"silver");
                player thread function_46f9c28e();
            }
        } else if (str_difficulty == "hard") {
            if (!player function_8750c45b(specialist, #"gold")) {
                player function_a6cbcab(specialist, #"gold");
                player thread function_ca8c7182();
            }
        }
    }
    player function_ea859fe2();
    player thread function_78a17c00();
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x1 linked
// Checksum 0x3f770d3f, Offset: 0x11d0
// Size: 0x74
function function_ccc3b1e3(var_d6602dc0) {
    e_player = getplayers(#"allies")[0];
    if (isdefined(e_player) && isplayer(e_player)) {
        e_player function_95e72b33(var_d6602dc0);
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x5 linked
// Checksum 0x134d80fc, Offset: 0x1250
// Size: 0xcc
function private function_95e72b33(moviefile) {
    while (isloadingcinematicplaying()) {
        waitframe(1);
    }
    self val::set(#"hash_61f16f3175b9a96f", "freezecontrols", 1);
    self thread lui::play_movie(hash(moviefile), "fullscreen", 1, 0, 1);
    level waittill(#"movie_done");
    self val::reset(#"hash_61f16f3175b9a96f", "freezecontrols");
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x4a37d61a, Offset: 0x1328
// Size: 0x236
function function_ea5f46d2() {
    level.var_247f79eb = function_5f516f9d(#"headshots");
    level.var_6f99c3bd = function_5f516f9d(#"melee_kills");
    level.var_7e008e0c = function_5f516f9d(#"hash_65d388fae333b6ea");
    level.var_24370902 = function_5f516f9d(#"hash_4abb8db802b122b5");
    level.var_924497ca = function_5f516f9d(#"hash_512584b15284d144");
    level.var_94b2e2da = function_5f516f9d(#"hash_513bb5302a850f1c");
    level.var_9356f44c = function_5f516f9d(#"hash_1ebacadf6dc3dbdf");
    level.var_f0b5757d = function_5f516f9d(#"hash_47f09f514721a1c2");
    level.var_b7ad6f5b = function_5f516f9d(#"hash_683d7dfc8782d6b9", 1);
    level.var_c30109f4 = function_5f516f9d(#"hash_68046b0858420412", 1);
    level.var_4ac5338a = function_5f516f9d(#"hash_3caeae083fb50ceb", 1);
    level.var_26d708d7 = function_5f516f9d(#"hash_4d4a62396c1ec8", 1);
    level.var_92dc2d7c = function_5f516f9d(#"hash_1aee13f64efb2ef2", 1);
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x0
// Checksum 0x276ecc18, Offset: 0x1568
// Size: 0x5c
function function_b2bc66d3() {
    specialist = self function_76785843();
    var_8be50b09 = self function_b958401e(specialist);
    self give_killstreaks(var_8be50b09);
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x1 linked
// Checksum 0x64e8454b, Offset: 0x15d0
// Size: 0x59e
function give_killstreaks(var_8be50b09) {
    self loadout::clear_killstreaks();
    if (!level.loadoutkillstreaksenabled) {
        return;
    }
    classnum = self.var_69a7c6b0;
    sortedkillstreaks = [];
    currentkillstreak = 0;
    for (killstreaknum = 0; killstreaknum < 3; killstreaknum++) {
        killstreakindex = level.killstreakindices[var_8be50b09[killstreaknum]];
        if (isdefined(killstreakindex) && killstreakindex > 0) {
            /#
                assert(isdefined(level.tbl_killstreakdata[killstreakindex]), "<unknown string>" + killstreakindex + "<unknown string>");
            #/
            if (isdefined(level.tbl_killstreakdata[killstreakindex])) {
                self.killstreak[currentkillstreak] = level.tbl_killstreakdata[killstreakindex];
                if (isdefined(level.usingmomentum) && level.usingmomentum) {
                    killstreaktype = killstreaks::get_by_menu_name(self.killstreak[currentkillstreak]);
                    if (isdefined(killstreaktype)) {
                        weapon = killstreaks::get_killstreak_weapon(killstreaktype);
                        self giveweapon(weapon);
                        if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
                            if (weapon.iscarriedkillstreak) {
                                if (!isdefined(self.pers[#"held_killstreak_ammo_count"][weapon])) {
                                    self.pers[#"held_killstreak_ammo_count"][weapon] = 0;
                                }
                                if (!isdefined(self.pers[#"held_killstreak_clip_count"][weapon])) {
                                    self.pers[#"held_killstreak_clip_count"][weapon] = 0;
                                }
                                if (self.pers[#"held_killstreak_ammo_count"][weapon] > 0) {
                                    self setweaponammoclip(weapon, self.pers[#"held_killstreak_clip_count"][weapon]);
                                    self setweaponammostock(weapon, self.pers[#"held_killstreak_ammo_count"][weapon] - self.pers[#"held_killstreak_clip_count"][weapon]);
                                } else {
                                    self function_3ba6ee5d(weapon, 0);
                                }
                            } else {
                                quantity = 0;
                                if (isdefined(self.pers[#"killstreak_quantity"]) && isdefined(self.pers[#"killstreak_quantity"][weapon])) {
                                    quantity = self.pers[#"killstreak_quantity"][weapon];
                                }
                                self setweaponammoclip(weapon, quantity);
                            }
                        }
                        sortdata = spawnstruct();
                        sortdata.cost = self function_dceb5542(level.killstreaks[killstreaktype].itemindex);
                        sortdata.weapon = weapon;
                        sortindex = 0;
                        for (sortindex = 0; sortindex < sortedkillstreaks.size; sortindex++) {
                            if (sortedkillstreaks[sortindex].cost > sortdata.cost) {
                                break;
                            }
                        }
                        for (i = sortedkillstreaks.size; i > sortindex; i--) {
                            sortedkillstreaks[i] = sortedkillstreaks[i - 1];
                        }
                        sortedkillstreaks[sortindex] = sortdata;
                    }
                }
                currentkillstreak++;
            }
        }
    }
    var_2e1bd530 = [];
    var_2e1bd530[0] = 3;
    var_2e1bd530[1] = 1;
    var_2e1bd530[2] = 0;
    if (isdefined(level.usingmomentum) && level.usingmomentum) {
        for (sortindex = 0; sortindex < sortedkillstreaks.size && sortindex < var_2e1bd530.size; sortindex++) {
            if (sortedkillstreaks[sortindex].weapon != level.weaponnone) {
                self function_d9b9c4c6(var_2e1bd530[sortindex], sortedkillstreaks[sortindex].weapon);
            }
        }
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 2, eflags: 0x1 linked
// Checksum 0x7228ae54, Offset: 0x1b78
// Size: 0xb4
function function_3ba6ee5d(weapon, amount) {
    if (weapon.iscliponly) {
        self setweaponammoclip(weapon, amount);
    } else {
        self setweaponammoclip(weapon, amount);
        diff = amount - self getweaponammoclip(weapon);
        /#
            assert(diff >= 0);
        #/
        self setweaponammostock(weapon, diff);
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x1 linked
// Checksum 0xc62cbddb, Offset: 0x1c38
// Size: 0x3ee
function function_b958401e(n_index) {
    switch (n_index) {
    case 1:
        var_8be50b09 = array(#"uav", #"recon_car", #"supplydrop_marker");
        break;
    case 2:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"planemortar");
        break;
    case 3:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"ai_tank_marker");
        break;
    case 4:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"straferun");
        break;
    case 5:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"ultimate_turret");
        break;
    case 6:
        var_8be50b09 = array(#"uav", #"recon_car", #"supplydrop_marker");
        break;
    case 7:
        var_8be50b09 = array(#"uav", #"dart", #"supplydrop_marker");
        break;
    case 8:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"overwatch_helicopter");
        break;
    case 9:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"remote_missile");
        break;
    case 10:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"ac130");
        break;
    case 11:
        var_8be50b09 = array(#"uav", #"supplydrop_marker", #"swat_team");
        break;
    }
    return var_8be50b09;
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x0
// Checksum 0xa678015, Offset: 0x2030
// Size: 0x52e
function function_d8cdeb6a(n_index) {
    switch (n_index) {
    case 1:
        var_6b99a088 = array(#"ar_accurate_t8", #"quickdraw", #"fmj", #"extbarrel");
        break;
    case 2:
        var_6b99a088 = array(#"ar_damage_t8", #"holo", #"damage", #"damage2", #"grip");
        break;
    case 3:
        var_6b99a088 = array(#"ar_fastfire_t8", #"elo", #"fastreload", #"fastreload2", #"quickdraw", #"quickdraw2");
        break;
    case 4:
        var_6b99a088 = array(#"ar_modular_t8", #"rf", #"steadyaim", #"mixclip");
        break;
    case 5:
        var_6b99a088 = array(#"ar_stealth_t8", #"damage", #"extbarrel", #"rf", #"hash_3ead2a29f1e9d7e");
        break;
    case 6:
        var_6b99a088 = array(#"ar_damage_t8", #"holo", #"damage", #"damage2");
        break;
    case 7:
        var_6b99a088 = array(#"ar_accurate_t8", #"reddot", #"grip", #"grip2", #"steadyaim");
        break;
    case 8:
        var_6b99a088 = array(#"ar_stealth_t8", #"acog", #"suppressed", #"stalker", #"stalker2");
        break;
    case 9:
        var_6b99a088 = array(#"ar_fastfire_t8", #"steadyaim", #"steadyaim2", #"stalker", #"hash_3605090fe5328123");
        break;
    case 10:
        var_6b99a088 = array(#"ar_modular_t8", #"reflex", #"suppressed", #"stalker", #"grip", #"quickdraw");
        break;
    case 11:
        var_6b99a088 = array(#"ar_damage_t8", #"fmj", #"fmj2", #"extbarrel");
        break;
    }
    return var_6b99a088;
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 9, eflags: 0x1 linked
// Checksum 0xdba3d061, Offset: 0x2568
// Size: 0x714
function function_1833fe3e(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (self.team !== attacker.team && !isbot(attacker) && isplayer(attacker)) {
        if (level.ct_difficulty == "hard") {
            if (attacker function_15e5c1da(#"hash_47f09f514721a1c2") < level.var_f0b5757d) {
                attacker function_9401373f(#"hash_47f09f514721a1c2", 1);
            }
        }
        attacker.var_7e008e0c++;
        if (attacker.var_7e008e0c > attacker function_15e5c1da(#"hash_65d388fae333b6ea") && attacker.var_7e008e0c <= level.var_7e008e0c) {
            attacker function_9401373f(#"hash_65d388fae333b6ea", 1);
        }
        if (killstreaks::is_killstreak_weapon(weapon) && weapon != getweapon(#"dog_ai_defaultmelee")) {
            if (attacker function_15e5c1da(#"hash_4abb8db802b122b5") < level.var_24370902) {
                attacker function_9401373f(#"hash_4abb8db802b122b5", 1);
            }
        }
        if (isdefined(weapon.isheroweapon) && weapon.isheroweapon || isdefined(weapon.var_76ce72e8) && weapon.var_76ce72e8 || weapon == getweapon(#"sig_buckler_turret") || weapon == getweapon(#"sig_buckler_dw") || weapon == getweapon(#"dog_ai_defaultmelee")) {
            if (attacker function_15e5c1da(#"hash_513bb5302a850f1c") < level.var_94b2e2da) {
                attacker function_9401373f(#"hash_513bb5302a850f1c", 1);
            }
        }
        var_947d01ee = util::getweaponclass(weapon);
        if (!isdefined(var_947d01ee)) {
            return idamage;
        }
        switch (var_947d01ee) {
        case #"weapon_knife":
        case #"weapon_pistol":
        case #"weapon_launcher":
        case #"weapon_cqb":
            if (attacker function_15e5c1da(#"hash_512584b15284d144") < level.var_924497ca) {
                attacker function_9401373f(#"hash_512584b15284d144", 1);
            }
            break;
        case #"weapon_assault":
            if (attacker function_15e5c1da(#"hash_683d7dfc8782d6b9") < level.var_b7ad6f5b) {
                attacker function_9401373f(#"hash_683d7dfc8782d6b9", 1);
            }
            break;
        case #"weapon_smg":
            if (attacker function_15e5c1da(#"hash_68046b0858420412") < level.var_c30109f4) {
                attacker function_9401373f(#"hash_68046b0858420412", 1);
            }
            break;
        case #"weapon_tactical":
            if (attacker function_15e5c1da(#"hash_4d4a62396c1ec8") < level.var_26d708d7) {
                attacker function_9401373f(#"hash_4d4a62396c1ec8", 1);
            }
            break;
        case #"weapon_lmg":
            if (attacker function_15e5c1da(#"hash_3caeae083fb50ceb") < level.var_4ac5338a) {
                attacker function_9401373f(#"hash_3caeae083fb50ceb", 1);
            }
            break;
        case #"weapon_sniper":
            if (attacker function_15e5c1da("#weapon_class_kills_sniper") < level.var_92dc2d7c) {
                attacker function_9401373f(#"hash_1aee13f64efb2ef2", 1);
            }
            break;
        }
        if (smeansofdeath === "MOD_HEAD_SHOT") {
            if (attacker function_15e5c1da(#"headshots") < level.var_247f79eb) {
                attacker function_9401373f(#"headshots", 1);
            }
        } else if (smeansofdeath === "MOD_MELEE" || smeansofdeath === "MOD_MELEE_WEAPON_BUTT" || smeansofdeath === "MOD_MELEE_ASSASSINATE") {
            if (attacker function_15e5c1da(#"melee_kills") < level.var_6f99c3bd) {
                attacker function_9401373f(#"melee_kills", 1);
            }
        }
        attacker function_ea859fe2();
        attacker thread function_78a17c00();
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x3d3d2bfa, Offset: 0x2c88
// Size: 0x19c
function function_8e22d234() {
    level notify(#"hash_27b4c904ffa4ce27");
    level endon(#"hash_27b4c904ffa4ce27");
    a_players = getplayers();
    var_51029ccb = [];
    foreach (player in a_players) {
        var_51029ccb[var_51029ccb.size] = player.score;
    }
    var_51029ccb = array::sort_by_value(var_51029ccb);
    player = getplayers()[0];
    if (player.score != var_51029ccb[0]) {
        return;
    }
    if (player function_15e5c1da(#"hash_1ebacadf6dc3dbdf") < level.var_9356f44c) {
        player function_9401373f(#"hash_1ebacadf6dc3dbdf", 1);
        player function_ea859fe2();
        player thread function_78a17c00();
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0xc88bf21b, Offset: 0x2e30
// Size: 0x1fc
function function_b4ebcd8a() {
    wait(0.5);
    var_10e6d37f = 0;
    var_3e22bae5 = [];
    mode = currentsessionmode();
    var_40682b3d = getplayerroletemplatecount(mode);
    for (i = 0; i < var_40682b3d; i++) {
        fields = getcharacterfields(i, mode);
        if (isdefined(fields) && isdefined(fields.var_49a55967) && fields.var_49a55967) {
            var_3e22bae5[var_3e22bae5.size] = i;
        }
    }
    foreach (index in var_3e22bae5) {
        str_state = self function_c2c1d36b(index);
        if (str_state == #"tutorial_completed" || str_state == #"skirmish_completed" || str_state == #"hash_1946933613548897") {
            var_10e6d37f++;
        }
    }
    if (var_10e6d37f > 9) {
        self giveachievement("st_mp101");
        self function_ea859fe2();
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0xeb112fb5, Offset: 0x3038
// Size: 0xec
function function_51450191() {
    if (self function_15e5c1da(#"hash_7c2c8f10f053d93") < 10) {
        self function_9401373f(#"hash_7c2c8f10f053d93", 1);
        self function_ea859fe2();
        if (self function_15e5c1da(#"hash_7c2c8f10f053d93") == 10) {
            self function_399964c8(1);
            self giveachievement("st_stargazer");
            wait(1);
            self giveachievement("st_skirmisher");
        }
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x5473e49, Offset: 0x3130
// Size: 0x64
function function_46f9c28e() {
    if (self function_15e5c1da(#"hash_2a492630689ff21e") < 10) {
        self function_9401373f(#"hash_2a492630689ff21e", 1);
        self function_ea859fe2();
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x168f8166, Offset: 0x31a0
// Size: 0x9c
function function_9b717ff4() {
    /#
        println("<unknown string>");
    #/
    if (self function_dd91e3dd() >= 30) {
        /#
            println("<unknown string>");
        #/
        self giveachievement("st_centennial");
        self function_ea859fe2();
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x315ed677, Offset: 0x3248
// Size: 0x94
function function_ca8c7182() {
    self function_9b717ff4();
    if (self function_15e5c1da(#"hash_4893fe83ee2ad00d") < 10) {
        self function_9401373f(#"hash_4893fe83ee2ad00d", 1);
        self function_ea859fe2();
        self thread function_78a17c00();
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x2cb37e6f, Offset: 0x32e8
// Size: 0x2d4
function function_78a17c00() {
    b_complete = 1;
    if (self function_dd91e3dd() < 30) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_65d388fae333b6ea") < level.var_7e008e0c) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"melee_kills") < level.var_6f99c3bd) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_512584b15284d144") < level.var_924497ca) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"headshots") < level.var_247f79eb) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_4abb8db802b122b5") < level.var_24370902) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_513bb5302a850f1c") < level.var_94b2e2da) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_47f09f514721a1c2") < level.var_f0b5757d) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_1ebacadf6dc3dbdf") < level.var_9356f44c) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_683d7dfc8782d6b9") < level.var_b7ad6f5b) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_3caeae083fb50ceb") < level.var_4ac5338a) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_68046b0858420412") < level.var_c30109f4) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_1aee13f64efb2ef2") < level.var_92dc2d7c) {
        b_complete = 0;
    }
    if (self function_15e5c1da(#"hash_4d4a62396c1ec8") < level.var_26d708d7) {
        b_complete = 0;
    }
    if (b_complete) {
        self giveachievement("st_sleuth");
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0xa58ef590, Offset: 0x35c8
// Size: 0x3a
function function_2162b140() {
    self.overrideplayerdamage = &on_player_damage;
    if (!isbot(self)) {
        self.var_7e008e0c = 0;
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 11, eflags: 0x1 linked
// Checksum 0x6bc14d09, Offset: 0x3610
// Size: 0xae
function on_player_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, modelindex, psoffsettime) {
    if (!isbot(self)) {
        n_damage = idamage * level.var_352d65e9;
        return int(n_damage);
    } else {
        return idamage;
    }
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 2, eflags: 0x1 linked
// Checksum 0xbf2d60e9, Offset: 0x36c8
// Size: 0x82
function function_5f516f9d(var_129f6487, var_16538d01 = 0) {
    if (isdefined(var_16538d01) && var_16538d01) {
        var_129f6487 = #"hash_287942b71dbfe24f";
    }
    target = tablelookup(#"hash_4e78cba3061f8de6", 2, var_129f6487, 1);
    return target;
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 1, eflags: 0x1 linked
// Checksum 0x9efdd46f, Offset: 0x3758
// Size: 0xfc
function function_9a022fbc(str_state) {
    player = getplayers()[0];
    lui_menu = lui::get_luimenu("FullScreenBlack");
    if (str_state == "open") {
        if (isdefined(lui_menu)) {
            [[ lui_menu ]]->open(player);
            [[ lui_menu ]]->set_startalpha(player, 1);
            [[ lui_menu ]]->set_endalpha(player, 1);
            [[ lui_menu ]]->set_fadeovertime(player, int(2000));
        }
    } else if (isdefined(lui_menu)) {
        [[ lui_menu ]]->close(player);
    }
}

