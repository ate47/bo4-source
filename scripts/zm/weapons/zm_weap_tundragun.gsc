#using scripts\zm\zm_orange_water.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_weap_tundragun;

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 0, eflags: 0x2
// Checksum 0x51de58df, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_weap_tundragun", &__init__, &__main__, undefined);
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 0, eflags: 0x1 linked
// Checksum 0x4cc6789b, Offset: 0xd8
// Size: 0x56
function __init__() {
    level.w_tundragun = getweapon(#"tundragun");
    level.w_tundragun_upgraded = getweapon(#"tundragun_upgraded");
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 0, eflags: 0x1 linked
// Checksum 0x1fe7bb9d, Offset: 0x138
// Size: 0x64
function __main__() {
    zm::function_84d343d(#"tundragun", &actor_damage_override);
    zm::function_84d343d(#"tundragun_upgraded", &actor_damage_override);
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 12, eflags: 0x1 linked
// Checksum 0x54aaf5bd, Offset: 0x1a8
// Size: 0xba
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (self.var_6f84b820 === #"basic" || self.var_6f84b820 === #"popcorn") {
        self.water_damage = 1;
        return (self.health + 666);
    }
    return damage;
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 0, eflags: 0x4
// Checksum 0x37e38fba, Offset: 0x270
// Size: 0x52
function private function_4baa4ca1() {
    var_648864c9 = 0;
    if (isdefined(self)) {
        var_648864c9 = self.no_gib;
        self.no_gib = 1;
    }
    wait(0.1);
    if (isdefined(self)) {
        self.no_gib = var_648864c9;
    }
}

