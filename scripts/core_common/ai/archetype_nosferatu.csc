#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace archetype_nosferatu;

// Namespace archetype_nosferatu/archetype_nosferatu
// Params 0, eflags: 0x2
// Checksum 0x538cb13a, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"nosferatu", &__init__, undefined, undefined);
}

// Namespace archetype_nosferatu/archetype_nosferatu
// Params 0, eflags: 0x2
// Checksum 0x80f724d1, Offset: 0x108
// Size: 0x4
function autoexec precache() {
    
}

// Namespace archetype_nosferatu/archetype_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0xfb74a1f0, Offset: 0x118
// Size: 0x4c
function __init__() {
    clientfield::register("actor", "nfrtu_leap_melee_rumb", 8000, 1, "counter", &function_5b1f1713, 0, 0);
}

// Namespace archetype_nosferatu/archetype_nosferatu
// Params 7, eflags: 0x1 linked
// Checksum 0x3919cd08, Offset: 0x170
// Size: 0x15c
function function_5b1f1713(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    e_player = function_5c10bd79(localclientnum);
    n_dist = distancesquared(self.origin, e_player.origin);
    var_56cb57e3 = 200 * 200;
    n_scale = (var_56cb57e3 - n_dist) / var_56cb57e3;
    n_scale *= 0.75;
    if (n_scale > 0.01) {
        earthquake(localclientnum, n_scale, 0.1, self.origin, n_dist);
        if (n_scale >= 0.5) {
            function_36e4ebd4(localclientnum, "damage_heavy");
            return;
        }
        function_36e4ebd4(localclientnum, "damage_light");
    }
}

