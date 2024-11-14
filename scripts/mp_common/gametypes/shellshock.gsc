#using scripts\mp_common\util;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;

#namespace shellshock;

// Namespace shellshock/shellshock
// Params 0, eflags: 0x2
// Checksum 0xdcc135e4, Offset: 0x108
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"shellshock", &__init__, undefined, undefined);
}

// Namespace shellshock/shellshock
// Params 0, eflags: 0x0
// Checksum 0x8b696526, Offset: 0x150
// Size: 0x3e
function __init__() {
    callback::on_start_gametype(&init);
    level.shellshockonplayerdamage = &on_damage;
}

// Namespace shellshock/shellshock
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x198
// Size: 0x4
function init() {
    
}

// Namespace shellshock/shellshock
// Params 3, eflags: 0x0
// Checksum 0xdfafde90, Offset: 0x1a8
// Size: 0x1b4
function on_damage(cause, damage, weapon) {
    if (self util::isflashbanged()) {
        return;
    }
    if (self.health <= 0) {
        self clientfield::set_to_player("sndMelee", 0);
    }
    if (cause == "MOD_EXPLOSIVE" || cause == "MOD_GRENADE" || cause == "MOD_GRENADE_SPLASH" || cause == "MOD_PROJECTILE" || cause == "MOD_PROJECTILE_SPLASH") {
        if (weapon.explosionradius == 0) {
            return;
        }
        time = 0;
        if (damage >= 90) {
            time = 4;
        } else if (damage >= 50) {
            time = 3;
        } else if (damage >= 25) {
            time = 2;
        } else if (damage > 10) {
            time = 2;
        }
        if (time) {
            if (self util::mayapplyscreeneffect() && self hasperk(#"specialty_flakjacket") == 0) {
                self shellshock(#"frag_grenade_mp", 0.5);
            }
        }
    }
}

// Namespace shellshock/shellshock
// Params 0, eflags: 0x0
// Checksum 0x1285d0c1, Offset: 0x368
// Size: 0x2e
function end_on_death() {
    self waittill(#"death");
    waittillframeend();
    self notify(#"end_explode");
}

// Namespace shellshock/shellshock
// Params 1, eflags: 0x0
// Checksum 0xe24d7c9c, Offset: 0x3a0
// Size: 0x36
function end_on_timer(timer) {
    self endon(#"disconnect");
    wait timer;
    self notify(#"end_on_timer");
}

// Namespace shellshock/shellshock
// Params 1, eflags: 0x0
// Checksum 0xd7b66848, Offset: 0x3e0
// Size: 0x54
function rcbomb_earthquake(position) {
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.5, 0.5, self.origin, 512);
}

// Namespace shellshock/shellshock
// Params 0, eflags: 0x0
// Checksum 0x5b4fc049, Offset: 0x440
// Size: 0x4e
function reset_meleesnd() {
    self endon(#"death");
    wait 6;
    self clientfield::set_to_player("sndMelee", 0);
    self notify(#"snd_melee_end");
}

