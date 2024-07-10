#using scripts\core_common\callbacks_shared.csc;
#using scripts\zm_common\gametypes\ztcm.csc;
#using scripts\core_common\struct.csc;

#namespace ztcm_towers;

// Namespace ztcm_towers/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1a4657b8, Offset: 0xa0
// Size: 0xb4
function event_handler[gametype_init] main(eventstruct) {
    ztcm::main(eventstruct);
    level.var_7a973c0e = createuimodel(getglobaluimodel(), "ZMHudGlobal.tcm");
    setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 0);
    callback::on_localplayer_spawned(&function_13bfe0d8);
}

// Namespace ztcm_towers/ztcm_towers
// Params 1, eflags: 0x0
// Checksum 0x85c331b5, Offset: 0x160
// Size: 0x44
function function_13bfe0d8(localclientnum) {
    setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 2);
}

