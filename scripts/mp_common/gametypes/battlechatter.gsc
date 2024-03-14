// Atian COD Tools GSC decompiler test
#using scripts\weapons\weapon_utils.gsc;
#using scripts\weapons\grapple.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace battlechatter;

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x2
// Checksum 0x9500f5e3, Offset: 0xbd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"battlechatter", &__init__, undefined, undefined);
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x6c1e5889, Offset: 0xc20
// Size: 0xd5e
function __init__() {
    /#
        level thread devgui_think();
    #/
    callback::on_joined_team(&on_joined_team);
    callback::on_spawned(&on_player_spawned);
    level.heroplaydialog = &play_dialog;
    level.var_9082a3b6 = &function_bf68a5ab;
    level.var_e2fff792 = &function_f57e565f;
    level.var_9f155bf4 = &pain_vox;
    level.playgadgetready = &play_gadget_ready;
    level.playgadgetactivate = &play_gadget_activate;
    level.var_228e8cd6 = &function_916b4c72;
    level.var_7b83b300 = &function_cad61ec;
    level.playgadgetsuccess = &play_gadget_success;
    level.var_ac6052e9 = &mpdialog_value;
    level.var_d2600afc = &function_f5c48bfa;
    level.var_b42019ef = &function_4fb91bc7;
    level.playpromotionreaction = &play_promotion_reaction;
    level.var_cb4eb1d1 = &function_fff18afc;
    level.playkillstreakthreat = &function_9a20c887;
    level.var_c08cd9fa = &function_1d4b0ec0;
    level.var_da2d586a = &function_78c16252;
    level.var_17d1b660 = &function_e3ebbf87;
    level.var_5568effe = &function_30146e82;
    level.var_ee30f81d = &function_e9f06034;
    level.var_ddfd70d = &function_95e44f78;
    if (!isdefined(level.var_cddcf1e3)) {
        level.var_cddcf1e3 = undefined;
    }
    if (!isdefined(level.var_abaf1ec9)) {
        level.var_abaf1ec9 = undefined;
    }
    level.bcsounds = [];
    level.bcsounds[#"incoming_alert"] = [];
    level.bcsounds[#"incoming_alert"][#"frag_grenade"] = "incomingFrag";
    level.bcsounds[#"incoming_alert"][#"incendiary_grenade"] = "incomingIncendiary";
    level.bcsounds[#"incoming_alert"][#"sticky_grenade"] = "incomingSemtex";
    level.bcsounds[#"incoming_alert"][#"eq_sticky_grenade"] = "incomingSemtex";
    level.bcsounds[#"incoming_alert"][#"launcher_standard"] = "threatRpg";
    level.bcsounds[#"incoming_delay"] = [];
    level.bcsounds[#"incoming_delay"][#"frag_grenade"] = "fragGrenadeDelay";
    level.bcsounds[#"incoming_delay"][#"incendiary_grenade"] = "incendiaryGrenadeDelay";
    level.bcsounds[#"incoming_alert"][#"sticky_grenade"] = "semtexDelay";
    level.bcsounds[#"incoming_alert"][#"eq_sticky_grenade"] = "semtexDelay";
    level.bcsounds[#"incoming_delay"][#"launcher_standard"] = "missileDelay";
    level.bcsounds[#"kill_dialog"] = [];
    level.bcsounds[#"kill_dialog"][#"battery"] = "killBattery";
    level.bcsounds[#"kill_dialog"][#"buffassault"] = "killBuffAssault";
    level.bcsounds[#"kill_dialog"][#"engineer"] = "killEngineer";
    level.bcsounds[#"kill_dialog"][#"firebreak"] = "killFirebreak";
    level.bcsounds[#"kill_dialog"][#"nomad"] = "killNomad";
    level.bcsounds[#"kill_dialog"][#"prophet"] = "killProphet";
    level.bcsounds[#"kill_dialog"][#"recon"] = "killRecon";
    level.bcsounds[#"kill_dialog"][#"ruin"] = "killRuin";
    level.bcsounds[#"kill_dialog"][#"seraph"] = "killSeraph";
    level.bcsounds[#"kill_dialog"][#"swatpolice"] = "killSwatPolice";
    level.bcsounds[#"kill_dialog"][#"zero"] = "killZero";
    level.bcsounds[#"kill_dialog"][#"outrider"] = "killOutrider";
    level.bcsounds[#"kill_dialog"][#"reaper"] = "killReaper";
    level.bcsounds[#"kill_dialog"][#"spectre"] = "killSpectre";
    if (level.teambased && !isdefined(game.boostplayerspicked)) {
        game.boostplayerspicked = [];
        foreach (team, _ in level.teams) {
            game.boostplayerspicked[team] = 0;
        }
    }
    level.allowbattlechatter[#"bc"] = getgametypesetting(#"allowbattlechatter");
    level thread pick_boost_number();
    keycounts = [];
    playerdialogbundles = struct::get_script_bundles("mpdialog_player");
    foreach (bundle in playerdialogbundles) {
        count_keys(keycounts, bundle, "killGeneric");
        count_keys(keycounts, bundle, "killSniper");
        count_keys(keycounts, bundle, "killBattery");
        count_keys(keycounts, bundle, "killBuffAssault");
        count_keys(keycounts, bundle, "killEngineer");
        count_keys(keycounts, bundle, "killFirebreak");
        count_keys(keycounts, bundle, "killNomad");
        count_keys(keycounts, bundle, "killProphet");
        count_keys(keycounts, bundle, "killRecon");
        count_keys(keycounts, bundle, "killRuin");
        count_keys(keycounts, bundle, "killSeraph");
        count_keys(keycounts, bundle, "killSwatPolice");
        count_keys(keycounts, bundle, "killZero");
        count_keys(keycounts, bundle, "killOutrider");
        count_keys(keycounts, bundle, "killReaper");
        count_keys(keycounts, bundle, "killSpectre");
        if (keycounts[bundle.name].size == 0) {
            keycounts[bundle.name] = undefined;
        }
    }
    level.var_f53efe5c = keycounts;
    if (sessionmodeiswarzonegame()) {
        level.var_f53efe5c = undefined;
    }
    mpdialog = struct::get_script_bundle("mpdialog", "mpdialog_default");
    if (!isdefined(mpdialog)) {
        mpdialog = spawnstruct();
    }
    level.allowspecialistdialog = (isdefined(mpdialog.enableherodialog) ? mpdialog.enableherodialog : 0) && isdefined(level.allowbattlechatter[#"bc"]) && level.allowbattlechatter[#"bc"];
    level.playstartconversation = (isdefined(mpdialog.enableconversation) ? mpdialog.enableconversation : 0) && isdefined(level.allowbattlechatter[#"bc"]) && level.allowbattlechatter[#"bc"];
    level.var_bd715920 = &function_e44c3a3c;
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x55816367, Offset: 0x1988
// Size: 0x114
function function_e9f06034(player, playbreath) {
    if (player hasperk(#"specialty_quieter")) {
        return;
    }
    playerbundle = function_58c93260(player);
    if (!isdefined(playerbundle)) {
        return;
    }
    if (playbreath && isdefined(playerbundle.exertemergegasp)) {
        self thread function_a48c33ff(playerbundle.exertemergegasp, 22, mpdialog_value("playerExertBuffer", 0));
        return;
    }
    if (!playbreath && isdefined(playerbundle.exertemergebreath)) {
        self thread function_a48c33ff(playerbundle.exertemergebreath, 22, mpdialog_value("playerExertBuffer", 0));
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x55f1310f, Offset: 0x1aa8
// Size: 0xcc
function function_30146e82(player) {
    if (player hasperk(#"specialty_quieter")) {
        return;
    }
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    dialogkey = playerbundle.var_b12a1e12;
    if (isdefined(dialogkey)) {
        self.var_6765d33e = 1;
        self thread function_a48c33ff(dialogkey, 18);
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x1efdda6, Offset: 0x1b80
// Size: 0x3c
function pick_boost_number() {
    wait(5);
    level clientfield::set("boost_number", randomint(4));
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xfaa37321, Offset: 0x1bc8
// Size: 0x25e
function on_joined_team(params) {
    self endon(#"disconnect");
    teammask = getteammask(self.team);
    for (teamindex = 0; teammask > 1; teamindex++) {
        teammask = teammask >> 1;
    }
    if (teamindex % 2) {
        self set_blops_dialog();
    } else {
        self set_cdp_dialog();
    }
    self globallogic_audio::flush_dialog();
    if (!(isdefined(level.inprematchperiod) && level.inprematchperiod) && !(isdefined(self.pers[#"playedgamemode"]) && self.pers[#"playedgamemode"]) && isdefined(level.leaderdialog)) {
        if (level.hardcoremode) {
            if (globallogic_utils::function_308e3379()) {
                self globallogic_audio::leader_dialog_on_player(level.leaderdialog.var_d04b3734, undefined, undefined, undefined, 1);
            } else {
                self globallogic_audio::leader_dialog_on_player(level.leaderdialog.starthcgamedialog, undefined, undefined, undefined, 1);
            }
        } else if (globallogic_utils::function_308e3379()) {
            self globallogic_audio::leader_dialog_on_player(level.leaderdialog.var_f6fda321, undefined, undefined, undefined, 1);
        } else {
            self globallogic_audio::leader_dialog_on_player(level.leaderdialog.startgamedialog, undefined, undefined, undefined, 1);
        }
        self.pers[#"playedgamemode"] = 1;
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xa97da865, Offset: 0x1e30
// Size: 0x68
function set_blops_dialog() {
    self.pers[#"mptaacom"] = "blops_taacom";
    self.pers[#"mpcommander"] = "blops_commander";
    if (isdefined(level.var_cddcf1e3)) {
        self [[ level.var_cddcf1e3 ]]();
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x1098d8bd, Offset: 0x1ea0
// Size: 0x68
function set_cdp_dialog() {
    self.pers[#"mptaacom"] = "cdp_taacom";
    self.pers[#"mpcommander"] = "cdp_commander";
    if (isdefined(level.var_abaf1ec9)) {
        self [[ level.var_abaf1ec9 ]]();
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x50b242f4, Offset: 0x1f10
// Size: 0x1a4
function on_player_spawned() {
    self.enemythreattime = 0;
    self.heartbeatsnd = 0;
    self.soundmod = "player";
    self.voxunderwatertime = 0;
    self.voxemergebreath = 0;
    self.voxdrowning = 0;
    self.pilotisspeaking = 0;
    self.playingdialog = 0;
    self.playinggadgetreadydialog = 0;
    self.var_6765d33e = 0;
    self.playedgadgetsuccess = 1;
    self callback::add_callback("weapon_melee", &function_59f9cdab);
    self callback::add_callback("weapon_melee_charge", &function_59f9cdab);
    if (level.splitscreen || !level.allowbattlechatter[#"bc"]) {
        return;
    }
    self thread grenade_tracking();
    self thread missile_tracking();
    self thread sticky_grenade_tracking();
    self thread function_44b5e397();
    self thread function_7139078d();
    if (level.teambased) {
        self thread enemy_threat();
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xd9bcfa84, Offset: 0x20c0
// Size: 0x86
function function_58c93260(player) {
    if (!isplayer(player)) {
        return undefined;
    }
    bundlename = player getmpdialogname();
    if (!isdefined(bundlename)) {
        return undefined;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return undefined;
    }
    return playerbundle;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x6aab3dfa, Offset: 0x2150
// Size: 0x398
function function_af2bf286(player) {
    self notify("40dcec56538c25e1");
    self endon("40dcec56538c25e1");
    self endon(#"death", #"disconnect", #"weapon_change");
    level endon(#"game_ended");
    var_8e76086 = mpdialog_value("warmachineThreatMinDistance", 100);
    var_8e76086 = var_8e76086 * var_8e76086;
    while (true) {
        waitresult = undefined;
        waitresult = player waittill(#"weapon_fired");
        if (!isdefined(player)) {
            return;
        }
        playerdirection = anglestoforward(player.angles);
        var_29b9ab2b = player geteye();
        enemies = self getenemiesinradius(self.origin, mpdialog_value("warmachineThreatMaxDistance", 500));
        if (isarray(enemies) && enemies.size > 0) {
            foreach (enemy in enemies) {
                if (!isplayer(enemy) || enemy hasperk(#"specialty_quieter")) {
                    continue;
                }
                directiontoenemy = vectornormalize(enemy.origin - self.origin);
                dot = vectordot(directiontoenemy, playerdirection);
                if (dot < mpdialog_value("warmachineThreatDotMin", 0.5)) {
                    continue;
                }
                if (distancesquared(enemy.origin, player.origin) < var_8e76086) {
                    continue;
                }
                enemyeye = enemy geteye();
                if (!sighttracepassed(enemyeye, var_29b9ab2b, 1, enemy)) {
                    continue;
                }
                var_114baca3 = function_58c93260(enemy);
                if (!isdefined(var_114baca3)) {
                    continue;
                }
                dialogkey = var_114baca3.var_6582a778;
                if (!isdefined(dialogkey)) {
                    continue;
                }
                enemy thread function_a48c33ff(dialogkey, 2, undefined, undefined);
                break;
            }
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xd4c054e9, Offset: 0x24f0
// Size: 0x366
function function_44b5e397() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    self notify("3a7ae30337ee24bf");
    self endon("3a7ae30337ee24bf");
    if (isdefined(self.currentweapon)) {
        nextweapon = self.currentweapon;
    }
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"weapon_change");
        if (waitresult.weapon == getweapon(#"hero_pineapplegun")) {
            self thread function_af2bf286(self);
        }
        if (isdefined(waitresult.weapon) && isweapon(waitresult.weapon)) {
            nextweapon = waitresult.weapon;
        } else {
            nextweapon = self.currentweapon;
        }
        if (isdefined(nextweapon) && (nextweapon.name == "sig_buckler_dw" || nextweapon.name == "sig_buckler_turret") && (self.currentweapon.name == "sig_buckler_dw" || self.currentweapon.name == "sig_buckler_turret")) {
            continue;
        }
        if (nextweapon.name == "none") {
            continue;
        }
        self.var_3528f7e9 = 0;
        self.var_87b1ba00 = 0;
        if (self hasperk(#"specialty_quieter")) {
            continue;
        }
        bundlename = self getmpdialogname();
        if (!isdefined(bundlename)) {
            continue;
        }
        playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
        if (!isdefined(playerbundle)) {
            continue;
        }
        switch (nextweapon.name) {
        case #"hero_pineapplegun":
            dialogkey = playerbundle.warmachineweaponuse;
            break;
        case #"shock_rifle":
            dialogkey = playerbundle.tempestweaponuse;
            break;
        case #"sig_lmg":
            if (waitresult.last_weapon.name != #"sig_lmg_alt") {
                dialogkey = playerbundle.scytheweaponuse;
            }
            break;
        case #"sig_bow_quickshot":
            dialogkey = playerbundle.sparrowweaponuse;
            break;
        }
        if (isdefined(dialogkey)) {
            self thread function_a48c33ff(dialogkey, 2, undefined, undefined);
            dialogkey = undefined;
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x8145ad4f, Offset: 0x2860
// Size: 0x80
function dialog_chance(chancekey) {
    dialogchance = mpdialog_value(chancekey);
    if (!isdefined(dialogchance) || dialogchance <= 0) {
        return false;
    } else if (dialogchance >= 100) {
        return true;
    }
    return randomint(100) < dialogchance;
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x92389948, Offset: 0x28e8
// Size: 0x86
function mpdialog_value(mpdialogkey, defaultvalue) {
    if (!isdefined(mpdialogkey)) {
        return defaultvalue;
    }
    mpdialog = struct::get_script_bundle("mpdialog", "mpdialog_default");
    if (!isdefined(mpdialog)) {
        return defaultvalue;
    }
    structvalue = mpdialog.(mpdialogkey);
    if (!isdefined(structvalue)) {
        return defaultvalue;
    }
    return structvalue;
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0xb79fe15d, Offset: 0x2978
// Size: 0x336
function pain_vox(meansofdeath, weapon) {
    if (self.var_f16a71ae === 1) {
        return;
    }
    if (meansofdeath == "MOD_DEATH_CIRCLE" || meansofdeath == "MOD_BLED_OUT") {
        return;
    }
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    if (dialog_chance("smallPainChance")) {
        if (meansofdeath == "MOD_DROWN") {
            dialogkey = playerbundle.exertpaindrowning;
            self.voxdrowning = 1;
        } else if (meansofdeath == "MOD_DOT" || meansofdeath == "MOD_DOT_SELF") {
            if (!isdefined(self.var_dbffaa32)) {
                return;
            }
            if (isdefined(weapon)) {
                if (weapon.doesfiredamage) {
                    dialogkey = playerbundle.var_c3b67de0;
                }
            } else {
                dialogkey = playerbundle.exertpaindamagetick;
            }
        } else if (meansofdeath == "MOD_FALLING") {
            if (self hasperk(#"specialty_quieter")) {
                return;
            }
            dialogkey = playerbundle.exertpainfalling;
        } else if (meansofdeath == "MOD_BURNED") {
            dialogkey = playerbundle.var_c3b67de0;
        } else if (meansofdeath == "MOD_ELECTROCUTED") {
            dialogkey = playerbundle.var_68bb30c1;
        } else if (self isplayerunderwater()) {
            dialogkey = playerbundle.exertpainunderwater;
        } else if (meansofdeath == "MOD_MELEE") {
            dialogkey = playerbundle.var_b801796c;
        } else {
            if (isdefined(weapon)) {
                if (weapon.name == "shock_rifle") {
                    dialogkey = playerbundle.exertdeathelectrocuted;
                }
            }
            if (!isdefined(dialogkey)) {
                dialogkey = playerbundle.exertpain;
            }
        }
        exertbuffer = mpdialog_value("playerExertBuffer", 0);
        if (isdefined(self.var_1ba38d8b) && gettime() - self.var_1ba38d8b < int(exertbuffer * 1000)) {
            return;
        }
        self thread function_a48c33ff(dialogkey, 30, exertbuffer);
        self.var_6765d33e = 1;
        self.var_1ba38d8b = gettime();
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xc418b2bf, Offset: 0x2cb8
// Size: 0x9c
function function_78c16252() {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    dialogkey = playerbundle.exertfullyhealedbreath;
    if (isdefined(dialogkey)) {
        self thread function_a48c33ff(dialogkey, 16);
    }
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0xfb7136af, Offset: 0x2d60
// Size: 0x4c
function on_player_suicide_or_team_kill(player, type) {
    self endon(#"death");
    level endon(#"game_ended");
    waittillframeend();
    if (!level.teambased) {
        return;
    }
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x4d751de8, Offset: 0x2db8
// Size: 0x3a
function on_player_near_explodable(object, type) {
    self endon(#"death");
    level endon(#"game_ended");
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x727e57a4, Offset: 0x2e00
// Size: 0x2ec
function function_551980b7(dialogname) {
    if (!level.allowspecialistdialog || !isdefined(dialogname)) {
        return;
    }
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    switch (dialogname) {
    case #"battery":
        dialogkey = playerbundle.var_15dfa8ec;
        break;
    case #"buffassault":
        dialogkey = playerbundle.var_f33cef89;
        break;
    case #"engineer":
        dialogkey = playerbundle.var_41e91a42;
        break;
    case #"firebreak":
        dialogkey = playerbundle.var_f671ae19;
        break;
    case #"nomad":
        dialogkey = playerbundle.var_928f03c4;
        break;
    case #"outrider":
        dialogkey = playerbundle.var_decbe599;
        break;
    case #"prophet":
        dialogkey = playerbundle.var_443d5083;
        break;
    case #"reaper":
        dialogkey = playerbundle.var_a8809c1c;
        break;
    case #"recon":
        dialogkey = playerbundle.var_f3745d99;
        break;
    case #"ruin":
        dialogkey = playerbundle.var_1bfb0e39;
        break;
    case #"seraph":
        dialogkey = playerbundle.var_f072d2d2;
        break;
    case #"spectre":
        dialogkey = playerbundle.var_5fdf57ca;
        break;
    case #"swatpolice":
        dialogkey = playerbundle.var_aa447d74;
        break;
    case #"zero":
        dialogkey = playerbundle.var_53f12400;
        break;
    }
    if (isdefined(dialogkey)) {
        self thread function_a48c33ff(dialogkey, 2, undefined, undefined);
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x53d87648, Offset: 0x30f8
// Size: 0x3a6
function function_7139078d() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    self notify("6b96a91e5ff2b8a7");
    self endon("6b96a91e5ff2b8a7");
    while (true) {
        result = undefined;
        result = self waittill(#"bulletwhizby");
        if (self hasperk(#"specialty_quieter")) {
            continue;
        }
        if (!isdefined(result.suppressor) || (isdefined(result.suppressor.var_87b1ba00) ? result.suppressor.var_87b1ba00 : 0)) {
            continue;
        }
        if (isdefined(result.suppressor.currentweapon) && isplayer(result.suppressor)) {
            bundlename = self getmpdialogname();
            if (!isdefined(bundlename)) {
                continue;
            }
            playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
            if (!isdefined(playerbundle)) {
                continue;
            }
            switch (result.suppressor.currentweapon.name) {
            case #"hero_annihilator":
                dialogkey = playerbundle.var_93ef961;
                break;
            }
        } else if (isdefined(result.suppressor.turretweapon)) {
            if (result.suppressor.turretweapon.name == #"gun_ultimate_turret") {
                result.suppressor.var_87b1ba00 = 1;
                self play_killstreak_threat(result.suppressor.killstreaktype);
            }
        } else if (isdefined(result.suppressor.weapon)) {
            if (isdefined(level.var_24de8afe) && isdefined(result.suppressor.ai) && isdefined(result.suppressor.ai.swat_gunner) && result.suppressor.ai.swat_gunner && result.suppressor.weapon.name == #"hash_6c1be4b025206124") {
                result.suppressor [[ level.var_24de8afe ]](self, result.suppressor.script_owner);
                result.suppressor.var_87b1ba00 = 1;
            }
        }
        if (!isdefined(dialogkey)) {
            continue;
        }
        self thread function_a48c33ff(dialogkey, 2, undefined, undefined);
        dialogkey = undefined;
    }
}

// Namespace battlechatter/battlechatter
// Params 5, eflags: 0x0
// Checksum 0xfe634efd, Offset: 0x34a8
// Size: 0x6fa
function function_bd715920(var_28b40381, attacker, eventorigin, eventobject, timedelay) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self)) {
        return;
    }
    if ((isdefined(self.var_87b1ba00) ? self.var_87b1ba00 : 0) || (isdefined(eventobject.var_87b1ba00) ? eventobject.var_87b1ba00 : 0) || !isdefined(var_28b40381)) {
        return;
    }
    switch (var_28b40381.name) {
    case #"sig_buckler_dw":
    case #"gadget_vision_pulse":
    case #"sig_buckler_turret":
        var_4a247dec = 1;
        break;
    case #"eq_tripwire":
    case #"eq_shroud":
    case #"gadget_supplypod":
    case #"eq_emp_grenade":
    case #"dog_ai_defaultmelee":
    case #"eq_concertina_wire":
    case #"trophy_system":
        var_2f741f8e = 1;
        break;
    case #"eq_hawk":
    case #"frag_grenade":
    case #"eq_swat_grenade":
    case #"hash_3f62a872201cd1ce":
    case #"hash_5825488ac68418af":
    case #"eq_cluster_semtex_grenade":
    case #"eq_slow_grenade":
    case #"eq_molotov":
    case #"concussion_grenade":
        var_4a247dec = 1;
        var_2f741f8e = 1;
        break;
    case #"hero_flamethrower":
    case #"gadget_radiation_field":
        var_4e424b8b = 1;
        break;
    case #"ability_smart_cover":
    case #"sig_blade":
    case #"eq_gravityslam":
        var_2f741f8e = 1;
        var_4e424b8b = 0;
        var_494ab587 = 1;
        break;
    default:
        return;
    }
    if (isdefined(var_4a247dec) ? var_4a247dec : 0) {
        if (isdefined(attacker) && isplayer(attacker) && !attacker hasperk(#"specialty_quieter")) {
            if (isdefined(var_2f741f8e) ? var_2f741f8e : 0) {
                eventobject.var_87b1ba00 = 1;
            } else {
                self.var_87b1ba00 = 1;
            }
            attacker function_95e44f78(var_28b40381, timedelay);
            return;
        }
        return;
    }
    if (isdefined(eventorigin)) {
        players = self getenemies();
        allyradius = mpdialog_value("enemyContactAllyRadius", 0);
        enemydistance = mpdialog_value("enemyContactDistance", 0);
        foreach (player in players) {
            if (!isplayer(player) || player hasperk(#"specialty_quieter")) {
                continue;
            }
            if (isdefined(attacker) && isplayer(attacker) && player == attacker) {
                continue;
            }
            if (isdefined(var_4e424b8b) ? var_4e424b8b : 0) {
                if (distancesquared(eventorigin, player.origin) < allyradius * allyradius) {
                    if (isdefined(var_494ab587) ? var_494ab587 : 0) {
                        relativepos = vectornormalize(player.origin - eventorigin);
                        dir = anglestoforward(self getplayerangles());
                        dotproduct = vectordot(relativepos, dir);
                        if (dotproduct > 0) {
                            continue;
                        }
                    } else {
                        continue;
                    }
                }
            }
            if (distancesquared(eventorigin, player.origin) > enemydistance * enemydistance) {
                continue;
            }
            eyepoint = player geteye();
            relativepos = vectornormalize(eventorigin - eyepoint);
            dir = anglestoforward(player getplayerangles());
            dotproduct = vectordot(relativepos, dir);
            if (dotproduct > 0) {
                if (sighttracepassed(eventorigin, eyepoint, 1, player, eventobject)) {
                    if (isdefined(var_2f741f8e) ? var_2f741f8e : 0) {
                        eventobject.var_87b1ba00 = 1;
                    } else {
                        self.var_87b1ba00 = 1;
                    }
                    player function_95e44f78(var_28b40381, timedelay);
                    return;
                }
            }
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x4
// Checksum 0x5a203e53, Offset: 0x3bb0
// Size: 0x4a4
function private function_95e44f78(weapon, timedelay) {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    switch (weapon.name) {
    case #"sig_buckler_dw":
    case #"sig_buckler_turret":
        dialogkey = playerbundle.var_fa5db24c;
        break;
    case #"eq_concertina_wire":
        dialogkey = playerbundle.var_b51a051a;
        break;
    case #"eq_slow_grenade":
    case #"concussion_grenade":
        dialogkey = playerbundle.var_b5677849;
        break;
    case #"gadget_health_boost":
    case #"gadget_cleanse":
        dialogkey = playerbundle.var_d04c6a79;
        break;
    case #"dog_ai_defaultmelee":
        dialogkey = playerbundle.var_35e44265;
        break;
    case #"eq_swat_grenade":
    case #"hash_3f62a872201cd1ce":
    case #"hash_5825488ac68418af":
        dialogkey = playerbundle.var_29a98af1;
        break;
    case #"frag_grenade":
        dialogkey = playerbundle.var_1d37ae8b;
        break;
    case #"eq_gravityslam":
        dialogkey = playerbundle.var_1d06de0e;
        break;
    case #"hero_flamethrower":
        dialogkey = playerbundle.var_3f4a1443;
        break;
    case #"gadget_radiation_field":
        dialogkey = playerbundle.var_e6d1c1e3;
        break;
    case #"ability_smart_cover":
        dialogkey = playerbundle.var_efb67b32;
        break;
    case #"gadget_supplypod":
        dialogkey = playerbundle.var_2339275b;
        break;
    case #"trophy_system":
        dialogkey = playerbundle.var_d3d0cdde;
        break;
    case #"gadget_vision_pulse":
        dialogkey = playerbundle.var_23824a56;
        break;
    case #"eq_cluster_semtex_grenade":
        dialogkey = playerbundle.var_606d0b06;
        break;
    case #"eq_tripwire":
        dialogkey = playerbundle.var_6f89cd5;
        break;
    case #"gadget_spawnbeacon":
        dialogkey = playerbundle.var_1b7e4074;
        break;
    case #"eq_molotov":
        dialogkey = playerbundle.var_c4b4c50e;
        break;
    case #"eq_emp_grenade":
        dialogkey = playerbundle.var_27b0d135;
        break;
    case #"gadget_icepick":
        dialogkey = playerbundle.var_e21e8b0a;
        break;
    case #"eq_hawk":
        dialogkey = playerbundle.var_f1416960;
        break;
    case #"sig_blade":
        dialogkey = playerbundle.var_4ef902be;
        break;
    case #"eq_smoke":
        dialogkey = playerbundle.var_cfc7adfb;
        break;
    case #"sig_lmg":
        dialogkey = playerbundle.var_b50819f2;
        break;
    case #"eq_shroud":
        dialogkey = playerbundle.var_c41dc169;
        break;
    default:
        return;
    }
    self thread function_5896274(timedelay, dialogkey, 2, undefined, undefined, "disconnect");
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xea7d96b1, Offset: 0x4060
// Size: 0x52e
function enemy_threat() {
    self endon(#"death");
    level endon(#"game_ended");
    while (true) {
        self waittill(#"weapon_ads");
        if (self hasperk(#"specialty_quieter")) {
            continue;
        }
        if (self.enemythreattime + int(mpdialog_value("enemyContactInterval", 0) * 1000) >= gettime()) {
            continue;
        }
        eyepoint = self geteye();
        dir = anglestoforward(self getplayerangles());
        dir = dir * mpdialog_value("enemyContactDistance", 0);
        endpoint = eyepoint + dir;
        traceresult = bullettrace(eyepoint, endpoint, 1, self);
        if (isdefined(traceresult[#"entity"]) && util::function_fbce7263(traceresult[#"entity"].team, self.team)) {
            if (traceresult[#"entity"].classname == "player") {
                if (!(traceresult[#"entity"].var_9ee835dc === 1)) {
                    playerweapon = undefined;
                    if (isdefined(traceresult[#"entity"].weapon)) {
                        playerweapon = traceresult[#"entity"].weapon;
                    } else if (isdefined(traceresult[#"entity"].currentweapon)) {
                        playerweapon = traceresult[#"entity"].currentweapon;
                    }
                    if (isdefined(traceresult[#"entity"].killstreaktype) && !isarray(traceresult[#"entity"].killstreaktype)) {
                        self play_killstreak_threat(traceresult[#"entity"].killstreaktype);
                        traceresult[#"entity"].var_9ee835dc = 1;
                        self.enemythreattime = gettime();
                        continue;
                    }
                    if (isdefined(playerweapon) && (isplayer(traceresult[#"entity"]) || isdefined(traceresult[#"entity"].owner))) {
                        var_24d3b6ca = isplayer(traceresult[#"entity"]) ? traceresult[#"entity"] : traceresult[#"entity"].owner;
                        var_24d3b6ca function_bd715920(playerweapon, self, traceresult[#"entity"].origin, traceresult[#"entity"]);
                        traceresult[#"entity"].var_9ee835dc = 1;
                        self.enemythreattime = gettime();
                        continue;
                    }
                    if (dialog_chance("enemyContactChance")) {
                        if (dialog_chance("enemyHeroContactChance")) {
                            self function_551980b7(traceresult[#"entity"] getmpdialogname());
                        } else {
                            self thread play_dialog("threatInfantry", 2);
                        }
                        level notify(#"level_enemy_spotted", self.team);
                        self.enemythreattime = gettime();
                    }
                }
            }
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x91d9224d, Offset: 0x4598
// Size: 0x2e6
function killed_by_sniper(sniper) {
    if (!isdefined(sniper) || !isdefined(self) || !level.teambased || !level.allowspecialistdialog) {
        return;
    }
    self endon(#"disconnect");
    sniper endon(#"disconnect");
    level endon(#"game_ended");
    waittillframeend();
    if (dialog_chance("sniperKillChance")) {
        closest_ally = self get_closest_player_ally(0);
        allyradius = mpdialog_value("sniperKillAllyRadius", 0);
        if (isdefined(closest_ally) && distancesquared(self.origin, closest_ally.origin) < allyradius * allyradius) {
            bundlename = closest_ally getmpdialogname();
            if (!isdefined(bundlename)) {
                return;
            }
            playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
            if (!isdefined(playerbundle)) {
                return;
            }
            closest_ally thread function_a48c33ff(playerbundle.threatsniper, 2);
            sniper.spottedtime = gettime();
            sniper.spottedby = [];
            players = self get_friendly_players();
            players = arraysort(players, self.origin);
            voiceradius = mpdialog_value("playerVoiceRadius", 0);
            voiceradiussq = voiceradius * voiceradius;
            foreach (player in players) {
                if (distancesquared(closest_ally.origin, player.origin) <= voiceradiussq) {
                    sniper.spottedby[sniper.spottedby.size] = player;
                }
            }
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 3, eflags: 0x0
// Checksum 0x678aed65, Offset: 0x4888
// Size: 0x1c2
function function_d804d2f0(speakingplayer, player, allyradiussq) {
    if (!isdefined(player) || !isdefined(player.origin) || !isdefined(speakingplayer) || !isdefined(speakingplayer.origin) || !isalive(player) || player.sessionstate != "playing" || player.playingdialog || player isplayerunderwater() || player isremotecontrolling() || player isinvehicle() || player isweaponviewonlylinked() || player == speakingplayer || player.team != speakingplayer.team || player.playerrole == speakingplayer.playerrole || player hasperk(#"specialty_quieter")) {
        return false;
    }
    distsq = distancesquared(speakingplayer.origin, player.origin);
    if (distsq > allyradiussq) {
        return false;
    }
    return true;
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x4f28c9c2, Offset: 0x4a58
// Size: 0xfc
function function_db89c38f(speakingplayer, allyradiussq) {
    allies = [];
    foreach (player in level.players) {
        if (!function_d804d2f0(speakingplayer, player, allyradiussq)) {
            continue;
        }
        allies[allies.size] = player;
    }
    allies = arraysort(allies, speakingplayer.origin);
    if (!isdefined(allies) || allies.size == 0) {
        return undefined;
    }
    return allies[0];
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0x61b61c, Offset: 0x4b60
// Size: 0x994
function function_e6457410(attacker, victim, weapon, inflictor) {
    if (!isdefined(attacker) || !isplayer(attacker) || attacker hasperk(#"specialty_quieter")) {
        return 0;
    }
    if (!isdefined(weapon) || !isplayer(victim)) {
        return 0;
    }
    var_17a094cf = undefined;
    var_cf38843b = undefined;
    mpdialog = struct::get_script_bundle("mpdialog", "mpdialog_default");
    if (!isdefined(mpdialog)) {
        mpdialog = spawnstruct();
    }
    relativepos = vectornormalize(victim.origin - attacker.origin);
    dir = anglestoforward(attacker getplayerangles());
    dotproduct = vectordot(dir, relativepos);
    switch (weapon.name) {
    case #"hero_annihilator":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_6bb5d97b) ? mpdialog.var_6bb5d97b : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"sig_buckler_dw":
    case #"sig_buckler_turret":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_a4237278) ? mpdialog.var_a4237278 : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"claymore":
        if (dotproduct > 0 && sighttracepassed(attacker geteye(), victim geteye(), 1, attacker, victim)) {
            var_17a094cf = 1;
        }
        break;
    case #"dog_ai_defaultmelee":
        if (!isdefined(inflictor)) {
            return;
        }
        inflictor.var_3528f7e9 = (isdefined(inflictor.var_3528f7e9) ? inflictor.var_3528f7e9 : 0) + 1;
        if (!isdefined(inflictor.var_9b453b02) && inflictor.var_3528f7e9 > (isdefined(mpdialog.var_fad241c2) ? mpdialog.var_fad241c2 : 0) && dotproduct > 0 && sighttracepassed(attacker geteye(), victim geteye(), 1, attacker, victim)) {
            var_17a094cf = 1;
            inflictor.var_9b453b02 = 1;
        }
        break;
    case #"hero_flamethrower":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_f221b000) ? mpdialog.var_f221b000 : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"eq_gravityslam":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_b7ee7b18) ? mpdialog.var_b7ee7b18 : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"gun_mini_turret":
        if (!isdefined(inflictor)) {
            return;
        }
        inflictor.var_3528f7e9 = (isdefined(inflictor.var_3528f7e9) ? inflictor.var_3528f7e9 : 0) + 1;
        if (!isdefined(inflictor.var_9b453b02) && inflictor.var_3528f7e9 > (isdefined(mpdialog.var_34807e8c) ? mpdialog.var_34807e8c : 0) && dotproduct > 0 && sighttracepassed(attacker geteye(), victim geteye(), 1, attacker, victim)) {
            var_17a094cf = 1;
            inflictor.var_9b453b02 = 1;
        }
        break;
    case #"sig_bow_quickshot":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_269d71a4) ? mpdialog.var_269d71a4 : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"sig_lmg":
    case #"sig_lmg_alt":
        attacker.var_eefb1fd3 = (isdefined(attacker.var_eefb1fd3) ? attacker.var_eefb1fd3 : 0) + 1;
        if (attacker.var_eefb1fd3 == (isdefined(mpdialog.var_2c044553) ? mpdialog.var_2c044553 : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"shock_rifle":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_9460505c) ? mpdialog.var_9460505c : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"eq_tripwire":
        if (dotproduct > 0 && sighttracepassed(attacker geteye(), victim geteye(), 1, attacker, victim)) {
            var_17a094cf = 1;
        }
        break;
    case #"hero_pineapplegun":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_902e1bba) ? mpdialog.var_902e1bba : 0)) {
            var_17a094cf = 1;
        }
        break;
    case #"sig_blade":
        attacker.var_3528f7e9 = (isdefined(attacker.var_3528f7e9) ? attacker.var_3528f7e9 : 0) + 1;
        if (attacker.var_3528f7e9 == (isdefined(mpdialog.var_66388426) ? mpdialog.var_66388426 : 0)) {
            var_17a094cf = 1;
        }
        break;
    default:
        break;
    }
    if (isdefined(var_17a094cf)) {
        attacker function_18aba49d(0, weapon, undefined);
        return 1;
    }
    return 0;
}

// Namespace battlechatter/battlechatter
// Params 5, eflags: 0x0
// Checksum 0xfbb5a158, Offset: 0x5500
// Size: 0x28c
function player_killed(attacker, killstreaktype, einflictor, weapon, mod) {
    if (!level.teambased || !level.allowspecialistdialog) {
        return;
    }
    if (self === attacker) {
        return;
    }
    waittillframeend();
    if (isdefined(attacker) && isplayer(attacker) && !attacker hasperk(#"specialty_quieter")) {
        if (weapon.name == #"dog_ai_defaultmelee" && isdefined(einflictor)) {
            attacker function_bd715920(weapon, self, einflictor.origin, einflictor);
        } else if (weapon.name == #"hero_flamethrower" || weapon.name == #"sig_blade") {
            attacker function_bd715920(weapon, self, attacker.origin, attacker);
        }
    }
    if (isdefined(killstreaktype)) {
        if (!isdefined(level.killstreaks[killstreaktype]) || !isdefined(level.killstreaks[killstreaktype].threatonkill) || !level.killstreaks[killstreaktype].threatonkill || !dialog_chance("killstreakKillChance")) {
            return;
        }
        ally = self get_closest_player_ally(0);
        allyradius = mpdialog_value("killstreakKillAllyRadius", 0);
        if (isdefined(ally) && distancesquared(self.origin, ally.origin) < allyradius * allyradius) {
            ally play_killstreak_threat(killstreaktype);
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0x4d33bad4, Offset: 0x5798
// Size: 0x2fe
function function_7c107ed4(attacker, weapon, victim, inflictor) {
    if (!dialog_chance("specialKillChance") || !isdefined(victim)) {
        return undefined;
    }
    dialogkey = undefined;
    if (isdefined(victim.currentweapon) && isdefined(victim.currentweapon.name)) {
        switch (victim.currentweapon.name) {
        case #"hero_annihilator":
            dialogkey = "annihilatorDestroyed";
            break;
        case #"sig_buckler_dw":
        case #"sig_buckler_turret":
            dialogkey = "battleShieldWeaponDestroyed";
            break;
        case #"sig_bow_quickshot":
            dialogkey = "sparrowWeaponDestroyed";
            break;
        case #"hero_pineapplegun":
            dialogkey = "warmachineWeaponDestroyed";
            break;
        case #"shock_rifle":
            dialogkey = "tempestWeaponDestroyed";
            break;
        case #"hero_flamethrower":
            dialogkey = "purifierWeaponDestroyed";
            break;
        case #"gadget_icepick":
            dialogkey = "icePickWeaponDestroyed";
            break;
        case #"sig_blade":
            dialogkey = "armBladeWeaponDestroyed";
            break;
        case #"sig_lmg":
        case #"sig_lmg_alt":
            dialogkey = "scytheWeaponDestroyed";
            break;
        }
    }
    if (!isdefined(dialogkey) && isdefined(victim.heroability) && isdefined(victim.heroability.name)) {
        heroabilitywasactiverecently = isdefined(victim.heroabilityactive) || isdefined(victim.heroabilitydectivatetime) && victim.heroabilitydectivatetime > gettime() - 3000;
        if (heroabilitywasactiverecently) {
            switch (victim.heroability.name) {
            case #"eq_gravityslam":
                dialogkey = "gravitySlamWeaponDestroyed";
                break;
            case #"eq_grapple":
                dialogkey = "grappleGunWeaponDestroyed";
                break;
            case #"gadget_radiation_field":
                dialogkey = "radiationFieldWeaponDestroyed";
                break;
            }
        }
    }
    return dialogkey;
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0xad7f8845, Offset: 0x5aa0
// Size: 0x23c
function function_a43a3519(waittime, gadgetweapon) {
    wait(waittime + 0.1);
    if (!isdefined(self) || !isdefined(self.var_f6201e80) || !isplayer(self.var_f6201e80) || self.var_f6201e80 hasperk(#"specialty_quieter")) {
        return;
    }
    while (self.var_f6201e80.playingdialog === 1) {
        wait(0.3);
        if (!isdefined(self) || !isdefined(self.var_f6201e80)) {
            return;
        }
    }
    allyradiussq = mpdialog_value("SuccessReactionRadius", 500) * mpdialog_value("SuccessReactionRadius", 500);
    if (isdefined(self.var_f6201e80) && function_d804d2f0(self, self.var_f6201e80, allyradiussq)) {
        var_8a6b001a = self.var_f6201e80;
    }
    if (!isdefined(var_8a6b001a)) {
        return;
    }
    bundlename = var_8a6b001a getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    switch (gadgetweapon.name) {
    case #"seeker_mine_arc":
        dialogkey = playerbundle.var_9b5a2501;
        break;
    default:
        return;
    }
    if (isdefined(dialogkey)) {
        var_8a6b001a function_a48c33ff(dialogkey, 2, undefined, undefined);
    }
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0x1d468f6, Offset: 0x5ce8
// Size: 0x3ec
function function_f5c48bfa(attacker, owner, gadgetweapon, attackerweapon) {
    if (!level.allowspecialistdialog || !isdefined(attacker) || !isplayer(attacker) || attacker hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(gadgetweapon) || isdefined(owner) && owner == attacker) {
        return;
    }
    if (isdefined(attackerweapon) && isdefined(killstreaks::get_from_weapon(attackerweapon))) {
        return;
    }
    bundlename = attacker getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    dialogkey = undefined;
    var_45a3f7df = 0;
    switch (gadgetweapon.name) {
    case #"eq_sensor":
        dialogkey = playerbundle.var_6f728fb2;
        break;
    case #"gadget_spawnbeacon":
        dialogkey = playerbundle.var_d2fd550a;
        break;
    case #"claymore":
        dialogkey = playerbundle.var_827669e9;
        break;
    case #"eq_concertina_wire":
        dialogkey = playerbundle.var_e4bd50dc;
        break;
    case #"gun_mini_turret":
        dialogkey = playerbundle.var_1b6223ae;
        break;
    case #"dog_ai_defaultmelee":
        dialogkey = playerbundle.dogweapondestroyed;
        break;
    case #"seeker_mine_arc":
        dialogkey = playerbundle.var_e79fdef1;
        var_45a3f7df = 1;
        break;
    case #"ability_smart_cover":
        dialogkey = playerbundle.var_1ab815cb;
        break;
    case #"gadget_supplypod":
        dialogkey = playerbundle.supplypodweapondestroyed;
        break;
    case #"eq_tripwire":
        dialogkey = playerbundle.var_63661ff;
        break;
    case #"trophy_system":
        dialogkey = playerbundle.var_faa66cb4;
        break;
    case #"eq_emp_grenade":
        dialogkey = playerbundle.var_bbc9856;
        break;
    case #"eq_hawk":
        dialogkey = playerbundle.hawkweapondestroyed;
        break;
    case #"eq_shroud":
        dialogkey = playerbundle.var_987d028;
        break;
    default:
        return;
    }
    attacker thread function_5896274(mpdialog_value("enemyKillDelay", 0), dialogkey, 2, undefined, undefined, "cancel_kill_dialog");
    if (var_45a3f7df) {
        attacker thread function_a43a3519(mpdialog_value("enemyKillDelay", 0), gadgetweapon);
    }
}

// Namespace battlechatter/battlechatter
// Params 5, eflags: 0x0
// Checksum 0x74a07e3d, Offset: 0x60e0
// Size: 0x4c4
function say_kill_battle_chatter(attacker, weapon, victim, inflictor, meansofdeath) {
    if (!level.allowspecialistdialog) {
        return;
    }
    if (!isdefined(attacker) || !isplayer(attacker) || !isalive(attacker) || attacker isremotecontrolling() || attacker isinvehicle() || attacker isweaponviewonlylinked() || attacker hasperk(#"specialty_quieter") || !isdefined(victim) || !isplayer(victim)) {
        return;
    }
    if ((isdefined(meansofdeath) && meansofdeath == "MOD_MELEE" && weapon.name != #"sig_blade" || meansofdeath == "MOD_MELEE_WEAPON_BUTT") && weapon != getweapon("dog_ai_defaultmelee")) {
        return;
    }
    if (isdefined(inflictor) && inflictor.classname != "worldspawn" && !isplayer(inflictor) && inflictor.birthtime < attacker.spawntime) {
        return;
    }
    if (isdefined(inflictor) && isdefined(inflictor.var_259f6c17) && inflictor.var_259f6c17) {
        var_857133db = 1;
    }
    var_25db02aa = victim function_e6457410(attacker, victim, weapon, inflictor);
    if (var_25db02aa || weapon.skipbattlechatterkill) {
        return;
    }
    killdialog = function_7c107ed4(attacker, weapon, victim, inflictor);
    if (!isdefined(killdialog) && dialog_chance("enemyKillChance")) {
        if (isdefined(victim.spottedtime) && victim.spottedtime + mpdialog_value("enemySniperKillTime", 0) >= gettime() && array::contains(victim.spottedby, attacker) && dialog_chance("enemySniperKillChance")) {
            killdialog = attacker get_random_key("killSniper");
        } else if (dialog_chance("enemyHeroKillChance")) {
            victimdialogname = victim getmpdialogname();
            if (isdefined(victimdialogname) && isdefined(level.bcsounds[#"kill_dialog"][victimdialogname])) {
                killdialog = attacker get_random_key(level.bcsounds[#"kill_dialog"][victimdialogname]);
            } else {
                killdialog = attacker get_random_key("killGeneric");
            }
        } else {
            killdialog = attacker get_random_key("killGeneric");
        }
    }
    victim.spottedtime = undefined;
    victim.spottedby = undefined;
    if (!isdefined(killdialog) || (isdefined(var_857133db) ? var_857133db : 0)) {
        return;
    }
    attacker thread wait_play_dialog(mpdialog_value("enemyKillDelay", 0), killdialog, 2, undefined, victim, "cancel_kill_dialog");
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xe1863ed2, Offset: 0x65b0
// Size: 0x3f8
function grenade_tracking() {
    self endon(#"death");
    level endon(#"game_ended");
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"grenade_fire");
        grenade = waitresult.projectile;
        weapon = waitresult.weapon;
        if (isdefined(weapon) && isdefined(weapon.name)) {
            switch (weapon.name) {
            case #"frag_grenade":
            case #"eq_swat_grenade":
            case #"hash_5825488ac68418af":
            case #"eq_cluster_semtex_grenade":
            case #"eq_slow_grenade":
            case #"eq_molotov":
            case #"concussion_grenade":
                waitresult = undefined;
                waitresult = grenade waittilltimeout(0.3, #"death");
                if (waitresult._notify == "death" || !isdefined(grenade)) {
                    continue;
                }
                enemies = self getenemiesinradius(grenade.origin, 250);
                if (isarray(enemies) && enemies.size > 0) {
                    foreach (enemy in enemies) {
                        if (!isplayer(enemy) || enemy hasperk(#"specialty_quieter")) {
                            continue;
                        }
                        self function_bd715920(weapon, enemy, grenade.origin, grenade);
                    }
                }
            default:
                continue;
            }
        }
        if (!isdefined(grenade.weapon) || !isdefined(grenade.weapon.rootweapon) || !dialog_chance("incomingProjectileChance")) {
            continue;
        }
        dialogkey = level.bcsounds[#"incoming_alert"][grenade.weapon.rootweapon.name];
        if (isdefined(dialogkey)) {
            waittime = mpdialog_value(level.bcsounds[#"incoming_delay"][grenade.weapon.rootweapon.name], float(function_60d95f53()) / 1000);
            level thread incoming_projectile_alert(self, grenade, dialogkey, waittime);
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x86de8314, Offset: 0x69b0
// Size: 0x1c8
function missile_tracking() {
    self endon(#"death");
    level endon(#"game_ended");
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"missile_fire");
        missile = waitresult.projectile;
        weapon = waitresult.weapon;
        if (!isdefined(missile.item) || !isdefined(missile.item.rootweapon) || !dialog_chance("incomingProjectileChance")) {
            continue;
        }
        dialogkey = level.bcsounds[#"incoming_alert"][missile.item.rootweapon.name];
        if (isdefined(dialogkey)) {
            waittime = mpdialog_value(level.bcsounds[#"incoming_delay"][missile.item.rootweapon.name], float(function_60d95f53()) / 1000);
            level thread incoming_projectile_alert(self, missile, dialogkey, waittime);
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0xdcb21221, Offset: 0x6b80
// Size: 0x192
function incoming_projectile_alert(thrower, projectile, dialogkey, waittime) {
    level endon(#"game_ended");
    if (waittime <= 0) {
        /#
            assert(waittime > 0, "enemyContactAllyRadius");
        #/
        return;
    }
    while (true) {
        wait(waittime);
        if (waittime > 0.2) {
            waittime = waittime / 2;
        }
        if (!isdefined(projectile)) {
            return;
        }
        if (!isdefined(thrower) || thrower.team == #"spectator") {
            return;
        }
        if (level.players.size) {
            closest_enemy = thrower get_closest_player_enemy(projectile.origin);
            incomingprojectileradius = mpdialog_value("incomingProjectileRadius", 0);
            if (isdefined(closest_enemy) && distancesquared(projectile.origin, closest_enemy.origin) < incomingprojectileradius * incomingprojectileradius) {
                closest_enemy thread play_dialog(dialogkey, 6);
                return;
            }
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x700b9c6e, Offset: 0x6d20
// Size: 0x1f0
function sticky_grenade_tracking() {
    self endon(#"death");
    level endon(#"game_ended");
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"grenade_stuck");
        grenade = waitresult.projectile;
        var_76d5e4ce = isalive(self) && isplayer(self) && !self hasperk(#"specialty_quieter");
        if (var_76d5e4ce && isdefined(grenade) && isdefined(grenade.weapon)) {
            if (grenade.weapon.rootweapon.name == "sticky_grenade" || grenade.weapon.rootweapon.name == "eq_sticky_grenade" || grenade.weapon.rootweapon.name == "eq_cluster_semtex_grenade") {
                bundlename = self getmpdialogname();
                if (!isdefined(bundlename)) {
                    continue;
                }
                playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
                if (!isdefined(playerbundle)) {
                    continue;
                }
                self thread function_a48c33ff(playerbundle.stucksticky, 6);
            }
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x1e78670, Offset: 0x6f18
// Size: 0x38c
function heavy_weapon_success_reaction() {
    self endon(#"death");
    level endon(#"game_ended");
    if (!level.teambased || !level.allowspecialistdialog) {
        return;
    }
    allies = [];
    allyradiussq = mpdialog_value("playerVoiceRadius", 0);
    allyradiussq = allyradiussq * allyradiussq;
    foreach (player in level.players) {
        if (!isdefined(player) || !isalive(player) || player.sessionstate != "playing" || player == self || player hasperk(#"specialty_quieter") || util::function_fbce7263(player.team, self.team)) {
            continue;
        }
        distsq = distancesquared(self.origin, player.origin);
        if (distsq > allyradiussq) {
            continue;
        }
        allies[allies.size] = player;
    }
    wait(mpdialog_value("enemyKillDelay", 0) + 0.1);
    while (self.playingdialog) {
        wait(0.5);
    }
    allies = arraysort(allies, self.origin);
    foreach (player in allies) {
        if (!isalive(player) || player.sessionstate != "playing" || player.playingdialog || player isplayerunderwater() || player isremotecontrolling() || player isinvehicle() || player isweaponviewonlylinked()) {
            continue;
        }
        distsq = distancesquared(self.origin, player.origin);
        if (distsq > allyradiussq) {
            break;
        }
        player play_dialog("heroWeaponSuccessReaction", 2);
        break;
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x319334eb, Offset: 0x72b0
// Size: 0x324
function play_promotion_reaction() {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter")) {
        return;
    }
    self endon(#"death");
    level endon(#"game_ended");
    if (!level.teambased) {
        return;
    }
    wait(9);
    players = self get_friendly_players();
    players = arraysort(players, self.origin);
    selfdialog = self getmpdialogname();
    voiceradius = mpdialog_value("playerVoiceRadius", 0);
    voiceradiussq = voiceradius * voiceradius;
    foreach (player in players) {
        if (player == self || player getmpdialogname() == selfdialog || !player can_play_dialog(1) || distancesquared(self.origin, player.origin) >= voiceradiussq || player hasperk(#"specialty_quieter")) {
            continue;
        }
        dialogalias = player get_player_dialog_alias("promotionReaction", undefined);
        if (!isdefined(dialogalias)) {
            continue;
        }
        ally = player;
        break;
    }
    if (isdefined(ally)) {
        if (ally haspart("J_Head")) {
            ally playsoundontag(dialogalias, "J_Head", undefined, self);
        } else {
            ally playsoundontag(dialogalias, "tag_origin", undefined, self);
        }
        ally thread wait_dialog_buffer(mpdialog_value("playerDialogBuffer", 0));
    }
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x2a8c776b, Offset: 0x75e0
// Size: 0x3a
function gametype_specific_battle_chatter(event, team) {
    self endon(#"death");
    level endon(#"game_ended");
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0xb2b82c92, Offset: 0x7628
// Size: 0x164
function play_death_vox(body, attacker, weapon, meansofdeath) {
    dialogkey = self get_death_vox(weapon, meansofdeath);
    if (function_8b1a219a()) {
        playerbundle = self function_deea4cc2(meansofdeath);
        if (isdefined(playerbundle) && isdefined(dialogkey)) {
            var_27e6026e = function_5d15920e(dialogkey, playerbundle);
            entitynumber = self getentitynumber();
            body function_661a6cc1(var_27e6026e, entitynumber);
        }
        return;
    }
    if (isdefined(dialogkey)) {
        if (body haspart("J_Head")) {
            body playsoundontag(dialogkey, "J_Head");
            return;
        }
        body playsoundontag(dialogkey, "tag_origin");
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x1bc4e4b7, Offset: 0x7798
// Size: 0xda
function function_deea4cc2(meansofdeath) {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    if (isdefined(meansofdeath) && meansofdeath == "MOD_META" && isdefined(self.pers) && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0)) {
        bundlename = self.var_89c4a60f;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    return playerbundle;
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0xbb82e0ea, Offset: 0x7880
// Size: 0x14e
function function_5d15920e(dialogkey, playerbundle) {
    if (dialogkey === playerbundle.exertdeathdrowned) {
        return "MOD_DROWN";
    }
    if (dialogkey === playerbundle.var_44d86dec) {
        return "MOD_EXPLOSIVE";
    }
    if (dialogkey === playerbundle.exertdeathburned) {
        return "MOD_BURNED";
    }
    if (dialogkey === playerbundle.exertdeathstabbed) {
        return "MOD_MELEE_WEAPON_BUTT";
    }
    if (dialogkey === playerbundle.var_207908de) {
        return "MOD_HEAD_SHOT";
    }
    if (dialogkey === playerbundle.var_1dfcabbd) {
        return "MOD_FALLING";
    }
    if (dialogkey === playerbundle.exertdeath) {
        return "MOD_UNKNOWN";
    }
    if (dialogkey === playerbundle.var_48305ed9) {
        return "MOD_DOT_SELF";
    }
    if (dialogkey === playerbundle.var_f8b4bcc1) {
        return "MOD_DOT";
    }
    if (dialogkey === playerbundle.exertdeathstabbed) {
        return "MOD_MELEE_ASSASSINATE";
    }
    if (dialogkey === playerbundle.exertdeathelectrocuted) {
        return "MOD_ELECTROCUTED";
    }
    return "MOD_UNKNOWN";
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x6614e6d3, Offset: 0x79d8
// Size: 0x3c6
function get_death_vox(weapon, meansofdeath) {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    if (isdefined(meansofdeath) && meansofdeath == "MOD_META" && isdefined(self.pers) && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0)) {
        bundlename = self.var_89c4a60f;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    if (self isplayerunderwater()) {
        return playerbundle.exertdeathdrowned;
    }
    if (self weapon_utils::isexplosivedamage(meansofdeath)) {
        return playerbundle.var_44d86dec;
    }
    if (isdefined(meansofdeath)) {
        switch (meansofdeath) {
        case #"mod_burned":
            return playerbundle.exertdeathburned;
        case #"mod_melee_weapon_butt":
            if (weapon.rootweapon.name == #"ar_stealth_t8" || weapon.rootweapon.name == #"pistol_standard_t8") {
                if (weaponhasattachment(weapon, "uber")) {
                    return playerbundle.exertdeathstabbed;
                }
            }
            return playerbundle.var_53f25688;
        case #"mod_head_shot":
            return playerbundle.var_207908de;
        case #"mod_trigger_hurt":
            if (self getvelocity()[2] < -100) {
                return playerbundle.var_1dfcabbd;
            } else {
                return playerbundle.exertdeath;
            }
        case #"mod_drown":
            return playerbundle.exertdeathdrowned;
        case #"mod_dot":
            if (weapon == getweapon(#"gadget_radiation_field")) {
                if (isdefined(self.suicide) && self.suicide) {
                    return playerbundle.var_48305ed9;
                } else {
                    return playerbundle.var_f8b4bcc1;
                }
            }
            if (weapon.doesfiredamage) {
                return playerbundle.exertdeathburned;
            }
            break;
        }
    }
    if (isdefined(weapon) && meansofdeath !== "MOD_MELEE_WEAPON_BUTT") {
        switch (weapon.rootweapon.name) {
        case #"knife_loadout":
        case #"hatchet":
            return playerbundle.exertdeathstabbed;
        case #"melee_slaybell_t8":
            return playerbundle.var_53f25688;
        case #"shock_rifle":
            return playerbundle.exertdeathelectrocuted;
        }
    }
    return playerbundle.exertdeath;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x367602d5, Offset: 0x7da8
// Size: 0x154
function function_9a20c887(var_27347352) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(var_27347352) || !isdefined(self.team) || !isdefined(var_27347352.team) || !isdefined(var_27347352.killstreaktype)) {
        return;
    }
    if (util::function_fbce7263(self.team, var_27347352.team) && !(isdefined(var_27347352.var_9ee835dc) && var_27347352.var_9ee835dc)) {
        closest_ally = self get_closest_player_ally(0);
        if (!isdefined(closest_ally)) {
            return;
        }
        var_27347352.var_9ee835dc = 1;
        self play_killstreak_threat(var_27347352.killstreaktype);
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xa051d68f, Offset: 0x7f08
// Size: 0xbc
function play_killstreak_threat(killstreaktype) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(killstreaktype) || !isdefined(level.killstreaks[killstreaktype])) {
        return;
    }
    self thread play_dialog(level.killstreaks[killstreaktype].threatdialogkey, 2);
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x64cdb76f, Offset: 0x7fd0
// Size: 0xe4
function function_dd6a6012(killstreaktype, weapon) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(killstreaktype) || !isdefined(level.killstreaks[killstreaktype]) || !isdefined(weapon) || isdefined(killstreaks::get_from_weapon(weapon))) {
        return;
    }
    self thread play_dialog(level.killstreaks[killstreaktype].var_2729ed45);
}

// Namespace battlechatter/battlechatter
// Params 6, eflags: 0x0
// Checksum 0x22095fca, Offset: 0x80c0
// Size: 0xac
function wait_play_dialog(waittime, dialogkey, dialogflags, dialogbuffer, enemy, endnotify) {
    self endon(#"death");
    level endon(#"game_ended");
    if (isdefined(waittime) && waittime > 0) {
        if (isdefined(endnotify)) {
            self endon(endnotify);
        }
        wait(waittime);
    }
    self thread play_dialog(dialogkey, dialogflags, dialogbuffer, enemy);
}

// Namespace battlechatter/battlechatter
// Params 3, eflags: 0x0
// Checksum 0x6f130c71, Offset: 0x8178
// Size: 0x1ec
function function_f57e565f(dialogkey, entity, waittime) {
    self endon(#"death");
    level endon(#"game_ended");
    if (!isdefined(self) || isdefined(self.playingdialog) && self.playingdialog || !isplayer(self) || !isdefined(entity) || self == entity && self isplayerunderwater() || !isplayer(entity)) {
        return;
    }
    dialogalias = entity get_player_dialog_alias(dialogkey, undefined);
    if (isdefined(waittime) && waittime > 0) {
        wait(waittime);
        if (!isdefined(self) || isdefined(self.playingdialog) && self.playingdialog || !isplayer(self) || !isdefined(entity) || self == entity && self isplayerunderwater() || !isplayer(entity)) {
            return;
        }
    }
    if (isdefined(dialogalias)) {
        self playsoundtoplayer(dialogalias, self);
        self thread wait_dialog_buffer(mpdialog_value("killstreakDialogBuffer", 0));
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xcbf26f14, Offset: 0x8370
// Size: 0x4c
function function_1339f3f3(tag = "J_Head") {
    return self hasdobj() && self haspart(tag);
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0xeab3ec8e, Offset: 0x83c8
// Size: 0x34c
function play_dialog(dialogkey, dialogflags, dialogbuffer, enemy) {
    self endon(#"death");
    level endon(#"game_ended");
    if (!isdefined(dialogkey) || !isplayer(self) || !isalive(self) || level.gameended) {
        return;
    }
    if (!isdefined(dialogflags)) {
        dialogflags = 0;
    }
    if (!level.allowspecialistdialog && (dialogflags & 16) == 0) {
        return;
    }
    if (self hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(dialogbuffer)) {
        dialogbuffer = mpdialog_value("playerDialogBuffer", 0);
    }
    dialogalias = self get_player_dialog_alias(dialogkey, undefined);
    if (!isdefined(dialogalias)) {
        return;
    }
    if (self isplayerunderwater() && !(dialogflags & 8)) {
        return;
    }
    if (isdefined(self.playingdialog) && self.playingdialog) {
        if (!(dialogflags & 4)) {
            return;
        }
        self stopsounds();
        waitframe(1);
    }
    if (dialogflags & 32) {
        self.playinggadgetreadydialog = 1;
    }
    if (dialogflags & 64) {
        if (!isdefined(self.stolendialogindex)) {
            self.stolendialogindex = 0;
        }
        dialogalias = dialogalias + "_0" + self.stolendialogindex;
        self.stolendialogindex++;
        self.stolendialogindex = self.stolendialogindex % 4;
    }
    if (dialogflags & 2) {
        if (self function_1339f3f3()) {
            self playsoundontag(dialogalias, "J_Head");
        }
    } else if (dialogflags & 1) {
        if (self function_1339f3f3()) {
            if (isdefined(enemy)) {
                self playsoundontag(dialogalias, "J_Head", self.team, enemy);
            } else {
                self playsoundontag(dialogalias, "J_Head", self.team);
            }
        }
    } else {
        self playlocalsound(dialogalias);
    }
    self notify(#"played_dialog");
    self thread wait_dialog_buffer(dialogbuffer);
}

// Namespace battlechatter/battlechatter
// Params 6, eflags: 0x0
// Checksum 0x10df2601, Offset: 0x8720
// Size: 0xac
function function_5896274(waittime, dialogalias, dialogflags, dialogbuffer, enemy, endnotify) {
    self endon(#"death");
    level endon(#"game_ended");
    if (isdefined(waittime) && waittime > 0) {
        if (isdefined(endnotify)) {
            self endon(endnotify);
        }
        wait(waittime);
    }
    self thread function_a48c33ff(dialogalias, dialogflags, dialogbuffer, enemy);
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0x7a430ab7, Offset: 0x87d8
// Size: 0x2ec
function function_a48c33ff(dialogalias, dialogflags, dialogbuffer, enemy) {
    self endon(#"death");
    var_c84adc7e = !sessionmodeiswarzonegame() || !isdefined(dialogflags) || dialogflags & 128;
    if (!var_c84adc7e) {
        level endon(#"game_ended");
    }
    if (!isdefined(dialogalias) || !isplayer(self) || !isalive(self) || level.gameended && !var_c84adc7e) {
        return;
    }
    if (!isdefined(dialogflags)) {
        dialogflags = 0;
    }
    if (!level.allowspecialistdialog && (dialogflags & 16) == 0) {
        return;
    }
    if (!isdefined(dialogbuffer)) {
        dialogbuffer = mpdialog_value("playerDialogBuffer", 0);
    }
    if (self isplayerunderwater() && !(dialogflags & 8)) {
        return;
    }
    if (isdefined(self.playingdialog) && self.playingdialog) {
        if (!(dialogflags & 4)) {
            return;
        }
        self stopsounds();
        waitframe(1);
    }
    if (dialogflags & 32) {
        self.playinggadgetreadydialog = 1;
    }
    if (dialogflags & 2) {
        if (self function_1339f3f3()) {
            self playsoundontag(dialogalias, "J_Head");
        }
    } else if (dialogflags & 1) {
        if (self function_1339f3f3()) {
            if (isdefined(enemy)) {
                self playsoundontag(dialogalias, "J_Head", self.team, enemy);
            } else {
                self playsoundontag(dialogalias, "J_Head", self.team);
            }
        }
    } else {
        self playlocalsound(dialogalias);
    }
    self notify(#"played_dialog");
    self thread wait_dialog_buffer(dialogbuffer);
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x51dfdcba, Offset: 0x8ad0
// Size: 0x9e
function wait_dialog_buffer(dialogbuffer) {
    self endon(#"death", #"played_dialog", #"stop_dialog");
    level endon(#"game_ended");
    self.playingdialog = 1;
    if (isdefined(dialogbuffer) && dialogbuffer > 0) {
        wait(dialogbuffer);
    }
    self.playingdialog = 0;
    self.var_6765d33e = 0;
    self.playinggadgetreadydialog = 0;
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xa1f2edb4, Offset: 0x8b78
// Size: 0x4e
function stop_dialog() {
    self notify(#"stop_dialog");
    self stopsounds();
    self.playingdialog = 0;
    self.var_6765d33e = 0;
    self.playinggadgetreadydialog = 0;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x439d7995, Offset: 0x8bd0
// Size: 0xc
function wait_playback_time(soundalias) {
    
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0xc9eb86c6, Offset: 0x8be8
// Size: 0x112
function get_player_dialog_alias(dialogkey, meansofdeath) {
    if (!isplayer(self)) {
        return undefined;
    }
    bundlename = self getmpdialogname();
    if (isdefined(meansofdeath) && meansofdeath == "MOD_META" && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0)) {
        bundlename = self.var_89c4a60f;
    }
    if (!isdefined(bundlename)) {
        return undefined;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return undefined;
    }
    return globallogic_audio::get_dialog_bundle_alias(playerbundle, dialogkey);
}

// Namespace battlechatter/battlechatter
// Params 3, eflags: 0x0
// Checksum 0x1118ca7e, Offset: 0x8d08
// Size: 0xf8
function count_keys(&keycounts, bundle, dialogkey) {
    i = 0;
    field = dialogkey + i;
    for (fieldvalue = bundle.(field); isdefined(fieldvalue); fieldvalue = bundle.(field)) {
        aliasarray[i] = fieldvalue;
        i++;
        field = dialogkey + i;
    }
    if (!isdefined(keycounts[bundle.name])) {
        keycounts[bundle.name] = [];
    }
    keycounts[bundle.name][dialogkey] = i == 0 ? undefined : i;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x30d8e844, Offset: 0x8e08
// Size: 0xbc
function get_random_key(dialogkey) {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return undefined;
    }
    if (!isdefined(level.var_f53efe5c[bundlename]) || !isdefined(level.var_f53efe5c[bundlename][dialogkey]) || level.var_f53efe5c[bundlename][dialogkey] == 0) {
        return dialogkey;
    }
    return dialogkey + randomint(level.var_f53efe5c[bundlename][dialogkey]);
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x7c8d5ac6, Offset: 0x8ed0
// Size: 0x92c
function play_gadget_ready(weapon, userflip = 0) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(weapon) || gettime() - (isdefined(level.starttime) ? level.starttime : 0) < int(mpdialog_value("readyAudioDelay", 0) * 1000)) {
        return;
    }
    dialogkey = undefined;
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    switch (weapon.name) {
    case #"hero_annihilator":
        dialogkey = playerbundle.annihilatorweaponready;
        break;
    case #"sig_buckler_dw":
    case #"hero_minigun":
        dialogkey = playerbundle.var_bde3e948;
        break;
    case #"eq_localheal":
        dialogkey = playerbundle.var_9a9ffda6;
        break;
    case #"gadget_health_boost":
    case #"gadget_cleanse":
        dialogkey = playerbundle.var_45c0f5db;
        break;
    case #"ability_dog":
        dialogkey = playerbundle.var_f484179b;
        break;
    case #"eq_gravityslam":
        dialogkey = playerbundle.var_ce2beea1;
        break;
    case #"shock_rifle":
        dialogkey = playerbundle.tempestweaponready;
        break;
    case #"sig_minigun":
        dialogkey = playerbundle.var_4630d039;
        break;
    case #"gadget_spawnbeacon":
        dialogkey = playerbundle.var_d294848f;
        break;
    case #"ability_smart_cover":
        dialogkey = playerbundle.var_47d3c3bd;
        break;
    case #"mute_smoke":
        dialogkey = playerbundle.var_7b1fe307;
        break;
    case #"hero_flamethrower":
        dialogkey = playerbundle.purifierweaponready;
        break;
    case #"gadget_radiation_field":
        dialogkey = playerbundle.var_a9a63fa;
        break;
    case #"sig_bow_quickshot":
        dialogkey = playerbundle.sparrowweaponready;
        break;
    case #"eq_hawk":
        dialogkey = playerbundle.var_e230637d;
        break;
    case #"gadget_supplypod":
        dialogkey = playerbundle.var_ade452b2;
        break;
    case #"gadget_vision_pulse":
        dialogkey = playerbundle.visionpulseabilityready;
        break;
    case #"hero_pineapplegun":
        dialogkey = playerbundle.warmachineweaponready;
        break;
    case #"eq_swat_grenade":
    case #"hash_3f62a872201cd1ce":
    case #"hash_5825488ac68418af":
        dialogkey = playerbundle.var_cb080e91;
        break;
    case #"eq_cluster_semtex_grenade":
        dialogkey = playerbundle.var_1497b2f4;
        break;
    case #"eq_concertina_wire":
        dialogkey = playerbundle.var_b55793d6;
        break;
    case #"eq_seeker_mine":
        dialogkey = playerbundle.var_486b28c0;
        break;
    case #"eq_sensor":
        dialogkey = playerbundle.var_e4a019a;
        break;
    case #"eq_tripwire":
        dialogkey = playerbundle.var_3a5a4e80;
        break;
    case #"gadget_icepick":
        dialogkey = playerbundle.var_a2661f2f;
        break;
    case #"eq_emp_grenade":
        dialogkey = playerbundle.var_8610c190;
        break;
    case #"sig_blade":
        dialogkey = playerbundle.var_cb504af2;
        break;
    case #"eq_smoke":
        dialogkey = playerbundle.var_7b1fe307;
        break;
    case #"sig_lmg":
        dialogkey = playerbundle.scytheweaponready;
        break;
    case #"eq_shroud":
        dialogkey = playerbundle.var_30130c75;
        break;
    default:
        return;
    }
    if (!(isdefined(self.isthief) && self.isthief) && !(isdefined(self.isroulette) && self.isroulette)) {
        self thread function_a48c33ff(dialogkey, 2);
        return;
    }
    waittime = 0;
    dialogflags = 32;
    if (userflip) {
        minwaittime = 0;
        if (self.playinggadgetreadydialog) {
            self stop_dialog();
            minwaittime = float(function_60d95f53()) / 1000;
        }
        if (isdefined(self.isthief) && self.isthief) {
            delaykey = "thiefFlipDelay";
        } else {
            delaykey = "rouletteFlipDelay";
        }
        waittime = mpdialog_value(delaykey, minwaittime);
        dialogflags = dialogflags + 64;
    } else {
        if (isdefined(self.isthief) && self.isthief) {
            generickey = playerbundle.thiefweaponready;
            repeatkey = playerbundle.thiefweaponrepeat;
            repeatthresholdkey = "thiefRepeatThreshold";
            chancekey = "thiefReadyChance";
            delaykey = "thiefRevealDelay";
        } else {
            generickey = playerbundle.rouletteabilityready;
            repeatkey = playerbundle.rouletteabilityrepeat;
            repeatthresholdkey = "rouletteRepeatThreshold";
            chancekey = "rouletteReadyChance";
            delaykey = "rouletteRevealDelay";
        }
        if (randomint(100) < mpdialog_value(chancekey, 0)) {
            dialogkey = generickey;
        } else {
            waittime = mpdialog_value(delaykey, 0);
            if (self.laststolengadget === weapon && self.laststolengadgettime + int(mpdialog_value(repeatthresholdkey, 0) * 1000) > gettime()) {
                dialogkey = repeatkey;
            } else {
                dialogflags = dialogflags + 64;
            }
        }
    }
    self.laststolengadget = weapon;
    self.laststolengadgettime = gettime();
    if (waittime) {
        self notify(#"cancel_kill_dialog");
    }
    self thread function_5896274(waittime, dialogkey, dialogflags, undefined, undefined, undefined);
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x6f2762e2, Offset: 0x9808
// Size: 0x17c
function function_1d4b0ec0(dogstate, dog) {
    if (!level.allowspecialistdialog) {
        return;
    }
    if (!isdefined(dogstate)) {
        return;
    }
    if (!isdefined(self.script_owner) || !isplayer(self.script_owner) || self.script_owner hasperk(#"specialty_quieter")) {
        return;
    }
    bundlename = self.script_owner getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    dialogkey = undefined;
    switch (dogstate) {
    case 0:
        dialogkey = playerbundle.var_499ffcee;
        break;
    case 1:
        dialogkey = playerbundle.var_38ab9818;
        break;
    default:
        return;
    }
    self.script_owner thread function_a48c33ff(dialogkey);
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x28d7d433, Offset: 0x9990
// Size: 0x14f4
function function_e3ebbf87(var_aa988d26, var_c1132df6) {
    if (!isdefined(var_aa988d26) || !isdefined(self) || !isplayer(self)) {
        return;
    }
    self notify("2f5480a370bfcd30");
    self endon("2f5480a370bfcd30");
    self endon(#"death", #"disconnect");
    if (!sessionmodeiswarzonegame()) {
        level endon(#"game_ended");
    }
    waittime = mpdialog_value("calloutTriggerDelay", 0);
    wait(waittime);
    if (!isdefined(self) || !isplayer(self) || self isplayerunderwater()) {
        return;
    }
    specialistname = self getmpdialogname();
    if (!isdefined(specialistname) || isdefined(self.playingdialog) && self.playingdialog) {
        return;
    }
    if (isdefined(var_c1132df6) && var_c1132df6) {
        switch (specialistname) {
        case #"battery":
            dialogalias = var_aa988d26.var_80407c8f;
            break;
        case #"buffassault":
            dialogalias = var_aa988d26.var_a5004222;
            break;
        case #"engineer":
            dialogalias = var_aa988d26.var_aa265686;
            break;
        case #"firebreak":
            dialogalias = var_aa988d26.var_3b7efe03;
            break;
        case #"nomad":
            dialogalias = var_aa988d26.var_cf76a9bd;
            break;
        case #"outrider":
            dialogalias = var_aa988d26.var_f09797b3;
            break;
        case #"prophet":
            dialogalias = var_aa988d26.var_f3279c55;
            break;
        case #"reaper":
            dialogalias = var_aa988d26.var_ca5f991e;
            break;
        case #"recon":
            dialogalias = var_aa988d26.var_211d2d38;
            break;
        case #"ruin":
            dialogalias = var_aa988d26.var_1ef4fd08;
            break;
        case #"seraph":
            dialogalias = var_aa988d26.var_e995b5b2;
            break;
        case #"spectre":
            dialogalias = var_aa988d26.var_b9953afb;
            break;
        case #"swatpolice":
            dialogalias = var_aa988d26.var_c4f44015;
            break;
        case #"blackjack_bo4":
            dialogalias = var_aa988d26.var_8f349bdf;
            break;
        case #"captain_price":
            dialogalias = var_aa988d26.var_4aa5fa49;
            break;
        case #"cosmic_silverback":
            dialogalias = var_aa988d26.var_60412044;
            break;
        case #"david_mason":
            dialogalias = var_aa988d26.var_4b5e1168;
            break;
        case #"hudson":
            dialogalias = var_aa988d26.var_48d23194;
            break;
        case #"hudson_hawaiian":
            dialogalias = var_aa988d26.var_6fb717e9;
            break;
        case #"mason":
            dialogalias = var_aa988d26.var_432508cc;
            break;
        case #"matt_shadows":
            dialogalias = var_aa988d26.var_321df77f;
            break;
        case #"menendez":
            dialogalias = var_aa988d26.var_53d583e7;
            break;
        case #"replacer":
            dialogalias = var_aa988d26.var_cab536f0;
            break;
        case #"reznov":
            dialogalias = var_aa988d26.var_1c943309;
            break;
        case #"sarah_hall":
            dialogalias = var_aa988d26.var_6b2e4d03;
            break;
        case #"sergei":
            dialogalias = var_aa988d26.var_c1466c1d;
            break;
        case #"trejo":
            dialogalias = var_aa988d26.var_c1466c1d;
            break;
        case #"weaver":
            dialogalias = var_aa988d26.var_d5e3a527;
            break;
        case #"woods":
            dialogalias = var_aa988d26.var_46584bcd;
            break;
        case #"woods_old":
            dialogalias = var_aa988d26.var_46584bcd;
            break;
        case #"yuri":
            dialogalias = var_aa988d26.var_c5c64fea;
            break;
        case #"bruno":
            dialogalias = var_aa988d26.var_b37a5347;
            break;
        case #"brutus":
            dialogalias = var_aa988d26.var_42e6fafc;
            break;
        case #"primis_dempsey":
        case #"dempsey":
            dialogalias = var_aa988d26.var_4045f08d;
            break;
        case #"diego":
            dialogalias = var_aa988d26.var_2b93306e;
            break;
        case #"marlton":
            dialogalias = var_aa988d26.var_a59c420;
            break;
        case #"misty":
            dialogalias = var_aa988d26.var_6bc7d2e1;
            break;
        case #"nikolai":
        case #"primis_nikolai":
            dialogalias = var_aa988d26.var_9ed1fc02;
            break;
        case #"ofc_dempsey":
            dialogalias = var_aa988d26.var_a4215642;
            break;
        case #"ofc_nikolai":
            dialogalias = var_aa988d26.var_9f201adb;
            break;
        case #"ofc_richtofen":
            dialogalias = var_aa988d26.var_ce6ec646;
            break;
        case #"ofc_takeo":
            dialogalias = var_aa988d26.var_94a73557;
            break;
        case #"richtofen":
        case #"primis_richtofen":
            dialogalias = var_aa988d26.var_72259d2c;
            break;
        case #"russman":
            dialogalias = var_aa988d26.var_5d2187b6;
            break;
        case #"scarlett":
            dialogalias = var_aa988d26.var_89123a37;
            break;
        case #"shadowman":
            dialogalias = var_aa988d26.var_d9461c0d;
            break;
        case #"shaw":
            dialogalias = var_aa988d26.var_85592cb6;
            break;
        case #"stuhlinger":
            dialogalias = var_aa988d26.var_35982a38;
            break;
        case #"takeo":
        case #"primis_takeo":
            dialogalias = var_aa988d26.var_2d671c2b;
            break;
        case #"tedd":
            dialogalias = var_aa988d26.var_d9286c13;
            break;
        case #"zombie_female":
            dialogalias = var_aa988d26.var_330f1168;
            break;
        case #"zombie_male":
            dialogalias = var_aa988d26.var_eb1d0a0f;
            break;
        case #"female1":
            dialogalias = var_aa988d26.var_e45c0917;
            break;
        case #"female2":
            dialogalias = var_aa988d26.var_e0ec221f;
            break;
        case #"female3":
            dialogalias = var_aa988d26.var_73a6dac1;
            break;
        case #"female4":
            dialogalias = var_aa988d26.var_f41f1940;
            break;
        case #"air_female":
            dialogalias = var_aa988d26.var_92fcd922;
            break;
        case #"seal_female":
            dialogalias = var_aa988d26.var_efb78ea3;
            break;
        case #"male1":
            dialogalias = var_aa988d26.var_a7c0131a;
            break;
        case #"male2":
            dialogalias = var_aa988d26.var_c97b2728;
            break;
        case #"male3":
            dialogalias = var_aa988d26.var_bd4b3225;
            break;
        case #"male4":
            dialogalias = var_aa988d26.var_63a86387;
            break;
        case #"hard_male":
            dialogalias = var_aa988d26.var_e8e7012b;
            break;
        case #"land_male":
            dialogalias = var_aa988d26.var_63d7db94;
            break;
        case #"sea_male":
            dialogalias = var_aa988d26.var_105e5d33;
            break;
        default:
            return;
        }
    } else {
        switch (specialistname) {
        case #"battery":
            dialogalias = var_aa988d26.var_4ecb4e64;
            break;
        case #"buffassault":
            dialogalias = var_aa988d26.var_903053f4;
            break;
        case #"engineer":
            dialogalias = var_aa988d26.var_f5e77f05;
            break;
        case #"firebreak":
            dialogalias = var_aa988d26.var_ea3c9565;
            break;
        case #"nomad":
            dialogalias = var_aa988d26.var_20c482a5;
            break;
        case #"outrider":
            dialogalias = var_aa988d26.var_87c8ec66;
            break;
        case #"prophet":
            dialogalias = var_aa988d26.var_b8de476c;
            break;
        case #"reaper":
            dialogalias = var_aa988d26.var_64a03a3e;
            break;
        case #"recon":
            dialogalias = var_aa988d26.var_88484588;
            break;
        case #"ruin":
            dialogalias = var_aa988d26.var_fa4018ce;
            break;
        case #"seraph":
            dialogalias = var_aa988d26.var_a221d9a2;
            break;
        case #"spectre":
            dialogalias = var_aa988d26.var_d7fde75f;
            break;
        case #"swatpolice":
            dialogalias = var_aa988d26.var_7ac02231;
            break;
        case #"zero":
            dialogalias = var_aa988d26.var_ebb4b55;
            break;
        case #"blackjack_bo4":
            dialogalias = var_aa988d26.var_f449ccb6;
            break;
        case #"captain_price":
            dialogalias = var_aa988d26.var_1411ad27;
            break;
        case #"cosmic_silverback":
            dialogalias = var_aa988d26.var_f0be54bd;
            break;
        case #"david_mason":
            dialogalias = var_aa988d26.var_1d9994d5;
            break;
        case #"hudson":
            dialogalias = var_aa988d26.var_236ed551;
            break;
        case #"hudson_hawaiian":
            dialogalias = var_aa988d26.var_609b5733;
            break;
        case #"mason":
            dialogalias = var_aa988d26.var_36156b4;
            break;
        case #"matt_shadows":
            dialogalias = var_aa988d26.var_e7c3ff0b;
            break;
        case #"menendez":
            dialogalias = var_aa988d26.var_af7dd877;
            break;
        case #"replacer":
            dialogalias = var_aa988d26.var_5e46d9cc;
            break;
        case #"reznov":
            dialogalias = var_aa988d26.var_d5950da8;
            break;
        case #"sarah_hall":
            dialogalias = var_aa988d26.var_9e49481e;
            break;
        case #"sergei":
            dialogalias = var_aa988d26.var_6f74d606;
            break;
        case #"trejo":
            dialogalias = var_aa988d26.var_8420517a;
            break;
        case #"weaver":
            dialogalias = var_aa988d26.var_efe1407c;
            break;
        case #"woods":
            dialogalias = var_aa988d26.var_86f07f8a;
            break;
        case #"woods_old":
            dialogalias = var_aa988d26.var_e5b468ae;
            break;
        case #"yuri":
            dialogalias = var_aa988d26.var_be14530f;
            break;
        case #"bruno":
            dialogalias = var_aa988d26.var_69d3e46;
            break;
        case #"brutus":
            dialogalias = var_aa988d26.var_c691fc24;
            break;
        case #"dempsey":
        case #"primis_dempsey":
            dialogalias = var_aa988d26.var_8b897e74;
            break;
        case #"diego":
            dialogalias = var_aa988d26.var_45341635;
            break;
        case #"marlton":
            dialogalias = var_aa988d26.var_88c12253;
            break;
        case #"misty":
            dialogalias = var_aa988d26.var_ff5cea3b;
            break;
        case #"nikolai":
        case #"primis_nikolai":
            dialogalias = var_aa988d26.var_27bc4433;
            break;
        case #"ofc_dempsey":
            dialogalias = var_aa988d26.var_95a03453;
            break;
        case #"ofc_nikolai":
            dialogalias = var_aa988d26.var_69033114;
            break;
        case #"ofc_richtofen":
            dialogalias = var_aa988d26.var_d56828f1;
            break;
        case #"ofc_takeo":
            dialogalias = var_aa988d26.var_33edc6fa;
            break;
        case #"primis_richtofen":
        case #"richtofen":
            dialogalias = var_aa988d26.var_af612a6d;
            break;
        case #"russman":
            dialogalias = var_aa988d26.var_53de84dc;
            break;
        case #"scarlett":
            dialogalias = var_aa988d26.var_38efdc20;
            break;
        case #"shadowman":
            dialogalias = var_aa988d26.var_71422e;
            break;
        case #"shaw":
            dialogalias = var_aa988d26.var_beab1094;
            break;
        case #"stuhlinger":
            dialogalias = var_aa988d26.var_c9e3892;
            break;
        case #"primis_takeo":
        case #"takeo":
            dialogalias = var_aa988d26.var_b3201047;
            break;
        case #"tedd":
            dialogalias = var_aa988d26.var_6e548d8e;
            break;
        case #"zombie_female":
            dialogalias = var_aa988d26.var_63dc7b96;
            break;
        case #"zombie_male":
            dialogalias = var_aa988d26.var_afc5e0c1;
            break;
        case #"female1":
            dialogalias = var_aa988d26.var_891c58d0;
            break;
        case #"female2":
            dialogalias = var_aa988d26.var_2f702d3e;
            break;
        case #"female3":
            dialogalias = var_aa988d26.var_1e68d30e;
            break;
        case #"female4":
            dialogalias = var_aa988d26.var_68ef0dd5;
            break;
        case #"air_female":
            dialogalias = var_aa988d26.var_19e39499;
            break;
        case #"seal_female":
            dialogalias = var_aa988d26.var_de7a214a;
            break;
        case #"male1":
            dialogalias = var_aa988d26.var_53c80d60;
            break;
        case #"male2":
            dialogalias = var_aa988d26.var_6db249ec;
            break;
        case #"male3":
            dialogalias = var_aa988d26.var_cf970750;
            break;
        case #"male4":
            dialogalias = var_aa988d26.var_ff548dc3;
            break;
        case #"hard_male":
            dialogalias = var_aa988d26.var_80c17c05;
            break;
        case #"land_male":
            dialogalias = var_aa988d26.var_5bdd23de;
            break;
        case #"sea_male":
            dialogalias = var_aa988d26.var_8702f696;
            break;
        default:
            return;
        }
    }
    if (isdefined(dialogalias)) {
        dialogbuffer = mpdialog_value("calloutDialogBuffer", 0);
        self thread function_a48c33ff(dialogalias, 146, dialogbuffer);
    }
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0x643ca0dc, Offset: 0xae90
// Size: 0x124
function function_fff18afc(dialogkey, var_4d5833c) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self)) {
        return;
    }
    if (!isdefined(dialogkey) || self isplayerunderwater()) {
        return;
    }
    dialogbuffer = mpdialog_value("killstreakDialogBuffer", 0);
    if (!self hasperk(#"specialty_quieter")) {
        self play_dialog(dialogkey, 6, dialogbuffer, undefined);
    }
    var_cf210c5b = self get_player_dialog_alias(var_4d5833c, undefined);
    if (isdefined(var_cf210c5b)) {
        self function_253c2ba4(var_cf210c5b, dialogbuffer);
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x1c1b41fd, Offset: 0xafc0
// Size: 0x254
function function_cad61ec(weapon) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self)) {
        return;
    }
    if (!isdefined(weapon) || !isalive(self) || level.gameended || self isplayerunderwater()) {
        return;
    }
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    switch (weapon.name) {
    case #"eq_concertina_wire":
        dialogkey = playerbundle.var_6d3b52e5;
        var_4d031df6 = playerbundle.var_45efe6f7;
        break;
    case #"ability_smart_cover":
        dialogkey = playerbundle.var_906d49a;
        var_4d031df6 = playerbundle.var_918699f4;
        break;
    case #"gadget_spawnbeacon":
        dialogkey = playerbundle.var_41c2519b;
        var_4d031df6 = playerbundle.var_9a961aab;
        break;
    case #"gadget_supplypod":
        dialogkey = playerbundle.var_7d3aa98a;
        var_4d031df6 = playerbundle.var_c1e8f95f;
        break;
    default:
        return;
    }
    if (!self hasperk(#"specialty_quieter")) {
        self thread function_a48c33ff(dialogkey, 2, undefined, undefined);
    }
    if (isdefined(var_4d031df6)) {
        self function_253c2ba4(var_4d031df6, undefined);
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x4c416a6, Offset: 0xb220
// Size: 0x2d4
function function_916b4c72(weapon) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(weapon) || !isalive(self) || level.gameended || (isdefined(self.var_8720dd77) ? self.var_8720dd77 : 0) > gettime() || self isplayerunderwater()) {
        return;
    }
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    switch (weapon.name) {
    case #"eq_concertina_wire":
        dialogkey = playerbundle.var_4ecee308;
        break;
    case #"dog_ai_defaultmelee":
        dialogkey = playerbundle.var_e489dc9d;
        break;
    case #"eq_localheal":
        dialogkey = playerbundle.var_73b6ded8;
        break;
    case #"ability_smart_cover":
        dialogkey = playerbundle.var_2ece98;
        break;
    case #"gadget_spawnbeacon":
        dialogkey = playerbundle.var_dbac4c7d;
        break;
    case #"gadget_supplypod":
        dialogkey = playerbundle.var_56487ba6;
        break;
    default:
        return;
    }
    if (isdefined(dialogkey)) {
        self.var_8720dd77 = gettime() + int(mpdialog_value("useFailDelay", 5) * 1000);
        self playsoundtoplayer(dialogkey, self);
        self thread wait_dialog_buffer(mpdialog_value("playerDialogBuffer", 0));
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x7e281008, Offset: 0xb500
// Size: 0xf2
function function_94b5718c(entity) {
    selfeye = self geteyeapprox();
    foreach (enemy in get_enemy_players()) {
        if (!isdefined(enemy)) {
            continue;
        }
        enemyeye = enemy geteyeapprox();
        if (sighttracepassed(selfeye, enemyeye, 0, enemy)) {
            return enemy;
        }
    }
    return undefined;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xf3a33169, Offset: 0xb600
// Size: 0x804
function play_gadget_activate(weapon) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self)) {
        return;
    }
    if (!isdefined(weapon) || self isplayerunderwater()) {
        return;
    }
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    dialogkey = undefined;
    dialogflags = 2;
    switch (weapon.name) {
    case #"hero_annihilator":
        dialogkey = playerbundle.annihilatorweaponuse;
        break;
    case #"sig_buckler_dw":
        dialogkey = playerbundle.var_f32e2;
        break;
    case #"gadget_cleanse":
    case #"gadget_health_boost":
        dialogkey = playerbundle.var_2292382;
        break;
    case #"hatchet":
        dialogkey = playerbundle.var_8ba3822;
        break;
    case #"eq_slow_grenade":
    case #"concussion_grenade":
        dialogkey = playerbundle.var_426ce83a;
        break;
    case #"hash_5825488ac68418af":
    case #"eq_swat_grenade":
    case #"hash_3f62a872201cd1ce":
        dialogkey = playerbundle.var_b3d4d56b;
        break;
    case #"frag_grenade":
        dialogkey = playerbundle.var_2f65caf3;
        break;
    case #"eq_grapple":
        dialogkey = playerbundle.grapplegunweaponuse;
        dialogbuffer = 0.05;
        break;
    case #"eq_gravityslam":
        if (grapple::function_d79e9bb5(self, undefined, undefined, undefined)) {
            dialogkey = playerbundle.var_71187505;
            dialogflags = dialogflags | 6 | 16;
            dialogbuffer = 0.05;
            self.var_6765d33e = 1;
        }
        break;
    case #"eq_localheal":
        if (self.var_b6971302 === 1) {
            dialogkey = playerbundle.var_f0bfec90;
            var_4d031df6 = playerbundle.var_6cf57d59;
            self.var_b6971302 = undefined;
        } else {
            return;
        }
        break;
    case #"mini_turret":
        dialogkey = playerbundle.var_80253e65;
        break;
    case #"eq_molotov":
        dialogkey = playerbundle.var_e324183;
        break;
    case #"mute_smoke":
        dialogkey = playerbundle.p8_chi_fuel_tank_large_01_catwalk_ladder_ring01;
        break;
    case #"hero_flamethrower":
        self function_bd715920(weapon, self, self.origin, self);
        dialogkey = playerbundle.purifierweaponuse;
        break;
    case #"gadget_radiation_field":
        dialogkey = playerbundle.var_44c8bf55;
        break;
    case #"eq_seeker_mine":
        dialogkey = playerbundle.var_931b8099;
        break;
    case #"eq_cluster_semtex_grenade":
        dialogkey = playerbundle.var_da293cfd;
        break;
    case #"eq_sensor":
        dialogkey = playerbundle.var_8a8c748;
        var_4d031df6 = playerbundle.var_15990d1b;
        break;
    case #"eq_tripwire":
        if ((isdefined(self.var_9e50f96) ? self.var_9e50f96 : 0) + float(mpdialog_value("tripwireUseCooldown", 0)) / 1000 < gettime()) {
            dialogkey = playerbundle.var_9ee8c066;
            self.var_9e50f96 = gettime();
        }
        break;
    case #"trophy_system":
        dialogkey = playerbundle.var_6505d47a;
        break;
    case #"gadget_vision_pulse":
        dialogkey = playerbundle.visionpulseabilityuse;
        var_4d031df6 = playerbundle.var_8c880e98;
        break;
    case #"gadget_spawnbeacon":
        var_3bf73cf3 = function_94b5718c(self);
        if (isdefined(var_3bf73cf3)) {
            var_3bf73cf3 function_95e44f78(weapon, 0);
        }
        break;
    case #"eq_emp_grenade":
        dialogkey = playerbundle.var_cfa272a3;
        var_4d031df6 = playerbundle.var_b004cb37;
        var_3bf73cf3 = function_94b5718c(self);
        if (isdefined(var_3bf73cf3)) {
            var_3bf73cf3 function_95e44f78(weapon, 0);
        }
        break;
    case #"gadget_icepick":
        var_3bf73cf3 = function_94b5718c(self);
        if (isdefined(var_3bf73cf3)) {
            var_3bf73cf3 function_95e44f78(weapon, 0);
        }
        break;
    case #"eq_hawk":
        dialogkey = playerbundle.var_ce864f4c;
        break;
    case #"sig_blade":
        dialogkey = playerbundle.var_4acffa3b;
        var_4d031df6 = playerbundle.var_3922bf3e;
        break;
    case #"sig_lmg":
        dialogkey = playerbundle.var_d30ab48d;
        break;
    case #"eq_shroud":
        dialogkey = playerbundle.var_6ca16623;
        break;
    case #"eq_smoke":
        dialogkey = playerbundle.p8_chi_fuel_tank_large_01_catwalk_ladder_ring01;
        var_4d031df6 = playerbundle.var_54bd09ab;
        var_3bf73cf3 = function_94b5718c(self);
        if (isdefined(var_3bf73cf3)) {
            var_3bf73cf3 function_95e44f78(weapon, 0);
        }
        break;
    default:
        return;
    }
    if (!self hasperk(#"specialty_quieter")) {
        self thread function_a48c33ff(dialogkey, dialogflags, dialogbuffer, undefined);
    }
    if (isdefined(var_4d031df6)) {
        self function_253c2ba4(var_4d031df6, dialogbuffer);
    }
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xde8e5f8b, Offset: 0xbe10
// Size: 0x84
function function_bf68a5ab(var_4d5833c) {
    if (!isdefined(self) || !isplayer(self) || !level.allowspecialistdialog) {
        return;
    }
    dialogalias = self get_player_dialog_alias(var_4d5833c, undefined);
    self function_253c2ba4(dialogalias, undefined);
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x4
// Checksum 0xcbc23040, Offset: 0xbea0
// Size: 0x298
function private function_253c2ba4(var_cf210c5b, dialogbuffer) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || !isdefined(var_cf210c5b)) {
        return;
    }
    if (!isdefined(dialogbuffer)) {
        dialogbuffer = mpdialog_value("playerDialogBuffer", 0);
    }
    teamarray = getplayers(self.team);
    if (self hasperk(#"specialty_quieter")) {
        arrayremovevalue(teamarray, self, 0);
    } else {
        localplayers = getplayers(self.team, self.origin, 1200);
        foreach (localplayer in localplayers) {
            arrayremovevalue(teamarray, localplayer, 0);
        }
    }
    foreach (player in teamarray) {
        if (!isdefined(player) || !isalive(player) || isdefined(player.playingdialog) && player.playingdialog && !(isdefined(player.var_6765d33e) && player.var_6765d33e)) {
            continue;
        }
        player.var_6765d33e = 0;
        player playsoundtoplayer(var_cf210c5b, player);
        player thread wait_dialog_buffer(dialogbuffer);
    }
}

// Namespace battlechatter/battlechatter
// Params 4, eflags: 0x0
// Checksum 0x82c0039e, Offset: 0xc140
// Size: 0x28c
function play_gadget_success(weapon, waitkey, victim, var_5d738b56) {
    if (!level.allowspecialistdialog || !isdefined(self) || !isplayer(self) || self hasperk(#"specialty_quieter")) {
        return;
    }
    if (!isdefined(weapon) || !level.teambased) {
        return;
    }
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    var_2c976a90 = 0;
    switch (weapon.name) {
    case #"eq_hawk":
    case #"gadget_supplypod":
    case #"gadget_vision_pulse":
    case #"eq_localheal":
    case #"eq_sensor":
    case #"molotov_fire":
    case #"eq_swat_grenade":
    case #"eq_grapple":
    case #"hash_3f62a872201cd1ce":
    case #"eq_smoke":
    case #"eq_concertina_wire":
    case #"gadget_health_boost":
    case #"hash_5825488ac68418af":
    case #"eq_molotov":
    case #"gadget_cleanse":
    case #"gadget_radiation_field":
    case #"gadget_icepick":
        var_2c976a90 = 1;
        break;
    default:
        return;
    }
    if (var_2c976a90 === 1) {
        self.playedgadgetsuccess = 1;
        self function_18aba49d(0, weapon, var_5d738b56);
    }
}

// Namespace battlechatter/battlechatter
// Params 3, eflags: 0x0
// Checksum 0x6d645e06, Offset: 0xc3d8
// Size: 0x5c6
function function_4fb91bc7(weapon, var_df17fa82, var_53c10ed8) {
    if (!isdefined(weapon) || !isdefined(var_df17fa82) || !isplayer(var_df17fa82) || !isdefined(self) || !isplayer(self)) {
        return;
    }
    switch (weapon.name) {
    case #"eq_emp_grenade":
        taacomdialog = "jammerWeaponHacked";
        break;
    case #"eq_tripwire":
        taacomdialog = "meshMineWeaponHacked";
        var_b3fe42a9 = 1;
        break;
    case #"eq_seeker_mine":
        taacomdialog = "seekerMineWeaponHacked";
        var_b3fe42a9 = 1;
        break;
    case #"eq_sensor":
        taacomdialog = "sensorDartHacked";
        var_b3fe42a9 = 1;
        break;
    case #"ability_smart_cover":
    case #"gadget_smart_cover":
        taacomdialog = "smartCoverHacked";
        var_b3fe42a9 = 1;
        break;
    case #"gadget_spawnbeacon":
        taacomdialog = "spawnBeaconHacked";
        break;
    case #"gadget_supplypod":
        taacomdialog = "supplyPodHacked";
        var_b3fe42a9 = 1;
        break;
    case #"trophy_system":
        taacomdialog = "trophyWeaponHacked";
        var_b3fe42a9 = 1;
        break;
    case #"ac130":
    case #"inventory_ac130":
        taacomdialog = "ac130Hacked";
        break;
    case #"ai_tank_marker":
    case #"tank_robot":
    case #"inventory_tank_robot":
        taacomdialog = "aiTankHacked";
        var_b3fe42a9 = 1;
        break;
    case #"helicopter_comlink":
    case #"inventory_helicopter_comlink":
    case #"cobra_20mm_comlink":
        taacomdialog = "attackChopperHacked";
        break;
    case #"counteruav":
        taacomdialog = "cuavHacked";
        var_b3fe42a9 = 1;
        break;
    case #"dart":
    case #"inventory_dart":
        taacomdialog = "dartHacked";
        break;
    case #"inventory_drone_squadron":
    case #"drone_squadron":
        taacomdialog = "droneSquadHacked";
        var_b3fe42a9 = 1;
        break;
    case #"recon_car":
    case #"inventory_recon_car":
        taacomdialog = "reconCarHacked";
        break;
    case #"inventory_remote_missile":
    case #"remote_missile":
        taacomdialog = "hellstormHacked";
        break;
    case #"inventory_planemortar":
    case #"planemortar":
        taacomdialog = "lightningStrikeHacked";
        break;
    case #"overwatch_helicopter":
    case #"inventory_overwatch_helicopter":
        taacomdialog = "overwatchHelicopterHacked";
        break;
    case #"straferun":
    case #"inventory_straferun":
        taacomdialog = "strafeRunHacked";
        break;
    case #"supplydrop":
        taacomdialog = "supplyDropHacked";
        var_b3fe42a9 = 1;
        break;
    case #"uav":
        taacomdialog = "uavHacked";
        var_b3fe42a9 = 1;
        break;
    case #"ultimate_turret":
    case #"inventory_ultimate_turret":
        taacomdialog = "sentryHacked";
        var_b3fe42a9 = 1;
        break;
    }
    if (!isdefined(taacomdialog)) {
        return;
    }
    if ((isdefined(self.var_d6422943) ? self.var_d6422943 : 0) > gettime()) {
        self thread killstreaks::play_taacom_dialog(taacomdialog);
        return;
    }
    if (var_b3fe42a9 === 1) {
        if (var_53c10ed8 === 1) {
            self thread killstreaks::play_taacom_dialog(taacomdialog, undefined, undefined, 5, var_df17fa82, weapon);
        } else {
            self thread killstreaks::play_taacom_dialog(taacomdialog, undefined, undefined, 3, var_df17fa82, weapon);
        }
    } else {
        self thread killstreaks::play_taacom_dialog(taacomdialog, undefined, undefined, 4, var_df17fa82);
    }
    var_fc9a842 = mpdialog_value("taacomHackedReplyCooldownSec", 0);
    self.var_d6422943 = gettime() + int(var_fc9a842 * 1000);
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x4a94a834, Offset: 0xc9a8
// Size: 0x4c
function play_throw_hatchet() {
    self.var_6765d33e = 1;
    self thread play_dialog("exertAxeThrow", 22, mpdialog_value("playerExertBuffer", 0));
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xf6cb22c1, Offset: 0xca00
// Size: 0xd4
function function_59f9cdab() {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    if (isdefined(self.currentweapon)) {
        if (self.currentweapon === getweapon(#"melee_actionfigure_t8")) {
            return;
        }
    }
    self thread function_a48c33ff(playerbundle.var_1ca33ad4, 22, mpdialog_value("playerExertBuffer", 0));
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x6db26a2c, Offset: 0xcae0
// Size: 0x192
function get_enemy_players() {
    players = [];
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            if (team == self.team) {
                continue;
            }
            foreach (player in level.aliveplayers[team]) {
                players[players.size] = player;
            }
        }
    } else {
        foreach (player in level.activeplayers) {
            if (player != self) {
                players[players.size] = player;
            }
        }
    }
    return players;
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x7a5b2ca3, Offset: 0xcc80
// Size: 0xd0
function get_friendly_players() {
    players = [];
    if (level.teambased && isdefined(self.team) && isdefined(level.aliveplayers)) {
        foreach (player in level.aliveplayers[self.team]) {
            players[players.size] = player;
        }
    } else {
        players[0] = self;
    }
    return players;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xa62e4235, Offset: 0xcd58
// Size: 0x100
function can_play_dialog(teamonly) {
    if (!isplayer(self) || !isalive(self) || self.playingdialog === 1 || self isplayerunderwater() || self isremotecontrolling() || self isinvehicle() || self isweaponviewonlylinked()) {
        return false;
    }
    if (isdefined(teamonly) && !teamonly && self hasperk(#"specialty_quieter")) {
        return false;
    }
    return true;
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0xa887944b, Offset: 0xce60
// Size: 0xe6
function get_closest_player_enemy(origin = self.origin, teamonly) {
    players = self get_enemy_players();
    players = arraysort(players, origin);
    foreach (player in players) {
        if (!player can_play_dialog(teamonly)) {
            continue;
        }
        return player;
    }
    return undefined;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xee30dc9b, Offset: 0xcf50
// Size: 0xf2
function get_closest_player_ally(teamonly) {
    if (!level.teambased) {
        return undefined;
    }
    players = self get_friendly_players();
    players = arraysort(players, self.origin);
    foreach (player in players) {
        if (player == self || !player can_play_dialog(teamonly)) {
            continue;
        }
        return player;
    }
    return undefined;
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x3148f3aa, Offset: 0xd050
// Size: 0x1b2
function check_boost_start_conversation() {
    if (!level.playstartconversation) {
        return;
    }
    if (!level.inprematchperiod || !level.teambased || game.boostplayerspicked[self.team]) {
        return;
    }
    players = self get_friendly_players();
    array::add(players, self, 0);
    players = array::randomize(players);
    playerindex = 1;
    foreach (player in players) {
        playerdialog = player getmpdialogname();
        for (i = playerindex; i < players.size; i++) {
            playeri = players[i];
            if (playerdialog != playeri getmpdialogname()) {
                pick_boost_players(player, playeri);
                return;
            }
        }
        playerindex++;
    }
}

// Namespace battlechatter/battlechatter
// Params 2, eflags: 0x0
// Checksum 0xcceb773b, Offset: 0xd210
// Size: 0x72
function pick_boost_players(player1, player2) {
    player1 clientfield::set("play_boost", 1);
    player2 clientfield::set("play_boost", 2);
    game.boostplayerspicked[player1.team] = 1;
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xdefd3ad0, Offset: 0xd290
// Size: 0x1e8
function game_end_vox(winner) {
    if (!level.allowspecialistdialog) {
        return;
    }
    foreach (player in level.players) {
        if (player issplitscreen()) {
            continue;
        }
        bundlename = player getmpdialogname();
        if (!isdefined(bundlename)) {
            return;
        }
        playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
        if (!isdefined(playerbundle)) {
            return;
        }
        if (match::get_flag("tie")) {
            dialogkey = playerbundle.boostdraw;
        } else if (isdefined(winner) && level.teambased && isdefined(level.teams[winner]) && player.pers[#"team"] == winner || !level.teambased && player == winner) {
            dialogkey = playerbundle.boostwin;
        } else {
            dialogkey = playerbundle.boostloss;
        }
        if (isdefined(dialogkey)) {
            player playlocalsound(dialogkey);
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x4073c1bd, Offset: 0xd480
// Size: 0xbc
function function_72b65730() {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return;
    }
    dialogkey = playerbundle.var_96b4150c;
    waittime = mpdialog_value("playerExertBuffer", 0);
    thread function_5896274(waittime, dialogkey, 2);
}

// Namespace battlechatter/battlechatter
// Params 5, eflags: 0x0
// Checksum 0x47fa3b06, Offset: 0xd548
// Size: 0x54
function function_e44c3a3c(weapon, attacker, eventorigin, eventobject, timedelay) {
    self function_bd715920(weapon, attacker, eventorigin, eventobject, timedelay);
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x289ab8ee, Offset: 0xd5a8
// Size: 0x408
function devgui_think() {
    /#
        setdvar(#"devgui_mpdialog", "thiefRevealDelay");
        setdvar(#"testalias_player", "rouletteRevealDelay");
        setdvar(#"testalias_taacom", "exertAxeThrow");
        setdvar(#"testalias_commander", "<unknown string>");
        while (true) {
            wait(1);
            player = util::gethostplayer();
            if (!isdefined(player)) {
                continue;
            }
            spacing = getdvarfloat(#"testdialog_spacing", 0.25);
            switch (getdvarstring(#"devgui_mpdialog", "thiefRevealDelay")) {
            case #"hash_7912e80189f9c6":
                player thread test_player_dialog(0);
                player thread test_taacom_dialog(spacing);
                player thread test_commander_dialog(2 * spacing);
                break;
            case #"hash_69c6be086f76a9d4":
                player thread test_player_dialog(0);
                player thread test_commander_dialog(spacing);
                break;
            case #"hash_3af5f0a904b3f8fa":
                player thread test_other_dialog(0);
                player thread test_commander_dialog(spacing);
                break;
            case #"hash_32945da5f7ac491":
                player thread test_taacom_dialog(0);
                player thread test_commander_dialog(spacing);
                break;
            case #"hash_597b27a5c8857d19":
                player thread test_player_dialog(0);
                player thread test_taacom_dialog(spacing);
                break;
            case #"hash_74f798193af006b3":
                player thread test_other_dialog(0);
                player thread test_taacom_dialog(spacing);
                break;
            case #"hash_5bd6a2c5d0ff3cb2":
                player thread test_other_dialog(0);
                player thread test_player_dialog(spacing);
                break;
            case #"hash_4a5a66c89be92eb":
                player thread play_conv_self_other();
                break;
            case #"hash_18683ef7652f40ed":
                player thread play_conv_other_self();
                break;
            case #"hash_2b559b1a5e81715f":
                player thread play_conv_other_other();
                break;
            }
            setdvar(#"devgui_mpdialog", "thiefRevealDelay");
        }
    #/
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x1660cc85, Offset: 0xd9b8
// Size: 0xe2
function test_other_dialog(delay) {
    /#
        players = arraysort(level.players, self.origin);
        foreach (player in players) {
            if (player != self && isalive(player)) {
                player thread test_player_dialog(delay);
                return;
            }
        }
    #/
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0xbea9fae9, Offset: 0xdaa8
// Size: 0x64
function test_player_dialog(delay) {
    /#
        if (!isdefined(delay)) {
            delay = 0;
        }
        wait(delay);
        self playsoundontag(getdvarstring(#"testalias_player", "thiefRevealDelay"), "<unknown string>");
    #/
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x46c688ea, Offset: 0xdb18
// Size: 0x5c
function test_taacom_dialog(delay) {
    /#
        if (!isdefined(delay)) {
            delay = 0;
        }
        wait(delay);
        self playlocalsound(getdvarstring(#"testalias_taacom", "thiefRevealDelay"));
    #/
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x44526a02, Offset: 0xdb80
// Size: 0x5c
function test_commander_dialog(delay) {
    /#
        if (!isdefined(delay)) {
            delay = 0;
        }
        wait(delay);
        self playlocalsound(getdvarstring(#"testalias_commander", "thiefRevealDelay"));
    #/
}

// Namespace battlechatter/battlechatter
// Params 1, eflags: 0x0
// Checksum 0x30f41745, Offset: 0xdbe8
// Size: 0x54
function play_test_dialog(dialogkey) {
    /#
        dialogalias = self get_player_dialog_alias(dialogkey, undefined);
        self playsoundontag(dialogalias, "<unknown string>");
    #/
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xe6a1b674, Offset: 0xdc48
// Size: 0x10c
function response_key() {
    /#
        switch (self getmpdialogname()) {
        case #"spectre":
            return "<unknown string>";
        case #"battery":
            return "<unknown string>";
        case #"outrider":
            return "<unknown string>";
        case #"prophet":
            return "<unknown string>";
        case #"firebreak":
            return "<unknown string>";
        case #"reaper":
            return "<unknown string>";
        case #"ruin":
            return "<unknown string>";
        case #"seraph":
            return "<unknown string>";
        case #"nomad":
            return "<unknown string>";
        }
        return "thiefRevealDelay";
    #/
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0xa48b39c9, Offset: 0xdd60
// Size: 0x13c
function play_conv_self_other() {
    /#
        num = randomintrange(0, 4);
        self play_test_dialog("<unknown string>" + num);
        wait(4);
        players = arraysort(level.players, self.origin);
        foreach (player in players) {
            if (player != self && isalive(player)) {
                player play_test_dialog("<unknown string>" + self response_key() + num);
                break;
            }
        }
    #/
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x2f7fc5ad, Offset: 0xdea8
// Size: 0x13c
function play_conv_other_self() {
    /#
        num = randomintrange(0, 4);
        players = arraysort(level.players, self.origin);
        foreach (player in players) {
            if (player != self && isalive(player)) {
                player play_test_dialog("<unknown string>" + num);
                break;
            }
        }
        wait(4);
        self play_test_dialog("<unknown string>" + player response_key() + num);
    #/
}

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x0
// Checksum 0x8c1bbd84, Offset: 0xdff0
// Size: 0x1dc
function play_conv_other_other() {
    /#
        num = randomintrange(0, 4);
        players = arraysort(level.players, self.origin);
        foreach (player in players) {
            if (player != self && isalive(player)) {
                player play_test_dialog("<unknown string>" + num);
                firstplayer = player;
                break;
            }
        }
        wait(4);
        foreach (player in players) {
            if (player != self && player !== firstplayer && isalive(player)) {
                player play_test_dialog("<unknown string>" + firstplayer response_key() + num);
                break;
            }
        }
    #/
}

