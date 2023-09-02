// Atian COD Tools GSC decompiler test
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;

#namespace helicopter;

// Namespace helicopter/helicopter
// Params 0, eflags: 0x2
// Checksum 0xfec1ae03, Offset: 0x130
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"helicopter", &__init__, undefined, #"killstreaks");
}

// Namespace helicopter/helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0x13595cc9, Offset: 0x180
// Size: 0x84
function __init__() {
    level.var_34f03cda = &function_34f03cda;
    level.var_4d5e1035 = &function_4d5e1035;
    level.var_6af968ce = &function_6af968ce;
    init_shared("killstreak_helicopter_comlink");
    player::function_cf3aa03d(&function_d45a1f8d, 0);
}

// Namespace helicopter/helicopter
// Params 3, eflags: 0x1 linked
// Checksum 0x1f994110, Offset: 0x210
// Size: 0x15c
function function_6af968ce(attacker, weapon, mod) {
    if (isdefined(attacker) && isplayer(attacker)) {
        if (!isdefined(self.owner) || self.owner util::isenemyplayer(attacker)) {
            attacker battlechatter::function_dd6a6012(self.killstreaktype, weapon);
            self killstreaks::function_73566ec7(attacker, weapon, self.owner);
            challenges::destroyedhelicopter(attacker, weapon, mod, 0);
            attacker challenges::addflyswatterstat(weapon, self);
            attacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
        }
    }
    if (self.leaving !== 1) {
        self killstreaks::play_destroyed_dialog_on_owner(self.killstreaktype, self.killstreak_id);
    }
}

// Namespace helicopter/helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x8c18a058, Offset: 0x378
// Size: 0x44
function function_34f03cda(hardpointtype) {
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        self challenges::calledincomlinkchopper();
    }
}

// Namespace helicopter/helicopter
// Params 7, eflags: 0x1 linked
// Checksum 0x485e95df, Offset: 0x3c8
// Size: 0x180
function function_4d5e1035(attacker, weapon, type, weapon_damage, event, playercontrolled, hardpointtype) {
    if (weapon_damage > 0) {
        self challenges::trackassists(attacker, weapon_damage, 0);
    }
    if (isdefined(event)) {
        if (isdefined(self.owner) && self.owner util::isenemyplayer(attacker)) {
            challenges::destroyedhelicopter(attacker, weapon, type, 0);
            challenges::destroyedaircraft(attacker, weapon, playercontrolled, 1);
            scoreevents::processscoreevent(event, attacker, self.owner, weapon);
            attacker challenges::addflyswatterstat(weapon, self);
            if (playercontrolled == 1) {
                attacker challenges::destroyedplayercontrolledaircraft();
            }
            if (hardpointtype == "helicopter_player_gunner") {
                attacker stats::function_e24eec31(weapon, #"destroyed_controlled_killstreak", 1);
            }
            goto LOC_0000017e;
        }
    LOC_0000017e:
    }
LOC_0000017e:
}

// Namespace helicopter/helicopter
// Params 9, eflags: 0x1 linked
// Checksum 0x1a7b7abb, Offset: 0x550
// Size: 0x136
function function_d45a1f8d(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (!isdefined(einflictor) || !isdefined(einflictor.owner) || !isdefined(attacker) || !isdefined(weapon)) {
        return;
    }
    if (einflictor.owner == attacker && weapon == getweapon(#"cobra_20mm_comlink") && (isdefined(einflictor.lastkillvo) ? einflictor.lastkillvo : 0) < gettime()) {
        einflictor killstreaks::play_pilot_dialog_on_owner("kill", "helicopter_comlink", einflictor.killstreak_id);
        einflictor.lastkillvo = gettime() + 5000;
    }
}

