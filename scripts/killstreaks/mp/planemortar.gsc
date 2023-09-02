// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\planemortar_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;

#namespace planemortar;

// Namespace planemortar/planemortar
// Params 0, eflags: 0x2
// Checksum 0x5717bc10, Offset: 0x1c8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"planemortar", &__init__, undefined, #"killstreaks");
}

// Namespace planemortar/planemortar
// Params 0, eflags: 0x1 linked
// Checksum 0xcfac2204, Offset: 0x218
// Size: 0xcc
function __init__() {
    init_shared();
    bundle = struct::get_script_bundle("killstreak", "killstreak_planemortar");
    killstreaks::register_bundle(bundle, &usekillstreakplanemortar);
    level.plane_mortar_bda_dialog = &plane_mortar_bda_dialog;
    level.planeawardscoreevent = &planeawardscoreevent;
    level.var_269fec2 = &function_269fec2;
    killstreaks::set_team_kill_penalty_scale("planemortar", level.teamkillreducedpenalty);
}

// Namespace planemortar/planemortar
// Params 0, eflags: 0x1 linked
// Checksum 0xf3ade5ec, Offset: 0x2f0
// Size: 0xa6
function function_269fec2() {
    if (!isdefined(self.pers[#"mortarradarused"]) || !self.pers[#"mortarradarused"]) {
        otherteam = util::getotherteam(self.team);
        globallogic_audio::leader_dialog("enemyPlaneMortarUsed", otherteam);
    }
    if (isdefined(level.var_30264985)) {
        self notify(#"mortarradarused");
    }
}

// Namespace planemortar/planemortar
// Params 0, eflags: 0x1 linked
// Checksum 0x5370e8c1, Offset: 0x3a0
// Size: 0x1c6
function plane_mortar_bda_dialog() {
    if (isdefined(self.planemortarbda)) {
        if (self.planemortarbda === 1) {
            bdadialog = "kill1";
            killconfirmed = "killConfirmed1_p";
        } else if (self.planemortarbda === 2) {
            bdadialog = "kill2";
            killconfirmed = "killConfirmed2_p";
        } else if (self.planemortarbda === 3) {
            bdadialog = "kill3";
            killconfirmed = "killConfirmed3_p";
        } else if (isdefined(self.planemortarbda) && self.planemortarbda > 3) {
            bdadialog = "killMultiple";
            killconfirmed = "killConfirmedMult_p";
        }
        self killstreaks::play_pilot_dialog(bdadialog, "planemortar", undefined, self.planemortarpilotindex);
        if (battlechatter::dialog_chance("taacomPilotKillConfirmChance")) {
            self killstreaks::play_taacom_dialog_response(killconfirmed, "planemortar", undefined, self.planemortarpilotindex);
        } else {
            self killstreaks::play_taacom_dialog_response("hitConfirmed_p", "planemortar", undefined, self.planemortarpilotindex);
        }
    } else {
        killstreaks::play_pilot_dialog("killNone", "planemortar", undefined, self.planemortarpilotindex);
        globallogic_audio::play_taacom_dialog("confirmMiss");
    }
    self.planemortarbda = undefined;
}

// Namespace planemortar/planemortar
// Params 2, eflags: 0x1 linked
// Checksum 0xe5610e1a, Offset: 0x570
// Size: 0x154
function planeawardscoreevent(attacker, plane) {
    attacker endon(#"disconnect");
    attacker notify(#"planeawardscoreevent_singleton");
    attacker endon(#"planeawardscoreevent_singleton");
    waittillframeend();
    if (isdefined(attacker) && (!isdefined(plane.owner) || plane.owner util::isenemyplayer(attacker))) {
        challenges::destroyedaircraft(attacker, getweapon(#"emp"), 0, 1);
        scoreevents::processscoreevent(#"destroyed_plane_mortar", attacker, plane.owner, getweapon(#"emp"));
        attacker challenges::addflyswatterstat(getweapon(#"emp"), plane);
    }
}

