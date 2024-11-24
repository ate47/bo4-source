#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_utility;

#namespace zm_towers_util;

// Namespace zm_towers_util/zm_towers_util
// Params 3, eflags: 0x1 linked
// Checksum 0x71901e5, Offset: 0x108
// Size: 0x1ec
function function_ae1b4f5b(var_6888276a = 75, var_7d866d50 = 75, var_aadd0545 = 75) {
    if (isdefined(self.no_gib) && self.no_gib) {
        return;
    }
    val = randomint(100);
    if (val > 100 - var_6888276a) {
        self zombie_utility::zombie_head_gib();
    }
    val = randomint(100);
    if (val > 100 - var_7d866d50) {
        if (!gibserverutils::isgibbed(self, 32)) {
            gibserverutils::gibrightarm(self);
        }
    }
    val = randomint(100);
    if (val > 100 - var_7d866d50) {
        if (!gibserverutils::isgibbed(self, 16)) {
            gibserverutils::gibleftarm(self);
        }
    }
    val = randomint(100);
    if (val > 100 - var_aadd0545) {
        gibserverutils::gibrightleg(self);
    }
    val = randomint(100);
    if (val > 100 - var_aadd0545) {
        gibserverutils::gibleftleg(self);
    }
}

// Namespace zm_towers_util/zm_towers_util
// Params 0, eflags: 0x1 linked
// Checksum 0xfd264f09, Offset: 0x300
// Size: 0x178
function function_48f49769() {
    while (isdefined(self)) {
        waittime = randomfloatrange(2.5, 5);
        yaw = randomint(360);
        if (yaw > 300) {
            yaw = 300;
        } else if (yaw < 60) {
            yaw = 60;
        }
        yaw = self.angles[1] + yaw;
        new_angles = (-60 + randomint(120), yaw, -45 + randomint(90));
        self rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        if (isdefined(self.worldgundw)) {
            self.worldgundw rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        }
        wait randomfloat(waittime - 0.1);
    }
}

// Namespace zm_towers_util/zm_towers_util
// Params 0, eflags: 0x1 linked
// Checksum 0xffa3d21, Offset: 0x480
// Size: 0x398
function function_6408c105() {
    assert(isdefined(level._spawned_wallbuys));
    foreach (wallbuy in level._spawned_wallbuys) {
        s_target = struct::get(wallbuy.target, "targetname");
        if (isdefined(s_target) && isdefined(s_target.target)) {
            fx_wallbuy = getent(s_target.target, "targetname");
            if (isdefined(fx_wallbuy)) {
                fx_wallbuy ghost();
            }
        }
        model = struct::get(wallbuy.target, "targetname");
        if (isdefined(model) && isdefined(model.target)) {
            var_393a819e = getent(model.target, "targetname");
            if (isdefined(var_393a819e)) {
                var_393a819e ghost();
            }
        }
        if (isdefined(wallbuy.trigger_stub) && isdefined(wallbuy.trigger_stub.clientfieldname)) {
            assert(!isdefined(wallbuy.var_d6cca569));
            wallbuy.var_d6cca569 = level clientfield::get(wallbuy.trigger_stub.clientfieldname);
            level clientfield::set(wallbuy.trigger_stub.clientfieldname, 0);
        }
    }
    foreach (var_2b84085b in level.var_b5079c7c) {
        level exploder::exploder(var_2b84085b);
    }
    level thread function_fcf197fa("zombie_door", 0);
    a_structs = struct::get_array("perk_vapor_altar");
    foreach (s_struct in a_structs) {
        s_struct zm_perks::function_efd2c9e6();
    }
}

// Namespace zm_towers_util/zm_towers_util
// Params 0, eflags: 0x1 linked
// Checksum 0x52838612, Offset: 0x820
// Size: 0x378
function show_zbarriers() {
    assert(isdefined(level._spawned_wallbuys));
    foreach (wallbuy in level._spawned_wallbuys) {
        target_struct = struct::get(wallbuy.target, "targetname");
        if (isdefined(target_struct) && isdefined(target_struct.target)) {
            wallbuy_fx = getent(target_struct.target, "targetname");
            if (isdefined(wallbuy_fx)) {
                wallbuy_fx show();
            }
        }
        model = struct::get(wallbuy.target, "targetname");
        if (isdefined(model) && isdefined(model.target)) {
            var_393a819e = getent(model.target, "targetname");
            if (isdefined(var_393a819e)) {
                var_393a819e show();
            }
        }
        if (isdefined(wallbuy.trigger_stub) && isdefined(wallbuy.trigger_stub.clientfieldname)) {
            assert(isdefined(wallbuy.var_d6cca569));
            level clientfield::set(wallbuy.trigger_stub.clientfieldname, wallbuy.var_d6cca569);
            wallbuy.var_d6cca569 = undefined;
        }
    }
    foreach (var_2b84085b in level.var_b5079c7c) {
        level exploder::exploder_stop(var_2b84085b);
    }
    level thread function_fcf197fa("zombie_door", 1);
    a_structs = struct::get_array("perk_vapor_altar");
    foreach (s_struct in a_structs) {
        s_struct zm_perks::function_1e721859();
    }
}

// Namespace zm_towers_util/zm_towers_util
// Params 2, eflags: 0x5 linked
// Checksum 0x4c9788f1, Offset: 0xba0
// Size: 0x23a
function private function_fcf197fa(targetname, b_show) {
    a_e_blockers = getentarray(targetname, "targetname");
    if (isdefined(a_e_blockers)) {
        foreach (blocker in a_e_blockers) {
            if (isdefined(blocker.target)) {
                var_6a2895e6 = getentarray(blocker.target, "targetname");
                if (isdefined(var_6a2895e6)) {
                    foreach (var_1d6a70e8 in var_6a2895e6) {
                        if (isdefined(var_1d6a70e8.objectid) && !var_1d6a70e8 zm_utility::function_1a4d2910()) {
                            switch (var_1d6a70e8.objectid) {
                            case #"symbol_back_debris":
                            case #"symbol_front_power":
                            case #"symbol_back":
                            case #"symbol_front":
                            case #"symbol_front_debris":
                            case #"symbol_back_power":
                                if (b_show) {
                                    var_1d6a70e8 show();
                                } else {
                                    var_1d6a70e8 ghost();
                                }
                                break;
                            default:
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace zm_towers_util/zm_towers_util
// Params 1, eflags: 0x1 linked
// Checksum 0x491fb485, Offset: 0xde8
// Size: 0x6e
function function_afd37143(str_line) {
    for (i = 0; i < level.players.size; i++) {
        if (isdefined(level.players[i])) {
            level.players[i] thread function_9821b7f1(str_line);
        }
    }
}

// Namespace zm_towers_util/zm_towers_util
// Params 1, eflags: 0x5 linked
// Checksum 0x8966195a, Offset: 0xe60
// Size: 0x9c
function private function_9821b7f1(str_line) {
    self endon(#"disconnect");
    while (isdefined(self.zmannouncertalking) && self.zmannouncertalking || isdefined(self.isspeaking) && self.isspeaking || isdefined(self.var_5b6ebfd0) && self.var_5b6ebfd0) {
        wait 0.5;
    }
    level zm_audio::sndannouncerplayvox(str_line, self);
}

// Namespace zm_towers_util/zm_towers_util
// Params 1, eflags: 0x1 linked
// Checksum 0xfe2fda6a, Offset: 0xf08
// Size: 0x160
function function_c05cc102(s_params) {
    self endon(#"death");
    if (s_params.weapon != level.w_wraithfire) {
        return;
    }
    s_waitresult = s_params.projectile waittill(#"projectile_impact_explode", #"explode", #"death");
    if (isdefined(s_params.projectile) && s_waitresult._notify == "death") {
        level notify(#"hash_3042a9bf2f57ea0a", {#attacker:self, #var_814c9389:s_params.projectile.origin});
        return;
    }
    if (s_waitresult._notify == "projectile_impact_explode") {
        level notify(#"hash_3042a9bf2f57ea0a", {#attacker:self, #var_814c9389:s_waitresult.position});
    }
}

