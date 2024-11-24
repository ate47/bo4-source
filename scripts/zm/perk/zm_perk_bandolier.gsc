#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\trials\zm_trial_reset_loadout;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_bandolier;

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x2
// Checksum 0x728b343c, Offset: 0x150
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_bandolier", &__init__, undefined, undefined);
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0x3b8762f5, Offset: 0x198
// Size: 0x14
function __init__() {
    function_27473e44();
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0xd1f47881, Offset: 0x1b8
// Size: 0x194
function function_27473e44() {
    zm_perks::register_perk_basic_info(#"specialty_extraammo", #"perk_bandolier", 3000, #"zombie/perk_bandolier", getweapon("zombie_perk_bottle_bandolier"), getweapon("zombie_perk_totem_bandolier"), #"zmperksbandolier");
    zm_perks::register_perk_precache_func(#"specialty_extraammo", &perk_precache);
    zm_perks::register_perk_clientfields(#"specialty_extraammo", &perk_register_clientfield, &perk_set_clientfield);
    zm_perks::register_perk_machine(#"specialty_extraammo", &perk_machine_setup);
    zm_perks::register_perk_host_migration_params(#"specialty_extraammo", "vending_bandolier", "sleight_light");
    zm_perks::register_perk_threads(#"specialty_extraammo", &give_perk, &take_perk);
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0xacd5566c, Offset: 0x358
// Size: 0xe6
function perk_precache() {
    if (isdefined(level.var_51552992)) {
        [[ level.var_51552992 ]]();
        return;
    }
    level.machine_assets[#"specialty_extraammo"] = spawnstruct();
    level.machine_assets[#"specialty_extraammo"].weapon = getweapon("zombie_perk_bottle_bandolier");
    level.machine_assets[#"specialty_extraammo"].off_model = "p7_zm_vending_sleight";
    level.machine_assets[#"specialty_extraammo"].on_model = "p7_zm_vending_sleight";
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x448
// Size: 0x4
function perk_register_clientfield() {
    
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 1, eflags: 0x1 linked
// Checksum 0x93608f67, Offset: 0x458
// Size: 0xc
function perk_set_clientfield(state) {
    
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 4, eflags: 0x1 linked
// Checksum 0x9d0adbf2, Offset: 0x470
// Size: 0xb6
function perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_speed_jingle";
    use_trigger.script_string = "bandolier_perk";
    use_trigger.script_label = "mus_perks_speed_sting";
    use_trigger.target = "vending_bandolier";
    perk_machine.script_string = "bandolier_perk";
    perk_machine.targetname = "vending_bandolier";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "bandolier_perk";
    }
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0xa07e3f9c, Offset: 0x530
// Size: 0x1c
function give_perk() {
    self set_ammo();
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 4, eflags: 0x1 linked
// Checksum 0xe8e0620, Offset: 0x558
// Size: 0x3c
function take_perk(b_pause, str_perk, str_result, n_slot) {
    self set_ammo(0);
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 1, eflags: 0x1 linked
// Checksum 0x97cb415f, Offset: 0x5a0
// Size: 0x1e0
function set_ammo(b_max_ammo = 1) {
    a_weapons = self getweaponslistprimaries();
    foreach (weapon in a_weapons) {
        if (weaponhasattachment(weapon, "uber") && weapon.statname == #"smg_capacity_t8") {
            continue;
        }
        if (weapon !== self.laststandpistol) {
            if (b_max_ammo) {
                var_67f27715 = weapon.maxammo - weapon.startammo;
                var_45193587 = self getweaponammostock(weapon);
                if (zm_trial_reset_loadout::is_active(1)) {
                    var_88f48290 = 0;
                } else {
                    var_88f48290 = var_45193587 + var_67f27715;
                }
                self setweaponammostock(weapon, var_88f48290);
                continue;
            }
            if (self getweaponammostock(weapon) > weapon.startammo) {
                self setweaponammostock(weapon, weapon.startammo);
            }
        }
    }
}

