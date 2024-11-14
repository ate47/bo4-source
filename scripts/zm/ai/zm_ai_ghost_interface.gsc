#using scripts\core_common\ai\systems\ai_interface;
#using scripts\zm\ai\zm_ai_ghost;

#namespace zm_ai_ghost_interface;

// Namespace zm_ai_ghost_interface/zm_ai_ghost_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x983f6be4, Offset: 0x78
// Size: 0x5c
function function_fd76c3b() {
    ai::registermatchedinterface(#"ghost", #"run", 0, array(1, 0), &zm_ai_ghost::function_cea6c2e0);
}

