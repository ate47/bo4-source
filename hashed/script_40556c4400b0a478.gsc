// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/zm/ai/zm_ai_brutus.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/spawner_shared.gsc;

#namespace namespace_9d28c60;

// Namespace namespace_9d28c60/namespace_9d28c60
// Params 0, eflags: 0x2
// Checksum 0x54fff659, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_2e2fcde8843638d9", &__init__, undefined, undefined);
}

// Namespace namespace_9d28c60/namespace_9d28c60
// Params 0, eflags: 0x5 linked
// Checksum 0xbcf8d0f2, Offset: 0x108
// Size: 0x4c
function private __init__() {
    spawner::add_archetype_spawn_function(#"brutus", &function_e67297f2);
    /#
        function_f2cc1ec();
    #/
}

// Namespace namespace_9d28c60/namespace_9d28c60
// Params 0, eflags: 0x5 linked
// Checksum 0x27d4cacd, Offset: 0x160
// Size: 0x44
function private function_e67297f2() {
    if (self.var_9fde8624 !== #"brutus_special") {
        return;
    }
    self attach("c_t8_zmb_mob_brutus_boss_baton", "tag_weapon_right");
}

// Namespace namespace_9d28c60/namespace_9d28c60
// Params 0, eflags: 0x4
// Checksum 0xa1fe1b08, Offset: 0x1b0
// Size: 0x5c
function private function_f2cc1ec() {
    /#
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&function_5162a3de);
    #/
}

// Namespace namespace_9d28c60/namespace_9d28c60
// Params 1, eflags: 0x4
// Checksum 0xa077627e, Offset: 0x218
// Size: 0x1fa
function private function_5162a3de(cmd) {
    /#
        switch (cmd) {
        case #"hash_3b5a33d5b7ae4e80":
            spawners = getspawnerarray();
            foreach (spawner in spawners) {
                if (spawner.var_9fde8624 === #"brutus_special" && isdefined(spawner.script_noteworthy)) {
                    zm_devgui::spawn_archetype(spawner.script_noteworthy);
                    break;
                }
            }
            break;
        case #"hash_2e229b658a79d09f":
            brutuses = getaiarchetypearray(#"brutus");
            foreach (brutus in brutuses) {
                if (brutus.var_9fde8624 === #"brutus_special") {
                    brutus kill(undefined, undefined, undefined, undefined, 0, 1);
                }
            }
            break;
        default:
            break;
        }
    #/
}

