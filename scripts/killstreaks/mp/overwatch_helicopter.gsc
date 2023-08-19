// Atian COD Tools GSC decompiler test
#include scripts/weapons/heatseekingmissile.gsc;
#include scripts/weapons/hacker_tool.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/killstreaks/mp/swat_team.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/killstreaks/killstreakrules_shared.gsc;
#include scripts/killstreaks/killstreak_hacking.gsc;
#include scripts/killstreaks/killstreak_bundles.gsc;
#include scripts/killstreaks/helicopter_shared.gsc;
#include scripts/killstreaks/airsupport.gsc;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/animation_shared.gsc;
#include script_3819e7a1427df6d2;
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/vehicle_ai_shared.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/oob.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/hostmigration_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/audio_shared.gsc;
#include scripts/core_common/ai_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace overwatch_helicopter;

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x2
// Checksum 0xed3013f8, Offset: 0x458
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"overwatch_helicopter", &__init__, undefined, #"killstreaks");
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0xd00b783a, Offset: 0x4a8
// Size: 0x374
function __init__() {
    killstreaks::register_killstreak("killstreak_overwatch_helicopter", &function_2e1b9b27);
    killstreaks::register_alt_weapon("overwatch_helicopter", getweapon(#"hash_6c1be4b025206124"));
    killstreaks::set_team_kill_penalty_scale("overwatch_helicopter", level.teamkillreducedpenalty);
    callback::on_player_killed_with_params(&on_player_killed);
    level.var_24de8afe = &function_24de8afe;
    level.killstreaks[#"overwatch_helicopter"].threatonkill = 1;
    level.var_93215f31 = getdvarint(#"hash_1300f6ba32e8d68c", 2500);
    level.var_bf127508 = getdvarint(#"hash_163c95340307e3aa", 1800);
    level.var_5f6d1a12 = getdvarint(#"hash_16579f34031ebc60", 2000);
    level.var_fb59767 = getdvarint(#"hash_3a28b6936bc7d2a9", 200);
    level.var_739f9c79 = getdvarint(#"hash_26f6fa23a134bc05", 4);
    level.var_b6d2e275 = getdvarint(#"hash_27120423a14b94bb", 6);
    if (!isdefined(level.var_3c5cbd62)) {
        level.var_3c5cbd62 = [];
        level.var_3c5cbd62[#"allies"] = [];
        level.var_3c5cbd62[#"allies"][0] = "spawner_mp_swat_gunner_team1_male";
        level.var_3c5cbd62[#"allies"][1] = "spawner_mp_swat_gunner_team1_female";
        level.var_3c5cbd62[#"allies"][2] = "spawner_mp_swat_gunner_team1_male";
        level.var_3c5cbd62[#"axis"] = [];
        level.var_3c5cbd62[#"axis"][0] = "spawner_mp_swat_gunner_team2_male";
        level.var_3c5cbd62[#"axis"][1] = "spawner_mp_swat_gunner_team2_female";
        level.var_3c5cbd62[#"axis"][2] = "spawner_mp_swat_gunner_team2_male";
    }
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0x83c63806, Offset: 0x828
// Size: 0x48
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon("overwatch_helicopter"), &function_bff5c062);
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 2, eflags: 0x1 linked
// Checksum 0x2b2fe151, Offset: 0x878
// Size: 0x144
function function_bff5c062(var_f9e52949, attackingplayer) {
    foreach (var_e60c203 in var_f9e52949.var_e60e2941) {
        if (!isdefined(var_e60c203)) {
            continue;
        }
        var_e60c203 dodamage(1000, var_e60c203.origin, attackingplayer);
    }
    var_f9e52949.var_953f407f = 1;
    if (isdefined(var_f9e52949.owner)) {
        var_f9e52949.owner thread globallogic_audio::function_fd32b1bd("overwatch_helicopter_snipers");
    }
    var_f9e52949 killstreaks::function_73566ec7(attackingplayer, getweapon(#"gadget_icepick"), var_f9e52949.owner);
    var_f9e52949 wait_and_explode();
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x3bc76929, Offset: 0x9c8
// Size: 0xd0
function function_2e1b9b27(var_d3413870) {
    if (!self killstreakrules::iskillstreakallowed("overwatch_helicopter", self.team)) {
        return 0;
    }
    self val::set(#"hash_1ddc89a14806a229", "freezecontrols");
    result = self function_ca6698c6();
    self val::reset(#"hash_1ddc89a14806a229", "freezecontrols");
    if (level.gameended) {
        return 1;
    }
    if (!isdefined(result)) {
        return 0;
    }
    return result;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0x2029c769, Offset: 0xaa0
// Size: 0x698
function function_ca6698c6() {
    player = self;
    player endon(#"disconnect");
    level endon(#"game_ended");
    killstreak_id = player killstreakrules::killstreakstart("overwatch_helicopter", player.team, undefined, 1);
    if (killstreak_id == -1) {
        return 0;
    }
    if (!isdefined(level.heli_primary_path) || !level.heli_primary_path.size) {
        return 0;
    }
    random_path = randomint(level.heli_paths[0].size);
    startnode = level.heli_paths[0][random_path];
    protectlocation = (player.origin[0], player.origin[1], int(airsupport::getminimumflyheight()));
    bundle = struct::get_script_bundle("killstreak", "killstreak_overwatch_helicopter");
    helicopter = spawnvehicle(bundle.ksvehicle, startnode.origin, startnode.angles);
    helicopter setowner(player);
    helicopter killstreaks::configure_team("overwatch_helicopter", killstreak_id, player, "helicopter");
    helicopter.killstreak_id = killstreak_id;
    helicopter.var_b46557d6 = &function_39badde6;
    helicopter.hardpointtype = "overwatch_helicopter";
    helicopter clientfield::set("enemyvehicle", 1);
    helicopter vehicle::init_target_group();
    helicopter.var_95801183 = 0;
    helicopter.allowdeath = 0;
    helicopter.targeting_delay = level.heli_targeting_delay;
    helicopter.identifier_weapon = getweapon("overwatch_helicopter");
    helicopter.var_ba0b1611 = 0;
    helicopter.soundmod = "heli";
    helicopter.usage = [];
    helicopter.shuttingdown = 0;
    helicopter.maxhealth = isdefined(killstreak_bundles::get_max_health("overwatch_helicopter")) ? killstreak_bundles::get_max_health("overwatch_helicopter") : 5000;
    helicopter.var_7a213748 = helicopter.maxhealth;
    helicopter.health = helicopter.maxhealth;
    helicopter.damagetaken = 0;
    helicopter.do_scripted_crash = 0;
    helicopter thread helicopter::heli_health("overwatch_helicopter");
    helicopter setcandamage(1);
    target_set(helicopter, vectorscale((0, 0, -1), 100));
    target_setallowhighsteering(helicopter, 1);
    helicopter setrotorspeed(1);
    helicopter thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("death");
    helicopter.numflares = 1;
    helicopter thread helicopter::create_flare_ent(vectorscale((0, 0, -1), 100));
    helicopter.totalrockethits = 0;
    helicopter.var_4265be4a = 0;
    helicopter.overridevehicledamage = &function_a0068ca0;
    helicopter thread helicopter::heli_health("overwatch_helicopter");
    helicopter thread function_c4b00a04(startnode, protectlocation, "overwatch_helicopter", player.team);
    helicopter thread helicopter::heli_targeting(0, "overwatch_helicopter");
    player thread killstreaks::play_killstreak_start_dialog("overwatch_helicopter", player.team, killstreak_id);
    helicopter killstreaks::play_pilot_dialog_on_owner("arrive", "overwatch_helicopter", killstreak_id);
    settings = getscriptbundle("killstreak_overwatch_helicopter");
    player notify(#"hash_7b84cc3c326479a6", {#chopper:helicopter});
    player addweaponstat(settings.ksweapon, #"used", 1);
    player thread function_a9fc0ef6(helicopter);
    player thread function_5f941d8a(helicopter);
    function_ab667e1c(player, helicopter);
    helicopter thread function_5c15f6d6();
    util::function_5a68c330(21, player.team, player getentitynumber(), #"hash_76bc8a74d60388e4");
    return 1;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 3, eflags: 0x1 linked
// Checksum 0x4bcc8f12, Offset: 0x1140
// Size: 0x20c
function function_f6442ecd(helicopter, player, var_cef1449f) {
    if (!isdefined(helicopter) || helicopter.var_953f407f === 1) {
        return;
    }
    if (isdefined(player)) {
        player vehicle::stop_monitor_missiles_locked_on_to_me();
        player vehicle::stop_monitor_damage_as_occupant();
    }
    helicopter.shuttingdown = 1;
    helicopter.occupied = 0;
    helicopter.hardpointtype = "overwatch_helicopter";
    helicopter thread audio::sndupdatevehiclecontext(0);
    if (isdefined(player)) {
        player thread globallogic_audio::function_fd32b1bd("overwatch_helicopter_snipers");
        player notify(#"hash_10cc0a0c192e542");
    }
    helicopter.var_953f407f = 1;
    if (isdefined(helicopter.var_e60e2941)) {
        foreach (swat_gunner in helicopter.var_e60e2941) {
            if (isdefined(swat_gunner)) {
                swat_gunner.ignoreall = 1;
            }
        }
    }
    team = helicopter.originalteam;
    killstreakid = helicopter.killstreak_id;
    helicopter helicopter::heli_leave();
    swat_cleanup(helicopter);
    killstreakrules::killstreakstop("overwatch_helicopter", team, killstreakid);
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0x462a902c, Offset: 0x1358
// Size: 0x28
function function_39badde6() {
    helicopter = self;
    helicopter notify(#"hash_3904c1a9ebdc27de");
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 15, eflags: 0x1 linked
// Checksum 0x6c4d8991, Offset: 0x1388
// Size: 0x45e
function function_a0068ca0(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    helicopter = self;
    if (smeansofdeath == "MOD_TRIGGER_HURT") {
        return 0;
    }
    if (helicopter.shuttingdown) {
        return 0;
    }
    idamage = self killstreaks::ondamageperweapon("overwatch_helicopter", eattacker, idamage, idflags, smeansofdeath, weapon, helicopter.maxhealth, undefined, helicopter.maxhealth * 0.4, undefined, 0, undefined, 1, 1);
    if (idamage == 0) {
        return 0;
    }
    var_f180e0af = smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_EXPLOSIVE";
    if (weapon.statindex == level.weaponshotgunenergy.statindex || weapon.statindex == level.weaponpistolenergy.statindex) {
        var_f180e0af = 0;
    }
    if (idamage >= helicopter.health && !helicopter.shuttingdown) {
        helicopter.shuttingdown = 1;
        helicopter thread wait_and_explode();
        eattacker = self [[ level.figure_out_attacker ]](eattacker);
        if (isdefined(eattacker) && isplayer(eattacker) && (!isdefined(helicopter.owner) || helicopter.owner util::isenemyplayer(eattacker))) {
            if (isdefined(helicopter.owner)) {
                helicopter.owner thread globallogic_audio::function_fd32b1bd("overwatch_helicopter_snipers");
                helicopter killstreaks::play_destroyed_dialog_on_owner("overwatch_helicopter", helicopter.killstreak_id);
            }
            helicopter killstreaks::function_73566ec7(eattacker, weapon, helicopter.owner);
            luinotifyevent(#"player_callout", 2, #"hash_3440c27a76738802", eattacker.entnum);
            eattacker battlechatter::function_dd6a6012("overwatch_helicopter", weapon);
            challenges::destroyedhelicopter(eattacker, weapon, smeansofdeath, 0);
            eattacker challenges::addflyswatterstat(weapon, self);
            eattacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
        }
        helicopter thread function_7c78a751();
    } else if (!helicopter.shuttingdown && !(isdefined(helicopter.var_ddabcaf1) && helicopter.var_ddabcaf1)) {
        helicopter.owner thread globallogic_audio::function_fd32b1bd("overwatch_helicopter_snipers");
        helicopter killstreaks::play_pilot_dialog_on_owner("damaged", "overwatch_helicopter", helicopter.killstreak_id);
        helicopter.var_ddabcaf1 = 1;
    }
    return idamage;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0xd9bca7a2, Offset: 0x17f0
// Size: 0x3c
function wait_and_explode() {
    self endon(#"death");
    wait(0.5);
    if (isdefined(self)) {
        self function_520df983(self);
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0x19b36909, Offset: 0x1838
// Size: 0x9c
function function_7c78a751() {
    helicopter = self;
    helicopter endon(#"death");
    if (self.var_90717a === 1) {
        return;
    }
    self.var_90717a = 1;
    var_23f04d4f = 5;
    helicopter waittilltimeout(var_23f04d4f, #"static_fx_done");
    function_f6442ecd(helicopter, helicopter.owner, 1);
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 2, eflags: 0x1 linked
// Checksum 0xd44746f8, Offset: 0x18e0
// Size: 0xe4
function function_49dca506(helicopter, attacker) {
    if (isdefined(attacker)) {
        luinotifyevent(#"player_callout", 2, #"hash_20aa28bee9cfdd61", attacker.entnum);
    }
    if (target_istarget(helicopter)) {
        target_remove(helicopter);
    }
    if (isdefined(helicopter.flare_ent)) {
        helicopter.flare_ent delete();
        helicopter.flare_ent = undefined;
    }
    killstreakrules::killstreakstop("overwatch_helicopter", helicopter.originalteam, helicopter.killstreak_id);
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x1f723a75, Offset: 0x19d0
// Size: 0xb4
function function_520df983(helicopter) {
    function_49dca506(helicopter);
    helicopter.var_570c07f9 = 1;
    helicopter notify(#"hash_3904c1a9ebdc27de");
    helicopter playloopsound(#"exp_veh_plane_spinout_lp");
    helicopter::heli_explode();
    helicopter playsound(#"exp_veh_large");
    helicopter delete();
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0xa802eb99, Offset: 0x1a90
// Size: 0xb4
function function_a9fc0ef6(helicopter) {
    waitresult = undefined;
    waitresult = helicopter waittill(#"hash_3904c1a9ebdc27de");
    attacker = waitresult.attacker;
    if (!(isdefined(helicopter.var_570c07f9) && helicopter.var_570c07f9)) {
        function_f6442ecd(helicopter, helicopter.owner, 1);
        if (isdefined(helicopter)) {
            helicopter delete();
        }
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x14e9574, Offset: 0x1b50
// Size: 0x150
function function_5f941d8a(helicopter) {
    helicopter notify(#"hash_73c07c54a285eb73");
    helicopter endon(#"hash_73c07c54a285eb73", #"hash_3196bdf9a0ef317f");
    /#
        assert(isplayer(self));
    #/
    player = self;
    player endon(#"hash_10cc0a0c192e542");
    player waittill(#"joined_team", #"disconnect", #"joined_spectators");
    var_cef1449f = !isdefined(player) || isdefined(helicopter) && helicopter.ownerentnum == player.entnum;
    player thread function_f6442ecd(helicopter, player, var_cef1449f);
    if (var_cef1449f && isdefined(helicopter)) {
        helicopter notify(#"hash_3904c1a9ebdc27de");
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 4, eflags: 0x1 linked
// Checksum 0xd20fbe4a, Offset: 0x1ca8
// Size: 0x1aa
function function_82fb79e3(startnode, protectdest, hardpointtype, heli_team) {
    self endon(#"death", #"abandoned");
    self.protectdest = protectdest;
    self.var_6c63b409 = protectdest;
    radius = 10000;
    if (isdefined(self.owner)) {
        radius = distance(protectdest, self.origin);
    }
    var_a9a839e2 = getclosestpointonnavvolume(protectdest, "navvolume_big", radius);
    if (isdefined(var_a9a839e2)) {
        protectdest = var_a9a839e2;
        self.var_6c63b409 = protectdest;
        var_b140bc48 = heli_get_protect_spot(protectdest, undefined, heli_team);
        if (isdefined(var_b140bc48)) {
            self helicopter::function_86012f82(var_b140bc48.origin, 1);
            protectdest = var_b140bc48.origin;
            self.var_6c63b409 = var_b140bc48.origin;
        } else {
            self helicopter::function_86012f82(protectdest, 1);
        }
    }
    self helicopter::function_86012f82(protectdest, 1);
    self waittill(#"near_goal");
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 0, eflags: 0x1 linked
// Checksum 0xd3ce622c, Offset: 0x1e60
// Size: 0x24e
function function_5c15f6d6() {
    self endon(#"death", #"crashing", #"leaving");
    for (;;) {
        for (;;) {
            if (isdefined(self.protectdest) && isdefined(self.heligoalpos)) {
                self vehclearlookat();
                if (self.var_eaf98cf === self.protectdest && self.var_d9b0ae19 === self.heligoalpos) {
                    wait(1);
                    continue;
                }
                self.var_eaf98cf = self.protectdest;
                self.var_d9b0ae19 = self.heligoalpos;
                var_5eb30267 = (self.protectdest[0] - self.heligoalpos[0], self.protectdest[1] - self.heligoalpos[1], 0);
                var_5eb30267 = vectornormalize(var_5eb30267);
                angles = vectortoangles(var_5eb30267);
                var_d24d4fe2 = isdefined(self.var_62a768cb) && isalive(self.var_62a768cb);
                var_ccfa6c33 = isdefined(self.var_e8b1fa34) && isalive(self.var_e8b1fa34);
                if (var_d24d4fe2 && var_ccfa6c33) {
                    if (randomint(100) > 50) {
                        yaw = angles[1] + 90;
                    } else {
                        yaw = angles[1] - 90;
                    }
                } else if (var_d24d4fe2) {
                    yaw = angles[1] + 90;
                } else {
                    yaw = angles[1] - 90;
                }
                self setgoalyaw(yaw);
            }
        }
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 4, eflags: 0x1 linked
// Checksum 0xb1d6d01b, Offset: 0x20b8
// Size: 0x34c
function function_c4b00a04(startnode, protectdest, hardpointtype, heli_team) {
    self endon(#"death", #"abandoned");
    helicopter::heli_reset();
    self.reached_dest = 0;
    self.goalradius = 30;
    starttime = gettime();
    self.halftime = starttime + int(level.heli_protect_time * 0.5 * 1000);
    self.killstreakendtime = starttime + int(level.heli_protect_time * 1000);
    self.endtime = starttime + int(level.heli_protect_time * 1000);
    var_520e3459 = level.heli_protect_pos_time;
    self thread helicopter::function_656691ab();
    self thread helicopter::function_81cba63();
    self function_82fb79e3(startnode, protectdest, hardpointtype, heli_team);
    while (gettime() < self.killstreakendtime) {
        if (!(isdefined(self.var_478039e8) && self.var_478039e8) && gettime() >= self.halftime) {
            self.owner thread globallogic_audio::function_fd32b1bd("overwatch_helicopter_snipers");
            self killstreaks::play_pilot_dialog_on_owner("timecheck", hardpointtype);
            self.var_478039e8 = 1;
        }
        var_520e3459 = randomintrange(level.var_739f9c79, level.var_b6d2e275);
        waitresult = undefined;
        waitresult = self waittilltimeout(var_520e3459, #"locking on", #"locking on hacking", #"damage state");
        newdest = heli_get_protect_spot(protectdest, undefined, heli_team);
        self.protectdest = protectdest;
        if (isdefined(newdest)) {
            self helicopter::function_86012f82(newdest.origin, 1);
            self waittill(#"near_goal");
        } else {
            wait(var_520e3459);
        }
        hostmigration::waittillhostmigrationdone();
    }
    self helicopter::heli_set_active_camo_state(1);
    self thread function_f6442ecd(self, self.owner, 0);
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x5145a565, Offset: 0x2410
// Size: 0xaa
function function_af77f078(helicopter) {
    if (isdefined(helicopter.var_e60e2941)) {
        foreach (swat in helicopter.var_e60e2941) {
            if (isdefined(swat) && isdefined(swat.enemy)) {
                return swat.enemy;
            }
        }
    }
    return undefined;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 3, eflags: 0x1 linked
// Checksum 0x1552a7e2, Offset: 0x24c8
// Size: 0x42e
function heli_get_protect_spot(protectdest, var_551cf1b9, heli_team) {
    /#
        assert(isdefined(level.var_93215f31));
    #/
    if (!isdefined(var_551cf1b9)) {
        var_551cf1b9 = level.var_93215f31;
    }
    min_radius = int(var_551cf1b9 * 0.6);
    max_radius = var_551cf1b9;
    groundpos = getclosestpointonnavmesh(protectdest, 10000);
    /#
        assert(isdefined(level.var_bf127508) && isdefined(level.var_5f6d1a12));
    #/
    /#
        assert(isdefined(level.var_5f6d1a12 >= level.var_bf127508));
    #/
    heightmin = level.var_bf127508;
    heightmax = level.var_5f6d1a12;
    if (heli_team == #"axis") {
        /#
            assert(isdefined(level.var_fb59767));
        #/
        heightmin = heightmin + level.var_fb59767;
        heightmax = heightmax + level.var_fb59767;
    }
    hoverheight = heightmin + (heightmax - heightmin) / 2;
    radius = 10000;
    if (isdefined(groundpos)) {
        var_9ff2f344 = undefined;
        target = function_af77f078(self);
        if (isdefined(target)) {
            var_9ff2f344 = getclosestpointonnavmesh(target.origin, 10000);
        }
        if (isdefined(var_9ff2f344)) {
            groundpos = var_9ff2f344;
        }
        protectdest = (groundpos[0], groundpos[1], groundpos[2] + hoverheight);
        protectdest = getclosestpointonnavvolume(protectdest, "navvolume_big", radius);
        self.var_2c1a38eb = groundpos;
        self.var_f9d38924 = protectdest;
        halfheight = (heightmax - heightmin) / 2;
        queryresult = positionquery_source_navigation(protectdest, min_radius, max_radius, halfheight, 50, self);
        if (isdefined(queryresult.data) && queryresult.data.size) {
            validpoints = [];
            var_7f378b0 = randomintrange(heightmin, heightmax);
            foreach (point in queryresult.data) {
                distsq = distancesquared(self.origin, point.origin);
                if (distsq >= var_7f378b0 * var_7f378b0) {
                    array::add(validpoints, point);
                }
            }
            if (validpoints.size) {
                return array::random(validpoints);
            }
        }
    }
    return undefined;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 2, eflags: 0x1 linked
// Checksum 0x164b6fad, Offset: 0x2900
// Size: 0x4de
function function_ab667e1c(owner, helicopter) {
    /#
        assert(isdefined(helicopter));
    #/
    owner.var_e60e2941 = [];
    helicopter.var_e60e2941 = [];
    aitypes = level.var_3c5cbd62[#"axis"];
    if (isdefined(owner.team) && owner.team == #"allies") {
        aitypes = level.var_3c5cbd62[#"allies"];
    }
    for (i = 0; i < 3; i++) {
        swat_gunner = spawnactor(aitypes[i], helicopter.origin, (0, 0, 0), "swat_gunner");
        if (!isdefined(owner.var_e60e2941)) {
            owner.var_e60e2941 = [];
        } else if (!isarray(owner.var_e60e2941)) {
            owner.var_e60e2941 = array(owner.var_e60e2941);
        }
        owner.var_e60e2941[owner.var_e60e2941.size] = swat_gunner;
        if (!isdefined(helicopter.var_e60e2941)) {
            helicopter.var_e60e2941 = [];
        } else if (!isarray(helicopter.var_e60e2941)) {
            helicopter.var_e60e2941 = array(helicopter.var_e60e2941);
        }
        helicopter.var_e60e2941[helicopter.var_e60e2941.size] = swat_gunner;
        swat_gunner setentityowner(owner);
        swat_gunner setteam(owner.team);
        swat_gunner.killcament = helicopter;
        swat_gunner.voxid = i;
        aiutility::addaioverridedamagecallback(swat_gunner, &swat_team::function_47cf421e);
        swat_gunner callback::function_d8abfc3d(#"on_ai_damage", &function_8338a92d);
        if (i == 0) {
            swat_gunner linkto(helicopter, "tag_rider1", (0, 0, 0), vectorscale((0, 1, 0), 90));
            swat_gunner.ai.swat_gunner = 1;
            helicopter.var_62a768cb = swat_gunner;
            swat_gunner function_7fac6670(swat_gunner);
            swat_gunner thread function_64b435c4(swat_gunner);
        } else if (i == 1) {
            swat_gunner linkto(helicopter, "tag_rider2", (0, 0, 0), vectorscale((0, -1, 0), 90));
            swat_gunner.ai.swat_gunner = 1;
            helicopter.var_e8b1fa34 = swat_gunner;
            swat_gunner function_7fac6670(swat_gunner);
            swat_gunner thread function_64b435c4(swat_gunner);
        } else {
            swat_gunner linkto(helicopter, "tag_driver", (0, 0, 0), (0, 0, 0));
            swat_gunner.ai.var_f185cb34 = 1;
            swat_gunner.ai.swat_gunner = 1;
            swat_gunner.ignoreall = 1;
            swat_gunner ai::gun_remove();
        }
        swat_gunner thread function_ab6f69a1(swat_gunner, helicopter);
        swat_gunner thread function_67260255(swat_gunner, helicopter);
        swat_gunner thread function_b8047055(swat_gunner, helicopter);
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0xeb4500a8, Offset: 0x2de8
// Size: 0x140
function function_64b435c4(ai) {
    self endon(#"death");
    sniper_glint = #"hash_3db1ecb54b192a49";
    while (1) {
        self waittill(#"sniper_glint");
        if (ai.laserstatus !== 1) {
            tag = ai gettagorigin("tag_flash");
            if (isdefined(tag)) {
                playfxontag(sniper_glint, ai, "tag_flash");
            } else {
                type = isdefined(ai.classname) ? "" + ai.classname : "";
                /#
                    println("<unknown string>" + type + "<unknown string>");
                #/
                playfxontag(sniper_glint, ai, "tag_eye");
            }
        }
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 2, eflags: 0x1 linked
// Checksum 0xcd093ee2, Offset: 0x2f30
// Size: 0x33a
function function_b8047055(swat_gunner, helicopter) {
    swat_gunner endon(#"death");
    helicopter.owner endon(#"hash_10cc0a0c192e542");
    while (isdefined(helicopter) && !helicopter.shuttingdown) {
        event = undefined;
        if (isdefined(self.enemy)) {
            enemy = self.enemy;
            result = undefined;
            result = self waittill(#"enemy");
            if (isdefined(self.enemy)) {
                event = "found_new_enemy";
            } else if (isalive(enemy)) {
                event = "lost_enemy";
            }
        } else {
            result = undefined;
            result = self waittill(#"enemy");
            event = "found_new_enemy";
        }
        if (!isdefined(helicopter.owner) || !isdefined(event) || isdefined(helicopter.owner.var_fdadf23f) && gettime() < helicopter.owner.var_fdadf23f) {
            waitframe(1);
            continue;
        }
        self.script_owner globallogic_audio::flush_leader_dialog_key_on_player("targetAquired");
        self.script_owner globallogic_audio::flush_leader_dialog_key_on_player("targetLost");
        self.script_owner globallogic_audio::flush_leader_dialog_key_on_player("secondaryTargetAquired");
        self.script_owner globallogic_audio::flush_leader_dialog_key_on_player("secondaryTargetLost");
        switch (event) {
        case #"hash_6a8ebbdc35e20199":
            if (self.voxid == 0) {
                self.script_owner globallogic_audio::play_taacom_dialog("targetAquired", "overwatch_helicopter_snipers");
            } else {
                self.script_owner globallogic_audio::play_taacom_dialog("secondaryTargetAquired", "overwatch_helicopter_snipers");
            }
            break;
        case #"hash_27a37f5d2e008740":
            if (self.voxid == 0) {
                self.script_owner globallogic_audio::play_taacom_dialog("targetLost", "overwatch_helicopter_snipers");
            } else {
                self.script_owner globallogic_audio::play_taacom_dialog("secondaryTargetLost", "overwatch_helicopter_snipers");
            }
            break;
        default:
            break;
        }
        helicopter.owner.var_fdadf23f = gettime() + 10000;
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x5 linked
// Checksum 0xece9aadf, Offset: 0x3278
// Size: 0x2f2
function private on_player_killed(params) {
    self notify("105d6541393f1fd");
    self endon("105d6541393f1fd");
    if (!isdefined(params) || !isdefined(self) || !isdefined(params.einflictor) || !isdefined(params.einflictor.script_owner) || !isdefined(params.einflictor.voxid) || !isdefined(params.einflictor.ai) || !(isdefined(params.einflictor.ai.swat_gunner) && params.einflictor.ai.swat_gunner) || params.einflictor.weapon.name != #"hash_6c1be4b025206124" || self == params.einflictor.script_owner || level.teambased && self.team == params.einflictor.script_owner.team) {
        return;
    }
    swat_gunner = params.einflictor;
    if (!isdefined(swat_gunner.bda)) {
        swat_gunner.bda = 0;
    }
    swat_gunner.bda++;
    wait(1);
    if (!isdefined(swat_gunner) || !isdefined(swat_gunner.script_owner)) {
        return;
    }
    if (swat_gunner.voxid == 0) {
        if (swat_gunner.bda == 1) {
            swat_gunner.script_owner globallogic_audio::play_taacom_dialog("kill1", "overwatch_helicopter_snipers");
        } else {
            swat_gunner.script_owner globallogic_audio::play_taacom_dialog("killMultiple", "overwatch_helicopter_snipers");
        }
    } else if (swat_gunner.bda == 1) {
        swat_gunner.script_owner globallogic_audio::play_taacom_dialog("secondaryKill1", "overwatch_helicopter_snipers");
    } else {
        swat_gunner.script_owner globallogic_audio::play_taacom_dialog("secondaryKillMultiple", "overwatch_helicopter_snipers");
    }
    swat_gunner.bda = 0;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0xd8668539, Offset: 0x3578
// Size: 0xea
function function_8338a92d(params) {
    if (!isdefined(self) || !isdefined(self.voxid) || !isdefined(self.script_owner) || isdefined(self.var_2cf2e843) && self.var_2cf2e843 || self.damagetaken > self.maxhealth * 0.5) {
        return;
    }
    if (self.voxid == 0) {
        self.script_owner globallogic_audio::play_taacom_dialog("damaged", "overwatch_helicopter_snipers");
    } else {
        self.script_owner globallogic_audio::play_taacom_dialog("damaged1", "overwatch_helicopter_snipers");
    }
    self.var_2cf2e843 = 1;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 2, eflags: 0x1 linked
// Checksum 0x412e37c5, Offset: 0x3670
// Size: 0x156
function function_24de8afe(var_e8c2fadd, owner) {
    if (!isdefined(self) || !isdefined(owner) || !isdefined(var_e8c2fadd) || !isplayer(var_e8c2fadd) || var_e8c2fadd.team == owner.team || !isdefined(self.enemy) || self.enemy != var_e8c2fadd) {
        return;
    }
    if (owner.killstreakdialogqueue.size > 1 || isdefined(owner.currentkillstreakdialog) || isdefined(owner.var_a0f4a4fe) && owner.var_a0f4a4fe < gettime()) {
        return;
    }
    if (self.voxid == 0) {
        owner globallogic_audio::play_taacom_dialog("killNone", "overwatch_helicopter_snipers");
    } else {
        owner globallogic_audio::play_taacom_dialog("secondaryKillNone", "overwatch_helicopter_snipers");
    }
    owner.var_a0f4a4fe = gettime() + 5000;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x4
// Checksum 0xb40a754d, Offset: 0x37d0
// Size: 0x60
function private function_b5e16bd7(swat_gunner) {
    self endon(#"death");
    while (1) {
        swat_gunner animation::play(#"hash_672583eed187c6a7", self.origin, self.angles);
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x1 linked
// Checksum 0x543d9a6e, Offset: 0x3838
// Size: 0x6e
function function_7fac6670(swat_gunner) {
    swat_gunner.perfectaim = 1;
    swat_gunner.sightlatency = 0;
    swat_gunner.fovcosine = 0;
    swat_gunner.fovcosinebusy = 0;
    swat_gunner laseron();
    self.health = 1000;
    self.maxhealth = 1000;
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 2, eflags: 0x5 linked
// Checksum 0xd84b4ae8, Offset: 0x38b0
// Size: 0x204
function private function_ab6f69a1(swat, helicopter) {
    swat waittill(#"death");
    if (isdefined(helicopter) && !helicopter.shuttingdown) {
        if (isdefined(helicopter.var_e60e2941)) {
            foreach (swat_gunner in helicopter.var_e60e2941) {
                if (isdefined(swat_gunner) && isalive(swat_gunner) && !(isdefined(swat_gunner.ignoreall) && swat_gunner.ignoreall)) {
                    var_131240dd = 1;
                    break;
                }
            }
        }
        helicopter.owner thread globallogic_audio::function_fd32b1bd("overwatch_helicopter_snipers");
        if (isdefined(var_131240dd) && var_131240dd) {
            helicopter killstreaks::play_pilot_dialog_on_owner("weaponDestroyed", "overwatch_helicopter", helicopter.killstreak_id);
        } else {
            helicopter killstreaks::play_pilot_dialog_on_owner("destroyed", "overwatch_helicopter", helicopter.killstreak_id);
            function_f6442ecd(helicopter, helicopter.owner, 0);
        }
    }
    if (isdefined(swat)) {
        swat unlink();
        swat startragdoll();
    }
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 3, eflags: 0x5 linked
// Checksum 0x8367b900, Offset: 0x3ac0
// Size: 0xc4
function private function_67260255(swat, helicopter, killstreak_id) {
    swat endon(#"death");
    helicopter endon(#"death");
    helicopter waittill(#"hash_3904c1a9ebdc27de");
    swat unlink();
    swat startragdoll();
    swat kill(swat.origin, undefined, undefined, undefined, 0, 1);
}

// Namespace overwatch_helicopter/overwatch_helicopter
// Params 1, eflags: 0x5 linked
// Checksum 0xf619e8a7, Offset: 0x3b90
// Size: 0xae
function private swat_cleanup(helicopter) {
    if (isdefined(helicopter.var_e60e2941)) {
        for (i = helicopter.var_e60e2941.size; i >= 0; i--) {
            if (isdefined(helicopter.var_e60e2941[i]) && isalive(helicopter.var_e60e2941[i])) {
                helicopter.var_e60e2941[i] delete();
            }
        }
    }
}

