// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/archetype_nova_crawler_interface.gsc;
#include script_522aeb6ae906391e;
#include script_59f07c660e6710a5;
#include scripts/core_common/spawner_shared.gsc;

#namespace archetypenovacrawler;

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 0, eflags: 0x2
// Checksum 0x3b87998, Offset: 0x88
// Size: 0x54
function autoexec init() {
    novacrawlerinterface::registernovacrawlerinterfaceattributes();
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"nova_crawler", &function_ea4610a7);
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 0, eflags: 0x4
// Checksum 0x7317d21a, Offset: 0xe8
// Size: 0x24
function private function_32107b12() {
    /#
        assert(isdefined(self.ai));
    #/
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 0, eflags: 0x5 linked
// Checksum 0x59675f20, Offset: 0x118
// Size: 0x62
function private function_ea4610a7() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_80f18700;
    self.___archetypeonbehavecallback = &function_b11c2bcd;
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 1, eflags: 0x5 linked
// Checksum 0xb7eca9f, Offset: 0x188
// Size: 0xc
function private function_b11c2bcd(entity) {
    
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 1, eflags: 0x5 linked
// Checksum 0xa0a8b0f4, Offset: 0x1a0
// Size: 0x2c
function private function_80f18700(entity) {
    self.__blackboard = undefined;
    self function_ea4610a7();
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x1d8
// Size: 0x4
function private registerbehaviorscriptfunctions() {
    
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0x37d5ba90, Offset: 0x1e8
// Size: 0x54
function private function_3d50e4d0(message) {
    /#
        if (getdvarint(#"hash_35bebcc5f50d2641", 0)) {
            println("<unknown string>" + message);
        }
    #/
}

