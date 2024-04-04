// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace hawk;

// Namespace hawk/hawk
// Params 0, eflags: 0x2
// Checksum 0xbf5c1a4c, Offset: 0x1a8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hawk", &__init__, undefined, undefined);
}

// Namespace hawk/hawk
// Params 0, eflags: 0x0
// Checksum 0x27c87b9e, Offset: 0x1f0
// Size: 0x4c
function __init__() {
    vehicle::add_main_callback("hawk", &hawk_initialize);
    callback::on_vehicle_killed(&on_vehicle_killed);
}

// Namespace hawk/hawk
// Params 0, eflags: 0x0
// Checksum 0x39f71f37, Offset: 0x248
// Size: 0xbc
function hawk_initialize() {
    statemachine = self vehicle_ai::init_state_machine_for_role("default");
    self vehicle_ai::get_state_callbacks("death").update_func = &vehicle_ai::defaultstate_death_update;
    self vehicle_ai::call_custom_add_state_callbacks();
    self vehicle::toggle_sounds(1);
    self disabledriverfiring(1);
    self.ignore_death_jolt = 1;
    target_set(self);
}

// Namespace hawk/enter_vehicle
// Params 1, eflags: 0x40
// Checksum 0x71a4df63, Offset: 0x310
// Size: 0xdc
function event_handler[enter_vehicle] codecallback_vehicleenter(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    vehicle = eventstruct.vehicle;
    if (!isdefined(vehicle.scriptvehicletype) || vehicle.scriptvehicletype != "hawk") {
        return;
    }
    vehicle function_d733412a(0);
    vehicle makevehicleusable();
    self clientfield::set_player_uimodel("hudItems.abilityHintIndex", 5);
    self thread function_a2270a7e(vehicle);
}

// Namespace hawk/exit_vehicle
// Params 1, eflags: 0x40
// Checksum 0xdcdb901d, Offset: 0x3f8
// Size: 0xbc
function event_handler[exit_vehicle] codecallback_vehicleexit(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    vehicle = eventstruct.vehicle;
    if (!isdefined(vehicle.scriptvehicletype) || vehicle.scriptvehicletype != "hawk") {
        return;
    }
    if (isalive(vehicle)) {
        vehicle makevehicleunusable();
    }
    self clientfield::set_player_uimodel("hudItems.abilityHintIndex", 0);
}

// Namespace hawk/hawk
// Params 1, eflags: 0x4
// Checksum 0xeff5ab5e, Offset: 0x4c0
// Size: 0x1b6
function private function_a2270a7e(vehicle) {
    self notify("5137fb3aeff763b1");
    self endon("5137fb3aeff763b1");
    self endon(#"death", #"disconnect");
    vehicle endon(#"death", #"exit_vehicle");
    if (sessionmodeiswarzonegame()) {
        str_mode = "wz";
    } else {
        str_mode = "mp";
    }
    while (true) {
        if (vehicle depthinwater() > 0 && gettime() - vehicle.birthtime > 350) {
            vehicle dodamage(vehicle.health, vehicle.origin);
        }
        if (isdefined(vehicle.var_b61d83c4) && vehicle.var_b61d83c4) {
            if (vehicle.vehicletype != "veh_hawk_player_far_range_" + str_mode) {
                vehicle setvehicletype("veh_hawk_player_far_range_" + str_mode);
            }
        } else if (vehicle.vehicletype != "veh_hawk_player_" + str_mode) {
            vehicle setvehicletype("veh_hawk_player_" + str_mode);
        }
        waitframe(1);
    }
}

// Namespace hawk/hawk
// Params 1, eflags: 0x4
// Checksum 0x7141fb08, Offset: 0x680
// Size: 0x19c
function private on_vehicle_killed(params) {
    self endon(#"death", #"free_vehicle");
    if (!isdefined(self.scriptvehicletype) || self.scriptvehicletype != "hawk") {
        return;
    }
    if (target_istarget(self)) {
        target_remove(self);
    }
    if (isdefined(params)) {
        attacker = params.eattacker;
        if (isdefined(attacker) && isplayer(attacker) && isdefined(self.team) && self.team !== attacker.team) {
            if (isdefined(self.owner)) {
                self.owner thread killstreaks::play_taacom_dialog("hawkWeaponDestroyedEnemy");
            }
            scoreevents::processscoreevent("hawk_destroyed", attacker, self, params.weapon);
            if (isdefined(level.var_d2600afc)) {
                self [[ level.var_d2600afc ]](attacker, self.owner, self.weapon, params.weapon);
            }
        }
    }
    self hawk_destroy();
}

// Namespace hawk/hawk
// Params 1, eflags: 0x0
// Checksum 0xf38e139c, Offset: 0x828
// Size: 0x5c4
function hawk_destroy(var_bb2c398b = 0) {
    hawk = self;
    if (hawk.being_destroyed === 1) {
        return;
    }
    hawk.being_destroyed = 1;
    var_6f6e4d4d = "futz";
    var_9e2fe80f = 0.5;
    if (isdefined(level.hawk_settings) && isdefined(level.hawk_settings.bundle)) {
        var_6f6e4d4d = isdefined(level.hawk_settings.bundle.var_391e6668) ? level.hawk_settings.bundle.var_391e6668 : "futz";
        var_9e2fe80f = isdefined(level.hawk_settings.bundle.var_2f47b335) ? level.hawk_settings.bundle.var_2f47b335 : 0.5;
    }
    var_5755b643 = var_6f6e4d4d == "futz";
    hawk.can_control = 0;
    owner = hawk.var_55dded30;
    if (isdefined(owner) && owner.hawk.controlling) {
        owner.hawk.controlling = 0;
        if (var_5755b643 && !var_bb2c398b) {
            owner clientfield::set_to_player("static_postfx", 1);
            hawk vehicle_ai::set_state("death");
            hawk ghost();
            wait(var_9e2fe80f);
            if (isdefined(owner)) {
                owner clientfield::set_to_player("static_postfx", 0);
            }
        }
        if (isdefined(owner) && isdefined(hawk)) {
            if (owner isinvehicle()) {
                if (owner getvehicleoccupied() === hawk) {
                    hawk usevehicle(owner, 0);
                }
            }
        }
        if (isdefined(owner)) {
            owner util::function_9a39538a();
        }
        if (!var_5755b643 && isdefined(hawk)) {
            hawk vehicle_ai::set_state("death");
            hawk ghost();
        }
        if (!var_bb2c398b && !var_5755b643 && isdefined(owner) && isdefined(hawk)) {
            owner val::set(#"hawk", "freezecontrols", 1);
            forward = anglestoforward(hawk.angles);
            moveamount = vectorscale(forward, 350 * -1);
            trace = physicstrace(hawk.origin, hawk.origin + moveamount, (-4, -4, -4), (4, 4, 4), undefined, 1);
            cam = spawn("script_model", trace[#"position"]);
            cam setmodel(#"tag_origin");
            cam linkto(hawk);
            hawk setspeedimmediate(0);
            owner camerasetposition(cam.origin);
            owner camerasetlookat(hawk.origin);
            owner cameraactivate(1);
            wait(var_9e2fe80f);
            if (isdefined(owner)) {
                owner cameraactivate(0);
            }
            cam delete();
            if (isdefined(owner)) {
                owner val::reset(#"hawk", "freezecontrols");
                owner setclientuivisibilityflag("hud_visible", 1);
            }
        }
    } else {
        hawk vehicle_ai::set_state("death");
        hawk ghost();
    }
    wait(0.5);
    if (isdefined(hawk)) {
        hawk delete();
    }
}

