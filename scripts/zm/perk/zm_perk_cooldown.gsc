#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\util;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace zm_perk_cooldown;

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x2
// Checksum 0x37d0cc64, Offset: 0x178
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_cooldown", &__init__, &__main__, undefined);
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x7b7a7177, Offset: 0x1c8
// Size: 0x14
function __init__() {
    enable_cooldown_perk_for_level();
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1e8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x20bd7a96, Offset: 0x1f8
// Size: 0x23c
function enable_cooldown_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_cooldown", #"perk_cooldown", 1500, #"hash_1bf5482d3d2bee30", getweapon("zombie_perk_bottle_cooldown"), getweapon("zombie_perk_totem_timeslip"), #"zmperkscooldown");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_cooldown", #"perk_cooldown", 1500, #"zombie/perk_cooldown", getweapon("zombie_perk_bottle_cooldown"), getweapon("zombie_perk_totem_timeslip"), #"zmperkscooldown");
    }
    zm_perks::register_perk_precache_func(#"specialty_cooldown", &function_14afd300);
    zm_perks::register_perk_clientfields(#"specialty_cooldown", &function_eaa4f1a1, &function_bfc02d23);
    zm_perks::register_perk_machine(#"specialty_cooldown", &function_cf203b00, &init_cooldown);
    zm_perks::register_perk_host_migration_params(#"specialty_cooldown", "p7_zm_vending_nuke", "divetonuke_light");
    zm_perks::register_perk_threads(#"specialty_cooldown", &function_44cf89d3, &function_d0623d8c);
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x440
// Size: 0x4
function init_cooldown() {
    
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x5fc47951, Offset: 0x450
// Size: 0x10e
function function_14afd300() {
    if (isdefined(level.var_8ba0e035)) {
        [[ level.var_8ba0e035 ]]();
        return;
    }
    level._effect[#"divetonuke_light"] = #"hash_2225287695ddf9c9";
    level.machine_assets[#"specialty_cooldown"] = spawnstruct();
    level.machine_assets[#"specialty_cooldown"].weapon = getweapon("zombie_perk_bottle_cooldown");
    level.machine_assets[#"specialty_cooldown"].off_model = "p7_zm_vending_nuke";
    level.machine_assets[#"specialty_cooldown"].on_model = "p7_zm_vending_nuke";
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x568
// Size: 0x4
function function_eaa4f1a1() {
    
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 1, eflags: 0x1 linked
// Checksum 0x2d9d8b63, Offset: 0x578
// Size: 0xc
function function_bfc02d23(state) {
    
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 4, eflags: 0x1 linked
// Checksum 0xf703117c, Offset: 0x590
// Size: 0xb6
function function_cf203b00(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_phd_jingle";
    use_trigger.script_string = "divetonuke_perk";
    use_trigger.script_label = "mus_perks_phd_sting";
    use_trigger.target = "vending_divetonuke";
    perk_machine.script_string = "divetonuke_perk";
    perk_machine.targetname = "vending_divetonuke";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "divetonuke_perk";
    }
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x0
// Checksum 0x98f65b8f, Offset: 0x650
// Size: 0x32
function function_8ba0e035() {
    level._effect[#"divetonuke_light"] = #"hash_2225287695ddf9c9";
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x690
// Size: 0x4
function function_44cf89d3() {
    
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 4, eflags: 0x1 linked
// Checksum 0x2a783576, Offset: 0x6a0
// Size: 0x24
function function_d0623d8c(b_pause, str_perk, str_result, n_slot) {
    
}

