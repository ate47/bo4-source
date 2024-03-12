// Atian COD Tools GSC decompiler test
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace destructible;

// Namespace destructible/destructible
// Params 0, eflags: 0x2
// Checksum 0xc8853a8f, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"destructible", &__init__, undefined, undefined);
}

// Namespace destructible/destructible
// Params 0, eflags: 0x1 linked
// Checksum 0xc62aa103, Offset: 0x218
// Size: 0x10e
function __init__() {
    level.destructible_callbacks = [];
    destructibles = getentarray("destructible", "targetname");
    clientfield::register("scriptmover", "start_destructible_explosion", 1, 10, "int");
    if (destructibles.size <= 0) {
        return;
    }
    for (i = 0; i < destructibles.size; i++) {
        if (getsubstr(destructibles[i].destructibledef, 0, 4) == "veh_") {
            destructibles[i] thread destructible_car_death_think();
            destructibles[i] thread destructible_car_grenade_stuck_think();
        }
    }
}

// Namespace destructible/destructible
// Params 3, eflags: 0x1 linked
// Checksum 0xd3f95bef, Offset: 0x330
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
// Params 3, eflags: 0x0
// Checksum 0xf49c6e69, Offset: 0x3d8
// Size: 0x496
function destructible_event_callback(destructible_event, attacker, weapon) {
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
        damage_type = tokens[2];
        explosion_radius_type = tokens[3];
        explosion_radius = 300;
        switch (damage_type) {
        case #"concussive":
            if (explosion_radius_type == "large") {
                explosion_radius = 280;
            } else {
                explosion_radius = 220;
            }
            break;
        case #"electrical":
            if (explosion_radius_type == "large") {
                explosion_radius = 60;
            } else {
                explosion_radius = 210;
            }
            break;
        case #"incendiary":
            if (explosion_radius_type == "large") {
                explosion_radius = 250;
            } else {
                explosion_radius = 200;
            }
            break;
        }
    }
    if (issubstr(destructible_event, "simple_timed_explosion")) {
        self thread simple_timed_explosion(destructible_event, attacker);
        return;
    }
    switch (destructible_event) {
    case #"destructible_car_explosion":
        self destructible_car_explosion(attacker);
        if (isdefined(weapon)) {
            self.destroyingweapon = weapon;
        }
        break;
    case #"destructible_car_fire":
        self thread destructible_car_fire_think(attacker);
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
        self thread [[ level.destructible_callbacks[destructible_event] ]](destructible_event, attacker);
    }
}

// Namespace destructible/destructible
// Params 1, eflags: 0x1 linked
// Checksum 0x58c9f429, Offset: 0x878
// Size: 0x104
function simple_explosion(attacker) {
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
// Params 2, eflags: 0x1 linked
// Checksum 0xfd4dc613, Offset: 0x988
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
// Params 2, eflags: 0x1 linked
// Checksum 0xa7af96c9, Offset: 0xad0
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
// Params 2, eflags: 0x1 linked
// Checksum 0x891de267, Offset: 0xbe8
// Size: 0x1a4
function destructible_car_explosion(attacker, physics_explosion) {
    if (self.car_dead) {
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
// Params 0, eflags: 0x1 linked
// Checksum 0x6bc5469f, Offset: 0xd98
// Size: 0x84
function destructible_car_death_think() {
    self endon(#"car_dead");
    self.car_dead = 0;
    self thread destructible_car_death_notify();
    waitresult = undefined;
    waitresult = self waittill(#"destructible_base_piece_death");
    if (isdefined(self)) {
        self thread destructible_car_explosion(waitresult.attacker, 0);
    }
}

// Namespace destructible/destructible
// Params 0, eflags: 0x1 linked
// Checksum 0x36346d44, Offset: 0xe28
// Size: 0x100
function destructible_car_grenade_stuck_think() {
    self endon(#"destructible_base_piece_death", #"car_dead", #"death");
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"grenade_stuck");
        missile = waitresult.projectile;
        if (!isdefined(missile) || !isdefined(missile.model)) {
            continue;
        }
        if (missile.model == "t5_weapon_crossbow_bolt" || missile.model == "t6_wpn_grenade_semtex_projectile" || missile.model == "wpn_t7_c4_world") {
            self thread destructible_car_grenade_stuck_explode(missile);
        }
    }
}

// Namespace destructible/destructible
// Params 1, eflags: 0x1 linked
// Checksum 0x3e44b9ed, Offset: 0xf30
// Size: 0x15c
function destructible_car_grenade_stuck_explode(missile) {
    self endon(#"destructible_base_piece_death", #"car_dead", #"death");
    owner = getmissileowner(missile);
    if (isdefined(owner) && missile.model == "wpn_t7_c4_world") {
        owner endon(#"disconnect", #"weapon_object_destroyed");
        missile endon(#"picked_up");
        missile thread destructible_car_hacked_c4(self);
    }
    missile waittill(#"explode");
    if (isdefined(owner)) {
        self dodamage(self.health + 10000, self.origin + (0, 0, 1), owner);
        return;
    }
    self dodamage(self.health + 10000, self.origin + (0, 0, 1));
}

// Namespace destructible/destructible
// Params 1, eflags: 0x1 linked
// Checksum 0xf4da10e9, Offset: 0x1098
// Size: 0x94
function destructible_car_hacked_c4(car) {
    car endon(#"destructible_base_piece_death", #"car_dead", #"death");
    self endon(#"death");
    self waittill(#"hacked");
    self notify(#"picked_up");
    car thread destructible_car_grenade_stuck_explode(self);
}

// Namespace destructible/destructible
// Params 0, eflags: 0x1 linked
// Checksum 0x4a651825, Offset: 0x1138
// Size: 0x3e
function destructible_car_death_notify() {
    self endon(#"car_dead");
    self notify(#"destructible_base_piece_death", self waittill(#"death"));
}

// Namespace destructible/destructible
// Params 1, eflags: 0x1 linked
// Checksum 0xeef19d9a, Offset: 0x1180
// Size: 0x54
function destructible_car_fire_think(attacker) {
    self endon(#"death");
    wait(randomintrange(7, 10));
    self thread destructible_car_explosion(attacker);
}

// Namespace destructible/destructible
// Params 3, eflags: 0x0
// Checksum 0xa4d5346e, Offset: 0x11e0
// Size: 0x6c
function breakafter(time, damage, piece) {
    self notify(#"breakafter");
    self endon(#"breakafter");
    wait(time);
    self dodamage(damage, self.origin, undefined, undefined);
}

// Namespace destructible/destructible
// Params 3, eflags: 0x1 linked
// Checksum 0x7077ee0d, Offset: 0x1258
// Size: 0x174
function explosive_incendiary_explosion(attacker, explosion_radius, physics_explosion) {
    if (!isvehicle(self)) {
        offset = vectorscale((0, 0, 1), 5);
        if (isdefined(attacker)) {
            self radiusdamage(self.origin + offset, explosion_radius, 380, 95, attacker, "MOD_BURNED", getweapon(#"incendiary_fire"));
        } else {
            self radiusdamage(self.origin + offset, explosion_radius, 380, 95);
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
// Params 3, eflags: 0x1 linked
// Checksum 0x7220851b, Offset: 0x13d8
// Size: 0x154
function explosive_electrical_explosion(attacker, explosion_radius, physics_explosion) {
    if (!isvehicle(self)) {
        offset = vectorscale((0, 0, 1), 5);
        if (isdefined(attacker)) {
            self radiusdamage(self.origin + offset, explosion_radius, 350, 80, attacker, "MOD_ELECTROCUTED");
        } else {
            self radiusdamage(self.origin + offset, explosion_radius, 350, 80);
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
// Params 3, eflags: 0x1 linked
// Checksum 0x40af8c5f, Offset: 0x1538
// Size: 0x154
function explosive_concussive_explosion(attacker, explosion_radius, physics_explosion) {
    if (!isvehicle(self)) {
        offset = vectorscale((0, 0, 1), 5);
        if (isdefined(attacker)) {
            self radiusdamage(self.origin + offset, explosion_radius, 300, 50, attacker, "MOD_GRENADE");
        } else {
            self radiusdamage(self.origin + offset, explosion_radius, 300, 50);
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

