#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai\archetype_catalyst_interface;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp;
#using scripts\core_common\spawner_shared;

#namespace archetypecatalyst;

// Namespace archetypecatalyst/archetype_catalyst
// Params 0, eflags: 0x2
// Checksum 0xcd011b8c, Offset: 0xe8
// Size: 0x84
function autoexec main() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"catalyst", &function_728127b);
    spawner::add_archetype_spawn_function(#"catalyst", &function_5608540a);
    catalystinterface::registercatalystinterfaceattributes();
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 0, eflags: 0x5 linked
// Checksum 0x606ee254, Offset: 0x178
// Size: 0x9c
function private registerbehaviorscriptfunctions() {
    assert(isscriptfunctionptr(&iscatalyst));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"iscatalyst", &iscatalyst);
    animationstatenetwork::registeranimationmocomp("mocomp_teleport_traversal@catalyst", &function_720a0584, undefined, undefined);
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 1, eflags: 0x1 linked
// Checksum 0x53ebff42, Offset: 0x220
// Size: 0x24
function iscatalyst(entity) {
    return self.archetype === #"catalyst";
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 0, eflags: 0x1 linked
// Checksum 0x4014abfe, Offset: 0x250
// Size: 0xc4
function function_5608540a() {
    self.zombie_move_speed = "walk";
    var_9d3ec6f = [];
    var_9d3ec6f[#"catalyst_corrosive"] = 1;
    var_9d3ec6f[#"catalyst_electric"] = 3;
    var_9d3ec6f[#"catalyst_plasma"] = 2;
    var_9d3ec6f[#"catalyst_water"] = 4;
    if (isdefined(self.var_9fde8624) && isdefined(var_9d3ec6f[self.var_9fde8624])) {
        function_27c82a36(self, var_9d3ec6f[self.var_9fde8624]);
    }
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 0, eflags: 0x5 linked
// Checksum 0x70a03d56, Offset: 0x320
// Size: 0x4a
function private function_728127b() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_dc16721f;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 2, eflags: 0x1 linked
// Checksum 0x5d593feb, Offset: 0x378
// Size: 0x150
function function_27c82a36(entity, catalyst_type) {
    entity function_b7e4069(catalyst_type);
    if (isdefined(level.var_f6d5bd0c)) {
        if (level.var_f6d5bd0c[0].size > 0) {
            foreach (spawn_func in level.var_f6d5bd0c[0]) {
                entity [[ spawn_func ]]();
            }
        }
        if (level.var_f6d5bd0c[catalyst_type].size > 0) {
            foreach (spawn_func in level.var_f6d5bd0c[catalyst_type]) {
                entity [[ spawn_func ]]();
            }
        }
    }
    return entity;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 3, eflags: 0x0
// Checksum 0x1175a55a, Offset: 0x4d0
// Size: 0xe0
function function_84c6177b(spawner, catalyst_type, location) {
    spawner.script_forcespawn = 1;
    entity = zombie_utility::spawn_zombie(spawner, undefined, location);
    if (!isdefined(entity)) {
        return;
    }
    if (isdefined(entity.catalyst_type)) {
        return;
    }
    entity = function_27c82a36(entity, catalyst_type);
    if (!isdefined(location.angles)) {
        angles = (0, 0, 0);
    } else {
        angles = location.angles;
    }
    entity forceteleport(location.origin, angles);
    return entity;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 1, eflags: 0x5 linked
// Checksum 0x182d30d8, Offset: 0x5b8
// Size: 0x1a
function private function_b7e4069(catalyst_type) {
    self.catalyst_type = catalyst_type;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 1, eflags: 0x5 linked
// Checksum 0x85b34e32, Offset: 0x5e0
// Size: 0x2c
function private function_dc16721f(entity) {
    entity.__blackboard = undefined;
    entity function_728127b();
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 2, eflags: 0x1 linked
// Checksum 0x3bccc733, Offset: 0x618
// Size: 0xd4
function function_8f9b9d24(catalyst_type, func) {
    if (!isdefined(level.var_f6d5bd0c)) {
        level.var_f6d5bd0c = [];
        level.var_f6d5bd0c[0] = [];
        level.var_f6d5bd0c[1] = [];
        level.var_f6d5bd0c[3] = [];
        level.var_f6d5bd0c[2] = [];
        level.var_f6d5bd0c[4] = [];
    }
    if (isdefined(level.var_f6d5bd0c[catalyst_type])) {
        level.var_f6d5bd0c[catalyst_type][level.var_f6d5bd0c[catalyst_type].size] = func;
    }
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 5, eflags: 0x1 linked
// Checksum 0xe7aa3cec, Offset: 0x6f8
// Size: 0x194
function function_720a0584(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face angle", entity.angles[1]);
    entity animmode("normal");
    if (isdefined(entity.traverseendnode)) {
        /#
            print3d(entity.traversestartnode.origin, "<dev string:x38>", (1, 0, 0), 1, 1, 60);
            print3d(entity.traverseendnode.origin, "<dev string:x38>", (0, 1, 0), 1, 1, 60);
            line(entity.traversestartnode.origin, entity.traverseendnode.origin, (0, 1, 0), 1, 0, 60);
        #/
        entity forceteleport(entity.traverseendnode.origin, entity.traverseendnode.angles, 0);
    }
}

