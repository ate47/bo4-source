#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_hero_weapon_power;

// Namespace zm_powerup_hero_weapon_power/zm_powerup_hero_weapon_power
// Params 0, eflags: 0x2
// Checksum 0x935496b4, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_hero_weapon_power", &__init__, undefined, undefined);
}

// Namespace zm_powerup_hero_weapon_power/zm_powerup_hero_weapon_power
// Params 0, eflags: 0x1 linked
// Checksum 0xe9750827, Offset: 0x158
// Size: 0x84
function __init__() {
    zm_powerups::register_powerup("hero_weapon_power", &hero_weapon_power);
    if (zm_powerups::function_cc33adc8()) {
        zm_powerups::add_zombie_powerup("hero_weapon_power", "p8_zm_powerup_full_power", #"zombie_powerup_free_perk", &function_7e51ac0f, 1, 0, 0);
    }
}

// Namespace zm_powerup_hero_weapon_power/zm_powerup_hero_weapon_power
// Params 0, eflags: 0x1 linked
// Checksum 0x43a91667, Offset: 0x1e8
// Size: 0xe
function function_7e51ac0f() {
    return level.var_ff96c5e4;
}

// Namespace zm_powerup_hero_weapon_power/zm_powerup_hero_weapon_power
// Params 1, eflags: 0x1 linked
// Checksum 0xb7f1552f, Offset: 0x200
// Size: 0xd4
function hero_weapon_power(e_player) {
    e_player endon(#"death");
    if (isdefined(self.var_1f23fe79) && self.var_1f23fe79) {
        self waittill(#"hash_3eaa776332738598");
    }
    if (isdefined(self.var_c2bcd604) && self.var_c2bcd604) {
        e_player gadgetpowerchange(level.var_a53a05b5, self.var_c2bcd604);
    } else {
        e_player gadgetpowerset(level.var_a53a05b5, 100);
    }
    e_player thread function_5792ec16();
}

// Namespace zm_powerup_hero_weapon_power/zm_powerup_hero_weapon_power
// Params 0, eflags: 0x5 linked
// Checksum 0xfa9a513b, Offset: 0x2e0
// Size: 0x42
function private function_5792ec16() {
    self endon(#"disconnect");
    self.var_c09e6d59 = 1;
    wait(2);
    self.var_c09e6d59 = undefined;
}

