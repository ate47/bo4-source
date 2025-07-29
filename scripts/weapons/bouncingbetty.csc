#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace bouncingbetty;

// Namespace bouncingbetty/bouncingbetty
// Params 1
// Checksum 0x7779ae5f, Offset: 0xb8
// Size: 0x1b4
function init_shared( localclientnum )
{
    level.explode_1st_offset = 55;
    level.explode_2nd_offset = 95;
    level.explode_main_offset = 140;
    level._effect[ #"fx_betty_friendly_light" ] = #"hash_5f76ecd582d98e38";
    level._effect[ #"fx_betty_enemy_light" ] = #"hash_330682ff4f12f646";
    level._effect[ #"fx_betty_exp" ] = #"weapon/fx_betty_exp";
    level._effect[ #"fx_betty_exp_death" ] = #"weapon/fx_betty_exp_death";
    level._effect[ #"fx_betty_launch_dust" ] = #"weapon/fx_betty_launch_dust";
    clientfield::register( "missile", "bouncingbetty_state", 1, 2, "int", &bouncingbetty_state_change, 0, 0 );
    clientfield::register( "scriptmover", "bouncingbetty_state", 1, 2, "int", &bouncingbetty_state_change, 0, 0 );
}

// Namespace bouncingbetty/bouncingbetty
// Params 7
// Checksum 0x9c7c4b9d, Offset: 0x278
// Size: 0xda
function bouncingbetty_state_change( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endon( #"death" );
    self util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    switch ( newval )
    {
        case 1:
            self thread bouncingbetty_detonating( localclientnum );
            break;
        case 2:
            self thread bouncingbetty_deploying( localclientnum );
            break;
    }
}

// Namespace bouncingbetty/bouncingbetty
// Params 1
// Checksum 0xc37d7fa3, Offset: 0x360
// Size: 0x3c
function bouncingbetty_deploying( localclientnum )
{
    self endon( #"death" );
    self useanimtree( "generic" );
}

// Namespace bouncingbetty/bouncingbetty
// Params 1
// Checksum 0x82d99c47, Offset: 0x3a8
// Size: 0x10c
function bouncingbetty_detonating( localclientnum )
{
    self endon( #"death" );
    up = anglestoup( self.angles );
    forward = anglestoforward( self.angles );
    playfx( localclientnum, level._effect[ #"fx_betty_launch_dust" ], self.origin, up, forward );
    self playsound( localclientnum, #"wpn_betty_jump" );
    self useanimtree( "generic" );
    self thread watchforexplosionnotetracks( localclientnum, up, forward );
}

// Namespace bouncingbetty/bouncingbetty
// Params 3
// Checksum 0xb016c6ca, Offset: 0x4c0
// Size: 0x20e
function watchforexplosionnotetracks( localclientnum, up, forward )
{
    self endon( #"death" );
    
    while ( true )
    {
        notetrack = self waittill( #"explode_1st", #"explode_2nd", #"explode_main" );
        
        switch ( notetrack._notify )
        {
            case #"explode_1st":
                playfx( localclientnum, level._effect[ #"fx_betty_exp" ], self.origin + up * level.explode_1st_offset, up, forward );
                break;
            case #"explode_2nd":
                playfx( localclientnum, level._effect[ #"fx_betty_exp" ], self.origin + up * level.explode_2nd_offset, up, forward );
                break;
            case #"explode_main":
                playfx( localclientnum, level._effect[ #"fx_betty_exp" ], self.origin + up * level.explode_main_offset, up, forward );
                playfx( localclientnum, level._effect[ #"fx_betty_exp_death" ], self.origin, up, forward );
                break;
            default:
                break;
        }
    }
}

