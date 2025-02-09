#using scripts\core_common\clientfield_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\killstreaks\ai\patrol;
#using scripts\killstreaks\ai_tank_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\mp\killstreak_vehicle;
#using scripts\killstreaks\mp\supplydrop;

#namespace ai_tank;

// Namespace ai_tank/ai_tank
// Params 0, eflags: 0x2
// Checksum 0x6d92d86, Offset: 0x148
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"ai_tank", &__init__, undefined, #"killstreaks");
}

// Namespace ai_tank/ai_tank
// Params 0, eflags: 0x1 linked
// Checksum 0xdbafeea9, Offset: 0x198
// Size: 0xbe
function __init__() {
    init_shared();
    level.var_1dd2fbe1 = &function_c44c9bde;
    level.aitank_explode = &function_1e11d939;
    level.var_2e0b35c2 = &function_103d8f6;
    level.var_daa33d93 = &function_23e43434;
    level.var_cffcf4da = &function_577150fd;
    level.var_7f17a53e = &function_dd1ad60e;
    level.var_4b38c02b = &function_47a8e7a8;
}

// Namespace ai_tank/ai_tank
// Params 1, eflags: 0x1 linked
// Checksum 0xe89c0f9f, Offset: 0x260
// Size: 0xc4
function function_c44c9bde(drone) {
    drone = self;
    bundle = struct::get_script_bundle("killstreak", "killstreak_" + "tank_robot");
    drone ai_patrol::function_d091ff45(bundle);
    drone.goalradius = bundle.var_a562774d;
    drone thread killstreaks::waitfortimecheck(90000 * 0.5, &ontimecheck, "delete", "death", "crashing");
}

// Namespace ai_tank/ai_tank
// Params 0, eflags: 0x1 linked
// Checksum 0x27f76b20, Offset: 0x330
// Size: 0x34
function ontimecheck() {
    self killstreaks::play_pilot_dialog_on_owner("timecheck", "tank_robot", self.killstreak_id);
}

// Namespace ai_tank/ai_tank
// Params 1, eflags: 0x1 linked
// Checksum 0x25f8c27f, Offset: 0x370
// Size: 0x74
function function_577150fd(drone) {
    if (!isdefined(self.currentkillstreakdialog) && isdefined(level.heroplaydialog)) {
        self thread [[ level.heroplaydialog ]]("controlAiTank");
    }
    self.var_5f28922a = 1;
    drone clientfield::set("ai_tank_change_control", 1);
}

// Namespace ai_tank/ai_tank
// Params 1, eflags: 0x1 linked
// Checksum 0xcec85317, Offset: 0x3f0
// Size: 0x3c
function function_dd1ad60e(drone) {
    if (isdefined(self)) {
        self.var_5f28922a = 0;
    }
    drone clientfield::set("ai_tank_change_control", 0);
}

// Namespace ai_tank/ai_tank
// Params 1, eflags: 0x1 linked
// Checksum 0x5f8e1a8d, Offset: 0x438
// Size: 0x22
function function_103d8f6(killstreaktype) {
    return supplydrop::issupplydropgrenadeallowed(killstreaktype);
}

// Namespace ai_tank/ai_tank
// Params 3, eflags: 0x1 linked
// Checksum 0xd6dffc87, Offset: 0x468
// Size: 0x88
function function_23e43434(killstreak_id, context, team) {
    result = self supplydrop::usesupplydropmarker(killstreak_id, context);
    self notify(#"supply_drop_marker_done");
    if (!(isdefined(result) && result)) {
        return false;
    }
    self killstreaks::play_killstreak_start_dialog("tank_robot", team, killstreak_id);
    return true;
}

// Namespace ai_tank/ai_tank
// Params 2, eflags: 0x1 linked
// Checksum 0x170d08f9, Offset: 0x4f8
// Size: 0xf2
function function_1e11d939(attacker, weapon) {
    if (self.exploding === 1) {
        return;
    }
    profilestart();
    self.exploding = 1;
    destroyedbyenemy = killstreak_vehicle::explode(attacker, weapon);
    if (isdefined(level.figure_out_attacker)) {
        attacker = self [[ level.figure_out_attacker ]](attacker);
    }
    if (destroyedbyenemy && isplayer(attacker)) {
        scoreevents::function_f40d64cc(attacker, self, weapon);
        if (isdefined(attacker)) {
            attacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
        }
    }
    profilestop();
    return destroyedbyenemy;
}

// Namespace ai_tank/ai_tank
// Params 0, eflags: 0x1 linked
// Checksum 0x3be19fb1, Offset: 0x5f8
// Size: 0x1e
function function_47a8e7a8() {
    profilestart();
    self thread function_22528515();
    profilestop();
}

// Namespace ai_tank/ai_tank
// Params 0, eflags: 0x1 linked
// Checksum 0xe4f7924a, Offset: 0x620
// Size: 0x10c
function function_22528515() {
    vehicle = self;
    vehicle endon(#"death");
    if (isdefined(self.owner)) {
        self.owner endon(#"disconnect");
    }
    while (true) {
        waitresult = vehicle waittill(#"touch");
        ent = waitresult.entity;
        if (isdefined(ent.classname) && ent.classname == "trigger_hurt_new") {
            if (isdefined(level.var_14ae1879) && vehicle.origin[2] >= level.var_14ae1879) {
                continue;
            }
            vehicle notify(#"death");
        }
    }
}

