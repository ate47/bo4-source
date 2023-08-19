// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/shoutcaster.csc;
#include scripts/killstreaks/killstreak_bundles.csc;
#include scripts/killstreaks/dog_shared.csc;
#include scripts/core_common/ai_shared.csc;

#namespace dog;

// Namespace dog/dog
// Params 0, eflags: 0x2
// Checksum 0xcbd5f2c6, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"killstreak_dog", &__init__, undefined, #"killstreaks");
}

// Namespace dog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x843322c4, Offset: 0xf8
// Size: 0x7c
function __init__() {
    init_shared();
    bundle = struct::get_script_bundle("killstreak", #"killstreak_dog");
    ai::add_archetype_spawn_function(#"mp_dog", &spawned, bundle);
}

// Namespace dog/dog
// Params 2, eflags: 0x1 linked
// Checksum 0x5e4d86cf, Offset: 0x180
// Size: 0x44
function spawned(local_client_num, bundle) {
    self killstreak_bundles::spawned(local_client_num, bundle);
    self function_a25e8ff(local_client_num);
}

// Namespace dog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0xefcec1ed, Offset: 0x1d0
// Size: 0x5c
function function_a25e8ff(local_client_num) {
    if (shoutcaster::is_shoutcaster(local_client_num)) {
        self shoutcaster::function_a0b844f1(local_client_num, #"hash_16bdbd0b3de5c91a", #"hash_71fbf1094f57b910");
    }
}

