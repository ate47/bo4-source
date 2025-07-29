#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\filter_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;

#namespace visionset_mgr;

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x2
// Checksum 0xf411b1d9, Offset: 0x168
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"visionset_mgr", &__init__, undefined, undefined );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0xf965c028, Offset: 0x1b0
// Size: 0x254
function __init__()
{
    level.vsmgr_initializing = 1;
    level.vsmgr_default_info_name = "__none";
    level.vsmgr = [];
    level.vsmgr_states_inited = [];
    level.vsmgr_filter_custom_enable = [];
    level.vsmgr_filter_custom_disable = [];
    level._fv2vs_unset_visionset = "default";
    level._fv2vs_prev_visionsets = [];
    level._fv2vs_prev_visionsets[ 0 ] = level._fv2vs_unset_visionset;
    level._fv2vs_prev_visionsets[ 1 ] = level._fv2vs_unset_visionset;
    level._fv2vs_prev_visionsets[ 2 ] = level._fv2vs_unset_visionset;
    level._fv2vs_prev_visionsets[ 3 ] = level._fv2vs_unset_visionset;
    level._fv2vs_force_instant_transition = [];
    level._fv2vs_force_instant_transition[ 0 ] = 0;
    level._fv2vs_force_instant_transition[ 1 ] = 0;
    level._fv2vs_force_instant_transition[ 2 ] = 0;
    level._fv2vs_force_instant_transition[ 3 ] = 0;
    level thread register_type( "visionset", &visionset_slot_cb, &visionset_lerp_cb, &visionset_update_cb );
    register_visionset_info( level.vsmgr_default_info_name, 1, 1, "undefined", "undefined" );
    level thread register_type( "overlay", &overlay_slot_cb, &overlay_lerp_cb, &overlay_update_cb );
    register_overlay_info_style_none( level.vsmgr_default_info_name, 1, 1 );
    callback::on_finalize_initialization( &finalize_initialization );
    level thread monitor();
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 6
// Checksum 0x9580b369, Offset: 0x410
// Size: 0xf6
function register_visionset_info( name, version, lerp_step_count, visionset_from, visionset_to, visionset_type = 0 )
{
    if ( !register_info( "visionset", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"visionset" ].info[ name ].visionset_from = visionset_from;
    level.vsmgr[ #"visionset" ].info[ name ].visionset_to = visionset_to;
    level.vsmgr[ #"visionset" ].info[ name ].visionset_type = visionset_type;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3
// Checksum 0xc6dbf0fd, Offset: 0x510
// Size: 0x6e
function register_overlay_info_style_none( name, version, lerp_step_count )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 0;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 7
// Checksum 0xd3efe2b3, Offset: 0x588
// Size: 0x14e
function register_overlay_info_style_filter( name, version, lerp_step_count, filter_index, pass_index, material_name, constant_index )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 2;
    level.vsmgr[ #"overlay" ].info[ name ].filter_index = filter_index;
    level.vsmgr[ #"overlay" ].info[ name ].pass_index = pass_index;
    level.vsmgr[ #"overlay" ].info[ name ].material_name = material_name;
    level.vsmgr[ #"overlay" ].info[ name ].constant_index = constant_index;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 6
// Checksum 0x3ad4a332, Offset: 0x6e0
// Size: 0x116
function register_overlay_info_style_blur( name, version, lerp_step_count, transition_in, transition_out, magnitude )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 3;
    level.vsmgr[ #"overlay" ].info[ name ].transition_in = transition_in;
    level.vsmgr[ #"overlay" ].info[ name ].transition_out = transition_out;
    level.vsmgr[ #"overlay" ].info[ name ].magnitude = magnitude;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4
// Checksum 0x2a8395bb, Offset: 0x800
// Size: 0xa6
function register_overlay_info_style_electrified( name, version, lerp_step_count, duration )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 4;
    level.vsmgr[ #"overlay" ].info[ name ].duration = duration;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4
// Checksum 0x9e21a671, Offset: 0x8b0
// Size: 0xa6
function register_overlay_info_style_burn( name, version, lerp_step_count, duration )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 5;
    level.vsmgr[ #"overlay" ].info[ name ].duration = duration;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3
// Checksum 0x44df9206, Offset: 0x960
// Size: 0x6e
function register_overlay_info_style_poison( name, version, lerp_step_count )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 6;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4
// Checksum 0xbd9cac04, Offset: 0x9d8
// Size: 0xa6
function register_overlay_info_style_transported( name, version, lerp_step_count, duration )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 7;
    level.vsmgr[ #"overlay" ].info[ name ].duration = duration;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 11
// Checksum 0x68993e8b, Offset: 0xa88
// Size: 0x22e
function register_overlay_info_style_speed_blur( name, version, lerp_step_count, amount, inner_radius, outer_radius, velocity_should_scale, velocity_scale, blur_in, blur_out, should_offset )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 8;
    level.vsmgr[ #"overlay" ].info[ name ].amount = amount;
    level.vsmgr[ #"overlay" ].info[ name ].inner_radius = inner_radius;
    level.vsmgr[ #"overlay" ].info[ name ].outer_radius = outer_radius;
    level.vsmgr[ #"overlay" ].info[ name ].velocity_should_scale = velocity_should_scale;
    level.vsmgr[ #"overlay" ].info[ name ].velocity_scale = velocity_scale;
    level.vsmgr[ #"overlay" ].info[ name ].blur_in = blur_in;
    level.vsmgr[ #"overlay" ].info[ name ].blur_out = blur_out;
    level.vsmgr[ #"overlay" ].info[ name ].should_offset = should_offset;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 5
// Checksum 0xe9739b7a, Offset: 0xcc0
// Size: 0xde
function register_overlay_info_style_postfx_bundle( name, version, lerp_step_count, bundle, duration )
{
    if ( !register_info( "overlay", name, version, lerp_step_count ) )
    {
        return;
    }
    
    level.vsmgr[ #"overlay" ].info[ name ].style = 1;
    level.vsmgr[ #"overlay" ].info[ name ].bundle = bundle;
    level.vsmgr[ #"overlay" ].info[ name ].duration = duration;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2
// Checksum 0xd78b7ea7, Offset: 0xda8
// Size: 0xa0, Type: bool
function is_type_currently_default( localclientnum, type )
{
    if ( !level.vsmgr[ type ].in_use )
    {
        return true;
    }
    
    state = get_state( localclientnum, type );
    
    if ( isdefined( state ) )
    {
        curr_info = get_info( type, state.curr_slot );
        return ( curr_info.name === level.vsmgr_default_info_name );
    }
    
    return false;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4
// Checksum 0x1bea0c6a, Offset: 0xe50
// Size: 0x19e
function register_type( type, cf_slot_cb, cf_lerp_cb, update_cb )
{
    level.vsmgr[ type ] = spawnstruct();
    level.vsmgr[ type ].type = type;
    level.vsmgr[ type ].in_use = 0;
    level.vsmgr[ type ].highest_version = 0;
    level.vsmgr[ type ].server_version = getserverhighestclientfieldversion();
    level.vsmgr[ type ].cf_slot_name = type + "_slot";
    level.vsmgr[ type ].cf_lerp_name = type + "_lerp";
    level.vsmgr[ type ].cf_slot_cb = cf_slot_cb;
    level.vsmgr[ type ].cf_lerp_cb = cf_lerp_cb;
    level.vsmgr[ type ].update_cb = update_cb;
    level.vsmgr[ type ].info = [];
    level.vsmgr[ type ].sorted_name_keys = [];
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 1
// Checksum 0x92b8c153, Offset: 0xff8
// Size: 0x1c
function finalize_initialization( localclientnum )
{
    thread finalize_clientfields();
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0xaf397be3, Offset: 0x1020
// Size: 0x8e
function finalize_clientfields()
{
    foreach ( v in level.vsmgr )
    {
        v thread finalize_type_clientfields();
    }
    
    level.vsmgr_initializing = 0;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0x554895ad, Offset: 0x10b8
// Size: 0x25c
function finalize_type_clientfields()
{
    println( "<dev string:x38>" + self.type + "<dev string:x4a>" );
    
    if ( 1 >= self.info.size )
    {
        return;
    }
    
    self.in_use = 1;
    self.cf_slot_bit_count = getminbitcountfornum( self.info.size - 1 );
    self.cf_lerp_bit_count = self.info[ self.sorted_name_keys[ 0 ] ].lerp_bit_count;
    
    for ( i = 0; i < self.sorted_name_keys.size ; i++ )
    {
        self.info[ self.sorted_name_keys[ i ] ].slot_index = i;
        
        if ( self.info[ self.sorted_name_keys[ i ] ].lerp_bit_count > self.cf_lerp_bit_count )
        {
            self.cf_lerp_bit_count = self.info[ self.sorted_name_keys[ i ] ].lerp_bit_count;
        }
        
        println( "<dev string:x64>" + self.info[ self.sorted_name_keys[ i ] ].name + "<dev string:x71>" + self.info[ self.sorted_name_keys[ i ] ].version + "<dev string:x7f>" + self.info[ self.sorted_name_keys[ i ] ].lerp_step_count + "<dev string:x95>" );
    }
    
    clientfield::register( "toplayer", self.cf_slot_name, self.highest_version, self.cf_slot_bit_count, "int", self.cf_slot_cb, 0, 1 );
    
    if ( 1 < self.cf_lerp_bit_count )
    {
        clientfield::register( "toplayer", self.cf_lerp_name, self.highest_version, self.cf_lerp_bit_count, "float", self.cf_lerp_cb, 0, 1 );
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3
// Checksum 0xb20bc27f, Offset: 0x1320
// Size: 0x170, Type: bool
function validate_info( type, name, version )
{
    keys = getarraykeys( level.vsmgr );
    
    for ( i = 0; i < keys.size ; i++ )
    {
        if ( type == keys[ i ] )
        {
            break;
        }
    }
    
    assert( i < keys.size, "<dev string:x98>" + type + "<dev string:xb3>" );
    
    if ( version > level.vsmgr[ type ].server_version )
    {
        return false;
    }
    
    if ( isdefined( level.vsmgr[ type ].info[ name ] ) && version < level.vsmgr[ type ].info[ name ].version )
    {
        if ( version < level.vsmgr[ type ].info[ name ].version )
        {
            return false;
        }
        
        level.vsmgr[ type ].info[ name ] = undefined;
    }
    
    return true;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2
// Checksum 0xe763b154, Offset: 0x1498
// Size: 0x9c
function add_sorted_name_key( type, name )
{
    for ( i = 0; i < level.vsmgr[ type ].sorted_name_keys.size ; i++ )
    {
        if ( name < level.vsmgr[ type ].sorted_name_keys[ i ] )
        {
            break;
        }
    }
    
    arrayinsert( level.vsmgr[ type ].sorted_name_keys, name, i );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4
// Checksum 0x2dc2bb87, Offset: 0x1540
// Size: 0x72
function add_info( type, name, version, lerp_step_count )
{
    self.type = type;
    self.name = name;
    self.version = version;
    self.lerp_step_count = lerp_step_count;
    self.lerp_bit_count = getminbitcountfornum( lerp_step_count );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4
// Checksum 0x42f4a9fa, Offset: 0x15c0
// Size: 0x152, Type: bool
function register_info( type, name, version, lerp_step_count )
{
    assert( level.vsmgr_initializing, "<dev string:xc1>" );
    lower_name = tolower( name );
    
    if ( !validate_info( type, lower_name, version ) )
    {
        return false;
    }
    
    add_sorted_name_key( type, lower_name );
    level.vsmgr[ type ].info[ lower_name ] = spawnstruct();
    level.vsmgr[ type ].info[ lower_name ] add_info( type, lower_name, version, lerp_step_count );
    
    if ( version > level.vsmgr[ type ].highest_version )
    {
        level.vsmgr[ type ].highest_version = version;
    }
    
    return true;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 8
// Checksum 0xe9f332cd, Offset: 0x1720
// Size: 0xd8
function slot_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, type )
{
    init_states( localclientnum );
    level.vsmgr[ type ].state[ localclientnum ].curr_slot = newval;
    
    if ( bnewent || binitialsnap )
    {
        level.vsmgr[ type ].state[ localclientnum ].force_update = 1;
    }
    
    level notify( #"hash_4dea82d5e85dfc" );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 7
// Checksum 0x2a8f44f0, Offset: 0x1800
// Size: 0x74
function visionset_slot_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self slot_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "visionset" );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 7
// Checksum 0xf4ca465d, Offset: 0x1880
// Size: 0x74
function overlay_slot_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self slot_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "overlay" );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 8
// Checksum 0x702cc35d, Offset: 0x1900
// Size: 0xd8
function lerp_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, type )
{
    init_states( localclientnum );
    level.vsmgr[ type ].state[ localclientnum ].curr_lerp = newval;
    
    if ( bnewent || binitialsnap )
    {
        level.vsmgr[ type ].state[ localclientnum ].force_update = 1;
    }
    
    level notify( #"hash_4dea82d5e85dfc" );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 7
// Checksum 0x7cb6b820, Offset: 0x19e0
// Size: 0x74
function visionset_lerp_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self lerp_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "visionset" );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 7
// Checksum 0xb9bd3911, Offset: 0x1a60
// Size: 0x74
function overlay_lerp_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self lerp_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "overlay" );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2
// Checksum 0x6c057d8f, Offset: 0x1ae0
// Size: 0x48
function get_info( type, slot )
{
    return level.vsmgr[ type ].info[ level.vsmgr[ type ].sorted_name_keys[ slot ] ];
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2
// Checksum 0xf6ce26d7, Offset: 0x1b30
// Size: 0x50
function get_state( localclientnum, type )
{
    if ( !isdefined( level.vsmgr[ type ].state ) )
    {
        return undefined;
    }
    
    return level.vsmgr[ type ].state[ localclientnum ];
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0x67a5ea48, Offset: 0x1b88
// Size: 0x3a, Type: bool
function should_update_state()
{
    return self.force_update || self.prev_slot != self.curr_slot || self.prev_lerp != self.curr_lerp;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0x29365799, Offset: 0x1bd0
// Size: 0x2e
function transition_state()
{
    self.prev_slot = self.curr_slot;
    self.prev_lerp = self.curr_lerp;
    self.force_update = 0;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 1
// Checksum 0x996c7c22, Offset: 0x1c08
// Size: 0x1c6
function init_states( localclientnum )
{
    if ( isdefined( level.vsmgr_states_inited[ localclientnum ] ) )
    {
        return;
    }
    
    foreach ( v in level.vsmgr )
    {
        if ( !v.in_use )
        {
            continue;
        }
        
        if ( !isdefined( v.state ) )
        {
            v.state = [];
        }
        
        v.state[ localclientnum ] = spawnstruct();
        v.state[ localclientnum ].prev_slot = v.info[ level.vsmgr_default_info_name ].slot_index;
        v.state[ localclientnum ].curr_slot = v.info[ level.vsmgr_default_info_name ].slot_index;
        v.state[ localclientnum ].prev_lerp = 1;
        v.state[ localclientnum ].curr_lerp = 1;
        v.state[ localclientnum ].force_update = 0;
    }
    
    level.vsmgr_states_inited[ localclientnum ] = 1;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0xa2527c, Offset: 0x1dd8
// Size: 0x124
function demo_jump_monitor()
{
    if ( !level.isdemoplaying )
    {
        return;
    }
    
    oldlerps = [];
    
    while ( true )
    {
        level waittill( #"demo_jump", #"demo_player_switch", #"visionset_mgr_reset" );
        
        foreach ( v in level.vsmgr )
        {
            if ( !v.in_use )
            {
                continue;
            }
            
            if ( isdefined( v.state ) )
            {
                v.state[ 0 ].force_update = 1;
            }
        }
        
        level notify( #"hash_4dea82d5e85dfc" );
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0xdc99c0d, Offset: 0x1f08
// Size: 0xc8
function demo_spectate_monitor()
{
    if ( !level.isdemoplaying )
    {
        return;
    }
    
    while ( true )
    {
        if ( function_65b9eb0f( 0 ) )
        {
            if ( !( isdefined( level.vsmgr_is_spectating ) && level.vsmgr_is_spectating ) )
            {
                level notify( #"visionset_mgr_reset" );
            }
            
            level.vsmgr_is_spectating = 1;
        }
        else
        {
            if ( isdefined( level.vsmgr_is_spectating ) && level.vsmgr_is_spectating )
            {
                level notify( #"visionset_mgr_reset" );
            }
            
            level.vsmgr_is_spectating = 0;
        }
        
        waitframe( 1 );
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0x671281f, Offset: 0x1fd8
// Size: 0x1a6
function monitor()
{
    while ( level.vsmgr_initializing )
    {
        waitframe( 1 );
    }
    
    if ( isdefined( level.isdemoplaying ) && level.isdemoplaying )
    {
        level thread demo_spectate_monitor();
        level thread demo_jump_monitor();
    }
    
    while ( true )
    {
        level waittill( #"hash_4dea82d5e85dfc" );
        
        foreach ( k, v in level.vsmgr )
        {
            if ( !v.in_use )
            {
                continue;
            }
            
            for ( localclientnum = 0; localclientnum < level.localplayers.size ; localclientnum++ )
            {
                init_states( localclientnum );
                
                if ( v.state[ localclientnum ] should_update_state() )
                {
                    v thread [[ v.update_cb ]]( localclientnum, k );
                    v.state[ localclientnum ] transition_state();
                }
            }
        }
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3
// Checksum 0x4547f33f, Offset: 0x2188
// Size: 0x52, Type: bool
function killcam_visionset_vehicle_mismatch( visionset_to, visionset_vehicle, vehicletype )
{
    if ( visionset_to == visionset_vehicle )
    {
        if ( isdefined( self.vehicletype ) && self.vehicletype != vehicletype )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2
// Checksum 0x5db3c301, Offset: 0x21e8
// Size: 0x3e, Type: bool
function killcam_visionset_player_mismatch( visionset_to, visionset_vehicle )
{
    if ( visionset_to == visionset_vehicle )
    {
        if ( !isplayer( self ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2
// Checksum 0xfb6b6fbb, Offset: 0x2230
// Size: 0x33c
function visionset_update_cb( localclientnum, type )
{
    state = get_state( localclientnum, type );
    curr_info = get_info( type, state.curr_slot );
    prev_info = get_info( type, state.prev_slot );
    
    /#
    #/
    
    if ( isdefined( level.isdemoplaying ) && level.isdemoplaying && function_65b9eb0f( localclientnum ) )
    {
        visionsetnaked( localclientnum, "default", 0 );
        return;
    }
    
    if ( level.vsmgr_default_info_name == curr_info.name )
    {
        return;
    }
    
    if ( function_1cbf351b( localclientnum ) )
    {
        if ( isdefined( curr_info.visionset_to ) )
        {
            killcament = function_93e0f729( localclientnum );
            
            if ( curr_info.visionset_to == "mp_vehicles_agr" || curr_info.visionset_to == "mp_hellstorm" )
            {
                if ( killcament.type == "vehicle" )
                {
                    return;
                }
            }
            
            if ( killcament killcam_visionset_vehicle_mismatch( curr_info.visionset_to, "mp_vehicles_dart", "veh_dart_mp" ) )
            {
                return;
            }
            
            if ( killcament killcam_visionset_player_mismatch( curr_info.visionset_to, "mp_vehicles_turret" ) )
            {
                return;
            }
            
            if ( killcament killcam_visionset_player_mismatch( curr_info.visionset_to, "mp_vehicles_sentinel" ) )
            {
                return;
            }
        }
    }
    
    if ( !isdefined( curr_info.visionset_from ) )
    {
        if ( curr_info.visionset_type == 6 )
        {
            visionsetlaststandlerp( localclientnum, curr_info.visionset_to, level._fv2vs_prev_visionsets[ localclientnum ], state.curr_lerp );
        }
        else
        {
            visionsetnakedlerp( localclientnum, curr_info.visionset_to, level._fv2vs_prev_visionsets[ localclientnum ], state.curr_lerp );
        }
        
        return;
    }
    
    if ( curr_info.visionset_type == 6 )
    {
        visionsetlaststandlerp( localclientnum, curr_info.visionset_to, curr_info.visionset_from, state.curr_lerp );
        return;
    }
    
    visionsetnakedlerp( localclientnum, curr_info.visionset_to, curr_info.visionset_from, state.curr_lerp );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 1
// Checksum 0x115542ca, Offset: 0x2578
// Size: 0x174
function set_poison_overlay( amount )
{
    setdvar( #"r_poisonfx_debug_enable", 1 );
    setdvar( #"r_poisonfx_pulse", 2 );
    setdvar( #"r_poisonfx_warpx", -0.3 );
    setdvar( #"r_poisonfx_warpy", 0.15 );
    setdvar( #"r_poisonfx_dvisiona", 0 );
    setdvar( #"r_poisonfx_dvisionx", 0 );
    setdvar( #"r_poisonfx_dvisiony", 0 );
    setdvar( #"r_poisonfx_blurmin", 0 );
    setdvar( #"r_poisonfx_blurmax", 3 );
    setdvar( #"r_poisonfx_debug_amount", amount );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0
// Checksum 0x70016d6f, Offset: 0x26f8
// Size: 0x44
function clear_poison_overlay()
{
    setdvar( #"r_poisonfx_debug_amount", 0 );
    setdvar( #"r_poisonfx_debug_enable", 0 );
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2
// Checksum 0x8f625e54, Offset: 0x2748
// Size: 0xab2
function overlay_update_cb( localclientnum, type )
{
    state = get_state( localclientnum, type );
    
    if ( !isdefined( state ) )
    {
        return;
    }
    
    curr_info = get_info( type, state.curr_slot );
    prev_info = get_info( type, state.prev_slot );
    player = level.localplayers[ localclientnum ];
    
    /#
    #/
    
    if ( state.force_update || state.prev_slot != state.curr_slot )
    {
        switch ( prev_info.style )
        {
            case 0:
                break;
            case 1:
                player thread postfx::exitpostfxbundle( prev_info.bundle );
                break;
            case 2:
                if ( isdefined( level.vsmgr_filter_custom_disable[ curr_info.material_name ] ) )
                {
                    player [[ level.vsmgr_filter_custom_disable[ curr_info.material_name ] ]]( state, prev_info, curr_info );
                }
                else
                {
                    setfilterpassenabled( localclientnum, prev_info.filter_index, prev_info.pass_index, 0 );
                }
                
                break;
            case 3:
                setblurbylocalclientnum( localclientnum, 0, prev_info.transition_out );
                break;
            case 4:
                setelectrified( localclientnum, 0 );
                break;
            case 5:
                setburn( localclientnum, 0 );
                break;
            case 6:
                clear_poison_overlay();
                break;
            case 7:
                player thread postfx::exitpostfxbundle( prev_info.bundle );
                break;
            case 8:
                disablespeedblur( localclientnum );
                break;
        }
    }
    
    if ( isdefined( level.isdemoplaying ) && level.isdemoplaying && !function_65b9eb0f( localclientnum ) )
    {
        return;
    }
    
    switch ( curr_info.style )
    {
        case 0:
            break;
        case 1:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp )
            {
                player thread postfx::playpostfxbundle( curr_info.bundle );
            }
            
            break;
        case 2:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp != state.curr_lerp )
            {
                if ( isdefined( level.vsmgr_filter_custom_enable[ curr_info.material_name ] ) )
                {
                    player [[ level.vsmgr_filter_custom_enable[ curr_info.material_name ] ]]( state, prev_info, curr_info );
                }
                else
                {
                    setfilterpassmaterial( localclientnum, curr_info.filter_index, curr_info.pass_index, level.filter_matid[ curr_info.material_name ] );
                    setfilterpassenabled( localclientnum, curr_info.filter_index, curr_info.pass_index, 1 );
                    
                    if ( isdefined( curr_info.constant_index ) )
                    {
                        setfilterpassconstant( localclientnum, curr_info.filter_index, curr_info.pass_index, curr_info.constant_index, state.curr_lerp );
                    }
                }
            }
            
            break;
        case 3:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp )
            {
                setblurbylocalclientnum( localclientnum, curr_info.magnitude, curr_info.transition_in );
            }
            
            break;
        case 4:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp )
            {
                setelectrified( localclientnum, curr_info.duration * state.curr_lerp );
            }
            
            break;
        case 5:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp )
            {
                setburn( localclientnum, curr_info.duration * state.curr_lerp );
            }
            
            break;
        case 6:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp != state.curr_lerp )
            {
                set_poison_overlay( state.curr_lerp );
            }
            
            break;
        case 7:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp )
            {
                level thread filter::settransported( player );
            }
            
            break;
        case 8:
            if ( state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp )
            {
                if ( isdefined( curr_info.should_offset ) )
                {
                    enablespeedblur( localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale, curr_info.blur_in, curr_info.blur_out, curr_info.should_offset );
                }
                else if ( isdefined( curr_info.blur_out ) )
                {
                    enablespeedblur( localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale, curr_info.blur_in, curr_info.blur_out );
                }
                else if ( isdefined( curr_info.blur_in ) )
                {
                    enablespeedblur( localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale, curr_info.blur_in );
                }
                else if ( isdefined( curr_info.velocity_scale ) )
                {
                    enablespeedblur( localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale );
                }
                else if ( isdefined( curr_info.velocity_should_scale ) )
                {
                    enablespeedblur( localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale );
                }
                else
                {
                    enablespeedblur( localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius );
                }
            }
            
            break;
    }
}

