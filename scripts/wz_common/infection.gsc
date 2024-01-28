// Atian COD Tools GSC decompiler test
#using scripts\wz_common\wz_loadouts.gsc;
#using scripts\wz_common\wz_ai_zonemgr.gsc;
#using scripts\wz_common\wz_ai_utils.gsc;
#using scripts\wz_common\gametypes\warzone.gsc;
#using scripts\mp_common\gametypes\globallogic_defaults.gsc;
#using scripts\mp_common\item_world.gsc;
#using script_cb32d07c95e5628;
#using scripts\mp_common\item_inventory.gsc;
#using scripts\mp_common\item_drop.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\infection.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace infection;

// Namespace infection/infection
// Params 0, eflags: 0x2
// Checksum 0xda8d89cd, Offset: 0x150
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_infection", &__init__, undefined, #"infection");
}

// Namespace infection/infection
// Params 0, eflags: 0x5 linked
// Checksum 0x5efd29d2, Offset: 0x1a0
// Size: 0x144
function private __init__() {
    if (!function_74650d7()) {
        return;
    }
    globallogic_defaults::function_daa7e9d5();
    level.var_6b2b1231 = getweapon(#"hash_6b525d940c1c1e39");
    clientfield::register("toplayer", "infected", 21000, 1, "int");
    callback::on_player_killed_with_params(&function_2cdab964);
    callback::on_player_killed_with_params(&function_70f6e873);
    callback::on_spawned(&on_player_spawned);
    level thread function_d9ff5189();
    level thread function_16e24b6c();
    /#
        level thread _setup_devgui();
    #/
    /#
        level thread function_cdd9b388();
    #/
}

// Namespace infection/infection
// Params 1, eflags: 0x5 linked
// Checksum 0x32a694e3, Offset: 0x2f0
// Size: 0xb4
function private function_e717b0d(player) {
    if (!isdefined(player) || !isalive(player) || !isdefined(player.inventory)) {
        return;
    }
    hatchet = wz_loadouts::_get_item(#"tomahawk_t8_wz_item_pandemic");
    var_fa3df96 = player item_inventory::function_e66dcff5(hatchet);
    player item_world::function_de2018e3(hatchet, player, var_fa3df96);
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0x8c28712, Offset: 0x3b0
// Size: 0x3dc
function function_d9ff5189() {
    level.var_6990c489 = [];
    zones = array(#"construction_zombie_player_spawn", #"estates_zombie_player_spawn", #"hydro_zombie_player_spawn", #"train_zombie_player_spawn", #"turbine_zombie_player_spawn", #"rivertown_zombie_player_spawn", #"fracking_zombie_player_spawn", #"factory_zombie_player_spawn", #"cargo_zombie_player_spawn", #"array_zombie_player_spawn", #"asylum_zombie_player_spawn", #"nuketown_zombie_player_spawn", #"ghosttown_zombie_player_spawn", #"lighthouse_zombie_player_spawn", #"farm_zombie_player_spawn", #"firing_zombie_player_spawn", #"boxing_zombie_player_spawn", #"diner_zombie_player_spawn", #"clearing_zombie_player_spawn", #"gazebo_zombie_player_spawn");
    foreach (zone in zones) {
        zonespawns = struct::get_array(zone, "targetname");
        if (zonespawns.size > 0) {
            var_f7b61e5e = spawnstruct();
            min = zonespawns[0].origin;
            max = min;
            for (index = 1; index < zonespawns.size; index++) {
                spawn = zonespawns[index].origin;
                max = (max(max[0], spawn[0]), max(max[1], spawn[1]), max(max[2], spawn[2]));
                min = (min(min[0], spawn[0]), min(min[1], spawn[1]), min(min[2], spawn[2]));
            }
            var_f7b61e5e.origin = (min + max) / 2;
            var_f7b61e5e.max = max;
            var_f7b61e5e.min = min;
            var_f7b61e5e.spawn_points = zonespawns;
            level.var_6990c489[level.var_6990c489.size] = var_f7b61e5e;
        }
        waitframe(1);
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0x2fd0a1d1, Offset: 0x798
// Size: 0xfa
function function_f488681f() {
    if (isdefined(self.var_139ab759) && self.var_139ab759 + 0 >= gettime()) {
        return;
    }
    spawn_point = function_89116a1e();
    if (isdefined(spawn_point)) {
        spawn_point_origin = spawn_point.origin;
        starttrace = physicstraceex(spawn_point_origin + vectorscale((0, 0, 1), 128), spawn_point_origin, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), self, 1);
        spawn_point_origin = starttrace[#"position"];
        self.resurrect_origin = spawn_point_origin;
        self.resurrect_angles = spawn_point.angles;
        self.var_139ab759 = gettime();
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0xf881000d, Offset: 0x8a0
// Size: 0xe2
function function_8bdd6715() {
    self item_world::function_df82b00c();
    item_drop::function_767443cc(self);
    self thread function_b8c66122();
    self thread function_ff850b97();
    self warzone::function_2f66bc37();
    self clientfield::set_to_player("infected", 1);
    self clientfield::set_to_player("realtime_multiplay", 1);
    self function_3aaa02be(0);
    self.var_a62dbeca = 1;
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0x194ea72a, Offset: 0x990
// Size: 0xe4
function on_player_spawned() {
    if (isdefined(self)) {
        if (self clientfield::get_to_player("infected") == 1) {
            self freezecontrolsallowlook(1);
            self ghost();
            self thread function_cc4a1b88();
            wait(0.5);
            if (!isdefined(self)) {
                return;
            }
            self show();
            self function_c6775cf9("boast_zombie_climbout");
            self freezecontrolsallowlook(0);
        }
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0xe3d1cd5, Offset: 0xa80
// Size: 0x24
function function_cc4a1b88() {
    self luinotifyevent(#"hash_21b9cfc69e007bc4", 0);
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0x1c58e2be, Offset: 0xab0
// Size: 0x3a8
function function_89116a1e() {
    if (!isplayer(self)) {
        /#
            assert(0);
        #/
        return;
    }
    if (!isdefined(level.var_6990c489) || level.var_6990c489.size <= 0) {
        return;
    }
    zones = level.var_6990c489;
    var_3fe45e06 = [];
    if (isdefined(level.deathcircle) && isdefined(level.deathcircle.nextcircle)) {
        var_5b345622 = min(level.deathcircle.radius - level.deathcircle.nextcircle.radius, 10000);
        var_3fe45e06 = [];
        var_89e77f16 = (level.deathcircle.radius - var_5b345622) * (level.deathcircle.radius - var_5b345622);
        nextorigin = level.deathcircle.origin;
        for (index = 0; index < zones.size; index++) {
            zone = zones[index];
            if (distance2dsquared(nextorigin, zone.origin) <= var_89e77f16) {
                var_3fe45e06[var_3fe45e06.size] = zone;
            }
        }
    }
    if (var_3fe45e06.size > 0) {
        zones = var_3fe45e06;
    } else if (isdefined(level.deathcircle)) {
        closestzone = zones[0];
        var_42c5fb9a = distance2dsquared(level.deathcircle.origin, closestzone.origin);
        for (index = 1; index < zones.size; index++) {
            zone = zones[index];
            var_d5e7808c = distance2dsquared(level.deathcircle.origin, zone.origin);
            if (var_d5e7808c < var_42c5fb9a) {
                var_42c5fb9a = var_d5e7808c;
                closestzone = zone;
            }
        }
        zones = array(closestzone);
    }
    closestzone = zones[0];
    closestdistsq = distance2dsquared(self.origin, closestzone.origin);
    for (index = 1; index < zones.size; index++) {
        zone = zones[index];
        var_98ea9d5c = distance2dsquared(self.origin, zone.origin);
        if (var_98ea9d5c < closestdistsq) {
            closestzone = zone;
            closestdistsq = var_98ea9d5c;
        }
    }
    return closestzone.spawn_points[randomint(closestzone.spawn_points.size)];
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0x99eabda7, Offset: 0xe60
// Size: 0x124
function function_b8c66122() {
    /#
        assert(isplayer(self));
    #/
    if (!isplayer(self) || !isalive(self)) {
        return;
    }
    if (item_world::function_1b11e73c()) {
        while (isdefined(self) && !isdefined(self.inventory)) {
            waitframe(1);
        }
        if (!isdefined(self)) {
            return;
        }
        for (i = 0; i < 2; i++) {
            function_e717b0d(self);
        }
    }
    if (isdefined(self)) {
        self takeweapon(level.weaponbasemeleeheld);
        self giveweapon(level.var_6b2b1231);
    }
}

// Namespace infection/infection
// Params 1, eflags: 0x5 linked
// Checksum 0xd01a71b1, Offset: 0xf90
// Size: 0xae
function private function_4fcf8d3f(player) {
    if (!isplayer(player) || !player is_infected()) {
        return;
    }
    if (player.health < player.maxhealth) {
        player.health = player.maxhealth;
    }
    for (i = 0; i < 2; i++) {
        function_e717b0d(player);
    }
}

// Namespace infection/infection
// Params 1, eflags: 0x5 linked
// Checksum 0x2be98590, Offset: 0x1048
// Size: 0xfc
function private function_2cdab964(params) {
    attacker = params.eattacker;
    weapon = params.weapon;
    if (isdefined(params.laststandparams)) {
        attacker = params.laststandparams.attacker;
        weapon = params.laststandparams.sweapon;
    }
    function_4fcf8d3f(attacker);
    if (isdefined(self) && isdefined(self.var_a1d415ee) && isdefined(self.var_a1d415ee.attacker)) {
        var_a6c0f254 = self.var_a1d415ee.attacker;
        if (var_a6c0f254 !== attacker) {
            function_4fcf8d3f(var_a6c0f254);
        }
    }
}

// Namespace infection/infection
// Params 1, eflags: 0x5 linked
// Checksum 0x4bbf3c35, Offset: 0x1150
// Size: 0x118
function private function_70f6e873(params) {
    if (!isdefined(self) || !self is_infected()) {
        return;
    }
    attacker = params.eattacker;
    origin = self.origin;
    items = self namespace_65181344::function_fd87c780(#"zombie_infected_itemlist", 1);
    foreach (item in items) {
        if (!isdefined(item)) {
            continue;
        }
        item thread wz_ai_utils::function_7a1e21a9(attacker, origin);
    }
}

// Namespace infection/grenade_fire
// Params 1, eflags: 0x44
// Checksum 0x8a7d04, Offset: 0x1270
// Size: 0xfc
function private event_handler[grenade_fire] function_4776caf4(eventstruct) {
    eventstruct.projectile endon(#"death");
    if (sessionmodeiswarzonegame() && isplayer(self) && isalive(self)) {
        weaponname = eventstruct.weapon.name;
        if (weaponname != #"hash_351254cd4fc93d6e") {
            return;
        }
        eventstruct.projectile waittill(#"stationary");
        if (!isdefined(eventstruct.projectile)) {
            return;
        }
        eventstruct.projectile delete();
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x5 linked
// Checksum 0xe0d236c8, Offset: 0x1378
// Size: 0x7c
function private function_fcd9114b() {
    return self ismeleeing() && isdefined(self.var_8a022726) && isdefined(self.var_8a022726.var_a9309589) && self.var_8a022726 istriggerenabled() && self istouching(self.var_8a022726);
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0x413ff922, Offset: 0x1400
// Size: 0x9e
function function_ff850b97() {
    self endon(#"death");
    while (1) {
        if (self function_fcd9114b()) {
            self.var_8a022726.var_a9309589 dodamage(1, self.origin, self, self, undefined, "MOD_EXPLOSIVE");
            while (self function_fcd9114b()) {
                waitframe(1);
            }
            continue;
        }
        waitframe(1);
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x1 linked
// Checksum 0xbd0e9f67, Offset: 0x14a8
// Size: 0x312
function function_16e24b6c() {
    var_d05b667e = [#"p8_wz_door_01_frame_wooden_double":1, #"hash_6c99ba1916eb0091":1, #"p8_wz_door_01_double_frame_wooden":1, #"p8_wz_door_01_double_frame":1, #"hash_5ab15b04f91b09bf":1, #"hash_508d4a4298138acd":1, #"p8_wz_door_01_double":1, #"p8_wz_door_01_double_frame_white":1, #"p8_wz_door_barricade_01_sml":1, #"p8_wz_door_barricade_01_med":1, #"p8_wz_door_barricade_01_lrg":1, #"p8_wz_door_barricade_01":1, #"hash_1debd9bb0784f5f9":1, #"p8_wz_door_01_wood_plain":1, #"p8_wz_door_01_wood":1, #"p8_wz_door_01_turbine":1, #"p8_wz_door_01_train":1, #"hash_3f00c218be809b12":1, #"p8_wz_door_01_latch":1, #"p8_wz_door_01_frame_wooden_painted":1, #"p8_wz_door_01_frame_wooden":1, #"p8_wz_door_01_frame":1, #"hash_7c40a6297a29d7bd":1, #"p8_wz_door_01_farm":1, #"p8_wz_door_01_factory":1, #"hash_70294bd7c3b0e2ff":1, #"p8_wz_door_01_estate":1, #"p8_wz_door_01_diner":1, #"hash_6130912b218af142":1, #"hash_88b4d6deb60840d":1, #"p8_wz_door_01_assylum_double":1, #"p8_wz_door_01_assylum":1, #"p8_wz_door_01_array":1, #"p8_wz_door_01":1, #"p8_wz_door_01_frame_white":1];
    dynents = getdynentarray();
    foreach (dynent in dynents) {
        if (!isdefined(dynent.var_15d44120) || !isdefined(var_d05b667e[dynent.var_15d44120])) {
            continue;
        }
        dynent.ondamaged = &function_cabd9ff3;
    }
}

// Namespace infection/infection
// Params 1, eflags: 0x5 linked
// Checksum 0x14e106be, Offset: 0x17c8
// Size: 0xc6
function private function_cabd9ff3(eventstruct) {
    if (!isdefined(eventstruct) || !isdefined(eventstruct.attacker) || !eventstruct.attacker is_infected()) {
        return;
    }
    dynent = eventstruct.ent;
    if (!isdefined(dynent.var_5059b11f)) {
        dynent.var_5059b11f = 0;
    }
    dynent.var_5059b11f++;
    if (dynent.var_5059b11f >= 2) {
        dynent.health = dynent.health - dynent.health;
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x4
// Checksum 0xf274b9c1, Offset: 0x1898
// Size: 0x84
function private _setup_devgui() {
    /#
        while (!canadddebugcommand()) {
            waitframe(1);
        }
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

// Namespace infection/infection
// Params 0, eflags: 0x4
// Checksum 0x73fc4480, Offset: 0x1928
// Size: 0x2f4
function private function_cdd9b388() {
    /#
        while (1) {
            if (getdvarint(#"wz_respawn_points", 0)) {
                wait(1);
            } else {
                waitframe(1);
            }
            if (getdvarint(#"wz_respawn_points", 0)) {
                players = getplayers();
                if (players.size <= 0) {
                    continue;
                }
                origin = players[0].origin;
                points = [];
                if (isdefined(level.var_6990c489)) {
                    foreach (zone in level.var_6990c489) {
                        if (!isdefined(zone.spawn_points)) {
                            continue;
                        }
                        points = arraycombine(points, zone.spawn_points, 1, 0);
                    }
                }
                var_ea8ae4bc = 20000;
                var_654d4508 = var_ea8ae4bc * var_ea8ae4bc;
                var_84dd2a8b = 2048;
                foreach (point in points) {
                    disttopointsq = distancesquared(origin, point.origin);
                    if (disttopointsq > var_654d4508) {
                        continue;
                    }
                    radius = 64;
                    if (disttopointsq < var_84dd2a8b * var_84dd2a8b) {
                        radius = max(distance(origin, point.origin) / var_84dd2a8b * radius, 1);
                    }
                    color = (1, 0, 1);
                    sphere(point.origin, radius, color, 1, 0, 10, 20);
                }
            }
        }
    #/
}

