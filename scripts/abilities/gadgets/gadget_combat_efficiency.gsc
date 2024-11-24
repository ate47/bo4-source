#using scripts\abilities\ability_player;
#using scripts\abilities\ability_util;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\system_shared;

#namespace gadget_combat_efficiency;

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 0, eflags: 0x2
// Checksum 0xe561a3ca, Offset: 0x108
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_combat_efficiency", &__init__, undefined, undefined);
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 0, eflags: 0x1 linked
// Checksum 0x1fa2e33c, Offset: 0x150
// Size: 0xc4
function __init__() {
    ability_player::register_gadget_activation_callbacks(12, &gadget_combat_efficiency_on_activate, &gadget_combat_efficiency_on_off);
    ability_player::register_gadget_is_inuse_callbacks(12, &gadget_combat_efficiency_is_inuse);
    ability_player::register_gadget_is_flickering_callbacks(12, &gadget_combat_efficiency_is_flickering);
    ability_player::register_gadget_ready_callbacks(12, &gadget_combat_efficiency_ready);
    clientfield::register("clientuimodel", "hudItems.combatEfficiencyActive", 1, 1, "int");
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 1, eflags: 0x1 linked
// Checksum 0xefbeb200, Offset: 0x220
// Size: 0x22
function gadget_combat_efficiency_is_inuse(slot) {
    return self gadgetisactive(slot);
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 1, eflags: 0x1 linked
// Checksum 0x607ef7f1, Offset: 0x250
// Size: 0x22
function gadget_combat_efficiency_is_flickering(slot) {
    return self gadgetflickering(slot);
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 5, eflags: 0x0
// Checksum 0x53d08acd, Offset: 0x280
// Size: 0xf4
function function_5bfd1343(attacker, var_f231d134, var_6ba675bd, capturedobjective, var_77cc3ee4) {
    if (!isdefined(attacker) || !isdefined(var_f231d134) || !isdefined(var_77cc3ee4) || !isdefined(attacker.var_649d2b1f)) {
        return;
    }
    if (function_db4ccff2(attacker, undefined, var_f231d134) && isdefined(attacker.var_bc9d778c) && attacker.var_bc9d778c && attacker != attacker.var_649d2b1f) {
        scoreevents::processscoreevent(#"stim_vanguard", attacker.var_649d2b1f, undefined, var_77cc3ee4);
    }
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 5, eflags: 0x0
// Checksum 0x9aee5056, Offset: 0x380
// Size: 0xfc
function function_57b485b3(attacker, time, var_f231d134, var_77cc3ee4, objectivekill) {
    if (!isdefined(attacker) || !isdefined(var_f231d134) || !isdefined(var_77cc3ee4) || !isdefined(attacker.var_649d2b1f) || !isdefined(objectivekill)) {
        return;
    }
    if (function_db4ccff2(attacker, undefined, var_f231d134)) {
        if (objectivekill) {
            scoreevents::processscoreevent(#"battle_command_ultimate_command", attacker, undefined, var_77cc3ee4);
            return;
        }
        if (attacker == attacker.var_649d2b1f) {
            scoreevents::processscoreevent(#"hash_1c12195e708977c5", attacker, undefined, var_77cc3ee4);
        }
    }
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 4, eflags: 0x0
// Checksum 0xcb6942bf, Offset: 0x488
// Size: 0xd4
function function_a30493ef(attacker, lastkilltime, var_f231d134, var_77cc3ee4) {
    if (!isdefined(attacker) || !isdefined(var_f231d134) || !isdefined(var_77cc3ee4) || !isdefined(attacker.var_649d2b1f)) {
        return;
    }
    if (function_db4ccff2(attacker, undefined, var_f231d134) && isdefined(attacker.var_bc9d778c) && attacker.var_bc9d778c) {
        scoreevents::processscoreevent(#"hash_3d7b27350807786b", attacker.var_649d2b1f, undefined, var_77cc3ee4);
    }
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 5, eflags: 0x1 linked
// Checksum 0x8901546f, Offset: 0x568
// Size: 0xce
function function_db4ccff2(attacker, victim, weapon, attackerweapon, meansofdeath) {
    if (!isdefined(attacker) || !isdefined(weapon)) {
        return false;
    }
    if (isdefined(attacker.playerrole) && isdefined(attacker.playerrole.ultimateweapon)) {
        ultweapon = getweapon(attacker.playerrole.ultimateweapon);
        if (attacker ability_util::function_43cda488() && weapon == ultweapon) {
            return true;
        }
    }
    return false;
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 4, eflags: 0x0
// Checksum 0xe8b3b299, Offset: 0x640
// Size: 0x6a
function function_92308e92(attacker, victim, weapon, attackerweapon) {
    if (!isdefined(attacker)) {
        return 0;
    }
    attacker.var_bc9d778c = attacker ability_util::function_43cda488();
    return function_db4ccff2(attacker, victim, weapon, attackerweapon);
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 2, eflags: 0x1 linked
// Checksum 0xb8343db8, Offset: 0x6b8
// Size: 0xa6
function gadget_combat_efficiency_on_activate(slot, weapon) {
    self._gadget_combat_efficiency = 1;
    self._gadget_combat_efficiency_success = 0;
    self.scorestreaksearnedperuse = 0;
    self.combatefficiencylastontime = gettime();
    self function_f53ac86e();
    self thread function_6a9d7105(slot, weapon);
    result = self gestures::function_56e00fbf(#"gestable_battle_cry", undefined, 0);
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 2, eflags: 0x1 linked
// Checksum 0x119dfb62, Offset: 0x768
// Size: 0x10c
function gadget_combat_efficiency_on_off(slot, weapon) {
    self._gadget_combat_efficiency = 0;
    self.combatefficiencylastontime = gettime();
    self function_f53ac86e();
    self stats::function_e24eec31(self.heroability, #"scorestreaks_earned_2", int(self.scorestreaksearnedperuse / 2));
    self stats::function_e24eec31(self.heroability, #"scorestreaks_earned_3", int(self.scorestreaksearnedperuse / 3));
    if (isalive(self) && isdefined(level.playgadgetsuccess)) {
        self [[ level.playgadgetsuccess ]](weapon);
    }
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 2, eflags: 0x1 linked
// Checksum 0xcd16060f, Offset: 0x880
// Size: 0x156
function function_6a9d7105(slot, weapon) {
    if (self function_91224c49() == 0) {
        return;
    }
    self notify("1da58f971e958838");
    self endon("1da58f971e958838");
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
    var_122b9df7 = weapon.gadget_power_usage_rate * 0.5 * float(function_60d95f53()) / 1000;
    do {
        current_power = self gadgetpowerget(slot);
        self gadgetpowerset(slot, min(current_power + var_122b9df7, 100));
        waitframe(1);
    } while (self._gadget_combat_efficiency);
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 2, eflags: 0x1 linked
// Checksum 0x3863906c, Offset: 0x9e0
// Size: 0x14
function gadget_combat_efficiency_ready(slot, weapon) {
    
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 3, eflags: 0x0
// Checksum 0x940326e2, Offset: 0xa00
// Size: 0xbc
function set_gadget_combat_efficiency_status(weapon, status, time) {
    timestr = "";
    if (isdefined(time)) {
        timestr = "^3" + ", time: " + time;
    }
    /#
        if (getdvarint(#"scr_cpower_debug_prints", 0) > 0) {
            self iprintlnbold("<dev string:x38>" + weapon.name + "<dev string:x54>" + status + timestr);
        }
    #/
}

// Namespace gadget_combat_efficiency/gadget_combat_efficiency
// Params 0, eflags: 0x1 linked
// Checksum 0xaf4a458b, Offset: 0xac8
// Size: 0xf6
function function_f53ac86e() {
    enabled = self ability_util::function_43cda488();
    if (isdefined(self.team)) {
        teammates = getplayers(self.team);
        foreach (player in teammates) {
            player clientfield::set_player_uimodel("hudItems.combatEfficiencyActive", enabled);
            if (enabled) {
                player.var_649d2b1f = self;
                continue;
            }
            player.var_649d2b1f = undefined;
        }
    }
}

