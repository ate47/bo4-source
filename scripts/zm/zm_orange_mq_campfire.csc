#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_orange_mq_campfire;

// Namespace zm_orange_mq_campfire/zm_orange_mq_campfire
// Params 0
// Checksum 0x80f724d1, Offset: 0x88
// Size: 0x4
function preload()
{
    
}

// Namespace zm_orange_mq_campfire/zm_orange_mq_campfire
// Params 7
// Checksum 0x37450be, Offset: 0x98
// Size: 0x82
function campfire_flames( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval )
    {
        self.fx_fire = util::playfxontag( localclientnum, level._effect[ #"campfire_flames" ], self, "tag_origin" );
    }
}

