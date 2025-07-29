#using scripts\abilities\ability_gadgets;
#using scripts\abilities\ability_util;

#namespace ability_power;

/#

    // Namespace ability_power/ability_power
    // Params 2
    // Checksum 0xbddbc568, Offset: 0xd8
    // Size: 0x104, Type: dev
    function cpower_print( slot, str )
    {
        color = "<dev string:x38>";
        toprint = color + "<dev string:x3d>" + str;
        weaponname = "<dev string:x50>";
        
        if ( isdefined( self._gadgets_player[ slot ] ) )
        {
            weaponname = self._gadgets_player[ slot ].name;
        }
        
        if ( getdvarint( #"scr_cpower_debug_prints", 0 ) > 0 )
        {
            self iprintlnbold( toprint );
            return;
        }
        
        println( self.playername + "<dev string:x57>" + weaponname + "<dev string:x57>" + toprint );
    }

#/

// Namespace ability_power/ability_power
// Params 1
// Checksum 0x638e5356, Offset: 0x1e8
// Size: 0x1a, Type: bool
function power_is_hero_ability( gadget )
{
    return gadget.gadget_type != 0;
}

// Namespace ability_power/ability_power
// Params 2
// Checksum 0x53372255, Offset: 0x210
// Size: 0x4a
function function_9d78823f( gadget, weapon )
{
    if ( !isdefined( level.var_d0b212bd ) )
    {
        level.var_d0b212bd = [];
    }
    
    level.var_d0b212bd[ weapon ] = gadget;
}

// Namespace ability_power/ability_power
// Params 2
// Checksum 0xce767c7b, Offset: 0x268
// Size: 0x5a, Type: bool
function is_weapon_or_variant_same_as_gadget( weapon, gadget )
{
    if ( weapon == gadget )
    {
        return true;
    }
    
    if ( isdefined( level.var_d0b212bd ) )
    {
        if ( level.var_d0b212bd[ weapon ] === gadget )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace ability_power/ability_power
// Params 4
// Checksum 0x3ef1d7a5, Offset: 0x2d0
// Size: 0x386
function power_gain_event_score( event, eattacker, score, weapon )
{
    if ( !isplayer( self ) )
    {
        return;
    }
    
    if ( score <= 0 )
    {
        return;
    }
    
    if ( self.gadgetthiefactive === 1 )
    {
        return;
    }
    
    var_f1ee6456 = 1;
    
    /#
        var_f1ee6456 *= getdvarfloat( #"hash_eae9a8ee387705d", 1 );
    #/
    
    if ( !isdefined( level.var_607bc6e7 ) )
    {
        level.var_607bc6e7 = getgametypesetting( #"scoreheropowergainfactor" );
        
        if ( level.var_aa5e6547 === 1 )
        {
            var_ec084a7a = getdvarfloat( #"hash_1cfb84145f54fa01", 0.59 );
            
            if ( var_ec084a7a > 0 )
            {
                level.var_607bc6e7 = var_ec084a7a;
            }
        }
    }
    
    gametypefactor = level.var_607bc6e7;
    perkfactor = 1;
    
    if ( self hasperk( #"specialty_overcharge" ) )
    {
        perkfactor = getdvarfloat( #"gadgetpoweroverchargeperkscorefactor", 0 );
    }
    
    var_ec6ee937 = score * gametypefactor * perkfactor * var_f1ee6456;
    
    if ( var_ec6ee937 <= 0 )
    {
        return;
    }
    
    var_18fc605 = getdvarint( #"hash_74d01f2fd0317f08", 0 ) || isdefined( weapon ) && weapon.var_f23e9d19;
    
    for ( slot = 0; slot < 3 ; slot++ )
    {
        gadget = self._gadgets_player[ slot ];
        
        if ( isdefined( gadget ) )
        {
            ignoreself = gadget.gadget_powergainscoreignoreself;
            var_503ccf9e = isdefined( weapon ) && is_weapon_or_variant_same_as_gadget( weapon, gadget );
            
            if ( ignoreself && var_503ccf9e || var_18fc605 && !var_503ccf9e )
            {
                continue;
            }
            
            ignorewhenactive = gadget.gadget_powergainscoreignorewhenactive;
            
            if ( ignorewhenactive && self gadgetisactive( slot ) )
            {
                continue;
            }
            
            scorefactor = gadget.gadget_powergainscorefactor;
            
            if ( scorefactor > 0 )
            {
                gaintoadd = scorefactor * var_ec6ee937;
                self power_gain_event( slot, eattacker, gaintoadd, "score" );
            }
        }
    }
}

// Namespace ability_power/ability_power
// Params 1
// Checksum 0x628847ff, Offset: 0x660
// Size: 0x86
function power_gain_event_damage_actor( eattacker )
{
    basegain = 0;
    
    if ( basegain > 0 )
    {
        for ( slot = 0; slot < 3 ; slot++ )
        {
            if ( isdefined( self._gadgets_player[ slot ] ) )
            {
                self power_gain_event( slot, eattacker, basegain, "damaged actor" );
            }
        }
    }
}

// Namespace ability_power/ability_power
// Params 2
// Checksum 0x26150dd8, Offset: 0x6f0
// Size: 0xde
function power_gain_event_killed_actor( eattacker, meansofdeath )
{
    basegain = 5;
    
    for ( slot = 0; slot < 3 ; slot++ )
    {
        if ( isdefined( self._gadgets_player[ slot ] ) )
        {
            if ( self._gadgets_player[ slot ].gadget_powerreplenishfactor > 0 )
            {
                gaintoadd = basegain * self._gadgets_player[ slot ].gadget_powerreplenishfactor;
                
                if ( gaintoadd > 0 )
                {
                    source = "killed actor";
                    self power_gain_event( slot, eattacker, gaintoadd, source );
                }
            }
        }
    }
}

// Namespace ability_power/ability_power
// Params 4
// Checksum 0x3d1a1e0a, Offset: 0x7d8
// Size: 0x18c
function power_gain_event( slot, eattacker, val, source )
{
    if ( !isdefined( self ) || !isalive( self ) )
    {
        return;
    }
    
    powertoadd = val;
    
    if ( abs( powertoadd ) > 0.0001 )
    {
        maxscore = self._gadgets_player[ slot ].var_1e89f40;
        
        if ( maxscore && 0 < powertoadd )
        {
            if ( powertoadd + self.var_aec4af05[ slot ] > maxscore )
            {
                powertoadd = maxscore - self.var_aec4af05[ slot ];
                
                if ( 0 >= powertoadd )
                {
                    return;
                }
            }
        }
        
        powerleft = self gadgetpowerchange( slot, powertoadd );
        
        if ( 0 < powertoadd )
        {
            self.var_aec4af05[ slot ] += powertoadd;
        }
        
        /#
            self cpower_print( slot, "<dev string:x5c>" + powertoadd + "<dev string:x68>" + source + "<dev string:x75>" + powerleft );
        #/
    }
}

// Namespace ability_power/ability_power
// Params 5
// Checksum 0xe393b7b9, Offset: 0x970
// Size: 0x17e
function power_loss_event_took_damage( eattacker, einflictor, weapon, smeansofdeath, idamage )
{
    if ( !isdefined( self._gadgets_player ) )
    {
        return;
    }
    
    baseloss = idamage;
    
    for ( slot = 0; slot < 3 ; slot++ )
    {
        if ( isdefined( self._gadgets_player[ slot ] ) )
        {
            if ( self gadgetisactive( slot ) )
            {
                powerloss = baseloss * self._gadgets_player[ slot ].gadget_poweronlossondamage;
                
                if ( powerloss > 0 )
                {
                    self power_loss_event( slot, eattacker, powerloss, "took damage with power on" );
                }
                
                if ( self._gadgets_player[ slot ].gadget_flickerondamage > 0 )
                {
                    self ability_gadgets::setflickering( slot, self._gadgets_player[ slot ].gadget_flickerondamage );
                }
                
                continue;
            }
            
            powerloss = baseloss * self._gadgets_player[ slot ].gadget_powerofflossondamage;
            
            if ( powerloss > 0 )
            {
                self power_loss_event( slot, eattacker, powerloss, "took damage" );
            }
        }
    }
}

// Namespace ability_power/ability_power
// Params 4
// Checksum 0xa1b523f4, Offset: 0xaf8
// Size: 0xcc
function power_loss_event( slot, eattacker, val, source )
{
    powertoremove = val * -1;
    
    if ( powertoremove > 0.1 || powertoremove < -0.1 )
    {
        powerleft = self gadgetpowerchange( slot, powertoremove );
        
        /#
            self cpower_print( slot, "<dev string:x86>" + powertoremove + "<dev string:x68>" + source + "<dev string:x75>" + powerleft );
        #/
    }
}

// Namespace ability_power/ability_power
// Params 1
// Checksum 0xd4d180e3, Offset: 0xbd0
// Size: 0x4e
function power_drain_completely( slot )
{
    powerleft = self gadgetpowerchange( slot, 0 );
    powerleft = self gadgetpowerchange( slot, powerleft * -1 );
}

// Namespace ability_power/ability_power
// Params 0
// Checksum 0xb2d93029, Offset: 0xc28
// Size: 0x6e, Type: bool
function ismovingpowerloss()
{
    velocity = self getvelocity();
    speedsq = lengthsquared( velocity );
    return speedsq > self._gadgets_player.gadget_powermovespeed * self._gadgets_player.gadget_powermovespeed;
}

// Namespace ability_power/ability_power
// Params 2
// Checksum 0xd40bb2cb, Offset: 0xca0
// Size: 0x240
function power_consume_timer_think( slot, weapon )
{
    self endon( #"disconnect", #"death" );
    
    if ( !isdefined( self._gadgets_player ) )
    {
        return;
    }
    
    time = gettime();
    
    while ( true )
    {
        wait 0.1;
        
        if ( !isdefined( self._gadgets_player[ slot ] ) )
        {
            return;
        }
        
        if ( !self gadgetisactive( slot ) )
        {
            return;
        }
        
        currenttime = gettime();
        interval = currenttime - time;
        time = currenttime;
        powerconsumpted = 0;
        
        if ( self isonground() )
        {
            if ( self._gadgets_player[ slot ].gadget_powersprintloss > 0 && self issprinting() )
            {
                powerconsumpted += 1 * float( interval ) / 1000 * self._gadgets_player[ slot ].gadget_powersprintloss;
            }
            else if ( self._gadgets_player[ slot ].gadget_powermoveloss && self ismovingpowerloss() )
            {
                powerconsumpted += 1 * float( interval ) / 1000 * self._gadgets_player[ slot ].gadget_powermoveloss;
            }
        }
        
        if ( powerconsumpted > 0.1 )
        {
            self power_loss_event( slot, self, powerconsumpted, "consume" );
            
            if ( self._gadgets_player[ slot ].gadget_flickeronpowerloss > 0 )
            {
                self ability_gadgets::setflickering( slot, self._gadgets_player[ slot ].gadget_flickeronpowerloss );
            }
        }
    }
}

