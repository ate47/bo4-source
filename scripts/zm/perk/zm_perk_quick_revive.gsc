#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_perk_quick_revive;

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x2
// Checksum 0x5443f863, Offset: 0x208
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_quick_revive", &__init__, undefined, undefined);
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x74469f86, Offset: 0x250
// Size: 0x14
function __init__() {
    enable_quick_revive_perk_for_level();
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x9b7d07, Offset: 0x270
// Size: 0x25c
function enable_quick_revive_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_quickrevive", #"perk_quick_revive", 2000, #"hash_1fe09aea69fefa7", getweapon("zombie_perk_bottle_revive"), getweapon("zombie_perk_totem_quick_revive"), #"zmperksquickrevive");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_quickrevive", #"perk_quick_revive", 2000, #"zombie/perk_quickrevive", getweapon("zombie_perk_bottle_revive"), getweapon("zombie_perk_totem_quick_revive"), #"zmperksquickrevive");
    }
    zm_perks::register_perk_precache_func(#"specialty_quickrevive", &quick_revive_precache);
    zm_perks::register_perk_clientfields(#"specialty_quickrevive", &quick_revive_register_clientfield, &quick_revive_set_clientfield);
    zm_perks::register_perk_machine(#"specialty_quickrevive", &quick_revive_perk_machine_setup);
    zm_perks::register_perk_threads(#"specialty_quickrevive", &give_quick_revive_perk, &take_quick_revive_perk);
    zm_perks::register_perk_host_migration_params(#"specialty_quickrevive", "vending_revive", "revive_light");
    zm_perks::register_perk_machine_power_override(#"specialty_quickrevive", &turn_revive_on);
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0xd1c8c5f7, Offset: 0x4d8
// Size: 0x10e
function quick_revive_precache() {
    if (isdefined(level.var_88d522c3)) {
        [[ level.var_88d522c3 ]]();
        return;
    }
    level._effect[#"revive_light"] = #"zombie/fx_perk_quick_revive_zmb";
    level.machine_assets[#"specialty_quickrevive"] = spawnstruct();
    level.machine_assets[#"specialty_quickrevive"].weapon = getweapon("zombie_perk_bottle_revive");
    level.machine_assets[#"specialty_quickrevive"].off_model = "p7_zm_vending_revive";
    level.machine_assets[#"specialty_quickrevive"].on_model = "p7_zm_vending_revive";
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x5f0
// Size: 0x4
function quick_revive_register_clientfield() {
    
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 1, eflags: 0x1 linked
// Checksum 0xfc75ff99, Offset: 0x600
// Size: 0xc
function quick_revive_set_clientfield(state) {
    
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 4, eflags: 0x1 linked
// Checksum 0x17b7c704, Offset: 0x618
// Size: 0xb6
function quick_revive_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_revive_jingle";
    use_trigger.script_string = "revive_perk";
    use_trigger.script_label = "mus_perks_revive_sting";
    use_trigger.target = "vending_revive";
    perk_machine.script_string = "revive_perk";
    perk_machine.targetname = "vending_revive";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "revive_perk";
    }
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x485fa99a, Offset: 0x6d8
// Size: 0x5c2
function turn_revive_on() {
    level endon(#"stop_quickrevive_logic");
    level flag::wait_till("start_zombie_round_logic");
    while (true) {
        machine = getentarray("vending_revive", "targetname");
        machine_triggers = getentarray("vending_revive", "target");
        for (i = 0; i < machine.size; i++) {
            machine[i] setmodel(level.machine_assets[#"specialty_quickrevive"].off_model);
            if (isdefined(level.quick_revive_final_pos)) {
                level.quick_revive_default_origin = level.quick_revive_final_pos;
            }
            if (!isdefined(level.quick_revive_default_origin)) {
                level.quick_revive_default_origin = machine[i].origin;
                level.quick_revive_default_angles = machine[i].angles;
            }
            level.quick_revive_machine = machine[i];
        }
        array::thread_all(machine, &zm_perks::set_power_on, 0);
        for (i = 0; i < machine.size; i++) {
            if (isdefined(machine[i].classname) && machine[i].classname == "script_model") {
                if (isdefined(machine[i].script_noteworthy) && machine[i].script_noteworthy == "clip") {
                    machine_clip = machine[i];
                    continue;
                }
                machine[i] setmodel(level.machine_assets[#"specialty_quickrevive"].on_model);
                machine[i] playsound(#"zmb_perks_power_on");
                machine[i] vibrate((0, -100, 0), 0.3, 0.4, 3);
                machine_model = machine[i];
                machine[i] thread zm_perks::perk_fx("revive_light");
                exploder::exploder("quick_revive_lgts");
                machine[i] notify(#"stop_loopsound");
                machine[i] thread zm_perks::play_loop_on_machine();
                if (isdefined(machine_triggers[i])) {
                    machine_clip = machine_triggers[i].clip;
                }
                if (isdefined(machine_triggers[i])) {
                    blocker_model = machine_triggers[i].blocker_model;
                }
            }
        }
        util::wait_network_frame();
        array::thread_all(machine, &zm_perks::set_power_on, 1);
        if (isdefined(level.machine_assets[#"specialty_quickrevive"].power_on_callback)) {
            array::thread_all(machine, level.machine_assets[#"specialty_quickrevive"].power_on_callback);
        }
        level notify(#"specialty_quickrevive_power_on");
        if (isdefined(machine_model)) {
            machine_model.ishidden = 0;
        }
        notify_str = level waittill(#"revive_off", #"revive_hide", #"stop_quickrevive_logic");
        should_hide = 0;
        if (notify_str._notify == "revive_hide") {
            should_hide = 1;
        }
        if (isdefined(level.machine_assets[#"specialty_quickrevive"].power_off_callback)) {
            array::thread_all(machine, level.machine_assets[#"specialty_quickrevive"].power_off_callback);
        }
        for (i = 0; i < machine.size; i++) {
            if (isdefined(machine[i].classname) && machine[i].classname == "script_model") {
                machine[i] zm_perks::turn_perk_off(should_hide);
            }
        }
    }
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x0
// Checksum 0xafa714a3, Offset: 0xca8
// Size: 0x466
function unhide_quickrevive() {
    while (zm_perks::players_are_in_perk_area(level.quick_revive_machine)) {
        wait(0.1);
    }
    if (isdefined(level.quick_revive_machine_clip)) {
        level.quick_revive_machine_clip show();
        level.quick_revive_machine_clip disconnectpaths();
    }
    if (isdefined(level.quick_revive_final_pos)) {
        level.quick_revive_machine.origin = level.quick_revive_final_pos;
    }
    playfx(level._effect[#"poltergeist"], level.quick_revive_machine.origin);
    if (isdefined(level.quick_revive_trigger) && isdefined(level.quick_revive_trigger.blocker_model)) {
        level.quick_revive_trigger.blocker_model hide();
    }
    level.quick_revive_machine show();
    level.quick_revive_machine solid();
    if (isdefined(level.quick_revive_machine.original_pos)) {
        level.quick_revive_default_origin = level.quick_revive_machine.original_pos;
        level.quick_revive_default_angles = level.quick_revive_machine.original_angles;
    }
    direction = level.quick_revive_machine.origin;
    direction = (direction[1], direction[0], 0);
    if (direction[1] < 0 || direction[0] > 0 && direction[1] > 0) {
        direction = (direction[0], direction[1] * -1, 0);
    } else if (direction[0] < 0) {
        direction = (direction[0] * -1, direction[1], 0);
    }
    org = level.quick_revive_default_origin;
    if (isdefined(level.quick_revive_linked_ent)) {
        org = level.quick_revive_linked_ent.origin;
        if (isdefined(level.quick_revive_linked_ent_offset)) {
            org += level.quick_revive_linked_ent_offset;
        }
    }
    if (!(isdefined(level.quick_revive_linked_ent_moves) && level.quick_revive_linked_ent_moves) && level.quick_revive_machine.origin != org) {
        level.quick_revive_machine moveto(org, 3);
        level.quick_revive_machine vibrate(direction, 10, 0.5, 2.9);
        level.quick_revive_machine waittill(#"movedone");
        level.quick_revive_machine.angles = level.quick_revive_default_angles;
    } else {
        if (isdefined(level.quick_revive_linked_ent)) {
            org = level.quick_revive_linked_ent.origin;
            if (isdefined(level.quick_revive_linked_ent_offset)) {
                org += level.quick_revive_linked_ent_offset;
            }
            level.quick_revive_machine.origin = org;
        }
        level.quick_revive_machine vibrate((0, -100, 0), 0.3, 0.4, 3);
    }
    if (isdefined(level.quick_revive_linked_ent)) {
        level.quick_revive_machine linkto(level.quick_revive_linked_ent);
    }
    level.quick_revive_machine.ishidden = 0;
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x0
// Checksum 0x26749a09, Offset: 0x1118
// Size: 0xf0
function restart_quickrevive() {
    vending_machines = zm_perks::get_perk_machines();
    foreach (trigger in vending_machines) {
        if (!isdefined(trigger.script_noteworthy)) {
            continue;
        }
        if (trigger.script_noteworthy == #"specialty_quickrevive") {
            trigger notify(#"stop_quickrevive_logic");
            trigger thread zm_perks::vending_trigger_think();
            trigger triggerenable(1);
        }
    }
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 1, eflags: 0x0
// Checksum 0x30347669, Offset: 0x1210
// Size: 0x196
function update_quickrevive_power_state(poweron) {
    foreach (item in level.powered_items) {
        if (isdefined(item.target) && isdefined(item.target.script_noteworthy) && item.target.script_noteworthy == "specialty_quickrevive") {
            if (item.power && !poweron) {
                if (!isdefined(item.powered_count)) {
                    item.powered_count = 0;
                } else if (item.powered_count > 0) {
                    item.powered_count--;
                }
            } else if (!item.power && poweron) {
                if (!isdefined(item.powered_count)) {
                    item.powered_count = 0;
                }
                item.powered_count++;
            }
            if (!isdefined(item.depowered_count)) {
                item.depowered_count = 0;
            }
            item.power = poweron;
        }
    }
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x13b0
// Size: 0x4
function give_quick_revive_perk() {
    
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 4, eflags: 0x1 linked
// Checksum 0x5d7cb0ea, Offset: 0x13c0
// Size: 0x24
function take_quick_revive_perk(b_pause, str_perk, str_result, n_slot) {
    
}

