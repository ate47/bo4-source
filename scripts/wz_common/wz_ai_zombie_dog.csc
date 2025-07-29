#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zombie_dog_util;

// Namespace zombie_dog_util/wz_ai_zombie_dog
// Params 0, eflags: 0x2
// Checksum 0x332ab6b9, Offset: 0x120
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zombie_dog_util", &__init__, undefined, undefined );
}

// Namespace zombie_dog_util/wz_ai_zombie_dog
// Params 0
// Checksum 0x1b5da035, Offset: 0x168
// Size: 0xa4
function __init__()
{
    init_dog_fx();
    clientfield::register( "actor", "dog_fx", 15000, 1, "int", &dog_fx, 0, 0 );
    clientfield::register( "actor", "dog_spawn_fx", 15000, 1, "counter", &dog_spawn_fx, 0, 0 );
}

// Namespace zombie_dog_util/wz_ai_zombie_dog
// Params 0
// Checksum 0xe64595f6, Offset: 0x218
// Size: 0x182
function init_dog_fx()
{
    level._effect[ #"dog_eye_glow" ] = #"hash_70696527ecb861ae";
    level._effect[ #"hash_55d6ab2c7eecbad4" ] = #"hash_249f091d13da3663";
    level._effect[ #"hash_808a86715bfac90" ] = #"hash_78f02617f4f71d8a";
    level._effect[ #"hash_5e4d4083a69396b8" ] = #"hash_36a9dd505e78a";
    level._effect[ #"hash_33fd6545401e3622" ] = #"hash_39b25de05718b20c";
    level._effect[ #"hash_63f497890003547" ] = #"hash_3055dc23ae9ca695";
    level._effect[ #"dog_gib" ] = #"zm_ai/fx8_dog_death_exp";
    level._effect[ #"lightning_dog_spawn" ] = #"hash_50a6b2497d454910";
}

// Namespace zombie_dog_util/wz_ai_zombie_dog
// Params 7
// Checksum 0x3ebe49a6, Offset: 0x3a8
// Size: 0x3cc
function dog_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( newval )
    {
        if ( !isdefined( self.var_93471229 ) )
        {
            self.var_93471229 = [];
        }
        
        array::add( self.var_93471229, util::playfxontag( localclientnum, level._effect[ #"hash_808a86715bfac90" ], self, "j_neck_end" ) );
        array::add( self.var_93471229, util::playfxontag( localclientnum, level._effect[ #"hash_5e4d4083a69396b8" ], self, "j_tail0" ) );
        array::add( self.var_93471229, util::playfxontag( localclientnum, level._effect[ #"hash_5e4d4083a69396b8" ], self, "j_tail1" ) );
        array::add( self.var_93471229, util::playfxontag( localclientnum, level._effect[ #"hash_33fd6545401e3622" ], self, "j_spine2" ) );
        array::add( self.var_93471229, util::playfxontag( localclientnum, level._effect[ #"hash_63f497890003547" ], self, "j_neck" ) );
        array::add( self.var_93471229, util::playfxontag( localclientnum, level._effect[ #"hash_55d6ab2c7eecbad4" ], self, "tag_eye" ) );
        array::add( self.var_93471229, util::playfxontag( localclientnum, level._effect[ #"dog_eye_glow" ], self, "j_eyeball_le" ) );
        self mapshaderconstant( localclientnum, 0, "scriptVector2", 0, 1, 1 );
        return;
    }
    
    if ( isdefined( self.var_93471229 ) )
    {
        foreach ( fxhandle in self.var_93471229 )
        {
            deletefx( localclientnum, fxhandle );
        }
    }
    
    util::playfxontag( localclientnum, level._effect[ #"dog_gib" ], self, "j_spine2" );
    physicsexplosionsphere( localclientnum, self.origin, 150, 0, 0.15 );
}

// Namespace zombie_dog_util/wz_ai_zombie_dog
// Params 7
// Checksum 0xba92f739, Offset: 0x780
// Size: 0x74
function dog_spawn_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    util::playfxontag( localclientnum, level._effect[ #"lightning_dog_spawn" ], self, "j_spine2" );
}

