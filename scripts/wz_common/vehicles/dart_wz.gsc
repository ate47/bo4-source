#using scripts\core_common\callbacks_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\hud_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\popups_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicle_death_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\mp_common\item_inventory;
#using scripts\weapons\heatseekingmissile;

#namespace dart;

// Namespace dart/dart_wz
// Params 0, eflags: 0x2
// Checksum 0xf31f83bf, Offset: 0x250
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"dart_wz", &__init__, undefined, undefined);
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0x5306a8f, Offset: 0x298
// Size: 0xdc
function __init__() {
    callback::on_item_use(&on_item_use);
    vehicle::add_main_callback("dart_wz", &function_79a59d11);
    clientfield::register("toplayer", "dart_wz_out_of_circle", 24000, 5, "int");
    clientfield::register("toplayer", "dart_wz_static_postfx", 24000, 1, "int");
    clientfield::register("vehicle", "dart_wz_timeout_beep", 1, 1, "int");
}

// Namespace dart/dart_wz
// Params 2, eflags: 0x4
// Checksum 0x73cc0fda, Offset: 0x380
// Size: 0x84
function private kill_vehicle(attackingplayer, weapon = level.weaponnone) {
    damageorigin = self.origin + (0, 0, 1);
    self finishvehicleradiusdamage(self, undefined, 32000, 32000, 10, 0, "MOD_EXPLOSIVE", weapon, damageorigin, 400, -1, (0, 0, 1), 0);
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x4
// Checksum 0x9b7d844b, Offset: 0x410
// Size: 0x264
function private on_item_use(params) {
    self endon(#"death", #"disconnect");
    if (!isdefined(params.item) || !isdefined(params.item.itementry) || !isdefined(params.item.itementry.weapon) || params.item.itementry.weapon.name != #"dart") {
        return;
    }
    if (!self function_1e845317()) {
        return;
    }
    self function_bd506c77();
    if (!self function_1e845317()) {
        self take_remote();
        return;
    }
    traceresults = self spawn_trace();
    relativeorigin = undefined;
    var_2e2dbfa3 = undefined;
    if (isdefined(traceresults.hitent)) {
        relativeorigin = traceresults.origin - traceresults.hitent.origin;
        var_2e2dbfa3 = traceresults.hitent.angles;
    }
    spawnorigin = traceresults.origin;
    if (isdefined(traceresults.hitent) && isdefined(relativeorigin)) {
        anglesdelta = traceresults.hitent.angles - var_2e2dbfa3;
        spawnorigin = traceresults.hitent.origin + rotatepoint(relativeorigin, anglesdelta);
    }
    self thread throw_dart(spawnorigin, traceresults.angles, params.item.id);
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x4
// Checksum 0x4ef96acb, Offset: 0x680
// Size: 0x6e
function private function_1e845317() {
    if (self clientfield::get_to_player("inside_infiltration_vehicle") != 0) {
        return false;
    }
    if (self isinvehicle()) {
        return false;
    }
    if (!function_3238d10d(self.origin)) {
        return false;
    }
    return true;
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x4
// Checksum 0x7fb67844, Offset: 0x6f8
// Size: 0xee
function private function_bd506c77() {
    self endon(#"death", #"disconnect");
    remoteweapon = getweapon(#"warzone_remote");
    if (self hasweapon(remoteweapon)) {
        return;
    }
    if (self isswitchingweapons()) {
        self waittilltimeout(2, #"weapon_change");
    }
    self giveweapon(remoteweapon);
    self switchtoweapon(remoteweapon, 1);
    self waittilltimeout(2, #"weapon_change");
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x4
// Checksum 0xe274e21c, Offset: 0x7f0
// Size: 0x44
function private take_remote() {
    remoteweapon = getweapon(#"warzone_remote");
    self takeweapon(remoteweapon);
}

// Namespace dart/dart_wz
// Params 3, eflags: 0x4
// Checksum 0xeea4cbb8, Offset: 0x840
// Size: 0x214
function private throw_dart(spawnorigin, spawnangles, itemid) {
    self endon(#"death", #"disconnect");
    playereyepos = self getplayercamerapos();
    vehicle = spawnvehicle(#"veh_dart_wz", spawnorigin, spawnangles);
    if (isdefined(vehicle)) {
        level.item_vehicles[level.item_vehicles.size] = vehicle;
        vehicle.id = itemid;
        vehicle setteam(self.team);
        vehicle.team = self.team;
        vehicle setowner(self);
        vehicle.owner = self;
        vehicle.ownerentnum = self.entnum;
        vehicle thread item_inventory::function_956a8ecd();
        target_set(vehicle, (0, 0, 0));
        assert(vehicle isremotecontrol());
        vehicle usevehicle(self, 0);
        if (!self function_f35d7cf3(playereyepos, vehicle)) {
            vehicle.origin = playereyepos;
            vehicle kill_vehicle(self, getweapon(#"dart"));
        }
        return;
    }
    self take_remote();
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x4
// Checksum 0xd033e17b, Offset: 0xa60
// Size: 0x34
function private function_5f9c568d(params) {
    player = self.owner;
    player thread function_ea9fe221(self);
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0xa9a49827, Offset: 0xaa0
// Size: 0x7e
function function_79a59d11() {
    self disabledriverfiring(1);
    self.ignore_death_jolt = 1;
    self.var_92043a49 = 1;
    self.is_staircase_up = &function_5f9c568d;
    self.vehcheckforpredictedcrash = 1;
    self.predictedcollisiontime = 0.2;
    self.var_4ab08c1d = 1;
    self.glasscollision_alt = 1;
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x4
// Checksum 0xa676b4d7, Offset: 0xb28
// Size: 0x13a
function private spawn_trace() {
    eyeangle = self getplayerangles();
    forward = anglestoforward(eyeangle);
    eyepos = self getplayercamerapos();
    endpos = eyepos + forward * 50;
    var_f45df727 = eyepos + forward * 200;
    traceresults = {};
    traceresults.trace = bullettrace(eyepos, var_f45df727, 1, self, 1, 1);
    traceresults.isvalid = traceresults.trace[#"fraction"] >= 1;
    traceresults.waterdepth = 0;
    traceresults.origin = endpos;
    traceresults.angles = eyeangle;
    return traceresults;
}

// Namespace dart/dart_wz
// Params 2, eflags: 0x4
// Checksum 0x480206d6, Offset: 0xc70
// Size: 0x188
function private function_f35d7cf3(playereyepos, vehicle) {
    eyeangle = self getplayerangles();
    forward = anglestoforward(eyeangle);
    eyepos = playereyepos;
    endpos = vehicle.origin;
    trace = bullettrace(eyepos, endpos, 1, self, 1, 1);
    if (trace[#"fraction"] < 1) {
        return false;
    }
    mins = (vehicle.radius * -1, vehicle.radius * -1, vehicle.radius * -1);
    maxs = (vehicle.radius, vehicle.radius, vehicle.radius);
    trace = physicstraceex(eyepos, endpos, mins, maxs, self, 1);
    return trace[#"fraction"] >= 1;
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x0
// Checksum 0x47a34b0c, Offset: 0xe00
// Size: 0x62
function on_vehicle_damage(params) {
    if (params.smeansofdeath === "MOD_CRUSH" && self isvehicleusable()) {
        self.idflags |= 8192;
    }
    return params.idamage;
}

// Namespace dart/enter_vehicle
// Params 1, eflags: 0x40
// Checksum 0xf69cef3d, Offset: 0xe70
// Size: 0x19c
function event_handler[enter_vehicle] codecallback_vehicleenter(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    vehicle = eventstruct.vehicle;
    if (!isdefined(vehicle.scriptvehicletype) || vehicle.scriptvehicletype != #"dart_wz") {
        return;
    }
    vehicle.owner = self;
    self clientfield::set_to_player("dart_wz_static_postfx", 1);
    vehicle enabledartmissilelocking();
    self thread function_d13b1540(vehicle);
    vehicle thread watchownerdisconnect(self);
    vehicle thread watchremotecontroldeactivate();
    vehicle thread function_b35c5fa4();
    vehicle callback::on_vehicle_collision(&dartcollision);
    vehicle callback::function_d8abfc3d(#"on_vehicle_damage", &on_vehicle_damage);
    vehicle callback::function_d8abfc3d(#"on_vehicle_killed", &on_vehicle_killed);
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0xa10341d2, Offset: 0x1018
// Size: 0xe0
function watchremotecontroldeactivate() {
    self notify("45eaa61d466e347f");
    self endon("45eaa61d466e347f");
    dart = self;
    player = self.owner;
    dart endon(#"death", #"remote_weapon_end");
    player endon(#"disconnect");
    while (player attackbuttonpressed()) {
        waitframe(1);
    }
    while (true) {
        if (player attackbuttonpressed()) {
            player thread function_ea9fe221(dart);
            return;
        }
        waitframe(1);
    }
}

// Namespace dart/exit_vehicle
// Params 1, eflags: 0x40
// Checksum 0x8f86a72, Offset: 0x1100
// Size: 0x8c
function event_handler[exit_vehicle] codecallback_vehicleexit(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    vehicle = eventstruct.vehicle;
    if (!isdefined(vehicle.scriptvehicletype) || vehicle.scriptvehicletype != #"dart_wz") {
        return;
    }
    self thread function_ea9fe221(vehicle);
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x0
// Checksum 0x8b87c381, Offset: 0x1198
// Size: 0x8c
function watchownerdisconnect(player) {
    self notify("3e0604a78c24647e");
    self endon("3e0604a78c24647e");
    self endon(#"death");
    player waittill(#"disconnect", #"death");
    self makevehicleunusable();
    self kill_vehicle(self);
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x4
// Checksum 0xd2a3cd31, Offset: 0x1230
// Size: 0x4c8
function private function_d13b1540(vehicle) {
    self notify("6f85cb6661241b51");
    self endon("6f85cb6661241b51");
    self endon(#"death", #"disconnect");
    vehicle endon(#"death", #"exit_vehicle");
    var_51fede25 = gettime() + 30000;
    self vehicle::set_vehicle_drivable_time_starting_now(30000);
    var_5fa298a1 = var_51fede25 - 10000;
    var_5cf8708d = 0;
    while (true) {
        time = gettime();
        if (1 && time >= var_51fede25) {
            self thread function_ea9fe221(vehicle);
            break;
        }
        if (self inlaststand()) {
            self thread function_ea9fe221(vehicle);
            break;
        }
        if (isdefined(self.isjammed) && self.isjammed) {
            self thread function_ea9fe221(vehicle);
            break;
        }
        if (self clientfield::get_to_player("inside_infiltration_vehicle") != 0) {
            self thread function_ea9fe221(vehicle);
            break;
        }
        if (1 && time >= var_5fa298a1 && !(isdefined(var_5cf8708d) && var_5cf8708d)) {
            var_5cf8708d = 1;
            vehicle clientfield::set("dart_wz_timeout_beep", 1);
        }
        if (true) {
            var_aba3faed = distancesquared(self.origin, vehicle.origin);
            if (var_aba3faed > 8000 * 8000) {
                self thread function_ea9fe221(vehicle);
            }
        }
        waterheight = getwaterheight(vehicle.origin, 100, -10000);
        if (waterheight != -131072) {
            var_19dbcac7 = vehicle.origin[2] - waterheight;
            if (var_19dbcac7 <= 0) {
                self thread function_ea9fe221(vehicle, 1);
            }
        }
        if (isdefined(level.deathcircle)) {
            if (distance2dsquared(vehicle.origin, level.deathcircle.origin) > level.deathcircle.radius * level.deathcircle.radius) {
                if (!isdefined(vehicle.var_3de57a77)) {
                    vehicle.var_3de57a77 = gettime();
                }
                var_a71a8383 = gettime() - vehicle.var_3de57a77;
                if (int(3 * 1000) <= var_a71a8383) {
                    vehicle usevehicle(self, 0);
                    self clientfield::set_to_player("recon_out_of_circle", 0);
                }
                var_e96a9222 = min(var_a71a8383, int(3 * 1000));
                var_e96a9222 /= int(3 * 1000);
                var_e96a9222 *= 31;
                self clientfield::set_to_player("recon_out_of_circle", int(var_e96a9222));
                waitframe(1);
            } else {
                self clientfield::set_to_player("recon_out_of_circle", 0);
                vehicle.var_3de57a77 = undefined;
                wait 0.5;
            }
            continue;
        }
        wait 0.1;
    }
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0x1aa9c86d, Offset: 0x1700
// Size: 0x106
function function_3a595d3c() {
    camera_pos = isdefined(self.owner) && isdefined(self getseatoccupant(0)) ? self.owner getplayercamerapos() : self.origin;
    dir = anglestoforward(self.angles);
    results = bullettrace(camera_pos, camera_pos + dir * 96, 1, self, 1, 1);
    if (isdefined(results)) {
        if (isdefined(results[#"fraction"]) && results[#"fraction"] > 0.99) {
            return true;
        }
    }
    return false;
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x4
// Checksum 0xbf547e45, Offset: 0x1810
// Size: 0xa8
function private function_c6ac711a(target) {
    if (!isdefined(target)) {
        return false;
    }
    if (target.classname != "grenade") {
        return false;
    }
    if (!isdefined(target.weapon) || target.weapon.name != #"dart") {
        return false;
    }
    if (!isdefined(target.owner) || target.owner != self) {
        return false;
    }
    return true;
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0xd16d34d1, Offset: 0x18c0
// Size: 0x182
function function_b35c5fa4() {
    self notify("5a365a749191eb18");
    self endon("5a365a749191eb18");
    dart = self;
    player = dart.owner;
    dart endon(#"death");
    player endon(#"death");
    while (true) {
        waitresult = dart waittill(#"veh_predictedcollision");
        if (waitresult.stype == "glass") {
            continue;
        }
        if (player function_c6ac711a(waitresult.target)) {
            continue;
        }
        if (!isdefined(waitresult.target) && (waitresult.stype === "default" || waitresult.stype === "")) {
            if (self function_3a595d3c()) {
                continue;
            }
        }
        player = dart.owner;
        player thread function_ea9fe221(dart, 1);
        return;
    }
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x0
// Checksum 0x22699f6d, Offset: 0x1a50
// Size: 0xcc
function dartcollision(params) {
    dart = self;
    player = dart.owner;
    if (params.stype == "glass") {
        return;
    }
    if (!isdefined(params.entity) && (params.stype === "default" || params.stype === "")) {
        if (self function_3a595d3c()) {
            return;
        }
    }
    player thread function_ea9fe221(dart, 1);
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x0
// Checksum 0xcabbf2ab, Offset: 0x1b28
// Size: 0x8c
function leave_dart(dart) {
    if (isdefined(self)) {
        if (isdefined(dart) && self isinvehicle() && self getvehicleoccupied() == dart) {
            dart usevehicle(self, 0);
        }
        self take_remote();
    }
}

// Namespace dart/dart_wz
// Params 2, eflags: 0x0
// Checksum 0xb65582b7, Offset: 0x1bc0
// Size: 0x58c
function function_ea9fe221(dart, collision) {
    player = self;
    if (isdefined(dart)) {
        if (isdefined(dart.var_ea9fe221) && dart.var_ea9fe221) {
            return;
        }
        dart.var_ea9fe221 = 1;
    }
    if (isdefined(player) && player clientfield::get_to_player("inside_infiltration_vehicle") != 0) {
        player clientfield::set_to_player("dart_wz_static_postfx", 0);
        player leave_dart(dart);
        if (isdefined(dart)) {
            dart kill_vehicle(player, getweapon(#"dart"));
        }
        return;
    }
    waitframe(1);
    if (isdefined(player) && isplayer(player)) {
        player clientfield::set_to_player("dart_wz_static_postfx", 0);
        player val::set(#"dart", "freezecontrols", 1);
        player enableweaponcycling();
        player setclientuivisibilityflag("hud_visible", 0);
    }
    if (isdefined(dart) && isvehicle(dart)) {
        dart disabledartmissilelocking();
        dart setspeedimmediate(0);
        if (isdefined(player) && isplayer(player) && !isbot(player)) {
            forward = anglestoforward(dart.angles);
            moveamount = vectorscale(forward, 300 * -1);
            trace = physicstrace(dart.origin, dart.origin + moveamount, (4 * -1, 4 * -1, 4 * -1), (4, 4, 4), undefined, 1);
            cam = spawn("script_model", trace[#"position"]);
            cam setmodel(#"tag_origin");
            cam linkto(dart);
            cam util::deleteaftertime(5);
        }
        dart kill_vehicle(player, getweapon(#"dart"));
    }
    if (isdefined(cam)) {
        player camerasetposition(cam.origin);
        player camerasetlookat(dart.origin);
        player cameraactivate(1);
    }
    if (isdefined(player) && isplayer(player) && !isbot(player)) {
        player vehicle::stop_monitor_missiles_locked_on_to_me();
        player vehicle::stop_monitor_damage_as_occupant();
    }
    waittime = 0.5;
    if (isdefined(collision) && collision) {
        waittime = 2;
    }
    wait waittime;
    if (isdefined(player) && isplayer(player)) {
        player setclientuivisibilityflag("hud_visible", 1);
        player val::reset(#"dart", "freezecontrols");
        player cameraactivate(0);
        player leave_dart(dart);
        player thread hud::fade_to_black_for_x_sec(0, 0.3, 0, 0.1);
    }
    if (isdefined(cam)) {
        cam delete();
    }
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x4
// Checksum 0x42e626e1, Offset: 0x2158
// Size: 0x15c
function private on_vehicle_killed(params) {
    if (isdefined(params.occupants)) {
        if (params.occupants.size > 0 && self function_c7aa9338(params.occupants)) {
            if (isplayer(params.eattacker)) {
                params.eattacker stats::function_dad108fa(#"destroy_equipment", 1);
                callback::callback(#"hash_67dd51a5d529c64c");
            }
        }
    }
    if (isdefined(self.owner) && isplayer(self.owner)) {
        self.owner leave_dart(self);
    }
    wait 0.1;
    if (isdefined(self)) {
        self.var_4217cfcb = 1;
        self ghost();
    }
    wait 2;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x4
// Checksum 0xae4ae137, Offset: 0x22c0
// Size: 0x9a
function private function_c7aa9338(array) {
    foreach (ent in array) {
        if (util::function_fbce7263(ent.team, self.team)) {
            return true;
        }
    }
    return false;
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0x1afac91f, Offset: 0x2368
// Size: 0x6a
function getdartmissiletargets() {
    targets = arraycombine(target_getarray(), level.missileentities, 0, 0);
    targets = arraycombine(targets, level.players, 0, 0);
    return targets;
}

// Namespace dart/dart_wz
// Params 1, eflags: 0x0
// Checksum 0x4deade95, Offset: 0x23e0
// Size: 0x140
function isvaliddartmissiletarget(ent) {
    player = self;
    if (!isdefined(ent)) {
        return false;
    }
    entisplayer = isplayer(ent);
    if (entisplayer && !isalive(ent)) {
        return false;
    }
    if (ent.ignoreme === 1) {
        return false;
    }
    dart = player getvehicleoccupied();
    if (!isdefined(dart)) {
        return false;
    }
    if (distancesquared(dart.origin, ent.origin) > player.dart_killstreak_weapon.lockonmaxrange * player.dart_killstreak_weapon.lockonmaxrange) {
        return false;
    }
    if (entisplayer && ent hasperk(#"specialty_nokillstreakreticle")) {
        return false;
    }
    return true;
}

// Namespace dart/dart_wz
// Params 2, eflags: 0x0
// Checksum 0x94867430, Offset: 0x2528
// Size: 0x1ae
function isstillvaliddartmissiletarget(ent, weapon) {
    player = self;
    if (!(target_istarget(ent) || isplayer(ent)) && !(isdefined(ent.allowcontinuedlockonafterinvis) && ent.allowcontinuedlockonafterinvis)) {
        return false;
    }
    dart = player getvehicleoccupied();
    if (!isdefined(dart)) {
        return false;
    }
    entisplayer = isplayer(ent);
    if (entisplayer && !isalive(ent)) {
        return false;
    }
    if (ent.ignoreme === 1) {
        return false;
    }
    if (distancesquared(dart.origin, ent.origin) > player.dart_killstreak_weapon.lockonmaxrange * player.dart_killstreak_weapon.lockonmaxrange) {
        return false;
    }
    if (entisplayer && ent hasperk(#"specialty_nokillstreakreticle")) {
        return false;
    }
    if (!heatseekingmissile::insidestingerreticlelocked(ent, undefined, weapon)) {
        return false;
    }
    return true;
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0x794c004e, Offset: 0x26e0
// Size: 0x8c
function disabledartmissilelocking() {
    dart = self;
    player = dart.owner;
    if (isdefined(player)) {
        player.get_stinger_target_override = undefined;
        player.is_still_valid_target_for_stinger_override = undefined;
        player.is_valid_target_for_stinger_override = undefined;
        player.dart_killstreak_weapon = undefined;
        player notify(#"stinger_irt_off");
        player heatseekingmissile::clearirtarget();
    }
}

// Namespace dart/dart_wz
// Params 0, eflags: 0x0
// Checksum 0xc26b6f36, Offset: 0x2778
// Size: 0xc4
function enabledartmissilelocking() {
    dart = self;
    player = dart.owner;
    weapon = dart seatgetweapon(0);
    if (isdefined(player)) {
        player.get_stinger_target_override = &getdartmissiletargets;
        player.is_still_valid_target_for_stinger_override = &isstillvaliddartmissiletarget;
        player.is_valid_target_for_stinger_override = &isvaliddartmissiletarget;
        player.dart_killstreak_weapon = weapon;
        player thread heatseekingmissile::stingerirtloop(weapon);
    }
}

