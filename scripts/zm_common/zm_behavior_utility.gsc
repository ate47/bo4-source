// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/core_common/values_shared.gsc;
#include script_522aeb6ae906391e;
#include script_3aa0f32b70d4f7cb;
#include scripts/core_common/ai/archetype_utility.gsc;
#include script_4d85e8de54b02198;
#include script_caf007e2a98afa2;
#include scripts/core_common/ai_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace zm_behavior_utility;

// Namespace zm_behavior_utility/zm_behavior_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x1c1af0ed, Offset: 0xd0
// Size: 0x3a
function setupattackproperties() {
    self val::reset(#"attack_properties", "ignoreall");
    self.meleeattackdist = 64;
}

// Namespace zm_behavior_utility/zm_behavior_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x3d489227, Offset: 0x118
// Size: 0x3c
function enteredplayablearea() {
    self zm_spawner::zombie_complete_emerging_into_playable_area();
    self.pushable = 1;
    self setupattackproperties();
}

