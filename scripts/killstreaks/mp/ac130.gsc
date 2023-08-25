// Atian COD Tools GSC decompiler test
#include scripts/core_common/array_shared.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/teams/teams.gsc;
#include scripts/weapons/heatseekingmissile.gsc;
#include scripts/weapons/hacker_tool.gsc;
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/vehicle_ai_shared.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/oob.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/killstreaks/remote_weapons.gsc;
#include scripts/killstreaks/killstreakrules_shared.gsc;
#include scripts/killstreaks/killstreak_hacking.gsc;
#include scripts/killstreaks/killstreak_bundles.gsc;
#include scripts/killstreaks/helicopter_shared.gsc;
#include scripts/killstreaks/airsupport.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/audio_shared.gsc;
#include scripts/core_common/ai_shared.gsc;

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
    killstreaks::register_killstreak("killstreak_ac130", &function_461bc4c7);
    killstreaks::register_alt_weapon("ac130", getweapon(#"killstreak_remote"));
    killstreaks::register_alt_weapon("ac130", getweapon(#"hash_17df39d53492b0bf"));
    killstreaks::register_alt_weapon("ac130", getweapon(#"hash_7b24d0d0d2823bca"));
    killstreaks::register_alt_weapon("ac130", getweapon(#"ac130_chaingun"));
    killstreaks::set_team_kill_penalty_scale("ac130", level.teamkillreducedpenalty);
    player::function_cf3aa03d(&function_d45a1f8d, 1);
    level.killstreaks[#"ac130"].threatonkill = 1;
    callback::on_connect(&onplayerconnect);
    callback::on_finalize_initialization(&function_3675de8b);
    level thread function_24930cc2();
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
    level.var_89350618.angles = vectorscale((0, 1, 0), 115);
    level.var_89350618 hide();
    level.var_89350618 thread rotaterig(bundle);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xd64ace4b, Offset: 0xac0
// Size: 0x66
function rotaterig(bundle) {
    var_d57617dd = isdefined(bundle.var_dff95af) ? bundle.var_dff95af : 300;
    while (1) {
        self rotateyaw(360, var_d57617dd);
        wait(var_d57617dd);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x7d5c7d4e, Offset: 0xb30
// Size: 0x118
function function_461bc4c7(killstreaktype) {
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
        wait(0.1);
    }
    player val::set(#"hash_4b7312362ee4e5f8", "freezecontrols");
    result = player function_57916426();
    player val::reset(#"hash_4b7312362ee4e5f8", "freezecontrols");
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
    var_71a362d4 = self;
    var_71a362d4.owner unlink();
    level.ac130 clientfield::set("vehicletransition", 0);
    var_71a362d4.owner setmodellodbias(0);
    var_71a362d4.owner notify(#"hash_31fa26bcde15ad26");
    var_71a362d4.owner killstreaks::clear_using_remote();
    var_71a362d4.owner killstreaks::unhide_compass();
    var_71a362d4.owner vehicle::stop_monitor_missiles_locked_on_to_me();
    var_71a362d4.owner vehicle::stop_monitor_damage_as_occupant();
    var_71a362d4 makevehicleunusable();
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x348e6693, Offset: 0xd68
// Size: 0x21a
function hackedpostfunction(hacker) {
    var_71a362d4 = self;
    var_71a362d4 clientfield::set("enemyvehicle", 2);
    var_71a362d4 makevehicleusable();
    var_71a362d4 usevehicle(hacker, 1);
    level.ac130 clientfield::set("vehicletransition", 1);
    var_71a362d4 thread vehicle::monitor_missiles_locked_on_to_me(hacker);
    var_71a362d4 thread vehicle::monitor_damage_as_occupant(hacker);
    hacker killstreaks::hide_compass();
    var_71a362d4 thread watchplayerexitrequestthread(hacker);
    hacker setmodellodbias(isdefined(level.var_3a0e7f4a) ? level.var_3a0e7f4a : 8);
    var_71a362d4.owner givededicatedshadow(level.ac130);
    hacker thread function_5f941d8a(var_71a362d4);
    hacker killstreaks::set_killstreak_delay_killcam("ac130");
    if (var_71a362d4.var_95801183) {
        var_71a362d4.killstreak_duration = var_71a362d4 killstreak_hacking::get_hacked_timeout_duration_ms();
        var_71a362d4.killstreak_end_time = hacker killstreak_hacking::set_vehicle_drivable_time_starting_now(var_71a362d4);
        var_71a362d4.killstreakendtime = int(var_71a362d4.killstreak_end_time);
    } else {
        var_71a362d4.var_6a18446d = 1;
    }
}

// Namespace ac130/ac130
// Params 0, eflags: 0x5 linked
// Checksum 0x542c3902, Offset: 0xf90
// Size: 0x890
function private function_57916426() {
    player = self;
    player endon(#"disconnect");
    level endon(#"game_ended");
    /#
        assert(!isdefined(level.ac130));
    #/
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
    level.ac130.var_b46557d6 = &function_a51c391f;
    level.ac130.hardpointtype = "ac130";
    level.ac130 clientfield::set("enemyvehicle", 1);
    level.ac130 vehicle::init_target_group();
    level.ac130.var_95801183 = 0;
    level.ac130.allowdeath = 0;
    level.ac130.var_ba0b1611 = 0;
    level.ac130.soundmod = "default_loud";
    level.ac130 hacker_tool::registerwithhackertool(50, 10000);
    level.ac130.usage = [];
    level.destructible_callbacks[#"hash_327f4b2020106273"] = &function_7df0b8f5;
    level.ac130.shuttingdown = 0;
    level.ac130.var_953f407f = 0;
    level.ac130 thread function_4f426310(player, level.ac130);
    level.ac130 thread helicopter::wait_for_killed();
    level.ac130.maxhealth = isdefined(killstreak_bundles::get_max_health("ac130")) ? killstreak_bundles::get_max_health("ac130") : 5000;
    level.ac130.var_7a213748 = level.ac130.maxhealth;
    level.ac130.health = level.ac130.maxhealth;
    level.ac130.damagetaken = 0;
    level.ac130 thread helicopter::heli_health("ac130");
    level.ac130 setcandamage(1);
    target_set(level.ac130, vectorscale((0, 0, -1), 100));
    target_setallowhighsteering(level.ac130, 1);
    level.ac130.numflares = 1;
    level.ac130.fx_flare = bundle.var_22ab738b;
    level.ac130 helicopter::create_flare_ent(vectorscale((0, 0, -1), 150));
    level.ac130 thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("death");
    level.ac130.is_still_valid_target_for_stinger_override = &function_c2bfa7e1;
    level.ac130 thread function_d4896942(bundle);
    level.ac130 thread function_31f9c728(bundle);
    level.ac130 setrotorspeed(1);
    level.ac130 util::make_sentient();
    level.ac130.maxvisibledist = 16384;
    level.ac130 function_53d3b37a(bundle);
    level.ac130.totalrockethits = 0;
    level.ac130.var_4265be4a = 0;
    level.ac130.overridevehicledamage = &function_dea7ec6a;
    level.ac130.var_ce904ce = &function_7cdff810;
    level.ac130.detonateviaemp = &function_591b8468;
    player thread killstreaks::play_killstreak_start_dialog("ac130", player.team, killstreak_id);
    level.ac130 killstreaks::play_pilot_dialog_on_owner("arrive", "ac130", killstreak_id);
    player stats::function_e24eec31(bundle.ksweapon, #"used", 1);
    player thread function_52ee02aa(level.ac130);
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
    /#
        assert(isdefined(hackedhealth));
    #/
    if (ac130.health > hackedhealth) {
        ac130.health = hackedhealth;
    }
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0x464fa391, Offset: 0x1a70
// Size: 0x6c
function function_24930cc2() {
    level waittill(#"game_ended");
    if (isdefined(level.ac130) && isdefined(level.ac130.owner)) {
        function_8721028e(level.ac130.owner, 1);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x7d9b5971, Offset: 0x1ae8
// Size: 0x1ba
function function_52ee02aa(ac130) {
    waitresult = undefined;
    waitresult = ac130 waittill(#"hash_72c1abe12fde572a");
    if (!isdefined(ac130)) {
        return;
    }
    if (ac130.var_953f407f !== 1) {
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
    /#
        assert(ac130.var_957d409b === 1);
    #/
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
    wait(isdefined(5) ? 5 : 0);
    self function_cc756b8d();
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xed45b347, Offset: 0x1d70
// Size: 0x28
function function_a51c391f() {
    ac130 = self;
    ac130 notify(#"hash_72c1abe12fde572a");
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xaaf68d28, Offset: 0x1da0
// Size: 0x74
function function_bfe0a51f() {
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
        return 0;
    }
    if (ent.shuttingdown === 1) {
        return 0;
    }
    if (ent.var_953f407f === 1) {
        return 0;
    }
    return 1;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x3374bade, Offset: 0x1e88
// Size: 0xfa
function function_d4896942(bundle) {
    ac130 = self;
    ac130 endon(#"death", #"hash_72c1abe12fde572a");
    ac130.var_7132bbb7 = undefined;
    while (1) {
        ac130 waittill(#"flare_deployed");
        ac130 playsound(#"hash_713a3ce01967434e");
        ac130.var_7132bbb7 = 1;
        self killstreaks::play_pilot_dialog_on_owner("damageEvaded", "ac130", self.killstreak_id);
        wait(isdefined(bundle.var_2eeb71d2) ? bundle.var_2eeb71d2 : 5);
        ac130.var_7132bbb7 = undefined;
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x4bee101e, Offset: 0x1f90
// Size: 0xf0
function function_31f9c728(bundle) {
    ac130 = self;
    ac130 endon(#"death", #"hash_72c1abe12fde572a");
    ac130.var_7132bbb7 = undefined;
    while (1) {
        waitresult = undefined;
        waitresult = ac130 waittill(#"stinger_fired_at_me");
        if (isdefined(waitresult.projectile)) {
            ac130 threadendon function_849819e9(waitresult.projectile, bundle, "exp_incoming_missile");
            ac130 threadendon function_6650cc9c(waitresult.projectile, bundle, "uin_ac130_alarm_missile_incoming");
        }
    }
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0x88674f17, Offset: 0x2088
// Size: 0x1fc
function function_849819e9(missile, bundle, var_61bbac7a) {
    /#
        assert(isentity(missile));
    #/
    /#
        assert(isstruct(bundle));
    #/
    /#
        assert(isdefined(var_61bbac7a));
    #/
    ac130 = self;
    if (!isdefined(ac130)) {
        return;
    }
    missile endon(#"death");
    var_d1fb4ef3 = isdefined(bundle.var_7d5e1fc0) ? bundle.var_7d5e1fc0 : 0.75;
    while (isdefined(ac130.owner) && ac130.owner util::function_63d27d4e("ac130")) {
        dist = distance(missile.origin, ac130.origin);
        velocity = missile getvelocity();
        var_d794a748 = vectornormalize(velocity);
        missile_speed = vectordot(var_d794a748, velocity);
        if (missile_speed > 0) {
            if (dist < missile_speed * var_d1fb4ef3) {
                ac130 playsoundtoplayer(var_61bbac7a, ac130.owner);
                return;
            }
        }
        wait(0.1);
    }
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0xcba2c1d4, Offset: 0x2290
// Size: 0x2b8
function function_6650cc9c(missile, bundle, var_2f984f68) {
    /#
        assert(isentity(missile));
    #/
    /#
        assert(isstruct(bundle));
    #/
    /#
        assert(isdefined(var_2f984f68));
    #/
    ac130 = self;
    if (!isdefined(ac130)) {
        return;
    }
    missile endon(#"death");
    wait(0.2);
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
        var_6ce65309 = (dist - neardist) / range;
        beep_interval = lerpfloat(var_6f2344f0, var_cd12ce4c, var_6ce65309);
        wait(beep_interval);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x4978e14b, Offset: 0x2550
// Size: 0x118
function function_5f941d8a(ac130) {
    ac130 notify(#"hash_3f2e342ad6180001");
    ac130 endon(#"hash_3f2e342ad6180001");
    /#
        assert(isplayer(self));
    #/
    player = self;
    player endon(#"hash_31fa26bcde15ad26");
    player waittill(#"joined_team", #"disconnect", #"joined_spectators");
    var_cef1449f = ac130.ownerentnum == player.entnum;
    player thread function_8721028e(player, var_cef1449f);
    if (var_cef1449f) {
        ac130 notify(#"hash_72c1abe12fde572a");
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x1a9590fa, Offset: 0x2670
// Size: 0x19a
function watchplayerexitrequestthread(player) {
    player notify(#"hash_1087b2a7627d2c18");
    player endon(#"hash_1087b2a7627d2c18");
    /#
        assert(isplayer(player));
    #/
    ac130 = self;
    level endon(#"game_ended");
    player endon(#"disconnect", #"hash_31fa26bcde15ad26");
    ac130 endon(#"death");
    owner = ac130.ownerentnum == player.entnum;
    while (1) {
        timeused = 0;
        while (player usebuttonpressed()) {
            timeused = timeused + 0.05;
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
function private function_4d980695(var_c5811837) {
    /#
        assert(isplayer(self));
    #/
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
        level.ac130.var_73183186 = 1;
        level.ac130 notify(#"hash_72c1abe12fde572a");
        return 0;
    }
    bundle = getscriptbundle("killstreak_ac130");
    level.ac130 usevehicle(player, 1);
    level.ac130.usage[player.entnum] = 1;
    level.ac130 thread audio::sndupdatevehiclecontext(1);
    level.ac130 thread vehicle::monitor_missiles_locked_on_to_me(player);
    level.ac130 thread vehicle::monitor_damage_as_occupant(player);
    level.ac130 thread function_5cdcce1e(player);
    if (level.ac130.var_95801183) {
        player vehicle::set_vehicle_drivable_time(level.ac130.killstreak_duration, level.ac130.killstreak_end_time);
    } else {
        duration = isdefined(bundle.ksduration) ? bundle.ksduration : 60000;
        player vehicle::set_vehicle_drivable_time(duration, gettime() + duration);
    }
    if (!(isdefined(level.var_dab73f4a) && level.var_dab73f4a)) {
        level.ac130 thread watchplayerexitrequestthread(player);
    }
    player thread function_5f941d8a(level.ac130);
    player setmodellodbias(isdefined(level.var_3a0e7f4a) ? level.var_3a0e7f4a : 8);
    player givededicatedshadow(level.ac130);
    if (1) {
        player thread function_d3e0aad(0.1);
    }
    player clientfield::set_player_uimodel("vehicle.inAC130", 1);
    player clientfield::set_to_player("inAC130", 1);
    player killstreaks::thermal_glow(1);
    player thread function_c137f6f8(level.ac130);
    return 1;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x44494a0a, Offset: 0x2c30
// Size: 0xec
function function_c137f6f8(ac130) {
    ac130 endon(#"death", #"hash_72c1abe12fde572a");
    self endon(#"disconnect");
    map_center = airsupport::getmapcenter();
    wait(0.1);
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
    ac130 endon(#"delete", #"hash_72c1abe12fde572a");
    player endon(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist");
    var_2990ddbd = -1;
    while (1) {
        var_71b2bed7 = ac130 function_e2d89efe(1);
        player clientfield::set_player_uimodel("vehicle.rocketAmmo", var_71b2bed7);
        var_a4a44abc = ac130 function_fde0d99e(1);
        player clientfield::set_player_uimodel("vehicle.bindingCooldown" + 0 + ".cooldown", 1 - var_a4a44abc);
        var_71b2bed7 = ac130 function_e2d89efe(2);
        player clientfield::set_player_uimodel("vehicle.ammoCount", var_71b2bed7);
        var_a4a44abc = ac130 function_fde0d99e(2);
        player clientfield::set_player_uimodel("vehicle.bindingCooldown" + 1 + ".cooldown", 1 - var_a4a44abc);
        var_71b2bed7 = ac130 function_e2d89efe(3);
        player clientfield::set_player_uimodel("vehicle.ammo2Count", var_71b2bed7);
        var_a4a44abc = ac130 function_fde0d99e(3);
        player clientfield::set_player_uimodel("vehicle.bindingCooldown" + 2 + ".cooldown", 1 - var_a4a44abc);
        player clientfield::set_player_uimodel("vehicle.flareCount", ac130.numflares);
        seat_index = int(max(0, isdefined(ac130 getoccupantseat(player)) ? ac130 getoccupantseat(player) : 0));
        player clientfield::set_player_uimodel("vehicle.selectedWeapon", seat_index);
        if (var_2990ddbd != seat_index && isdefined(ac130.killstreak_duration) && isdefined(ac130.killstreak_end_time)) {
            ac130 function_89ce97de(ac130.killstreak_duration, ac130.killstreak_end_time);
            var_2990ddbd = seat_index;
        }
        wait(0.1);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x764ce539, Offset: 0x30a8
// Size: 0x4c
function function_d3e0aad(waittime) {
    self endon(#"death", #"disconnect");
    wait(waittime);
    self killstreaks::hide_compass();
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0xe1b50d85, Offset: 0x3100
// Size: 0x23c
function function_3ddb4f8e(ac130, eattacker, weapon) {
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
function function_7df0b8f5(var_fece8514, eattacker, weapon, var_b1f9d94f, dir, mod) {
    ac130 = self;
    ac130 endon(#"delete", #"hash_72c1abe12fde572a");
    function_3ddb4f8e(ac130, eattacker, weapon);
}

// Namespace ac130/ac130
// Params 3, eflags: 0x1 linked
// Checksum 0xe1f54f6b, Offset: 0x33d8
// Size: 0x420
function function_8721028e(player, var_cef1449f, var_dbcb1965 = 0) {
    if (isbot(player)) {
        player ai::set_behavior_attribute("control", "commander");
    }
    if (!isdefined(level.ac130) || level.ac130.var_953f407f === 1) {
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
        var_15f570c1 = var_15f570c1 + vectorscale((0, 0, -1), 8000);
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
        player notify(#"hash_31fa26bcde15ad26");
        player killstreaks::clear_using_remote();
    }
    level.ac130.var_953f407f = 1;
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
    var_f180e0af = smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_EXPLOSIVE";
    if (weapon.statindex == level.weaponshotgunenergy.statindex || weapon.statindex == level.weaponpistolenergy.statindex) {
        var_f180e0af = 0;
    }
    if (var_f180e0af) {
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
    wait(2);
    if (isdefined(self)) {
        self vehicle::do_death_fx();
        wait(0.25);
        if (isdefined(self)) {
            self notify(#"hash_72c1abe12fde572a");
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
    if (self.var_90717a === 1) {
        return;
    }
    self.var_90717a = 1;
    if (target_istarget(ac130)) {
        target_remove(ac130);
    }
    if (issentient(ac130)) {
        ac130 function_60d50ea4();
    }
    ac130 thread remote_weapons::do_static_fx();
    var_23f04d4f = 5;
    ac130 waittilltimeout(var_23f04d4f, #"static_fx_done");
    var_dbcb1965 = 1;
    function_8721028e(ac130.owner, 1, var_dbcb1965);
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0x5634ceda, Offset: 0x3ff8
// Size: 0x34
function function_591b8468(attacker, weapon) {
    function_3ddb4f8e(level.ac130, attacker, weapon);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x0
// Checksum 0xa1aa00ec, Offset: 0x4038
// Size: 0x84
function function_feaaedba(missile) {
    targetent = self;
    targetent endon(#"delete", #"death");
    missile waittill(#"death", #"delete");
    targetent delete();
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0xd01e2d, Offset: 0x40c8
// Size: 0x1f8
function function_4f426310(player, heli) {
    player endon(#"disconnect", #"hash_31fa26bcde15ad26");
    heli endon(#"death", #"crashing", #"leaving");
    heli.locksounds = spawn("script_model", heli.origin);
    wait(0.1);
    heli.locksounds linkto(heli, "tag_origin");
    while (1) {
        heli waittill(#"locking on");
        while (1) {
            if (function_83533d90(heli)) {
                heli.locksounds playsoundtoplayer(#"hash_fa62d8cec85b1a0", player);
                wait(0.125);
            }
            if (function_47ab3c40(heli)) {
                heli.locksounds playsoundtoplayer(#"hash_1683ed70beb3f2", player);
                wait(0.125);
            }
            if (!function_83533d90(heli) && !function_47ab3c40(heli)) {
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
function function_83533d90(heli) {
    return isdefined(heli.locking_on) && heli.locking_on;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xe0dfd7c8, Offset: 0x42f8
// Size: 0x28
function function_47ab3c40(heli) {
    return isdefined(heli.locked_on) && heli.locked_on;
}

// Namespace ac130/ac130
// Params 2, eflags: 0x0
// Checksum 0xdf3a933b, Offset: 0x4328
// Size: 0x3a2
function function_cd679760(startnode, var_bd7589b1) {
    self notify(#"flying");
    self endon(#"flying", #"crashing", #"leaving", #"death");
    bundle = getscriptbundle("killstreak_ac130");
    nextnode = getent(startnode.target, "targetname");
    /#
        assert(isdefined(nextnode), "<unknown string>");
    #/
    self setspeed(150, 80);
    self setneargoalnotifydist(100);
    self setgoal(nextnode.origin + (0, 0, 0), 1);
    self waittill(#"near_goal");
    var_389ec60 = 1;
    if (!self.var_ba0b1611) {
        node = self function_4a01d817(var_bd7589b1, 0);
        level.ac130.currentnode = node;
        var_999c9446 = getent(node.target, "targetname");
        function_bb6faa72(var_999c9446);
        if (isdefined(var_999c9446.script_airspeed) && isdefined(var_999c9446.script_accel)) {
            heli_speed = var_999c9446.script_airspeed;
            heli_accel = var_999c9446.script_accel;
        } else {
            heli_speed = 150 + randomint(20);
            heli_accel = 40 + randomint(10);
        }
        self setspeed(heli_speed, heli_accel);
        self setgoal(var_999c9446.origin + (0, 0, 0), 1);
        self setgoalyaw(var_999c9446.angles[1]);
    }
    if (!isdefined(var_999c9446) || !isdefined(var_999c9446.script_delay)) {
        self waittill(#"near_goal");
        waittime = 10 + randomint(5);
    } else {
        self waittill(#"goal");
        waittime = var_999c9446.script_delay;
    }
    if (var_389ec60) {
        profilestart();
        self function_53d3b37a(bundle);
        profilestop();
        var_389ec60 = 0;
    }
    wait(waittime);
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x6ac3b906, Offset: 0x46d8
// Size: 0x104
function function_53d3b37a(bundle) {
    self.killstreak_duration = isdefined(bundle.ksduration) ? bundle.ksduration : self.var_6a18446d === 1 ? self killstreak_hacking::get_hacked_timeout_duration_ms() : 60000;
    self.killstreak_end_time = gettime() + self.killstreak_duration;
    self.killstreakendtime = int(self.killstreak_end_time);
    self thread killstreaks::waitfortimeout("ac130", self.killstreak_duration, &function_bfe0a51f, "delete", "death");
    self.var_95801183 = 1;
    self function_89ce97de(self.killstreak_duration, self.killstreak_end_time);
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0x195ec507, Offset: 0x47e8
// Size: 0x3c
function function_89ce97de(duration_ms, end_time_ms) {
    if (isdefined(self.owner)) {
        self.owner vehicle::set_vehicle_drivable_time(duration_ms, end_time_ms);
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x0
// Checksum 0xdc54104a, Offset: 0x4830
// Size: 0x2f8
function function_a57c21b8(var_bd7589b1) {
    player = self;
    player endon(#"disconnect", #"hash_31fa26bcde15ad26");
    ac130 = level.ac130;
    settings = getscriptbundle("killstreak_ac130");
    ac130 endon(#"delete", #"hash_72c1abe12fde572a");
    player thread function_7f2e60();
    player.moves = 0;
    while (1) {
        ac130 waittill(#"goal");
        if (player.moves > 0) {
            waittime = randomintrange(settings.var_efac0f7a, settings.var_18d458d2);
            wait(float(waittime) / 1000);
        }
        player.moves++;
        node = self function_4a01d817(var_bd7589b1, 1);
        ac130.currentnode = node;
        var_999c9446 = getent(node.target, "targetname");
        player playlocalsound(#"hash_1ae4524673298983");
        ac130 function_bb6faa72(var_999c9446);
        if (isdefined(var_999c9446.script_airspeed) && isdefined(var_999c9446.script_accel)) {
            heli_speed = var_999c9446.script_airspeed;
            heli_accel = var_999c9446.script_accel;
        } else {
            heli_speed = 80 + randomint(20);
            heli_accel = 40 + randomint(10);
        }
        ac130 setspeed(heli_speed, heli_accel);
        ac130 setgoal(var_999c9446.origin + (0, 0, 0), 1);
        ac130 setgoalyaw(var_999c9446.angles[1]);
    }
}

// Namespace ac130/ac130
// Params 0, eflags: 0x1 linked
// Checksum 0xeb60cc6, Offset: 0x4b30
// Size: 0xd6
function function_7f2e60() {
    player = self;
    player endon(#"disconnect", #"hash_31fa26bcde15ad26");
    ac130 = level.ac130;
    ac130 endon(#"delete", #"hash_72c1abe12fde572a");
    var_9f589009 = self.moves;
    level.ac130.var_ba0b1611 = 1;
    wait(100);
    if (var_9f589009 === self.moves && isdefined(level.ac130)) {
        level.ac130.var_ba0b1611 = 0;
    }
}

// Namespace ac130/ac130
// Params 2, eflags: 0x1 linked
// Checksum 0xdb3cade9, Offset: 0x4c10
// Size: 0x3fe
function function_4a01d817(var_4a5733c5, var_465ed415) {
    validenemies = [];
    foreach (node in var_4a5733c5) {
        node.validplayers = [];
        node.var_e86e559 = 0;
    }
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (player.team == self.team) {
            continue;
        }
        foreach (node in var_4a5733c5) {
            if (distancesquared(player.origin, node.origin) > 1048576) {
                continue;
            }
            node.validplayers[node.validplayers.size] = player;
        }
    }
    var_c2e3e4c5 = undefined;
    foreach (node in var_4a5733c5) {
        if (isdefined(level.ac130.currentnode) && node == level.ac130.currentnode) {
            continue;
        }
        var_2afc6bd7 = getent(node.target, "targetname");
        foreach (player in node.validplayers) {
            node.var_e86e559 = node.var_e86e559 + 1;
            if (bullettracepassed(player.origin + vectorscale((0, 0, 1), 32), var_2afc6bd7.origin, 0, player)) {
                node.var_e86e559 = node.var_e86e559 + 3;
            }
        }
        if (var_465ed415 && distancesquared(level.ac130.origin, var_2afc6bd7.origin) < 40000) {
            node.var_e86e559 = -1;
        }
        if (!isdefined(var_c2e3e4c5) || node.var_e86e559 > var_c2e3e4c5.var_e86e559) {
            var_c2e3e4c5 = node;
        }
    }
    return var_c2e3e4c5;
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0xb4374067, Offset: 0x5018
// Size: 0x2b2
function function_bb6faa72(goalnode) {
    var_2edd2f3c = function_ca7ac4fd(goalnode);
    if (var_2edd2f3c[#"start"] != self.origin) {
        if (isdefined(goalnode.script_airspeed) && isdefined(goalnode.script_accel)) {
            heli_speed = goalnode.script_airspeed;
            heli_accel = goalnode.script_accel;
        } else {
            heli_speed = 30 + randomint(20);
            heli_accel = 15 + randomint(15);
        }
        self setspeed(heli_speed, heli_accel);
        self setgoal(var_2edd2f3c[#"start"] + vectorscale((0, 0, 1), 30), 0);
        self setgoalyaw(goalnode.angles[1]);
        self waittill(#"goal");
    }
    if (var_2edd2f3c[#"end"] != goalnode.origin) {
        if (isdefined(goalnode.script_airspeed) && isdefined(goalnode.script_accel)) {
            heli_speed = goalnode.script_airspeed;
            heli_accel = goalnode.script_accel;
        } else {
            heli_speed = 30 + randomint(20);
            heli_accel = 15 + randomint(15);
        }
        self setspeed(heli_speed, heli_accel);
        self setgoal(var_2edd2f3c[#"end"] + vectorscale((0, 0, 1), 30), 0);
        self setgoalyaw(goalnode.angles[1]);
        self waittill(#"goal");
    }
}

// Namespace ac130/ac130
// Params 1, eflags: 0x1 linked
// Checksum 0x965ed4b5, Offset: 0x52d8
// Size: 0x246
function function_ca7ac4fd(goalnode) {
    startorigin = self.origin;
    endorigin = goalnode.origin;
    var_f1f22232 = 0;
    var_857ad2d3 = 40;
    traceoffset = vectorscale((0, 0, -1), 196);
    traceorigin = bullettrace(startorigin + traceoffset, endorigin + traceoffset, 0, self);
    while (distancesquared(traceorigin[#"position"], endorigin + traceoffset) > 10 && var_f1f22232 < var_857ad2d3) {
        /#
            println("<unknown string>" + distancesquared(traceorigin[#"position"], endorigin + traceoffset));
        #/
        if (startorigin[2] < endorigin[2]) {
            startorigin = startorigin + vectorscale((0, 0, 1), 128);
        } else if (startorigin[2] > endorigin[2]) {
            endorigin = endorigin + vectorscale((0, 0, 1), 128);
        } else {
            startorigin = startorigin + vectorscale((0, 0, 1), 128);
            endorigin = endorigin + vectorscale((0, 0, 1), 128);
        }
        var_f1f22232++;
        traceorigin = bullettrace(startorigin + traceoffset, endorigin + traceoffset, 0, self);
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
    vehicle endon(#"hash_72c1abe12fde572a");
    self endon(#"disconnect");
    waitframe(1);
    while (self isremotecontrolling()) {
        enemy = undefined;
        enemies = self teams::getenemyplayers();
        enemies = array::randomize(enemies);
        foreach (var_607bb54c in enemies) {
            if (isalive(var_607bb54c)) {
                enemy = var_607bb54c;
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
            vehicle turretsettargetangles(0, vectorscale((1, 0, 0), 15));
            if (isdefined(enemy)) {
                wait(2 + randomfloat(0.5));
            }
        }
        wait(0.1);
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
        self.var_1824934b = (isdefined(self.var_1824934b) ? self.var_1824934b : 0) + 1;
    } else {
        self.var_6c81f48 = (isdefined(self.var_6c81f48) ? self.var_6c81f48 : 0) + 1;
    }
    wait(2.5);
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
        switch (self.var_1824934b) {
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
        self.var_1824934b = 0;
    } else {
        switch (self.var_6c81f48) {
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
        self.var_6c81f48 = 0;
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
    wait(0.1);
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
    wait(0.1);
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
    wait(randomfloatrange(0.1, 0.2));
    if (0) {
        goalx = randomfloatrange(650, 700);
        goaly = randomfloatrange(650, 700);
        if (randomintrange(0, 2) > 0) {
            goalx = goalx * -1;
        }
        if (randomintrange(0, 2) > 0) {
            goaly = goaly * -1;
        }
        var_8518e93e = randomfloatrange(3, 4);
        plane setplanebarrelroll(randomfloatrange(0.0833333, 0.111111), randomfloatrange(4, 5));
        plane_speed = plane getspeedmph();
        wait(0.7);
        plane setspeed(plane_speed * 1.5, 300);
        wait(var_8518e93e - 0.7);
    }
    plane function_cd29787b();
    wait(0.1);
    plane ghost();
    wait(0.5);
}

