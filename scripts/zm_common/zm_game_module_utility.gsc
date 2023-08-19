// Atian COD Tools GSC decompiler test
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace zm_game_module_utility;

// Namespace zm_game_module_utility/zm_game_module_utility
// Params 1, eflags: 0x0
// Checksum 0x41aaf03a, Offset: 0x88
// Size: 0x12a
function move_ring(ring) {
    positions = struct::get_array(ring.target, "targetname");
    positions = array::randomize(positions);
    level endon(#"end_game");
    while (1) {
        foreach (position in positions) {
            self moveto(position.origin, randomintrange(30, 45));
            self waittill(#"movedone");
        }
    }
}

// Namespace zm_game_module_utility/zm_game_module_utility
// Params 1, eflags: 0x0
// Checksum 0xa7a41002, Offset: 0x1c0
// Size: 0x6e
function rotate_ring(forward) {
    level endon(#"end_game");
    dir = -360;
    if (forward) {
        dir = 360;
    }
    while (1) {
        self rotateyaw(dir, 9);
        wait(9);
    }
}

