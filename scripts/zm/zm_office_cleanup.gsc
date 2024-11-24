#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_office_defcon;
#using scripts\zm\zm_office_floors;
#using scripts\zm\zm_office_teleporters;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_spawner;

#namespace zm_office_cleanup;

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 0, eflags: 0x1 linked
// Checksum 0xe02b2e86, Offset: 0xb8
// Size: 0x84
function init() {
    level.no_target_override = &function_d77201c4;
    level.enemy_location_override_func = &function_7956439e;
    level.var_6f6cc58 = &function_6c7d76d;
    level.var_4e4950d1 = &function_4d58e688;
    callback::on_ai_spawned(&function_fa5d232f);
}

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 1, eflags: 0x1 linked
// Checksum 0x8d826caa, Offset: 0x148
// Size: 0x64
function function_d77201c4(ai_zombie) {
    if (isdefined(ai_zombie.var_3f667178)) {
        ai_zombie setgoal(ai_zombie.var_3f667178.origin);
        return;
    }
    ai_zombie zm_cleanup::no_target_override(ai_zombie);
}

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 2, eflags: 0x1 linked
// Checksum 0xb6741b0e, Offset: 0x1b8
// Size: 0x92
function function_7956439e(ai, target) {
    if (isdefined(ai.var_b940d6ea)) {
        return ai.origin;
    }
    var_a2f50c0d = function_1969a102();
    if (var_a2f50c0d) {
        return ai.origin;
    }
    if (isdefined(ai.var_3f667178)) {
        return ai.var_3f667178.origin;
    }
    return;
}

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 1, eflags: 0x1 linked
// Checksum 0x881ac85e, Offset: 0x258
// Size: 0x158
function function_4d58e688(e_poi) {
    if (isdefined(level.elevator1.moving_to) && e_poi[1] istouching(level.var_83225f64[0]) && !self istouching(level.var_83225f64[0])) {
        return false;
    }
    if (isdefined(level.elevator2.moving_to) && e_poi[1] istouching(level.var_83225f64[1]) && !self istouching(level.var_83225f64[1])) {
        return false;
    }
    var_271de3da = zm_office_floors::function_35babccd(e_poi[1]);
    var_b2818507 = zm_office_floors::function_35babccd(self);
    if (!isdefined(var_271de3da)) {
        return false;
    }
    if (var_b2818507 != var_271de3da) {
        return false;
    }
    return true;
}

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 1, eflags: 0x1 linked
// Checksum 0xfd75311d, Offset: 0x3b8
// Size: 0x194
function function_6c7d76d(e_player) {
    if (isdefined(level.elevator1.moving_to) && e_player istouching(level.var_83225f64[0]) && !self istouching(level.var_83225f64[0])) {
        return false;
    }
    if (isdefined(level.elevator2.moving_to) && e_player istouching(level.var_83225f64[1]) && !self istouching(level.var_83225f64[1])) {
        return false;
    }
    var_5949c6af = zm_office_floors::function_35babccd(e_player);
    var_b2818507 = zm_office_floors::function_35babccd(self);
    if (!isdefined(var_5949c6af)) {
        return false;
    }
    if (var_b2818507 != var_5949c6af && (var_b2818507 == 4 || var_5949c6af == 4 || !level flag::get(#"portals_active"))) {
        return false;
    }
    return true;
}

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 0, eflags: 0x5 linked
// Checksum 0x170c5b80, Offset: 0x558
// Size: 0x1d0
function private function_1969a102() {
    target = self.favoriteenemy;
    if (!isdefined(self.var_3f667178)) {
        if (self zm_office_defcon::function_cacd3270() && zm_office_defcon::is_packroom_clear()) {
            self thread zm_office_teleporters::function_9d689cc4(level.portal_pack);
        } else if (isdefined(target) && zm_office_floors::function_35babccd(self) != zm_office_floors::function_35babccd(target)) {
            if (level flag::get(#"portals_active") && level.zones[#"war_room_zone_north"].is_enabled) {
                self thread zm_office_teleporters::function_9d689cc4();
            } else {
                self.favoriteenemy = undefined;
                if (self.archetype === #"zombie_dog") {
                    target.hunted_by--;
                    self thread function_29aabbb3();
                }
                return true;
            }
        }
    } else if (isdefined(target) && distancesquared(self.origin, target.origin) < distancesquared(self.origin, self.var_3f667178.origin)) {
        self notify(#"cancel_teleport");
    }
    return false;
}

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 0, eflags: 0x1 linked
// Checksum 0x9b0ca04d, Offset: 0x730
// Size: 0x92
function function_29aabbb3() {
    self endon(#"death");
    if (self.var_46c276a4 === 1) {
        return;
    }
    wait_time = 0;
    self.var_46c276a4 = 1;
    while (!isdefined(self.favoriteenemy)) {
        wait 1;
        wait_time++;
        if (wait_time > 5) {
            self zm_cleanup::do_cleanup_check(0);
        }
    }
    self.var_46c276a4 = 0;
}

// Namespace zm_office_cleanup/zm_office_cleanup
// Params 0, eflags: 0x1 linked
// Checksum 0xec88cfc6, Offset: 0x7d0
// Size: 0x88
function function_fa5d232f() {
    if (self.archetype !== #"zombie_dog") {
        return;
    }
    self endon(#"death");
    var_906c0a07 = 32;
    while (true) {
        if (self.goalradius < 1) {
            self.goalradius = var_906c0a07;
        } else {
            var_906c0a07 = self.goalradius;
        }
        wait 0.1;
    }
}

