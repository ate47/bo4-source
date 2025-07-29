#using scripts\abilities\ability_player;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace blade;

// Namespace blade/blade
// Params 0, eflags: 0x2
// Checksum 0x9fea65fe, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"blade", &__init__, undefined, undefined );
}

// Namespace blade/blade
// Params 0
// Checksum 0x6f89ce92, Offset: 0x110
// Size: 0x84
function __init__()
{
    level.weaponsigblade = getweapon( #"sig_blade" );
    level.weaponsigbladeprojectile = getweapon( #"sig_blade_projectile" );
    ability_player::register_gadget_activation_callbacks( 11, &function_a1aa3b85, &function_b0105ee8 );
}

// Namespace blade/blade
// Params 1
// Checksum 0x51baad2d, Offset: 0x1a0
// Size: 0x8c, Type: bool
function function_efa90c79( weapon )
{
    if ( weapon === level.weaponsigblade )
    {
        self clientfield::set_player_uimodel( "hudItems.abilityHintIndex", 6 );
        return true;
    }
    else if ( weapon === level.weaponsigbladeprojectile )
    {
        self clientfield::set_player_uimodel( "hudItems.abilityHintIndex", 7 );
        return true;
    }
    
    return false;
}

// Namespace blade/blade
// Params 1
// Checksum 0x652859ae, Offset: 0x238
// Size: 0x42
function function_d6805ff5( weapon )
{
    if ( weapon === level.weaponsigblade )
    {
        self clientfield::set_player_uimodel( "hudItems.abilityHintIndex", 0 );
        return 1;
    }
}

// Namespace blade/blade
// Params 2
// Checksum 0x4b6a120d, Offset: 0x288
// Size: 0x1b6
function function_a1aa3b85( abilityslot, weapon )
{
    if ( weapon !== level.weaponsigblade && weapon !== level.weaponsigbladeprojectile )
    {
        return;
    }
    
    self.var_f5455815 = 1;
    
    if ( isdefined( self ) )
    {
        self function_efa90c79( weapon );
    }
    
    self thread function_c5c8d661( weapon );
    
    while ( isdefined( self.var_f5455815 ) && self.var_f5455815 )
    {
        waitresult = self waittill( #"death", #"weapon_change" );
        
        if ( !self.var_f5455815 )
        {
            break;
        }
        
        if ( isdefined( self ) && waitresult._notify == "weapon_change" && self function_efa90c79( waitresult.weapon ) )
        {
            self thread function_c5c8d661( waitresult.weapon );
            continue;
        }
        else if ( isdefined( self ) && self isonladder() )
        {
            self clientfield::set_player_uimodel( "hudItems.abilityHintIndex", 0 );
            continue;
        }
        
        break;
    }
    
    if ( isdefined( self ) )
    {
        self notify( #"bladeended" );
    }
}

// Namespace blade/blade
// Params 2
// Checksum 0x9ca51857, Offset: 0x448
// Size: 0x5a
function function_b0105ee8( abilityslot, weapon )
{
    if ( isdefined( self ) )
    {
        self clientfield::set_player_uimodel( "hudItems.abilityHintIndex", 0 );
        self notify( #"bladeended" );
    }
    
    self.var_f5455815 = 0;
}

// Namespace blade/blade
// Params 1
// Checksum 0x4613418c, Offset: 0x4b0
// Size: 0x136
function function_c5c8d661( weapon )
{
    self notify( "4066015d94dac5b3" );
    self endon( "4066015d94dac5b3" );
    self endon( #"death" );
    self endon( #"disconnect" );
    self endon( #"bladeended" );
    
    if ( self isplayerswimming() )
    {
        self function_d6805ff5( weapon );
    }
    
    while ( true )
    {
        ret = self waittill( #"swimming_begin", #"swimming_end" );
        
        switch ( ret._notify )
        {
            case #"swimming_begin":
                self function_d6805ff5( weapon );
                break;
            case #"swimming_end":
                self function_efa90c79( weapon );
                break;
        }
    }
}

