#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\audio_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\oob;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\killstreaks\airsupport;
#using scripts\killstreaks\helicopter_shared;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\killstreak_hacking;
#using scripts\killstreaks\killstreakrules_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\remote_weapons;
#using scripts\mp_common\gametypes\battlechatter;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\teams\teams;
#using scripts\mp_common\util;
#using scripts\weapons\hacker_tool;
#using scripts\weapons\heatseekingmissile;

#namespace ac130;

// Namespace ac130/ac130
// Params 0, eflags: 0x2
// Checksum 0x1fb4db6f, Offset: 0x480
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"ac130", &__init__, undefined, #"killstreaks");
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x4899f6d0, Offset: 0x4d0
// Size: 0x286
function __init__() {
    profilestart();
    killstreaks::register_killstreak("killstreak_ac130", &activatemaingunner);
    killstreaks::register_alt_weapon("ac130", getweapon(#"killstreak_remote"));
    killstreaks::register_alt_weapon("ac130", getweapon(#"hash_17df39d53492b0bf"));
    killstreaks::register_alt_weapon("ac130", getweapon(#"hash_7b24d0d0d2823bca"));
    killstreaks::register_alt_weapon("ac130", getweapon(#"ac130_chaingun"));
    killstreaks::set_team_kill_penalty_scale("ac130", level.teamkillreducedpenalty);
    player::function_cf3aa03d(&function_d45a1f8d, 1);
    level.killstreaks[#"ac130"].threatonkill = 1;
    callback::on_connect(&onplayerconnect);
    callback::on_finalize_initialization(&function_3675de8b);
    level thread waitforgameendthread();
    level.ac130 = undefined;
    clientfield::register_clientuimodel("vehicle.selectedWeapon", 1, 2, "int", 0);
    clientfield::register_clientuimodel("vehicle.flareCount", 1, 2, "int", 0);
    clientfield::register_clientuimodel("vehicle.inAC130", 1, 1, "int", 0);
    clientfield::register("toplayer", "inAC130", 1, 1, "int");
    profilestop();
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x446c925f, Offset: 0x760
// Size: 0x88
function function_3675de8b() {
    bundle = struct::get_script_bundle("killstreak", "killstreak_ac130");
    initrotatingrig(bundle);
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon("ac130"), &function_bff5c062);
    }
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0xf552bd10, Offset: 0x7f0
// Size: 0x84
function function_bff5c062(var_2f03ffd6, attackingplayer) {
    var_2f03ffd6 killstreaks::function_73566ec7(attackingplayer, getweapon(#"gadget_icepick"), var_2f03ffd6.owner);
    var_2f03ffd6.destroyscoreeventgiven = 1;
    function_8721028e(var_2f03ffd6.owner, 1, 1);
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xf78514b8, Offset: 0x880
// Size: 0x2a
function onplayerconnect() {
    if (!isdefined(self.entnum)) {
        self.entnum = self getentitynumber();
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x9d8e913c, Offset: 0x8b8
// Size: 0x1fc
function initrotatingrig(bundle) {
    if (isdefined(level.var_cfec596d)) {
        map_center = airsupport::getmapcenter();
        rotator_offset = (isdefined(level.var_cfec596d) ? level.var_cfec596d : map_center[0], isdefined(level.var_39b27fbe) ? level.var_39b27fbe : map_center[1], isdefined(level.var_b34c8ec8) ? level.var_b34c8ec8 : airsupport::getminimumflyheight() + 8000);
        level.var_89350618 = spawn("script_model", rotator_offset);
    } else {
        rotator_offset = (isdefined(level.var_e5d932eb) ? level.var_e5d932eb : 0, isdefined(level.var_92b5eb15) ? level.var_92b5eb15 : 0, airsupport::getminimumflyheight() + 8000);
        level.var_89350618 = spawn("script_model", airsupport::getmapcenter() + rotator_offset);
    }
    level.var_89350618 setmodel(#"tag_origin");
    level.var_89350618.angles = (0, 115, 0);
    level.var_89350618 hide();
    level.var_89350618 thread rotaterig(bundle);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xd64ace4b, Offset: 0xac0
// Size: 0x66
function rotaterig(bundle) {
    var_d57617dd = isdefined(bundle.var_dff95af) ? bundle.var_dff95af : 300;
    while (true) {
        self rotateyaw(360, var_d57617dd);
        wait var_d57617dd;
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x7d5c7d4e, Offset: 0xb30
// Size: 0x118
function activatemaingunner(killstreaktype) {
    player = self;
    attempts = 0;
    while (isdefined(level.ac130)) {
        if (!player killstreakrules::iskillstreakallowed("ac130", player.team)) {
            return 0;
        }
        attempts++;
        if (attempts > 50) {
            return 0;
        }
        wait 0.1;
    }
    player val::set(#"spawnac130", "freezecontrols");
    result = player spawnac130();
    player val::reset(#"spawnac130", "freezecontrols");
    if (level.gameended) {
        return 1;
    }
    if (!isdefined(result)) {
        return 0;
    }
    return result;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xa44d501, Offset: 0xc50
// Size: 0x10c
function hackedprefunction(hacker) {
    heligunner = self;
    heligunner.owner unlink();
    level.ac130 clientfield::set("vehicletransition", 0);
    heligunner.owner setmodellodbias(0);
    heligunner.owner notify(#"gunner_left");
    heligunner.owner killstreaks::clear_using_remote();
    heligunner.owner killstreaks::unhide_compass();
    heligunner.owner vehicle::stop_monitor_missiles_locked_on_to_me();
    heligunner.owner vehicle::stop_monitor_damage_as_occupant();
    heligunner makevehicleunusable();
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x348e6693, Offset: 0xd68
// Size: 0x21a
function hackedpostfunction(hacker) {
    heligunner = self;
    heligunner clientfield::set("enemyvehicle", 2);
    heligunner makevehicleusable();
    heligunner usevehicle(hacker, 1);
    level.ac130 clientfield::set("vehicletransition", 1);
    heligunner thread vehicle::monitor_missiles_locked_on_to_me(hacker);
    heligunner thread vehicle::monitor_damage_as_occupant(hacker);
    hacker killstreaks::hide_compass();
    heligunner thread watchplayerexitrequestthread(hacker);
    hacker setmodellodbias(isdefined(level.mothership_lod_bias) ? level.mothership_lod_bias : 8);
    heligunner.owner givededicatedshadow(level.ac130);
    hacker thread watchplayerteamchangethread(heligunner);
    hacker killstreaks::set_killstreak_delay_killcam("ac130");
    if (heligunner.killstreak_timer_started) {
        heligunner.killstreak_duration = heligunner killstreak_hacking::get_hacked_timeout_duration_ms();
        heligunner.killstreak_end_time = hacker killstreak_hacking::set_vehicle_drivable_time_starting_now(heligunner);
        heligunner.killstreakendtime = int(heligunner.killstreak_end_time);
        return;
    }
    heligunner.killstreak_timer_start_using_hacked_time = 1;
}

// Namespace ac130/ac130
// Params 0, eflags: 0x5 linked
// Checksum 0x542c3902, Offset: 0xf90
// Size: 0x890
function private spawnac130() {
    player = self;
    player endon(#"disconnect");
    level endon(#"game_ended");
    assert(!isdefined(level.ac130));
    profilestart();
    if (isdefined(player.isplanting) && player.isplanting || isdefined(player.isdefusing) && player.isdefusing || player util::isusingremote() || player iswallrunning() || player oob::isoutofbounds()) {
        profilestop();
        return 0;
    }
    killstreak_id = player killstreakrules::killstreakstart("ac130", player.team, undefined, 1);
    if (killstreak_id == -1) {
        profilestop();
        return 0;
    }
    bundle = struct::get_script_bundle("killstreak", "killstreak_ac130");
    spawnpos = airsupport::getmapcenter() + (5000, 5000, 8000);
    level.ac130 = spawnvehicle(bundle.ksvehicle, spawnpos, (0, 0, 0), "ac130");
    level.ac130.identifier_weapon = getweapon("ac130");
    level.ac130 killstreaks::configure_team("ac130", killstreak_id, player, "helicopter");
    level.ac130 killstreak_hacking::enable_hacking("ac130", &hackedprefunction, &hackedpostfunction);
    level.ac130.killstreak_id = killstreak_id;
    level.ac130.destroyfunc = &function_a51c391f;
    level.ac130.hardpointtype = "ac130";
    level.ac130 clientfield::set("enemyvehicle", 1);
    level.ac130 vehicle::init_target_group();
    level.ac130.killstreak_timer_started = 0;
    level.ac130.allowdeath = 0;
    level.ac130.playermovedrecently = 0;
    level.ac130.soundmod = "default_loud";
    level.ac130 hacker_tool::registerwithhackertool(50, 10000);
    level.ac130.usage = [];
    level.destructible_callbacks[#"turret_destroyed"] = &vtoldestructiblecallback;
    level.ac130.shuttingdown = 0;
    level.ac130.completely_shutdown = 0;
    level.ac130 thread playlockonsoundsthread(player, level.ac130);
    level.ac130 thread helicopter::wait_for_killed();
    level.ac130.maxhealth = isdefined(killstreak_bundles::get_max_health("ac130")) ? killstreak_bundles::get_max_health("ac130") : 5000;
    level.ac130.original_health = level.ac130.maxhealth;
    level.ac130.health = level.ac130.maxhealth;
    level.ac130.damagetaken = 0;
    level.ac130 thread helicopter::heli_health("ac130");
    level.ac130 setcandamage(1);
    target_set(level.ac130, (0, 0, -100));
    target_setallowhighsteering(level.ac130, 1);
    level.ac130.numflares = 1;
    level.ac130.fx_flare = bundle.var_22ab738b;
    level.ac130 helicopter::create_flare_ent((0, 0, -150));
    level.ac130 thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("death");
    level.ac130.is_still_valid_target_for_stinger_override = &function_c2bfa7e1;
    level.ac130 thread function_d4896942(bundle);
    level.ac130 thread function_31f9c728(bundle);
    level.ac130 setrotorspeed(1);
    level.ac130 util::make_sentient();
    level.ac130.maxvisibledist = 16384;
    level.ac130 function_53d3b37a(bundle);
    level.ac130.totalrockethits = 0;
    level.ac130.turretrockethits = 0;
    level.ac130.overridevehicledamage = &function_dea7ec6a;
    level.ac130.hackedhealthupdatecallback = &function_7cdff810;
    level.ac130.detonateviaemp = &helicoptedetonateviaemp;
    player thread killstreaks::play_killstreak_start_dialog("ac130", player.team, killstreak_id);
    level.ac130 killstreaks::play_pilot_dialog_on_owner("arrive", "ac130", killstreak_id);
    player stats::function_e24eec31(bundle.ksweapon, #"used", 1);
    player thread waitforvtolshutdownthread(level.ac130);
    level.ac130 function_7c61ce31(bundle);
    profilestop();
    if (level.gameended === 1) {
        return 0;
    }
    result = player function_4d980695(1);
    if (result && isbot(player)) {
        player thread function_3939b657(level.ac130);
    }
    util::function_5a68c330(21, player.team, player getentitynumber(), level.killstreaks[#"ac130"].uiname);
    return result;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x5e9c8a0f, Offset: 0x1828
// Size: 0x1a4
function function_7c61ce31(bundle) {
    veh = self;
    rotator = level.var_89350618;
    attach_angle = 90;
    angle = randomint(360);
    radiusoffset = isdefined(bundle.var_1f9faa0c) ? bundle.var_1f9faa0c : isdefined(level.var_8db9ea19) ? level.var_8db9ea19 : 12000;
    xoffset = cos(angle) * radiusoffset;
    yoffset = sin(angle) * radiusoffset;
    zoffset = (isdefined(bundle.var_218dc866) ? bundle.var_218dc866 : 8000) - 8000;
    anglevector = (xoffset, yoffset, zoffset);
    var_e47f3d4a = getdvarfloat(#"hash_29a9f2bae7599f46", -27);
    veh linkto(rotator, "tag_origin", anglevector, (0, angle + attach_angle, var_e47f3d4a));
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xbd862c90, Offset: 0x19d8
// Size: 0x8e
function function_7cdff810() {
    ac130 = self;
    if (ac130.shuttingdown == 1) {
        return;
    }
    hackedhealth = killstreak_bundles::get_hacked_health("ac130");
    assert(isdefined(hackedhealth));
    if (ac130.health > hackedhealth) {
        ac130.health = hackedhealth;
    }
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x464fa391, Offset: 0x1a70
// Size: 0x6c
function waitforgameendthread() {
    level waittill(#"game_ended");
    if (isdefined(level.ac130) && isdefined(level.ac130.owner)) {
        function_8721028e(level.ac130.owner, 1);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x7d9b5971, Offset: 0x1ae8
// Size: 0x1ba
function waitforvtolshutdownthread(ac130) {
    waitresult = ac130 waittill(#"ac130_shutdown");
    if (!isdefined(ac130)) {
        return;
    }
    if (ac130.completely_shutdown !== 1) {
        attacker = waitresult.attacker;
        if (isdefined(attacker)) {
            luinotifyevent(#"player_callout", 2, #"hash_20aa28bee9cfdd61", attacker.entnum);
        }
        if (target_istarget(ac130)) {
            target_remove(ac130);
        }
        if (issentient(ac130)) {
            ac130 function_60d50ea4();
        }
        if (isdefined(ac130.flare_ent)) {
            ac130.flare_ent delete();
            ac130.flare_ent = undefined;
        }
        ac130 function_cc756b8d();
        function_8721028e(ac130.owner, 1);
    }
    assert(ac130.var_957d409b === 1);
    ac130 delete();
    ac130 = undefined;
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xa571f344, Offset: 0x1cb0
// Size: 0x68
function function_cc756b8d() {
    if (!isdefined(self)) {
        return;
    }
    if (self.var_957d409b === 1) {
        return;
    }
    profilestart();
    killstreakrules::killstreakstop("ac130", self.originalteam, self.killstreak_id);
    self.var_957d409b = 1;
    level.ac130 = undefined;
    profilestop();
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x3387831e, Offset: 0x1d20
// Size: 0x44
function function_31d18ab9() {
    self endon(#"death");
    wait isdefined(5) ? 5 : 0;
    self function_cc756b8d();
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xed45b347, Offset: 0x1d70
// Size: 0x28
function function_a51c391f() {
    ac130 = self;
    ac130 notify(#"ac130_shutdown");
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xaaf68d28, Offset: 0x1da0
// Size: 0x74
function ontimeoutcallback() {
    if (!(isdefined(level.var_43da6545) && level.var_43da6545) && isdefined(level.ac130) && isdefined(level.ac130.owner)) {
        function_8721028e(level.ac130.owner, 1);
    }
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0x2d733e45, Offset: 0x1e20
// Size: 0x5c
function function_c2bfa7e1(ent, weapon) {
    if (isdefined(ent.var_7132bbb7)) {
        return false;
    }
    if (ent.shuttingdown === 1) {
        return false;
    }
    if (ent.completely_shutdown === 1) {
        return false;
    }
    return true;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x3374bade, Offset: 0x1e88
// Size: 0xfa
function function_d4896942(bundle) {
    ac130 = self;
    ac130 endon(#"death", #"ac130_shutdown");
    ac130.var_7132bbb7 = undefined;
    while (true) {
        ac130 waittill(#"flare_deployed");
        ac130 playsound(#"hash_713a3ce01967434e");
        ac130.var_7132bbb7 = 1;
        self killstreaks::play_pilot_dialog_on_owner("damageEvaded", "ac130", self.killstreak_id);
        wait isdefined(bundle.var_2eeb71d2) ? bundle.var_2eeb71d2 : 5;
        ac130.var_7132bbb7 = undefined;
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x4bee101e, Offset: 0x1f90
// Size: 0xf0
function function_31f9c728(bundle) {
    ac130 = self;
    ac130 endon(#"death", #"ac130_shutdown");
    ac130.var_7132bbb7 = undefined;
    while (true) {
        waitresult = ac130 waittill(#"stinger_fired_at_me");
        if (isdefined(waitresult.projectile)) {
            ac130 childthread function_849819e9(waitresult.projectile, bundle, "exp_incoming_missile");
            ac130 childthread function_6650cc9c(waitresult.projectile, bundle, "uin_ac130_alarm_missile_incoming");
        }
    }
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0x88674f17, Offset: 0x2088
// Size: 0x1fc
function function_849819e9(missile, bundle, var_61bbac7a) {
    assert(isentity(missile));
    assert(isstruct(bundle));
    assert(isdefined(var_61bbac7a));
    ac130 = self;
    if (!isdefined(ac130)) {
        return;
    }
    missile endon(#"death");
    var_d1fb4ef3 = isdefined(bundle.var_7d5e1fc0) ? bundle.var_7d5e1fc0 : 0.75;
    while (isdefined(ac130.owner) && ac130.owner util::function_63d27d4e("ac130")) {
        dist = distance(missile.origin, ac130.origin);
        velocity = missile getvelocity();
        missile_dir = vectornormalize(velocity);
        missile_speed = vectordot(missile_dir, velocity);
        if (missile_speed > 0) {
            if (dist < missile_speed * var_d1fb4ef3) {
                ac130 playsoundtoplayer(var_61bbac7a, ac130.owner);
                return;
            }
        }
        wait 0.1;
    }
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0xcba2c1d4, Offset: 0x2290
// Size: 0x2b8
function function_6650cc9c(missile, bundle, var_2f984f68) {
    assert(isentity(missile));
    assert(isstruct(bundle));
    assert(isdefined(var_2f984f68));
    ac130 = self;
    if (!isdefined(ac130)) {
        return;
    }
    missile endon(#"death");
    wait 0.2;
    neardist = isdefined(bundle.var_4004fbc) ? bundle.var_4004fbc : 10;
    fardist = isdefined(bundle.var_364ccfdc) ? bundle.var_364ccfdc : 100;
    range = fardist - neardist;
    if (range < 0) {
        return;
    }
    var_6f2344f0 = isdefined(bundle.var_9fb2ddca) ? bundle.var_9fb2ddca : 0.05;
    var_cd12ce4c = isdefined(bundle.var_6e3967de) ? bundle.var_6e3967de : 0.05;
    dist = undefined;
    while (isdefined(ac130.owner) && ac130.owner util::function_63d27d4e("ac130")) {
        old_dist = dist;
        dist = distance(missile.origin, ac130.origin);
        var_38fa5914 = isdefined(old_dist) && dist < old_dist;
        if (var_38fa5914) {
            ac130 playsoundtoplayer(var_2f984f68, ac130.owner);
        }
        normalizeddist = (dist - neardist) / range;
        beep_interval = lerpfloat(var_6f2344f0, var_cd12ce4c, normalizeddist);
        wait beep_interval;
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x4978e14b, Offset: 0x2550
// Size: 0x118
function watchplayerteamchangethread(ac130) {
    ac130 notify(#"mothership_team_change");
    ac130 endon(#"mothership_team_change");
    assert(isplayer(self));
    player = self;
    player endon(#"gunner_left");
    player waittill(#"joined_team", #"disconnect", #"joined_spectators");
    ownerleft = ac130.ownerentnum == player.entnum;
    player thread function_8721028e(player, ownerleft);
    if (ownerleft) {
        ac130 notify(#"ac130_shutdown");
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x1a9590fa, Offset: 0x2670
// Size: 0x19a
function watchplayerexitrequestthread(player) {
    player notify(#"watchplayerexitrequestthread_singleton");
    player endon(#"watchplayerexitrequestthread_singleton");
    assert(isplayer(player));
    ac130 = self;
    level endon(#"game_ended");
    player endon(#"disconnect", #"gunner_left");
    ac130 endon(#"death");
    owner = ac130.ownerentnum == player.entnum;
    while (true) {
        timeused = 0;
        while (player usebuttonpressed()) {
            timeused += 0.05;
            if (timeused > 0.25) {
                ac130 killstreaks::play_pilot_dialog_on_owner("remoteOperatorRemoved", "ac130", ac130.killstreak_id);
                player thread function_8721028e(player, owner);
                return;
            }
            waitframe(1);
        }
        waitframe(1);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x5 linked
// Checksum 0x46b728be, Offset: 0x2818
// Size: 0x410
function private function_4d980695(isowner) {
    assert(isplayer(self));
    player = self;
    level.ac130.occupied = 1;
    player util::setusingremote("ac130");
    player.ignoreempjammed = 1;
    result = player killstreaks::init_ride_killstreak("ac130");
    player.ignoreempjammed = 0;
    if (result != "success") {
        if (result != "disconnect") {
            player killstreaks::clear_using_remote();
        }
        level.ac130.failed2enter = 1;
        level.ac130 notify(#"ac130_shutdown");
        return false;
    }
    bundle = getscriptbundle("killstreak_ac130");
    level.ac130 usevehicle(player, 1);
    level.ac130.usage[player.entnum] = 1;
    level.ac130 thread audio::sndupdatevehiclecontext(1);
    level.ac130 thread vehicle::monitor_missiles_locked_on_to_me(player);
    level.ac130 thread vehicle::monitor_damage_as_occupant(player);
    level.ac130 thread function_5cdcce1e(player);
    if (level.ac130.killstreak_timer_started) {
        player vehicle::set_vehicle_drivable_time(level.ac130.killstreak_duration, level.ac130.killstreak_end_time);
    } else {
        duration = isdefined(bundle.ksduration) ? bundle.ksduration : 60000;
        player vehicle::set_vehicle_drivable_time(duration, gettime() + duration);
    }
    if (!(isdefined(level.var_dab73f4a) && level.var_dab73f4a)) {
        level.ac130 thread watchplayerexitrequestthread(player);
    }
    player thread watchplayerteamchangethread(level.ac130);
    player setmodellodbias(isdefined(level.mothership_lod_bias) ? level.mothership_lod_bias : 8);
    player givededicatedshadow(level.ac130);
    if (true) {
        player thread hidecompassafterwait(0.1);
    }
    player clientfield::set_player_uimodel("vehicle.inAC130", 1);
    player clientfield::set_to_player("inAC130", 1);
    player killstreaks::thermal_glow(1);
    player thread function_c137f6f8(level.ac130);
    return true;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x44494a0a, Offset: 0x2c30
// Size: 0xec
function function_c137f6f8(ac130) {
    ac130 endon(#"death", #"ac130_shutdown");
    self endon(#"disconnect");
    map_center = airsupport::getmapcenter();
    wait 0.1;
    var_74a46de6 = ac130 function_90d45d34(0);
    view_pos = self getplayercamerapos();
    self setplayerangles(vectortoangles(map_center - view_pos) - var_74a46de6);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x60a8a71, Offset: 0x2d28
// Size: 0x378
function function_5cdcce1e(player) {
    ac130 = self;
    ac130 endon(#"delete", #"ac130_shutdown");
    player endon(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist");
    var_2990ddbd = -1;
    while (true) {
        ammo_in_clip = ac130 function_e2d89efe(1);
        player clientfield::set_player_uimodel("vehicle.rocketAmmo", ammo_in_clip);
        var_a4a44abc = ac130 function_fde0d99e(1);
        player clientfield::set_player_uimodel("vehicle.bindingCooldown" + 0 + ".cooldown", 1 - var_a4a44abc);
        ammo_in_clip = ac130 function_e2d89efe(2);
        player clientfield::set_player_uimodel("vehicle.ammoCount", ammo_in_clip);
        var_a4a44abc = ac130 function_fde0d99e(2);
        player clientfield::set_player_uimodel("vehicle.bindingCooldown" + 1 + ".cooldown", 1 - var_a4a44abc);
        ammo_in_clip = ac130 function_e2d89efe(3);
        player clientfield::set_player_uimodel("vehicle.ammo2Count", ammo_in_clip);
        var_a4a44abc = ac130 function_fde0d99e(3);
        player clientfield::set_player_uimodel("vehicle.bindingCooldown" + 2 + ".cooldown", 1 - var_a4a44abc);
        player clientfield::set_player_uimodel("vehicle.flareCount", ac130.numflares);
        seat_index = int(max(0, isdefined(ac130 getoccupantseat(player)) ? ac130 getoccupantseat(player) : 0));
        player clientfield::set_player_uimodel("vehicle.selectedWeapon", seat_index);
        if (var_2990ddbd != seat_index && isdefined(ac130.killstreak_duration) && isdefined(ac130.killstreak_end_time)) {
            ac130 updatedrivabletimeforalloccupants(ac130.killstreak_duration, ac130.killstreak_end_time);
            var_2990ddbd = seat_index;
        }
        wait 0.1;
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x764ce539, Offset: 0x30a8
// Size: 0x4c
function hidecompassafterwait(waittime) {
    self endon(#"death", #"disconnect");
    wait waittime;
    self killstreaks::hide_compass();
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0xe1b50d85, Offset: 0x3100
// Size: 0x23c
function mainturretdestroyed(ac130, eattacker, weapon) {
    ac130.owner iprintlnbold(#"hash_bbc64fd3a1e88d");
    if (target_istarget(ac130)) {
        target_remove(ac130);
    }
    if (issentient(ac130)) {
        ac130 function_60d50ea4();
    }
    ac130.shuttingdown = 1;
    eattacker = self [[ level.figure_out_attacker ]](eattacker);
    if (isdefined(eattacker) && (!isdefined(ac130.owner) || ac130.owner util::isenemyplayer(eattacker))) {
        luinotifyevent(#"player_callout", 2, #"hash_bbc64fd3a1e88d", eattacker.entnum);
        challenges::destroyedaircraft(eattacker, weapon, 1, 1);
        eattacker challenges::addflyswatterstat(weapon, ac130);
        ac130 killstreaks::function_73566ec7(eattacker, weapon, ac130.owner);
        ac130 killstreaks::play_destroyed_dialog_on_owner("ac130", ac130.killstreak_id);
        eattacker battlechatter::function_dd6a6012("ac130", weapon);
        eattacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
    }
    ac130 thread function_46d0e4e5();
}

// Namespace ac130/ac130
// Params 6, eflags: 0x1 linked
// Checksum 0xb8190b18, Offset: 0x3348
// Size: 0x84
function vtoldestructiblecallback(brokennotify, eattacker, weapon, pieceindex, dir, mod) {
    ac130 = self;
    ac130 endon(#"delete", #"ac130_shutdown");
    mainturretdestroyed(ac130, eattacker, weapon);
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0xe1f54f6b, Offset: 0x33d8
// Size: 0x420
function function_8721028e(player, ownerleft, var_dbcb1965 = 0) {
    if (isbot(player)) {
        player ai::set_behavior_attribute("control", "commander");
    }
    if (!isdefined(level.ac130) || level.ac130.completely_shutdown === 1) {
        return;
    }
    profilestart();
    if (isdefined(player)) {
        player vehicle::stop_monitor_missiles_locked_on_to_me();
        player vehicle::stop_monitor_damage_as_occupant();
    }
    if (isdefined(player) && isdefined(level.ac130) && isdefined(level.ac130.owner)) {
        if (isdefined(player.usingvehicle) && player.usingvehicle) {
            player unlink();
            level.ac130 clientfield::set("vehicletransition", 0);
            player clientfield::set_player_uimodel("vehicle.inAC130", 0);
            player clientfield::set_to_player("inAC130", 0);
            player killstreaks::thermal_glow(0);
        }
    }
    level.ac130.shuttingdown = 1;
    level.ac130.occupied = 0;
    level.ac130.hardpointtype = "ac130";
    level.ac130 unlink();
    var_6fe4cf51 = 30000;
    planedir = anglestoforward(level.ac130.angles);
    var_15f570c1 = level.ac130.origin + vectorscale(planedir, 30000);
    level.ac130 thread function_31d18ab9();
    if (target_istarget(level.ac130)) {
        target_remove(level.ac130);
    }
    if (issentient(level.ac130)) {
        level.ac130 function_60d50ea4();
    }
    if (var_dbcb1965) {
        var_15f570c1 += (0, 0, -8000);
    }
    level.ac130 thread helicopter::heli_leave(var_15f570c1, 1);
    level.ac130 thread audio::sndupdatevehiclecontext(0);
    if (var_dbcb1965) {
        level.ac130 thread function_60e3edcc();
    }
    if (isdefined(player)) {
        player setmodellodbias(0);
        player givededicatedshadow(player);
        player killstreaks::unhide_compass();
        player notify(#"gunner_left");
        player killstreaks::clear_using_remote();
    }
    level.ac130.completely_shutdown = 1;
    level.ac130.shuttingdown = 0;
    profilestop();
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xbdde0170, Offset: 0x3800
// Size: 0xe4
function function_c4aa4bb2() {
    ac130 = self;
    if (isdefined(ac130) && isdefined(ac130.owner)) {
        org = ac130 gettagorigin("tag_barrel");
        magnitude = 0.3;
        duration = 2;
        radius = 500;
        v_pos = ac130.origin;
        earthquake(magnitude, duration, org, 500);
        ac130 playsound(#"hash_5314ffef2464b607");
    }
}

// Namespace ac130/ac130
// Params 15, eflags: 0x1 linked
// Checksum 0x250b2629, Offset: 0x38f0
// Size: 0x56c
function function_dea7ec6a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    ac130 = self;
    if (smeansofdeath == "MOD_TRIGGER_HURT") {
        return 0;
    }
    if (ac130.shuttingdown) {
        return 0;
    }
    idamage = self killstreaks::ondamageperweapon("ac130", eattacker, idamage, idflags, smeansofdeath, weapon, ac130.maxhealth, undefined, ac130.maxhealth * 0.4, undefined, 0, undefined, 1, 1);
    if (idamage == 0) {
        return 0;
    }
    handleasrocketdamage = smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_EXPLOSIVE";
    if (weapon.statindex == level.weaponshotgunenergy.statindex || weapon.statindex == level.weaponpistolenergy.statindex) {
        handleasrocketdamage = 0;
    }
    if (handleasrocketdamage) {
        ac130 function_c4aa4bb2();
        ac130 playsound(#"hash_ddcd9d25e056016");
    }
    var_902cbab5 = self.health - idamage;
    if (!(isdefined(self.var_5b3f091f) && self.var_5b3f091f) && var_902cbab5 <= self.maxhealth * 0.75) {
        self killstreaks::play_pilot_dialog_on_owner("damaged", "ac130", self.killstreak_id);
        self.var_5b3f091f = 1;
    } else if (!(isdefined(self.var_7e6efe74) && self.var_7e6efe74) && self.health <= self.maxhealth * 0.35) {
        self killstreaks::play_pilot_dialog_on_owner("damaged1", "ac130", self.killstreak_id);
        self.var_7e6efe74 = 1;
    }
    var_a07db9e0 = self.maxhealth * 0.75;
    var_c5d67baf = self.maxhealth * 0.5;
    if (self.health > var_a07db9e0 && var_902cbab5 <= var_a07db9e0) {
        self thread function_d55529();
    } else if (self.health > var_c5d67baf && var_902cbab5 <= var_c5d67baf) {
        self thread function_ae354bc7();
    }
    if (self.health > 0 && var_902cbab5 < 0 && !ac130.shuttingdown) {
        ac130.shuttingdown = 1;
        if (!isdefined(ac130.destroyscoreeventgiven) && isdefined(eattacker) && (!isdefined(ac130.owner) || ac130.owner util::isenemyplayer(eattacker))) {
            eattacker = self [[ level.figure_out_attacker ]](eattacker);
            luinotifyevent(#"player_callout", 2, #"hash_bbc64fd3a1e88d", eattacker.entnum);
            ac130 killstreaks::play_destroyed_dialog_on_owner("ac130", ac130.killstreak_id);
            eattacker battlechatter::function_dd6a6012("ac130", weapon);
            challenges::destroyedaircraft(eattacker, weapon, 1, 1);
            eattacker challenges::addflyswatterstat(weapon, ac130);
            eattacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
            ac130.destroyscoreeventgiven = 1;
        }
        ac130.var_d02ddb8e = weapon;
        ac130 thread function_46d0e4e5();
        return 0;
    }
    return idamage;
}

// Namespace ac130/ac130
// Params 0, eflags: 0x0
// Checksum 0x1543d071, Offset: 0x3e68
// Size: 0x5e
function wait_and_explode() {
    self endon(#"death");
    wait 2;
    if (isdefined(self)) {
        self vehicle::do_death_fx();
        wait 0.25;
        if (isdefined(self)) {
            self notify(#"ac130_shutdown");
        }
    }
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xc4b14b2c, Offset: 0x3ed0
// Size: 0x11c
function function_46d0e4e5() {
    ac130 = self;
    ac130 endon(#"death");
    if (self.leave_by_damage_initiated === 1) {
        return;
    }
    self.leave_by_damage_initiated = 1;
    if (target_istarget(ac130)) {
        target_remove(ac130);
    }
    if (issentient(ac130)) {
        ac130 function_60d50ea4();
    }
    ac130 thread remote_weapons::do_static_fx();
    failsafe_timeout = 5;
    ac130 waittilltimeout(failsafe_timeout, #"static_fx_done");
    var_dbcb1965 = 1;
    function_8721028e(ac130.owner, 1, var_dbcb1965);
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0x5634ceda, Offset: 0x3ff8
// Size: 0x34
function helicoptedetonateviaemp(attacker, weapon) {
    mainturretdestroyed(level.ac130, attacker, weapon);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x0
// Checksum 0xa1aa00ec, Offset: 0x4038
// Size: 0x84
function missilecleanupthread(missile) {
    targetent = self;
    targetent endon(#"delete", #"death");
    missile waittill(#"death", #"delete");
    targetent delete();
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0xd01e2d, Offset: 0x40c8
// Size: 0x1f8
function playlockonsoundsthread(player, heli) {
    player endon(#"disconnect", #"gunner_left");
    heli endon(#"death", #"crashing", #"leaving");
    heli.locksounds = spawn("script_model", heli.origin);
    wait 0.1;
    heli.locksounds linkto(heli, "tag_origin");
    while (true) {
        heli waittill(#"locking on");
        while (true) {
            if (enemyislocking(heli)) {
                heli.locksounds playsoundtoplayer(#"hash_fa62d8cec85b1a0", player);
                wait 0.125;
            }
            if (enemylockedon(heli)) {
                heli.locksounds playsoundtoplayer(#"hash_1683ed70beb3f2", player);
                wait 0.125;
            }
            if (!enemyislocking(heli) && !enemylockedon(heli)) {
                heli.locksounds stopsounds();
                break;
            }
        }
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xf8aaf770, Offset: 0x42c8
// Size: 0x28
function enemyislocking(heli) {
    return isdefined(heli.locking_on) && heli.locking_on;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xe0dfd7c8, Offset: 0x42f8
// Size: 0x28
function enemylockedon(heli) {
    return isdefined(heli.locked_on) && heli.locked_on;
}

// Namespace ac130/ac130
// Params 2, eflags: 0x0
// Checksum 0xdf3a933b, Offset: 0x4328
// Size: 0x3a2
function function_cd679760(startnode, destnodes) {
    self notify(#"flying");
    self endon(#"flying", #"crashing", #"leaving", #"death");
    bundle = getscriptbundle("killstreak_ac130");
    nextnode = getent(startnode.target, "targetname");
    assert(isdefined(nextnode), "<dev string:x38>");
    self setspeed(150, 80);
    self setneargoalnotifydist(100);
    self setgoal(nextnode.origin + (0, 0, 0), 1);
    self waittill(#"near_goal");
    firstpass = 1;
    if (!self.playermovedrecently) {
        node = self updateareanodes(destnodes, 0);
        level.ac130.currentnode = node;
        targetnode = getent(node.target, "targetname");
        traveltonode(targetnode);
        if (isdefined(targetnode.script_airspeed) && isdefined(targetnode.script_accel)) {
            heli_speed = targetnode.script_airspeed;
            heli_accel = targetnode.script_accel;
        } else {
            heli_speed = 150 + randomint(20);
            heli_accel = 40 + randomint(10);
        }
        self setspeed(heli_speed, heli_accel);
        self setgoal(targetnode.origin + (0, 0, 0), 1);
        self setgoalyaw(targetnode.angles[1]);
    }
    if (!isdefined(targetnode) || !isdefined(targetnode.script_delay)) {
        self waittill(#"near_goal");
        waittime = 10 + randomint(5);
    } else {
        self waittill(#"goal");
        waittime = targetnode.script_delay;
    }
    if (firstpass) {
        profilestart();
        self function_53d3b37a(bundle);
        profilestop();
        firstpass = 0;
    }
    wait waittime;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x6ac3b906, Offset: 0x46d8
// Size: 0x104
function function_53d3b37a(bundle) {
    self.killstreak_duration = isdefined(bundle.ksduration) ? bundle.ksduration : self.killstreak_timer_start_using_hacked_time === 1 ? self killstreak_hacking::get_hacked_timeout_duration_ms() : 60000;
    self.killstreak_end_time = gettime() + self.killstreak_duration;
    self.killstreakendtime = int(self.killstreak_end_time);
    self thread killstreaks::waitfortimeout("ac130", self.killstreak_duration, &ontimeoutcallback, "delete", "death");
    self.killstreak_timer_started = 1;
    self updatedrivabletimeforalloccupants(self.killstreak_duration, self.killstreak_end_time);
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0x195ec507, Offset: 0x47e8
// Size: 0x3c
function updatedrivabletimeforalloccupants(duration_ms, end_time_ms) {
    if (isdefined(self.owner)) {
        self.owner vehicle::set_vehicle_drivable_time(duration_ms, end_time_ms);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x0
// Checksum 0xdc54104a, Offset: 0x4830
// Size: 0x2f8
function watchlocationchangethread(destnodes) {
    player = self;
    player endon(#"disconnect", #"gunner_left");
    ac130 = level.ac130;
    settings = getscriptbundle("killstreak_ac130");
    ac130 endon(#"delete", #"ac130_shutdown");
    player thread setplayermovedrecentlythread();
    player.moves = 0;
    while (true) {
        ac130 waittill(#"goal");
        if (player.moves > 0) {
            waittime = randomintrange(settings.var_efac0f7a, settings.var_18d458d2);
            wait float(waittime) / 1000;
        }
        player.moves++;
        node = self updateareanodes(destnodes, 1);
        ac130.currentnode = node;
        targetnode = getent(node.target, "targetname");
        player playlocalsound(#"mpl_cgunner_nav");
        ac130 traveltonode(targetnode);
        if (isdefined(targetnode.script_airspeed) && isdefined(targetnode.script_accel)) {
            heli_speed = targetnode.script_airspeed;
            heli_accel = targetnode.script_accel;
        } else {
            heli_speed = 80 + randomint(20);
            heli_accel = 40 + randomint(10);
        }
        ac130 setspeed(heli_speed, heli_accel);
        ac130 setgoal(targetnode.origin + (0, 0, 0), 1);
        ac130 setgoalyaw(targetnode.angles[1]);
    }
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xeb60cc6, Offset: 0x4b30
// Size: 0xd6
function setplayermovedrecentlythread() {
    player = self;
    player endon(#"disconnect", #"gunner_left");
    ac130 = level.ac130;
    ac130 endon(#"delete", #"ac130_shutdown");
    mymove = self.moves;
    level.ac130.playermovedrecently = 1;
    wait 100;
    if (mymove === self.moves && isdefined(level.ac130)) {
        level.ac130.playermovedrecently = 0;
    }
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0xdb3cade9, Offset: 0x4c10
// Size: 0x3fe
function updateareanodes(areanodes, forcemove) {
    validenemies = [];
    foreach (node in areanodes) {
        node.validplayers = [];
        node.nodescore = 0;
    }
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (player.team == self.team) {
            continue;
        }
        foreach (node in areanodes) {
            if (distancesquared(player.origin, node.origin) > 1048576) {
                continue;
            }
            node.validplayers[node.validplayers.size] = player;
        }
    }
    bestnode = undefined;
    foreach (node in areanodes) {
        if (isdefined(level.ac130.currentnode) && node == level.ac130.currentnode) {
            continue;
        }
        helinode = getent(node.target, "targetname");
        foreach (player in node.validplayers) {
            node.nodescore += 1;
            if (bullettracepassed(player.origin + (0, 0, 32), helinode.origin, 0, player)) {
                node.nodescore += 3;
            }
        }
        if (forcemove && distancesquared(level.ac130.origin, helinode.origin) < 40000) {
            node.nodescore = -1;
        }
        if (!isdefined(bestnode) || node.nodescore > bestnode.nodescore) {
            bestnode = node;
        }
    }
    return bestnode;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xb4374067, Offset: 0x5018
// Size: 0x2b2
function traveltonode(goalnode) {
    originoffets = getoriginoffsets(goalnode);
    if (originoffets[#"start"] != self.origin) {
        if (isdefined(goalnode.script_airspeed) && isdefined(goalnode.script_accel)) {
            heli_speed = goalnode.script_airspeed;
            heli_accel = goalnode.script_accel;
        } else {
            heli_speed = 30 + randomint(20);
            heli_accel = 15 + randomint(15);
        }
        self setspeed(heli_speed, heli_accel);
        self setgoal(originoffets[#"start"] + (0, 0, 30), 0);
        self setgoalyaw(goalnode.angles[1]);
        self waittill(#"goal");
    }
    if (originoffets[#"end"] != goalnode.origin) {
        if (isdefined(goalnode.script_airspeed) && isdefined(goalnode.script_accel)) {
            heli_speed = goalnode.script_airspeed;
            heli_accel = goalnode.script_accel;
        } else {
            heli_speed = 30 + randomint(20);
            heli_accel = 15 + randomint(15);
        }
        self setspeed(heli_speed, heli_accel);
        self setgoal(originoffets[#"end"] + (0, 0, 30), 0);
        self setgoalyaw(goalnode.angles[1]);
        self waittill(#"goal");
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x965ed4b5, Offset: 0x52d8
// Size: 0x246
function getoriginoffsets(goalnode) {
    startorigin = self.origin;
    endorigin = goalnode.origin;
    numtraces = 0;
    maxtraces = 40;
    traceoffset = (0, 0, -196);
    for (traceorigin = bullettrace(startorigin + traceoffset, endorigin + traceoffset, 0, self); distancesquared(traceorigin[#"position"], endorigin + traceoffset) > 10 && numtraces < maxtraces; traceorigin = bullettrace(startorigin + traceoffset, endorigin + traceoffset, 0, self)) {
        println("<dev string:x6d>" + distancesquared(traceorigin[#"position"], endorigin + traceoffset));
        if (startorigin[2] < endorigin[2]) {
            startorigin += (0, 0, 128);
        } else if (startorigin[2] > endorigin[2]) {
            endorigin += (0, 0, 128);
        } else {
            startorigin += (0, 0, 128);
            endorigin += (0, 0, 128);
        }
        numtraces++;
    }
    offsets = [];
    offsets[#"start"] = startorigin;
    offsets[#"end"] = endorigin;
    return offsets;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x34ac6c13, Offset: 0x5528
// Size: 0x294
function function_3939b657(vehicle) {
    vehicle endon(#"ac130_shutdown");
    self endon(#"disconnect");
    waitframe(1);
    while (self isremotecontrolling()) {
        enemy = undefined;
        enemies = self teams::getenemyplayers();
        enemies = array::randomize(enemies);
        foreach (potentialenemy in enemies) {
            if (isalive(potentialenemy)) {
                enemy = potentialenemy;
                break;
            }
        }
        if (isdefined(enemy)) {
            vectorfromenemy = vectornormalize(((vehicle.origin - enemy.origin)[0], (vehicle.origin - enemy.origin)[1], 0));
            vehicle turretsettarget(0, enemy);
            vehicle waittilltimeout(1, #"turret_on_target");
            vehicle vehicle_ai::fire_for_time(2 + randomfloat(0.8), 0, enemy);
            vehicle vehicle_ai::fire_for_rounds(1, 1, enemy);
            vehicle turretcleartarget(0);
            vehicle turretsettargetangles(0, (15, 0, 0));
            if (isdefined(enemy)) {
                wait 2 + randomfloat(0.5);
            }
        }
        wait 0.1;
    }
}

// Namespace ac130/ac130
// Params 9, eflags: 0x1 linked
// Checksum 0x98186ca3, Offset: 0x57c8
// Size: 0x154
function function_d45a1f8d(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (!isdefined(einflictor) || !isdefined(einflictor.owner) || !isdefined(attacker) || !isdefined(weapon)) {
        return;
    }
    if (einflictor.owner == attacker && (weapon == getweapon(#"hash_17df39d53492b0bf") || weapon == getweapon(#"hash_7b24d0d0d2823bca"))) {
        isprimaryweapon = weapon == getweapon(#"hash_17df39d53492b0bf") ? 1 : 0;
        level.ac130 function_631f02c5(isprimaryweapon);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xdc34bd1e, Offset: 0x5928
// Size: 0xa4
function function_631f02c5(isprimaryweapon) {
    self endon(#"killed");
    if (isprimaryweapon) {
        self.primarykill = (isdefined(self.primarykill) ? self.primarykill : 0) + 1;
    } else {
        self.secondarykill = (isdefined(self.secondarykill) ? self.secondarykill : 0) + 1;
    }
    wait 2.5;
    if (!isdefined(self)) {
        return;
    }
    self function_568f6426(isprimaryweapon);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x80d1899a, Offset: 0x59d8
// Size: 0x1b4
function function_568f6426(isprimaryweapon) {
    if (isprimaryweapon) {
        switch (self.primarykill) {
        case 0:
            break;
        case 1:
            dialogkey = "kill1";
            break;
        case 2:
            dialogkey = "kill2";
            break;
        case 3:
            dialogkey = "kill3";
            break;
        default:
            dialogkey = "killMultiple";
            break;
        }
        self.primarykill = 0;
    } else {
        switch (self.secondarykill) {
        case 0:
            break;
        case 1:
            dialogkey = "secondaryKill1";
            break;
        case 2:
            dialogkey = "secondaryKill2";
            break;
        case 3:
            dialogkey = "secondaryKill3";
            break;
        default:
            dialogkey = "secondarykillMultiple";
            break;
        }
        self.secondarykill = 0;
    }
    if (isdefined(dialogkey)) {
        self killstreaks::play_pilot_dialog_on_owner(dialogkey, "ac130", self.killstreak_id);
    }
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x133f4308, Offset: 0x5b98
// Size: 0xbc
function function_d55529() {
    self endon(#"death");
    bundle = level.killstreaks[#"ac130"].script_bundle;
    playfxontag(bundle.var_545fa8c2, self, "tag_fx_engine3");
    self playsound(level.heli_sound[#"crash"]);
    wait 0.1;
    playfxontag(bundle.var_545fa8c2, self, "tag_fx_engine4");
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xa78c0a33, Offset: 0x5c60
// Size: 0xbc
function function_ae354bc7() {
    self endon(#"death");
    bundle = level.killstreaks[#"ac130"].script_bundle;
    playfxontag(bundle.var_465c35a5, self, "tag_fx_engine1");
    self playsound(level.heli_sound[#"crash"]);
    wait 0.1;
    playfxontag(bundle.var_465c35a5, self, "tag_fx_engine6");
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x8a530d35, Offset: 0x5d28
// Size: 0xe4
function function_cd29787b() {
    bundle = level.killstreaks[#"ac130"].script_bundle;
    playfxontag(bundle.ksexplosionfx, self, "tag_body_animate");
    if (isdefined(bundle.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle")) {
        playfxontag(bundle.var_bb6c29b4, self, "tag_body_animate");
    }
    self playsound("exp_ac130");
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x49617966, Offset: 0x5e18
// Size: 0x20c
function function_60e3edcc() {
    plane = self;
    plane endon(#"death");
    wait randomfloatrange(0.1, 0.2);
    if (false) {
        goalx = randomfloatrange(650, 700);
        goaly = randomfloatrange(650, 700);
        if (randomintrange(0, 2) > 0) {
            goalx *= -1;
        }
        if (randomintrange(0, 2) > 0) {
            goaly *= -1;
        }
        var_8518e93e = randomfloatrange(3, 4);
        plane setplanebarrelroll(randomfloatrange(0.0833333, 0.111111), randomfloatrange(4, 5));
        plane_speed = plane getspeedmph();
        wait 0.7;
        plane setspeed(plane_speed * 1.5, 300);
        wait var_8518e93e - 0.7;
    }
    plane function_cd29787b();
    wait 0.1;
    plane ghost();
    wait 0.5;
}

