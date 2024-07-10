#using scripts\mp_common\gametypes\ct_core.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using script_4196ba3abca31535;

#namespace ct_torque;

// Namespace ct_torque/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x12f1a5f6, Offset: 0xc0
// Size: 0x96
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    clientfield::register("allplayers", "danger_pstfx", 1, 1, "counter", &danger_pstfx, 1, 0);
    level.hardpoint_bar = luielembar_ct::register("hardpoint_bar");
}

// Namespace ct_torque/ct_torque
// Params 7, eflags: 0x0
// Checksum 0x8b8e97d4, Offset: 0x160
// Size: 0x84
function danger_pstfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    postfx::playpostfxbundle(#"pstfx_danger");
    wait(1);
    postfx::stoppostfxbundle(#"pstfx_danger");
}

