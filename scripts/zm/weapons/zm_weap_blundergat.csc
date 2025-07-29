#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_weap_blundergat;

// Namespace zm_weap_blundergat/zm_weap_blundergat
// Params 0, eflags: 0x2
// Checksum 0x98770b8f, Offset: 0x2a8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_blundergat", &__init__, undefined, undefined );
}

// Namespace zm_weap_blundergat/zm_weap_blundergat
// Params 0
// Checksum 0xa0f5f881, Offset: 0x2f0
// Size: 0x3fa
function __init__()
{
    clientfield::register( "missile", "blundergat_dart_blink", 1, 1, "int", &blundergat_dart_blink, 0, 0 );
    clientfield::register( "scriptmover", "blundergat_dart_blink", 1, 1, "int", &blundergat_dart_blink, 0, 0 );
    clientfield::register( "scriptmover", "magma_gat_blob_fx", 1, 2, "int", &magma_gat_blob_fx, 0, 0 );
    n_bits = getminbitcountfornum( 6 );
    clientfield::register( "actor", "positional_zombie_fire_fx", 1, n_bits, "int", &positional_zombie_fire_fx, 0, 0 );
    clientfield::register( "actor", "zombie_magma_fire_explosion", 1, 1, "int", &zombie_magma_fire_explosion, 0, 0 );
    level._effect[ #"dart_light" ] = #"hash_64a1305d0a32ab5c";
    level._effect[ #"hash_246bcda21a086519" ] = #"hash_43a0a5d1ff9073d1";
    level._effect[ #"hash_1ac90f7b38a61c4f" ] = #"hash_209f1d5520f6f4aa";
    level._effect[ #"magma_fire_explosion" ] = #"hash_8b3391780a4489a";
    level._effect[ #"zombie_fire_fx_head" ] = #"hash_6b19659fd76f81c6";
    level._effect[ #"zombie_fire_fx_arm_left" ] = #"hash_119076c138c439de";
    level._effect[ #"zombie_fire_fx_arm_right" ] = #"hash_657f3202e3b4b33";
    level._effect[ #"zombie_fire_fx_torso" ] = #"hash_7318fda4b878154b";
    level._effect[ #"zombie_fire_fx_waist" ] = #"hash_77ce4eece51be38e";
    level._effect[ #"zombie_fire_fx_leg_left" ] = #"hash_7892c8f224113e3c";
    level._effect[ #"zombie_fire_fx_leg_right" ] = #"hash_3724539471890d29";
    level._effect[ #"zombie_fire_fx_hip_left" ] = #"hash_7b28ddc1bdd23a79";
    level._effect[ #"zombie_fire_fx_hip_right" ] = #"hash_2c1d46fac64d3252";
}

// Namespace zm_weap_blundergat/zm_weap_blundergat
// Params 7
// Checksum 0xe7328fcd, Offset: 0x6f8
// Size: 0x12e
function blundergat_dart_blink( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        if ( isdefined( self.var_91180673 ) )
        {
            stopfx( localclientnum, self.var_91180673 );
        }
        
        self.var_91180673 = util::playfxontag( localclientnum, level._effect[ #"dart_light" ], self, "tag_origin" );
        soundloopemitter( "wpn_blundergat_acid_fuse", self.origin );
        return;
    }
    
    soundstoploopemitter( "wpn_blundergat_acid_fuse", self.origin );
    
    if ( isdefined( self.var_91180673 ) )
    {
        stopfx( localclientnum, self.var_91180673 );
        self.var_91180673 = undefined;
    }
}

// Namespace zm_weap_blundergat/zm_weap_blundergat
// Params 7
// Checksum 0x6d0364b9, Offset: 0x830
// Size: 0x25e
function magma_gat_blob_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        if ( isdefined( self.var_91180673 ) )
        {
            stopfx( localclientnum, self.var_91180673 );
        }
        
        self.var_91180673 = util::playfxontag( localclientnum, level._effect[ #"hash_246bcda21a086519" ], self, "tag_origin" );
        
        if ( !isdefined( self.var_9c114e48 ) )
        {
            self playsound( localclientnum, #"hash_3f496991d8b9c581" );
            self.var_9c114e48 = self playloopsound( #"hash_46b64953a23cf81" );
        }
        
        return;
    }
    
    if ( newval == 2 )
    {
        if ( isdefined( self.var_91180673 ) )
        {
            stopfx( localclientnum, self.var_91180673 );
        }
        
        self.var_91180673 = util::playfxontag( localclientnum, level._effect[ #"hash_1ac90f7b38a61c4f" ], self, "tag_origin" );
        
        if ( !isdefined( self.var_9c114e48 ) )
        {
            self playsound( localclientnum, #"hash_3f496991d8b9c581" );
            self.var_9c114e48 = self playloopsound( #"hash_46b64953a23cf81" );
        }
        
        return;
    }
    
    if ( isdefined( self.var_91180673 ) )
    {
        stopfx( localclientnum, self.var_91180673 );
        self.var_91180673 = undefined;
    }
    
    if ( isdefined( self.var_9c114e48 ) )
    {
        self stoploopsound( self.var_9c114e48 );
        self.var_9c114e48 = undefined;
    }
}

// Namespace zm_weap_blundergat/zm_weap_blundergat
// Params 7
// Checksum 0x4fb2feac, Offset: 0xa98
// Size: 0x114
function zombie_magma_fire_explosion( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( isdefined( self.var_4a4174e9 ) )
    {
        stopfx( localclientnum, self.var_4a4174e9 );
        self.var_4a4174e9 = undefined;
    }
    
    if ( newval == 1 )
    {
        str_tag = "j_spineupper";
        
        if ( self.archetype == #"zombie_dog" )
        {
            str_tag = "j_spine1";
        }
        
        self.var_4a4174e9 = util::playfxontag( localclientnum, level._effect[ #"magma_fire_explosion" ], self, str_tag );
        self playsound( localclientnum, #"hash_7ddaece972d0ba7f" );
    }
}

// Namespace zm_weap_blundergat/zm_weap_blundergat
// Params 7
// Checksum 0x29bcd6eb, Offset: 0xbb8
// Size: 0x48c
function positional_zombie_fire_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( isdefined( self.var_70ed1f91 ) && self.var_70ed1f91.size )
    {
        foreach ( n_fx in self.var_70ed1f91 )
        {
            if ( isdefined( n_fx ) )
            {
                stopfx( localclientnum, n_fx );
            }
        }
        
        self.var_70ed1f91 = undefined;
        self notify( #"hash_78e383e31572444d" );
    }
    
    if ( !isdefined( self.var_70ed1f91 ) )
    {
        self.var_70ed1f91 = [];
    }
    
    if ( newval >= 1 )
    {
        if ( !isdefined( self.var_418df093 ) )
        {
            self playsound( localclientnum, #"hash_4539c48ed56aa72b" );
            self.var_418df093 = self playloopsound( #"hash_729fda7f41c1cb45" );
        }
        
        switch ( newval )
        {
            case 1:
                var_5f2b0dab = "zombie_fire_fx_head";
                str_tag = "j_neck";
                break;
            case 2:
                str_tag = array::random( array( "j_spineupper", "j_spinelower" ) );
                
                if ( str_tag == "j_spinelower" )
                {
                    var_5f2b0dab = "zombie_fire_fx_waist";
                }
                else
                {
                    var_5f2b0dab = "zombie_fire_fx_torso";
                }
                
                break;
            case 3:
                var_5f2b0dab = "zombie_fire_fx_arm_left";
                str_tag = "j_shoulder_le";
                break;
            case 4:
                var_5f2b0dab = "zombie_fire_fx_arm_right";
                str_tag = "j_shoulder_ri";
                break;
            case 5:
                str_tag = array::random( array( "j_hip_le", "j_knee_le" ) );
                
                if ( str_tag == "j_hip_le" )
                {
                    var_5f2b0dab = "zombie_fire_fx_hip_left";
                }
                else
                {
                    var_5f2b0dab = "zombie_fire_fx_leg_left";
                }
                
                break;
            case 6:
                str_tag = array::random( array( "j_hip_ri", "j_knee_ri" ) );
                
                if ( str_tag == "j_hip_ri" )
                {
                    var_5f2b0dab = "zombie_fire_fx_hip_right";
                }
                else
                {
                    var_5f2b0dab = "zombie_fire_fx_leg_right";
                }
                
                break;
            default:
                str_tag = array::random( array( "j_spineupper", "j_spinelower" ) );
                
                if ( str_tag == "j_spinelower" )
                {
                    var_5f2b0dab = "zombie_fire_fx_waist";
                }
                else
                {
                    var_5f2b0dab = "zombie_fire_fx_torso";
                }
                
                break;
        }
        
        self.var_70ed1f91[ self.var_70ed1f91.size ] = util::playfxontag( localclientnum, level._effect[ var_5f2b0dab ], self, str_tag );
        self thread function_6af9874( localclientnum, newval );
        return;
    }
    
    if ( isdefined( self.var_418df093 ) )
    {
        self stoploopsound( self.var_418df093 );
    }
}

// Namespace zm_weap_blundergat/zm_weap_blundergat
// Params 2, eflags: 0x4
// Checksum 0x5856bcbb, Offset: 0x1050
// Size: 0x8d4
function private function_6af9874( localclientnum, newval )
{
    self endon( #"death", #"hash_78e383e31572444d" );
    n_spread = 0;
    var_ea2ed6dc = [];
    var_aebebb0e = [];
    wait 0.5;
    
    switch ( newval )
    {
        case 1:
            var_ea2ed6dc[ 0 ] = "zombie_fire_fx_torso";
            var_aebebb0e[ 0 ] = "j_spineupper";
            var_ea2ed6dc[ 1 ] = "zombie_fire_fx_arm_left";
            var_aebebb0e[ 1 ] = "j_shoulder_le";
            var_ea2ed6dc[ 2 ] = "zombie_fire_fx_arm_right";
            var_aebebb0e[ 2 ] = "j_shoulder_ri";
            var_ea2ed6dc[ 3 ] = "zombie_fire_fx_waist";
            var_aebebb0e[ 3 ] = "j_spinelower";
            var_ea2ed6dc[ 4 ] = "zombie_fire_fx_hip_right";
            var_aebebb0e[ 4 ] = "j_hip_ri";
            var_ea2ed6dc[ 5 ] = "zombie_fire_fx_hip_left";
            var_aebebb0e[ 5 ] = "j_hip_le";
            var_ea2ed6dc[ 6 ] = "zombie_fire_fx_leg_left";
            var_aebebb0e[ 6 ] = "j_knee_le";
            var_ea2ed6dc[ 7 ] = "zombie_fire_fx_leg_right";
            var_aebebb0e[ 7 ] = "j_knee_ri";
            break;
        case 2:
            var_ea2ed6dc[ 0 ] = "zombie_fire_fx_arm_left";
            var_aebebb0e[ 0 ] = "j_shoulder_le";
            var_ea2ed6dc[ 1 ] = "zombie_fire_fx_arm_right";
            var_aebebb0e[ 1 ] = "j_shoulder_ri";
            var_ea2ed6dc[ 2 ] = "zombie_fire_fx_waist";
            var_aebebb0e[ 2 ] = "j_spinelower";
            var_ea2ed6dc[ 3 ] = "zombie_fire_fx_hip_right";
            var_aebebb0e[ 3 ] = "j_hip_ri";
            var_ea2ed6dc[ 4 ] = "zombie_fire_fx_hip_left";
            var_aebebb0e[ 4 ] = "j_hip_le";
            var_ea2ed6dc[ 5 ] = "zombie_fire_fx_leg_left";
            var_aebebb0e[ 5 ] = "j_knee_le";
            var_ea2ed6dc[ 6 ] = "zombie_fire_fx_leg_right";
            var_aebebb0e[ 6 ] = "j_knee_ri";
            var_ea2ed6dc[ 7 ] = "zombie_fire_fx_head";
            var_aebebb0e[ 7 ] = "j_head";
            break;
        case 3:
            var_ea2ed6dc[ 0 ] = "zombie_fire_fx_torso";
            var_aebebb0e[ 0 ] = "j_spineupper";
            var_ea2ed6dc[ 1 ] = "zombie_fire_fx_arm_right";
            var_aebebb0e[ 1 ] = "j_shoulder_ri";
            var_ea2ed6dc[ 2 ] = "zombie_fire_fx_waist";
            var_aebebb0e[ 2 ] = "j_spinelower";
            var_ea2ed6dc[ 3 ] = "zombie_fire_fx_hip_right";
            var_aebebb0e[ 3 ] = "j_hip_ri";
            var_ea2ed6dc[ 4 ] = "zombie_fire_fx_hip_left";
            var_aebebb0e[ 4 ] = "j_hip_le";
            var_ea2ed6dc[ 5 ] = "zombie_fire_fx_leg_left";
            var_aebebb0e[ 5 ] = "j_knee_le";
            var_ea2ed6dc[ 6 ] = "zombie_fire_fx_leg_right";
            var_aebebb0e[ 6 ] = "j_knee_ri";
            var_ea2ed6dc[ 7 ] = "zombie_fire_fx_head";
            var_aebebb0e[ 7 ] = "j_head";
            break;
        case 4:
            var_ea2ed6dc[ 0 ] = "zombie_fire_fx_torso";
            var_aebebb0e[ 0 ] = "j_spineupper";
            var_ea2ed6dc[ 1 ] = "zombie_fire_fx_arm_left";
            var_aebebb0e[ 1 ] = "j_shoulder_le";
            var_ea2ed6dc[ 2 ] = "zombie_fire_fx_waist";
            var_aebebb0e[ 2 ] = "j_spinelower";
            var_ea2ed6dc[ 3 ] = "zombie_fire_fx_hip_right";
            var_aebebb0e[ 3 ] = "j_hip_ri";
            var_ea2ed6dc[ 4 ] = "zombie_fire_fx_hip_left";
            var_aebebb0e[ 4 ] = "j_hip_le";
            var_ea2ed6dc[ 5 ] = "zombie_fire_fx_leg_left";
            var_aebebb0e[ 5 ] = "j_knee_le";
            var_ea2ed6dc[ 6 ] = "zombie_fire_fx_leg_right";
            var_aebebb0e[ 6 ] = "j_knee_ri";
            var_ea2ed6dc[ 7 ] = "zombie_fire_fx_head";
            var_aebebb0e[ 7 ] = "j_head";
            break;
        case 5:
            var_ea2ed6dc[ 0 ] = "zombie_fire_fx_hip_left";
            var_aebebb0e[ 0 ] = "j_hip_le";
            var_ea2ed6dc[ 1 ] = "zombie_fire_fx_waist";
            var_aebebb0e[ 1 ] = "j_spinelower";
            var_ea2ed6dc[ 2 ] = "zombie_fire_fx_torso";
            var_aebebb0e[ 2 ] = "j_spineupper";
            var_ea2ed6dc[ 3 ] = "zombie_fire_fx_hip_right";
            var_aebebb0e[ 3 ] = "j_hip_ri";
            var_ea2ed6dc[ 4 ] = "zombie_fire_fx_leg_right";
            var_aebebb0e[ 4 ] = "j_knee_ri";
            var_ea2ed6dc[ 5 ] = "zombie_fire_fx_arm_left";
            var_aebebb0e[ 5 ] = "j_shoulder_le";
            var_ea2ed6dc[ 6 ] = "zombie_fire_fx_arm_right";
            var_aebebb0e[ 6 ] = "j_shoulder_ri";
            var_ea2ed6dc[ 7 ] = "zombie_fire_fx_head";
            var_aebebb0e[ 7 ] = "j_head";
            break;
        case 6:
            var_ea2ed6dc[ 0 ] = "zombie_fire_fx_hip_right";
            var_aebebb0e[ 0 ] = "j_hip_ri";
            var_ea2ed6dc[ 1 ] = "zombie_fire_fx_waist";
            var_aebebb0e[ 1 ] = "j_spinelower";
            var_ea2ed6dc[ 2 ] = "zombie_fire_fx_torso";
            var_aebebb0e[ 2 ] = "j_spineupper";
            var_ea2ed6dc[ 3 ] = "zombie_fire_fx_hip_left";
            var_aebebb0e[ 3 ] = "j_hip_le";
            var_ea2ed6dc[ 4 ] = "zombie_fire_fx_leg_left";
            var_aebebb0e[ 4 ] = "j_knee_le";
            var_ea2ed6dc[ 5 ] = "zombie_fire_fx_arm_left";
            var_aebebb0e[ 5 ] = "j_shoulder_le";
            var_ea2ed6dc[ 6 ] = "zombie_fire_fx_arm_right";
            var_aebebb0e[ 6 ] = "j_shoulder_ri";
            var_ea2ed6dc[ 7 ] = "zombie_fire_fx_head";
            var_aebebb0e[ 7 ] = "j_head";
            break;
    }
    
    while ( isalive( self ) && isdefined( var_ea2ed6dc[ n_spread ] ) )
    {
        self.var_70ed1f91[ self.var_70ed1f91.size ] = util::playfxontag( localclientnum, level._effect[ var_ea2ed6dc[ n_spread ] ], self, var_aebebb0e[ n_spread ] );
        n_spread++;
        wait 0.5;
    }
}

