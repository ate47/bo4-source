// Atian COD Tools GSC decompiler test
#include scripts/core_common/callbacks_shared.csc;
#include scripts/zm_common/gametypes/ztcm.csc;
#include scripts/core_common/struct.csc;

#namespace ztcm_mansion;

// Namespace ztcm_mansion/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xeae1c030, Offset: 0xa0
// Size: 0xb4
function event<gametype_init> main(eventstruct) {
    ztcm::main(eventstruct);
    level.var_7a973c0e = createuimodel(getglobaluimodel(), "ZMHudGlobal.tcm");
    setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 0);
    callback::on_localplayer_spawned(&function_13bfe0d8);
}

// Namespace ztcm_mansion/ztcm_mansion
// Params 1, eflags: 0x0
// Checksum 0xf196bfda, Offset: 0x160
// Size: 0x44
function function_13bfe0d8(localclientnum) {
    setuimodelvalue(createuimodel(level.var_7a973c0e, "active"), 4);
}
