// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/outcome.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/globallogic_utils.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/sound_shared.gsc;
#include scripts/core_common/music_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/audio_shared.gsc;

#namespace globallogic_audio;

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x2
// Checksum 0x7a15a9b1, Offset: 0x608
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"globallogic_audio", &__init__, undefined, undefined);
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x74501f25, Offset: 0x650
// Size: 0xac
function __init__() {
    callback::on_start_gametype(&init);
    level.playleaderdialogonplayer = &leader_dialog_on_player;
    level.var_57e2bc08 = &leader_dialog;
    level.playequipmentdestroyedonplayer = &play_equipment_destroyed_on_player;
    level.var_8a2b539f = &play_equipment_hacked_on_player;
    setdvar(#"hash_2fd9eb199c2ef1cf", 0.4);
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0xc444dd6c, Offset: 0x708
// Size: 0x7fa
function init() {
    game.music[#"defeat"] = "mus_defeat";
    game.music[#"victory_spectator"] = "mus_defeat";
    game.music[#"winning"] = "mus_time_running_out_winning";
    game.music[#"losing"] = "mus_time_running_out_losing";
    game.music[#"match_end"] = "mus_match_end";
    game.music[#"victory_tie"] = "mus_defeat";
    game.music[#"spawn_short"] = "SPAWN_SHORT";
    game.music[#"suspense"] = [];
    game.music[#"suspense"][game.music[#"suspense"].size] = "mus_suspense_01";
    game.music[#"suspense"][game.music[#"suspense"].size] = "mus_suspense_02";
    game.music[#"suspense"][game.music[#"suspense"].size] = "mus_suspense_03";
    game.music[#"suspense"][game.music[#"suspense"].size] = "mus_suspense_04";
    game.music[#"suspense"][game.music[#"suspense"].size] = "mus_suspense_05";
    game.music[#"suspense"][game.music[#"suspense"].size] = "mus_suspense_06";
    level callback::function_d8abfc3d(#"on_end_game", &on_end_game);
    level.multipledialogkeys = [];
    level.multipledialogkeys[#"enemyaitank"] = "enemyAiTankMultiple";
    level.multipledialogkeys[#"enemysupplydrop"] = "enemySupplyDropMultiple";
    level.multipledialogkeys[#"enemycombatrobot"] = "enemyCombatRobotMultiple";
    level.multipledialogkeys[#"enemycounteruav"] = "enemyCounterUavMultiple";
    level.multipledialogkeys[#"enemydart"] = "enemyDartMultiple";
    level.multipledialogkeys[#"enemyemp"] = "enemyEmpMultiple";
    level.multipledialogkeys[#"enemymicrowaveturret"] = "enemyMicrowaveTurretMultiple";
    level.multipledialogkeys[#"enemyrcbomb"] = "enemyRcBombMultiple";
    level.multipledialogkeys[#"enemyplanemortar"] = "enemyPlaneMortarMultiple";
    level.multipledialogkeys[#"enemyhelicoptergunner"] = "enemyHelicopterGunnerMultiple";
    level.multipledialogkeys[#"enemyraps"] = "enemyRapsMultiple";
    level.multipledialogkeys[#"enemydronestrike"] = "enemyDroneStrikeMultiple";
    level.multipledialogkeys[#"enemyturret"] = "enemyTurretMultiple";
    level.multipledialogkeys[#"enemyhelicopter"] = "enemyHelicopterMultiple";
    level.multipledialogkeys[#"enemyuav"] = "enemyUavMultiple";
    level.multipledialogkeys[#"enemysatellite"] = "enemySatelliteMultiple";
    level.multipledialogkeys[#"friendlyaitank"] = "";
    level.multipledialogkeys[#"friendlysupplydrop"] = "";
    level.multipledialogkeys[#"friendlycombatrobot"] = "";
    level.multipledialogkeys[#"friendlycounteruav"] = "";
    level.multipledialogkeys[#"friendlydart"] = "";
    level.multipledialogkeys[#"friendlyemp"] = "";
    level.multipledialogkeys[#"friendlymicrowaveturret"] = "";
    level.multipledialogkeys[#"friendlyrcbomb"] = "";
    level.multipledialogkeys[#"friendlyplanemortar"] = "";
    level.multipledialogkeys[#"friendlyhelicoptergunner"] = "";
    level.multipledialogkeys[#"friendlyraps"] = "";
    level.multipledialogkeys[#"friendlydronestrike"] = "";
    level.multipledialogkeys[#"friendlyturret"] = "";
    level.multipledialogkeys[#"friendlyhelicopter"] = "";
    level.multipledialogkeys[#"friendlyuav"] = "";
    level.multipledialogkeys[#"friendlysatellite"] = "";
}

// Namespace globallogic_audio/globallogic_audio
// Params 2, eflags: 0x1 linked
// Checksum 0x25348645, Offset: 0xf10
// Size: 0x2ba
function function_6e084fd3(var_37ecca7, taacombundle) {
    bundlename = undefined;
    switch (var_37ecca7) {
    case #"tank_robot":
        bundlename = taacombundle.aitankdialogbundle;
        break;
    case #"counteruav":
        bundlename = taacombundle.counteruavdialogbundle;
        break;
    case #"dart":
        bundlename = taacombundle.dartdialogbundle;
        break;
    case #"drone_squadron":
        bundlename = taacombundle.var_69a9ca12;
        break;
    case #"ac130":
        bundlename = taacombundle.var_71693229;
        break;
    case #"helicopter_comlink":
        bundlename = taacombundle.helicopterdialogbundle;
        break;
    case #"overwatch_helicopter":
        bundlename = taacombundle.var_f8bd3ac5;
        break;
    case #"hash_59687845e5356ded":
        bundlename = taacombundle.var_4062b33e;
        break;
    case #"planemortar":
        bundlename = taacombundle.planemortardialogbundle;
        break;
    case #"recon_car":
        bundlename = taacombundle.rcbombdialogbundle;
        break;
    case #"remote_missile":
        bundlename = taacombundle.remotemissiledialogbundle;
        break;
    case #"straferun":
        bundlename = taacombundle.var_66389705;
        break;
    case #"supply_drop":
        bundlename = taacombundle.supplydropdialogbundle;
        break;
    case #"swat_team":
        bundlename = taacombundle.var_d93fd150;
        break;
    case #"uav":
        bundlename = taacombundle.uavdialogbundle;
        break;
    case #"ultimate_turret":
        bundlename = taacombundle.var_c9b104f1;
        break;
    default:
        break;
    }
    if (!isdefined(bundlename)) {
        return;
    }
    killstreakbundle = struct::get_script_bundle("mpdialog_scorestreak", bundlename);
    return killstreakbundle;
}

// Namespace globallogic_audio/globallogic_audio
// Params 6, eflags: 0x1 linked
// Checksum 0x23d02350, Offset: 0x11d8
// Size: 0xc6
function set_leader_gametype_dialog(startgamedialogkey, starthcgamedialogkey, offenseorderdialogkey, defenseorderdialogkey, var_2888cc9d, var_826b3c1a) {
    level.leaderdialog = spawnstruct();
    level.leaderdialog.startgamedialog = startgamedialogkey;
    level.leaderdialog.var_f6fda321 = var_2888cc9d;
    level.leaderdialog.starthcgamedialog = starthcgamedialogkey;
    level.leaderdialog.var_d04b3734 = var_826b3c1a;
    level.leaderdialog.offenseorderdialog = offenseorderdialogkey;
    level.leaderdialog.defenseorderdialog = defenseorderdialogkey;
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x769dc38a, Offset: 0x12a8
// Size: 0x1c
function function_5e0a6842() {
    leader_dialog("roundSwitchSides");
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x682bd8f0, Offset: 0x12d0
// Size: 0x1c
function function_dfd17bd3() {
    leader_dialog("roundHalftime");
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0xf82bd0f0, Offset: 0x12f8
// Size: 0x1c4
function announce_round_winner(delay) {
    if (delay > 0) {
        wait(delay);
    }
    winner = round::get_winner();
    if (!isdefined(winner) || isplayer(winner)) {
        return;
    }
    if (isdefined(level.teams[winner])) {
        if (level.gametype === "bounty" && round::function_3624d032() === 1) {
            leader_dialog("bountyRoundEncourageWon", winner);
            leader_dialog_for_other_teams("bountyRoundEncourageLost", winner);
        } else {
            leader_dialog("roundEncourageWon", winner);
            leader_dialog_for_other_teams("roundEncourageLost", winner);
        }
    } else {
        foreach (team, _ in level.teams) {
            thread sound::play_on_players("mus_round_draw" + "_" + level.teampostfix[team]);
        }
        leader_dialog("roundDraw");
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0xc2366958, Offset: 0x14c8
// Size: 0xe4
function announce_game_winner(outcome) {
    wait(battlechatter::mpdialog_value("announceWinnerDelay", 0));
    if (level.teambased) {
        if (outcome::get_flag(outcome, "tie") || !match::function_c10174e7()) {
            leader_dialog("gameDraw");
        } else {
            leader_dialog("gameWon", outcome::get_winner(outcome));
            leader_dialog_for_other_teams("gameLost", outcome::get_winner(outcome));
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0x64764e1d, Offset: 0x15b8
// Size: 0xc
function function_57678746(outcome) {
    
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0x466ee563, Offset: 0x15d0
// Size: 0x9c
function function_6374b97e(tie) {
    if (tie) {
        self set_music_on_player("matchDraw");
    } else if (match::function_a2b53e17(self)) {
        self set_music_on_player("matchWin");
    } else if (!level.splitscreen) {
        self set_music_on_player("matchLose");
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x6f153a47, Offset: 0x1678
// Size: 0x80
function flush_dialog() {
    foreach (player in level.players) {
        player flush_dialog_on_player();
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x1c510760, Offset: 0x1700
// Size: 0x56
function flush_dialog_on_player() {
    if (!isdefined(self.leaderdialogqueue)) {
        self.leaderdialogqueue = [];
    }
    self.currentleaderdialog = undefined;
    if (!isdefined(self.killstreakdialogqueue)) {
        self.killstreakdialogqueue = [];
    }
    self.scorestreakdialogplaying = 0;
    self notify(#"flush_dialog");
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0xc2b8147f, Offset: 0x1760
// Size: 0x96
function flush_killstreak_dialog_on_player(killstreakid) {
    if (!isdefined(killstreakid) || !isdefined(self.killstreakdialogqueue)) {
        return;
    }
    for (i = self.killstreakdialogqueue.size - 1; i >= 0; i--) {
        if (killstreakid === self.killstreakdialogqueue[i].killstreakid) {
            arrayremoveindex(self.killstreakdialogqueue, i);
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x0
// Checksum 0x26f78e22, Offset: 0x1800
// Size: 0x9e
function function_fd32b1bd(killstreaktype) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(killstreaktype) || !isdefined(self.killstreakdialogqueue)) {
        return;
    }
    for (i = self.killstreakdialogqueue.size - 1; i >= 0; i--) {
        if (killstreaktype === self.killstreakdialogqueue[i].killstreaktype) {
            arrayremoveindex(self.killstreakdialogqueue, i);
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x0
// Checksum 0xc745f1d7, Offset: 0x18a8
// Size: 0x88
function flush_objective_dialog(objectivekey) {
    foreach (player in level.players) {
        player flush_objective_dialog_on_player(objectivekey);
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0x506261c5, Offset: 0x1938
// Size: 0x9a
function flush_objective_dialog_on_player(objectivekey) {
    if (!isdefined(objectivekey) || !isdefined(self.leaderdialogqueue)) {
        return;
    }
    for (i = self.leaderdialogqueue.size - 1; i >= 0; i--) {
        if (objectivekey === self.leaderdialogqueue[i].objectivekey) {
            arrayremoveindex(self.leaderdialogqueue, i);
            break;
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x0
// Checksum 0x9c0027ea, Offset: 0x19e0
// Size: 0x88
function flush_leader_dialog_key(dialogkey) {
    foreach (player in level.players) {
        player flush_leader_dialog_key_on_player(dialogkey);
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0x5d800dd9, Offset: 0x1a70
// Size: 0x8e
function flush_leader_dialog_key_on_player(dialogkey) {
    if (!isdefined(dialogkey)) {
        return;
    }
    if (!isdefined(self.leaderdialogqueue)) {
        return;
    }
    for (i = self.leaderdialogqueue.size - 1; i >= 0; i--) {
        if (dialogkey === self.leaderdialogqueue[i].dialogkey) {
            arrayremoveindex(self.leaderdialogqueue, i);
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 7, eflags: 0x1 linked
// Checksum 0x377ce410, Offset: 0x1b08
// Size: 0x6c
function play_taacom_dialog(dialogkey, killstreaktype, killstreakid, var_46bd7973, var_8a6b001a, weapon, priority) {
    self killstreak_dialog_on_player(dialogkey, killstreaktype, killstreakid, undefined, var_46bd7973, var_8a6b001a, weapon, priority);
}

// Namespace globallogic_audio/globallogic_audio
// Params 8, eflags: 0x1 linked
// Checksum 0x351fde93, Offset: 0x1b80
// Size: 0x1d4
function killstreak_dialog_on_player(dialogkey, killstreaktype, killstreakid, pilotindex, var_46bd7973, var_8a6b001a, weapon, priority) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.killstreakdialogqueue)) {
        return;
    }
    if (!isdefined(dialogkey)) {
        return;
    }
    if (!level.allowannouncer) {
        return;
    }
    if (level.gameended) {
        return;
    }
    newdialog = spawnstruct();
    newdialog.dialogkey = dialogkey;
    newdialog.killstreaktype = killstreaktype;
    newdialog.pilotindex = pilotindex;
    newdialog.killstreakid = killstreakid;
    newdialog.var_46bd7973 = var_46bd7973;
    newdialog.var_8a6b001a = var_8a6b001a;
    newdialog.weapon = weapon;
    if (priority === 1) {
        arrayinsert(self.killstreakdialogqueue, newdialog, 0);
    } else {
        self.killstreakdialogqueue[self.killstreakdialogqueue.size] = newdialog;
    }
    if (self.killstreakdialogqueue.size > 1 || isdefined(self.currentkillstreakdialog)) {
        return;
    }
    if (self.playingdialog === 1 && dialogkey == "arrive") {
        self thread wait_for_player_dialog();
    } else {
        self thread play_next_killstreak_dialog();
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x5a998354, Offset: 0x1d60
// Size: 0x6c
function wait_for_player_dialog() {
    self endon(#"disconnect", #"flush_dialog");
    level endon(#"game_ended");
    while (self.playingdialog) {
        wait(0.5);
    }
    self thread play_next_killstreak_dialog();
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x97f12c48, Offset: 0x1dd8
// Size: 0x38c
function play_next_killstreak_dialog() {
    self endon(#"disconnect", #"flush_dialog");
    level endon(#"game_ended");
    if (self.killstreakdialogqueue.size == 0) {
        self.currentkillstreakdialog = undefined;
        return;
    }
    if (isdefined(self.pers[#"mptaacom"])) {
        taacombundle = struct::get_script_bundle("mpdialog_taacom", self.pers[#"mptaacom"]);
    } else {
        self.killstreakdialogqueue = [];
        self.currentkillstreakdialog = undefined;
        return;
    }
    dialogalias = undefined;
    while (!isdefined(dialogalias) && self.killstreakdialogqueue.size > 0) {
        nextdialog = self.killstreakdialogqueue[0];
        arrayremoveindex(self.killstreakdialogqueue, 0);
        if (isdefined(nextdialog.killstreaktype)) {
            if (isdefined(nextdialog.pilotindex)) {
                pilotarray = taacombundle.pilotbundles[nextdialog.killstreaktype];
                if (isdefined(pilotarray) && nextdialog.pilotindex < pilotarray.size) {
                    killstreakbundle = struct::get_script_bundle("mpdialog_scorestreak", pilotarray[nextdialog.pilotindex]);
                    if (isdefined(killstreakbundle)) {
                        dialogalias = get_dialog_bundle_alias(killstreakbundle, nextdialog.dialogkey);
                    }
                }
            } else if (isdefined(nextdialog.killstreaktype)) {
                killstreakbundle = function_6e084fd3(nextdialog.killstreaktype, taacombundle);
                if (isdefined(killstreakbundle)) {
                    dialogalias = self get_dialog_bundle_alias(killstreakbundle, nextdialog.dialogkey);
                }
            }
        } else {
            dialogalias = self get_dialog_bundle_alias(taacombundle, nextdialog.dialogkey);
        }
    }
    if (!isdefined(dialogalias)) {
        self.currentkillstreakdialog = undefined;
        return;
    }
    waittime = 0;
    if (isdefined(nextdialog.var_46bd7973) && isdefined(nextdialog.var_8a6b001a) && isalive(nextdialog.var_8a6b001a)) {
        waittime = waittime + battlechatter::mpdialog_value("taacomHackAndReplyDialogBuffer", 0);
        self thread function_30f16f29(nextdialog.var_46bd7973, nextdialog.var_8a6b001a, nextdialog.weapon);
    } else {
        self playlocalsound(dialogalias);
        waittime = waittime + battlechatter::mpdialog_value("killstreakDialogBuffer", 0);
    }
    self.currentkillstreakdialog = nextdialog;
    self thread wait_next_killstreak_dialog(waittime);
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0xec603e0, Offset: 0x2170
// Size: 0x5c
function wait_next_killstreak_dialog(waittime) {
    self endon(#"disconnect", #"flush_dialog");
    level endon(#"game_ended");
    wait(waittime);
    self thread play_next_killstreak_dialog();
}

// Namespace globallogic_audio/globallogic_audio
// Params 3, eflags: 0x1 linked
// Checksum 0x8ddc32b7, Offset: 0x21d8
// Size: 0x64
function function_30f16f29(var_46bd7973, var_8a6b001a, weapon) {
    if (isdefined(var_8a6b001a) && isalive(var_8a6b001a)) {
        var_8a6b001a function_18aba49d(var_46bd7973, weapon, self);
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 5, eflags: 0x1 linked
// Checksum 0x9e958abd, Offset: 0x2248
// Size: 0xe0
function leader_dialog_for_other_teams(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey) {
    /#
        assert(isdefined(skipteam));
    #/
    foreach (team, _ in level.teams) {
        if (team != skipteam) {
            leader_dialog(dialogkey, team, undefined, objectivekey, killstreakid, dialogbufferkey);
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 6, eflags: 0x1 linked
// Checksum 0x98567c30, Offset: 0x2330
// Size: 0x160
function leader_dialog(dialogkey, team, excludelist, objectivekey, killstreakid, dialogbufferkey) {
    /#
        assert(isdefined(level.players));
    #/
    foreach (player in level.players) {
        if (!isdefined(player.pers[#"team"])) {
            continue;
        }
        if (isdefined(team) && team != player.pers[#"team"]) {
            continue;
        }
        if (isdefined(excludelist) && globallogic_utils::isexcluded(player, excludelist)) {
            continue;
        }
        player leader_dialog_on_player(dialogkey, objectivekey, killstreakid, dialogbufferkey);
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 5, eflags: 0x1 linked
// Checksum 0xc4548117, Offset: 0x2498
// Size: 0x3c4
function leader_dialog_on_player(dialogkey, objectivekey, killstreakid, dialogbufferkey, introdialog) {
    if (!isdefined(dialogkey)) {
        return;
    }
    if (!level.allowannouncer) {
        return;
    }
    if (!(isdefined(self.playleaderdialog) && self.playleaderdialog) && !(isdefined(introdialog) && introdialog)) {
        return;
    }
    self flush_objective_dialog_on_player(objectivekey);
    if (!isdefined(self.leaderdialogqueue)) {
        self.leaderdialogqueue = [];
    }
    if (self.leaderdialogqueue.size == 0 && isdefined(self.currentleaderdialog) && isdefined(objectivekey) && self.currentleaderdialog.objectivekey === objectivekey && self.currentleaderdialog.dialogkey == dialogkey) {
        return;
    }
    if (isdefined(killstreakid)) {
        foreach (item in self.leaderdialogqueue) {
            if (item.dialogkey == dialogkey) {
                item.killstreakids[item.killstreakids.size] = killstreakid;
                return;
            }
        }
        if (self.leaderdialogqueue.size == 0 && isdefined(self.currentleaderdialog) && self.currentleaderdialog.dialogkey == dialogkey) {
            if (self.currentleaderdialog.playmultiple === 1) {
                return;
            }
            playmultiple = 1;
        }
    }
    newitem = spawnstruct();
    newitem.priority = dialogkey_priority(dialogkey);
    newitem.dialogkey = dialogkey;
    newitem.multipledialogkey = level.multipledialogkeys[dialogkey];
    newitem.playmultiple = playmultiple;
    newitem.objectivekey = objectivekey;
    if (isdefined(killstreakid)) {
        newitem.killstreakids = [];
        newitem.killstreakids[0] = killstreakid;
    }
    newitem.dialogbufferkey = dialogbufferkey;
    iteminserted = 0;
    if (isdefined(newitem.priority)) {
        for (i = 0; i < self.leaderdialogqueue.size; i++) {
            if (isdefined(self.leaderdialogqueue[i].priority) && self.leaderdialogqueue[i].priority <= newitem.priority) {
                continue;
            }
            arrayinsert(self.leaderdialogqueue, newitem, i);
            iteminserted = 1;
            break;
        }
    }
    if (!iteminserted) {
        self.leaderdialogqueue[self.leaderdialogqueue.size] = newitem;
    }
    if (isdefined(self.currentleaderdialog)) {
        return;
    }
    self thread play_next_leader_dialog();
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0xb3b31b0e, Offset: 0x2868
// Size: 0x2b4
function play_next_leader_dialog() {
    self endon(#"disconnect", #"flush_dialog");
    level endon(#"game_ended");
    if (!isdefined(self.leaderdialogqueue) || self.leaderdialogqueue.size == 0) {
        self.currentleaderdialog = undefined;
        return;
    }
    nextdialog = self.leaderdialogqueue[0];
    arrayremoveindex(self.leaderdialogqueue, 0);
    dialogkey = nextdialog.dialogkey;
    if (isdefined(nextdialog.killstreakids)) {
        triggeredcount = 0;
        foreach (killstreakid in nextdialog.killstreakids) {
            if (isdefined(level.killstreaks_triggered[killstreakid])) {
                triggeredcount++;
            }
        }
        if (triggeredcount == 0) {
            self thread play_next_leader_dialog();
            return;
        } else if (triggeredcount > 1 || nextdialog.playmultiple === 1) {
            if (isdefined(level.multipledialogkeys[dialogkey])) {
                dialogkey = level.multipledialogkeys[dialogkey];
            }
        }
    }
    if (dialogkey === "gamePlayerKicked") {
        self function_18aba49d(2);
    } else {
        dialogalias = self get_commander_dialog_alias(dialogkey);
        if (!isdefined(dialogalias)) {
            self thread play_next_leader_dialog();
            return;
        }
        self playlocalsound(dialogalias);
    }
    nextdialog.playtime = gettime();
    self.currentleaderdialog = nextdialog;
    dialogbuffer = battlechatter::mpdialog_value(nextdialog.dialogbufferkey, battlechatter::mpdialog_value("commanderDialogBuffer", 0));
    self thread wait_next_leader_dialog(dialogbuffer);
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0xf90bbd5f, Offset: 0x2b28
// Size: 0x5c
function wait_next_leader_dialog(dialogbuffer) {
    self endon(#"disconnect", #"flush_dialog");
    level endon(#"game_ended");
    wait(dialogbuffer);
    self thread play_next_leader_dialog();
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0x4a98b65, Offset: 0x2b90
// Size: 0x6a4
function dialogkey_priority(dialogkey) {
    switch (dialogkey) {
    case #"enemydronestrikemultiple":
    case #"enemyplanemortarmultiple":
    case #"enemyaitank":
    case #"enemydronestrike":
    case #"enemymicrowaveturretmultiple":
    case #"enemydart":
    case #"enemydartmultiple":
    case #"enemyremotemissile":
    case #"enemyplanemortar":
    case #"enemycombatrobotmultiple":
    case #"enemyrcbombmultiple":
    case #"enemyremotemissilemultiple":
    case #"enemyrapsmultiple":
    case #"enemyhelicoptergunner":
    case #"enemyrcbomb":
    case #"enemycombatrobot":
    case #"enemyhelicopter":
    case #"enemyturret":
    case #"enemyturretmultiple":
    case #"enemyhelicoptergunnermultiple":
    case #"enemyraps":
    case #"enemyplanemortarused":
    case #"enemyhelicoptermultiple":
    case #"enemymicrowaveturret":
    case #"enemyaitankmultiple":
        return 1;
    case #"roundencouragelastplayer":
    case #"gamelosing":
    case #"nearwinning":
    case #"gameleadlost":
    case #"nearlosing":
    case #"neardrawing":
    case #"gameleadtaken":
    case #"gamewinning":
        return 1;
    case #"upltheyuplink":
    case #"uplorders":
    case #"sfgrobotneedreboot":
    case #"domfriendlysecuredall":
    case #"hubsonline":
    case #"sfgstarttow":
    case #"sfgtheyreturn":
    case #"sfgrobotunderfire":
    case #"kothonline":
    case #"bombfriendlytaken":
    case #"ctffriendlyflagcaptured":
    case #"sfgrobotrebootedtowdefender":
    case #"hubmoved":
    case #"sfgrobotrebootedtowattacker":
    case #"uplweuplinkremote":
    case #"bombplanted":
    case #"uplreset":
    case #"sfgrobotrebooteddefender":
    case #"ctfenemyflagdropped":
    case #"sfgrobotunderfireneutral":
    case #"ctffriendlyflagdropped":
    case #"upltheydrop":
    case #"domenemyhasc":
    case #"kothcontested":
    case #"ctfenemyflagtaken":
    case #"domenemyhasb":
    case #"uplwedrop":
    case #"uplweuplink":
    case #"hubsoffline":
    case #"domenemysecureda":
    case #"domenemysecuredb":
    case #"domenemysecuredc":
    case #"domenemyhasa":
    case #"upltransferred":
    case #"sfgstarthrdefend":
    case #"upltheyuplinkremote":
    case #"ctfenemyflagreturned":
    case #"bombenemytaken":
    case #"uplwetake":
    case #"sfgstarthrattack":
    case #"sfgrobotclosedefender":
    case #"kothsecured":
    case #"sfgwereturn":
    case #"hubsmoved":
    case #"sfgstartattack":
    case #"ctfenemyflagcaptured":
    case #"sfgrobotdisabledattacker":
    case #"sfgrobotrebootedattacker":
    case #"hubonline":
    case #"sfgstartdefend":
    case #"ctffriendlyflagreturned":
    case #"ctffriendlyflagtaken":
    case #"upltheytake":
    case #"sfgrobotcloseattacker":
    case #"bombdefused":
    case #"huboffline":
    case #"domenemysecuringc":
    case #"sfgrobotdisableddefender":
    case #"domfriendlysecuredc":
    case #"domfriendlysecuredb":
    case #"domfriendlysecureda":
    case #"domenemysecuringb":
    case #"domenemysecuringa":
    case #"kothcaptured":
    case #"kothlocated":
    case #"kothlost":
    case #"bombfriendlydropped":
    case #"domfriendlysecuringb":
    case #"domfriendlysecuringc":
    case #"domfriendlysecuringa":
        return 1;
        break;
    }
    return undefined;
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x4b22e369, Offset: 0x3240
// Size: 0x24
function play_equipment_destroyed_on_player() {
    self play_taacom_dialog("equipmentDestroyed");
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0xa0a8d6bd, Offset: 0x3270
// Size: 0x24
function play_equipment_hacked_on_player() {
    self play_taacom_dialog("equipmentHacked");
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0x385457a3, Offset: 0x32a0
// Size: 0x7a
function get_commander_dialog_alias(dialogkey) {
    if (!isdefined(self.pers[#"mpcommander"])) {
        return undefined;
    }
    commanderbundle = struct::get_script_bundle("mpdialog_commander", self.pers[#"mpcommander"]);
    return get_dialog_bundle_alias(commanderbundle, dialogkey);
}

// Namespace globallogic_audio/globallogic_audio
// Params 2, eflags: 0x1 linked
// Checksum 0x28b0e6c2, Offset: 0x3328
// Size: 0x84
function get_dialog_bundle_alias(dialogbundle, dialogkey) {
    if (!isdefined(dialogbundle) || !isdefined(dialogkey)) {
        return undefined;
    }
    dialogalias = dialogbundle.(dialogkey);
    if (!isdefined(dialogalias)) {
        return;
    }
    voiceprefix = dialogbundle.("voiceprefix");
    if (isdefined(voiceprefix)) {
        dialogalias = voiceprefix + dialogalias;
    }
    return dialogalias;
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x1 linked
// Checksum 0xb92929d0, Offset: 0x33b8
// Size: 0xd4
function is_team_winning(checkteam) {
    score = game.stat[#"teamscores"][checkteam];
    foreach (team, _ in level.teams) {
        if (team != checkteam) {
            if (game.stat[#"teamscores"][team] >= score) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x57f6e58a, Offset: 0x3498
// Size: 0xc0
function announce_team_is_winning() {
    foreach (team, _ in level.teams) {
        if (is_team_winning(team)) {
            leader_dialog("gameWinning", team);
            leader_dialog_for_other_teams("gameLosing", team);
            return 1;
        }
    }
    return 0;
}

// Namespace globallogic_audio/globallogic_audio
// Params 2, eflags: 0x0
// Checksum 0x1cb9c5b5, Offset: 0x3560
// Size: 0xd6
function play_2d_on_team(alias, team) {
    /#
        assert(isdefined(level.players));
    #/
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team) {
            player playlocalsound(alias);
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 1, eflags: 0x0
// Checksum 0x54e1c77d, Offset: 0x3640
// Size: 0x2e
function get_round_switch_dialog(switchtype) {
    switch (switchtype) {
    case 2:
        return "roundHalftime";
    case 4:
        return "roundOvertime";
    default:
        return "roundSwitchSides";
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0xad8adee3, Offset: 0x36b8
// Size: 0x5c
function on_end_game() {
    level util::clientnotify("pm");
    level waittill(#"sfade");
    level util::clientnotify("pmf");
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x6212b761, Offset: 0x3720
// Size: 0x16c
function announcercontroller() {
    level endon(#"game_ended");
    level waittill(#"match_ending_soon");
    if (util::islastround() || util::isoneround()) {
        if (level.teambased) {
            if (!announce_team_is_winning()) {
                leader_dialog("min_draw");
            }
        }
        level waittill(#"match_ending_very_soon");
        foreach (team, _ in level.teams) {
            leader_dialog("roundTimeWarning", team, undefined, undefined);
        }
    } else {
        level waittill(#"match_ending_vox");
        leader_dialog("roundTimeWarning");
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x2a039bfd, Offset: 0x3898
// Size: 0x64
function sndmusicfunctions() {
    level thread sndmusictimesout();
    level thread sndmusichalfway();
    level thread sndmusictimelimitwatcher();
    level thread sndmusicunlock();
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x7a0e0dd8, Offset: 0x3908
// Size: 0xa6
function sndmusicsetrandomizer() {
    if (isdefined(level.var_30783ca9)) {
        level thread [[ level.var_30783ca9 ]]();
        return;
    }
    if (game.roundsplayed == 0) {
        game.musicset = randomintrange(1, 8);
        if (game.musicset <= 9) {
            game.musicset = "0" + game.musicset;
        }
        game.musicset = "_" + game.musicset;
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x4b032dbf, Offset: 0x39b8
// Size: 0x104
function sndmusicunlock() {
    level waittill(#"game_ended");
    unlockname = undefined;
    switch (game.musicset) {
    case #"_01":
        unlockname = "mus_dystopia_intro";
        break;
    case #"_02":
        unlockname = "mus_filter_intro";
        break;
    case #"_03":
        unlockname = "mus_immersion_intro";
        break;
    case #"_04":
        unlockname = "mus_ruin_intro";
        break;
    case #"_05":
        unlockname = "mus_cod_bites_intro";
        break;
    }
    if (isdefined(unlockname)) {
        level thread audio::unlockfrontendmusic(unlockname);
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0xbbfc0251, Offset: 0x3ac8
// Size: 0xac
function sndmusictimesout() {
    level endon(#"game_ended", #"musicendingoverride");
    level waittill(#"match_ending_very_soon");
    if (isdefined(level.gametype) && level.gametype == "sd") {
        level thread set_music_on_team("timeOutQuiet");
    } else {
        level thread set_music_on_team("timeOut");
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0x777dc260, Offset: 0x3b80
// Size: 0x74
function sndmusichalfway() {
    level endon(#"game_ended", #"match_ending_soon", #"match_ending_very_soon");
    level waittill(#"sndmusichalfway");
    level thread set_music_on_team("underscore");
}

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x1 linked
// Checksum 0xd3dcf8fb, Offset: 0x3c00
// Size: 0xfc
function sndmusictimelimitwatcher() {
    level endon(#"game_ended", #"match_ending_soon", #"match_ending_very_soon", #"sndmusichalfway");
    if (!isdefined(level.timelimit) || level.timelimit == 0) {
        return;
    }
    halfway = level.timelimit * 60 * 0.5;
    while (1) {
        timeleft = float(globallogic_utils::gettimeremaining()) / 1000;
        if (timeleft <= halfway) {
            level notify(#"sndmusichalfway");
            return;
        }
        wait(2);
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 5, eflags: 0x1 linked
// Checksum 0x3b81e367, Offset: 0x3d08
// Size: 0x198
function set_music_on_team(state, team = "both", wait_time = 0, save_state = 0, return_state = 0) {
    /#
        assert(isdefined(level.players));
    #/
    foreach (player in level.players) {
        if (team == "both") {
            player thread set_music_on_player(state, wait_time, save_state, return_state);
        } else if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team) {
            player thread set_music_on_player(state, wait_time, save_state, return_state);
        }
    }
}

// Namespace globallogic_audio/globallogic_audio
// Params 4, eflags: 0x1 linked
// Checksum 0xb363e462, Offset: 0x3ea8
// Size: 0x104
function set_music_on_player(state, wait_time = 0, save_state = 0, return_state = 0) {
    self endon(#"disconnect");
    /#
        assert(isplayer(self));
    #/
    if (!isdefined(state)) {
        return;
    }
    if (!isdefined(game.musicset)) {
        return;
    }
    if (sessionmodeiswarzonegame()) {
        return;
    }
    if (isdefined(level.var_903e2252) && level.var_903e2252) {
        return;
    }
    music::setmusicstate(state + game.musicset, self);
}

// Namespace globallogic_audio/globallogic_audio
// Params 4, eflags: 0x0
// Checksum 0x1cb7fd3e, Offset: 0x3fb8
// Size: 0xc4
function set_music_global(state, wait_time = 0, save_state = 0, return_state = 0) {
    if (!isdefined(state)) {
        return;
    }
    if (!isdefined(game.musicset)) {
        return;
    }
    if (isdefined(level.var_903e2252) && level.var_903e2252) {
        return;
    }
    if (sessionmodeiswarzonegame()) {
        return;
    }
    music::setmusicstate(state + game.musicset);
}

// Namespace globallogic_audio/globallogic_audio
// Params 2, eflags: 0x1 linked
// Checksum 0xd38ea1f0, Offset: 0x4088
// Size: 0x13c
function function_85818e24(var_9c1ed9ea, team) {
    if (!isdefined(game.musicset)) {
        return;
    }
    if (!isdefined(var_9c1ed9ea)) {
        return;
    }
    if (isdefined(team)) {
        foreach (player in level.players) {
            if (!isdefined(player.pers[#"team"])) {
                continue;
            }
            if (isdefined(team) && team != player.pers[#"team"]) {
                continue;
            }
            music::setmusicstate(var_9c1ed9ea + game.musicset, player);
        }
    } else {
        music::setmusicstate(var_9c1ed9ea + game.musicset);
    }
}

