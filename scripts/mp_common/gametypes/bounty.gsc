// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\player\player_callbacks.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_killed.gsc;
#using scripts\mp_common\pickup_health.gsc;
#using scripts\mp_common\pickup_ammo.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\radar_sweeps.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_ui.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_defaults.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\dynamic_loadout.gsc;
#using scripts\mp_common\contracts.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\draft.gsc;
#using script_702b73ee97d18efe;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using script_52d2de9b438adc78;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace bounty;

// Namespace bounty/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x43762464, Offset: 0x770
// Size: 0xac6
function event_handler[gametype_init] main(eventstruct) {
    globallogic::init();
    util::registerroundswitch(0, 9);
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 500);
    util::registerroundlimit(0, 12);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.overrideteamscore = 1;
    level.var_f5a73a96 = 1;
    level.var_60507c71 = 1;
    level.takelivesondeath = 1;
    level.var_4348a050 = (isdefined(getgametypesetting(#"playernumlives")) ? getgametypesetting(#"playernumlives") : 0) + (isdefined(getgametypesetting(#"teamnumlives")) ? getgametypesetting(#"teamnumlives") : 0) > 0;
    level.endgameonscorelimit = 0;
    level.scoreroundwinbased = 1;
    level.var_5ee570bd = 1;
    level.var_7d1eeba9 = 1;
    level.var_81ca6158 = 1;
    level.var_30408f96 = 1;
    level.var_f46d16f0 = 1;
    level.b_allow_vehicle_proximity_pickup = 1;
    level.var_f16f6c66 = 1;
    if (!isdefined(game.var_b40d8319)) {
        game.var_b40d8319 = getgametypesetting(#"hash_2847dbf50c74391f");
    }
    level.var_b9aad767 = getgametypesetting(#"bountypurchasephaseduration");
    level.var_860cdbdb = getgametypesetting(#"hash_63f088c667689f40");
    level.var_8e8e80c6 = getgametypesetting(#"hash_32995dae734b94b6");
    level.var_374a483e = getgametypesetting(#"hash_561be47168b4e674");
    level.var_a2b93ad3 = getgametypesetting(#"hash_2270a3136e7cd914");
    level.var_854eeded = getgametypesetting(#"hash_48a1a06a8787b8d5");
    level.var_6fb8c585 = getgametypesetting(#"bountystartmoney");
    level.var_59e1bdd9 = getgametypesetting(#"hash_57fb5c079ad2fb7a");
    level.var_aad1f6f2 = getgametypesetting(#"hash_b5542a4bc9afce9");
    level.var_8ce231e3 = getgametypesetting(#"hash_b3a34a4bc841d67");
    if (level.var_aad1f6f2 > level.var_8ce231e3) {
        var_6b6c4ce = level.var_8ce231e3;
        level.var_8ce231e3 = level.var_aad1f6f2;
        level.var_aad1f6f2 = var_6b6c4ce;
    }
    if (level.var_aad1f6f2 == level.var_8ce231e3) {
        level.var_8ce231e3 += 0.001;
    }
    assert(level.var_aad1f6f2 <= level.var_8ce231e3);
    level.var_73a7a457 = max(getgametypesetting(#"hash_381587a813feab3e"), 1);
    level.bountydepositsitecapturetime = max(getgametypesetting(#"bountydepositsitecapturetime"), 1);
    level.var_ad9d03e7 = getgametypesetting(#"hash_3ffec9399ef7052f");
    level.var_d4fe7ba9 = getgametypesetting(#"hash_1e3a29a0321c9293");
    level.var_8cfdca96 = getgametypesetting(#"hash_78e49b8491ad6446");
    level.var_16fd9420 = getgametypesetting(#"hash_63f8d60d122e755b");
    level.var_651c849 = getgametypesetting(#"hash_45ff0effd8383bae");
    level.var_714ddf4a = getgametypesetting(#"hash_ef8682282bd2e10");
    level.var_e025e79e = getgametypesetting(#"bountybagomoneymovescale");
    level.var_18823aed = getgametypesetting(#"bountydepositextratime");
    level.timepauseswheninzone = getgametypesetting(#"timepauseswheninzone");
    level.var_3e14d8dd = getgametypesetting(#"bountybagomoneymoney");
    level.var_b2a8558a = level.var_3e14d8dd;
    level.laststandhealth = getgametypesetting(#"laststandhealth");
    level.laststandtimer = getgametypesetting(#"laststandtimer");
    level.var_aad2ad58 = getgametypesetting(#"hash_4462b9c231538fc9");
    if (level.var_aad2ad58) {
        level.var_2f990fc4 = getgametypesetting(#"hash_74efbd1bd1ee6413");
    }
    level.decayprogress = isdefined(getgametypesetting(#"decayprogress")) ? getgametypesetting(#"decayprogress") : 0;
    level.autodecaytime = isdefined(getgametypesetting(#"autodecaytime")) ? getgametypesetting(#"autodecaytime") : undefined;
    globallogic_spawn::addsupportedspawnpointtype("bounty");
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.ondeadevent = &ondeadevent;
    level.ontimelimit = &ontimelimit;
    level.ononeleftevent = &ononeleftevent;
    level.onroundswitch = &onroundswitch;
    level.var_6c0f31f5 = &function_6c0f31f5;
    level.var_f7b64ada = &function_f7b64ada;
    level.var_1a0c2b72 = &function_1a0c2b72;
    player::function_cf3aa03d(&onplayerkilled);
    callback::on_connect(&onconnect);
    callback::on_spawned(&onspawned);
    callback::on_player_damage(&onplayerdamage);
    globallogic_defaults::function_daa7e9d5();
    laststand_mp::function_367cfa1b(&function_95002a59);
    laststand_mp::function_eb8c0e47(&onplayerrevived);
    setdvar(#"hash_7036719f41a78d54", getgametypesetting(#"laststandrevivehealth"));
    clientfield::register("allplayers", "bountymoneytrail", 1, 1, "int");
    clientfield::register("toplayer", "realtime_multiplay", 1, 1, "int");
    level.var_1aef539f = &function_a800815;
}

// Namespace bounty/bounty
// Params 2, eflags: 0x0
// Checksum 0xc8257b2c, Offset: 0x1240
// Size: 0x4c
function function_f2d6cd4a(gestureindex, animlength) {
    if (isdefined(level.purchasephase) && level.purchasephase) {
        self setlowready(0);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x21eb3dcd, Offset: 0x1298
// Size: 0x3c
function function_41c54fc4() {
    if (isdefined(level.purchasephase) && level.purchasephase) {
        self setlowready(1);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x100dfc67, Offset: 0x12e0
// Size: 0x384
function private onconnect() {
    waitframe(1);
    if (!isdefined(self.pers[#"money"])) {
        self.pers[#"money"] = level.var_6fb8c585;
        self.pers[#"money_earned"] = 0;
        if (game.roundsplayed > 0) {
            numteammates = 0;
            var_69c2bc0d = 0;
            foreach (player in level.players) {
                if (player == self) {
                    continue;
                }
                if (!isdefined(player.pers[#"money_earned"])) {
                    continue;
                }
                if (player.team == self.team) {
                    numteammates++;
                    var_69c2bc0d += player.pers[#"money_earned"];
                }
            }
            if (numteammates) {
                self function_3a77006e(int(var_69c2bc0d / numteammates), "moneychange_initialallocation");
            }
        }
    }
    if (level.var_aad2ad58 && !isdefined(self.pers[#"dynamic_loadout"].weapons[1])) {
        self.pers[#"dynamic_loadout"].weapons[1] = spawnstruct();
        self.pers[#"dynamic_loadout"].weapons[1].name = #"pistol_standard_t8";
        self.pers[#"dynamic_loadout"].weapons[1].attachments = [];
        self.pers[#"dynamic_loadout"].weapons[1].ammo = -1;
        self.pers[#"dynamic_loadout"].weapons[1].startammo = level.var_2f990fc4;
        dynamic_loadout::function_ff8ef46b(1, "luielement.BountyHunterLoadout.secondary", 7);
    }
    self clientfield::set_to_player("bountyMoney", self.pers[#"money"]);
    if (level.ingraceperiod === 1 && level.draftstage != 3) {
        wait(1);
        draft::assign_remaining_players(self);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0xdc57bf40, Offset: 0x1670
// Size: 0x6c
function function_e1919661() {
    self.gameobject_link = util::spawn_model("tag_origin", self.origin, self.angles);
    self playerlinkto(self.gameobject_link, "tag_origin", 0, 30, 30, 30, 30);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x625760d, Offset: 0x16e8
// Size: 0x4c
function function_feeebad() {
    if (isdefined(self)) {
        self unlink();
        if (isdefined(self.gameobject_link)) {
            self.gameobject_link delete();
        }
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x9d738c8a, Offset: 0x1740
// Size: 0xdc
function private onspawned() {
    self clientfield::set_to_player("bountyMoney", self.pers[#"money"]);
    if (isdefined(level.purchasephase) && level.purchasephase) {
        self freezecontrols(1);
        self thread function_9b85340e();
        self setlowready(1);
        return;
    }
    if (game.state == "playing") {
        self clientfield::set_to_player("realtime_multiplay", 1);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x384e2a5f, Offset: 0x1828
// Size: 0x44
function private function_9b85340e() {
    self endon(#"death", #"disconnect");
    waitframe(1);
    self function_9659b3b4();
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x59148f57, Offset: 0x1878
// Size: 0x2fc
function private onstartgametype() {
    level.graceperiod = isdefined(level.var_b9aad767) ? level.var_b9aad767 : level.graceperiod;
    level.alwaysusestartspawns = 1;
    foreach (team, _ in level.teams) {
        level.var_a236b703[team] = 1;
        level.var_61952d8b[team] = 1;
    }
    thread function_17debb33();
    level thread function_8cac4c76();
    var_b1f5f155 = game.roundsplayed + 1;
    if (var_b1f5f155 == game.var_b40d8319) {
        game.var_b40d8319 += getgametypesetting(#"hash_7e30d3849ca91b60");
        thread function_bdba96e1();
    }
    level.var_7e7897b8 = function_b3faa437();
    thread function_c04cc87c();
    if (level.scoreroundwinbased) {
        [[ level._setteamscore ]](#"allies", game.stat[#"roundswon"][#"allies"]);
        [[ level._setteamscore ]](#"axis", game.stat[#"roundswon"][#"axis"]);
    }
    laststand_mp::function_414115a0(level.laststandtimer, level.laststandhealth);
    level.var_4cfc17cc = struct::get_script_bundle("killstreak", #"killstreak_bounty_deposit_site_heli");
    function_fb6f71d5();
    function_9f5ae64d();
    level thread function_7cb5420e(level.var_b9aad767);
    /#
        level thread function_b968a61c();
    #/
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xf672b46e, Offset: 0x1b80
// Size: 0x24
function private onspawnplayer(predictedspawn) {
    spawning::onspawnplayer(predictedspawn);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x6a2e89c8, Offset: 0x1bb0
// Size: 0x88
function function_5439aa67() {
    self endon(#"death", #"revived");
    while (isdefined(self)) {
        if (self function_cf8de58d()) {
            self dodamage(10000, self.origin, undefined, undefined, undefined, "MOD_UNKNOWN", 0, level.shockrifleweapon);
            return;
        }
        waitframe(1);
    }
}

// Namespace bounty/bounty
// Params 5, eflags: 0x4
// Checksum 0xa186c0cb, Offset: 0x1c40
// Size: 0x1c4
function private function_95002a59(attacker, victim, inflictor, weapon, meansofdeath) {
    if (attacker == self) {
        return;
    }
    var_e9d49a33 = 0;
    self notify(#"minigame_laststand");
    if (isdefined(weapon) && killstreaks::is_killstreak_weapon(weapon)) {
        var_e9d49a33 = 1;
    }
    if (!var_e9d49a33) {
        overrideentitycamera = player::function_c0f28ff9(attacker, weapon);
        var_50d1e41a = potm::function_775b9ad1(weapon, meansofdeath);
        potm::function_66d09fea(#"hash_11588f7b0737f095", attacker, self, inflictor, var_50d1e41a, overrideentitycamera);
    }
    if (isdefined(attacker)) {
        [[ level.var_37d62931 ]](attacker, 1);
        attacker.pers[#"downs"] = (isdefined(attacker.pers[#"downs"]) ? attacker.pers[#"downs"] : 0) + 1;
        attacker.downs = attacker.pers[#"downs"];
    }
    self thread function_5439aa67();
}

// Namespace bounty/bounty
// Params 2, eflags: 0x4
// Checksum 0xefac5f27, Offset: 0x1e10
// Size: 0xd0
function private onplayerrevived(revivee, reviver) {
    [[ level.var_37d62931 ]](reviver, 1);
    reviver.pers[#"revives"] = (isdefined(reviver.pers[#"revives"]) ? reviver.pers[#"revives"] : 0) + 1;
    reviver.revives = reviver.pers[#"revives"];
    revivee notify(#"revived");
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x528e28a1, Offset: 0x1ee8
// Size: 0x64
function function_9659b3b4() {
    assert(isdefined(level.var_968635ea));
    if (!level.var_968635ea bountyhunterbuy::is_open(self)) {
        level.var_968635ea bountyhunterbuy::open(self);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0xaeca2180, Offset: 0x1f58
// Size: 0x8c
function function_d764db12() {
    assert(isdefined(level.var_968635ea));
    if (level.var_968635ea bountyhunterbuy::is_open(self)) {
        level.var_968635ea bountyhunterbuy::close(self);
    }
    level.var_7e7897b8 gameobjects::set_visible_team(#"any");
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xb8b583d7, Offset: 0x1ff0
// Size: 0x6dc
function private function_c04cc87c() {
    level.var_324e2795 = 1;
    level.var_7aa0d894 = 1;
    objective_setinvisibletoall(level.var_7e7897b8.objectiveid);
    while (game.state != "playing") {
        waitframe(1);
    }
    globallogic_utils::pausetimer();
    level.purchasephase = 1;
    foreach (player in level.players) {
        player thread globallogic_audio::set_music_on_player("spawnPreLoop");
        player [[ level.givecustomloadout ]]();
    }
    if (function_8b1a219a()) {
        foreach (player in level.players) {
            player freezecontrols(1);
            player globallogic_ui::closemenus();
        }
        wait(1);
    } else {
        foreach (player in level.players) {
            player globallogic_ui::closemenus();
        }
        waitframe(1);
    }
    foreach (player in level.players) {
        if (!function_8b1a219a()) {
            player freezecontrols(1);
        }
        player function_9659b3b4();
        player setlowready(1);
    }
    thread globallogic_audio::leader_dialog("bountyBuyStart");
    clockobject = spawn("script_origin", (0, 0, 0));
    timeremaining = level.var_b9aad767;
    while (timeremaining > 0) {
        level clientfield::set_world_uimodel("BountyHunterLoadout.timeRemaining", timeremaining);
        if (timeremaining == 5) {
            foreach (player in level.players) {
                player globallogic_audio::set_music_on_player("spawnPreRise");
            }
        }
        if (timeremaining <= 5) {
            clockobject playsound(#"mpl_ui_timer_countdown");
        }
        if (timeremaining <= 1) {
            foreach (player in level.players) {
                player setlowready(0);
                player function_d764db12();
                player globallogic_ui::closemenus();
            }
        }
        timeremaining--;
        wait(1);
    }
    level.var_324e2795 = 0;
    level.purchasephase = 0;
    foreach (player in level.players) {
        player function_7c685040(1);
        player [[ level.givecustomloadout ]]();
        player freezecontrols(0);
        player globallogic_audio::set_music_on_player("spawnShort");
        player clientfield::set_to_player("realtime_multiplay", 1);
    }
    if (game.roundsplayed == 0) {
        if (level.hardcoremode) {
            thread globallogic_audio::leader_dialog("hcStartBounty");
        } else {
            thread globallogic_audio::leader_dialog("startBounty");
        }
        thread globallogic_audio::leader_dialog("bountyModeOrder");
    } else {
        thread globallogic_audio::leader_dialog("startRoundBounty");
    }
    level.var_7aa0d894 = undefined;
    level clientfield::set_world_uimodel("hudItems.specialistSwitchIsLethal", 1);
    globallogic_utils::resumetimer();
    objective_setvisibletoall(level.var_7e7897b8.objectiveid);
    thread radar_sweeps::radarsweeps();
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x93db49de, Offset: 0x26d8
// Size: 0x164
function private ondeadevent(team) {
    if (team == "all") {
        if (isdefined(level.var_a379a090)) {
            function_36f8016e(level.var_a379a090, 6);
            return;
        }
        function_b8793906(6);
        return;
    }
    if (isdefined(level.var_a379a090)) {
        return;
    }
    level.var_a379a090 = util::get_enemy_team(team);
    if (isdefined(level.numlives) ? level.numlives : 0) {
        challenges::last_man_defeat_3_enemies(level.var_a379a090);
    }
    if (game.stat[#"roundswon"][level.var_a379a090] >= level.roundwinlimit - 1) {
        function_36f8016e(level.var_a379a090, 6);
        return;
    }
    level thread function_a981417();
    level thread function_30b3b16e(level.var_a379a090);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xe7fb643, Offset: 0x2848
// Size: 0x18c
function private function_a981417() {
    level endon(#"game_ended");
    level.var_6938f270 = 1;
    while (game.state == "playing") {
        if (isdefined(level.var_ad7774db)) {
            if (isdefined(level.var_ad7774db.keyobject[0].carrier) && level.var_ad7774db.keyobject[0].carrier istouching(level.var_ad7774db.trigger)) {
                level.var_ad7774db.userate *= level.var_6938f270;
                level.var_ad7774db.autodecaytime /= level.var_6938f270;
                if (level.var_ad7774db.autodecaytime < 0.001) {
                    level.var_ad7774db.autodecaytime = 0.001;
                }
                level.var_6938f270 += 0.1 * float(level.var_9fee970c) / 1000;
            }
        }
        waitframe(1);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x79f18b23, Offset: 0x29e0
// Size: 0x11c
function private function_acf3ff19() {
    level endon(#"game_ended");
    level.timerpaused = 0;
    while (game.state == "playing") {
        if (isdefined(level.var_ad7774db)) {
            if (isdefined(level.var_ad7774db.keyobject[0].carrier) && level.var_ad7774db.keyobject[0].carrier istouching(level.var_ad7774db.trigger)) {
                if (!level.timerpaused) {
                    pause_time();
                    level.timerpaused = 1;
                }
            } else if (level.timerpaused) {
                resume_time();
                level.timerpaused = 0;
            }
        }
        waitframe(1);
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x5d309103, Offset: 0x2b08
// Size: 0xfc
function private function_30b3b16e(winner) {
    if (isdefined(level.var_18823aed) && level.var_18823aed > 0) {
        thread globallogic_audio::leader_dialog("bountyCashTimerStart", winner);
        level.timelimitoverride = 1;
        setgameendtime(gettime() + int(level.var_18823aed * 1000));
        hostmigration::waitlongdurationwithgameendtimeupdate(level.var_18823aed);
        if (game.state != "playing") {
            return;
        }
        thread globallogic_audio::leader_dialog("bountyCashTimerFail", winner);
    }
    function_36f8016e(winner, 6);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xdb6886, Offset: 0x2c10
// Size: 0x1c
function private ontimelimit() {
    function_b8793906(2);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x0
// Checksum 0x9c35904a, Offset: 0x2c38
// Size: 0x5c
function function_b8793906(var_c1e98979) {
    round::set_flag("tie");
    function_9698aa74(#"none");
    thread globallogic::end_round(var_c1e98979);
}

// Namespace bounty/bounty
// Params 2, eflags: 0x0
// Checksum 0xd143bf4, Offset: 0x2ca0
// Size: 0x5c
function function_36f8016e(winning_team, var_c1e98979) {
    round::set_winner(winning_team);
    function_9698aa74(winning_team);
    thread globallogic::function_a3e3bd39(winning_team, var_c1e98979);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xc6bbd482, Offset: 0x2d08
// Size: 0x1ac
function private ononeleftevent(team) {
    if (!isdefined(level.warnedlastplayer)) {
        level.warnedlastplayer = [];
    }
    if (isdefined(level.warnedlastplayer[team])) {
        return;
    }
    level.warnedlastplayer[team] = 1;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team && isdefined(player.pers[#"class"])) {
            if (player.sessionstate == "playing" && !player.afk) {
                break;
            }
        }
    }
    if (i == players.size) {
        return;
    }
    players[i] thread givelastattackerwarning(team);
    util::function_5a68c330(17, player.team, player getentitynumber());
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x697be19f, Offset: 0x2ec0
// Size: 0x14
function private onroundswitch() {
    gametype::on_round_switch();
}

// Namespace bounty/bounty
// Params 9, eflags: 0x4
// Checksum 0xe0d7ea86, Offset: 0x2ee0
// Size: 0x2e4
function private onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isdefined(level.numlives) ? level.numlives : 0) {
        clientfield::set_player_uimodel("hudItems.playerLivesCount", level.numlives - self.var_a7d7e50a);
        enemy_team = util::getotherteam(self.team);
        if (!isdefined(level.var_1df52fe0)) {
            level.var_1df52fe0 = [];
        }
        var_ff9338bb = level.playercount[self.team] * level.numlives - level.deaths[self.team];
        if (var_ff9338bb == 1) {
            level.var_1df52fe0[self.team] = 1;
        } else if (var_ff9338bb <= 3 && var_ff9338bb > 1 && !(isdefined(level.var_1df52fe0[self.team]) && level.var_1df52fe0[self.team])) {
            thread globallogic_audio::leader_dialog("bountyLowLives", self.team);
            thread globallogic_audio::leader_dialog("bountyLowLivesEnemy", enemy_team);
            level.var_1df52fe0[self.team] = 1;
        }
    }
    if (isdefined(self) && isdefined(attacker) && isplayer(attacker) && attacker != self && attacker.team != self.team && !self laststand_mp::is_cheating()) {
        scoreevents::processscoreevent(#"eliminated_enemy", attacker, self, weapon);
        attacker contracts::function_fd9fb79b(#"contract_mp_eliminations");
        if (var_ff9338bb === 0) {
            attacker stats::function_dad108fa(#"eliminated_final_enemy", 1);
        }
    }
    self function_4f2c425d();
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xe08e0b47, Offset: 0x31d0
// Size: 0xe4
function private function_6c0f31f5(params) {
    if (self laststand_mp::is_cheating()) {
        return;
    }
    event = params.event;
    if (!isdefined(level.scoreinfo[event])) {
        return;
    }
    money = self rank::function_bcb5e246(event);
    if (isdefined(money) && money > 0 && !(params.victim === self)) {
        self function_3a77006e(money, "moneychange_scoreevent");
        self playsoundtoplayer(#"hash_767e2476f594e0f3", self);
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xf8b23fdd, Offset: 0x32c0
// Size: 0x184
function private onplayerdamage(params) {
    if (isdefined(params) && isdefined(params.eattacker) && isplayer(params.eattacker) && isdefined(params.idamage)) {
        if (params.eattacker.team == self.team) {
            return;
        }
        player = params.eattacker;
        if (player laststand_mp::is_cheating()) {
            return;
        }
        var_80ed4b57 = params.idamage;
        if (laststand::player_is_in_laststand() && isdefined(self.var_969fabf4) && var_80ed4b57 > self.var_969fabf4) {
            var_80ed4b57 = self.var_969fabf4;
        } else if (var_80ed4b57 < 0) {
            var_80ed4b57 = 0;
        } else if (var_80ed4b57 > self.health) {
            var_80ed4b57 = self.health;
        }
        player function_3a77006e(var_80ed4b57, "moneychange_playerdamage");
        player playsoundtoplayer(#"hash_767e2476f594e0f3", player);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xb61b98c8, Offset: 0x3450
// Size: 0xb4
function private function_f7b64ada() {
    if (game.state == "playing") {
        foreach (weapondata in self.pers[#"dynamic_loadout"].weapons) {
            weapondata.ammo = -1;
        }
    }
    self thread function_f7ef4642();
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x9861e885, Offset: 0x3510
// Size: 0x54
function private function_f7ef4642() {
    waitframe(1);
    if (isdefined(self) && isalive(self)) {
        level thread popups::displayteammessagetoteam(#"hash_4fe1c041d2f3e71", self, self.team, undefined, undefined);
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x3559e589, Offset: 0x3570
// Size: 0x74
function private function_1a0c2b72(revivedplayer) {
    if (isdefined(self) && isalive(self) && isdefined(revivedplayer)) {
        level thread popups::displayteammessagetoteam(#"hash_17c6b0524e578976", self, self.team, revivedplayer.entnum, undefined);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x20db805c, Offset: 0x35f0
// Size: 0x44
function private function_8cac4c76() {
    waitframe(1);
    clientfield::set_world_uimodel("hudItems.team1.noRespawnsLeft", 1);
    clientfield::set_world_uimodel("hudItems.team2.noRespawnsLeft", 1);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xc1341066, Offset: 0x3640
// Size: 0x150
function private function_4f2c425d() {
    if (!isdefined(level.var_7e7897b8)) {
        return;
    }
    if (!isdefined(level.var_7e7897b8.carrier)) {
        return;
    }
    if (!isdefined(self.team)) {
        return;
    }
    var_fe63ca41 = getteamplayersalive(self.team);
    if (var_fe63ca41 <= 0) {
        self.var_6bd898f7 = level.var_7e7897b8.carrier getentitynumber();
        return;
    }
    teammates = getplayers(self.team);
    foreach (teammate in teammates) {
        if (teammate == level.var_7e7897b8.carrier) {
            self.var_6bd898f7 = teammate getentitynumber();
            return;
        }
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xee566fba, Offset: 0x3798
// Size: 0x174
function private givelastattackerwarning(team) {
    self endon(#"death", #"disconnect");
    fullhealthtime = 0;
    interval = 0.05;
    self.lastmansd = 1;
    enemyteam = util::get_enemy_team(team);
    if (level.alivecount[enemyteam] > 2) {
        self.var_66cfa07f = 1;
    }
    while (true) {
        if (self.health != self.maxhealth) {
            fullhealthtime = 0;
        } else {
            fullhealthtime += interval;
        }
        wait(interval);
        if (self.health == self.maxhealth && fullhealthtime >= 3) {
            break;
        }
    }
    self thread globallogic_audio::leader_dialog_on_player("roundEncourageLastPlayer");
    thread globallogic_audio::leader_dialog_for_other_teams("roundEncourageLastPlayerEnemy", self.team, undefined, undefined);
    self playlocalsound(#"mus_last_stand");
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0xe83b023b, Offset: 0x3918
// Size: 0xb8
function function_c04436fc() {
    foreach (player in level.players) {
        if (isdefined(level.var_a5221eec) && level.var_a5221eec == player.team) {
            player function_3a77006e(level.var_3e14d8dd, "moneychange_bagomoney");
        }
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xed4073c5, Offset: 0x39d8
// Size: 0x1e0
function private function_9698aa74(winner) {
    foreach (player in level.players) {
        if (isalive(player)) {
            foreach (weapondata in player.pers[#"dynamic_loadout"].weapons) {
                weapondata.ammo = -1;
            }
        }
        player dynamic_loadout::function_cea5cbc5();
        player dynamic_loadout::removearmor();
        if (!level.var_59e1bdd9) {
            player.pers[#"pickup_health"] = 0;
        }
        if (!player laststand_mp::is_cheating()) {
            if (player.team == winner) {
                player scoreevents::processscoreevent(#"round_won", player);
                continue;
            }
            player scoreevents::processscoreevent(#"round_lost", player);
        }
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xed612e01, Offset: 0x3bc0
// Size: 0x36e
function private function_b3faa437() {
    var_fa06e6b7 = struct::get_array("bounty_bag_o_money", "variantname");
    var_85b31568 = var_fa06e6b7[randomint(var_fa06e6b7.size)].origin;
    usetrigger = spawn("trigger_radius_use", var_85b31568 + (0, 0, 15), 0, 80, 60);
    usetrigger triggerignoreteam();
    usetrigger setvisibletoall();
    usetrigger setteamfortrigger(#"none");
    usetrigger setcursorhint("HINT_INTERACTIVE_PROMPT");
    usetrigger function_682f34cf(-800);
    var_8b6f8e45 = [];
    var_8b6f8e45[0] = spawn("script_model", var_85b31568);
    var_8b6f8e45[0] setmodel("p8_heist_duffel_bag_set_open");
    var_7e7897b8 = gameobjects::create_carry_object(#"neutral", usetrigger, var_8b6f8e45, (0, 0, 0), #"hash_28e240e1bf135064");
    var_7e7897b8 gameobjects::set_use_hint_text(#"hash_ee4d709a0f80280");
    var_7e7897b8 gameobjects::allow_carry(#"any");
    var_7e7897b8 gameobjects::set_visible_team(#"any");
    var_7e7897b8 gameobjects::set_use_time(level.var_8cfdca96);
    var_7e7897b8 gameobjects::set_objective_entity(var_7e7897b8);
    var_7e7897b8 gameobjects::function_63f73e1d(#"hash_510667a4ac8024c3");
    var_7e7897b8.objectiveonself = 1;
    var_7e7897b8.allowweapons = 1;
    var_7e7897b8.onpickup = &function_cd23eebc;
    var_7e7897b8.ondrop = &function_62d627a0;
    var_7e7897b8.var_22389d70 = 0;
    var_7e7897b8.var_78149e41 = gameobjects::get_next_obj_id();
    objective_add(var_7e7897b8.var_78149e41, "invisible", var_7e7897b8, #"hash_34a0ac740c9d0bc2");
    objective_onentity(var_7e7897b8.var_78149e41, var_7e7897b8);
    var_7e7897b8 gameobjects::set_visible_team(#"none");
    level.var_7e7897b8 = var_7e7897b8;
    return var_7e7897b8;
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xb3f10999, Offset: 0x3f38
// Size: 0x2bc
function private function_cd23eebc(player) {
    level.var_a5221eec = player.team;
    enemy_team = gameobjects::get_enemy_team(player.team);
    self gameobjects::set_visible_team(#"none");
    self.visuals[0] notsolid();
    player setmovespeedscale(level.var_e025e79e);
    player clientfield::set_player_uimodel("hudItems.BountyCarryingBag", 1);
    player clientfield::set("bountymoneytrail", 1);
    objective_setstate(self.var_78149e41, "active");
    objective_onentity(self.var_78149e41, player);
    objective_setteam(self.var_78149e41, player.team);
    function_3ae6fa3(self.var_78149e41, player.team, 1);
    objective_setinvisibletoplayer(self.var_78149e41, player);
    if (!isdefined(self.var_b8ced2f9) && !self laststand_mp::is_cheating()) {
        scoreevents::processscoreevent(#"hash_2626334909405935", player, undefined, undefined);
        self.var_b8ced2f9 = 1;
    }
    level thread function_2ad9733b();
    level thread popups::displayteammessagetoall(#"hash_5f69531a71a74e3d", player);
    thread globallogic_audio::leader_dialog("bountyCashAcquiredFriendly", player.team);
    thread globallogic_audio::leader_dialog("bountyCashAcquiredEnemy", util::getotherteam(player.team));
    if (level.var_16fd9420) {
        self thread function_319af5a2(player);
        return;
    }
    player clientfield::set_to_player("bountyBagMoney", 1);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x7c142ec7, Offset: 0x4200
// Size: 0x25c
function private function_319af5a2(player) {
    self endon(#"hash_1af469c6cd76e56b");
    objective_setprogress(self.var_78149e41, float(level.var_3e14d8dd) / level.var_b2a8558a);
    player clientfield::set_to_player("bountyBagMoney", int(float(level.var_3e14d8dd) / level.var_16fd9420));
    while (level.var_3e14d8dd > level.var_714ddf4a) {
        if (isdefined(level.var_ad7774db)) {
            if (player istouching(level.var_ad7774db.trigger)) {
                waitframe(1);
                continue;
            }
        }
        wait(level.var_651c849);
        level.var_3e14d8dd -= level.var_16fd9420;
        if (level.var_3e14d8dd < level.var_714ddf4a) {
            level.var_3e14d8dd = level.var_714ddf4a;
        } else if (level.var_3e14d8dd > level.var_3e14d8dd) {
            level.var_3e14d8dd = level.var_3e14d8dd;
        }
        objective_setprogress(self.var_78149e41, float(level.var_3e14d8dd) / level.var_b2a8558a);
        player clientfield::set_to_player("bountyBagMoney", int(float(level.var_3e14d8dd) / level.var_16fd9420));
    }
    player clientfield::set_to_player("bountyBagMoney", int(float(level.var_3e14d8dd) / level.var_16fd9420));
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x46f65a1, Offset: 0x4468
// Size: 0x1d4
function private function_62d627a0(player) {
    self notify(#"hash_1af469c6cd76e56b");
    self.visuals[0] solid();
    if (isdefined(self.var_78149e41)) {
        objective_setstate(self.var_78149e41, "invisible");
        objective_onentity(self.var_78149e41, self);
        objective_setteam(self.var_78149e41, #"none");
        objective_setvisibletoplayer(self.var_78149e41, player);
        function_3ae6fa3(self.var_78149e41, player.team, 0);
    }
    player setmovespeedscale(1);
    level.var_a5221eec = undefined;
    level.var_3e14d8dd -= level.var_d4fe7ba9;
    self gameobjects::set_visible_team(#"any");
    level thread popups::displayteammessagetoall(#"hash_5e8cd98e9533c77d", player);
    player clientfield::set_player_uimodel("hudItems.BountyCarryingBag", 0);
    player clientfield::set("bountymoneytrail", 0);
    self playsound(#"hash_6f33c21d562757a1");
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x5f3c4123, Offset: 0x4648
// Size: 0x292
function private function_7f8c4043() {
    if (isdefined(level.var_a740d54d)) {
        return level.var_a740d54d;
    }
    var_1c8f5a97 = struct::get_array("bounty_deposit_location", "variantname");
    if (var_1c8f5a97.size == 0) {
        var_1c8f5a97[0] = {};
        mapcenter = airsupport::getmapcenter();
        var_1c8f5a97[0].origin = getclosestpointonnavmesh(mapcenter, 256, 32);
    } else if (var_1c8f5a97.size > 1) {
        if (isdefined(game.var_46ffd493)) {
            closestdist = 2147483647;
            closestindex = -1;
            for (i = 0; i < var_1c8f5a97.size; i++) {
                dist = distancesquared(game.var_46ffd493, var_1c8f5a97[i].origin);
                if (dist < closestdist) {
                    closestdist = dist;
                    closestindex = i;
                }
            }
            if (closestindex >= 0) {
                arrayremoveindex(var_1c8f5a97, closestindex);
            }
        }
        closestdist = 2147483647;
        closestindex = -1;
        for (i = 0; i < var_1c8f5a97.size; i++) {
            dist = distancesquared(level.var_7e7897b8.origin, var_1c8f5a97[i].origin);
            if (dist < closestdist) {
                closestdist = dist;
                closestindex = i;
            }
        }
        if (closestindex >= 0) {
            arrayremoveindex(var_1c8f5a97, closestindex);
        }
    }
    var_fa5724d5 = var_1c8f5a97[randomint(var_1c8f5a97.size)].origin;
    level.var_a740d54d = var_fa5724d5;
    game.var_46ffd493 = var_fa5724d5;
    return level.var_a740d54d;
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x469fdf1e, Offset: 0x48e8
// Size: 0xe
function private function_fb6f71d5() {
    level.var_a740d54d = undefined;
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xdea3d023, Offset: 0x4900
// Size: 0x36
function private function_9f5ae64d() {
    if (isdefined(level.var_8fcae189)) {
        level.var_8fcae189 notify(#"strobe_stop");
        level.var_8fcae189 = undefined;
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x3e399949, Offset: 0x4940
// Size: 0x104
function private function_7cb5420e(delay) {
    while (game.state != "playing") {
        waitframe(1);
    }
    if (isdefined(level.var_8fcae189)) {
        return;
    }
    if (isdefined(delay)) {
        wait(delay);
    }
    var_fa5724d5 = function_7f8c4043();
    level.var_8fcae189 = ir_strobe::function_284b1d4c(var_fa5724d5, #"wpn_t8_eqp_grenade_smoke_world");
    level.var_b167ae9a = gameobjects::get_next_obj_id();
    objective_add(level.var_b167ae9a, "active", level.var_8fcae189, #"hash_7e7657e9c8f441eb");
    function_da7940a3(level.var_b167ae9a, 1);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x46062e55, Offset: 0x4a50
// Size: 0x74
function private function_2ad9733b() {
    if (isdefined(level.var_1f3975e4)) {
        return;
    }
    level.var_1f3975e4 = 1;
    function_7cb5420e();
    tempcontext = {};
    function_f878f4bf(function_7f8c4043(), tempcontext);
}

// Namespace bounty/bounty
// Params 2, eflags: 0x4
// Checksum 0x33354b4b, Offset: 0x4ad0
// Size: 0x3ec
function private function_f878f4bf(var_fa5724d5, context) {
    assert(isdefined(var_fa5724d5));
    level.var_8fcae189 = ir_strobe::function_284b1d4c(var_fa5724d5, #"wpn_t8_eqp_grenade_smoke_world");
    var_8ff770b8 = randomfloatrange(level.var_aad1f6f2, level.var_8ce231e3);
    wait(var_8ff770b8);
    destination = getstartorigin(var_fa5724d5, (0, 0, 0), #"ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2");
    var_6aa266d6 = helicopter::getvalidrandomstartnode(destination).origin;
    helicopter = function_d23cf101(var_6aa266d6, vectortoangles(destination - var_6aa266d6), context);
    helicopter endon(#"death", #"hash_69d2c68fdf86b6d7");
    helicopter.hardpointtype = undefined;
    waitframe(1);
    function_554b5692(helicopter);
    helicopter thread function_1aca4a4e(helicopter, destination);
    helicopter waittill(#"reached_destination");
    helicopter thread function_4af1c786(helicopter, var_fa5724d5);
    wait_start = gettime();
    while (helicopter.origin[2] - var_fa5724d5[2] > 620 && gettime() - wait_start < 1000) {
        wait(0.1);
    }
    level thread function_f9a7a3d8(helicopter);
    if (!isdefined(level.var_ad7774db)) {
        level.var_ad7774db = function_8debcb6(var_fa5724d5);
    } else {
        level.var_ad7774db function_99e2da8b(var_fa5724d5);
    }
    level.var_ad7774db thread function_acf3ff19();
    waitresult = level.var_ad7774db waittill(#"hash_5677d0c5246418e5");
    for (prevprogress = 0; waitresult._notify == "timeout" && level.var_ad7774db.curprogress > prevprogress; prevprogress = level.var_ad7774db.curprogress) {
        waitresult = level.var_ad7774db waittilltimeout(0.25, #"hash_5677d0c5246418e5");
    }
    if (!isdefined(level.var_ad7774db)) {
        return;
    }
    if (waitresult._notify == "timeout") {
        level.var_ad7774db function_572ce431();
    }
    level.var_8fcae189 notify(#"strobe_stop");
    helicopter thread function_b48e2739(helicopter);
    context.deployed = 1;
    helicopter thread function_36f403(helicopter);
}

// Namespace bounty/bounty
// Params 2, eflags: 0x4
// Checksum 0x58387c0a, Offset: 0x4ec8
// Size: 0x150
function private function_4af1c786(helicopter, var_5ad5316d) {
    helicopter endon(#"death", #"hash_589604da14bd8976");
    var_45d0806d = var_5ad5316d;
    lerp_duration = max((helicopter.origin[2] - var_5ad5316d[2] - 600) / 625, 0.8);
    helicopter animation::play(#"ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2", var_45d0806d, (0, helicopter.angles[1], 0), 1, 0.1, 0.2, lerp_duration);
    while (true) {
        helicopter animation::play(#"ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2", var_45d0806d, (0, helicopter.angles[1], 0), 1, 0.1, 0.2, 0.8);
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x2c28824f, Offset: 0x5020
// Size: 0x10c
function private function_554b5692(helicopter) {
    assert(!isdefined(helicopter.rope));
    helicopter.rope = spawn("script_model", helicopter.origin);
    assert(isdefined(helicopter.rope));
    helicopter.rope useanimtree("generic");
    helicopter.rope setmodel(#"hash_142fee14ea7bdb9b");
    helicopter.rope linkto(helicopter, "tag_origin_animate");
    helicopter.rope hide();
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xc4975a27, Offset: 0x5138
// Size: 0x104
function private function_f9a7a3d8(helicopter) {
    assert(isdefined(helicopter.rope));
    helicopter endon(#"death", #"hash_69d2c68fdf86b6d7", #"hash_3478587618f28c8");
    helicopter.rope endon(#"death");
    helicopter.rope show();
    helicopter.rope animation::play(#"hash_751de00c6e9e0862", helicopter, "tag_origin_animate", 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    childthread function_5db7fc11(helicopter);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x54b2ac9b, Offset: 0x5248
// Size: 0x88
function private function_5db7fc11(helicopter) {
    assert(isdefined(helicopter.rope));
    while (true) {
        helicopter.rope animation::play(#"hash_217d8ba9d8489561", helicopter, "tag_origin_animate", 1, 0.1, 0.1, undefined, undefined, undefined, 0);
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xa6adbb8f, Offset: 0x52d8
// Size: 0x154
function private function_b48e2739(helicopter) {
    if (!isdefined(helicopter.rope)) {
        return;
    }
    helicopter endon(#"hash_69d2c68fdf86b6d7", #"death");
    helicopter.rope endon(#"death");
    helicopter notify(#"hash_3478587618f28c8");
    helicopter.rope thread animation::play(#"hash_3d52f6faf02fd23", helicopter, "tag_origin_animate", 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    playfxontag(#"hash_24fa7e1844b116bb", helicopter.rope, "duffel_attach_jnt");
    var_314ff04b = getanimlength(#"hash_3d52f6faf02fd23") + 15;
    wait(var_314ff04b);
    function_b09faaf8(helicopter);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x44b1059d, Offset: 0x5438
// Size: 0x4c
function private function_b09faaf8(helicopter) {
    helicopter endon(#"death");
    if (isdefined(helicopter.rope)) {
        helicopter.rope delete();
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x8e761a47, Offset: 0x5490
// Size: 0x74
function heli_reset() {
    self cleartargetyaw();
    self cleargoalyaw();
    self setyawspeed(75, 45, 45);
    self setmaxpitchroll(30, 30);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x0
// Checksum 0x900c223f, Offset: 0x5510
// Size: 0x3d4
function function_36f403(helicopter) {
    helicopter notify(#"leaving");
    helicopter notify(#"hash_589604da14bd8976");
    helicopter.leaving = 1;
    leavenode = helicopter::getvalidrandomleavenode(helicopter.origin);
    var_b4c35bb7 = leavenode.origin;
    heli_reset();
    helicopter vehclearlookat();
    exitangles = vectortoangles(var_b4c35bb7 - helicopter.origin);
    helicopter setgoalyaw(exitangles[1]);
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        if (!ispointinnavvolume(helicopter.origin, "navvolume_big")) {
            if (issentient(helicopter)) {
                helicopter function_60d50ea4();
            }
            radius = distance(self.origin, leavenode.origin);
            var_a9a839e2 = getclosestpointonnavvolume(helicopter.origin, "navvolume_big", radius);
            if (isdefined(var_a9a839e2)) {
                helicopter function_9ffc1856(var_a9a839e2, 0);
                while (true) {
                    /#
                        recordsphere(var_a9a839e2, 8, (0, 0, 1), "bounty_deposit_site_helicopter");
                    #/
                    var_baa92af9 = ispointinnavvolume(helicopter.origin, "navvolume_big");
                    if (var_baa92af9 && !issentient(helicopter)) {
                        helicopter makesentient();
                        break;
                    }
                    waitframe(1);
                }
            }
        }
        if (!ispointinnavvolume(leavenode.origin, "navvolume_big")) {
            helicopter thread function_8de67419(leavenode);
            helicopter waittill(#"hash_2bf34763927dd61b");
        }
    }
    helicopter function_9ffc1856(var_b4c35bb7, 1);
    helicopter waittilltimeout(20, #"near_goal", #"death");
    if (isdefined(helicopter)) {
        helicopter stoploopsound(1);
        helicopter util::death_notify_wrapper();
        if (isdefined(helicopter.alarm_snd_ent)) {
            helicopter.alarm_snd_ent stoploopsound();
            helicopter.alarm_snd_ent delete();
            helicopter.alarm_snd_ent = undefined;
        }
        helicopter delete();
    }
}

// Namespace bounty/bounty
// Params 3, eflags: 0x4
// Checksum 0xbc50dfd1, Offset: 0x58f0
// Size: 0x2f0
function private function_d23cf101(origin, angles, context) {
    helicopter = spawnvehicle(#"vehicle_t8_mil_helicopter_swat_transport", origin, angles, "bounty_deposit_site_helicopter");
    helicopter.spawntime = gettime();
    helicopter.attackers = [];
    helicopter.attackerdata = [];
    helicopter.attackerdamage = [];
    helicopter.flareattackerdamage = [];
    helicopter.killstreak_id = context.killstreak_id;
    helicopter setdrawinfrared(1);
    helicopter.allowcontinuedlockonafterinvis = 1;
    helicopter.soundmod = "heli";
    helicopter.takedamage = 0;
    var_9a1bcc5b = 128;
    helicopter setneargoalnotifydist(var_9a1bcc5b);
    bundle = level.var_4cfc17cc;
    helicopter.maxhealth = bundle.kshealth;
    helicopter.health = bundle.kshealth;
    helicopter.overridevehicledamage = &function_b9192530;
    context.helicopter = helicopter;
    var_99c4651a = 0;
    if (var_99c4651a) {
        helicopter.target_offset = (0, 0, -25);
        target_set(helicopter, (0, 0, -25));
    }
    helicopter setrotorspeed(1);
    aitype = "spawner_mp_swat_buddy_team1_male";
    pilot = spawnactor(aitype, helicopter.origin, (0, 0, 0));
    pilot.var_e09b732c = 1;
    pilot.ai.swat_gunner = 1;
    pilot linkto(helicopter, "tag_driver", (0, 0, 0), (0, 0, 0));
    pilot.ignoreall = 1;
    pilot.ignoreme = 1;
    pilot ai::gun_remove();
    pilot.takedamage = 0;
    pilot setteam(#"free");
    return helicopter;
}

// Namespace bounty/bounty
// Params 2, eflags: 0x4
// Checksum 0x79983d0f, Offset: 0x5be8
// Size: 0x290
function private function_1aca4a4e(helicopter, destination) {
    helicopter endon(#"death");
    var_7f4a508d = destination;
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        helicopter thread function_656691ab();
        if (!ispointinnavvolume(var_7f4a508d, "navvolume_big")) {
            var_a9a839e2 = getclosestpointonnavvolume(destination, "navvolume_big", 10000);
            var_7f4a508d = (var_a9a839e2[0], var_a9a839e2[1], destination[2]);
            if (isdefined(var_7f4a508d)) {
                helicopter function_9ffc1856(var_7f4a508d, 1);
                helicopter.var_7f4a508d = var_7f4a508d;
                if (!ispointinnavvolume(var_7f4a508d, "navvolume_big")) {
                    self waittilltimeout(10, #"hash_340ab3c2b94ff86a");
                }
            }
        }
        self function_9ffc1856(var_7f4a508d, 1);
        self waittill(#"near_goal");
    } else {
        helicopter thread airsupport::setgoalposition(destination, "bounty_deposit_site_heli_reached", 1);
        helicopter waittill(#"bounty_deposit_site_heli_reached");
    }
    last_distance_from_goal_squared = 1e+07 * 1e+07;
    continue_waiting = 1;
    for (remaining_tries = 30; continue_waiting && remaining_tries > 0; remaining_tries--) {
        current_distance_from_goal_squared = distance2dsquared(helicopter.origin, destination);
        continue_waiting = current_distance_from_goal_squared < last_distance_from_goal_squared && current_distance_from_goal_squared > 4 * 4;
        last_distance_from_goal_squared = current_distance_from_goal_squared;
        if (continue_waiting) {
            waitframe(1);
        }
    }
    helicopter notify(#"reached_destination");
}

// Namespace bounty/bounty
// Params 15, eflags: 0x0
// Checksum 0x7dbd637e, Offset: 0x5e80
// Size: 0x150
function function_b9192530(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    bundle = level.var_4cfc17cc;
    chargelevel = 0;
    weapon_damage = killstreak_bundles::function_dd7587e4(bundle, self.maxhealth, eattacker, weapon, smeansofdeath, idamage, idflags, chargelevel);
    if (!isdefined(weapon_damage)) {
        weapon_damage = killstreaks::get_old_damage(eattacker, weapon, smeansofdeath, idamage, 1);
    }
    weapon_damage = int(weapon_damage);
    if (weapon_damage >= self.health) {
        thread destroy_heli(self);
    }
    return weapon_damage;
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xc2352094, Offset: 0x5fd8
// Size: 0xb4
function private destroy_heli(helicopter) {
    if (isdefined(level.var_ad7774db)) {
        level.var_ad7774db function_572ce431();
        level.var_8fcae189 notify(#"strobe_stop");
        if (isdefined(helicopter.rope)) {
            helicopter.rope delete();
        }
    }
    helicopter helicopter::function_e1058a3e();
    wait(0.1);
    if (isdefined(helicopter)) {
        helicopter delete();
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x657cf75b, Offset: 0x6098
// Size: 0xfc
function private function_656691ab() {
    self endon(#"death");
    while (true) {
        var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
        if (var_baa92af9) {
            heli_reset();
            self makepathfinder();
            self makesentient();
            self.ignoreme = 1;
            if (isdefined(self.heligoalpos)) {
                self function_9ffc1856(self.heligoalpos, 1);
            }
            self notify(#"hash_340ab3c2b94ff86a");
            break;
        }
        waitframe(1);
    }
}

// Namespace bounty/bounty
// Params 2, eflags: 0x0
// Checksum 0xda2f57dd, Offset: 0x61a0
// Size: 0x114
function function_9ffc1856(goalpos, stop) {
    self.heligoalpos = goalpos;
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        if (issentient(self) && ispathfinder(self) && ispointinnavvolume(self.origin, "navvolume_big")) {
            self setgoal(goalpos, stop);
            self function_a57c34b7(goalpos, stop, 1);
        } else {
            self function_a57c34b7(goalpos, stop, 0);
        }
        return;
    }
    self setgoal(goalpos, stop);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xbfc571a7, Offset: 0x62c0
// Size: 0x166
function private function_8de67419(leavenode) {
    self endon(#"death");
    radius = distance(self.origin, leavenode.origin);
    var_a9a839e2 = getclosestpointonnavvolume(leavenode.origin, "navvolume_big", radius);
    if (isdefined(var_a9a839e2)) {
        self function_9ffc1856(var_a9a839e2, 0);
        while (true) {
            /#
                recordsphere(var_a9a839e2, 8, (0, 0, 1), "bounty_deposit_site_helicopter");
            #/
            var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
            if (!var_baa92af9) {
                self function_60d50ea4();
                self notify(#"hash_2bf34763927dd61b");
                break;
            }
            waitframe(1);
        }
        return;
    }
    self function_60d50ea4();
    self notify(#"hash_2bf34763927dd61b");
}

// Namespace bounty/bounty
// Params 1, eflags: 0x0
// Checksum 0x61998d08, Offset: 0x6430
// Size: 0x226
function function_8debcb6(origin) {
    objective_delete(level.var_b167ae9a);
    trigger = spawn("trigger_radius_new", origin, 0, 90, 100);
    trigger triggerignoreteam();
    useobj = gameobjects::create_use_object(#"none", trigger, [], (0, 0, 0), #"hash_7e7657e9c8f441eb");
    useobj gameobjects::set_visible_team(#"any");
    useobj gameobjects::allow_use(#"any");
    useobj gameobjects::set_owner_team(#"neutral");
    useobj gameobjects::set_use_time(level.bountydepositsitecapturetime);
    useobj gameobjects::set_key_object(level.var_7e7897b8);
    useobj gameobjects::set_onbeginuse_event(&function_9ef02b1b);
    useobj gameobjects::set_onuse_event(&function_37e1bbbf);
    useobj gameobjects::function_3510971a(1);
    useobj gameobjects::function_1b4d64d8(1);
    useobj function_d8151863(origin);
    useobj.onuseupdate = &onuseupdate;
    useobj.decayprogress = level.decayprogress;
    useobj.autodecaytime = level.autodecaytime;
    useobj.cancontestclaim = 0;
    return useobj;
}

// Namespace bounty/bounty
// Params 2, eflags: 0x0
// Checksum 0x5b4c2fa9, Offset: 0x6660
// Size: 0x128
function function_a800815(victim, attacker) {
    if (isdefined(level.var_7e7897b8) && (isdefined(level.var_7e7897b8.carrier) && level.var_7e7897b8.carrier == victim || isdefined(victim.var_ea1458aa) && isdefined(victim.var_ea1458aa.var_cba684c2) && victim.var_ea1458aa.var_cba684c2[level.var_7e7897b8 getentitynumber()] === 1)) {
        if (isdefined(level.var_ad7774db) && isdefined(level.var_ad7774db.trigger) && victim istouching(level.var_ad7774db.trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace bounty/bounty
// Params 3, eflags: 0x0
// Checksum 0x70536d06, Offset: 0x6790
// Size: 0x54
function onuseupdate(team, progress, change) {
    if (change > 0) {
        self gameobjects::set_flags(team == "allies" ? 1 : 2);
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x0
// Checksum 0xb9815fd4, Offset: 0x67f0
// Size: 0xc4
function function_d8151863(origin) {
    useobj = self;
    useobj function_ee4574b1();
    fwd = (0, 0, 1);
    right = (0, -1, 0);
    useobj.fx = spawnfx(#"ui/fx_dom_marker_team_r90", origin, fwd, right);
    useobj.fx.team = #"none";
    triggerfx(useobj.fx, 0.001);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x277cb57e, Offset: 0x68c0
// Size: 0x3c
function function_ee4574b1() {
    useobj = self;
    if (isdefined(useobj.fx)) {
        useobj.fx delete();
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x0
// Checksum 0xea9ff9f2, Offset: 0x6908
// Size: 0xcc
function function_99e2da8b(origin) {
    useobj = self;
    useobj.origin = origin;
    useobj gameobjects::clear_progress();
    useobj gameobjects::set_visible_team(#"any");
    useobj gameobjects::allow_use(#"any");
    useobj gameobjects::set_owner_team(#"neutral");
    useobj gameobjects::set_model_visibility(1);
    useobj function_d8151863(origin);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x83d69b22, Offset: 0x69e0
// Size: 0x84
function function_572ce431() {
    useobj = self;
    useobj gameobjects::set_visible_team(#"none");
    useobj gameobjects::allow_use(#"none");
    useobj gameobjects::set_model_visibility(0);
    useobj function_ee4574b1();
}

// Namespace bounty/bounty
// Params 1, eflags: 0x0
// Checksum 0xb02e2cb8, Offset: 0x6a70
// Size: 0x1fc
function function_37e1bbbf(player) {
    if (!isdefined(player)) {
        return;
    }
    if (game.state != "playing") {
        return;
    }
    useobj = self;
    useobj notify(#"hash_5677d0c5246418e5");
    useobj function_572ce431();
    player playsoundtoplayer(#"hash_19f756f885db9bb8", player);
    [[ level.var_37d62931 ]](player, 1);
    player.pers[#"objscore"]++;
    player.objscore = player.pers[#"objscore"];
    level thread popups::displayteammessagetoall(#"hash_6bea5c334a4ab164", player);
    level function_c04436fc();
    team = player getteam();
    if (isdefined(team) && level.alivecount[team] === 1) {
        otherteam = util::getotherteam(team);
        var_b3db754a = isdefined(level.alivecount[otherteam]) ? level.alivecount[otherteam] : 0;
        if (var_b3db754a > 0) {
            player stats::function_dad108fa(#"hash_55f8a59c6d7132a8", 1);
        }
    }
    function_36f8016e(team, 1);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x7eb73a7b, Offset: 0x6c78
// Size: 0x114
function private function_9ef02b1b(sentient) {
    useobj = self;
    player = sentient;
    if (!isplayer(player)) {
        player = sentient.owner;
    }
    var_6f002c17 = player getteam();
    if (!isdefined(level.var_d7076fb6) || gettime() > level.var_d7076fb6) {
        level.var_d7076fb6 = gettime() + 1000;
        thread globallogic_audio::leader_dialog("bountyCashDepositingFriendly", var_6f002c17);
        thread globallogic_audio::leader_dialog("bountyCashDepositingEnemy", util::getotherteam(var_6f002c17));
    }
    function_bd4536a2(level.var_5ae8f1c7, var_6f002c17);
}

// Namespace bounty/bounty
// Params 2, eflags: 0x4
// Checksum 0x80c3ce9b, Offset: 0x6d98
// Size: 0x54
function private function_bd4536a2(var_e70389e, var_d89c1031) {
    if (!isdefined(var_e70389e)) {
        return;
    }
    if (var_d89c1031 != var_e70389e gameobjects::get_owner_team()) {
        var_e70389e gameobjects::set_owner_team(var_d89c1031);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xb9a5df20, Offset: 0x6df8
// Size: 0x2c
function private function_17debb33() {
    waitframe(1);
    pickup_health::function_e963e37d();
    pickup_ammo::function_cff1656d();
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0xad0cc2da, Offset: 0x6e30
// Size: 0x2cc
function private function_bdba96e1() {
    waitframe(1);
    droplocations = struct::get_array("bounty_drop", "variantname");
    droppoint = droplocations[randomint(droplocations.size)].origin;
    droppoint += (0, 0, 2000);
    startpoint = helicopter::getvalidrandomstartnode(droppoint).origin;
    startpoint = (startpoint[0], startpoint[1], droppoint[2]);
    timer = randomintrange(level.var_8e8e80c6, level.var_374a483e);
    wait(timer);
    supplydropveh = spawnvehicle(#"vehicle_t8_mil_helicopter_transport_mp", startpoint, vectortoangles(vectornormalize(droppoint - startpoint)));
    supplydropveh.goalradius = 128;
    supplydropveh.goalheight = 128;
    if (!isdefined(supplydropveh)) {
        return;
    }
    supplydropveh setspeed(100);
    supplydropveh setrotorspeed(1);
    supplydropveh setcandamage(0);
    supplydropveh vehicle::toggle_tread_fx(1);
    supplydropveh vehicle::toggle_exhaust_fx(1);
    supplydropveh vehicle::toggle_sounds(1);
    supplydrop = spawn("script_model", (0, 0, 0));
    supplydrop setmodel("wpn_t7_drop_box_wz");
    supplydrop linkto(supplydropveh, "tag_cargo_attach", (0, 0, -30));
    supplydropveh.supplydrop = supplydrop;
    supplydropveh function_a57c34b7(droppoint, 1, 0);
    supplydropveh thread function_6d1352cb(droppoint);
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0xa5dd5931, Offset: 0x7108
// Size: 0x194
function private function_6d1352cb(droppoint) {
    self endon(#"death");
    exitpoint = droppoint + droppoint - self.origin;
    while (true) {
        waitframe(1);
        currdist = distancesquared(self.origin, droppoint);
        if (currdist < 225 * 225) {
            self setspeed(0);
            self.supplydrop unlink();
            self.supplydrop moveto(droppoint - (0, 0, 1990), 2);
            self.supplydrop playsound("evt_supply_drop");
            self.supplydrop thread function_9ec1d15();
            self.supplydrop = undefined;
            self setspeed(100);
            break;
        }
    }
    self function_a57c34b7(exitpoint);
    timeout = distance(self.origin, exitpoint) / 1000;
    wait(timeout);
    self delete();
}

// Namespace bounty/bounty
// Params 0, eflags: 0x4
// Checksum 0x2c6f1281, Offset: 0x72a8
// Size: 0x1dc
function private function_9ec1d15() {
    wait(2.01);
    self physicslaunch();
    self waittill(#"stationary");
    self.trigger = spawn("trigger_radius_use", self.origin, 0, 100, 60);
    self.trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
    self.trigger triggerignoreteam();
    self.gameobject = gameobjects::create_use_object(#"neutral", self.trigger, [], (0, 0, 60), "bounty_drop", 1);
    self.gameobject gameobjects::set_objective_entity(self.gameobject);
    self.gameobject gameobjects::set_visible_team(#"any");
    self.gameobject gameobjects::allow_use(#"any");
    self.gameobject gameobjects::set_use_time(1.5);
    self.gameobject.onenduse = &function_d4a84cde;
    self.gameobject.usecount = 0;
    self.gameobject.var_5ecd70 = self;
    thread globallogic_audio::leader_dialog("bountyAirdropDetected");
}

// Namespace bounty/bounty
// Params 3, eflags: 0x4
// Checksum 0xdc8f375c, Offset: 0x7490
// Size: 0x1ce
function private function_d4a84cde(team, player, result) {
    self.isdisabled = 0;
    if (isdefined(result) && result && isdefined(player) && isplayer(player)) {
        self.usecount++;
        player function_3a77006e(level.var_860cdbdb, "moneychange_bountydrop");
        player pickup_health::function_dd4bf8ac(level.var_a2b93ad3);
        weapons = player getweaponslist();
        foreach (weapon in weapons) {
            player givestartammo(weapon);
        }
        player playsoundtoplayer(#"hash_19f756f885db9bb8", player);
        self gameobjects::hide_waypoint(player);
        self.trigger setinvisibletoplayer(player);
        if (self.usecount >= level.var_854eeded) {
            self gameobjects::disable_object(1);
            return;
        }
    }
}

// Namespace bounty/bounty
// Params 2, eflags: 0x0
// Checksum 0xa8d4ae31, Offset: 0x7668
// Size: 0x14c
function function_3a77006e(amount, reason) {
    if (!isdefined(self.pers[#"money"]) || self laststand_mp::is_cheating()) {
        return;
    }
    self.pers[#"money"] = self.pers[#"money"] + amount;
    self.pers[#"money_earned"] = self.pers[#"money_earned"] + amount;
    [[ level._setplayerscore ]](self, self.pers[#"money_earned"]);
    self clientfield::set_to_player("bountyMoney", self.pers[#"money"]);
    bb::function_95a5b5c2(reason, "", self.team, self.origin, self);
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x15a04c2, Offset: 0x77c0
// Size: 0x52
function pause_time() {
    if (level.timepauseswheninzone && !(isdefined(level.timerpaused) && level.timerpaused)) {
        globallogic_utils::pausetimer();
        level.timerpaused = 1;
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x601cdd99, Offset: 0x7820
// Size: 0x52
function resume_time() {
    if (level.timepauseswheninzone && isdefined(level.timerpaused) && level.timerpaused) {
        globallogic_utils::resumetimer();
        level.timerpaused = 0;
    }
}

/#

    // Namespace bounty/bounty
    // Params 0, eflags: 0x0
    // Checksum 0x5ef1cbb9, Offset: 0x7880
    // Size: 0xfc
    function function_b1dcb019() {
        path = "bounty_drop";
        cmd = "<unknown string>";
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
    }

    // Namespace bounty/bounty
    // Params 0, eflags: 0x0
    // Checksum 0xb9e10376, Offset: 0x7988
    // Size: 0x168
    function function_b968a61c() {
        level notify(#"hash_7069fa0a73642e1f");
        level endon(#"hash_7069fa0a73642e1f");
        wait(1);
        function_b1dcb019();
        wait(1);
        while (true) {
            wait(0.25);
            var_9b37b387 = getdvarint(#"hash_312d65fd43c7008c", 0);
            if (var_9b37b387 <= 0) {
                continue;
            }
            player = level.players[0];
            if (isplayer(player)) {
                player.pers[#"money"] = player.pers[#"money"] + var_9b37b387;
                player clientfield::set_to_player("<unknown string>", player.pers[#"money"]);
            }
            setdvar(#"hash_312d65fd43c7008c", 0);
        }
    }

#/
