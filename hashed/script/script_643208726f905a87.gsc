#using scripts\core_common\ai\systems\animation_state_machine_mocomp;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;

#namespace namespace_f0e0a17c;

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 0, eflags: 0x2
// Checksum 0x1cd8fec3, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"swat", &__init__, undefined, undefined);
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 0, eflags: 0x1 linked
// Checksum 0x647d64fc, Offset: 0x120
// Size: 0x14
function __init__() {
    registerbehaviorscriptfunctions();
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 0, eflags: 0x5 linked
// Checksum 0x49209e03, Offset: 0x140
// Size: 0x244
function private registerbehaviorscriptfunctions() {
    assert(isscriptfunctionptr(&function_e3151f98));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_62335a0608a02309", &function_e3151f98);
    assert(isscriptfunctionptr(&function_e5f59cf0));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4a938922d1af0c4d", &function_e5f59cf0);
    assert(isscriptfunctionptr(&function_3c677dcd));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4cc583c8bb841d4c", &function_3c677dcd);
    assert(isscriptfunctionptr(&function_994477c0));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3861dc092e2bcf88", &function_994477c0);
    assert(isscriptfunctionptr(&function_fb9f1f3b));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_48334fe2b83169f2", &function_fb9f1f3b);
    animationstatenetwork::registeranimationmocomp("mocomp_swat_team_pain", &function_6edff1e1, undefined, &function_8acd749d);
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 5, eflags: 0x1 linked
// Checksum 0x2b63b8d3, Offset: 0x390
// Size: 0xa2
function function_6edff1e1(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face angle", self.angles[1]);
    entity animmode("zonly_physics", 1);
    entity pathmode("dont move");
    entity.blockingpain = 1;
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 5, eflags: 0x1 linked
// Checksum 0xf7f62cd2, Offset: 0x440
// Size: 0x5a
function function_8acd749d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity pathmode("move allowed");
    entity.blockingpain = 0;
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 1, eflags: 0x5 linked
// Checksum 0x1e134a79, Offset: 0x4a8
// Size: 0x30
function private function_e3151f98(entity) {
    if (entity.var_9fde8624 === #"hash_65b3e15ded9326be") {
        return true;
    }
    return false;
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 1, eflags: 0x5 linked
// Checksum 0xaaa95774, Offset: 0x4e0
// Size: 0x24
function private function_e5f59cf0(entity) {
    entity unlink();
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 1, eflags: 0x5 linked
// Checksum 0xa574f710, Offset: 0x510
// Size: 0x76
function private function_3c677dcd(entity) {
    if (isdefined(entity.enemy)) {
        if (util::within_fov(entity.origin, entity.angles, entity.enemy.origin, cos(90))) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 1, eflags: 0x5 linked
// Checksum 0x997fcd0f, Offset: 0x590
// Size: 0xe
function private function_994477c0(entity) {
    return false;
}

// Namespace namespace_f0e0a17c/namespace_f0e0a17c
// Params 1, eflags: 0x5 linked
// Checksum 0x3c96c04a, Offset: 0x5a8
// Size: 0xe
function private function_fb9f1f3b(entity) {
    return false;
}

