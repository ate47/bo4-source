#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace zm_sq_modules;

// Namespace zm_sq_modules/zm_sq_modules
// Params 9
// Checksum 0xd893ed7d, Offset: 0x108
// Size: 0x19c
function function_d8383812( id, version, script_noteworthy, speed, soul_fx, var_2e845a89, var_925337f4, var_6a1c7649, var_b8d19839 = 0 )
{
    if ( !isdefined( level.var_e4336230 ) )
    {
        level.var_e4336230 = [];
    }
    
    level.var_e4336230[ "sc_" + id ] = { #script_noteworthy:script_noteworthy, #speed:speed, #soul_fx:soul_fx, #var_2e845a89:var_2e845a89, #var_925337f4:var_925337f4, #var_6a1c7649:var_6a1c7649, #var_b8d19839:var_b8d19839 };
    clientfield::register( "actor", "sc_" + id, version, 1, "int", &soul_capture, 0, 0 );
    
    if ( var_b8d19839 )
    {
        clientfield::register( "vehicle", "sc_" + id, version, 1, "int", &soul_capture, 0, 0 );
    }
}

// Namespace zm_sq_modules/zm_sq_modules
// Params 7, eflags: 0x4
// Checksum 0x460a38ec, Offset: 0x2b0
// Size: 0x2e4
function private soul_capture( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    def = level.var_e4336230[ fieldname ];
    
    if ( !isdefined( def ) )
    {
        return;
    }
    
    self util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) || !isdefined( self.origin ) )
    {
        return;
    }
    
    capture_points = struct::get_array( def.script_noteworthy, "script_noteworthy" );
    capture_point = arraygetclosest( self.origin, capture_points );
    e_fx = spawn( localclientnum, self gettagorigin( "J_Spine4" ), "script_model" );
    e_fx setmodel( #"tag_origin" );
    e_fx playsound( localclientnum, "zmb_sq_souls_release" );
    util::playfxontag( localclientnum, def.soul_fx, e_fx, "tag_origin" );
    
    if ( isdefined( def.var_925337f4 ) )
    {
        level [[ def.var_925337f4 ]]( localclientnum, def, capture_point, self );
    }
    
    time = distance( e_fx.origin, capture_point.origin ) / def.speed;
    e_fx moveto( capture_point.origin, time );
    e_fx waittill( #"movedone" );
    e_fx playsound( localclientnum, "zmb_sq_souls_impact" );
    util::playfxontag( localclientnum, def.var_2e845a89, e_fx, "tag_origin" );
    
    if ( isdefined( def.var_6a1c7649 ) )
    {
        level [[ def.var_6a1c7649 ]]( localclientnum, def, capture_point );
    }
    
    wait 0.3;
    e_fx delete();
}

