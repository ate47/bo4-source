#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\mp_common\gametypes\ct_ruin_tutorial;
#using scripts\mp_common\gametypes\ct_core;

#namespace ct_ruin;

// Namespace ct_ruin/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x8a3f5b58, Offset: 0xc0
// Size: 0x84
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    clientfield::register("scriptmover", "follow_path_fx", 1, 1, "int", &follow_path_fx, 0, 0);
    ct_ruin_tutorial::init();
}

// Namespace ct_ruin/ct_ruin
// Params 7, eflags: 0x0
// Checksum 0xf92cd464, Offset: 0x150
// Size: 0x94
function follow_path_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.fx = util::playfxontag(localclientnum, #"zombie/fx_trail_blood_soul_zmb", self, "tag_origin");
        return;
    }
    stopfx(localclientnum, self.fx);
}

