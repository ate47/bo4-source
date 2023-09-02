// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;

#namespace zm_ai_mannequin;

// Namespace zm_ai_mannequin/zm_ai_mannequin
// Params 0, eflags: 0x2
// Checksum 0x813ceade, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_mannequin", &__init__, &__main__, undefined);
}

// Namespace zm_ai_mannequin/zm_ai_mannequin
// Params 0, eflags: 0x1 linked
// Checksum 0x49d19151, Offset: 0xd0
// Size: 0x5c
function __init__() {
    spawner::add_archetype_spawn_function(#"zombie", &function_c381536b);
    /#
        zm_devgui::function_c7dd7a17("<unknown string>", "<unknown string>");
    #/
}

// Namespace zm_ai_mannequin/zm_ai_mannequin
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x138
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_mannequin/zm_ai_mannequin
// Params 0, eflags: 0x5 linked
// Checksum 0xd593bed8, Offset: 0x148
// Size: 0x36
function private function_c381536b() {
    if (isdefined(self.var_9fde8624) && self.var_9fde8624 == #"mannequin") {
        self.var_80d367d8 = 1;
    }
}

