#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_office_ee_schuster;

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x2
// Checksum 0xf44498fc, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_office_ee_schuster", &__init__, undefined, undefined);
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 0, eflags: 0x0
// Checksum 0x7b2f8d74, Offset: 0x120
// Size: 0x7a
function __init__() {
    clientfield::register("toplayer", "audio_log_ball_fx", 1, 3, "int", &function_50865dc7, 0, 0);
    level._effect[#"audio_ball"] = #"hash_445f04139d92c61b";
}

// Namespace zm_office_ee_schuster/zm_office_ee_schuster
// Params 7, eflags: 0x0
// Checksum 0x1683de33, Offset: 0x1a8
// Size: 0x154
function function_50865dc7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    a_s_locs = struct::get_array("office_audio_log_schuster");
    foreach (s_loc in a_s_locs) {
        if (s_loc.var_614bfc5c + 1 == newval) {
            var_a1cf77d2 = util::spawn_model(localclientnum, "tag_origin", s_loc.origin, s_loc.angles);
            break;
        }
    }
    util::playfxontag(localclientnum, level._effect[#"audio_ball"], var_a1cf77d2, "tag_origin");
}

