#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_perk_deadshot;

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x2
// Checksum 0xe5d62835, Offset: 0x198
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_deadshot", &__init__, undefined, undefined);
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0xee6df852, Offset: 0x1e0
// Size: 0x14
function __init__() {
    enable_deadshot_perk_for_level();
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0x10e40b07, Offset: 0x200
// Size: 0x22c
function enable_deadshot_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_deadshot", #"perk_dead_shot", 2000, #"hash_29881d32839ebaa1", getweapon("zombie_perk_bottle_deadshot"), getweapon("zombie_perk_totem_deadshot"), #"zmperksdeadshot");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_deadshot", #"perk_dead_shot", 2000, #"zombie/perk_deadshot", getweapon("zombie_perk_bottle_deadshot"), getweapon("zombie_perk_totem_deadshot"), #"zmperksdeadshot");
    }
    zm_perks::register_perk_precache_func(#"specialty_deadshot", &deadshot_precache);
    zm_perks::register_perk_clientfields(#"specialty_deadshot", &deadshot_register_clientfield, &deadshot_set_clientfield);
    zm_perks::register_perk_machine(#"specialty_deadshot", &deadshot_perk_machine_setup);
    zm_perks::register_perk_threads(#"specialty_deadshot", &give_deadshot_perk, &take_deadshot_perk);
    zm_perks::register_perk_host_migration_params(#"specialty_deadshot", "vending_deadshot", "deadshot_light");
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0xa86e0d55, Offset: 0x438
// Size: 0x10e
function deadshot_precache() {
    if (isdefined(level.var_bc5f9f6a)) {
        [[ level.var_bc5f9f6a ]]();
        return;
    }
    level._effect[#"deadshot_light"] = #"hash_2225287695ddf9c9";
    level.machine_assets[#"specialty_deadshot"] = spawnstruct();
    level.machine_assets[#"specialty_deadshot"].weapon = getweapon("zombie_perk_bottle_deadshot");
    level.machine_assets[#"specialty_deadshot"].off_model = "p7_zm_vending_ads";
    level.machine_assets[#"specialty_deadshot"].on_model = "p7_zm_vending_ads";
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0x4553153c, Offset: 0x550
// Size: 0x34
function deadshot_register_clientfield() {
    clientfield::register("toplayer", "deadshot_perk", 1, 1, "int");
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 1, eflags: 0x0
// Checksum 0x98b4773d, Offset: 0x590
// Size: 0xc
function deadshot_set_clientfield(state) {
    
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 4, eflags: 0x0
// Checksum 0x9669af76, Offset: 0x5a8
// Size: 0xb6
function deadshot_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_deadshot_jingle";
    use_trigger.script_string = "deadshot_perk";
    use_trigger.script_label = "mus_perks_deadshot_sting";
    use_trigger.target = "vending_deadshot";
    perk_machine.script_string = "deadshot_vending";
    perk_machine.targetname = "vending_deadshot";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "deadshot_vending";
    }
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0xd7ec959c, Offset: 0x668
// Size: 0x24
function give_deadshot_perk() {
    self clientfield::set_to_player("deadshot_perk", 1);
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 4, eflags: 0x0
// Checksum 0x4fdb25e1, Offset: 0x698
// Size: 0x44
function take_deadshot_perk(b_pause, str_perk, str_result, n_slot) {
    self clientfield::set_to_player("deadshot_perk", 0);
}

