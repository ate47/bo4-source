#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace burnplayer;

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x2
// Checksum 0xd053c3e3, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"burnplayer", &__init__, undefined, undefined);
}

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x1 linked
// Checksum 0xe0843e7a, Offset: 0x108
// Size: 0x64
function __init__() {
    clientfield::register("allplayers", "burn", 1, 1, "int");
    clientfield::register("playercorpse", "burned_effect", 1, 1, "int");
}

// Namespace burnplayer/burnplayer
// Params 5, eflags: 0x1 linked
// Checksum 0x5e5f1c1f, Offset: 0x178
// Size: 0xb4
function setplayerburning(duration, interval, damageperinterval, attacker, weapon) {
    self clientfield::set("burn", 1);
    self thread watchburntimer(duration);
    self thread watchburndamage(interval, damageperinterval, attacker, weapon);
    self thread watchforwater();
    self thread watchburnfinished();
}

// Namespace burnplayer/burnplayer
// Params 3, eflags: 0x1 linked
// Checksum 0xc19f31c7, Offset: 0x238
// Size: 0xc4
function takingburndamage(eattacker, weapon, smeansofdeath) {
    if (isdefined(self.doing_scripted_burn_damage)) {
        self.doing_scripted_burn_damage = undefined;
        return;
    }
    if (weapon == level.weaponnone) {
        return;
    }
    if (weapon.burnduration == 0) {
        return;
    }
    self setplayerburning(float(weapon.burnduration) / 1000, float(weapon.burndamageinterval) / 1000, weapon.burndamage, eattacker, weapon);
}

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x1 linked
// Checksum 0x40310b31, Offset: 0x308
// Size: 0x5c
function watchburnfinished() {
    self endon(#"disconnect");
    self waittill(#"death", #"burn_finished");
    self clientfield::set("burn", 0);
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0x361396f3, Offset: 0x370
// Size: 0x66
function watchburntimer(duration) {
    self notify(#"burnplayer_watchburntimer");
    self endon(#"burnplayer_watchburntimer", #"disconnect", #"death");
    wait(duration);
    self notify(#"burn_finished");
}

// Namespace burnplayer/burnplayer
// Params 4, eflags: 0x1 linked
// Checksum 0xe2a07a4b, Offset: 0x3e0
// Size: 0xd2
function watchburndamage(interval, damage, attacker, weapon) {
    if (damage == 0) {
        return;
    }
    self endon(#"disconnect", #"death", #"burnplayer_watchburntimer", #"burn_finished");
    while (true) {
        wait(interval);
        self.doing_scripted_burn_damage = 1;
        self dodamage(damage, self.origin, attacker, undefined, undefined, "MOD_BURNED", 0, weapon);
        self.doing_scripted_burn_damage = undefined;
    }
}

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x1 linked
// Checksum 0x43fffef2, Offset: 0x4c0
// Size: 0x74
function watchforwater() {
    self endon(#"disconnect", #"death", #"burn_finished");
    while (true) {
        if (self isplayerunderwater()) {
            self notify(#"burn_finished");
        }
        wait(0.05);
    }
}

