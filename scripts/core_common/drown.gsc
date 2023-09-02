// Atian COD Tools GSC decompiler test
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace drown;

// Namespace drown/drown
// Params 0, eflags: 0x2
// Checksum 0xc2d8efec, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"drown", &__init__, undefined, undefined);
}

// Namespace drown/drown
// Params 0, eflags: 0x1 linked
// Checksum 0x6a908e0c, Offset: 0x158
// Size: 0xe4
function __init__() {
    callback::on_spawned(&function_27777812);
    callback::on_connect(&on_connect);
    level.drown_pre_damage_stage_time = 2000;
    if (!isdefined(level.vsmgr_prio_overlay_drown_blur)) {
        level.vsmgr_prio_overlay_drown_blur = 10;
    }
    visionset_mgr::register_info("overlay", "drown_blur", 1, level.vsmgr_prio_overlay_drown_blur, 1, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
    clientfield::register("toplayer", "drown_stage", 1, 3, "int");
}

// Namespace drown/drown
// Params 0, eflags: 0x1 linked
// Checksum 0xef43bfe6, Offset: 0x248
// Size: 0x54
function on_connect() {
    self callback::on_death(&function_1ef50162);
    self callback::function_d8abfc3d(#"on_end_game", &function_c621d98c);
}

// Namespace drown/drown
// Params 0, eflags: 0x1 linked
// Checksum 0xe424b73b, Offset: 0x2a8
// Size: 0x6a
function activate_player_health_visionset() {
    self deactivate_player_health_visionset();
    if (!self.drown_vision_set) {
        visionset_mgr::activate("overlay", "drown_blur", self, 0.1, 0.25, 0.1);
        self.drown_vision_set = 1;
    }
}

// Namespace drown/drown
// Params 0, eflags: 0x1 linked
// Checksum 0xb4da327d, Offset: 0x320
// Size: 0x4e
function deactivate_player_health_visionset() {
    if (!isdefined(self.drown_vision_set) || self.drown_vision_set) {
        visionset_mgr::deactivate("overlay", "drown_blur", self);
        self.drown_vision_set = 0;
    }
}

// Namespace drown/drown
// Params 0, eflags: 0x1 linked
// Checksum 0x90cafceb, Offset: 0x378
// Size: 0x4c
function function_27777812() {
    self callback::add_callback(#"underwater", &function_84845e32);
    self deactivate_player_health_visionset();
}

// Namespace drown/drown
// Params 1, eflags: 0x1 linked
// Checksum 0x3e1235f1, Offset: 0x3d0
// Size: 0x44
function function_c621d98c(params) {
    self function_1ef50162(params);
    self callback::remove_on_death(&function_1ef50162);
}

// Namespace drown/drown
// Params 1, eflags: 0x1 linked
// Checksum 0xe927b880, Offset: 0x420
// Size: 0x3c
function function_84845e32(params) {
    if (!isdefined(self.playerrole)) {
        return;
    }
    if (params.underwater) {
        thread watch_player_drowning();
    }
}

// Namespace drown/drown
// Params 0, eflags: 0x1 linked
// Checksum 0x14b69e6e, Offset: 0x468
// Size: 0x654
function watch_player_drowning() {
    self endon(#"disconnect", #"death");
    level endon(#"game_ended");
    self clientfield::set_to_player("drown_stage", 0);
    self.lastwaterdamagetime = self getlastoutwatertime();
    self.drownstage = 0;
    var_c1e8fa5d = 4000;
    underwaterbreathtime = 1000;
    if (isdefined(level.var_ac6052e9)) {
        underwaterbreathtime = int([[ level.var_ac6052e9 ]]("underwaterBreathTime", 1) * 1000);
        exertbuffer = [[ level.var_ac6052e9 ]]("playerExertBuffer", 1);
    }
    while (1) {
        waitframe(1);
        underwater = (game.state == "pregame" || game.state == "playing") && self isplayerunderwater();
        var_790acff6 = isdefined(level.var_8e910e84) && level.var_8e910e84 && self inlaststand() && getwaterheight(self.origin) > self getplayercamerapos()[2];
        underwater = underwater | var_790acff6;
        if (underwater && !(isdefined(self.var_f07d3654) && self.var_f07d3654)) {
            if (!(isdefined(self.wasunderwater) && self.wasunderwater)) {
                self.wasunderwater = 1;
                self.var_cdefe788 = gettime();
                self stopsounds();
            }
            n_swimtime = int(self.playerrole.swimtime * 1000);
            if (self hasperk(#"hash_4ef368f54cd86ab7")) {
                n_swimtime = int(n_swimtime * 1.5);
            }
            if (gettime() - self.lastwaterdamagetime > n_swimtime - var_c1e8fa5d && self.drownstage == 0) {
                if (isdefined(level.var_9f155bf4)) {
                    self thread [[ level.var_9f155bf4 ]]("MOD_DROWN");
                }
                var_c1e8fa5d = var_c1e8fa5d - int(self.playerrole.var_f0886300 * 1000);
            }
            if (gettime() - self.lastwaterdamagetime > n_swimtime - level.drown_pre_damage_stage_time && self.drownstage == 0) {
                self.drownstage++;
                self clientfield::set_to_player("drown_stage", self.drownstage);
            } else if (self.drownstage == 0 && var_790acff6) {
                self.drownstage++;
                self clientfield::set_to_player("drown_stage", self.drownstage);
                self.lastwaterdamagetime = gettime() - n_swimtime + int(self.playerrole.var_f0886300 * 1000);
            }
            if (gettime() - self.lastwaterdamagetime > n_swimtime) {
                self.lastwaterdamagetime = self.lastwaterdamagetime + int(self.playerrole.var_f0886300 * 1000);
                self dodamage(self.playerrole.swimdamage, self.origin, undefined, undefined, undefined, "MOD_DROWN", 6);
                self activate_player_health_visionset();
                if (self.drownstage < 4) {
                    self.drownstage++;
                    self clientfield::set_to_player("drown_stage", self.drownstage);
                }
            }
        } else {
            if (isdefined(level.var_ee30f81d) && isdefined(self.wasunderwater) && self.wasunderwater) {
                if (self.drownstage > 0) {
                    thread [[ level.var_ee30f81d ]](self, 1);
                } else if (gettime() > (isdefined(self.var_cdefe788) ? self.var_cdefe788 : 0) + underwaterbreathtime) {
                    thread [[ level.var_ee30f81d ]](self, 0);
                }
            }
            self.drownstage = 0;
            self clientfield::set_to_player("drown_stage", 0);
            self.lastwaterdamagetime = self getlastoutwatertime();
            self deactivate_player_health_visionset();
            var_c1e8fa5d = 4000;
            self.wasunderwater = 0;
            return;
        }
    }
}

// Namespace drown/drown
// Params 1, eflags: 0x1 linked
// Checksum 0xc325cbd4, Offset: 0xac8
// Size: 0x64
function function_1ef50162(params = undefined) {
    self.drownstage = 0;
    self clientfield::set_to_player("drown_stage", 0);
    self.wasunderwater = 0;
    self deactivate_player_health_visionset();
}

// Namespace drown/drown
// Params 0, eflags: 0x0
// Checksum 0x31ec651c, Offset: 0xb38
// Size: 0x3e
function is_player_drowning() {
    drowning = 1;
    if (!isdefined(self.drownstage) || self.drownstage == 0) {
        drowning = 0;
    }
    return drowning;
}

