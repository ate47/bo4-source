// Atian COD Tools GSC decompiler test
#include script_ac6a30f1991e105;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/ai_shared.csc;

#namespace zm_ai_ghost;

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 0, eflags: 0x2
// Checksum 0x82e053cb, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_ghost", &__init__, undefined, undefined);
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 0, eflags: 0x1 linked
// Checksum 0xbf2f079c, Offset: 0xc8
// Size: 0x34
function __init__() {
    ai::add_archetype_spawn_function(#"ghost", &function_e7d2a256);
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 1, eflags: 0x5 linked
// Checksum 0x7a0585e, Offset: 0x108
// Size: 0x24
function private function_e7d2a256(localclientnum) {
    self thread function_20705e4c(localclientnum);
}

// Namespace zm_ai_ghost/zm_ai_ghost
// Params 1, eflags: 0x5 linked
// Checksum 0x678fb026, Offset: 0x138
// Size: 0x106
function private function_20705e4c(localclientnum) {
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"set_invisible", #"set_visible", #"hash_6ab654a4c018818c");
        switch (waitresult._notify) {
        case #"set_invisible":
            self fxclientutils::function_ae92446(localclientnum, self, self.fxdef);
            break;
        case #"set_visible":
        case #"hash_6ab654a4c018818c":
            self fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
            break;
        }
    }
}

