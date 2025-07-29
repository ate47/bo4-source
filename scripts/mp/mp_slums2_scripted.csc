#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;

#namespace mp_slums2_scripted;

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 0, eflags: 0x2
// Checksum 0xdf95788b, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"mp_slums2_scripted", &__init__, undefined, undefined );
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 0
// Checksum 0xef6ea471, Offset: 0xc0
// Size: 0x44
function __init__()
{
    callback::on_localclient_connect( &on_localclient_connect );
    callback::on_gameplay_started( &on_gameplay_started );
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 1
// Checksum 0xc2b78308, Offset: 0x110
// Size: 0x2c
function on_localclient_connect( localclientnum )
{
    waitframe( 1 );
    setpbgactivebank( localclientnum, 8 );
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 1
// Checksum 0xbb9246b6, Offset: 0x148
// Size: 0x2c
function on_gameplay_started( localclientnum )
{
    waitframe( 1 );
    setpbgactivebank( localclientnum, 1 );
}

