#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;

#namespace globallogic;

// Namespace globallogic/globallogic
// Params 0, eflags: 0x2
// Checksum 0x7ca407b6, Offset: 0xc0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"globallogic", &__init__, undefined, #"visionset_mgr" );
}

// Namespace globallogic/globallogic
// Params 0
// Checksum 0x20c2ff47, Offset: 0x110
// Size: 0x62
function __init__()
{
    visionset_mgr::register_visionset_info( "crithealth", 1, 25, undefined, "critical_health" );
    level.new_health_model = getdvarint( #"new_health_model", 1 ) > 0;
}

