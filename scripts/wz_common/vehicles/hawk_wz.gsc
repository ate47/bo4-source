// Atian COD Tools GSC decompiler test
#include scripts/mp_common/item_inventory.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/gestures.gsc;
#include scripts/core_common/oob.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/killstreaks/airsupport.gsc;
#include scripts/core_common/vehicles/hawk.gsc;
#include scripts/core_common/vehicle_ai_shared.gsc;
#include scripts/core_common/globallogic/globallogic_score.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/util_shared.gsc;

#namespace hawk_wz;

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x2
// Checksum 0x322e18db, Offset: 0x1b8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hawk_wz", &__init__, undefined, undefined);
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x1 linked
// Checksum 0x1a3c024f, Offset: 0x200
// Size: 0x10c
function __init__() {
    level.hawk_settings = spawnstruct();
    level.hawk_settings.weapon = getweapon(#"eq_hawk");
    level.hawk_settings.bundle = getscriptbundle("hawk_settings_wz");
    /#
        assert(isdefined(level.hawk_settings.bundle));
    #/
    callback::on_finalize_initialization(&function_3675de8b);
    callback::on_item_use(&on_item_use);
    clientfield::register("vehicle", "hawk_range", 13000, 1, "int");
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x1 linked
// Checksum 0xdb538ff1, Offset: 0x318
// Size: 0x56
function function_3675de8b() {
    map_center = airsupport::getmapcenter();
    level.var_5718bd08 = isdefined(level.var_7fd6bd44) ? level.var_7fd6bd44 : map_center[2] + 1000;
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x5 linked
// Checksum 0xb8041cbd, Offset: 0x378
// Size: 0x11c
function private on_item_use(params) {
    self endon(#"death", #"disconnect", #"begin_grenade_tracking", #"grenade_throw_cancelled");
    if (!isdefined(params.item) || !isdefined(params.item.var_a6762160) || !isdefined(params.item.var_a6762160.weapon) || params.item.var_a6762160.weapon.name != #"eq_hawk") {
        return;
    }
    self waittill(#"grenade_fire");
    self thread spawn_hawk(params.item.id);
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x1 linked
// Checksum 0x54cca7f0, Offset: 0x4a0
// Size: 0x4a
function function_6ada73f(spawnpos) {
    return physicstrace(self.origin, spawnpos, vectorscale((-1, -1, 0), 18), (18, 18, 12), undefined, 16 | 2);
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x5 linked
// Checksum 0xb71a6076, Offset: 0x4f8
// Size: 0x2c
function private function_900bb4f5(params) {
    if (isdefined(self)) {
        self thread hawk::hawk_destroy();
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x1 linked
// Checksum 0x7217d9c5, Offset: 0x530
// Size: 0x644
function spawn_hawk(itemid) {
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    if (isdefined(self.hawk) && isdefined(self.hawk.vehicle)) {
        self.hawk.vehicle hawk::hawk_destroy(1);
    }
    self.hawk = spawnstruct();
    vehicletype = "veh_hawk_player_wz";
    playerangles = self getplayerangles();
    var_865c71c9 = (playerangles[0], playerangles[1], 0);
    var_c7588ce0 = (0, playerangles[1], 0);
    forward = anglestoforward(var_c7588ce0);
    forward = forward * 20;
    spawnpos = self.origin + vectorscale((0, 0, 1), 90) + forward;
    trace = self function_6ada73f(spawnpos);
    if (trace[#"fraction"] < 1) {
        spawnpos = self.origin + vectorscale((0, 0, 1), 75) + forward;
        trace = function_6ada73f(spawnpos);
    }
    if (trace[#"fraction"] < 1) {
        spawnpos = self.origin + vectorscale((0, 0, 1), 45) + forward;
        trace = function_6ada73f(spawnpos);
    }
    if (trace[#"fraction"] < 1) {
        spawnpos = self.origin + vectorscale((0, 0, 1), 75);
        trace = function_6ada73f(spawnpos);
    }
    if (trace[#"fraction"] < 1) {
        spawnpos = self.origin + vectorscale((0, 0, 1), 45);
    }
    if (!function_3238d10d(spawnpos)) {
        self.hawk = undefined;
        return;
    }
    vehicle = spawnvehicle(vehicletype, spawnpos, var_c7588ce0);
    vehicle setteam(self.team);
    vehicle.team = self.team;
    vehicle.owner = self;
    vehicle.weapon = getweapon("eq_hawk");
    vehicle.var_20c71d46 = 1;
    vehicle.overridevehicledamage = &function_b162cdbd;
    vehicle.var_c5d65381 = 1;
    vehicle.var_8516173f = 1;
    vehicle.glasscollision_alt = 1;
    vehicle.is_staircase_up = &function_900bb4f5;
    vehicle.id = itemid;
    level.item_vehicles[level.item_vehicles.size] = vehicle;
    vehicle thread item_inventory::function_956a8ecd();
    self.hawk.vehicle = vehicle;
    bundle = level.hawk_settings.bundle;
    var_a33bcd86 = int(isdefined(bundle.var_a33bcd86) ? bundle.var_a33bcd86 : 0);
    if (isbot(self)) {
        var_a33bcd86 = 0;
    }
    if (isdefined(vehicle)) {
        if (var_a33bcd86) {
            self freezecontrolsallowlook(1);
            util::wait_network_frame(1);
            if (!isalive(vehicle)) {
                return;
            }
        }
        vehicle.can_control = 1;
        if (var_a33bcd86) {
            self.hawk.controlling = 1;
            self thread function_1b057db2();
            vehicle usevehicle(self, 0);
            self setplayerangles(var_865c71c9);
            self freezecontrolsallowlook(0);
            self util::setusingremote("hawk");
        } else {
            vehicle.var_e9f68b24 = var_865c71c9;
        }
        self thread function_1e7eecd7(vehicle, var_a33bcd86);
        self thread watch_destroyed(vehicle);
        self thread hawk_update(vehicle);
        self create_missile_hud(vehicle, var_a33bcd86);
        self thread watch_team_change(vehicle);
        self thread oob::function_c5278cb0(vehicle);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 15, eflags: 0x1 linked
// Checksum 0xfe1ad4dc, Offset: 0xb80
// Size: 0x118
function function_b162cdbd(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (gettime() - self.birthtime <= 350) {
        return 0;
    }
    startinghealth = 400;
    if (isdefined(level.hawk_settings.bundle.var_108f064f) && weapon == getweapon(#"shock_rifle")) {
        idamage = startinghealth / level.hawk_settings.bundle.var_108f064f;
    }
    return idamage;
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x1 linked
// Checksum 0x33ad2170, Offset: 0xca0
// Size: 0xe2
function hawk_update(vehicle) {
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    vehicle endon(#"death");
    playerorigin = self.origin;
    while (1) {
        playerorigin = update_range(vehicle, playerorigin);
        if (isdefined(self.isjammed) && self.isjammed) {
            self thread function_1eddba48();
            break;
        }
        waitframe(1);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x1 linked
// Checksum 0xc36b01bd, Offset: 0xd90
// Size: 0x2d6
function update_range(vehicle, playerorigin) {
    if (isalive(self)) {
        playerorigin = self.origin;
    }
    vehicle.var_b61d83c4 = 0;
    self.hawk.var_b61d83c4 = 0;
    distsqr = distancesquared(vehicle.origin, playerorigin);
    if (distsqr > level.hawk_settings.bundle.far_distance * level.hawk_settings.bundle.far_distance || vehicle.origin[2] > level.var_5718bd08) {
        vehicle clientfield::set("hawk_range", 1);
        vehicle.var_b61d83c4 = 1;
        self.hawk.var_b61d83c4 = 1;
    } else {
        vehicle clientfield::set("hawk_range", 0);
    }
    if (isalive(self) && self isinvehicle() && self getvehicleoccupied() == vehicle) {
        if (distsqr > level.hawk_settings.bundle.max_distance * level.hawk_settings.bundle.max_distance) {
            self thread function_1eddba48();
        }
        if (isdefined(level.deathcircle)) {
            if (distance2dsquared(vehicle.origin, level.deathcircle.origin) > level.deathcircle.radius * level.deathcircle.radius) {
                if (!isdefined(vehicle.var_3de57a77)) {
                    vehicle.var_3de57a77 = gettime();
                }
                var_a71a8383 = gettime() - vehicle.var_3de57a77;
                if (int(1 * 1000) <= var_a71a8383) {
                    vehicle hawk::hawk_destroy();
                }
            } else {
                vehicle.var_3de57a77 = undefined;
            }
        }
    }
    return playerorigin;
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x1 linked
// Checksum 0x7e56b4d, Offset: 0x1070
// Size: 0x74
function watch_destroyed(vehicle) {
    self endon(#"disconnect");
    vehicle waittill(#"death");
    if (isdefined(self)) {
        if (!self util::function_63d27d4e("remote_missile")) {
            self destroy_missile_hud();
        }
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x1 linked
// Checksum 0x673e7954, Offset: 0x10f0
// Size: 0xc6
function function_d89c1628(vehicle) {
    if (!(isdefined(vehicle.can_control) && vehicle.can_control)) {
        return 0;
    }
    if (self isremotecontrolling() || self util::isusingremote()) {
        return 0;
    }
    if (self.hawk.var_a3b23d12) {
        return 0;
    }
    if (!self fragbuttonpressed()) {
        return 0;
    }
    if (self function_15049d95()) {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    return 1;
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x5 linked
// Checksum 0xa9af71c7, Offset: 0x11c0
// Size: 0x1c4
function private function_1eddba48() {
    if (!isdefined(self) || !isdefined(self.hawk) || !isdefined(self.hawk.vehicle) || self.hawk.vehicle.var_55dded30 !== self) {
        return;
    }
    hawk = self.hawk.vehicle;
    if (hawk.var_720290e3 === 1) {
        return;
    }
    hawk.var_720290e3 = 1;
    hawk.can_control = 0;
    self.hawk.controlling = 0;
    self clientfield::set_to_player("static_postfx", 1);
    var_9e2fe80f = isdefined(level.hawk_settings.bundle.var_2f47b335) ? level.hawk_settings.bundle.var_2f47b335 : 0.5;
    wait(var_9e2fe80f);
    if (isdefined(self)) {
        self clientfield::set_to_player("static_postfx", 0);
    }
    if (isdefined(self) && isdefined(hawk) && self isinvehicle() && self getvehicleoccupied() === hawk) {
        hawk usevehicle(self, 0);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x1 linked
// Checksum 0xf4206efb, Offset: 0x1390
// Size: 0x428
function function_1e7eecd7(vehicle, var_44e9a475) {
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    vehicle endon(#"death");
    if (var_44e9a475) {
        self.hawk.controlling = 1;
        vehicle.var_55dded30 = self;
        vehicle.playercontrolled = 1;
    } else {
        self.hawk.controlling = 0;
        vehicle.var_55dded30 = undefined;
        vehicle.playercontrolled = 0;
    }
    self.hawk.var_a3b23d12 = 1;
    while (1) {
        if (self.hawk.controlling) {
            self thread function_c4770b46(vehicle);
            self waittill(#"exit_vehicle");
            self.hawk.controlling = 0;
            vehicle.player = self;
            vehicle.var_55dded30 = undefined;
            vehicle.playercontrolled = 0;
            vehicle setspeedimmediate(0);
            vehicle setvehvelocity((0, 0, 0));
            vehicle setphysacceleration((0, 0, 0));
            vehicle setangularvelocity((0, 0, 0));
            vehicle setneargoalnotifydist(40);
            vehicle setgoal(vehicle.origin, 1);
            vehicle function_a57c34b7(vehicle.origin, 1, 0);
            vehicle makevehicleunusable();
            self util::function_9a39538a();
            self.hawk.var_a3b23d12 = 1;
            self playsoundtoplayer("gdt_hawk_pov_out", self);
            if (!(isdefined(vehicle.being_destroyed) && vehicle.being_destroyed)) {
                vehicle notify(#"hawk_settled");
            }
            return;
        } else {
            if (self function_d89c1628(vehicle)) {
                self.hawk.controlling = 1;
                self thread function_1b057db2();
                vehicle usevehicle(self, 0);
                vehicle.var_55dded30 = self;
                vehicle.playercontrolled = 1;
                self util::setusingremote("hawk");
                vehicle playsoundtoplayer("gdt_hawk_pov_in", self);
                self freezecontrolsallowlook(0);
                vehicle vehicle_ai::clearallmovement();
                vehicle function_d4c687c9();
                if (isdefined(vehicle.var_e9f68b24)) {
                    self setplayerangles(vehicle.var_e9f68b24);
                }
            } else if (!self fragbuttonpressed()) {
                self.hawk.var_a3b23d12 = 0;
            }
            waitframe(1);
        }
    }
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x1 linked
// Checksum 0x6ed4927d, Offset: 0x17c0
// Size: 0x1de
function function_1b057db2() {
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    self notify("6954b7d60005c9f0");
    self endon("6954b7d60005c9f0");
    var_10a85d23 = self gestures::function_c77349d4("gestable_drone_hawk_pda");
    self stopgestureviewmodel(var_10a85d23, 0, 0);
    if (isdefined(self.var_f97921ea)) {
        var_a4137bf5 = gettime() - self.var_f97921ea;
        if (var_a4137bf5 < 850) {
            wait(float(850 - var_a4137bf5) / 1000);
        }
    }
    var_37ea2019 = 0;
    while (!var_37ea2019 && isalive(self) && self.hawk.controlling) {
        if (self gestures::play_gesture(var_10a85d23, undefined, 0)) {
            var_37ea2019 = 1;
            self waittill(#"exit_vehicle", #"death");
            self.var_f97921ea = gettime();
            self stopgestureviewmodel(var_10a85d23, 0, 0);
        }
        waitframe(1);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x1 linked
// Checksum 0x81303fe7, Offset: 0x19a8
// Size: 0x4e
function function_9096c10() {
    return self usebuttonpressed() || self stancebuttonpressed() && self gamepadusedlast();
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x1 linked
// Checksum 0xba49f5f8, Offset: 0x1a00
// Size: 0x124
function function_c4770b46(vehicle) {
    self notify("7ebee304d299c8bb");
    self endon("7ebee304d299c8bb");
    vehicle endon(#"death");
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death", #"exit_vehicle");
    while (self function_9096c10()) {
        waitframe(1);
    }
    while (!self function_9096c10()) {
        waitframe(1);
    }
    while (self function_9096c10()) {
        waitframe(1);
    }
    waitframe(1);
    vehicle usevehicle(self, 0);
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x1 linked
// Checksum 0x7de5e03e, Offset: 0x1b30
// Size: 0xa0
function watch_team_change(hawk) {
    hawk endon(#"death");
    waitresult = undefined;
    waitresult = self waittill(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist", #"changed_specialist_death");
    if (!isdefined(hawk)) {
        return;
    }
    hawk notify(#"hawk_settled");
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x1 linked
// Checksum 0xf1cbc715, Offset: 0x1bd8
// Size: 0x4c
function create_missile_hud(vehicle, var_a33bcd86) {
    player = self;
    if (var_a33bcd86) {
        vehicle playsoundtoplayer("gdt_hawk_pov_in", self);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1c30
// Size: 0x4
function destroy_missile_hud() {
    
}

