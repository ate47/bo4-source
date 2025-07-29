#namespace trigger;

// Namespace trigger/trigger_shared
// Params 3
// Checksum 0x46ebe4fd, Offset: 0x78
// Size: 0x11c
function function_thread( ent, on_enter_payload, on_exit_payload )
{
    ent endon( #"death" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    myentnum = self getentitynumber();
    
    if ( ent ent_already_in( myentnum ) )
    {
        return;
    }
    
    add_to_ent( ent, myentnum );
    
    if ( isdefined( on_enter_payload ) )
    {
        [[ on_enter_payload ]]( ent );
    }
    
    while ( isdefined( ent ) && isdefined( self ) && ent istouching( self ) )
    {
        waitframe( 1 );
    }
    
    if ( isdefined( ent ) )
    {
        if ( isdefined( on_exit_payload ) )
        {
            [[ on_exit_payload ]]( ent );
        }
        
        remove_from_ent( ent, myentnum );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x95b2cf1, Offset: 0x1a0
// Size: 0x4c, Type: bool
function ent_already_in( var_d35ff8d8 )
{
    if ( !isdefined( self._triggers ) )
    {
        return false;
    }
    
    if ( !isdefined( self._triggers[ var_d35ff8d8 ] ) )
    {
        return false;
    }
    
    if ( !self._triggers[ var_d35ff8d8 ] )
    {
        return false;
    }
    
    return true;
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0x6ae6433d, Offset: 0x1f8
// Size: 0x4a
function add_to_ent( ent, var_d35ff8d8 )
{
    if ( !isdefined( ent._triggers ) )
    {
        ent._triggers = [];
    }
    
    ent._triggers[ var_d35ff8d8 ] = 1;
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0xf34b89c6, Offset: 0x250
// Size: 0x56
function remove_from_ent( ent, var_d35ff8d8 )
{
    if ( !isdefined( ent._triggers ) )
    {
        return;
    }
    
    if ( !isdefined( ent._triggers[ var_d35ff8d8 ] ) )
    {
        return;
    }
    
    ent._triggers[ var_d35ff8d8 ] = 0;
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0x3629d895, Offset: 0x2b0
// Size: 0x4c
function death_monitor( ent, ender )
{
    ent waittill( #"death" );
    self endon( ender );
    self remove_from_ent( ent );
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x5fa06046, Offset: 0x308
// Size: 0x7c
function trigger_wait( n_clientnum )
{
    self endon( #"trigger" );
    
    if ( isdefined( self.targetname ) )
    {
        trig = getent( n_clientnum, self.targetname, "target" );
        
        if ( isdefined( trig ) )
        {
            trig waittill( #"trigger" );
        }
    }
}

