#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_white_zstandard;

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0
// Checksum 0x3bd1bf7f, Offset: 0x2b0
// Size: 0x64
function main()
{
    clientfield::register( "world", "portal_maps_init", 1, 1, "int", &portal_maps_init, 0, 0 );
    level thread function_ee816885();
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0
// Checksum 0xa52dbe1d, Offset: 0x320
// Size: 0x296
function function_ee816885()
{
    level.var_17199db2[ 0 ] = "tag_start_chest1";
    level.var_17199db2[ 1 ] = "tag_start_chest2";
    level.var_17199db2[ 2 ] = "tag_green_backyard_chest";
    level.var_17199db2[ 3 ] = "tag_yellow_backyard_chest";
    level.var_17199db2[ 4 ] = "tag_bunker1_chest";
    level.var_17199db2[ 5 ] = "tag_bunker2_chest";
    level.var_17199db2[ 6 ] = "tag_cul_de_sac_chest";
    level.var_b231fd3d[ 0 ] = "tag_green_house";
    level.var_b231fd3d[ 1 ] = "tag_hammond_house";
    level.var_b231fd3d[ 2 ] = "tag_hoggatt_house";
    level.var_b231fd3d[ 3 ] = "tag_obrien_house";
    level.var_b231fd3d[ 4 ] = "tag_reinsel_house";
    level.var_b231fd3d[ 5 ] = "tag_yellow_house";
    level.var_b231fd3d[ 6 ] = "tag_generators";
    level.var_c5a72006[ 0 ] = "tag_green_house_backyard";
    level.var_c5a72006[ 1 ] = "tag_red_house";
    level.var_c5a72006[ 2 ] = "tag_yellow_house";
    level.var_c5a72006[ 3 ] = "tag_prisoner_holding";
    level.var_c5a72006[ 4 ] = "tag_street_middle";
    level.var_c5a72006[ 5 ] = "tag_transfusion_facility";
    level.var_c5a72006[ 6 ] = "tag_diner";
    level.var_c5a72006[ 7 ] = "tag_beds";
    level.var_c5a72006[ 8 ] = "tag_power";
    level.var_c5a72006[ 9 ] = "tag_storage";
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 7
// Checksum 0xbe1a7b15, Offset: 0x5c0
// Size: 0x64
function portal_maps_init( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        level thread function_87155ea1( localclientnum );
    }
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 1
// Checksum 0xdeaf8f43, Offset: 0x630
// Size: 0x250
function function_87155ea1( localclientnum )
{
    if ( !isdefined( level.var_8f14a19 ) )
    {
        level.var_8f14a19 = getentarray( localclientnum, "portal_map", "targetname" );
    }
    
    foreach ( var_35f97c42 in level.var_8f14a19 )
    {
        var_35f97c42 util::waittill_dobj( localclientnum );
        
        foreach ( var_38cc3e41 in level.var_b231fd3d )
        {
            var_35f97c42 hidepart( localclientnum, var_38cc3e41 + "_clear" );
            var_35f97c42 hidepart( localclientnum, var_38cc3e41 + "_clogged" );
        }
        
        foreach ( var_c5a72006 in level.var_c5a72006 )
        {
            var_35f97c42 hidepart( localclientnum, var_c5a72006 + "_on" );
            var_35f97c42 hidepart( localclientnum, var_c5a72006 + "_active" );
        }
        
        var_35f97c42 hidepart( localclientnum, "tag_nuked_lights" );
    }
}

