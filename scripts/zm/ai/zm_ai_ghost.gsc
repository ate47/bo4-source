#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm\ai\zm_ai_ghost_interface.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\ai\systems\debug.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\archetype_mocomps_utility.gsc;
#using scripts\core_common\ai\archetype_locomotion_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_ai_ghost;

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 0, eflags: 0x2
// Checksum 0x34afb20d, Offset: 0x248
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_ghost", &__init__, &__main__, undefined);
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 0, eflags: 0x1 linked
// Checksum 0x93985552, Offset: 0x298
// Size: 0x74
function __init__() {
    spawner::add_archetype_spawn_function(#"ghost", &function_cc3e52ff);
    spawner::add_archetype_spawn_function(#"ghost", &function_fe6a9772);
    zm_ai_ghost_interface::function_fd76c3b();
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x318
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 0, eflags: 0x1 linked
// Checksum 0x47a8fd4f, Offset: 0x328
// Size: 0x4a
function function_cc3e52ff() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_f093c843;
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 1, eflags: 0x5 linked
// Checksum 0xd353f921, Offset: 0x380
// Size: 0x2c
function private function_f093c843(entity) {
    entity.__blackboard = undefined;
    entity function_cc3e52ff();
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 0, eflags: 0x5 linked
// Checksum 0x141d032e, Offset: 0x3b8
// Size: 0x122
function private function_fe6a9772() {
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    if (!isdefined(self.zombie_arms_position)) {
        if (randomint(2) == 0) {
            self.zombie_arms_position = "up";
        } else {
            self.zombie_arms_position = "down";
        }
    }
    self.zombie_move_speed = "walk";
    self.variant_type = randomint(level.zm_variant_type_max[self.zombie_move_speed][self.zombie_arms_position]);
    self.zombie_think_done = 1;
    self setavoidancemask("avoid none");
    self collidewithactors(0);
    self setplayercollision(0);
    self.var_ccefa6dd = 1;
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 4, eflags: 0x1 linked
// Checksum 0x7eb0b731, Offset: 0x4e8
// Size: 0x7c
function function_cea6c2e0(entity, attribute, oldvalue, value) {
    if (value === 1) {
        entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
        return;
    }
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
}

