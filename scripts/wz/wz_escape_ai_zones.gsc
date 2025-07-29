#using scripts\core_common\array_shared;
#using scripts\core_common\struct;
#using scripts\wz_common\wz_ai_utils;
#using scripts\wz_common\wz_ai_zonemgr;

#namespace wz_escape_ai_zones;

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 0
// Checksum 0x7f102c66, Offset: 0xc0
// Size: 0x5ec
function init()
{
    level.var_dc16557c = 1;
    level.var_c64b3b46 = 1;
    level.var_754d756 = ( isdefined( getgametypesetting( #"hash_3e2d2cf6b1cc6c68" ) ) ? getgametypesetting( #"hash_3e2d2cf6b1cc6c68" ) : 0 ) || ( isdefined( getgametypesetting( #"hash_1b4a66a008f60927" ) ) ? getgametypesetting( #"hash_1b4a66a008f60927" ) : 0 );
    level.var_fd7ef894 = isdefined( getgametypesetting( #"hash_3624143624604b4c" ) ) ? getgametypesetting( #"hash_3624143624604b4c" ) : 0;
    level.var_6da69360 = isdefined( getgametypesetting( #"hash_1bcb7e5d76212b76" ) ) ? getgametypesetting( #"hash_1bcb7e5d76212b76" ) : 0;
    level.var_f8f715a7 = isdefined( getgametypesetting( #"hash_76fb3219916a09f2" ) ) ? getgametypesetting( #"hash_76fb3219916a09f2" ) : 0;
    level.var_81d13d70 = isdefined( getgametypesetting( #"hash_44c7473eab6e5459" ) ) ? getgametypesetting( #"hash_44c7473eab6e5459" ) : 0;
    level.var_c62c0fea = isdefined( getgametypesetting( #"hash_4d6cfd0b3ee4cc7d" ) ) ? getgametypesetting( #"hash_4d6cfd0b3ee4cc7d" ) : 0;
    level.var_3195c89b = isdefined( getgametypesetting( #"hash_3624143624604b4c" ) ) ? getgametypesetting( #"hash_3624143624604b4c" ) : 0;
    level.var_6df0d3b6 = &function_6df0d3b6;
    
    if ( isdefined( level.warzoneblightfatherseverywhere ) && level.warzoneblightfatherseverywhere && isdefined( level.warzoneblightfatherenabled ) && level.warzoneblightfatherenabled )
    {
        function_36cc50( #"spawner_wz_blight_father", 1, 1 );
    }
    else if ( isdefined( level.warzonebrutuseverywhere ) && level.warzonebrutuseverywhere && isdefined( level.warzonebrutusenabled ) && level.warzonebrutusenabled )
    {
        function_36cc50( #"spawner_boct_brutus_wz", 4, 2 );
    }
    else if ( isdefined( level.warzonebrutuslargeeverywhere ) && level.warzonebrutuslargeeverywhere && isdefined( level.var_4f7f5c18 ) && level.var_4f7f5c18 )
    {
        function_36cc50( #"spawner_boct_brutus_special_wz", 4, 2 );
    }
    else if ( isdefined( level.warzonehellhoundseverywhere ) && level.warzonehellhoundseverywhere && isdefined( level.warzonehellhoundenabled ) && level.warzonehellhoundenabled )
    {
        function_36cc50( #"spawner_boct_zombie_dog_wz", 10, 4 );
    }
    else if ( isdefined( level.warzoneavogadroeverywhere ) && level.warzoneavogadroeverywhere && isdefined( level.warzoneavogadroenabled ) && level.warzoneavogadroenabled )
    {
        function_36cc50( #"spawner_boct_avogadro", 4, 2 );
    }
    else if ( isdefined( level.warzonezombiesmaxtest ) && level.warzonezombiesmaxtest )
    {
        function_f910ed8a();
    }
    else if ( isdefined( level.var_fd7ef894 ) && level.var_fd7ef894 )
    {
        function_f0b2e300();
    }
    else
    {
        function_c41ad9f9();
    }
    
    level notify( #"hash_7f7eec328c07606d" );
    
    if ( isdefined( level.warzonespawnspecial ) && level.warzonespawnspecial )
    {
        level thread spawn_special_ai();
    }
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 0
// Checksum 0x9361a4de, Offset: 0x6b8
// Size: 0xfe
function spawn_special_ai()
{
    level waittill( #"hash_54391c26dfd50b8a" );
    var_f71adb48 = struct::get_array( "special_ai", "script_noteworthy" );
    var_f71adb48 = array::randomize( var_f71adb48 );
    num_to_spawn = min( var_f71adb48.size, 5 );
    
    for ( i = 0; i < num_to_spawn ; i++ )
    {
        var_eb5de65e = var_f71adb48[ i ];
        wz_ai_utils::function_ac114e1f( var_eb5de65e, #"spawner_boct_zombie_mob_wz", #"cellhouse" );
        wait 0.1;
    }
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 1
// Checksum 0xbf7f4504, Offset: 0x7c0
// Size: 0x104, Type: bool
function function_6df0d3b6( zone_name )
{
    switch ( zone_name )
    {
        case #"paradegrounds":
            if ( isdefined( level.var_f8f715a7 ) && level.var_f8f715a7 )
            {
                return true;
            }
            
            break;
        case #"cellhouse":
            if ( isdefined( level.var_81d13d70 ) && level.var_81d13d70 )
            {
                return true;
            }
            
            break;
        case #"newindustries":
            if ( isdefined( level.var_c62c0fea ) && level.var_c62c0fea )
            {
                return true;
            }
            
            break;
        case #"global":
            if ( isdefined( level.var_3195c89b ) && level.var_3195c89b )
            {
                return true;
            }
            
            break;
    }
    
    return false;
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 2
// Checksum 0xe0ef7612, Offset: 0x8d0
// Size: 0x3e
function function_6e9af98a( var_2799920d, var_d6d494ab )
{
    if ( isdefined( level.var_fd6c6b69 ) && level.var_fd6c6b69 )
    {
        return var_d6d494ab;
    }
    
    return var_2799920d;
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 2
// Checksum 0x920d24b5, Offset: 0x918
// Size: 0x3e
function function_bb7cbe85( var_2799920d, var_d6d494ab )
{
    if ( isdefined( level.var_3fecd9c2 ) && level.var_3fecd9c2 )
    {
        return var_d6d494ab;
    }
    
    return var_2799920d;
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 2
// Checksum 0x2c685181, Offset: 0x960
// Size: 0x3e
function function_5f1710a5( var_2799920d, var_d6d494ab )
{
    if ( isdefined( level.var_3fecd9c2 ) && level.var_3fecd9c2 )
    {
        return var_d6d494ab;
    }
    
    return var_2799920d;
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 0
// Checksum 0x53d3d3c3, Offset: 0x9a8
// Size: 0x3c
function function_8854d951()
{
    wz_ai_zonemgr::function_3a69e98c( #"global", #"spawner_boct_zombie_mob_wz", 12 );
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 0
// Checksum 0x938bdb6, Offset: 0x9f0
// Size: 0x71c
function function_f0b2e300()
{
    level.var_86c18344 = 0;
    
    if ( isdefined( level.var_6da69360 ) && level.var_6da69360 )
    {
        level.var_ff8e9324 = 20;
    }
    
    level.var_45e13026 = 1;
    level.var_8854d951 = &function_8854d951;
    var_34a27e6c = ( 24, 5, 1 );
    var_5af62480 = getdvarint( #"hash_78162e99d6e60377", 0 );
    
    if ( isdefined( var_5af62480 ) && var_5af62480 )
    {
        var_34a27e6c = getdvarvector( #"hash_7b235a13caefcdba", ( 24, 5, 1 ) );
    }
    
    maxaicount = 240;
    maxalivecount = var_34a27e6c[ 0 ];
    var_5b2d986e = 10;
    wz_ai_zonemgr::function_5f0d105a( 0, #"global", #"spawner_boct_zombie_mob_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_321414a( #"global", #"spawner_boct_zombie_mob_wz", #"paradegrounds" );
    wz_ai_zonemgr::function_321414a( #"global", #"spawner_boct_zombie_mob_wz", #"newindustries" );
    wz_ai_zonemgr::function_321414a( #"global", #"spawner_boct_zombie_mob_wz", #"cellhouse" );
    wz_ai_zonemgr::function_8e672218( #"global", #"spawner_boct_zombie_mob_wz", 1 );
    wz_ai_zonemgr::function_c3bb62c1( #"global", #"spawner_boct_zombie_mob_wz", 0 );
    maxaicount = 10;
    maxalivecount = var_34a27e6c[ 1 ];
    var_5b2d986e = 3;
    wz_ai_zonemgr::function_5f0d105a( 1, #"paradegrounds", #"spawner_boct_zombie_dog_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_5f0d105a( 1, #"newindustries", #"spawner_boct_zombie_dog_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_6c75dee3( #"paradegrounds", #"spawner_boct_zombie_dog_wz", 5 );
    wz_ai_zonemgr::function_6c75dee3( #"newindustries", #"spawner_boct_zombie_dog_wz", 5 );
    wz_ai_zonemgr::function_c3bb62c1( #"paradegrounds", #"spawner_boct_zombie_dog_wz", 0 );
    wz_ai_zonemgr::function_c3bb62c1( #"newindustries", #"spawner_boct_zombie_dog_wz", 0 );
    maxaicount = 1;
    maxalivecount = var_34a27e6c[ 2 ];
    var_5b2d986e = 1;
    wz_ai_zonemgr::function_5f0d105a( 2, #"paradegrounds", #"spawner_boct_brutus_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_5f0d105a( 2, #"cellhouse", #"spawner_boct_brutus_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_5f0d105a( 2, #"newindustries", #"spawner_boct_brutus_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_6c75dee3( #"paradegrounds", #"spawner_boct_brutus_wz", 3 );
    wz_ai_zonemgr::function_6c75dee3( #"cellhouse", #"spawner_boct_brutus_wz", 3 );
    wz_ai_zonemgr::function_6c75dee3( #"newindustries", #"spawner_boct_brutus_wz", 3 );
    wz_ai_zonemgr::function_c3bb62c1( #"paradegrounds", #"spawner_boct_brutus_wz", 2 );
    wz_ai_zonemgr::function_c3bb62c1( #"cellhouse", #"spawner_boct_brutus_wz", 2 );
    wz_ai_zonemgr::function_c3bb62c1( #"newindustries", #"spawner_boct_brutus_wz", 2 );
    wz_ai_zonemgr::function_462b41e2( #"paradegrounds", #"spawner_boct_brutus_wz", #"hash_3e4109550d98219f", #"hash_43b30c7ff9b4f4c2", #"hash_3c449d1a7a0cd70e" );
    wz_ai_zonemgr::function_462b41e2( #"cellhouse", #"spawner_boct_brutus_wz", #"hash_3e410a550d982352", #"hash_367f5a5f344dcda7", #"hash_6a498d20dd284089" );
    wz_ai_zonemgr::function_462b41e2( #"newindustries", #"spawner_boct_brutus_wz", #"hash_3e410b550d982505", #"hash_451e5522eeb07ee8", #"hash_3db2892c24c8a1bc" );
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 0
// Checksum 0xc7639896, Offset: 0x1118
// Size: 0x37c
function function_c41ad9f9()
{
    var_ce0426e0 = ( function_6e9af98a( 7, 10 ), function_bb7cbe85( 5, 7 ), function_5f1710a5( 0, 0 ) );
    var_b0befc80 = getdvar( #"hash_15fba4abe8704cb8", 0 );
    
    if ( isdefined( var_b0befc80 ) && var_b0befc80 )
    {
        var_ce0426e0 = getdvarvector( #"hash_cbccd885e75d219", ( 10, 5, 2 ) );
    }
    
    maxaicount = var_ce0426e0[ 0 ];
    maxalivecount = var_ce0426e0[ 1 ];
    var_5b2d986e = var_ce0426e0[ 2 ];
    wz_ai_zonemgr::function_5f0d105a( 0, #"paradegrounds", #"spawner_boct_zombie_mob_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_6c75dee3( #"paradegrounds", #"spawner_boct_zombie_mob_wz", 1 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"cellhouse", #"spawner_boct_zombie_mob_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_6c75dee3( #"cellhouse", #"spawner_boct_zombie_mob_wz", 1 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"newindustries", #"spawner_boct_zombie_mob_wz", maxaicount, maxalivecount, var_5b2d986e );
    wz_ai_zonemgr::function_6c75dee3( #"newindustries", #"spawner_boct_zombie_mob_wz", 1 );
    wz_ai_zonemgr::function_462b41e2( #"paradegrounds", #"spawner_boct_zombie_mob_wz", #"hash_3e4109550d98219f", #"hash_43b30c7ff9b4f4c2", #"hash_3c449d1a7a0cd70e" );
    wz_ai_zonemgr::function_462b41e2( #"cellhouse", #"spawner_boct_zombie_mob_wz", #"hash_3e410a550d982352", #"hash_367f5a5f344dcda7", #"hash_6a498d20dd284089" );
    wz_ai_zonemgr::function_462b41e2( #"newindustries", #"spawner_boct_zombie_mob_wz", #"hash_3e410b550d982505", #"hash_451e5522eeb07ee8", #"hash_3db2892c24c8a1bc" );
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 0
// Checksum 0x51f89ed6, Offset: 0x14a0
// Size: 0x1e4
function function_4cfa640c()
{
    wz_ai_zonemgr::function_5f0d105a( 0, #"paradegrounds", #"spawner_boct_zombie_dog_wz", 10, 4, 4 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"cellhouse", #"spawner_boct_zombie_dog_wz", 10, 4, 4 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"newindustries", #"spawner_boct_zombie_dog_wz", 10, 4, 4 );
    wz_ai_zonemgr::function_462b41e2( #"paradegrounds", #"spawner_boct_zombie_dog_wz", #"hash_3e4109550d98219f", #"hash_43b30c7ff9b4f4c2", #"hash_3c449d1a7a0cd70e" );
    wz_ai_zonemgr::function_462b41e2( #"cellhouse", #"spawner_boct_zombie_dog_wz", #"hash_3e410a550d982352", #"hash_367f5a5f344dcda7", #"hash_6a498d20dd284089" );
    wz_ai_zonemgr::function_462b41e2( #"newindustries", #"spawner_boct_zombie_dog_wz", #"hash_3e410b550d982505", #"hash_451e5522eeb07ee8", #"hash_3db2892c24c8a1bc" );
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 3
// Checksum 0x76e95f0c, Offset: 0x1690
// Size: 0x214
function function_36cc50( var_8667e69, maxcount, maxalive )
{
    wz_ai_zonemgr::function_5f0d105a( 0, #"paradegrounds", var_8667e69, maxcount, maxalive, 0 );
    wz_ai_zonemgr::function_c3bb62c1( #"paradegrounds", var_8667e69, 2 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"cellhouse", var_8667e69, maxcount, maxalive, 0 );
    wz_ai_zonemgr::function_c3bb62c1( #"cellhouse", var_8667e69, 2 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"newindustries", var_8667e69, maxcount, maxalive, 0 );
    wz_ai_zonemgr::function_c3bb62c1( #"newindustries", var_8667e69, 2 );
    wz_ai_zonemgr::function_462b41e2( #"paradegrounds", var_8667e69, #"hash_3e4109550d98219f", #"hash_43b30c7ff9b4f4c2", #"hash_3c449d1a7a0cd70e" );
    wz_ai_zonemgr::function_462b41e2( #"cellhouse", var_8667e69, #"hash_3e410a550d982352", #"hash_367f5a5f344dcda7", #"hash_6a498d20dd284089" );
    wz_ai_zonemgr::function_462b41e2( #"newindustries", var_8667e69, #"hash_3e410b550d982505", #"hash_451e5522eeb07ee8", #"hash_3db2892c24c8a1bc" );
}

// Namespace wz_escape_ai_zones/wz_escape_ai_zones
// Params 0
// Checksum 0xce1cb5ae, Offset: 0x18b0
// Size: 0x26c
function function_f910ed8a()
{
    zombie_count = max( level.warzonezombiesmaxcount, 1 );
    
    if ( isdedicated() )
    {
        iprintlnbold( "Zombie count is " + zombie_count + "\n" );
    }
    
    var_c3bb4e09 = zombie_count;
    var_f1fbce84 = zombie_count;
    var_aeae9f59 = var_f1fbce84 + var_f1fbce84;
    wz_ai_zonemgr::function_5f0d105a( 0, #"paradegrounds", #"spawner_boct_zombie_mob_wz", var_aeae9f59, var_f1fbce84, var_c3bb4e09 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"cellhouse", #"spawner_boct_zombie_mob_wz", var_aeae9f59, var_f1fbce84, var_c3bb4e09 );
    wz_ai_zonemgr::function_5f0d105a( 0, #"newindustries", #"spawner_boct_zombie_mob_wz", var_aeae9f59, var_f1fbce84, var_c3bb4e09 );
    wz_ai_zonemgr::function_462b41e2( #"paradegrounds", #"spawner_boct_zombie_mob_wz", #"hash_3e4109550d98219f", #"hash_43b30c7ff9b4f4c2", #"hash_3c449d1a7a0cd70e" );
    wz_ai_zonemgr::function_462b41e2( #"cellhouse", #"spawner_boct_zombie_mob_wz", #"hash_3e410a550d982352", #"hash_367f5a5f344dcda7", #"hash_6a498d20dd284089" );
    wz_ai_zonemgr::function_462b41e2( #"newindustries", #"spawner_boct_zombie_mob_wz", #"hash_3e410b550d982505", #"hash_451e5522eeb07ee8", #"hash_3db2892c24c8a1bc" );
}

