// Atian COD Tools GSC decompiler test
#namespace loadout;

// Namespace loadout/loadout_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x90341517, Offset: 0x90
// Size: 0xe
function is_warlord_perk(itemindex) {
    return false;
}

// Namespace loadout/loadout_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd21da6e3, Offset: 0xa8
// Size: 0x78
function is_item_excluded(itemindex) {
    if (!level.onlinegame) {
        return false;
    }
    numexclusions = level.itemexclusions.size;
    for (exclusionindex = 0; exclusionindex < numexclusions; exclusionindex++) {
        if (itemindex == level.itemexclusions[exclusionindex]) {
            return true;
        }
    }
    return false;
}

// Namespace loadout/loadout_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x473f1b0b, Offset: 0x128
// Size: 0x72
function getloadoutitemfromddlstats(customclassnum, loadoutslot) {
    itemindex = self getloadoutitem(customclassnum, loadoutslot);
    if (is_item_excluded(itemindex) && !is_warlord_perk(itemindex)) {
        return 0;
    }
    return itemindex;
}

// Namespace loadout/loadout_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1540300d, Offset: 0x1a8
// Size: 0x22
function initweaponattachments(weapon) {
    self.currentweaponstarttime = gettime();
    self.currentweapon = weapon;
}

// Namespace loadout/loadout_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc149748f, Offset: 0x1d8
// Size: 0x2a
function isprimarydamage(meansofdeath) {
    return meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET";
}

// Namespace loadout/loadout_shared
// Params 6, eflags: 0x1 linked
// Checksum 0x791bc692, Offset: 0x210
// Size: 0x1f2
function cac_modified_vehicle_damage(victim, attacker, damage, meansofdeath, weapon, inflictor) {
    if (!isdefined(victim) || !isdefined(attacker) || !isplayer(attacker)) {
        return damage;
    }
    if (!isdefined(damage) || !isdefined(meansofdeath) || !isdefined(weapon)) {
        return damage;
    }
    old_damage = damage;
    final_damage = damage;
    if (attacker hasperk(#"specialty_bulletdamage") && isprimarydamage(meansofdeath)) {
        final_damage = damage * (100 + level.cac_bulletdamage_data) / 100;
        /#
            if (getdvarint(#"scr_perkdebug", 0)) {
                println("<unknown string>" + attacker.name + "<unknown string>");
            }
        #/
    } else {
        final_damage = old_damage;
    }
    /#
        if (getdvarint(#"scr_perkdebug", 0)) {
            println("<unknown string>" + final_damage / old_damage + "<unknown string>" + old_damage + "<unknown string>" + final_damage);
        }
    #/
    return int(final_damage);
}

// Namespace loadout/loadout_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd52f46f0, Offset: 0x410
// Size: 0xb4
function function_3ba6ee5d(weapon, amount) {
    if (weapon.iscliponly) {
        self setweaponammoclip(weapon, amount);
        return;
    }
    self setweaponammoclip(weapon, amount);
    diff = amount - self getweaponammoclip(weapon);
    /#
        assert(diff >= 0);
    #/
    self setweaponammostock(weapon, diff);
}

