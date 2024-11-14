#using scripts\zm_common\util;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

#namespace shellshock;

// Namespace shellshock/shellshock
// Params 0, eflags: 0x2
// Checksum 0xc075584d, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"shellshock", &__init__, undefined, undefined);
}

// Namespace shellshock/shellshock
// Params 0, eflags: 0x1 linked
// Checksum 0x9b9dd0a9, Offset: 0x148
// Size: 0x3e
function __init__() {
    callback::on_start_gametype(&main);
    level.shellshockonplayerdamage = &on_damage;
}

// Namespace shellshock/shellshock
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x190
// Size: 0x4
function main() {
    
}

// Namespace shellshock/shellshock
// Params 3, eflags: 0x1 linked
// Checksum 0x74ab782e, Offset: 0x1a0
// Size: 0x12c
function on_damage(cause, damage, weapon) {
    if (cause == "MOD_EXPLOSIVE" || cause == "MOD_GRENADE" || cause == "MOD_GRENADE_SPLASH" || cause == "MOD_PROJECTILE" || cause == "MOD_PROJECTILE_SPLASH") {
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
            if (self util::mayapplyscreeneffect()) {
                self shellshock(#"frag_grenade_mp", 0.5);
            }
        }
    }
}

// Namespace shellshock/shellshock
// Params 0, eflags: 0x0
// Checksum 0x4d905fec, Offset: 0x2d8
// Size: 0x2e
function endondeath() {
    self waittill(#"death");
    waittillframeend();
    self notify(#"end_explode");
}

// Namespace shellshock/shellshock
// Params 1, eflags: 0x0
// Checksum 0x5f5b8ca0, Offset: 0x310
// Size: 0x36
function endontimer(timer) {
    self endon(#"disconnect");
    wait timer;
    self notify(#"end_on_timer");
}

// Namespace shellshock/shellshock
// Params 1, eflags: 0x0
// Checksum 0x922db713, Offset: 0x350
// Size: 0x54
function rcbomb_earthquake(position) {
    playrumbleonposition("grenade_rumble", position);
    earthquake(0.5, 0.5, self.origin, 512);
}

