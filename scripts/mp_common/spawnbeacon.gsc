#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\spawnbeacon_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace spawn_beacon;

// Namespace spawn_beacon/spawnbeacon
// Params 0, eflags: 0x2
// Checksum 0x72a44298, Offset: 0x1b8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"spawn_beacon", &__init__, undefined, #"killstreaks");
}

// Namespace spawn_beacon/spawnbeacon
// Params 0, eflags: 0x1 linked
// Checksum 0xcebb3ff2, Offset: 0x208
// Size: 0x214
function __init__() {
    init_shared();
    level.var_9fa5aeb4 = &function_b42580a6;
    level.var_34c482f2 = &function_fa81d248;
    level.var_4b1d905b = &function_4ddddf03;
    level.var_ae2fe442 = &function_b74804ba;
    level.var_a1ca927c = &function_1f5ed165;
    globallogic_score::register_kill_callback(level.spawnbeaconsettings.beaconweapon, &function_ece8f018);
    globallogic_score::function_86f90713(level.spawnbeaconsettings.beaconweapon, &function_ece8f018);
    globallogic_score::function_82fb1afa(level.spawnbeaconsettings.beaconweapon, &function_5bfd1343);
    globallogic_score::function_2b2c09db(level.spawnbeaconsettings.beaconweapon, &function_3e8ff788);
    globallogic_score::function_b150f9ac(level.spawnbeaconsettings.beaconweapon, &function_cdeb9089);
    deployable::register_deployable(getweapon(#"hash_7ab3f9a730359659"), &function_9aafb7bb, undefined);
    weaponobjects::function_e6400478(#"hash_7ab3f9a730359659", &function_d80ff6a7, 1);
    function_50e42513();
    function_bf3aeb8b();
}

// Namespace spawn_beacon/spawnbeacon
// Params 5, eflags: 0x1 linked
// Checksum 0x62d4df2b, Offset: 0x428
// Size: 0x9c
function function_ece8f018(attacker, victim, weapon, attackerweapon, meansofdeath) {
    if (!isdefined(attacker) || !isdefined(attacker.var_7c18e526) || !isdefined(attacker.var_1a6703cc) || attacker.var_1a6703cc + 5000 < gettime()) {
        return false;
    }
    if (attacker == attacker.var_7c18e526) {
        return true;
    }
    return false;
}

// Namespace spawn_beacon/spawnbeacon
// Params 6, eflags: 0x1 linked
// Checksum 0x55a5e3fd, Offset: 0x4d0
// Size: 0xe4
function function_3e8ff788(attacker, victim, var_f5db414c, killtime, weapon, spawnbeaconweapon) {
    if (!isdefined(attacker) || !isdefined(spawnbeaconweapon) || !isdefined(killtime) || !isdefined(attacker.var_7c18e526)) {
        return;
    }
    if (attacker != attacker.var_7c18e526 && (isdefined(attacker.var_1a6703cc) ? attacker.var_1a6703cc : 0) + 5000 > killtime) {
        scoreevents::processscoreevent(#"hash_62131f4647f7c61a", attacker.var_7c18e526, undefined, spawnbeaconweapon);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 4, eflags: 0x1 linked
// Checksum 0x1a1460c5, Offset: 0x5c0
// Size: 0xcc
function function_cdeb9089(attacker, victim, spawnbeaconweapon, var_fb972b2b) {
    if (!isdefined(attacker) || !isdefined(spawnbeaconweapon) || !isdefined(attacker.var_7c18e526)) {
        return;
    }
    if (attacker != attacker.var_7c18e526 && (isdefined(attacker.var_1a6703cc) ? attacker.var_1a6703cc : 0) + 5000 > gettime()) {
        scoreevents::processscoreevent(#"hash_17705bbdbf8cf23a", attacker.var_7c18e526, undefined, spawnbeaconweapon);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 5, eflags: 0x1 linked
// Checksum 0x5504ec48, Offset: 0x698
// Size: 0xdc
function function_5bfd1343(attacker, var_f231d134, killtime, capturedobjective, spawnbeaconweapon) {
    if (!isdefined(attacker) || !isdefined(spawnbeaconweapon) || !isdefined(killtime) || !isdefined(attacker.var_7c18e526)) {
        return;
    }
    if (attacker != attacker.var_7c18e526 && (isdefined(attacker.var_1a6703cc) ? attacker.var_1a6703cc : 0) + 5000 > killtime) {
        scoreevents::processscoreevent(#"hash_5ce122c3419f6a58", attacker.var_7c18e526, undefined, spawnbeaconweapon);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 0, eflags: 0x1 linked
// Checksum 0x1ec84204, Offset: 0x780
// Size: 0xc4
function function_1f5ed165() {
    if ((isdefined(level.spawnbeaconsettings.settingsbundle.var_b4403828) ? level.spawnbeaconsettings.settingsbundle.var_b4403828 : 0) && isdefined(self.var_d7cf6658) && isarray(self.var_d7cf6658) && isdefined(self.var_d7cf6658[#"friendly"].trigger)) {
        self.var_d7cf6658[#"friendly"].trigger triggerenable(0);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x0
// Checksum 0x3437c893, Offset: 0x850
// Size: 0x34
function function_18f38647(zone) {
    array::add(level.spawnbeaconsettings.var_d6a27a84, zone);
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x0
// Checksum 0xe517a307, Offset: 0x890
// Size: 0x34
function function_60a53911(zone) {
    arrayremovevalue(level.spawnbeaconsettings.var_d6a27a84, zone);
}

// Namespace spawn_beacon/spawnbeacon
// Params 0, eflags: 0x5 linked
// Checksum 0xfbf29bcb, Offset: 0x8d0
// Size: 0xce
function private function_bf3aeb8b() {
    for (spawnlistidx = 0; spawnlistidx < (isdefined(level.spawnbeaconsettings.settingsbundle.var_369f0da) ? level.spawnbeaconsettings.settingsbundle.var_369f0da : 0); spawnlistidx++) {
        array::add(level.spawnbeaconsettings.availablespawnlists, (isdefined(level.spawnbeaconsettings.settingsbundle.var_7609eee) ? level.spawnbeaconsettings.settingsbundle.var_7609eee : "") + spawnlistidx);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 0, eflags: 0x5 linked
// Checksum 0x1ad6c80d, Offset: 0x9a8
// Size: 0x204
function private function_50e42513() {
    level.spawnbeaconsettings.var_613ff100 = [];
    var_bd01a896 = spawnstruct();
    var_862cf298 = isdefined(level.spawnbeaconsettings.settingsbundle.var_6a0e1c10) ? level.spawnbeaconsettings.settingsbundle.var_6a0e1c10 : 0;
    var_bd01a896.zonemax = var_862cf298 * var_862cf298;
    var_bd01a896.points = isdefined(level.spawnbeaconsettings.settingsbundle.var_65a598a7) ? level.spawnbeaconsettings.settingsbundle.var_65a598a7 : 0;
    var_bd01a896.zonemin = 0;
    array::add(level.spawnbeaconsettings.var_613ff100, var_bd01a896);
    var_5c0ba1f = spawnstruct();
    var_862cf298 = isdefined(level.spawnbeaconsettings.settingsbundle.var_95f0a921) ? level.spawnbeaconsettings.settingsbundle.var_95f0a921 : 0;
    var_5c0ba1f.zonemax = var_862cf298 * var_862cf298;
    var_5c0ba1f.points = isdefined(level.spawnbeaconsettings.settingsbundle.var_dcbe0fcc) ? level.spawnbeaconsettings.settingsbundle.var_dcbe0fcc : 0;
    var_5c0ba1f.zonemin = var_bd01a896.zonemax;
    array::add(level.spawnbeaconsettings.var_613ff100, var_5c0ba1f);
}

// Namespace spawn_beacon/spawnbeacon
// Params 0, eflags: 0x1 linked
// Checksum 0x5eb0a8cf, Offset: 0xbb8
// Size: 0x86
function function_b42580a6() {
    player = self;
    spawnbeacon = player userspawnselection::function_b9573d36();
    if (isdefined(spawnbeacon)) {
        player thread function_abb55703(spawnbeacon, isdefined(player.var_4ef33446) && player.var_4ef33446 || isdefined(self.suicide) && self.suicide);
    }
    return false;
}

// Namespace spawn_beacon/spawnbeacon
// Params 2, eflags: 0x1 linked
// Checksum 0x57a5ba10, Offset: 0xc48
// Size: 0x51c
function function_abb55703(spawnbeacon, var_d8f817bc) {
    if (!isdefined(spawnbeacon)) {
        return;
    }
    player = self;
    spawnbeacon.spawncount++;
    if (level.gametype === "dm" || level.gametype === "dm_hc") {
        spawnbeacon.health -= isdefined(level.spawnbeaconsettings.settingsbundle.var_ebe18d92) ? level.spawnbeaconsettings.settingsbundle.var_ebe18d92 : 0;
    } else {
        spawnbeacon.health -= isdefined(level.spawnbeaconsettings.settingsbundle.var_f9dea783) ? level.spawnbeaconsettings.settingsbundle.var_f9dea783 : 0;
    }
    if (isdefined(spawnbeacon.owner) && player != spawnbeacon.owner) {
        spawnbeacon.owner luinotifyevent(#"spawn_beacon_used");
    }
    if (isdefined(spawnbeacon.owner) && isdefined(self) && !var_d8f817bc) {
        if (spawnbeacon.owner == player) {
            player thread scoreevents::function_c046c773(0.5, "spawn_beacon_insertion", spawnbeacon.owner, player, level.spawnbeaconsettings.beaconweapon);
        } else {
            scoreevents::processscoreevent(#"spawn_beacon_insertion", spawnbeacon.owner, player, level.spawnbeaconsettings.beaconweapon);
        }
        player.var_1a6703cc = gettime();
        player.var_7c18e526 = spawnbeacon.owner;
        var_f8e6b703 = player match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
        if (isdefined(var_f8e6b703)) {
            player match_record::set_stat(#"lives", var_f8e6b703, #"hash_674598aa9fe3d19a", 1);
        }
    }
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_7d58193e) && isdefined(spawnbeacon)) {
        var_7f9f4251 = isdefined(level.spawnbeaconsettings.settingsbundle.var_231a393d) ? level.spawnbeaconsettings.settingsbundle.var_231a393d : 0 ? undefined : player;
        if (!isdefined(var_7f9f4251)) {
            var_7f9f4251 = undefined;
        }
        spawnbeacon playsoundtoteam(level.spawnbeaconsettings.settingsbundle.var_7d58193e, player getteam(), var_7f9f4251);
    }
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_ccf4ec0b)) {
        spawnbeacon playsoundtoteam(level.spawnbeaconsettings.settingsbundle.var_ccf4ec0b, util::getotherteam(player getteam()));
    }
    if (spawnbeacon.threatlevel >= (isdefined(level.spawnbeaconsettings.settingsbundle.var_ba2632d3) ? level.spawnbeaconsettings.settingsbundle.var_ba2632d3 : 0)) {
        player globallogic_audio::play_taacom_dialog("spawnBeaconSpawnDanger");
    } else {
        player globallogic_audio::play_taacom_dialog("spawnBeaconSpawn");
    }
    if (spawnbeacon.health <= 0) {
        spawnbeacon function_a9ff3efb(0);
    }
    if ((isdefined(level.spawnbeaconsettings.var_3c919ca8) ? level.spawnbeaconsettings.var_3c919ca8 : 0) && isdefined(spawnbeacon)) {
        spawnbeacon.var_4fc7245b = 1;
        spawnbeacon thread function_a9ff3efb(0);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 2, eflags: 0x1 linked
// Checksum 0xb644a41b, Offset: 0x1170
// Size: 0x194
function function_fa81d248(attacker, weapon) {
    spawnbeacon = self;
    if (isdefined(spawnbeacon.var_a08c7e4)) {
        self influencers::remove_influencer(spawnbeacon.var_a08c7e4);
        self.spawn_influencer_enemy_carrier = undefined;
    }
    if (isdefined(spawnbeacon.var_16b8f97a)) {
        foreach (influencer in spawnbeacon.var_16b8f97a) {
            self influencers::remove_influencer(influencer);
        }
    }
    if (isdefined(level.figure_out_attacker)) {
        attacker = self [[ level.figure_out_attacker ]](attacker);
    }
    if (isdefined(attacker) && isplayer(attacker) && spawnbeacon.owner !== attacker && isdefined(weapon)) {
        attacker stats::function_e24eec31(weapon, #"hash_1c9da51ed1906285", 1);
    }
    userspawnselection::removespawnbeacon(self.objectiveid);
}

// Namespace spawn_beacon/spawnbeacon
// Params 5, eflags: 0x1 linked
// Checksum 0x987c5e1, Offset: 0x1310
// Size: 0x352
function function_b74804ba(origin, angles, player, var_c7a191d5, var_813ea9e) {
    player.var_9bab32d9.spawns = getspawnbeaconspawns(origin);
    if (player.var_9bab32d9.spawns.size == 0) {
        player sethintstring(level.spawnbeaconsettings.settingsbundle.var_bf6a0873);
        return false;
    }
    foreach (protectedzone in level.spawnbeaconsettings.var_d6a27a84) {
        if (protectedzone istouching(origin, (16, 16, 70))) {
            return false;
        }
    }
    var_a25671b9 = isdefined(level.spawnbeaconsettings.settingsbundle.var_77498194) ? level.spawnbeaconsettings.settingsbundle.var_77498194 : 0;
    testdistance = var_a25671b9 * var_a25671b9;
    var_775fe08e = getarraykeys(level.spawnbeaconsettings.userspawnbeacons);
    foreach (var_2e194e82 in var_775fe08e) {
        if (var_2e194e82 == player.clientid) {
            continue;
        }
        var_4d511d74 = level.spawnbeaconsettings.userspawnbeacons[var_2e194e82];
        for (i = 0; i < var_4d511d74.size; i++) {
            if (!isdefined(var_4d511d74[i])) {
                level.spawnbeaconsettings.userspawnbeacons[var_2e194e82] = array::remove_index(var_4d511d74, i, 0);
                continue;
            }
            distsqr = distancesquared(origin, var_4d511d74[i].origin);
            if (distsqr <= testdistance) {
                player sethintstring(level.spawnbeaconsettings.settingsbundle.var_c2aa4ca6);
                return false;
            }
        }
    }
    return true;
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x5 linked
// Checksum 0x1d5755bf, Offset: 0x1670
// Size: 0x3da
function private function_4ddddf03(placedspawnbeacon) {
    player = self;
    placedspawnbeacon util::make_sentient();
    userspawnselection::registeravailablespawnbeacon(placedspawnbeacon.objectiveid, placedspawnbeacon);
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_6ee7f72) ? level.spawnbeaconsettings.settingsbundle.var_6ee7f72 : 0) {
        function_6c529d0b(placedspawnbeacon, level.spawnbeaconsettings.settingsbundle.var_ac0a9508, player getteam(), #"enemy", #"hash_10169ccdcca54ccf", &function_741d9675, &function_70ca26fc, &function_d77d0cbb);
        placedspawnbeacon.var_d7cf6658[#"enemy"] gameobjects::set_use_time(isdefined(level.spawnbeaconsettings.settingsbundle.var_115b956b) ? level.spawnbeaconsettings.settingsbundle.var_115b956b : 0);
    }
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_b4403828) ? level.spawnbeaconsettings.settingsbundle.var_b4403828 : 0) {
        function_6c529d0b(placedspawnbeacon, level.spawnbeaconsettings.settingsbundle.var_69fd6325, player getteam(), #"friendly", #"hash_f91a28adadc5409", &function_e67b6bd, &function_4f5f518a, &function_d77d0cbb);
        player clientclaimtrigger(placedspawnbeacon.var_d7cf6658[#"friendly"].trigger);
        placedspawnbeacon.var_d7cf6658[#"friendly"] gameobjects::set_use_time(isdefined(level.spawnbeaconsettings.settingsbundle.pickuptime) ? level.spawnbeaconsettings.settingsbundle.pickuptime : 0);
    }
    placedspawnbeacon.var_a08c7e4 = placedspawnbeacon influencers::create_influencer("activeSpawnBeacon", placedspawnbeacon.origin, util::getteammask(player getteam()));
    if (isdefined(placedspawnbeacon.var_a08c7e4) && placedspawnbeacon.var_a08c7e4 != -1 && isdefined(placedspawnbeacon.spawnlist)) {
        function_8b51d4df(placedspawnbeacon.var_a08c7e4, placedspawnbeacon.spawnlist);
        placedspawnbeacon.var_4dd7c5c5 = placedspawnbeacon.spawns;
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 2, eflags: 0x4
// Checksum 0x2006dfae, Offset: 0x1a58
// Size: 0xfc
function private function_94dcc72e(&spawnlist, spawnbeacon) {
    var_df1363e1 = [];
    for (index = 0; index < spawnlist.size; index++) {
        if (!sighttracepassed(spawnlist[index].origin + (0, 0, 72), spawnbeacon.origin + (0, 0, 70), 0, spawnbeacon)) {
            array::add(var_df1363e1, index);
        }
    }
    for (index = var_df1363e1.size - 1; index >= 0; index--) {
        spawnlist = array::remove_index(spawnlist, var_df1363e1[index]);
    }
    return spawnlist;
}

// Namespace spawn_beacon/spawnbeacon
// Params 8, eflags: 0x1 linked
// Checksum 0x319a310a, Offset: 0x1b60
// Size: 0x302
function function_6c529d0b(beacon, objective, team, var_d1653c48, hinttext, onusefunc, var_24c69a69, var_6a89b347) {
    upangle = vectorscale(vectornormalize(anglestoup(beacon.angles)), 5);
    var_40989bda = beacon.origin + upangle;
    usetrigger = spawn("trigger_radius_use", var_40989bda, 0, isdefined(level.spawnbeaconsettings.settingsbundle.var_ec05f9d4) ? level.spawnbeaconsettings.settingsbundle.var_ec05f9d4 : 0, isdefined(level.spawnbeaconsettings.settingsbundle.var_53e44ebc) ? level.spawnbeaconsettings.settingsbundle.var_53e44ebc : 0);
    usetrigger triggerignoreteam();
    usetrigger setvisibletoall();
    usetrigger setteamfortrigger(#"none");
    usetrigger setcursorhint("HINT_INTERACTIVE_PROMPT");
    if (!isdefined(beacon.var_d7cf6658)) {
        beacon.var_d7cf6658 = [];
    }
    beacon.var_d7cf6658[var_d1653c48] = gameobjects::create_use_object(team, usetrigger, [], undefined, objective, 1);
    beacon.var_d7cf6658[var_d1653c48] gameobjects::set_use_hint_text(hinttext);
    beacon.var_d7cf6658[var_d1653c48] gameobjects::set_visible_team(var_d1653c48);
    beacon.var_d7cf6658[var_d1653c48] gameobjects::allow_use(var_d1653c48);
    beacon.var_d7cf6658[var_d1653c48].onuse = onusefunc;
    beacon.var_d7cf6658[var_d1653c48].onbeginuse = var_24c69a69;
    beacon.var_d7cf6658[var_d1653c48].onenduse = var_6a89b347;
    beacon.var_d7cf6658[var_d1653c48].var_5ecd70 = beacon;
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x5 linked
// Checksum 0x428439ae, Offset: 0x1e70
// Size: 0x422
function private function_e67b6bd(player) {
    spawnbeacon = self.var_5ecd70;
    spawnbeacon.alivetime = (isdefined(spawnbeacon.alivetime) ? spawnbeacon.alivetime : 0) + float(gettime() - (isdefined(spawnbeacon.var_1df612a0) ? spawnbeacon.var_1df612a0 : spawnbeacon.birthtime)) / 1000;
    remainingtime = (isdefined(level.spawnbeaconsettings.settingsbundle.timeout) ? level.spawnbeaconsettings.settingsbundle.timeout : 0) - spawnbeacon.alivetime;
    if (remainingtime <= (isdefined(level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4) ? level.spawnbeaconsettings.settingsbundle.var_a0ffd0e4 : 0)) {
        return;
    }
    freespawnbeaconspawnlist(spawnbeacon.spawnlist);
    spawnbeacon notify(#"end_timer");
    spawnbeacon.remainingtime = remainingtime;
    spawnbeacon clientfield::set("enemyequip", 0);
    spawnbeacon.isdisabled = 1;
    spawnbeacon setinvisibletoall();
    spawnbeacon.origin = (6000, 6000, 6000);
    if (isdefined(spawnbeacon.var_d7cf6658)) {
        foreach (gameobject in spawnbeacon.var_d7cf6658) {
            gameobject.trigger triggerenable(0);
            gameobject.trigger.origin = spawnbeacon.origin;
        }
    }
    level.spawnbeaconsettings.beacons[spawnbeacon.objectiveid] = undefined;
    userspawnselection::removespawnbeacon(spawnbeacon.objectiveid);
    objective_delete(spawnbeacon.objectiveid);
    heldweapon = getweapon(#"hash_7ab3f9a730359659");
    spawnbeacon.owner giveweapon(heldweapon);
    spawnbeacon.owner switchtoweapon(heldweapon, 1);
    spawnbeacon.owner disableweaponcycling();
    spawnbeacon.owner disableoffhandweapons();
    spawnbeacon.owner setblockweaponpickup(heldweapon, 1);
    spawnbeacon.owner disableoffhandspecial();
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_34127883)) {
        player playsound(level.spawnbeaconsettings.settingsbundle.var_34127883);
    }
    spawnbeacon.owner.var_c4a4cb7d = self;
    spawnbeacon.var_ca3a0f16 = 1;
}

// Namespace spawn_beacon/spawnbeacon
// Params 2, eflags: 0x1 linked
// Checksum 0xb993c09c, Offset: 0x22a0
// Size: 0x5ac
function function_f989dc0a(watcher, owner) {
    if (!isdefined(owner) || !isdefined(owner.var_c4a4cb7d)) {
        return;
    }
    spawnbeacon = owner.var_c4a4cb7d.var_5ecd70;
    spawnbeacon endon(#"death");
    spawnbeacon thread weaponobjects::onspawnuseweaponobject(watcher, owner);
    spawnbeacon.var_ca3a0f16 = 0;
    if (!(isdefined(owner.var_c4a4cb7d.previouslyhacked) && owner.var_c4a4cb7d.previouslyhacked)) {
        if (isdefined(owner)) {
            owner stats::function_e24eec31(spawnbeacon.weapon, #"used", 1);
        }
        spawnbeacon.var_1df612a0 = gettime();
        waitresult = spawnbeacon waittilltimeout(0.05, #"stationary");
        spawnbeacon deployable::function_dd266e08(owner);
        spawnbeacon.isdisabled = 0;
        spawnbeacon notify(#"beacon_enabled");
        userspawnselection::registeravailablespawnbeacon(spawnbeacon.objectiveid, spawnbeacon);
        spawnbeacon.var_9bab32d9 = owner.var_9bab32d9;
        owner.var_9bab32d9 = undefined;
        if (isdefined(spawnbeacon.var_9bab32d9) && isdefined(spawnbeacon.var_9bab32d9.spawns)) {
            createspawngroupforspawnbeacon(spawnbeacon, spawnbeacon.var_9bab32d9.spawns);
        }
        owner takeweapon(getweapon(#"hash_7ab3f9a730359659"));
        owner enableweaponcycling();
        owner enableoffhandweapons();
        owner enableoffhandspecial();
        spawnbeacon setvisibletoall();
        if (isdefined(spawnbeacon.othermodel)) {
            spawnbeacon.othermodel setinvisibletoall();
        }
        objective_add(spawnbeacon.objectiveid, "active", spawnbeacon.origin, level.spawnbeaconsettings.settingsbundle.mainobjective);
        objective_setteam(spawnbeacon.objectiveid, spawnbeacon.team);
        function_3ae6fa3(spawnbeacon.objectiveid, owner getteam(), 1);
        objective_setprogress(spawnbeacon.objectiveid, 1);
        level.spawnbeaconsettings.beacons[spawnbeacon.objectiveid] = spawnbeacon;
        if (spawnbeacon.var_a08c7e4 != -1 && isdefined(spawnbeacon.var_a08c7e4) && isdefined(spawnbeacon.spawnlist)) {
            function_8b51d4df(spawnbeacon.var_a08c7e4, spawnbeacon.spawnlist);
        }
        owner clientfield::set_player_uimodel("hudItems.spawnbeacon.active", 1);
        spawnbeacon clientfield::set("enemyequip", 1);
        owner.var_9698a18d = 1;
        owner.var_583f6cce = spawnbeacon;
        spawnbeacon setanim(#"o_spawn_beacon_deploy", 1);
        upangle = vectorscale(vectornormalize(anglestoup(spawnbeacon.angles)), 5);
        if (isdefined(spawnbeacon.var_d7cf6658)) {
            foreach (gameobject in spawnbeacon.var_d7cf6658) {
                gameobject.trigger triggerenable(1);
                gameobject.trigger.origin = spawnbeacon.origin + upangle;
            }
        }
        spawnbeacon function_f8930fa1(spawnbeacon.remainingtime);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x1 linked
// Checksum 0x8cc3d7c9, Offset: 0x2858
// Size: 0x5a
function function_d80ff6a7(watcher) {
    watcher.watchforfire = 1;
    watcher.onspawn = &function_f989dc0a;
    watcher.ontimeout = &function_13ac856e;
    watcher.deleteonplayerspawn = 0;
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x5 linked
// Checksum 0xba9ccb10, Offset: 0x28c0
// Size: 0x5c
function private function_ebac785e(player) {
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_82360099)) {
        player playloopsound(level.spawnbeaconsettings.settingsbundle.var_82360099);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x5 linked
// Checksum 0xd0480729, Offset: 0x2928
// Size: 0x24
function private function_4f5f518a(player) {
    function_ebac785e(player);
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x5 linked
// Checksum 0xe5bacb18, Offset: 0x2958
// Size: 0xbe
function private function_70ca26fc(player) {
    function_ebac785e(player);
    playerteam = player getteam();
    function_d7cd849c(level.spawnbeaconsettings.settingsbundle.var_2c88033f, util::getotherteam(playerteam), undefined);
    objective_setgamemodeflags(self.var_5ecd70.objectiveid, 4);
    self.var_5ecd70.isdisabled = 1;
}

// Namespace spawn_beacon/spawnbeacon
// Params 1, eflags: 0x5 linked
// Checksum 0xe059c1e1, Offset: 0x2a20
// Size: 0xac
function private function_741d9675(player) {
    spawnbeacon = self.var_5ecd70;
    spawnbeacon.var_b08a3652 = 1;
    spawnbeacon.var_846acfcf = player;
    spawnbeacon thread function_a9ff3efb(1);
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_34127883)) {
        player playsound(level.spawnbeaconsettings.settingsbundle.var_34127883);
    }
}

// Namespace spawn_beacon/spawnbeacon
// Params 3, eflags: 0x5 linked
// Checksum 0x93d162ee, Offset: 0x2ad8
// Size: 0xe4
function private function_d77d0cbb(team, player, result) {
    if (isdefined(level.spawnbeaconsettings.settingsbundle.var_82360099)) {
        player stoploopsound();
    }
    if (self.team == player.team) {
        self.var_5ecd70.owner clientclaimtrigger(self.trigger);
    }
    self.var_5ecd70.isdisabled = 0;
    objective_setgamemodeflags(self.var_5ecd70.objectiveid, 0);
    self.var_5ecd70 notify(#"beacon_enabled");
}

// Namespace spawn_beacon/spawnbeacon
// Params 3, eflags: 0x1 linked
// Checksum 0xbc886de7, Offset: 0x2bc8
// Size: 0x364
function function_9aafb7bb(origin, angles, player) {
    if (!isdefined(player.var_9bab32d9)) {
        player.var_9bab32d9 = spawnstruct();
    }
    player.var_9bab32d9.spawns = getspawnbeaconspawns(origin);
    if (player.var_9bab32d9.spawns.size == 0) {
        player sethintstring(level.spawnbeaconsettings.settingsbundle.var_bf6a0873);
        return false;
    }
    foreach (protectedzone in level.spawnbeaconsettings.var_d6a27a84) {
        if (protectedzone istouching(origin, (16, 16, 70))) {
            return false;
        }
    }
    var_a25671b9 = isdefined(level.spawnbeaconsettings.settingsbundle.var_77498194) ? level.spawnbeaconsettings.settingsbundle.var_77498194 : 0;
    testdistance = var_a25671b9 * var_a25671b9;
    var_775fe08e = getarraykeys(level.spawnbeaconsettings.userspawnbeacons);
    foreach (var_2e194e82 in var_775fe08e) {
        if (var_2e194e82 == player.clientid) {
            continue;
        }
        var_4d511d74 = level.spawnbeaconsettings.userspawnbeacons[var_2e194e82];
        foreach (beacon in var_4d511d74) {
            if (!isdefined(beacon)) {
                continue;
            }
            distsqr = distancesquared(origin, beacon.origin);
            if (distsqr <= testdistance) {
                player sethintstring(level.spawnbeaconsettings.settingsbundle.var_c2aa4ca6);
                return false;
            }
        }
    }
    return true;
}

