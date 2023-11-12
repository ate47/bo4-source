// Atian COD Tools GSC decompiler test
#using scripts\weapons\weaponobjects.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace grapple;

// Namespace grapple/grapple
// Params 0, eflags: 0x2
// Checksum 0xe5ec29bb, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"grapple", &__init__, undefined, undefined);
}

// Namespace grapple/grapple
// Params 0, eflags: 0x1 linked
// Checksum 0x28f19c0d, Offset: 0xe0
// Size: 0xc4
function __init__() {
    callback::on_spawned(&function_8fa5ff65);
    ability_player::register_gadget_activation_callbacks(20, undefined, &gadget_grapple_off);
    globallogic_score::register_kill_callback(getweapon(#"eq_grapple"), &function_d79e9bb5);
    weaponobjects::function_e6400478(#"eq_grapple", &function_422f24cc, 1);
}

// Namespace grapple/grapple
// Params 1, eflags: 0x1 linked
// Checksum 0x7b8ddd90, Offset: 0x1b0
// Size: 0x26
function function_422f24cc(watcher) {
    watcher.ondamage = &function_1987d583;
}

// Namespace grapple/grapple
// Params 5, eflags: 0x1 linked
// Checksum 0xf7482952, Offset: 0x1e0
// Size: 0x98
function function_d79e9bb5(attacker, victim, weapon, attackerweapon, meansofdeath) {
    if (!isdefined(attacker) || isdefined(attackerweapon) && attackerweapon == weapon) {
        return 0;
    }
    return attacker isgrappling() || isdefined(attacker.var_700a5910) && attacker.var_700a5910 + 2000 > gettime();
}

// Namespace grapple/grapple
// Params 2, eflags: 0x1 linked
// Checksum 0x4a404361, Offset: 0x280
// Size: 0x58
function gadget_grapple_off(slot, weapon) {
    if (!function_d79e9bb5(self) && isdefined(level.var_228e8cd6)) {
        self [[ level.var_228e8cd6 ]](weapon);
    }
}

// Namespace grapple/grapple
// Params 0, eflags: 0x1 linked
// Checksum 0x9d77125a, Offset: 0x2e0
// Size: 0x1c
function function_8fa5ff65() {
    self thread function_9dd08ccf();
}

// Namespace grapple/grapple
// Params 0, eflags: 0x1 linked
// Checksum 0x3139995e, Offset: 0x308
// Size: 0x82
function function_9dd08ccf() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist");
    while (isdefined(self)) {
        self waittill(#"grapple_cancel");
        self.var_700a5910 = gettime();
    }
}

// Namespace grapple/grapple
// Params 1, eflags: 0x1 linked
// Checksum 0x154f4f66, Offset: 0x398
// Size: 0x24
function function_1987d583(watcher) {
    self setcandamage(0);
}

