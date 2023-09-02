// Atian COD Tools GSC decompiler test
#using scripts\zm\perk\zm_perk_mod_additionalprimaryweapon.gsc;
#using scripts\zm_common\trials\zm_trial_disable_perks.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_perk_additionalprimaryweapon;

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x2
// Checksum 0xccdd328a, Offset: 0x238
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_additionalprimaryweapon", &__init__, undefined, undefined);
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x15f7869c, Offset: 0x280
// Size: 0x24
function __init__() {
    level.additionalprimaryweapon_limit = 3;
    enable_additional_primary_weapon_perk_for_level();
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x91a2f2e6, Offset: 0x2b0
// Size: 0x22c
function enable_additional_primary_weapon_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_additionalprimaryweapon", #"perk_additional_primary_weapon", 4000, #"hash_3010c651fdffa112", getweapon("zombie_perk_bottle_additionalprimaryweapon"), getweapon("zombie_perk_totem_mule_kick"), #"zmperksmulekick");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_additionalprimaryweapon", #"perk_additional_primary_weapon", 4000, #"zombie/perk_additionalprimaryweapon", getweapon("zombie_perk_bottle_additionalprimaryweapon"), getweapon("zombie_perk_totem_mule_kick"), #"zmperksmulekick");
    }
    zm_perks::register_perk_precache_func(#"specialty_additionalprimaryweapon", &additional_primary_weapon_precache);
    zm_perks::register_perk_clientfields(#"specialty_additionalprimaryweapon", &additional_primary_weapon_register_clientfield, &additional_primary_weapon_set_clientfield);
    zm_perks::register_perk_machine(#"specialty_additionalprimaryweapon", &additional_primary_weapon_perk_machine_setup);
    zm_perks::register_perk_threads(#"specialty_additionalprimaryweapon", &give_additional_primary_weapon_perk, &take_additional_primary_weapon_perk);
    zm_perks::register_perk_host_migration_params(#"specialty_additionalprimaryweapon", "vending_additionalprimaryweapon", "additionalprimaryweapon_light");
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0xb6eed8ac, Offset: 0x4e8
// Size: 0x106
function additional_primary_weapon_precache() {
    if (isdefined(level.var_525672d4)) {
        [[ level.var_525672d4 ]]();
        return;
    }
    level._effect[#"additionalprimaryweapon_light"] = "zombie/fx_perk_mule_kick_zmb";
    level.machine_assets[#"specialty_additionalprimaryweapon"] = spawnstruct();
    level.machine_assets[#"specialty_additionalprimaryweapon"].weapon = getweapon("zombie_perk_bottle_additionalprimaryweapon");
    level.machine_assets[#"specialty_additionalprimaryweapon"].off_model = "p7_zm_vending_three_gun";
    level.machine_assets[#"specialty_additionalprimaryweapon"].on_model = "p7_zm_vending_three_gun";
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x2dd5bd5a, Offset: 0x5f8
// Size: 0x2c
function additional_primary_weapon_register_clientfield() {
    clientfield::register_clientuimodel("hudItems.perks.additional_primary_weapon", 1, 2, "int", 0);
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 1, eflags: 0x1 linked
// Checksum 0xd14592b1, Offset: 0x630
// Size: 0xc
function additional_primary_weapon_set_clientfield(state) {
    
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 4, eflags: 0x1 linked
// Checksum 0xccb391f3, Offset: 0x648
// Size: 0xb6
function additional_primary_weapon_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_mulekick_jingle";
    use_trigger.script_string = "tap_perk";
    use_trigger.script_label = "mus_perks_mulekick_sting";
    use_trigger.target = "vending_additionalprimaryweapon";
    perk_machine.script_string = "tap_perk";
    perk_machine.targetname = "vending_additionalprimaryweapon";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "tap_perk";
    }
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x4f21b11d, Offset: 0x708
// Size: 0x34
function give_additional_primary_weapon_perk() {
    self thread function_1a9f3a91();
    self function_61446ba9();
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 4, eflags: 0x1 linked
// Checksum 0xf2366f2a, Offset: 0x748
// Size: 0x2e4
function take_additional_primary_weapon_perk(b_pause, str_perk, str_result, n_slot) {
    self notify(#"hash_4dba2ff9e70127f5");
    if (isdefined(self.laststandpistol)) {
        self endon(#"disconnect", #"hash_499749b8848c21fd");
        if (self.laststandpistol !== self.var_2a62e678) {
            self clientfield::set_player_uimodel("hudItems.perks.additional_primary_weapon", 0);
        }
        self waittill(#"hash_9b426cce825928d");
    }
    if (isdefined(self.var_2a62e678) && self hasweapon(self.var_2a62e678)) {
        var_3ba4bf7d = self getweaponslistprimaries();
        var_287a8343 = zm_utility::get_player_weapon_limit(self);
        if (var_3ba4bf7d.size > var_287a8343) {
            if (zm_perks::function_e56d8ef4(#"specialty_additionalprimaryweapon") && !zm_trial_disable_perks::is_active()) {
                self clientfield::set_player_uimodel("hudItems.perks.additional_primary_weapon", 0);
                return;
            }
            if (isdefined(self.var_dd1b11fe) && self.var_dd1b11fe && zm_perk_mod_additionalprimaryweapon::function_23c3c9db(self.var_2a62e678)) {
                self.var_11b895b8 = {#var_80c3ca2:self.aat[self.var_2a62e678], #var_2d5dec87:self zm_weapons::get_player_weapondata(self.var_2a62e678)};
                self.var_dd1b11fe = undefined;
            }
            if (self.var_2a62e678 == self getcurrentweapon() && var_3ba4bf7d.size > 1) {
                self switchtoweapon();
            }
            self takeweapon(self.var_2a62e678);
        }
    } else if (isdefined(self)) {
        self thread zm_player::function_de3936f8();
    }
    self.var_2a62e678 = undefined;
    self.var_64f51f65 = undefined;
    self clientfield::set_player_uimodel("hudItems.perks.additional_primary_weapon", 0);
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0xabf7fcdc, Offset: 0xa38
// Size: 0x2b8
function function_1a9f3a91() {
    self notify(#"hash_499749b8848c21fd");
    self endon(#"disconnect", #"hash_4dba2ff9e70127f5", #"hash_499749b8848c21fd");
    while (isdefined(self.s_loadout)) {
        wait(0.05);
    }
    var_3ba4bf7d = self getweaponslistprimaries();
    if (var_3ba4bf7d.size < level.additionalprimaryweapon_limit) {
        self.var_2a62e678 = undefined;
        self.var_64f51f65 = undefined;
    }
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"weapon_change", #"hash_29c66728ccd27f03");
        if (isdefined(self.laststandpistol)) {
            self clientfield::set_player_uimodel("hudItems.perks.additional_primary_weapon", 0);
            continue;
        }
        if (s_result.weapon !== level.weaponnone && !isinarray(var_3ba4bf7d, s_result.weapon)) {
            var_b13885a = self getweaponslistprimaries();
            if (var_b13885a.size >= level.additionalprimaryweapon_limit) {
                if (!isdefined(self.var_2a62e678) && var_b13885a.size > var_3ba4bf7d.size) {
                    self.var_2a62e678 = s_result.weapon;
                } else if (isdefined(self.var_2a62e678) && !isinarray(var_b13885a, self.var_2a62e678)) {
                    self.var_2a62e678 = s_result.weapon;
                }
                if (self.var_67ba1237.size && isinarray(self.var_67ba1237, #"specialty_additionalprimaryweapon")) {
                    self.var_64f51f65 = self.var_2a62e678;
                }
            }
            var_3ba4bf7d = var_b13885a;
        }
        if (isdefined(self.var_2a62e678) && self.var_2a62e678 == self getcurrentweapon()) {
            self clientfield::set_player_uimodel("hudItems.perks.additional_primary_weapon", 1);
        } else {
            self clientfield::set_player_uimodel("hudItems.perks.additional_primary_weapon", 0);
        }
    }
}

// Namespace zm_perk_additionalprimaryweapon/zm_perk_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x1e7180ca, Offset: 0xcf8
// Size: 0x6e
function function_61446ba9() {
    if (isdefined(self.var_11b895b8)) {
        var_2d5dec87 = self.var_11b895b8.var_2d5dec87;
        var_80c3ca2 = self.var_11b895b8.var_80c3ca2;
        self.var_11b895b8 = undefined;
        weapon = zm_weapons::weapondata_give(var_2d5dec87);
    }
}

