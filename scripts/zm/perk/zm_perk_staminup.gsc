// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_perk_staminup;

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x2
// Checksum 0xfc9e3120, Offset: 0x198
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_staminup", &__init__, undefined, undefined);
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0xd6be5f95, Offset: 0x1e0
// Size: 0x14
function __init__() {
    enable_staminup_perk_for_level();
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0x1dba9add, Offset: 0x200
// Size: 0x1ec
function enable_staminup_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_staminup", #"perk_staminup", 2000, #"hash_26af21c3b4413875", getweapon("zombie_perk_bottle_marathon"), getweapon("zombie_perk_totem_staminup"), #"zmperksstaminup");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_staminup", #"perk_staminup", 2000, #"zombie/perk_marathon", getweapon("zombie_perk_bottle_marathon"), getweapon("zombie_perk_totem_staminup"), #"zmperksstaminup");
    }
    zm_perks::register_perk_precache_func(#"specialty_staminup", &staminup_precache);
    zm_perks::register_perk_clientfields(#"specialty_staminup", &staminup_register_clientfield, &staminup_set_clientfield);
    zm_perks::register_perk_machine(#"specialty_staminup", &staminup_perk_machine_setup);
    zm_perks::register_perk_host_migration_params(#"specialty_staminup", "vending_marathon", "marathon_light");
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0x18c16e5b, Offset: 0x3f8
// Size: 0x106
function staminup_precache() {
    if (isdefined(level.var_cf57ff63)) {
        [[ level.var_cf57ff63 ]]();
        return;
    }
    level._effect[#"marathon_light"] = "zombie/fx_perk_stamin_up_zmb";
    level.machine_assets[#"specialty_staminup"] = spawnstruct();
    level.machine_assets[#"specialty_staminup"].weapon = getweapon("zombie_perk_bottle_marathon");
    level.machine_assets[#"specialty_staminup"].off_model = "p7_zm_vending_marathon";
    level.machine_assets[#"specialty_staminup"].on_model = "p7_zm_vending_marathon";
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x508
// Size: 0x4
function staminup_register_clientfield() {
    
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 1, eflags: 0x1 linked
// Checksum 0x81d75c1e, Offset: 0x518
// Size: 0xc
function staminup_set_clientfield(state) {
    
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 4, eflags: 0x1 linked
// Checksum 0xace3498b, Offset: 0x530
// Size: 0xb6
function staminup_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_stamin_jingle";
    use_trigger.script_string = "marathon_perk";
    use_trigger.script_label = "mus_perks_stamin_sting";
    use_trigger.target = "vending_marathon";
    perk_machine.script_string = "marathon_perk";
    perk_machine.targetname = "vending_marathon";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "marathon_perk";
    }
}

