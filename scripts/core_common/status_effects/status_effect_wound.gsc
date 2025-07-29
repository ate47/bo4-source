#using scripts\core_common\player\player_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\system_shared;

#namespace status_effect_wound;

// Namespace status_effect_wound/status_effect_wound
// Params 0, eflags: 0x2
// Checksum 0xecb9e6e2, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"status_effect_wound", &__init__, undefined, undefined );
}

// Namespace status_effect_wound/status_effect_wound
// Params 0
// Checksum 0xcae4a069, Offset: 0xf0
// Size: 0x6c
function __init__()
{
    status_effect::register_status_effect_callback_apply( 6, &wound_apply );
    status_effect::function_5bae5120( 6, &wound_end );
    status_effect::function_6f4eaf88( getstatuseffect( "wound" ) );
}

// Namespace status_effect_wound/status_effect_wound
// Params 3
// Checksum 0x87d0259f, Offset: 0x168
// Size: 0x204
function wound_apply( var_756fda07, weapon, applicant )
{
    self.var_f031d238 = var_756fda07.var_6406d0cd;
    self.var_4a3f5865 = var_756fda07.var_18d16a6b;
    
    if ( !isdefined( var_756fda07.var_752c0834 ) )
    {
        return;
    }
    
    healthreduction = var_756fda07.var_752c0834;
    
    if ( self.owner.maxhealth - healthreduction < var_756fda07.var_8ea635df )
    {
        healthreduction = self.owner.maxhealth - var_756fda07.var_8ea635df;
    }
    
    var_da1d7911 = [];
    var_da1d7911[ 0 ] = { #name:"cleanse_buff", #var_b861a047:undefined };
    
    if ( self.owner.health > 0 )
    {
        self.owner player::function_2a67df65( self.var_4a3f5865, healthreduction * -1, var_da1d7911 );
    }
    
    self.var_18d16a6b = var_756fda07.var_18d16a6b;
    
    if ( self.owner.health > self.owner.var_66cb03ad )
    {
        var_1a197232 = !isdefined( self.owner.var_abe2db87 );
        
        if ( var_1a197232 )
        {
            self.owner.health = self.owner.var_66cb03ad;
        }
    }
    
    if ( self.endtime > 0 )
    {
        self thread function_f6fec56f();
        self thread function_a54d41f7( self.endtime - self.duration );
    }
}

// Namespace status_effect_wound/status_effect_wound
// Params 1
// Checksum 0x4f94b176, Offset: 0x378
// Size: 0xca
function function_a54d41f7( starttime )
{
    self notify( #"hash_77a943337c92549a" );
    self endon( #"hash_77a943337c92549a", #"endstatuseffect" );
    
    for ( var_1420e67b = self.endtime; self.endtime > gettime() ; var_1420e67b = self.endtime )
    {
        waitframe( 1 );
        
        if ( self.endtime != var_1420e67b )
        {
            timesincestart = gettime() - starttime;
            self.owner function_eb1cd20( starttime, self.duration + timesincestart, self.namehash );
        }
    }
}

// Namespace status_effect_wound/status_effect_wound
// Params 0, eflags: 0x4
// Checksum 0x42cf9e4e, Offset: 0x450
// Size: 0xf0
function private function_f6fec56f()
{
    self notify( #"hash_35c63d8ef4b4825" );
    self endon( #"hash_35c63d8ef4b4825", #"endstatuseffect" );
    
    while ( true )
    {
        waitresult = self.owner waittill( #"fully_healed", #"death", #"disconnect", #"healing_disabled" );
        
        if ( waitresult._notify != "fully_healed" )
        {
            return;
        }
        
        if ( isdefined( self.var_f031d238 ) )
        {
            self.owner playsoundtoplayer( self.var_f031d238, self.owner );
        }
    }
}

// Namespace status_effect_wound/status_effect_wound
// Params 0
// Checksum 0x167aa7bd, Offset: 0x548
// Size: 0x24
function wound_end()
{
    self.owner player::function_b933de24( self.var_4a3f5865 );
}

