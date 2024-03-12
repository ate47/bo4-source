// Atian COD Tools GSC decompiler test
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace mute_smoke;

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x1 linked
// Checksum 0x14d00976, Offset: 0x118
// Size: 0x13c
function init_shared() {
    level.var_1850a22d = getweapon(#"mute_smoke");
    if (isdefined(level.var_1850a22d) && level.var_1850a22d.name != "none") {
        level.var_ae6e2e88 = 15;
        level.var_5375e151 = 2;
        level.var_648b00f8 = level.var_ae6e2e88 + level.var_5375e151;
        level.var_c3e0de31 = "smoke_center";
        level.var_438f1f83 = [];
        function_783a1c07(level.var_1850a22d);
        callback::on_spawned(&on_player_spawned);
        ability_player::register_gadget_should_notify(29, 1);
        clientfield::register("allplayers", "inFriendlyMuteSmoke", 1, 1, "int");
    }
}

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x1 linked
// Checksum 0x1d0b5e1e, Offset: 0x260
// Size: 0x1c
function on_player_spawned() {
    self thread function_c2e7fcb4();
}

// Namespace mute_smoke/mute_smoke
// Params 5, eflags: 0x1 linked
// Checksum 0x6d615a1b, Offset: 0x288
// Size: 0x19c
function function_3c893ac6(owner, statweapon, grenadeweaponname, duration, totaltime) {
    if (isplayer(owner)) {
        owner stats::function_e24eec31(statweapon, #"used", 1);
    }
    owner_origin = owner.origin;
    waitresult = undefined;
    waitresult = self waittill(#"explode", #"death");
    if (!isdefined(self)) {
        return;
    }
    onefoot = vectorscale((0, 0, 1), 12);
    var_16ae7522 = isdefined(waitresult.position) ? waitresult.position : self.origin;
    startpos = var_16ae7522 + onefoot;
    smokeweapon = getweapon(grenadeweaponname);
    function_3d455aca(owner, statweapon, smokeweapon, var_16ae7522, 250, totaltime, duration);
    /#
        function_9dddd194(var_16ae7522, vectorscale((0, 0, 1), 0.9));
    #/
}

// Namespace mute_smoke/mute_smoke
// Params 7, eflags: 0x1 linked
// Checksum 0xf81ba633, Offset: 0x430
// Size: 0x160
function function_3d455aca(owner, statweapon, smokeweapon, position, radius, effectlifetime, smokeblockduration) {
    dir_up = (0, 0, 1);
    ent = spawntimedfx(smokeweapon, position, dir_up, effectlifetime);
    ent setteam(owner.team);
    if (isplayer(owner)) {
        ent setowner(owner);
    }
    ent thread function_15263a60(radius);
    ent thread function_2ece9391(owner, smokeblockduration);
    if (isdefined(owner)) {
        owner.var_483f913f = gettime();
        owner.var_c1fd4f5f = position;
    }
    thread function_20c7dcdc(position, smokeblockduration, statweapon.projsmokestartsound, statweapon.projsmokeendsound, statweapon.projsmokeloopsound);
    return ent;
}

// Namespace mute_smoke/mute_smoke
// Params 1, eflags: 0x1 linked
// Checksum 0xbf683ca1, Offset: 0x598
// Size: 0xf8
function function_15263a60(radius) {
    self endon(#"death");
    var_4b6c578e = self getentitynumber();
    /#
        if (getdvarint(#"hash_f62c07bd78a8c27", 0)) {
            var_1ec8a7f0 = "<unknown string>" + var_4b6c578e;
            level thread util::drawcylinder(self.origin, 250, 120, undefined, var_1ec8a7f0, (1, 0, 0), 0.9);
            self thread function_9cf45892(var_1ec8a7f0);
        }
    #/
    while (1) {
        fxblocksight(self, radius);
        wait(0.75);
    }
}

// Namespace mute_smoke/mute_smoke
// Params 1, eflags: 0x0
// Checksum 0xf0854da3, Offset: 0x698
// Size: 0x2c
function function_9cf45892(stop_notify) {
    /#
        self waittill(#"death");
        level notify(stop_notify);
    #/
}

// Namespace mute_smoke/mute_smoke
// Params 2, eflags: 0x1 linked
// Checksum 0x1b263e94, Offset: 0x6d0
// Size: 0x154
function function_2ece9391(owner, duration) {
    team = self.team;
    trigger = spawn("trigger_radius", self.origin, 0, 250, 120);
    trigger.team = team;
    trigger.owner = owner;
    if (!isdefined(level.var_438f1f83)) {
        level.var_438f1f83 = [];
    } else if (!isarray(level.var_438f1f83)) {
        level.var_438f1f83 = array(level.var_438f1f83);
    }
    level.var_438f1f83[level.var_438f1f83.size] = trigger;
    self waittilltimeout(duration, #"death");
    arrayremovevalue(level.var_438f1f83, trigger);
    trigger delete();
}

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x0
// Checksum 0x1ea947b4, Offset: 0x830
// Size: 0x8a
function function_e2288bb6() {
    foreach (trigger in level.var_438f1f83) {
        if (self istouching(trigger)) {
            return 1;
        }
    }
    return 0;
}

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x5 linked
// Checksum 0xeee75e41, Offset: 0x8c8
// Size: 0xf8
function private function_79583198() {
    if (isdefined(self.var_5984154e) && self istouching(self.var_5984154e)) {
        return 1;
    }
    foreach (trigger in level.var_438f1f83) {
        if (isdefined(self.team) && self.team == trigger.team) {
            continue;
        }
        if (self istouching(trigger)) {
            self.var_5984154e = trigger;
            return 1;
        }
    }
    self.var_5984154e = undefined;
    return 0;
}

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x5 linked
// Checksum 0xe971eae0, Offset: 0x9c8
// Size: 0xf8
function private function_b3862968() {
    if (isdefined(self.var_9b82aa4f) && self istouching(self.var_9b82aa4f)) {
        return 1;
    }
    foreach (trigger in level.var_438f1f83) {
        if (isdefined(self.team) && self.team != trigger.team) {
            continue;
        }
        if (self istouching(trigger)) {
            self.var_9b82aa4f = trigger;
            return 1;
        }
    }
    self.var_9b82aa4f = undefined;
    return 0;
}

// Namespace mute_smoke/mute_smoke
// Params 1, eflags: 0x1 linked
// Checksum 0x7d66e8f0, Offset: 0xac8
// Size: 0x3c
function function_7033488b(notifyhash) {
    if (notifyhash == #"death") {
        self function_40abb79a(0, undefined);
    }
}

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x1 linked
// Checksum 0x5bddbb73, Offset: 0xb10
// Size: 0x210
function function_c2e7fcb4() {
    player = self;
    player endoncallback(&function_7033488b, #"death", #"disconnect");
    player.in_enemy_mute_smoke = player clientfield::get("in_enemy_mute_smoke") == 1;
    player.var_2118ca55 = player clientfield::get("inFriendlyMuteSmoke") == 1;
    wait(randomfloatrange(0.1, 0.6));
    while (1) {
        in_enemy_mute_smoke = player function_79583198();
        if (player.in_enemy_mute_smoke != in_enemy_mute_smoke) {
            player clientfield::set("in_enemy_mute_smoke", in_enemy_mute_smoke ? 1 : 0);
            player.in_enemy_mute_smoke = in_enemy_mute_smoke;
            applicant = isdefined(player.var_5984154e) ? player.var_5984154e.owner : undefined;
            player thread function_40abb79a(in_enemy_mute_smoke, applicant);
            if (player.in_enemy_mute_smoke) {
                player.var_fd0be7bd = applicant;
            }
        }
        var_2118ca55 = player function_b3862968();
        if (player.var_2118ca55 != var_2118ca55) {
            player.var_2118ca55 = var_2118ca55;
            clientfield::set("inFriendlyMuteSmoke", var_2118ca55);
        }
        wait(0.25);
    }
}

// Namespace mute_smoke/mute_smoke
// Params 2, eflags: 0x1 linked
// Checksum 0x51165a9b, Offset: 0xd28
// Size: 0xf4
function function_40abb79a(in_enemy_mute_smoke, applicant) {
    player = self;
    var_65ce58a2 = #"deaf";
    if (player getplayerresistance(0) > 0) {
        var_65ce58a2 = #"hash_74cdcf6548f09fcd";
    }
    var_56d6af0e = getstatuseffect(var_65ce58a2);
    if (in_enemy_mute_smoke) {
        player thread function_41470017(var_56d6af0e, applicant);
        return;
    }
    player notify(#"hash_2d871144da153bc1");
    player status_effect::function_408158ef(var_56d6af0e.setype, var_56d6af0e.var_18d16a6b);
}

// Namespace mute_smoke/mute_smoke
// Params 2, eflags: 0x1 linked
// Checksum 0x5194c3f5, Offset: 0xe28
// Size: 0xa8
function function_41470017(var_56d6af0e, applicant) {
    self endon(#"hash_2d871144da153bc1", #"death", #"disconnect");
    self thread status_effect::status_effect_apply(var_56d6af0e, undefined, applicant, 0, 1200);
    while (1) {
        wait(1);
        self thread status_effect::status_effect_apply(var_56d6af0e, undefined, applicant, 1, 1000);
    }
}

// Namespace mute_smoke/grenade_fire
// Params 1, eflags: 0x40
// Checksum 0xc9c12c1a, Offset: 0xed8
// Size: 0x11c
function event_handler[grenade_fire] function_f9d992c2(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    grenade = eventstruct.projectile;
    if (grenade util::ishacked()) {
        return;
    }
    weapon = eventstruct.weapon;
    if (weapon.rootweapon == level.var_1850a22d) {
        if (!(self.var_cd4aaf01 === 1)) {
            self.var_cd4aaf01 = 1;
            self function_a4998ccd(grenade.origin, self.origin, weapon);
            self.var_cd4aaf01 = undefined;
        }
        grenade thread function_3c893ac6(self, level.var_1850a22d, level.var_c3e0de31, level.var_ae6e2e88, level.var_648b00f8);
    }
}

// Namespace mute_smoke/mute_smoke
// Params 1, eflags: 0x1 linked
// Checksum 0x6ac82341, Offset: 0x1000
// Size: 0x2e
function function_783a1c07(weapon) {
    level.mute_smoke_custom_settings = getscriptbundle(weapon.customsettings);
}

// Namespace mute_smoke/mute_smoke
// Params 3, eflags: 0x1 linked
// Checksum 0xad9f6d81, Offset: 0x1038
// Size: 0x444
function function_a4998ccd(grenade_origin, player_origin, weapon) {
    /#
        function_783a1c07(weapon);
    #/
    settings = level.mute_smoke_custom_settings;
    var_a19445f = self playerads() >= 1;
    var_de0fa6f1 = isdefined(settings.var_de0fa6f1) ? settings.var_de0fa6f1 : var_a19445f ? isdefined(settings.var_d75099e) ? settings.var_d75099e : 0 : 0;
    var_46f48578 = max(isdefined(settings.var_46f48578) ? settings.var_46f48578 : var_a19445f ? isdefined(settings.var_bdb59983) ? settings.var_bdb59983 : 0 : 0, 0.1);
    var_71c4a0d9 = var_a19445f ? isdefined(settings.var_75171533) ? settings.var_75171533 : 0 : 0;
    var_99803ce = isdefined(settings.var_99803ce) ? settings.var_99803ce : var_a19445f ? isdefined(settings.var_8db2ddd7) ? settings.var_8db2ddd7 : 0 : 0;
    var_3300383 = max(isdefined(settings.var_3300383) ? settings.var_3300383 : var_a19445f ? isdefined(settings.var_ca506691) ? settings.var_ca506691 : 0 : 0, 0.1);
    var_6b0817d7 = var_a19445f ? isdefined(settings.var_7163a11a) ? settings.var_7163a11a : 0 : 0;
    /#
        function_9dddd194(grenade_origin, vectorscale((0, 1, 0), 0.9));
    #/
    facing_angles = self getplayerangles();
    forward = anglestoforward(facing_angles);
    up = anglestoup(facing_angles);
    velocity = function_711c258(forward, up, weapon);
    var_1a11adab = vectortoangles(velocity);
    speed = length(velocity);
    var_2571f440 = var_1a11adab + (var_de0fa6f1, var_71c4a0d9, 0);
    var_d2922c1e = vectorscale(anglestoforward(var_2571f440), speed * var_46f48578);
    self magicgrenadeplayer(weapon, grenade_origin, var_d2922c1e);
    var_c1917dbc = var_1a11adab + (var_99803ce, var_6b0817d7, 0);
    var_c0cb8891 = vectorscale(anglestoforward(var_c1917dbc), speed * var_3300383);
    self magicgrenadeplayer(weapon, grenade_origin, var_c0cb8891);
}

// Namespace mute_smoke/mute_smoke
// Params 2, eflags: 0x0
// Checksum 0xfae424cb, Offset: 0x1488
// Size: 0xbc
function function_9dddd194(position, color) {
    /#
        if (getdvarint(#"hash_23f044f7a5117090", 0)) {
            if (!isdefined(color)) {
                color = (1, 0, 0);
            }
            util::debug_sphere(position, 6, color, 0.5, int(1 / float(function_60d95f53()) / 1000) * 15);
        }
    #/
}

// Namespace mute_smoke/mute_smoke
// Params 5, eflags: 0x1 linked
// Checksum 0x8e5078cf, Offset: 0x1550
// Size: 0x124
function function_20c7dcdc(position, duration, startsound, stopsound, loopsound) {
    smokesound = spawn("script_origin", (0, 0, 1));
    smokesound.origin = position;
    if (isdefined(startsound)) {
        smokesound playsound(startsound);
    }
    if (isdefined(loopsound)) {
        smokesound playloopsound(loopsound);
    }
    if (duration > 0.5) {
        wait(duration - 0.5);
    }
    if (isdefined(stopsound)) {
        thread sound::play_in_space(stopsound, position);
    }
    smokesound stoploopsound(0.5);
    wait(0.5);
    smokesound delete();
}

