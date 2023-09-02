// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_perk_death_perception;

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x2
// Checksum 0x831764c8, Offset: 0x178
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_death_perception", &__init__, &__main__, undefined);
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0xd77f1669, Offset: 0x1c8
// Size: 0x14
function __init__() {
    enable_death_perception_perk_for_level();
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1e8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x6234173c, Offset: 0x1f8
// Size: 0x23c
function enable_death_perception_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_awareness", #"perk_death_perception", 2000, #"hash_237b1e920f98800b", getweapon("zombie_perk_bottle_death_perception"), getweapon("zombie_perk_totem_death_perception"), #"zmperksdeathperception");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_awareness", #"perk_death_perception", 2000, #"hash_44056ea72a6d4fd5", getweapon("zombie_perk_bottle_death_perception"), getweapon("zombie_perk_totem_death_perception"), #"zmperksdeathperception");
    }
    zm_perks::register_perk_precache_func(#"specialty_awareness", &function_f9d745da);
    zm_perks::register_perk_clientfields(#"specialty_awareness", &function_14ab8b5c, &function_a19424cd);
    zm_perks::register_perk_machine(#"specialty_awareness", &function_6bdb193c, &function_9b484511);
    zm_perks::register_perk_host_migration_params(#"specialty_awareness", "p7_zm_vending_nuke", "divetonuke_light");
    zm_perks::register_perk_threads(#"specialty_awareness", &function_79d54e51, &function_86a6368e);
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x440
// Size: 0x4
function function_9b484511() {
    
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x6d04443f, Offset: 0x450
// Size: 0xbe
function function_f9d745da() {
    level.machine_assets[#"specialty_awareness"] = spawnstruct();
    level.machine_assets[#"specialty_awareness"].weapon = getweapon("zombie_perk_bottle_death_perception");
    level.machine_assets[#"specialty_awareness"].off_model = "p7_zm_vending_nuke";
    level.machine_assets[#"specialty_awareness"].on_model = "p7_zm_vending_nuke";
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x257c8e4d, Offset: 0x518
// Size: 0x34
function function_14ab8b5c() {
    clientfield::register("toplayer", "perk_death_perception_visuals", 1, 1, "int");
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 1, eflags: 0x1 linked
// Checksum 0xbd453fa6, Offset: 0x558
// Size: 0xc
function function_a19424cd(state) {
    
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 4, eflags: 0x1 linked
// Checksum 0xa227d54c, Offset: 0x570
// Size: 0xb6
function function_6bdb193c(use_trigger, perk_machine, bump_trigger, collision) {
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

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x262f20f5, Offset: 0x630
// Size: 0x24
function function_79d54e51() {
    self clientfield::set_to_player("perk_death_perception_visuals", 1);
}

// Namespace zm_perk_death_perception/zm_perk_death_perception
// Params 4, eflags: 0x1 linked
// Checksum 0xbea11a1a, Offset: 0x660
// Size: 0x44
function function_86a6368e(b_pause, str_perk, str_result, n_slot) {
    self clientfield::set_to_player("perk_death_perception_visuals", 0);
}

