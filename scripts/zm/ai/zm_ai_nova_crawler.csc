#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;

#namespace zm_ai_nova_crawler;

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0, eflags: 0x2
// Checksum 0xad7805e7, Offset: 0x158
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_nova_crawler", &__init__, undefined, undefined);
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0, eflags: 0x0
// Checksum 0x76255e0a, Offset: 0x1a0
// Size: 0x10c
function __init__() {
    clientfield::register("actor", "nova_crawler_burst_clientfield", 1, 1, "int", &function_d8505ab6, 0, 0);
    clientfield::register("toplayer", "nova_crawler_burst_postfx_clientfield", 1, 1, "int", &function_c81db9a1, 0, 0);
    clientfield::register("toplayer", "nova_crawler_gas_cloud_postfx_clientfield", 1, 1, "int", &function_f8947dfe, 0, 0);
    ai::add_archetype_spawn_function(#"nova_crawler", &function_1d34f2b6);
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0xe72a07f2, Offset: 0x2b8
// Size: 0x46
function private function_1d34f2b6(localclientnum) {
    if (!isdefined(self._effect)) {
        self._effect = [];
        self._effect[#"hash_219e13e8868d7af4"] = "zm_ai/fx8_nova_crawler_gas_release";
    }
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 7, eflags: 0x0
// Checksum 0x8af857d6, Offset: 0x308
// Size: 0xb4
function function_d8505ab6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1 && isdefined(self._effect) && isdefined(self._effect[#"hash_219e13e8868d7af4"])) {
        playfx(localclientnum, self._effect[#"hash_219e13e8868d7af4"], self.origin);
    }
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 7, eflags: 0x0
// Checksum 0x2fd795fd, Offset: 0x3c8
// Size: 0x94
function function_c81db9a1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self thread postfx::playpostfxbundle(#"hash_2083fc2cc0fee308");
        return;
    }
    self postfx::exitpostfxbundle(#"hash_2083fc2cc0fee308");
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 7, eflags: 0x0
// Checksum 0x8df106f3, Offset: 0x468
// Size: 0x84
function function_f8947dfe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self thread function_4b3c6d28();
        return;
    }
    self postfx::exitpostfxbundle(#"hash_78fa24e9920e1e07");
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0, eflags: 0x4
// Checksum 0x5f306c6e, Offset: 0x4f8
// Size: 0xa0
function private function_4b3c6d28() {
    self notify("4d967cb582990a00");
    self endon("4d967cb582990a00");
    level endon(#"game_ended");
    self endoncallback(&function_fa939efb, #"death");
    self thread postfx::playpostfxbundle(#"hash_78fa24e9920e1e07");
    while (isalive(self)) {
        waitframe(1);
    }
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x0
// Checksum 0xc89f7dee, Offset: 0x5a0
// Size: 0x34
function function_fa939efb(str_notify) {
    if (isdefined(self)) {
        self thread postfx::exitpostfxbundle(#"hash_78fa24e9920e1e07");
    }
}

