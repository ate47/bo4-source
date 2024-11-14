#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_bgb;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\aat_shared;
#using scripts\core_common\struct;

#namespace zm_bgb_bullet_boost;

// Namespace zm_bgb_bullet_boost/zm_bgb_bullet_boost
// Params 0, eflags: 0x2
// Checksum 0xf20931d3, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_bullet_boost", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_bullet_boost/zm_bgb_bullet_boost
// Params 0, eflags: 0x1 linked
// Checksum 0xdf496373, Offset: 0x120
// Size: 0x94
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_bullet_boost", "activated", 1, undefined, undefined, &validation, &activation);
    bgb::function_e1f37ce7(#"zm_bgb_bullet_boost");
}

// Namespace zm_bgb_bullet_boost/zm_bgb_bullet_boost
// Params 0, eflags: 0x1 linked
// Checksum 0x74a8e8e9, Offset: 0x1c0
// Size: 0xda
function validation() {
    current_weapon = self getcurrentweapon();
    if (!zm_weapons::is_weapon_or_base_included(current_weapon) || !self zm_magicbox::can_buy_weapon() || self laststand::player_is_in_laststand() || isdefined(self.intermission) && self.intermission || self isthrowinggrenade() || self isswitchingweapons() || !zm_weapons::weapon_supports_aat(current_weapon)) {
        return false;
    }
    return true;
}

// Namespace zm_bgb_bullet_boost/zm_bgb_bullet_boost
// Params 0, eflags: 0x1 linked
// Checksum 0x184099a0, Offset: 0x2a8
// Size: 0xbc
function activation() {
    self endon(#"death");
    self playsoundtoplayer(#"zmb_bgb_bullet_boost", self);
    current_weapon = self getcurrentweapon();
    current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
    var_9a9544b8 = self aat::getaatonweapon(current_weapon, 1);
    self aat::acquire(current_weapon, undefined, var_9a9544b8);
}

