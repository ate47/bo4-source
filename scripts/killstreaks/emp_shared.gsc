// Atian COD Tools GSC decompiler test
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\emp_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace emp;

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x8165f644, Offset: 0x170
// Size: 0x1f4
function init_shared() {
    if (!isdefined(level.emp_shared)) {
        level.emp_shared = {};
        level.emp_shared.activeplayeremps = [];
        level.emp_shared.activeemps = [];
        foreach (team, _ in level.teams) {
            level.emp_shared.activeemps[team] = 0;
        }
        level.emp_shared.enemyempactivefunc = &enemyempactive;
        level thread emptracker();
        clientfield::register("scriptmover", "emp_turret_init", 1, 1, "int");
        clientfield::register("vehicle", "emp_turret_deploy", 1, 1, "int");
        callback::on_spawned(&onplayerspawned);
        callback::on_connect(&onplayerconnect);
        vehicle::add_main_callback("emp_turret", &initturretvehicle);
        callback::add_callback(#"hash_425352b435722271", &fx_flesh_hit_neck_fatal);
    }
}

// Namespace emp/emp_shared
// Params 1, eflags: 0x0
// Checksum 0x35077f94, Offset: 0x370
// Size: 0x118
function fx_flesh_hit_neck_fatal(params) {
    foreach (player in params.players) {
        if (player hasactiveemp()) {
            scoregiven = scoreevents::processscoreevent(#"emp_assist", player, undefined, undefined);
            if (isdefined(scoregiven)) {
                player challenges::earnedempassistscore(scoregiven);
                killstreakindex = level.killstreakindices[#"emp"];
                killstreaks::killstreak_assist(player, self, killstreakindex);
            }
        }
    }
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x8895cee9, Offset: 0x490
// Size: 0xe8
function initturretvehicle() {
    turretvehicle = self;
    turretvehicle killstreaks::setup_health("emp");
    turretvehicle.damagetaken = 0;
    turretvehicle.health = turretvehicle.maxhealth;
    turretvehicle clientfield::set("enemyvehicle", 1);
    turretvehicle.soundmod = "drone_land";
    turretvehicle.overridevehiclekilled = &onturretdeath;
    target_set(turretvehicle, vectorscale((0, 0, 1), 36));
    if (isdefined(level.var_389a99a4)) {
        turretvehicle [[ level.var_389a99a4 ]]();
    }
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x602e8074, Offset: 0x580
// Size: 0x2c
function onplayerspawned() {
    self endon(#"disconnect");
    self updateemp();
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x5760e475, Offset: 0x5b8
// Size: 0x3e
function onplayerconnect() {
    self.entnum = self getentitynumber();
    level.emp_shared.activeplayeremps[self.entnum] = 0;
}

// Namespace emp/emp_shared
// Params 1, eflags: 0x0
// Checksum 0x68b1623a, Offset: 0x600
// Size: 0x1e4
function deployempturret(emp) {
    player = self;
    player endon(#"disconnect", #"joined_team", #"joined_spectators");
    emp endon(#"death");
    emp.vehicle useanimtree("generic");
    emp.vehicle setanim(#"o_turret_emp_core_deploy", 1);
    length = getanimlength(#"o_turret_emp_core_deploy");
    emp.vehicle clientfield::set("emp_turret_deploy", 1);
    wait(length * 0.75);
    emp.vehicle thread playempfx();
    emp.vehicle playsound(#"mpl_emp_turret_activate");
    emp.vehicle setanim(#"o_turret_emp_core_spin", 1);
    player thread emp_jamenemies(emp, 0);
    wait(length * 0.25);
    emp.vehicle clearanim(#"o_turret_emp_core_deploy", 0);
}

// Namespace emp/emp_shared
// Params 1, eflags: 0x0
// Checksum 0xb0ddb460, Offset: 0x7f0
// Size: 0x4c
function doneempfx(fxtagorigin) {
    playfx(#"killstreaks/fx_emp_exp_death", fxtagorigin);
    playsoundatposition(#"mpl_emp_turret_deactivate", fxtagorigin);
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x43c11e68, Offset: 0x848
// Size: 0x3a
function playempfx() {
    emp_vehicle = self;
    emp_vehicle playloopsound(#"mpl_emp_turret_loop_close");
    waitframe(1);
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x99380e11, Offset: 0x890
// Size: 0x84
function on_timeout() {
    emp = self;
    if (isdefined(emp.vehicle)) {
        fxtagorigin = emp.vehicle gettagorigin("tag_fx");
        doneempfx(fxtagorigin);
    }
    shutdownemp(emp);
}

// Namespace emp/emp_shared
// Params 1, eflags: 0x0
// Checksum 0x5f303090, Offset: 0x920
// Size: 0x4c
function oncancelplacement(emp) {
    stopemp(emp.team, emp.ownerentnum, emp.originalteam, emp.killstreakid);
}

// Namespace emp/emp_shared
// Params 8, eflags: 0x0
// Checksum 0xfc1f2145, Offset: 0x978
// Size: 0x5c
function onturretdeath(inflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime) {
    self ondeath(attacker, weapon);
}

// Namespace emp/emp_shared
// Params 2, eflags: 0x0
// Checksum 0x8e3fc7a4, Offset: 0x9e0
// Size: 0x3c
function ondeathafterframeend(attacker, weapon) {
    waittillframeend();
    if (isdefined(self)) {
        self ondeath(attacker, weapon);
    }
}

// Namespace emp/emp_shared
// Params 2, eflags: 0x0
// Checksum 0xbf8404dd, Offset: 0xa28
// Size: 0x9c
function ondeath(attacker, weapon) {
    emp_vehicle = self;
    fxtagorigin = self gettagorigin("tag_fx");
    doneempfx(fxtagorigin);
    if (isdefined(level.var_b1ffcff8)) {
        self [[ level.var_b1ffcff8 ]](attacker, weapon);
    }
    shutdownemp(emp_vehicle.parentstruct);
}

// Namespace emp/emp_shared
// Params 1, eflags: 0x0
// Checksum 0xdfdc0910, Offset: 0xad0
// Size: 0x24
function onshutdown(emp) {
    shutdownemp(emp);
}

// Namespace emp/emp_shared
// Params 1, eflags: 0x0
// Checksum 0x40fe52b9, Offset: 0xb00
// Size: 0x11c
function shutdownemp(emp) {
    if (!isdefined(emp)) {
        return;
    }
    if (isdefined(emp.already_shutdown)) {
        return;
    }
    emp.already_shutdown = 1;
    if (isdefined(emp.vehicle)) {
        emp.vehicle clientfield::set("emp_turret_deploy", 0);
    }
    stopemp(emp.team, emp.ownerentnum, emp.originalteam, emp.killstreakid);
    if (isdefined(emp.othermodel)) {
        emp.othermodel delete();
    }
    if (isdefined(emp.vehicle)) {
        emp.vehicle delete();
    }
    emp delete();
}

// Namespace emp/emp_shared
// Params 4, eflags: 0x0
// Checksum 0x80cfadb4, Offset: 0xc28
// Size: 0x54
function stopemp(currentteam, currentownerentnum, originalteam, killstreakid) {
    stopempeffect(currentteam, currentownerentnum);
    stopemprule(originalteam, killstreakid);
}

// Namespace emp/emp_shared
// Params 2, eflags: 0x0
// Checksum 0x2e2a293c, Offset: 0xc88
// Size: 0x60
function stopempeffect(team, ownerentnum) {
    level.emp_shared.activeemps[team] = 0;
    level.emp_shared.activeplayeremps[ownerentnum] = 0;
    level notify(#"emp_updated");
}

// Namespace emp/emp_shared
// Params 2, eflags: 0x0
// Checksum 0xa8a0ac76, Offset: 0xcf0
// Size: 0x34
function stopemprule(killstreakoriginalteam, killstreakid) {
    killstreakrules::killstreakstop("emp", killstreakoriginalteam, killstreakid);
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x3114ff4f, Offset: 0xd30
// Size: 0x1c
function hasactiveemp() {
    return level.emp_shared.activeplayeremps[self.entnum];
}

// Namespace emp/emp_shared
// Params 1, eflags: 0x0
// Checksum 0xc6d7eda4, Offset: 0xd58
// Size: 0x28
function teamhasactiveemp(team) {
    return level.emp_shared.activeemps[team] > 0;
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x59e14cae, Offset: 0xd88
// Size: 0x190
function getenemies() {
    enemies = [];
    combatants = level.players;
    if (sessionmodeiscampaigngame()) {
        combatants = arraycombine(combatants, getactorarray(), 0, 0);
    }
    foreach (combatant in combatants) {
        if (combatant.team === #"spectator") {
            continue;
        }
        if (level.teambased && util::function_fbce7263(combatant.team, self.team) || !level.teambased && combatant != self) {
            if (!isdefined(enemies)) {
                enemies = [];
            } else if (!isarray(enemies)) {
                enemies = array(enemies);
            }
            enemies[enemies.size] = combatant;
        }
    }
    return enemies;
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x2c4ef1c8, Offset: 0xf20
// Size: 0x10
function function_d12cde1c() {
    return isdefined(level.emp_shared);
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0xd6e3d472, Offset: 0xf38
// Size: 0x16a
function enemyempactive() {
    if (!function_d12cde1c()) {
        return false;
    }
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            if (util::function_fbce7263(team, self.team) && teamhasactiveemp(team)) {
                return true;
            }
        }
    } else {
        enemies = self getenemies();
        foreach (player in enemies) {
            if (player hasactiveemp()) {
                return true;
            }
        }
    }
    return false;
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0xaf80b9b1, Offset: 0x10b0
// Size: 0xa2
function enemyempowner() {
    enemies = self getenemies();
    foreach (player in enemies) {
        if (player hasactiveemp()) {
            return player;
        }
    }
    return undefined;
}

// Namespace emp/emp_shared
// Params 2, eflags: 0x0
// Checksum 0x50216cc6, Offset: 0x1160
// Size: 0x244
function emp_jamenemies(empent, hacked) {
    level endon(#"game_ended");
    self endon(#"killstreak_hacked");
    if (level.teambased) {
        if (hacked) {
            level.emp_shared.activeemps[empent.originalteam] = 0;
        }
        level.emp_shared.activeemps[self.team] = 1;
    }
    if (hacked) {
        level.emp_shared.activeplayeremps[empent.originalownerentnum] = 0;
    }
    level.emp_shared.activeplayeremps[self.entnum] = 1;
    level notify(#"emp_updated");
    level notify(#"emp_deployed");
    visionsetnaked("flash_grenade", 1.5);
    wait(0.1);
    visionsetnaked("flash_grenade", 0);
    visionsetnaked("default", 5);
    radius = isdefined(level.empkillstreakbundle.ksdamageradius) ? level.empkillstreakbundle.ksdamageradius : 750;
    empkillstreakweapon = getweapon(#"emp");
    empkillstreakweapon.isempkillstreak = 1;
    level killstreaks::destroyotherteamsactivevehicles(self, empkillstreakweapon, radius);
    level killstreaks::destroyotherteamsequipment(self, empkillstreakweapon, radius);
    level weaponobjects::destroy_other_teams_supplemental_watcher_objects(self, empkillstreakweapon, radius);
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0xc370014d, Offset: 0x13b0
// Size: 0xbc
function emptracker() {
    level endon(#"game_ended");
    while (true) {
        level waittill(#"emp_updated");
        foreach (player in level.players) {
            player updateemp();
        }
    }
}

// Namespace emp/emp_shared
// Params 0, eflags: 0x0
// Checksum 0x85553954, Offset: 0x1478
// Size: 0xa0
function updateemp() {
    player = self;
    enemy_emp_active = player enemyempactive();
    player setempjammed(enemy_emp_active);
    emped = player isempjammed();
    player clientfield::set_to_player("empd_monitor_distance", emped);
    if (emped) {
        player notify(#"emp_jammed");
    }
}

