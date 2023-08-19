// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.csc;
#include scripts/core_common/array_shared.csc;
#include scripts/core_common/vehicle_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/math_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/filter_shared.csc;
#include scripts/core_common/duplicaterender_mgr.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/struct.csc;

#namespace bat;

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x2
// Checksum 0x331fea0f, Offset: 0x130
// Size: 0x74
function autoexec main() {
    vehicle::add_vehicletype_callback("bat", &function_9b3fe343);
    clientfield::register("vehicle", "bat_transform_fx", 8000, 1, "int", &battransformfx, 0, 0);
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x5 linked
// Checksum 0x6f7a6d59, Offset: 0x1b0
// Size: 0xb4
function private function_9b3fe343(localclientnum) {
    self mapshaderconstant(localclientnum, 0, "scriptVector2", 0.1);
    if (isdefined(level.debug_keyline_zombies) && level.debug_keyline_zombies) {
        self duplicate_render::set_dr_flag("keyline_active", 1);
        self duplicate_render::update_dr_filters(localclientnum);
    }
    util::playfxontag(localclientnum, #"hash_1cb1e3e527bd121c", self, "tag_eye");
}

// Namespace bat/zm_ai_bat
// Params 7, eflags: 0x1 linked
// Checksum 0xccfda227, Offset: 0x270
// Size: 0xdc
function battransformfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        e_player = function_5c10bd79(localclientnum);
        physicsexplosionsphere(localclientnum, self.origin, 250, 30, 5);
        n_dist = distance(self.origin, e_player.origin);
        if (n_dist < 400) {
            function_36e4ebd4(localclientnum, "damage_light");
        }
    }
}

