// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;

#namespace destructible;

// Namespace destructible/destructible
// Params 0, eflags: 0x2
// Checksum 0xcc431779, Offset: 0x208
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"destructible", &__init__, undefined, undefined);
}

// Namespace destructible/destructible
// Params 0, eflags: 0x0
// Checksum 0x5ee0bc9c, Offset: 0x250
// Size: 0x14e
function __init__() {
    clientfield::register("scriptmover", "start_destructible_explosion", 1, 10, "int");
    level.destructible_callbacks = [];
    destructibles = getentarray("destructible", "targetname");
    if (destructibles.size <= 0) {
        return;
    }
    for (i = 0; i < destructibles.size; i++) {
        if (getsubstr(destructibles[i].destructibledef, 0, 4) == "veh_") {
            destructibles[i] thread car_death_think();
            destructibles[i] thread car_grenade_stuck_think();
            continue;
        }
        if (destructibles[i].destructibledef == "fxdest_upl_metal_tank_01") {
            destructibles[i] thread tank_grenade_stuck_think();
        }
    }
}

// Namespace destructible/destructible
// Params 3, eflags: 0x0
// Checksum 0xb51ef65d, Offset: 0x3a8
// Size: 0x9c
function physics_explosion_and_rumble(origin, radius, physics_explosion) {
    /#
        assert(radius <= pow(2, 10) - 1);
    #/
    if (isdefined(physics_explosion) && physics_explosion) {
        radius = radius + (1 << 9);
    }
    self clientfield::set("start_destructible_explosion", radius);
}

// Namespace destructible/destructible
// Params 7, eflags: 0x0
// Checksum 0xb89f1948, Offset: 0x450
// Size: 0x452
function event_callback(destructible_event, attacker, weapon, piece_index, point, dir, mod) {
    explosion_radius = 0;
    if (issubstr(destructible_event, "explode") && destructible_event != "explode") {
        tokens = strtok(destructible_event, "_");
        explosion_radius = tokens[1];
        if (explosion_radius == "sm") {
            explosion_radius = 150;
        } else if (explosion_radius == "lg") {
            explosion_radius = 450;
        } else {
            explosion_radius = int(explosion_radius);
        }
        destructible_event = "explode_complex";
    }
    if (issubstr(destructible_event, "explosive")) {
        tokens = strtok(destructible_event, "_");
        explosion_radius_type = tokens[3];
        if (explosion_radius_type == "small") {
            explosion_radius = 150;
        } else if (explosion_radius_type == "large") {
            explosion_radius = 450;
        } else {
            explosion_radius = 300;
        }
    }
    if (issubstr(destructible_event, "simple_timed_explosion")) {
        self thread simple_timed_explosion(destructible_event, attacker);
        return;
    }
    switch (destructible_event) {
    case #"destructible_car_explosion":
        self car_explosion(attacker);
        if (isdefined(weapon)) {
            self.destroyingweapon = weapon;
        }
        break;
    case #"destructible_car_fire":
        level thread battlechatter::on_player_near_explodable(self, "car");
        self thread car_fire_think(attacker);
        if (isdefined(weapon)) {
            self.destroyingweapon = weapon;
        }
        break;
    case #"explode":
        self thread simple_explosion(attacker);
        break;
    case #"explode_complex":
        self thread complex_explosion(attacker, explosion_radius);
        break;
    case #"destructible_explosive_incendiary_large":
    case #"destructible_explosive_incendiary_small":
        self explosive_incendiary_explosion(attacker, explosion_radius, 0);
        if (isdefined(weapon)) {
            self.destroyingweapon = weapon;
        }
        break;
    case #"destructible_explosive_electrical_small":
    case #"destructible_explosive_electrical_large":
        self explosive_electrical_explosion(attacker, explosion_radius, 0);
        if (isdefined(weapon)) {
            self.destroyingweapon = weapon;
        }
        break;
    case #"destructible_explosive_concussive_large":
    case #"destructible_explosive_concussive_small":
        self explosive_concussive_explosion(attacker, explosion_radius, 0);
        if (isdefined(weapon)) {
            self.destroyingweapon = weapon;
        }
        break;
    default:
        break;
    }
    if (isdefined(level.destructible_callbacks[destructible_event])) {
        self thread [[ level.destructible_callbacks[destructible_event] ]](destructible_event, attacker, weapon, piece_index, point, dir, mod);
    }
}

// Namespace destructible/destructible
// Params 1, eflags: 0x0
// Checksum 0x2d908ce4, Offset: 0x8b0
// Size: 0x12c
function simple_explosion(attacker) {
    if (isdefined(self.exploded) && self.exploded) {
        return;
    }
    self.exploded = 1;
    offset = vectorscale((0, 0, 1), 5);
    self radiusdamage(self.origin + offset, 256, 300, 75, attacker, "MOD_EXPLOSIVE", getweapon(#"explodable_barrel"));
    physics_explosion_and_rumble(self.origin, 255, 1);
    if (isdefined(attacker)) {
        self dodamage(self.health + 10000, self.origin + offset, attacker);
        return;
    }
    self dodamage(self.health + 10000, self.origin + offset);
}

// Namespace destructible/destructible
// Params 2, eflags: 0x0
// Checksum 0x6f594620, Offset: 0x9e8
// Size: 0x13c
function simple_timed_explosion(destructible_event, attacker) {
    self endon(#"death");
    wait_times = [];
    str = getsubstr(destructible_event, 23);
    tokens = strtok(str, "_");
    for (i = 0; i < tokens.size; i++) {
        wait_times[wait_times.size] = int(tokens[i]);
    }
    if (wait_times.size <= 0) {
        wait_times[0] = 5;
        wait_times[1] = 10;
    }
    wait(randomintrange(wait_times[0], wait_times[1]));
    simple_explosion(attacker);
}

// Namespace destructible/destructible
// Params 2, eflags: 0x0
// Checksum 0xa06fa6ad, Offset: 0xb30
// Size: 0x10c
function complex_explosion(attacker, max_radius) {
    offset = vectorscale((0, 0, 1), 5);
    if (isdefined(attacker)) {
        self radiusdamage(self.origin + offset, max_radius, 300, 100, attacker);
    } else {
        self radiusdamage(self.origin + offset, max_radius, 300, 100);
    }
    physics_explosion_and_rumble(self.origin, max_radius, 1);
    if (isdefined(attacker)) {
        self dodamage(20000, self.origin + offset, attacker);
        return;
    }
    self dodamage(20000, self.origin + offset);
}

// Namespace destructible/destructible
// Params 2, eflags: 0x0
// Checksum 0x5fc116e1, Offset: 0xc48
// Size: 0x1ac
function car_explosion(attacker, physics_explosion) {
    if (isdefined(self.car_dead) && self.car_dead) {
        return;
    }
    if (!isdefined(physics_explosion)) {
        physics_explosion = 1;
    }
    self notify(#"car_dead");
    self.car_dead = 1;
    if (isdefined(attacker)) {
        self radiusdamage(self.origin, 256, 300, 75, attacker, "MOD_EXPLOSIVE", getweapon(#"destructible_car"));
    } else {
        self radiusdamage(self.origin, 256, 300, 75);
    }
    physics_explosion_and_rumble(self.origin, 255, physics_explosion);
    if (isdefined(attacker)) {
        attacker thread challenges::destroyed_car();
    }
    level.globalcarsdestroyed++;
    if (isdefined(attacker)) {
        self dodamage(self.health + 10000, self.origin + (0, 0, 1), attacker);
    } else {
        self dodamage(self.health + 10000, self.origin + (0, 0, 1));
    }
    self markdestructibledestroyed();
}

// Namespace destructible/destructible
// Params 0, eflags: 0x0
// Checksum 0xa4d50d1e, Offset: 0xe00
// Size: 0xf0
function tank_grenade_stuck_think() {
    self endon(#"destructible_base_piece_death", #"death");
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"grenade_stuck");
        missile = waitresult.projectile;
        if (!isdefined(missile) || !isdefined(missile.model)) {
            continue;
        }
        if (missile.model == "t5_weapon_crossbow_bolt" || missile.model == "t6_wpn_grenade_semtex_projectile" || missile.model == "wpn_t7_c4_world") {
            self thread tank_grenade_stuck_explode(missile);
        }
    }
}

// Namespace destructible/destructible
// Params 1, eflags: 0x0
// Checksum 0xdbc0f800, Offset: 0xef8
// Size: 0x14c
function tank_grenade_stuck_explode(missile) {
    self endon(#"destructible_base_piece_death", #"death");
    owner = getmissileowner(missile);
    if (isdefined(owner) && missile.model == "wpn_t7_c4_world") {
        owner endon(#"disconnect", #"weapon_object_destroyed");
        missile endon(#"picked_up");
        missile thread tank_hacked_c4(self);
    }
    missile waittill(#"explode");
    if (isdefined(owner)) {
        self dodamage(self.health + 10000, self.origin + (0, 0, 1), owner);
        return;
    }
    self dodamage(self.health + 10000, self.origin + (0, 0, 1));
}

// Namespace destructible/destructible
// Params 1, eflags: 0x0
// Checksum 0x8e9d0c21, Offset: 0x1050
// Size: 0x84
function tank_hacked_c4(tank) {
    tank endon(#"destructible_base_piece_death", #"death");
    self endon(#"death");
    self waittill(#"hacked");
    self notify(#"picked_up");
    tank thread tank_grenade_stuck_explode(self);
}

// Namespace destructible/destructible
// Params 0, eflags: 0x0
// Checksum 0x21134c5e, Offset: 0x10e0
// Size: 0x84
function car_death_think() {
    self endon(#"car_dead");
    self.car_dead = 0;
    self thread car_death_notify();
    waitresult = undefined;
    waitresult = self waittill(#"destructible_base_piece_death");
    if (isdefined(self)) {
        self thread car_explosion(waitresult.attacker, 0);
    }
}

// Namespace destructible/destructible
// Params 0, eflags: 0x0
// Checksum 0xe6c1814e, Offset: 0x1170
// Size: 0x100
function car_grenade_stuck_think() {
    self endon(#"destructible_base_piece_death", #"car_dead", #"death");
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"grenade_stuck");
        missile = waitresult.projectile;
        if (!isdefined(missile) || !isdefined(missile.model)) {
            continue;
        }
        if (missile.model == "t5_weapon_crossbow_bolt" || missile.model == "t6_wpn_grenade_semtex_projectile" || missile.model == "wpn_t7_c4_world") {
            self thread car_grenade_stuck_explode(missile);
        }
    }
}

// Namespace destructible/destructible
// Params 1, eflags: 0x0
// Checksum 0x4e17e158, Offset: 0x1278
// Size: 0x15c
function car_grenade_stuck_explode(missile) {
    self endon(#"destructible_base_piece_death", #"car_dead", #"death");
    owner = getmissileowner(missile);
    if (isdefined(owner) && missile.model == "wpn_t7_c4_world") {
        owner endon(#"disconnect", #"weapon_object_destroyed");
        missile endon(#"picked_up");
        missile thread car_hacked_c4(self);
    }
    missile waittill(#"explode");
    if (isdefined(owner)) {
        self dodamage(self.health + 10000, self.origin + (0, 0, 1), owner);
        return;
    }
    self dodamage(self.health + 10000, self.origin + (0, 0, 1));
}

// Namespace destructible/destructible
// Params 1, eflags: 0x0
// Checksum 0xbb4be18c, Offset: 0x13e0
// Size: 0x94
function car_hacked_c4(car) {
    car endon(#"destructible_base_piece_death", #"car_dead", #"death");
    self endon(#"death");
    self waittill(#"hacked");
    self notify(#"picked_up");
    car thread car_grenade_stuck_explode(self);
}

// Namespace destructible/destructible
// Params 0, eflags: 0x0
// Checksum 0x7e3f4593, Offset: 0x1480
// Size: 0x3e
function car_death_notify() {
    self endon(#"car_dead");
    self notify(#"destructible_base_piece_death", self waittill(#"death"));
}

// Namespace destructible/destructible
// Params 1, eflags: 0x0
// Checksum 0xb80475e9, Offset: 0x14c8
// Size: 0x54
function car_fire_think(attacker) {
    self endon(#"death");
    wait(randomintrange(7, 10));
    self thread car_explosion(attacker);
}

// Namespace destructible/destructible
// Params 1, eflags: 0x40
// Checksum 0x2093d0ce, Offset: 0x1528
// Size: 0x11c
function event_handler[destructible] codecallback_destructibleevent(eventstruct) {
    if (eventstruct.event == "broken") {
        event_callback(eventstruct.notify_type, eventstruct.attacker, eventstruct.weapon, eventstruct.piece, eventstruct.point, eventstruct.dir, eventstruct.mod);
        self notify(eventstruct.event, {#type:eventstruct.notify_type, #attacker:eventstruct.attacker});
        return;
    }
    if (eventstruct.event == "breakafter") {
        self thread breakafter(eventstruct.time, eventstruct.amount, eventstruct.piece);
    }
}

// Namespace destructible/destructible
// Params 3, eflags: 0x0
// Checksum 0x1c37dd17, Offset: 0x1650
// Size: 0x6c
function breakafter(time, damage, piece) {
    self notify(#"breakafter");
    self endon(#"breakafter");
    wait(time);
    self dodamage(damage, self.origin, undefined, undefined);
}

// Namespace destructible/destructible
// Params 3, eflags: 0x0
// Checksum 0x341befac, Offset: 0x16c8
// Size: 0x174
function explosive_incendiary_explosion(attacker, explosion_radius, physics_explosion) {
    if (!isvehicle(self)) {
        offset = vectorscale((0, 0, 1), 5);
        if (isdefined(attacker)) {
            self radiusdamage(self.origin + offset, explosion_radius, 256, 75, attacker, "MOD_BURNED", getweapon(#"incendiary_fire"));
        } else {
            self radiusdamage(self.origin + offset, explosion_radius, 256, 75);
        }
        physics_explosion_and_rumble(self.origin, 255, physics_explosion);
    }
    if (isdefined(self.target)) {
        dest_clip = getent(self.target, "targetname");
        if (isdefined(dest_clip)) {
            dest_clip delete();
        }
    }
    self markdestructibledestroyed();
}

// Namespace destructible/destructible
// Params 3, eflags: 0x0
// Checksum 0x24add6d2, Offset: 0x1848
// Size: 0x154
function explosive_electrical_explosion(attacker, explosion_radius, physics_explosion) {
    if (!isvehicle(self)) {
        offset = vectorscale((0, 0, 1), 5);
        if (isdefined(attacker)) {
            self radiusdamage(self.origin + offset, explosion_radius, 256, 75, attacker, "MOD_ELECTROCUTED");
        } else {
            self radiusdamage(self.origin + offset, explosion_radius, 256, 75);
        }
        physics_explosion_and_rumble(self.origin, 255, physics_explosion);
    }
    if (isdefined(self.target)) {
        dest_clip = getent(self.target, "targetname");
        if (isdefined(dest_clip)) {
            dest_clip delete();
        }
    }
    self markdestructibledestroyed();
}

// Namespace destructible/destructible
// Params 3, eflags: 0x0
// Checksum 0xeb920a2c, Offset: 0x19a8
// Size: 0x154
function explosive_concussive_explosion(attacker, explosion_radius, physics_explosion) {
    if (!isvehicle(self)) {
        offset = vectorscale((0, 0, 1), 5);
        if (isdefined(attacker)) {
            self radiusdamage(self.origin + offset, explosion_radius, 256, 75, attacker, "MOD_GRENADE");
        } else {
            self radiusdamage(self.origin + offset, explosion_radius, 256, 75);
        }
        physics_explosion_and_rumble(self.origin, 255, physics_explosion);
    }
    if (isdefined(self.target)) {
        dest_clip = getent(self.target, "targetname");
        if (isdefined(dest_clip)) {
            dest_clip delete();
        }
    }
    self markdestructibledestroyed();
}

