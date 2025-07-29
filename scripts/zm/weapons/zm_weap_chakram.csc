#using script_70ab01a7690ea256;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_chakram;

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x2
// Checksum 0x5c0d729b, Offset: 0x178
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_chakram", &__init__, undefined, undefined );
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0
// Checksum 0x3727bcad, Offset: 0x1c0
// Size: 0x74a
function __init__()
{
    clientfield::register( "actor", "" + #"zombie_slice_right", 1, 2, "counter", &function_8e1552b1, 1, 0 );
    clientfield::register( "actor", "" + #"zombie_slice_left", 1, 2, "counter", &function_6831ee4b, 1, 0 );
    clientfield::register( "allplayers", "" + #"chakram_melee_hit", 1, 1, "counter", &chakram_melee_hit, 1, 0 );
    clientfield::register( "actor", "" + #"chakram_head_pop_fx", 1, 1, "int", &chakram_head_pop_fx, 1, 0 );
    clientfield::register( "vehicle", "" + #"chakram_head_pop_fx", 1, 1, "int", &chakram_head_pop_fx, 1, 0 );
    clientfield::register( "scriptmover", "" + #"chakram_throw_trail_fx", 1, 1, "int", &chakram_throw_trail_fx, 0, 0 );
    clientfield::register( "scriptmover", "" + #"chakram_throw_impact_fx", 1, 1, "int", &chakram_throw_impact_fx, 0, 0 );
    clientfield::register( "actor", "" + #"chakram_throw_special_impact_fx", 1, 1, "counter", &chakram_throw_special_impact_fx, 0, 0 );
    clientfield::register( "allplayers", "" + #"chakram_whirlwind_fx", 1, 1, "int", &chakram_whirlwind_fx, 0, 0 );
    clientfield::register( "actor", "" + #"chakram_whirlwind_shred_fx", 1, 1, "counter", &chakram_whirlwind_shred_fx, 1, 0 );
    clientfield::register( "vehicle", "" + #"chakram_whirlwind_shred_fx", 1, 1, "counter", &chakram_whirlwind_shred_fx, 1, 0 );
    clientfield::register( "toplayer", "" + #"chakram_speed_buff_postfx", 1, 1, "counter", &chakram_speed_buff_postfx, 0, 0 );
    clientfield::register( "toplayer", "" + #"chakram_rumble", 1, 3, "counter", &chakram_rumble, 0, 0 );
    level._effect[ #"sword_bloodswipe_r_1p" ] = #"zombie/fx_sword_slash_right_1p_zod_zmb";
    level._effect[ #"sword_bloodswipe_l_1p" ] = #"zombie/fx_sword_slash_left_1p_zod_zmb";
    level._effect[ #"hash_720f204e4406ddbf" ] = #"hash_59cdb0226e644934";
    level._effect[ #"hash_15593b3f860346f5" ] = #"hash_1e957556dba822e6";
    level._effect[ #"hash_5f9bb382a47d637d" ] = #"hash_68100f653a5baf2f";
    level._effect[ #"hash_6dca5478f1baf5ce" ] = #"hash_1ff88e4b147015b2";
    level._effect[ #"hash_3364e81f269deca0" ] = #"hash_656272f0184ae1fc";
    level._effect[ #"hash_5c2ba805602ea484" ] = #"hash_3904517ed3636935";
    level._effect[ #"hash_455a47023bc1da46" ] = #"hash_2109d3278a7b54fa";
    level._effect[ #"hash_bc1e5225071e47d" ] = #"hash_2ca473741924f0c";
    level._effect[ #"hash_29c798afb4256dc0" ] = #"hash_37cfda7fcc57f0f";
    level._effect[ #"hash_6759261c70e31d0a" ] = #"hash_2103c7278a76d4e8";
    level._effect[ #"hash_6ac964121fa8b4bf" ] = #"hash_212ef7da466574ba";
    level._effect[ #"hash_49a09babc9ee918a" ] = #"hash_1ac3342ef816a481";
    level._effect[ #"hash_c995c57914ab2b4" ] = #"hash_1157c7544a4dd8cf";
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0xe5f89be3, Offset: 0x918
// Size: 0xb4
function function_8e1552b1( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( util::is_mature() && !util::is_gib_restricted_build() )
    {
        if ( newval == 1 )
        {
            util::playfxontag( localclientnum, level._effect[ #"sword_bloodswipe_r_1p" ], self, "j_spine4" );
        }
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0x2b483689, Offset: 0x9d8
// Size: 0xb4
function function_6831ee4b( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( util::is_mature() && !util::is_gib_restricted_build() )
    {
        if ( newval == 1 )
        {
            util::playfxontag( localclientnum, level._effect[ #"sword_bloodswipe_l_1p" ], self, "j_spine4" );
        }
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0x86d4524d, Offset: 0xa98
// Size: 0x90
function chakram_melee_hit( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( self zm_utility::function_f8796df3( localclientnum ) )
    {
        playviewmodelfx( localclientnum, level._effect[ #"hash_15593b3f860346f5" ], "tag_fx8" );
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0xf3a43ac3, Offset: 0xb30
// Size: 0x7c
function chakram_head_pop_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        util::playfxontag( localclientnum, level._effect[ #"hash_5f9bb382a47d637d" ], self, "j_head" );
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0x21ea6bbb, Offset: 0xbb8
// Size: 0x126
function chakram_throw_trail_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        self.fx_trail = util::playfxontag( localclientnum, level._effect[ #"hash_6dca5478f1baf5ce" ], self, "tag_fx" );
        
        if ( !isdefined( self.snd_looper ) )
        {
            self.snd_looper = self playloopsound( #"hash_3cd6bae1469848f1", 1 );
        }
        
        return;
    }
    
    if ( isdefined( self.fx_trail ) )
    {
        killfx( localclientnum, self.fx_trail );
    }
    
    if ( isdefined( self.snd_looper ) )
    {
        self stoploopsound( self.snd_looper );
        self.snd_looper = undefined;
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0xfc72bdfc, Offset: 0xce8
// Size: 0xbc
function chakram_throw_impact_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        playfx( localclientnum, level._effect[ #"hash_3364e81f269deca0" ], self.origin, anglestoforward( self.angles ) );
        playsound( localclientnum, #"hash_72a17706cb2656cd", self.origin );
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0xd51b0a62, Offset: 0xdb0
// Size: 0xa4
function chakram_throw_special_impact_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        util::playfxontag( localclientnum, level._effect[ #"hash_3364e81f269deca0" ], self, "j_spine4" );
        playsound( localclientnum, #"hash_72a17706cb2656cd", self.origin );
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0xa8c89e7e, Offset: 0xe60
// Size: 0x7c
function chakram_speed_buff_postfx( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( !namespace_a6aea2c6::is_active( #"silent_film" ) )
    {
        self thread postfx::playpostfxbundle( #"hash_1663ca7cc81f9b17" );
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0x369d252b, Offset: 0xee8
// Size: 0x6dc
function chakram_whirlwind_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( !isdefined( self.var_779b5b35 ) )
    {
        self.var_779b5b35 = [];
    }
    
    if ( !isdefined( self.var_1c7e53dd ) )
    {
        self.var_1c7e53dd = [];
    }
    
    if ( !isdefined( self.var_4316c62f ) )
    {
        self.var_4316c62f = [];
    }
    
    if ( isdefined( self.var_779b5b35[ localclientnum ] ) )
    {
        deletefx( localclientnum, self.var_779b5b35[ localclientnum ] );
        self.var_779b5b35[ localclientnum ] = undefined;
    }
    
    if ( isdefined( self.var_1c7e53dd[ localclientnum ] ) )
    {
        self stoploopsound( self.var_1c7e53dd[ localclientnum ] );
        self.var_1c7e53dd[ localclientnum ] = undefined;
    }
    
    if ( isdefined( self.var_4316c62f[ localclientnum ] ) )
    {
        stopfx( localclientnum, self.var_4316c62f[ localclientnum ] );
        self.var_4316c62f[ localclientnum ] = undefined;
    }
    
    a_e_players = getlocalplayers();
    
    foreach ( e_player in a_e_players )
    {
        if ( !e_player util::function_50ed1561( localclientnum ) )
        {
            e_player notify( #"hash_1b4803a2f50e48ce" );
        }
    }
    
    if ( newval == 1 )
    {
        self.var_1c7e53dd[ localclientnum ] = self playloopsound( #"hash_75e91bf08cd631e8" );
        var_c2545ba4 = self.var_1c7e53dd[ localclientnum ];
        self.var_4316c62f[ localclientnum ] = util::playfxontag( localclientnum, level._effect[ #"hash_c995c57914ab2b4" ], self, "j_spine4" );
        var_4316c62f = self.var_4316c62f[ localclientnum ];
        
        if ( self zm_utility::function_f8796df3( localclientnum ) )
        {
            self.var_779b5b35[ localclientnum ] = playfxoncamera( localclientnum, level._effect[ #"hash_6759261c70e31d0a" ], ( 0, 0, 0 ), ( 1, 0, 0 ), ( 0, 0, 1 ) );
            var_779b5b35 = self.var_779b5b35[ localclientnum ];
            self thread postfx::playpostfxbundle( #"pstfx_zm_chakram_whirlwind" );
            self playrumblelooponentity( localclientnum, #"zm_weap_chakram_whirlwind_rumble" );
        }
        else
        {
            util::playfxontag( localclientnum, level._effect[ #"hash_5c2ba805602ea484" ], self, "tag_origin" );
            wait 1;
            
            if ( isdefined( self ) && self.weapon === getweapon( #"hero_chakram_lv3" ) )
            {
                self.var_779b5b35[ localclientnum ] = util::playfxontag( localclientnum, level._effect[ #"hash_455a47023bc1da46" ], self, "tag_origin" );
                var_779b5b35 = self.var_779b5b35[ localclientnum ];
            }
        }
        
        a_e_players = getlocalplayers();
        
        foreach ( e_player in a_e_players )
        {
            if ( !e_player util::function_50ed1561( localclientnum ) )
            {
                if ( isdefined( e_player ) )
                {
                    if ( isdefined( var_779b5b35 ) )
                    {
                        e_player thread zm_utility::function_ae3780f1( localclientnum, var_779b5b35, #"hash_1b4803a2f50e48ce" );
                    }
                    
                    e_player thread zm_utility::function_ae3780f1( localclientnum, var_4316c62f, #"hash_1b4803a2f50e48ce" );
                    e_player thread zm_utility::function_bb54a31f( localclientnum, #"pstfx_zm_chakram_whirlwind", #"hash_1b4803a2f50e48ce" );
                    e_player thread function_cfefd76a( localclientnum, var_c2545ba4, #"hash_1b4803a2f50e48ce" );
                }
            }
        }
        
        return;
    }
    
    self playsound( localclientnum, #"hash_4f78bd85d9a43e3c" );
    
    if ( self postfx::function_556665f2( #"pstfx_zm_chakram_whirlwind" ) )
    {
        self postfx::stoppostfxbundle( #"pstfx_zm_chakram_whirlwind" );
    }
    
    if ( self zm_utility::function_f8796df3( localclientnum ) )
    {
        self stoprumble( localclientnum, #"zm_weap_chakram_whirlwind_rumble" );
    }
    
    if ( self zm_utility::function_f8796df3( localclientnum ) )
    {
        playfxoncamera( localclientnum, level._effect[ #"hash_6ac964121fa8b4bf" ], ( 0, 0, 0 ), ( 1, 0, 0 ), ( 0, 0, 1 ) );
        return;
    }
    
    util::playfxontag( localclientnum, level._effect[ #"hash_bc1e5225071e47d" ], self, "tag_origin" );
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 3, eflags: 0x4
// Checksum 0xfadb0e62, Offset: 0x15d0
// Size: 0xf6
function private function_cfefd76a( localclientnum, var_b3673abf, var_3ab46b9 )
{
    self endon( var_3ab46b9 );
    s_result = level waittill( #"respawn" );
    a_e_players = getlocalplayers();
    
    foreach ( e_player in a_e_players )
    {
        if ( isdefined( var_b3673abf ) )
        {
            e_player stoploopsound( var_b3673abf );
            var_b3673abf = undefined;
        }
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0x2076129e, Offset: 0x16d0
// Size: 0x74
function chakram_whirlwind_shred_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::playfxontag( localclientnum, level._effect[ #"hash_49a09babc9ee918a" ], self, "j_spine4" );
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 7
// Checksum 0xafe3fd62, Offset: 0x1750
// Size: 0xfa
function chakram_rumble( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue )
    {
        switch ( newvalue )
        {
            case 2:
                self playrumbleonentity( localclientnum, "zm_weap_chakram_catch_rumble" );
                break;
            case 4:
                self playrumbleonentity( localclientnum, "zm_weap_chakram_melee_rumble" );
                break;
            case 5:
                self playrumbleonentity( localclientnum, "zm_weap_chakram_throw_rumble" );
                break;
        }
    }
}

