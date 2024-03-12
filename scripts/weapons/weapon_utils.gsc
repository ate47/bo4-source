// Atian COD Tools GSC decompiler test
#namespace weapon_utils;

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x4a1ad897, Offset: 0x128
// Size: 0x1e
function ispistol(weapon) {
    return isdefined(level.side_arm_array[weapon]);
}

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xf83614a9, Offset: 0x150
// Size: 0x28
function isflashorstunweapon(weapon) {
    return weapon.isflash || weapon.isstun;
}

// Namespace weapon_utils/weapon_utils
// Params 2, eflags: 0x1 linked
// Checksum 0x618b7ebe, Offset: 0x180
// Size: 0x50
function isflashorstundamage(weapon, meansofdeath) {
    return isflashorstunweapon(weapon) && (meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_GAS");
}

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xb1ad4896, Offset: 0x1d8
// Size: 0x3e
function ismeleemod(mod) {
    return mod === "MOD_MELEE" || mod === "MOD_MELEE_WEAPON_BUTT" || mod === "MOD_MELEE_ASSASSINATE";
}

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x675da21, Offset: 0x220
// Size: 0x74
function isexplosivedamage(meansofdeath) {
    switch (meansofdeath) {
    case #"mod_explosive":
    case #"mod_grenade":
    case #"mod_projectile":
    case #"mod_grenade_splash":
    case #"mod_projectile_splash":
        return 1;
    }
    return 0;
}

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x9b79c00f, Offset: 0x2a0
// Size: 0x3e
function ispunch(weapon) {
    return weapon.type == "melee" && weapon.statname == #"bare_hands";
}

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x0
// Checksum 0x6b815c8d, Offset: 0x2e8
// Size: 0x46
function isknife(weapon) {
    return weapon.type == "melee" && weapon.rootweapon.name == #"knife_loadout";
}

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x0
// Checksum 0x9a4e62bc, Offset: 0x338
// Size: 0x46
function isnonbarehandsmelee(weapon) {
    return weapon.type == "melee" && weapon.rootweapon.name != #"bare_hands";
}

// Namespace weapon_utils/weapon_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x36e94f65, Offset: 0x388
// Size: 0x3e
function isbulletdamage(meansofdeath) {
    return meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_HEAD_SHOT";
}

// Namespace weapon_utils/weapon_utils
// Params 2, eflags: 0x1 linked
// Checksum 0xe8cccb66, Offset: 0x3d0
// Size: 0x78
function isfiredamage(weapon, meansofdeath) {
    if (weapon.doesfiredamage && (meansofdeath == "MOD_BURNED" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_DOT")) {
        return 1;
    }
    return 0;
}

