#using scripts\core_common\system_shared;

#namespace zm_mansion_ffotd;

// Namespace zm_mansion_ffotd/zm_mansion_ffotd
// Params 0, eflags: 0x2
// Checksum 0x5adeca3e, Offset: 0x1b8
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_mansion_ffotd", &__init__, &__main__, undefined );
}

// Namespace zm_mansion_ffotd/zm_mansion_ffotd
// Params 0
// Checksum 0xda2f6dc4, Offset: 0x208
// Size: 0x12c
function __init__()
{
    var_a8b89e21 = getweapon( #"zitem_rocketshield_part_3" );
    a_items = getitemarray();
    
    foreach ( item in a_items )
    {
        w_item = item.item;
        
        if ( w_item == var_a8b89e21 )
        {
            if ( item.origin == ( -1674, 830, -156 ) )
            {
                item.angles = ( 338.592, 336.969, 0 );
                item.origin = ( -1642.11, 851.905, -205 );
                return;
            }
        }
    }
}

// Namespace zm_mansion_ffotd/zm_mansion_ffotd
// Params 0
// Checksum 0xb114d82d, Offset: 0x340
// Size: 0x21c
function __main__()
{
    spawncollision( "collision_clip_wall_256x256x10", "forest_exploit_fix_01", ( -383.5, 3194.5, -253.5 ), ( 0, 61.5035, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "bedroom_stairs_exploit_fix_01", ( 1753, 554.5, -24 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "tea_room_theater_exploit_01", ( -815.5, 389.5, 184 ), ( 0, 270, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "tea_room_theater_exploit_02", ( -815.5, 353, 184 ), ( 0, 270, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "tea_room_theater_exploit_03", ( -645.5, 192, 185.5 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "tea_room_theater_exploit_04", ( -655.5, 192, 185.5 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "dining_ramp_exploit_01", ( 1251.5, 71, -46 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "dining_ramp_exploit_02", ( 1251.5, 71, 82 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_wall_128x128x10", "music_room_hole_exploit_01", ( 973, -482, 101.5 ), ( 0, 0, 0 ) );
}

