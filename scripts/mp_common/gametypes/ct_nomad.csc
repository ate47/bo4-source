#using scripts\core_common\clientfield_shared.csc;
#using scripts\mp_common\gametypes\ct_nomad_tutorial.csc;
#using scripts\mp_common\gametypes\ct_core.csc;

#namespace ct_nomad;

// Namespace ct_nomad/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd3f3ebcf, Offset: 0xa8
// Size: 0x84
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    clientfield::register("actor", "warlord_radar_enable", 1, 1, "int", &function_81669a8b, 1, 0);
    ct_nomad_tutorial::init();
}

// Namespace ct_nomad/ct_nomad
// Params 7, eflags: 0x0
// Checksum 0x520aefe7, Offset: 0x138
// Size: 0x9c
function function_81669a8b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level endon(#"demo_jump");
    self endon(#"death");
    if (newval) {
        self enableonradar();
        return;
    }
    self disableonradar();
}

