#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace wz_asylum;

// Namespace wz_asylum/wz_asylum
// Params 0, eflags: 0x2
// Checksum 0x4124ea3f, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wz_asylum", &__init__, undefined, undefined );
}

// Namespace wz_asylum/wz_asylum
// Params 0, eflags: 0x2
// Checksum 0x63fd1bb3, Offset: 0x100
// Size: 0xae
function autoexec __init()
{
    level.var_7ad3f6a0 = ( isdefined( getgametypesetting( #"hash_3778ec3bd924f17c" ) ) ? getgametypesetting( #"hash_3778ec3bd924f17c" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_6382d9dfeaeaa0f3" ) ) ? getgametypesetting( #"hash_6382d9dfeaeaa0f3" ) : 0 );
}

// Namespace wz_asylum/wz_asylum
// Params 0
// Checksum 0x1c021631, Offset: 0x1b8
// Size: 0x4c
function __init__()
{
    clientfield::register( "world", "toilet_ee_play", 19000, 2, "int", &toilet_ee_play, 0, 0 );
}

// Namespace wz_asylum/wz_asylum
// Params 7
// Checksum 0xa74000d9, Offset: 0x210
// Size: 0x18a
function toilet_ee_play( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval > 0 )
    {
        toilet = getdynent( #"asylum_toilet" );
        
        if ( isdefined( toilet ) && isdefined( toilet.target ) )
        {
            s_sound = struct::get( toilet.target, "targetname" );
            
            switch ( newval )
            {
                case 1:
                    playsound( localclientnum, #"hash_563cb1fd34cb48ea", s_sound.origin );
                    break;
                case 2:
                    playsound( localclientnum, #"hash_30b0e4167d2bd505", s_sound.origin );
                    break;
                case 3:
                    playsound( localclientnum, #"hash_7672866383ae1956", s_sound.origin );
                    break;
            }
        }
    }
}

