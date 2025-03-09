#using scripts\core_common\ai\archetype_stoker_interface;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\spawner_shared;

#namespace archetype_stoker;

// Namespace archetype_stoker/archetype_stoker
// Params 0, eflags: 0x2
// Checksum 0x14243fef, Offset: 0x88
// Size: 0x80
function autoexec init_shared() {
    if (isdefined(level.stokerinit)) {
        return;
    }
    level.stokerinit = 1;
    function_3f70d4b7();
    spawner::add_archetype_spawn_function(#"stoker", &function_d30d1f3);
    stokerinterface::registerstokerinterfaceattributes();
    /#
    #/
}

// Namespace archetype_stoker/archetype_stoker
// Params 0, eflags: 0x4
// Checksum 0x80f724d1, Offset: 0x110
// Size: 0x4
function private function_3f70d4b7() {
    
}

// Namespace archetype_stoker/archetype_stoker
// Params 0, eflags: 0x4
// Checksum 0x5c2278bc, Offset: 0x120
// Size: 0x4a
function private function_d30d1f3() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_236d6de;
}

// Namespace archetype_stoker/archetype_stoker
// Params 1, eflags: 0x4
// Checksum 0x417a906f, Offset: 0x178
// Size: 0x2c
function private function_236d6de(entity) {
    entity.__blackboard = undefined;
    entity function_d30d1f3();
}

// Namespace archetype_stoker/archetype_stoker
// Params 4, eflags: 0x0
// Checksum 0xd589aedc, Offset: 0x1b0
// Size: 0x58
function function_e4ef4e27(entity, attribute, oldvalue, value) {
    if (isdefined(entity.var_80cf70fb)) {
        entity [[ entity.var_80cf70fb ]](entity, attribute, oldvalue, value);
    }
}

