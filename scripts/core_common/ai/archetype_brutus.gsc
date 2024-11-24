#using scripts\core_common\ai\archetype_brutus_interface;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\spawner_shared;

#namespace archetypebrutus;

// Namespace archetypebrutus/archetype_brutus
// Params 0, eflags: 0x2
// Checksum 0x15923c35, Offset: 0x88
// Size: 0x54
function autoexec init() {
    brutusinterface::registerbrutusinterfaceattributes();
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"brutus", &function_517fd069);
}

/#

    // Namespace archetypebrutus/archetype_brutus
    // Params 0, eflags: 0x4
    // Checksum 0x36df914c, Offset: 0xe8
    // Size: 0x24
    function private function_651f04c3() {
        assert(isdefined(self.ai));
    }

#/

// Namespace archetypebrutus/archetype_brutus
// Params 0, eflags: 0x5 linked
// Checksum 0xf6244d97, Offset: 0x118
// Size: 0x62
function private function_517fd069() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_666b2409;
    self.___archetypeonbehavecallback = &function_3cdbfffd;
}

// Namespace archetypebrutus/archetype_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0xf96f7663, Offset: 0x188
// Size: 0xc
function private function_3cdbfffd(entity) {
    
}

// Namespace archetypebrutus/archetype_brutus
// Params 1, eflags: 0x5 linked
// Checksum 0x9ef6036d, Offset: 0x1a0
// Size: 0x2c
function private function_666b2409(entity) {
    self.__blackboard = undefined;
    self function_517fd069();
}

// Namespace archetypebrutus/archetype_brutus
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x1d8
// Size: 0x4
function private registerbehaviorscriptfunctions() {
    
}

/#

    // Namespace archetypebrutus/archetype_brutus
    // Params 1, eflags: 0x4
    // Checksum 0x6e70668c, Offset: 0x1e8
    // Size: 0x54
    function private function_f9f08bb1(message) {
        if (getdvarint(#"scr_brutusdebug", 0)) {
            println("<dev string:x38>" + message);
        }
    }

#/

// Namespace archetypebrutus/archetype_brutus
// Params 4, eflags: 0x1 linked
// Checksum 0x4f8b4f1a, Offset: 0x248
// Size: 0x44
function function_f8aa76ea(entity, attribute, oldvalue, value) {
    if (value) {
        entity function_d4c687c9();
    }
}

