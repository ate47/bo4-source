#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_stats;

#namespace zm_bgb_sword_flay;

// Namespace zm_bgb_sword_flay/zm_bgb_sword_flay
// Params 0, eflags: 0x2
// Checksum 0x2e48123f, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_sword_flay", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_sword_flay/zm_bgb_sword_flay
// Params 0, eflags: 0x0
// Checksum 0xf36034d9, Offset: 0xe8
// Size: 0xd4
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_sword_flay", "time", 60, &enable, &disable, undefined);
    bgb::register_actor_damage_override(#"zm_bgb_sword_flay", &actor_damage_override);
    bgb::register_vehicle_damage_override(#"zm_bgb_sword_flay", &vehicle_damage_override);
}

// Namespace zm_bgb_sword_flay/zm_bgb_sword_flay
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x1c8
// Size: 0x4
function enable() {
    
}

// Namespace zm_bgb_sword_flay/zm_bgb_sword_flay
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x1d8
// Size: 0x4
function disable() {
    
}

// Namespace zm_bgb_sword_flay/zm_bgb_sword_flay
// Params 12, eflags: 0x0
// Checksum 0x48a60f12, Offset: 0x1e8
// Size: 0x12e
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (meansofdeath === "MOD_MELEE" && weapon != level.weaponnone) {
        if (isalive(self)) {
            switch (self.zm_ai_category) {
            case #"popcorn":
            case #"basic":
            case #"enhanced":
                damage = self.health + damage * 5;
                break;
            default:
                damage *= 5;
                break;
            }
        }
    }
    return damage;
}

// Namespace zm_bgb_sword_flay/zm_bgb_sword_flay
// Params 15, eflags: 0x0
// Checksum 0x5988b8c7, Offset: 0x320
// Size: 0xa0
function vehicle_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (smeansofdeath === "MOD_MELEE") {
        idamage *= 5;
    }
    return idamage;
}

