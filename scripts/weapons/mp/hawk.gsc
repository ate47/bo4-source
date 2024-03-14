// Atian COD Tools GSC decompiler test
#using script_342e0d1a78771d3f;
#using script_5afbda9de6000ad9;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\core_common\vehicles\hawk.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace hawk_mp;

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x2
// Checksum 0x3436afe8, Offset: 0x218
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hawk_mp", &__init__, undefined, undefined);
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x9e7042e0, Offset: 0x260
// Size: 0x1bc
function __init__() {
    level.hawk_settings = spawnstruct();
    level.hawk_settings.spawn = &spawn_hawk;
    level.hawk_settings.weapon = getweapon(#"eq_hawk");
    level.hawk_settings.bundle = getscriptbundle("hawk_settings");
    /#
        assert(isdefined(level.hawk_settings.bundle));
    #/
    callback::on_spawned(&on_player_spawned);
    callback::on_finalize_initialization(&function_3675de8b);
    globallogic_score::register_kill_callback(level.hawk_settings.weapon, &function_17b75237);
    for (ti = 0; ti < 6; ti++) {
        clientfield::register_luielem("hawk_target_lockon" + ti, "target_visible", 13000, 1, "int", 1);
    }
    clientfield::register("vehicle", "hawk_range", 13000, 1, "int");
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0xd2bb2821, Offset: 0x428
// Size: 0x56
function function_3675de8b() {
    map_center = airsupport::getmapcenter();
    level.var_5718bd08 = isdefined(level.var_7fd6bd44) ? level.var_7fd6bd44 : map_center[2] + 1000;
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xae79583, Offset: 0x488
// Size: 0x4a
function function_6ada73f(spawnpos) {
    return physicstrace(self.origin, spawnpos, vectorscale((-1, -1, 0), 18), (18, 18, 12), undefined, 16 | 2);
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0xa3fc8aaf, Offset: 0x4e0
// Size: 0x7c4
function spawn_hawk() {
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    if (isdefined(self.hawk) && isdefined(self.hawk.vehicle)) {
        self.hawk.vehicle hawk::hawk_destroy(1);
    }
    self.hawk = spawnstruct();
    vehicletype = "veh_hawk_player_mp";
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
    vehicle setplayercollision(0);
    vehicle setteam(self.team);
    vehicle.team = self.team;
    vehicle.owner = self;
    vehicle.weapon = getweapon("eq_hawk");
    vehicle.var_20c71d46 = 1;
    vehicle.overridevehicledamage = &function_b162cdbd;
    vehicle.var_c5d65381 = 1;
    vehicle.var_8516173f = 1;
    self.hawk.vehicle = vehicle;
    bundle = level.hawk_settings.bundle;
    var_a33bcd86 = int(isdefined(bundle.var_a33bcd86) ? bundle.var_a33bcd86 : 0);
    vehicle function_d733412a(0);
    self callback::function_d8abfc3d(#"hash_247d67dbf83dbc1a", &function_903cf6aa);
    self callback::function_d8abfc3d(#"hash_72a7670db71677f", &function_3e6a41b7);
    if (isbot(self)) {
        var_a33bcd86 = 0;
    }
    if (isdefined(vehicle)) {
        vehicle clientfield::set("enemyvehicle", 1);
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
        self thread function_b521083c(vehicle);
        self create_missile_hud(vehicle, var_a33bcd86);
        self thread watch_team_change(vehicle);
        vehicle thread watch_timeout(bundle.duration);
        lifetime = int((isdefined(bundle.duration) ? bundle.duration : 60) * 1000);
        vehicle thread killstreaks::waitfortimeoutbeep(bundle.kstimeoutbeepduration, bundle.kstimeoutfastbeepduration, lifetime);
        self thread oob::function_c5278cb0(vehicle);
        birthtime = gettime();
        self.var_3dba7204 = birthtime;
        self.var_6b1c6f54 = lifetime;
        if (var_a33bcd86) {
            util::wait_network_frame(1);
            if (!isalive(vehicle)) {
                return;
            }
            self vehicle::set_vehicle_drivable_time(lifetime, birthtime + lifetime);
        }
    }
}

// Namespace hawk_mp/hawk
// Params 15, eflags: 0x1 linked
// Checksum 0x8275c88b, Offset: 0xcb0
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

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x6df35545, Offset: 0xdd0
// Size: 0xe4
function on_player_spawned() {
    if (isdefined(self.hawk) && isdefined(self.hawk.vehicle)) {
        var_35e29466 = 1;
        if (isdefined(level.hawk_settings) && isdefined(level.hawk_settings.weapon)) {
            slot = self gadgetgetslot(level.hawk_settings.weapon);
            if (slot == -1) {
                self.hawk.vehicle thread hawk::hawk_destroy(1);
                var_35e29466 = 0;
            }
        }
        if (var_35e29466) {
            self function_e219515e();
        }
    }
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x511e611, Offset: 0xec0
// Size: 0x1a0
function function_e219515e() {
    if (!level.remote_missile_targets remote_missile_targets::is_open(self)) {
        level.remote_missile_targets remote_missile_targets::open(self);
    }
    player = self;
    enemies = getplayers();
    foreach (target in enemies) {
        if (player.team != target.team) {
            var_4ef4e267 = target getentitynumber();
            ti = player.var_13c51aa5[var_4ef4e267];
            if (isdefined(ti) && isdefined(player.var_e6013893[ti])) {
                uifield = level.var_aac98621[ti];
                if (!uifield remote_missile_target_lockon::is_open(player)) {
                    uifield remote_missile_target_lockon::open(player, 1);
                }
            }
        }
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0x399ee070, Offset: 0x1068
// Size: 0xb0
function hawk_update(vehicle) {
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    vehicle endon(#"death");
    playerorigin = self.origin;
    while (true) {
        playerorigin = update_range(vehicle, playerorigin);
        waitframe(1);
    }
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0x52b335cf, Offset: 0x1120
// Size: 0x148
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
    return playerorigin;
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0x27df9100, Offset: 0x1270
// Size: 0xd4
function watch_destroyed(vehicle) {
    self endon(#"disconnect");
    vehicle waittill(#"death");
    if (isdefined(self)) {
        self callback::function_52ac9652(#"hash_247d67dbf83dbc1a", &function_903cf6aa);
        self callback::function_52ac9652(#"hash_72a7670db71677f", &function_3e6a41b7);
        if (!self util::function_63d27d4e("remote_missile")) {
            self destroy_missile_hud();
        }
    }
}

// Namespace hawk_mp/hawk
// Params 5, eflags: 0x1 linked
// Checksum 0x7878525a, Offset: 0x1350
// Size: 0x1bc
function function_17b75237(attacker, victim, weapon, attackerweapon, meansofdeath) {
    if (!isdefined(victim) || !isplayer(victim)) {
        return false;
    }
    if (!isdefined(attacker) || !isplayer(attacker) || !isdefined(attacker.var_13c51aa5)) {
        return false;
    }
    var_e49690cd = victim getentitynumber();
    targetindex = attacker.var_13c51aa5[var_e49690cd];
    if (isdefined(targetindex) && targetindex < 6) {
        var_f27d6782 = attacker.var_e6013893[targetindex];
    }
    if (!isdefined(var_f27d6782)) {
        return false;
    }
    if (gettime() - (isdefined(var_f27d6782.var_a7e1d732) ? var_f27d6782.var_a7e1d732 : 0) <= int(level.hawk_settings.bundle.var_fb7c1412 * 1000)) {
        if (isdefined(level.playgadgetsuccess)) {
            attacker thread [[ level.playgadgetsuccess ]](level.hawk_settings.weapon, undefined, self, undefined);
        }
        return true;
    }
    return false;
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0x9b021232, Offset: 0x1518
// Size: 0xc6
function function_d89c1628(vehicle) {
    if (!(isdefined(vehicle.can_control) && vehicle.can_control)) {
        return false;
    }
    if (self isremotecontrolling() || self util::isusingremote()) {
        return false;
    }
    if (self.hawk.var_a3b23d12) {
        return false;
    }
    if (!self fragbuttonpressed()) {
        return false;
    }
    if (self function_15049d95()) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    return true;
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0x2e5cbe7, Offset: 0x15e8
// Size: 0x440
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
    while (true) {
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
            self killstreaks::thermal_glow_enemies_only(0);
            self util::function_9a39538a();
            self.hawk.var_a3b23d12 = 1;
            self playsoundtoplayer("gdt_hawk_pov_out", self);
            continue;
        }
        if (self function_d89c1628(vehicle)) {
            self.hawk.controlling = 1;
            self thread function_1b057db2();
            vehicle usevehicle(self, 0);
            self vehicle::set_vehicle_drivable_time(self.var_6b1c6f54, self.var_3dba7204 + self.var_6b1c6f54);
            vehicle.var_55dded30 = self;
            vehicle.playercontrolled = 1;
            self killstreaks::thermal_glow_enemies_only(1);
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

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0xb95d922c, Offset: 0x1a30
// Size: 0x1de
function function_1b057db2() {
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    self notify("414b03c7ca83a5f6");
    self endon("414b03c7ca83a5f6");
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

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x99182d54, Offset: 0x1c18
// Size: 0x4e
function function_9096c10() {
    return self usebuttonpressed() || self stancebuttonpressed() && self gamepadusedlast();
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xd068679, Offset: 0x1c70
// Size: 0x124
function function_c4770b46(vehicle) {
    self notify("55aca6b6f13bcce2");
    self endon("55aca6b6f13bcce2");
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

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xcc1c7700, Offset: 0x1da0
// Size: 0xbc
function watch_timeout(duration) {
    self endon(#"death");
    var_65bcb0ae = duration * 0.5;
    wait(var_65bcb0ae);
    if (isdefined(self.owner)) {
        self.owner thread killstreaks::play_taacom_dialog("hawkWeaponTimeHalf");
    }
    wait(var_65bcb0ae);
    if (isdefined(self.owner)) {
        self.owner thread killstreaks::play_taacom_dialog("hawkWeaponTimeEnd");
    }
    self thread hawk::hawk_destroy();
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0x8bb2cea1, Offset: 0x1e68
// Size: 0xac
function watch_team_change(hawk) {
    hawk endon(#"death");
    waitresult = undefined;
    waitresult = self waittill(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist", #"changed_specialist_death");
    if (!isdefined(hawk)) {
        return;
    }
    hawk thread hawk::hawk_destroy(1);
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0xea44cb44, Offset: 0x1f20
// Size: 0x5f0
function getvalidtargets(hawk, &stance_offsets) {
    pixbeginevent(#"hawk_enemies");
    targets = [];
    if (isdefined(self.hawk.var_b61d83c4) && self.hawk.var_b61d83c4) {
        return targets;
    }
    if (!isdefined(self.hawk.var_82bf9f7b) || self.hawk.controlling) {
        self.hawk.var_82bf9f7b = self getplayerangles();
    }
    forward = anglestoforward(self.hawk.var_82bf9f7b);
    bundle = level.hawk_settings.bundle;
    var_e4f883c1 = bundle.var_957e91c4 * bundle.var_957e91c4;
    now = gettime();
    enemies = self getenemies();
    if (!isdefined(self.hawk.var_5f360c48)) {
        self.hawk.var_5f360c48 = [];
    }
    if (!isdefined(self.hawk.var_c55be3a2)) {
        self.hawk.var_c55be3a2 = [];
    }
    var_4d392c1d = int((isdefined(bundle.var_4f848330) ? bundle.var_4f848330 : 0) * 1000);
    var_d691d922 = int((isdefined(bundle.var_ab326589) ? bundle.var_ab326589 : 0) * 1000);
    foreach (player in enemies) {
        if (!isplayer(player)) {
            continue;
        }
        if (player.ignoreme === 1) {
            continue;
        }
        if (distancesquared(player.origin, hawk.origin) > var_e4f883c1) {
            continue;
        }
        stance_offset = stance_offsets[player getstance()];
        toplayer = vectornormalize(player.origin + stance_offset - hawk.origin);
        in_sight = 0;
        var_131803ce = vectordot(toplayer, forward) >= bundle.tag_fov;
        if (var_131803ce) {
            in_sight = bullettracepassed(hawk.origin, player.origin + stance_offset, 0, hawk, player, 0, 1);
        }
        valid_target = 0;
        if (!in_sight) {
            if (var_131803ce) {
                if (bundle.var_d1a5fb3b === 1) {
                    self.hawk.var_5f360c48[player getentitynumber()] = undefined;
                    continue;
                }
                if (isdefined(self.hawk.var_5f360c48[player getentitynumber()])) {
                    valid_target = var_4d392c1d == 0 || now - self.hawk.var_5f360c48[player getentitynumber()] < var_4d392c1d;
                }
            } else {
                if (bundle.var_4917731f === 1) {
                    self.hawk.var_c55be3a2[player getentitynumber()] = undefined;
                    continue;
                }
                if (isdefined(self.hawk.var_c55be3a2[player getentitynumber()])) {
                    valid_target = var_d691d922 == 0 || now - self.hawk.var_c55be3a2[player getentitynumber()] < var_d691d922;
                }
            }
        } else {
            valid_target = 1;
            self.hawk.var_5f360c48[player getentitynumber()] = now;
            self.hawk.var_c55be3a2[player getentitynumber()] = now;
        }
        if (!valid_target) {
            continue;
        }
        targets[targets.size] = player;
    }
    pixendevent();
    return targets;
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0x78896286, Offset: 0x2518
// Size: 0x354
function create_missile_hud(vehicle, var_a33bcd86) {
    player = self;
    if (var_a33bcd86) {
        player killstreaks::thermal_glow_enemies_only(1);
        vehicle playsoundtoplayer("gdt_hawk_pov_in", self);
    }
    if (!level.remote_missile_targets remote_missile_targets::is_open(self)) {
        level.remote_missile_targets remote_missile_targets::open(self);
    }
    player.var_e6013893 = [];
    player.var_13c51aa5 = [];
    player_entnum = player getentitynumber();
    for (ti = 0; ti < 6; ti++) {
        player.var_e6013893[ti] = spawnstruct();
        player.var_e6013893[ti].state = 0;
        player.var_e6013893[ti].visible = 0;
        player.var_e6013893[ti].var_fb579b3e = 0;
        uifield = level.var_aac98621[ti];
        if (!uifield remote_missile_target_lockon::is_open(player)) {
            uifield remote_missile_target_lockon::open(player, 1);
        }
        uifield remote_missile_target_lockon::set_clientnum(player, player_entnum);
        uifield remote_missile_target_lockon::set_target_locked(player, 0);
        uifield remote_missile_target_lockon::set_ishawktag(player, 1);
    }
    enemies = getplayers();
    ti = 0;
    foreach (enemy in enemies) {
        if (isplayer(enemy) && player.team != enemy.team) {
            entnum = enemy getentitynumber();
            player.var_13c51aa5[entnum] = ti;
            ti++;
            if (ti >= 6) {
                break;
            }
        }
    }
    self thread targeting_hud_think(vehicle);
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x9217508a, Offset: 0x2878
// Size: 0x5c
function function_903cf6aa() {
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(self.hawk)) {
        return;
    }
    if (!isdefined(self.hawk.vehicle)) {
        return;
    }
    self destroy_missile_hud();
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x46b2eab1, Offset: 0x28e0
// Size: 0x6c
function function_3e6a41b7() {
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(self.hawk)) {
        return;
    }
    if (!isdefined(self.hawk.vehicle)) {
        return;
    }
    self create_missile_hud(self.hawk.vehicle, 0);
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x757c100f, Offset: 0x2958
// Size: 0x84
function destroy_missile_hud() {
    self killstreaks::thermal_glow_enemies_only(0);
    for (ti = 0; ti < 6; ti++) {
        self clientfield::function_9bf78ef8("hawk_target_lockon" + ti, "target_visible", 0);
    }
    self function_d9c32f9();
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x6e7ede51, Offset: 0x29e8
// Size: 0xb6
function function_d9c32f9() {
    if (level.remote_missile_targets remote_missile_targets::is_open(self)) {
        level.remote_missile_targets remote_missile_targets::close(self);
    }
    for (ti = 0; ti < 6; ti++) {
        if (level.var_aac98621[ti] remote_missile_target_lockon::is_open(self)) {
            level.var_aac98621[ti] remote_missile_target_lockon::close(self);
        }
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xba863eeb, Offset: 0x2aa8
// Size: 0x278
function targeting_hud_think(vehicle) {
    self notify("72283ec71c2a76c1");
    self endon("72283ec71c2a76c1");
    self endon(#"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist", #"changed_specialist_death");
    vehicle endon(#"death");
    level endon(#"game_ended");
    stance_offsets = [];
    stance_offsets[#"stand"] = vectorscale((0, 0, 1), 60);
    stance_offsets[#"crouch"] = vectorscale((0, 0, 1), 40);
    stance_offsets[#"prone"] = vectorscale((0, 0, 1), 12);
    player = self;
    targets = self getvalidtargets(vehicle, stance_offsets);
    framessincetargetscan = 0;
    while (true) {
        if (self util::function_63d27d4e("remote_missile")) {
            return;
        }
        framessincetargetscan++;
        if (framessincetargetscan > 5) {
            targets = self getvalidtargets(vehicle, stance_offsets);
            framessincetargetscan = 0;
        }
        player function_76b4c572();
        player function_9ace0fb6(targets);
        player function_2d7b62();
        if (vehicle.playercontrolled === 1 && player isremotecontrolling() && vehicle getseatoccupant(0) === player) {
            vehicle.var_e9f68b24 = player getplayerangles();
        }
        waitframe(1);
    }
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x66946a35, Offset: 0x2d28
// Size: 0x1b8
function function_76b4c572() {
    player = self;
    enemies = getplayers();
    foreach (target in enemies) {
        if (player.team != target.team) {
            var_4ef4e267 = target getentitynumber();
            ti = player.var_13c51aa5[var_4ef4e267];
            if (isdefined(ti)) {
                player.var_e6013893[ti].state = 0;
                player.var_e6013893[ti].var_fb579b3e = player.var_e6013893[ti].visible;
                level.var_aac98621[ti] remote_missile_target_lockon::set_clientnum(player, var_4ef4e267);
                player.var_e6013893[ti].visible = 0;
                player clientfield::function_9bf78ef8("hawk_target_lockon" + ti, "target_visible", 0);
            }
        }
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xb2e2a949, Offset: 0x2ee8
// Size: 0x456
function function_9ace0fb6(targets) {
    player = self;
    time = gettime();
    bundle = level.hawk_settings.bundle;
    var_fe38768b = 6 * function_60d95f53();
    if (targets.size > 0) {
        foreach (target in targets) {
            if (!isdefined(target)) {
                continue;
            }
            if (!isplayer(target)) {
                continue;
            }
            if (!isalive(target)) {
                if (isdefined(self.hawk.var_5f360c48)) {
                    self.hawk.var_5f360c48[target getentitynumber()] = undefined;
                }
                continue;
            }
            var_4ef4e267 = target getentitynumber();
            ti = player.var_13c51aa5[var_4ef4e267];
            if (!isdefined(ti) && player.var_13c51aa5.size < 6) {
                for (var_6665225 = 5; var_6665225 >= 0; var_6665225--) {
                    if (!isinarray(player.var_13c51aa5, var_6665225)) {
                        ti = var_6665225;
                        player.var_13c51aa5[var_4ef4e267] = ti;
                        break;
                    }
                }
            }
            if (isdefined(ti)) {
                info = player.var_e6013893[ti];
                if (!info.var_fb579b3e) {
                    info.first_visible = time;
                }
                info.visible = 1;
                info.var_1fe906d8 = time;
                player clientfield::function_9bf78ef8("hawk_target_lockon" + ti, "target_visible", 1);
                tagtime = int(bundle.tag_time * 1000);
                if (target hasperk(#"specialty_nokillstreakreticle")) {
                    tagtime = tagtime * bundle.var_59b7880b;
                }
                if (info.var_1fe906d8 - info.first_visible > tagtime) {
                    if (!isdefined(info.var_a7e1d732) || time - info.var_a7e1d732 > var_fe38768b && isdefined(isdefined(player.hawk)) && isdefined(player.hawk.vehicle)) {
                        target playsoundtoplayer(#"hash_4f43df2a649784d0", target);
                    }
                    info.state = 1;
                    info.var_a7e1d732 = time;
                } else if (isdefined(info.var_a7e1d732) && time - info.var_a7e1d732 < int(bundle.var_fb7c1412 * 1000)) {
                    info.state = 1;
                    info.var_a7e1d732 = time;
                }
                player.var_e6013893[ti] = info;
            }
        }
    }
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x87df3d30, Offset: 0x3348
// Size: 0x1e0
function function_2d7b62() {
    player = self;
    enemies = getplayers();
    foreach (target in enemies) {
        if (player.team != target.team) {
            var_4ef4e267 = target getentitynumber();
            ti = player.var_13c51aa5[var_4ef4e267];
            if (isdefined(ti) && isdefined(player.var_e6013893[ti])) {
                level.var_aac98621[ti] remote_missile_target_lockon::set_clientnum(player, var_4ef4e267);
                level.var_aac98621[ti] remote_missile_target_lockon::set_target_locked(player, player.var_e6013893[ti].state);
                if (!isalive(target)) {
                    level.var_aac98621[ti] remote_missile_target_lockon::set_killed(player, 1);
                    continue;
                }
                level.var_aac98621[ti] remote_missile_target_lockon::set_killed(player, 0);
            }
        }
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0x340440d7, Offset: 0x3530
// Size: 0x8c
function function_b521083c(vehicle) {
    vehicle endon(#"death");
    level waittill(#"potm_selected");
    if (isdefined(vehicle)) {
        driver = vehicle getseatoccupant(0);
        if (isdefined(driver)) {
            vehicle usevehicle(driver, 0);
        }
    }
}

