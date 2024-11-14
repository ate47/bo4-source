#using scripts\zm_common\zm_audio;
#using scripts\zm_common\ai\zm_ai_utility;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_net;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_behavior;
#using scripts\zm_common\zm_utility;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\system_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\aat_shared;
#using scripts\core_common\ai_shared;
#using scripts\core_common\ai\zombie;

#namespace zm_ai_weeping_angel;

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 0, eflags: 0x2
// Checksum 0x10d9a3a3, Offset: 0x180
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_weeping_angel", &__init__, &__main__, undefined);
}

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 0, eflags: 0x1 linked
// Checksum 0xa257ab46, Offset: 0x1d0
// Size: 0x264
function __init__() {
    zm_score::function_e5d6e6dd(#"weeping_angel", 1);
    assert(isscriptfunctionptr(&function_f5d43a20));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2a1fbaa1c4a45a3f", &function_f5d43a20);
    assert(isscriptfunctionptr(&function_ad034041));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_64a769b6a696ad3e", &function_ad034041, 1);
    spawner::add_archetype_spawn_function(#"weeping_angel", &function_d8a99ae2);
    /#
        zm_devgui::function_c7dd7a17("<dev string:x38>");
        adddebugcommand("<dev string:x48>");
        adddebugcommand("<dev string:x78>");
    #/
    level thread aat::register_immunity("zm_aat_brain_decay", #"weeping_angel", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_frostbite", #"weeping_angel", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_kill_o_watt", #"weeping_angel", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_plasmatic_burst", #"weeping_angel", 1, 1, 1);
}

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x440
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 0, eflags: 0x5 linked
// Checksum 0x818fb390, Offset: 0x450
// Size: 0x6c
function private function_d8a99ae2() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self zombie_utility::set_zombie_run_cycle("super_sprint");
    self thread function_487069e4();
}

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 0, eflags: 0x5 linked
// Checksum 0x643d13d8, Offset: 0x4c8
// Size: 0x34
function private function_487069e4() {
    self endon(#"death");
    wait 1;
    self disableaimassist();
}

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 4, eflags: 0x5 linked
// Checksum 0xa452967c, Offset: 0x508
// Size: 0xac
function private function_b6824ff0(entity, player, duration, color) {
    /#
        enabled = getdvarint(#"hash_46b9af6724aa7968", 0);
        if (enabled) {
            endpoint = function_78910888(player);
            entity thread function_e5ffb77c(entity.origin, endpoint, 0.05, color);
        }
    #/
}

/#

    // Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
    // Params 4, eflags: 0x4
    // Checksum 0xfd169610, Offset: 0x5c0
    // Size: 0x116
    function private function_e5ffb77c(start, end, duration, color) {
        for (current_time = duration * 20; current_time > 0; current_time -= 1) {
            waitframe(1);
            line(start, end, color, 1, 1);
            sphere(end, 10, color, 1, 0, 8, 1);
            distance = distance(start, end);
            print3d(end + (0, 0, 10), "<dev string:xc8>" + distance, color, 1, 1, 1);
        }
    }

#/

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 1, eflags: 0x4
// Checksum 0xcacfa9ee, Offset: 0x6e0
// Size: 0x86
function private function_78910888(player) {
    angles = player getplayerangles();
    forward = anglestoforward(angles);
    result = player.origin + (0, 0, 30) + forward * 100;
    return result;
}

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 1, eflags: 0x5 linked
// Checksum 0xe6cb9189, Offset: 0x770
// Size: 0x1ec
function private function_ad034041(entity) {
    players = getplayers();
    var_de85d14d = [];
    foreach (player in players) {
        if (player cansee(entity)) {
            function_b6824ff0(entity, player, 0.1, (1, 0, 0));
            var_de85d14d[var_de85d14d.size] = player;
            continue;
        }
        function_b6824ff0(entity, player, 0.1, (0, 1, 0));
    }
    if (var_de85d14d.size > 0) {
        if (!(isdefined(entity.is_inert) && entity.is_inert)) {
            entity namespace_9ff9f642::freeze();
        }
        entity setgoal(entity.origin);
        return;
    }
    if (isdefined(entity.is_inert) && entity.is_inert) {
        entity namespace_9ff9f642::unfreeze();
    }
    if (isdefined(entity.var_72411ccf)) {
        entity [[ entity.var_72411ccf ]](entity);
        return;
    }
    entity zm_behavior::zombiefindflesh(entity);
}

// Namespace zm_ai_weeping_angel/zm_ai_weeping_angel
// Params 1, eflags: 0x5 linked
// Checksum 0x423206ad, Offset: 0x968
// Size: 0x7c
function private function_f5d43a20(entity) {
    result = zombiebehavior::zombieshouldmeleecondition(entity);
    if (result && isdefined(entity.enemy) && entity.enemy cansee(entity)) {
        result = 1;
    }
    return result;
}

