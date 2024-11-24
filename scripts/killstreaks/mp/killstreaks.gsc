#using scripts\core_common\callbacks_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\system_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\mp\killstreak_vehicle;
#using scripts\killstreaks\mp\killstreakrules;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_score;

#namespace killstreaks;

// Namespace killstreaks/killstreaks
// Params 0, eflags: 0x2
// Checksum 0x71e62628, Offset: 0x128
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"killstreaks", &__init__, undefined, #"weapons");
}

// Namespace killstreaks/killstreaks
// Params 0, eflags: 0x0
// Checksum 0x9214c17e, Offset: 0x178
// Size: 0x96
function __init__() {
    init_shared();
    killstreak_vehicle::init();
    killstreakrules::init();
    callback::on_start_gametype(&init);
    level.var_1492d026 = &play_killstreak_start_dialog;
    level.var_bdff8e21 = getgametypesetting(#"hash_2560dae45cc112e3");
}

// Namespace killstreaks/killstreaks
// Params 0, eflags: 0x0
// Checksum 0x314d9de5, Offset: 0x218
// Size: 0x23c
function init() {
    /#
        level.killstreak_init_start_time = getmillisecondsraw();
        thread debug_ricochet_protection();
    #/
    function_447e6858();
    level.var_b0dc03c7 = &function_395f82d0;
    level.play_killstreak_firewall_being_hacked_dialog = &function_427f6a2e;
    level.play_killstreak_firewall_hacked_dialog = &function_6fa91236;
    level.play_killstreak_being_hacked_dialog = &function_1cd175ba;
    level.play_killstreak_hacked_dialog = &function_520a5752;
    level.play_killstreak_start_dialog = &function_7bed52a;
    level.play_pilot_dialog_on_owner = &function_9716fce9;
    level.play_pilot_dialog = &function_f6370f75;
    level.play_destroyed_dialog_on_owner = &function_6a5cc212;
    level.play_taacom_dialog_response_on_owner = &function_3cf68327;
    level.play_taacom_dialog = &function_3d6e0cd9;
    level.var_514f9d20 = &function_b11487a4;
    level.var_9f8e080d = &function_ed335136;
    level.var_19a15e42 = &function_daabc818;
    callback::callback(#"hash_45f35669076bc317");
    /#
        level.killstreak_init_end_time = getmillisecondsraw();
        elapsed_time = level.killstreak_init_end_time - level.killstreak_init_start_time;
        println("<dev string:x38>" + elapsed_time + "<dev string:x58>");
        level thread killstreak_debug_think();
    #/
}

// Namespace killstreaks/killstreaks
// Params 1, eflags: 0x4
// Checksum 0x50d95055, Offset: 0x460
// Size: 0x4c
function private function_395f82d0(killstreaktype) {
    globallogic_score::_setplayermomentum(self, self.momentum - self function_dceb5542(level.killstreaks[killstreaktype].itemindex));
}

// Namespace killstreaks/killstreaks
// Params 2, eflags: 0x4
// Checksum 0x23a1d4d6, Offset: 0x4b8
// Size: 0x5c
function private function_427f6a2e(killstreaktype, killstreakid) {
    if (self killstreak_dialog_queued("firewallBeingHacked", killstreaktype, killstreakid)) {
        return;
    }
    self globallogic_audio::play_taacom_dialog("firewallBeingHacked", killstreaktype, killstreakid);
}

// Namespace killstreaks/killstreaks
// Params 2, eflags: 0x4
// Checksum 0x277cc5ed, Offset: 0x520
// Size: 0x5c
function private function_6fa91236(killstreaktype, killstreakid) {
    if (self killstreak_dialog_queued("firewallHacked", killstreaktype, killstreakid)) {
        return;
    }
    self globallogic_audio::play_taacom_dialog("firewallHacked", killstreaktype, killstreakid);
}

// Namespace killstreaks/killstreaks
// Params 2, eflags: 0x4
// Checksum 0x158ffc29, Offset: 0x588
// Size: 0x5c
function private function_1cd175ba(killstreaktype, killstreakid) {
    if (self killstreak_dialog_queued("beingHacked", killstreaktype, killstreakid)) {
        return;
    }
    self globallogic_audio::play_taacom_dialog("beingHacked", killstreaktype, killstreakid);
}

// Namespace killstreaks/killstreaks
// Params 3, eflags: 0x4
// Checksum 0x83be62c6, Offset: 0x5f0
// Size: 0x134
function private function_520a5752(killstreaktype, killstreakid, hacker) {
    self globallogic_audio::flush_killstreak_dialog_on_player(killstreakid);
    self globallogic_audio::play_taacom_dialog("hacked", killstreaktype);
    excludeself = [];
    excludeself[0] = self;
    if (level.teambased) {
        globallogic_audio::leader_dialog(level.killstreaks[killstreaktype].hackeddialogkey, self.team, excludeself);
        globallogic_audio::leader_dialog_for_other_teams(level.killstreaks[killstreaktype].hackedstartdialogkey, self.team, undefined, killstreakid);
        return;
    }
    self globallogic_audio::leader_dialog_on_player(level.killstreaks[killstreaktype].hackeddialogkey);
    hacker globallogic_audio::leader_dialog_on_player(level.killstreaks[killstreaktype].hackedstartdialogkey);
}

// Namespace killstreaks/killstreaks
// Params 3, eflags: 0x4
// Checksum 0x7914988f, Offset: 0x730
// Size: 0x274
function private function_7bed52a(killstreaktype, team, killstreakid) {
    if (!isdefined(killstreaktype) || !isdefined(killstreakid)) {
        return;
    }
    self notify("killstreak_start_" + killstreaktype);
    self notify("killstreak_start_inventory_" + killstreaktype);
    excludeself = [];
    excludeself[0] = self;
    if (level.teambased) {
        if (!isdefined(self.currentkillstreakdialog) && isdefined(level.var_cb4eb1d1)) {
            self thread [[ level.var_cb4eb1d1 ]](level.killstreaks[killstreaktype].requestdialogkey, level.killstreaks[killstreaktype].var_3b69c05b);
        }
        if (isdefined(level.killstreakrules[killstreaktype]) && level.killstreakrules[killstreaktype].curteam[team] > 1) {
            globallogic_audio::leader_dialog_for_other_teams(level.killstreaks[killstreaktype].enemystartmultipledialogkey, team, undefined, killstreakid);
        } else {
            globallogic_audio::leader_dialog_for_other_teams(level.killstreaks[killstreaktype].enemystartdialogkey, team, undefined, killstreakid);
        }
        return;
    }
    if (!isdefined(self.currentkillstreakdialog) && isdefined(level.killstreaks[killstreaktype].requestdialogkey) && isdefined(level.heroplaydialog)) {
        self thread [[ level.heroplaydialog ]](level.killstreaks[killstreaktype].requestdialogkey);
    }
    if (isdefined(level.killstreakrules[killstreaktype]) && level.killstreakrules[killstreaktype].cur > 1) {
        globallogic_audio::leader_dialog_for_other_teams(level.killstreaks[killstreaktype].enemystartmultipledialogkey, team, undefined, killstreakid);
        return;
    }
    globallogic_audio::leader_dialog(level.killstreaks[killstreaktype].enemystartdialogkey, undefined, excludeself, undefined, killstreakid);
}

// Namespace killstreaks/killstreaks
// Params 2, eflags: 0x4
// Checksum 0x5730f40d, Offset: 0x9b0
// Size: 0x8c
function private function_6a5cc212(killstreaktype, killstreakid) {
    if (!isdefined(self.owner) || !isdefined(self.team) || self.team != self.owner.team) {
        return;
    }
    self.owner globallogic_audio::flush_killstreak_dialog_on_player(killstreakid);
    self.owner globallogic_audio::play_taacom_dialog("destroyed", killstreaktype);
}

// Namespace killstreaks/killstreaks
// Params 3, eflags: 0x4
// Checksum 0xa8960a8e, Offset: 0xa48
// Size: 0xa4
function private function_9716fce9(dialogkey, killstreaktype, killstreakid) {
    if (!isdefined(self.owner) || !isdefined(self.owner.team) || !isdefined(self.team) || self.team != self.owner.team) {
        return;
    }
    self.owner play_pilot_dialog(dialogkey, killstreaktype, killstreakid, self.pilotindex);
}

// Namespace killstreaks/killstreaks
// Params 4, eflags: 0x4
// Checksum 0x144eda92, Offset: 0xaf8
// Size: 0x5c
function private function_f6370f75(dialogkey, killstreaktype, killstreakid, pilotindex) {
    if (!isdefined(killstreaktype) || !isdefined(pilotindex)) {
        return;
    }
    self globallogic_audio::killstreak_dialog_on_player(dialogkey, killstreaktype, killstreakid, pilotindex);
}

// Namespace killstreaks/killstreaks
// Params 7, eflags: 0x4
// Checksum 0x19daf618, Offset: 0xb60
// Size: 0x6c
function private function_3d6e0cd9(dialogkey, killstreaktype, killstreakid, soundevent, var_8a6b001a, weapon, priority) {
    self globallogic_audio::play_taacom_dialog(dialogkey, killstreaktype, killstreakid, soundevent, var_8a6b001a, weapon, priority);
}

// Namespace killstreaks/killstreaks
// Params 3, eflags: 0x4
// Checksum 0x5d703bfd, Offset: 0xbd8
// Size: 0xbc
function private function_3cf68327(dialogkey, killstreaktype, killstreakid) {
    assert(isdefined(dialogkey));
    assert(isdefined(killstreaktype));
    if (!isdefined(self.owner) || !isdefined(self.team) || self.team != self.owner.team) {
        return;
    }
    self.owner play_taacom_dialog_response(dialogkey, killstreaktype, killstreakid, self.pilotindex);
}

// Namespace killstreaks/killstreaks
// Params 5, eflags: 0x4
// Checksum 0x57e9cf5a, Offset: 0xca0
// Size: 0x54
function private function_ed335136(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey) {
    globallogic_audio::leader_dialog_for_other_teams(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey);
}

// Namespace killstreaks/killstreaks
// Params 6, eflags: 0x4
// Checksum 0x9f475652, Offset: 0xd00
// Size: 0x5c
function private function_b11487a4(dialogkey, team, excludelist, objectivekey, killstreakid, dialogbufferkey) {
    globallogic_audio::leader_dialog(dialogkey, team, excludelist, objectivekey, killstreakid, dialogbufferkey);
}

// Namespace killstreaks/killstreaks
// Params 4, eflags: 0x4
// Checksum 0xd25677d0, Offset: 0xd68
// Size: 0x44
function private function_daabc818(event, player, victim, weapon) {
    scoreevents::processscoreevent(event, player, victim, weapon);
}

