#using scripts\mp_common\gametypes\battlechatter;
#using scripts\weapons\deployable;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicles\rcxd;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\vehicle_death_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\oob;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\remote_weapons;
#using scripts\killstreaks\killstreakrules_shared;
#using scripts\killstreaks\killstreak_hacking;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\audio_shared;
#using scripts\abilities\ability_player;

#namespace killstreak_vehicle;

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x4e2c5766, Offset: 0x228
// Size: 0x34
function init() {
    clientfield::register("vehicle", "stunned", 1, 1, "int");
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x713f3ac5, Offset: 0x268
// Size: 0x14c
function init_killstreak(bundle) {
    killstreaks::register_bundle(bundle, &activate_vehicle);
    killstreaks::allow_assists(bundle.var_d3413870, 1);
    remote_weapons::registerremoteweapon(bundle.ksweapon.name, #"", &function_c9aa9ee5, &function_8cb72281, 0);
    vehicle::add_main_callback(bundle.ksvehicle, &init_vehicle);
    deployable::register_deployable(bundle.ksweapon, undefined, undefined);
    level.killstreaks[bundle.var_d3413870].var_b6c17aab = 1;
    if (isdefined(bundle.var_486124e6)) {
        visionset_mgr::register_info("overlay", bundle.var_486124e6, 1, 1, 1, 1);
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0xac9e3204, Offset: 0x3c0
// Size: 0x11c
function init_vehicle() {
    vehicle = self;
    vehicle clientfield::set("enemyvehicle", 1);
    vehicle.allowfriendlyfiredamageoverride = &function_e9da8b7d;
    vehicle enableaimassist();
    vehicle setdrawinfrared(1);
    vehicle.delete_on_death = 1;
    vehicle.death_enter_cb = &function_3c6cec8b;
    vehicle.disableremoteweaponswitch = 1;
    vehicle.overridevehicledamage = &on_damage;
    vehicle.overridevehiclekilled = &on_death;
    vehicle.watch_remote_weapon_death = 1;
    vehicle.watch_remote_weapon_death_duration = 0.3;
    vehicle util::make_sentient();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x4c73e9f7, Offset: 0x4e8
// Size: 0xda
function function_3c6cec8b() {
    remote_controlled = isdefined(self.control_initiated) && self.control_initiated || isdefined(self.controlled) && self.controlled;
    if (remote_controlled) {
        notifystring = self waittill(#"remote_weapon_end", #"shutdown");
        if (notifystring._notify == "remote_weapon_end") {
            self waittill(#"shutdown");
        } else {
            self waittill(#"remote_weapon_end");
        }
        return;
    }
    self waittill(#"shutdown");
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x6c52b285, Offset: 0x5d0
// Size: 0xa4
function function_aba709c3(hacker) {
    vehicle = self;
    vehicle clientfield::set("toggle_lights", 1);
    vehicle.owner unlink();
    vehicle clientfield::set("vehicletransition", 0);
    vehicle.owner killstreaks::clear_using_remote();
    vehicle makevehicleunusable();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0xf973ab09, Offset: 0x680
// Size: 0xc4
function function_2df6e3bf(hacker) {
    killstreak_type = level.var_8997324c[self];
    bundle = level.killstreaks[killstreak_type].script_bundle;
    vehicle = self;
    hacker remote_weapons::useremoteweapon(vehicle, bundle.ksweapon, 1, 0);
    vehicle makevehicleunusable();
    vehicle killstreaks::set_killstreak_delay_killcam(killstreak_type);
    vehicle killstreak_hacking::set_vehicle_drivable_time_starting_now(vehicle);
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x27b2a1b0, Offset: 0x750
// Size: 0x4c
function function_fff56140(owner) {
    self endon(#"shutdown");
    self killstreaks::function_fff56140(owner, &function_822e1f64);
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2, eflags: 0x0
// Checksum 0x57398e73, Offset: 0x7a8
// Size: 0x2c
function function_5e2ea3ef(owner, ishacked) {
    self thread function_fff56140(owner);
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x7356c107, Offset: 0x7e0
// Size: 0x7e
function can_activate(placement) {
    if (!isdefined(placement)) {
        return false;
    }
    if (!self isonground()) {
        return false;
    }
    if (self util::isusingremote()) {
        return false;
    }
    if (killstreaks::is_interacting_with_object()) {
        return false;
    }
    if (self oob::istouchinganyoobtrigger()) {
        return false;
    }
    return true;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x4373f091, Offset: 0x868
// Size: 0x508
function activate_vehicle(type) {
    assert(isplayer(self));
    player = self;
    if (!player killstreakrules::iskillstreakallowed(type, player.team)) {
        return false;
    }
    if (player usebuttonpressed()) {
        return false;
    }
    bundle = level.killstreaks[type].script_bundle;
    if (isdefined(bundle.ksweapon) && isdefined(bundle.ksweapon.deployable) && bundle.ksweapon.deployable && !deployable::function_b3d993e9(bundle.ksweapon, 1)) {
        return false;
    }
    killstreak_id = player killstreakrules::killstreakstart(type, player.team, 0, 1);
    if (killstreak_id == -1) {
        return false;
    }
    vehicle = spawnvehicle(bundle.ksvehicle, player.var_b8878ba9, player.var_ddc03e10, type);
    vehicle deployable::function_dd266e08(player);
    vehicle killstreaks::configure_team(type, killstreak_id, player, "small_vehicle", undefined, &function_5e2ea3ef);
    vehicle killstreak_hacking::enable_hacking(type, &function_aba709c3, &function_2df6e3bf);
    vehicle.damagetaken = 0;
    vehicle.abandoned = 0;
    vehicle.killstreak_id = killstreak_id;
    vehicle.activatingkillstreak = 1;
    vehicle setinvisibletoall();
    vehicle thread watch_shutdown(player);
    vehicle.health = bundle.kshealth;
    vehicle.maxhealth = bundle.kshealth;
    vehicle.hackedhealth = bundle.kshackedhealth;
    vehicle.hackedhealthupdatecallback = &function_f07460c5;
    vehicle.ignore_vehicle_underneath_splash_scalar = 1;
    if (isdefined(bundle.ksweapon)) {
        vehicle setweapon(bundle.ksweapon);
        vehicle.weapon = bundle.ksweapon;
    }
    vehicle killstreak_bundles::spawned(bundle);
    self thread killstreaks::play_killstreak_start_dialog(type, self.team, killstreak_id);
    self stats::function_e24eec31(bundle.ksweapon, #"used", 1);
    remote_weapons::useremoteweapon(vehicle, bundle.ksweapon.name, 1, 0);
    if (!isdefined(player) || !isalive(player) || isdefined(player.laststand) && player.laststand || player isempjammed()) {
        if (isdefined(vehicle)) {
            vehicle notify(#"remote_weapon_shutdown");
            vehicle function_1f46c433();
        }
        return false;
    }
    if (!isdefined(vehicle)) {
        return false;
    }
    vehicle setvisibletoall();
    vehicle.activatingkillstreak = 0;
    target_set(vehicle);
    ability_player::function_c22f319e(bundle.ksweapon);
    vehicle thread watch_game_ended();
    vehicle waittill(#"death");
    return true;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x717bcea3, Offset: 0xd78
// Size: 0x4e
function function_f07460c5(hacker) {
    vehicle = self;
    if (vehicle.health > vehicle.hackedhealth) {
        vehicle.health = vehicle.hackedhealth;
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x119c2bc7, Offset: 0xdd0
// Size: 0x1d4
function function_c9aa9ee5(vehicle) {
    player = self;
    vehicle usevehicle(player, 0);
    vehicle clientfield::set("vehicletransition", 1);
    vehicle thread audio::sndupdatevehiclecontext(1);
    vehicle thread watch_timeout();
    vehicle thread function_2cee4434();
    vehicle thread function_22528515();
    vehicle thread watch_water();
    player vehicle::set_vehicle_drivable_time_starting_now(int(vehicle.var_22a05c26.ksduration));
    if (isdefined(vehicle.var_22a05c26.var_486124e6)) {
        visionset_mgr::activate("overlay", vehicle.var_22a05c26.var_486124e6, player, 1, 90000, 1);
    }
    if (isbot(self)) {
        if (isdefined(vehicle.killstreaktype) && (vehicle.killstreaktype == "recon_car" || vehicle.killstreaktype == "inventory_recon_car")) {
            self thread function_88d23aaa(vehicle);
        }
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0x48bd3598, Offset: 0xfb0
// Size: 0x6a
function function_88d23aaa(vehicle) {
    var_8eaf8b3c = vehicle.overridevehiclekilled;
    vehicle thread rcxd::function_91ea9492();
    vehicle vehicle_ai::get_state_callbacks("death").update_func = undefined;
    vehicle.overridevehiclekilled = var_8eaf8b3c;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2, eflags: 0x0
// Checksum 0x56662e66, Offset: 0x1028
// Size: 0xe4
function function_8cb72281(vehicle, exitrequestedbyowner) {
    if (exitrequestedbyowner == 0) {
        vehicle function_1f46c433();
        vehicle thread audio::sndupdatevehiclecontext(0);
    }
    if (isdefined(vehicle.var_22a05c26.var_486124e6)) {
        visionset_mgr::deactivate("overlay", vehicle.var_22a05c26.var_486124e6, vehicle.owner);
    }
    vehicle clientfield::set("vehicletransition", 0);
    function_68a07849(vehicle.var_22a05c26, self.remoteowner);
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x63b0ae37, Offset: 0x1118
// Size: 0xd4
function function_2cee4434() {
    vehicle = self;
    vehicle endon(#"shutdown", #"death");
    while (isdefined(level.var_46f4865d) && level.var_46f4865d) {
        waitframe(1);
    }
    while (!(isdefined(vehicle.owner) && (vehicle.owner attackbuttonpressed() || vehicle.owner vehicleattackbuttonpressed()))) {
        waitframe(1);
    }
    vehicle function_1f46c433();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0xd91199a3, Offset: 0x11f8
// Size: 0xba
function watch_exit() {
    vehicle = self;
    vehicle endon(#"shutdown", #"death");
    while (true) {
        timeused = 0;
        while (vehicle.owner usebuttonpressed()) {
            timeused += level.var_9fee970c;
            if (timeused >= 250) {
                vehicle function_1f46c433();
                return;
            }
            waitframe(1);
        }
        waitframe(1);
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x8d855933, Offset: 0x12c0
// Size: 0xd4
function function_e99d09a3() {
    self endon(#"shutdown");
    for (inwater = 0; !inwater; inwater = trace[#"fraction"] < 1) {
        wait 0.5;
        trace = physicstrace(self.origin + (0, 0, 10), self.origin + (0, 0, 6), (-2, -2, -2), (2, 2, 2), self, 4);
    }
    self function_822e1f64();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x59187379, Offset: 0x13a0
// Size: 0xa4
function watch_water() {
    self endon(#"shutdown");
    var_8a7edebd = 10;
    for (inwater = 0; !inwater; inwater = depth > var_8a7edebd) {
        wait 0.5;
        depth = getwaterheight(self.origin) - self.origin[2];
    }
    self function_822e1f64();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0xfc7558a, Offset: 0x1450
// Size: 0x6c
function watch_timeout() {
    vehicle = self;
    bundle = vehicle.var_22a05c26;
    vehicle thread killstreaks::waitfortimeout(bundle.var_d3413870, bundle.ksduration, &function_1f46c433, "shutdown");
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0xb3d36362, Offset: 0x14c8
// Size: 0x34
function function_822e1f64() {
    vehicle = self;
    vehicle.abandoned = 1;
    vehicle function_1f46c433();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0xccd21cf4, Offset: 0x1508
// Size: 0x28
function function_1f46c433() {
    vehicle = self;
    vehicle notify(#"shutdown");
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2, eflags: 0x0
// Checksum 0x5c5d4653, Offset: 0x1538
// Size: 0x4c
function function_68a07849(bundle, driver) {
    if (isdefined(driver)) {
        var_4dd90b81 = 0;
        driver ability_player::function_f2250880(bundle.ksweapon, var_4dd90b81);
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0xbc51023e, Offset: 0x1590
// Size: 0x144
function watch_shutdown(driver) {
    vehicle = self;
    vehicle endon(#"death");
    vehicle waittill(#"shutdown");
    bundle = vehicle.var_22a05c26;
    vehicle notify(#"remote_weapon_shutdown");
    if (isdefined(vehicle.activatingkillstreak) && vehicle.activatingkillstreak) {
        killstreakrules::killstreakstop(bundle.var_d3413870, vehicle.originalteam, vehicle.killstreak_id);
        vehicle function_1f46c433();
        vehicle delete();
    } else {
        vehicle thread function_584fb7a3();
    }
    vehicle killstreaks::function_67bc25ec();
    function_68a07849(bundle, driver);
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0xc75be474, Offset: 0x16e0
// Size: 0xfc
function function_584fb7a3() {
    vehicle = self;
    vehicle endon(#"death");
    if (!(isdefined(vehicle.remote_weapon_end) && vehicle.remote_weapon_end)) {
        vehicle waittill(#"remote_weapon_end", #"hash_59b25025ce93a142");
    }
    attacker = isdefined(vehicle.owner) ? vehicle.owner : undefined;
    vehicle dodamage(vehicle.health + 1, vehicle.origin + (0, 0, 10), attacker, attacker, "none", "MOD_EXPLOSIVE", 0);
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x5c1f7d16, Offset: 0x17e8
// Size: 0xd0
function function_22528515() {
    vehicle = self;
    vehicle endon(#"shutdown");
    while (true) {
        waitresult = vehicle waittill(#"touch");
        ent = waitresult.entity;
        if (isdefined(ent.classname) && (ent.classname == "trigger_hurt_new" || ent.classname == "trigger_out_of_bounds")) {
            vehicle function_1f46c433();
        }
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 15, eflags: 0x0
// Checksum 0x99ba9500, Offset: 0x18c0
// Size: 0x19c
function on_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (self.activatingkillstreak) {
        return 0;
    }
    if (!isdefined(eattacker) || eattacker != self.owner) {
        bundle = self.var_22a05c26;
        idamage = killstreaks::ondamageperweapon(bundle.var_d3413870, eattacker, idamage, idflags, smeansofdeath, weapon, self.maxhealth, undefined, self.maxhealth * 0.4, undefined, 0, undefined, 1, 1);
    }
    if (isdefined(eattacker) && isdefined(eattacker.team) && util::function_fbce7263(eattacker.team, self.team)) {
        if (weapon.isemp) {
            self.damage_on_death = 0;
            self.died_by_emp = 1;
            idamage = self.health + 1;
        }
    }
    return idamage;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 8, eflags: 0x0
// Checksum 0x5c33c65b, Offset: 0x1a68
// Size: 0x29c
function on_death(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime) {
    vehicle = self;
    player = vehicle.owner;
    player endon(#"disconnect", #"joined_team", #"joined_spectators");
    bundle = self.var_22a05c26;
    var_7d4f75e = isdefined(vehicle.var_7d4f75e) ? vehicle.var_7d4f75e : 0;
    var_a9911aeb = bundle.var_d3413870;
    var_a8527b41 = vehicle.originalteam;
    var_ebe66d84 = vehicle.killstreak_id;
    if (!var_7d4f75e) {
        killstreakrules::killstreakstop(var_a9911aeb, var_a8527b41, var_ebe66d84);
    }
    vehicle clientfield::set("enemyvehicle", 0);
    vehicle explode(eattacker, weapon);
    var_2105be53 = vehicle.died_by_emp === 1 ? 0.2 : 0.1;
    if (isdefined(player)) {
        player val::set(#"hash_7412aa1ce117e2a5", "freezecontrols");
        vehicle thread function_de865657(var_2105be53);
        wait 0.2;
        player val::reset(#"hash_7412aa1ce117e2a5", "freezecontrols");
    } else {
        vehicle thread function_de865657(var_2105be53);
    }
    if (var_7d4f75e) {
        killstreakrules::killstreakstop(var_a9911aeb, var_a8527b41, var_ebe66d84);
    }
    if (isdefined(vehicle)) {
        vehicle function_1f46c433();
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x53f4575a, Offset: 0x1d10
// Size: 0x64
function watch_game_ended() {
    vehicle = self;
    vehicle endon(#"death");
    level waittill(#"game_ended");
    vehicle.selfdestruct = 1;
    vehicle function_822e1f64();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1, eflags: 0x0
// Checksum 0xb3902931, Offset: 0x1d80
// Size: 0x4a
function function_de865657(waittime) {
    self endon(#"death");
    wait waittime;
    self ghost();
    self.var_4217cfcb = 1;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0xdeed9f44, Offset: 0x1dd8
// Size: 0xbc
function vehicle_death() {
    self vehicle_death::death_fx();
    self thread vehicle_death::death_radius_damage();
    self thread vehicle_death::set_death_model(self.deathmodel, self.modelswapdelay);
    self vehicle::toggle_tread_fx(0);
    self vehicle::toggle_exhaust_fx(0);
    self vehicle::toggle_sounds(0);
    self vehicle::lights_off();
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2, eflags: 0x0
// Checksum 0xbd9ea4f7, Offset: 0x1ea0
// Size: 0x310
function explode(attacker, weapon) {
    self endon(#"death");
    owner = self.owner;
    if (!isdefined(attacker) && isdefined(owner)) {
        attacker = owner;
    }
    attacker = self [[ level.figure_out_attacker ]](attacker);
    self vehicle_death();
    var_d3213f00 = 0;
    var_3906173b = isdefined(weapon) && weapon.name === "gadget_icepick";
    if (!(isdefined(self.abandoned) && self.abandoned) && isplayer(attacker)) {
        bundle = self.var_22a05c26;
        if (util::function_fbce7263(self.team, attacker.team)) {
            if (isdefined(bundle)) {
                attacker challenges::destroy_killstreak_vehicle(weapon, self, bundle.var_ebc402ca);
            }
            var_d3213f00 = 1;
            if (isdefined(bundle)) {
                self killstreaks::function_73566ec7(attacker, weapon, owner);
                luinotifyevent(#"player_callout", 2, bundle.var_cbe3d7de, attacker.entnum);
                if (isdefined(weapon) && weapon.isvalid) {
                    level.globalkillstreaksdestroyed++;
                    attacker stats::function_e24eec31(bundle.ksweapon, #"destroyed", 1);
                    attacker stats::function_e24eec31(bundle.ksweapon, #"destroyed_controlled_killstreak", 1);
                }
                if (!var_3906173b) {
                    self killstreaks::play_destroyed_dialog_on_owner(bundle.var_d3413870, self.killstreak_id);
                    attacker battlechatter::function_dd6a6012(bundle.var_d3413870, weapon);
                }
            }
        }
    }
    if (isdefined(bundle) && isdefined(bundle.var_bb6c29b4) && isdefined(weapon) && weapon == getweapon(#"shock_rifle")) {
        playfx(bundle.var_bb6c29b4, self.origin);
    }
    return var_d3213f00;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 4, eflags: 0x0
// Checksum 0xbf165e65, Offset: 0x21b8
// Size: 0x70
function function_e9da8b7d(einflictor, eattacker, smeansofdeath, weapon) {
    if (isdefined(eattacker) && eattacker == self.owner) {
        return true;
    }
    if (isdefined(einflictor) && einflictor islinkedto(self)) {
        return true;
    }
    return false;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0, eflags: 0x0
// Checksum 0x7bc32050, Offset: 0x2230
// Size: 0x76
function function_e94c2667() {
    startheight = 50;
    switch (self getstance()) {
    case #"crouch":
        startheight = 30;
        break;
    case #"prone":
        startheight = 15;
        break;
    }
    return startheight;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2, eflags: 0x0
// Checksum 0x8cb7e069, Offset: 0x22b0
// Size: 0x4a0
function function_d75fbe15(origin, angles) {
    startheight = function_e94c2667();
    mins = (-5, -5, 0);
    maxs = (5, 5, 10);
    startpoints = [];
    startangles = [];
    wheelcounts = [];
    testcheck = [];
    largestcount = 0;
    largestcountindex = 0;
    testangles = [];
    testangles[0] = (0, 0, 0);
    testangles[1] = (0, 20, 0);
    testangles[2] = (0, -20, 0);
    testangles[3] = (0, 45, 0);
    testangles[4] = (0, -45, 0);
    heightoffset = 5;
    for (i = 0; i < testangles.size; i++) {
        testcheck[i] = 0;
        startangles[i] = (0, angles[1], 0);
        startpoint = origin + vectorscale(anglestoforward(startangles[i] + testangles[i]), 70);
        endpoint = startpoint - (0, 0, 100);
        startpoint += (0, 0, startheight);
        mask = 1 | 2;
        trace = physicstrace(startpoint, endpoint, mins, maxs, self, mask);
        if (isdefined(trace[#"entity"]) && isplayer(trace[#"entity"])) {
            wheelcounts[i] = 0;
            continue;
        }
        startpoints[i] = trace[#"position"] + (0, 0, heightoffset);
        wheelcounts[i] = function_c82e14d2(startpoints[i], startangles[i], heightoffset);
        if (positionwouldtelefrag(startpoints[i])) {
            continue;
        }
        if (largestcount < wheelcounts[i]) {
            largestcount = wheelcounts[i];
            largestcountindex = i;
        }
        if (wheelcounts[i] >= 3) {
            testcheck[i] = 1;
            if (function_b4682bd6(startpoints[i], startangles[i])) {
                placement = spawnstruct();
                placement.origin = startpoints[i];
                placement.angles = startangles[i];
                return placement;
            }
        }
    }
    for (i = 0; i < testangles.size; i++) {
        if (!testcheck[i]) {
            if (wheelcounts[i] >= 2) {
                if (function_b4682bd6(startpoints[i], startangles[i])) {
                    placement = spawnstruct();
                    placement.origin = startpoints[i];
                    placement.angles = startangles[i];
                    return placement;
                }
            }
        }
    }
    return undefined;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 3, eflags: 0x0
// Checksum 0x3e35af1e, Offset: 0x2758
// Size: 0x1ec
function function_c82e14d2(origin, angles, heightoffset) {
    forward = 13;
    side = 10;
    wheels = [];
    wheels[0] = (forward, side, 0);
    wheels[1] = (forward, -1 * side, 0);
    wheels[2] = (-1 * forward, -1 * side, 0);
    wheels[3] = (-1 * forward, side, 0);
    height = 5;
    touchcount = 0;
    yawangles = (0, angles[1], 0);
    for (i = 0; i < 4; i++) {
        wheel = rotatepoint(wheels[i], yawangles);
        startpoint = origin + wheel;
        endpoint = startpoint + (0, 0, -1 * height - heightoffset);
        startpoint += (0, 0, height - heightoffset);
        trace = bullettrace(startpoint, endpoint, 0, self);
        if (trace[#"fraction"] < 1) {
            touchcount++;
        }
    }
    return touchcount;
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2, eflags: 0x0
// Checksum 0xd6ba4eec, Offset: 0x2950
// Size: 0x208
function function_b4682bd6(origin, angles) {
    liftedorigin = origin + (0, 0, 5);
    size = 12;
    height = 15;
    mins = (-1 * size, -1 * size, 0);
    maxs = (size, size, height);
    absmins = liftedorigin + mins;
    absmaxs = liftedorigin + maxs;
    if (boundswouldtelefrag(absmins, absmaxs)) {
        return false;
    }
    startheight = function_e94c2667();
    mask = 1 | 2 | 4;
    trace = physicstrace(liftedorigin, origin + (0, 0, 1), mins, maxs, self, mask);
    if (trace[#"fraction"] < 1) {
        return false;
    }
    size = 2.5;
    height = size * 2;
    mins = (-1 * size, -1 * size, 0);
    maxs = (size, size, height);
    sweeptrace = physicstrace(self.origin + (0, 0, startheight), liftedorigin, mins, maxs, self, mask);
    if (sweeptrace[#"fraction"] < 1) {
        return false;
    }
    return true;
}

