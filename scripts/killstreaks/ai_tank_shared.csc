// Atian COD Tools GSC decompiler test
#using script_6ae78a9592670fa2;
#using script_324d329b31b9b4ec;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace ai_tank;

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x0
// Checksum 0xf2292d4c, Offset: 0x3c8
// Size: 0x43c
function init_shared(bundlename) {
    if (!isdefined(level.var_400ded61)) {
        level.var_400ded61 = {};
        ir_strobe::init_shared();
        if (!isdefined(bundlename)) {
            bundlename = "killstreak_tank_robot";
        }
        bundle = struct::get_script_bundle("killstreak", bundlename);
        level.var_400ded61.aitankkillstreakbundle = bundle;
        level.var_400ded61._ai_tank_fx = [];
        level.var_400ded61._ai_tank_fx[#"light_green"] = "killstreaks/fx_agr_vlight_eye_grn";
        level.var_400ded61._ai_tank_fx[#"light_red"] = "killstreaks/fx_agr_vlight_eye_red";
        level.var_400ded61._ai_tank_fx[#"immobile"] = "killstreaks/fx8_drone_tank_stun";
        level.var_400ded61._ai_tank_fx[#"stun"] = "killstreaks/fx_agr_emp_stun";
        clientfield::register("vehicle", "ai_tank_death", 1, 1, "int", &death, 0, 0);
        clientfield::register("vehicle", "ai_tank_immobile", 1, 1, "int", &tank_immobile, 0, 0);
        clientfield::register("vehicle", "ai_tank_change_control", 1, 1, "int", &tank_change_control, 0, 0);
        clientfield::register("toplayer", "ai_tank_update_hud", 1, 1, "counter", &update_hud, 0, 0);
        clientfield::register("clientuimodel", "hudItems.tankState", 1, 3, "int", undefined, 0, 0);
        clientfield::register("toplayer", "ai_tank_jam_hud", 9000, 1, "int", &function_aedc4c37, 0, 1);
        if (!(isdefined(level.var_9f011465) && level.var_9f011465)) {
            multi_stage_target_lockon::register("multi_stage_target_lockon0");
            multi_stage_target_lockon::register("multi_stage_target_lockon1");
            multi_stage_target_lockon::register("multi_stage_target_lockon2");
            multi_stage_target_lockon::register("multi_stage_target_lockon3");
            multi_stage_target_lockon::register("multi_stage_target_lockon4");
        }
        vehicle::add_vehicletype_callback("ai_tank_drone_mp", &spawned);
        vehicle::add_vehicletype_callback("spawner_bo3_ai_tank_mp", &spawned);
        vehicle::add_vehicletype_callback("spawner_bo3_ai_tank_mp_player", &spawned);
        vehicle::add_vehicletype_callback("archetype_mini_quadtank_mp", &spawned);
        visionset_mgr::register_visionset_info("agr_visionset", 1, 16, undefined, "mp_vehicles_agr");
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x0
// Checksum 0xe613db4c, Offset: 0x810
// Size: 0x9c
function spawned(localclientnum, killstreak_duration) {
    self thread play_driving_rumble(localclientnum);
    self.killstreakbundle = level.var_400ded61.aitankkillstreakbundle;
    var_2c9baa0c = self.killstreakbundle.var_7249d50f;
    self.var_da04aa74 = 1;
    if (isdefined(var_2c9baa0c) && var_2c9baa0c != 0) {
        self enablevisioncircle(localclientnum, var_2c9baa0c);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 7, eflags: 0x0
// Checksum 0x8f60b91d, Offset: 0x8b8
// Size: 0xd4
function missile_fire(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (self hasanimtree() == 0) {
        self useanimtree("generic");
    }
    missiles_loaded = newval;
    if (missiles_loaded <= 4) {
        update_ui_ammo_count(localclientnum, missiles_loaded);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 7, eflags: 0x0
// Checksum 0xb52ed295, Offset: 0x998
// Size: 0x9c
function function_aedc4c37(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self postfx::playpostfxbundle(#"hash_68b6dee9bf4fbfbe");
    } else if (newval == 0) {
        self postfx::stoppostfxbundle(#"hash_68b6dee9bf4fbfbe");
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 7, eflags: 0x0
// Checksum 0xc67ffcdc, Offset: 0xa40
// Size: 0x86
function update_hud(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"disconnect");
    waitframe(1);
    if (isdefined(self)) {
        vehicle = getplayervehicle(self);
        if (isdefined(vehicle)) {
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x0
// Checksum 0xbc6c10bc, Offset: 0xad0
// Size: 0x64
function update_ui_ammo_count(localclientnum, missiles_loaded) {
    if (self function_4add50a7() || function_65b9eb0f(localclientnum)) {
        update_ui_model_ammo_count(localclientnum, missiles_loaded);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x0
// Checksum 0x2ec2da86, Offset: 0xb40
// Size: 0x6c
function update_ui_model_ammo_count(localclientnum, missiles_loaded) {
    ammo_ui_data_model = getuimodel(getuimodelforcontroller(localclientnum), "vehicle.rocketAmmo");
    if (isdefined(ammo_ui_data_model)) {
        setuimodelvalue(ammo_ui_data_model, missiles_loaded);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 7, eflags: 0x0
// Checksum 0xd1742647, Offset: 0xbb8
// Size: 0xb4
function tank_immobile(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval) {
        self notify(#"light_disable");
        self function_7713b297(localclientnum);
        self function_407a7b51(localclientnum);
    } else {
        self function_7713b297(localclientnum);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 7, eflags: 0x0
// Checksum 0x94064129, Offset: 0xc78
// Size: 0x1ac
function tank_change_control(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval) {
        self function_d309e55a("tag_turret_constrained_barrel_lower", 0);
        self function_d309e55a("tag_turret_base_pivot", 1);
        self function_d309e55a("tag_turret_constraint_base", 1);
        self function_d309e55a("tag_turret_constrained_barrel", 1);
        playsound(localclientnum, #"hash_a919be8bee9e599", self.origin);
    } else {
        self function_d309e55a("tag_turret_constrained_barrel_lower", 1);
        self function_d309e55a("tag_turret_base_pivot", 0);
        self function_d309e55a("tag_turret_constraint_base", 0);
        self function_d309e55a("tag_turret_constrained_barrel", 0);
        playsound(localclientnum, #"hash_a919be8bee9e599", self.origin);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 7, eflags: 0x0
// Checksum 0xbdba34b0, Offset: 0xe30
// Size: 0x86
function death(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (function_1cbf351b(localclientnum)) {
        return;
    }
    if (newval) {
        self function_7713b297(localclientnum);
        self notify(#"light_disable");
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x0
// Checksum 0xeebe79e, Offset: 0xec0
// Size: 0x7c
function function_407a7b51(localclientnum) {
    self.immobile_fx = util::playfxontag(localclientnum, level.var_400ded61._ai_tank_fx[#"immobile"], self, "tag_body");
    playsound(localclientnum, #"veh_talon_shutdown", self.origin);
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x0
// Checksum 0x3d4f2d5a, Offset: 0xf48
// Size: 0x3e
function function_7713b297(localclientnum) {
    if (isdefined(self.immobile_fx)) {
        stopfx(localclientnum, self.immobile_fx);
        self.immobile_fx = undefined;
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x0
// Checksum 0xb640dcb9, Offset: 0xf90
// Size: 0xf0
function play_driving_rumble(localclientnum) {
    self notify(#"driving_rumble");
    self endon(#"death");
    self endon(#"driving_rumble");
    for (;;) {
        for (;;) {
            if (isinvehicle(localclientnum, self)) {
                speed = self getspeed();
                if (speed >= 40 || speed <= -40) {
                    earthquake(localclientnum, 0.1, 0.1, self.origin, 200);
                }
            }
        }
    }
}

