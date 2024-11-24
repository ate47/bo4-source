#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\gametypes\ztcm;

#namespace ztcm_escape;

// Namespace ztcm_escape/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xcc240bc7, Offset: 0xa0
// Size: 0xb4
function event_handler[gametype_init] main(eventstruct) {
    ztcm::main(eventstruct);
    level.var_7a973c0e = createuimodel(getglobaluimodel(), "ZMHudGlobal.tcm");
    setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 0);
    callback::on_localplayer_spawned(&function_13bfe0d8);
}

// Namespace ztcm_escape/ztcm_escape
// Params 1, eflags: 0x0
// Checksum 0xac5942b9, Offset: 0x160
// Size: 0x44
function function_13bfe0d8(localclientnum) {
    setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 3);
}

