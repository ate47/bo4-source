#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace spawn_beacon;

// Namespace spawn_beacon/spawnbeacon_shared
// Params 0
// Checksum 0x81ee5c1, Offset: 0x110
// Size: 0x14
function init_shared()
{
    setupclientfields();
}

// Namespace spawn_beacon/spawnbeacon_shared
// Params 0
// Checksum 0x57ac8500, Offset: 0x130
// Size: 0x84
function setupclientfields()
{
    clientfield::register( "scriptmover", "spawnbeacon_placed", 1, 1, "int", &spawnbeacon_placed, 0, 0 );
    clientfield::register( "clientuimodel", "hudItems.spawnbeacon.active", 1, 1, "int", undefined, 0, 0 );
}

// Namespace spawn_beacon/spawnbeacon_shared
// Params 7, eflags: 0x4
// Checksum 0xa230f625, Offset: 0x1c0
// Size: 0xe4
function private spawnbeacon_placed( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endon( #"death" );
    self util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    playtagfxset( localclientnum, "gadget_spawnbeacon_teamlight", self );
    self useanimtree( "generic" );
    self setanimrestart( "o_spawn_beacon_deploy", 1, 0, 1 );
}

