#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\gametypes\ztcm;

#namespace ztcm_zod;

// Namespace ztcm_zod/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x6d458533, Offset: 0xa0
// Size: 0xb4
function event_handler[gametype_init] main( eventstruct )
{
    ztcm::main( eventstruct );
    level.var_7a973c0e = createuimodel( getglobaluimodel(), "ZMHudGlobal.tcm" );
    setuimodelvalue( createuimodel( level.var_7a973c0e, "active" ), 0 );
    callback::on_localplayer_spawned( &function_13bfe0d8 );
}

// Namespace ztcm_zod/ztcm_zod
// Params 1
// Checksum 0xbf72667d, Offset: 0x160
// Size: 0x44
function function_13bfe0d8( localclientnum )
{
    setuimodelvalue( createuimodel( level.var_7a973c0e, "active" ), 1 );
}

