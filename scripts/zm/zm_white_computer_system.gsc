#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_white_audio_interactables;
#using scripts\zm\zm_white_cheat_codes;
#using scripts\zm\zm_white_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;

#namespace zm_white_computer_system;

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x20aee9ec, Offset: 0xb18
// Size: 0x14
function preload()
{
    init_clientfields();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xd342e2bd, Offset: 0xb38
// Size: 0x44
function init_clientfields()
{
    clientfield::register( "toplayer", "" + #"hash_33c373888aa78dc2", 20000, 1, "counter" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x249f1c3c, Offset: 0xb88
// Size: 0x102c
function init()
{
    level flag::init( "keypad_debug" );
    level.var_f13364b4 = struct::spawn();
    level.var_f13364b4.a_n_codes = [];
    level.var_f13364b4.var_cf1f0c9 = 0;
    level.var_f13364b4.var_b1e1ac14 = 0;
    level.var_f13364b4.var_2329ffa1 = array( "x", "x", "x", "x" );
    level.var_f13364b4.var_d7813dfd = array( "x", "x", "x", "x" );
    level.var_f13364b4.var_12633dc5 = undefined;
    level.countdown_clock = struct::spawn();
    level.countdown_clock clock_init( 0 );
    level.countdown_clock function_eb17b80b();
    level.countdown_clock.var_4cdc88ae = 0;
    level thread function_45822b7e();
    
    if ( zm_utility::is_ee_enabled() )
    {
        level.var_f13364b4.a_n_codes[ 2265 ] = { #var_544c05c6:1, #var_d9d9d617:&function_607f8829 };
        level.var_f13364b4.a_n_codes[ 2739 ] = { #var_544c05c6:1, #var_d9d9d617:&function_ff176ced };
        level.var_f13364b4.a_n_codes[ 2652 ] = { #var_544c05c6:1, #var_d9d9d617:&function_95787ed2 };
        level.var_f13364b4.a_n_codes[ 7632 ] = { #var_544c05c6:1, #var_d9d9d617:&function_3887862d };
        level.var_f13364b4.a_n_codes[ 3667 ] = { #var_544c05c6:1, #var_d9d9d617:&function_d89fe502 };
        level.var_f13364b4.a_n_codes[ 6662 ] = { #var_544c05c6:1, #var_d9d9d617:&function_ccbd2e6c };
        level.var_f13364b4.a_n_codes[ 3279 ] = { #var_544c05c6:1, #var_d9d9d617:&function_ccbd2e6c };
        level.var_f13364b4.a_n_codes[ 3255 ] = { #var_544c05c6:1, #var_d9d9d617:&function_48f83a1d };
        level.var_f13364b4.a_n_codes[ 9277 ] = { #var_544c05c6:1, #var_d9d9d617:&function_f5468d9b };
        level.var_f13364b4.a_n_codes[ 7433 ] = { #var_544c05c6:1, #var_d9d9d617:&function_addac768 };
        level.var_f13364b4.a_n_codes[ 6853 ] = { #var_544c05c6:1, #var_d9d9d617:&function_a7f962c9 };
        level.var_f13364b4.a_n_codes[ 4376 ] = { #var_544c05c6:1, #var_d9d9d617:&function_8e63da67 };
        level.var_f13364b4.a_n_codes[ 4728 ] = { #var_544c05c6:1, #var_d9d9d617:&function_b015442e };
        level.var_f13364b4.a_n_codes[ 4867 ] = { #var_544c05c6:1, #var_d9d9d617:&function_7b716b93 };
        level.var_f13364b4.a_n_codes[ 8463 ] = { #var_544c05c6:1, #var_d9d9d617:&function_f4c88568 };
        level.var_f13364b4.a_n_codes[ 7836 ] = { #var_544c05c6:1, #var_d9d9d617:&function_23dac63d };
        level.var_f13364b4.a_n_codes[ 2666 ] = { #var_544c05c6:1, #var_d9d9d617:&function_23dac63d };
        level.var_f13364b4.a_n_codes[ 7225 ] = { #var_544c05c6:1, #var_d9d9d617:&function_9e9664bd };
        level.var_f13364b4.a_n_codes[ 2582 ] = { #var_544c05c6:1, #var_d9d9d617:&function_8a9baa13 };
        level.var_f13364b4.a_n_codes[ 7283 ] = { #var_544c05c6:1, #var_d9d9d617:&function_8a9baa13 };
        level.var_f13364b4.a_n_codes[ 3825 ] = { #var_544c05c6:1, #var_d9d9d617:&function_bb800be7 };
        level.var_f13364b4.a_n_codes[ 7853 ] = { #var_544c05c6:1, #var_d9d9d617:&function_77085b };
        level.var_f13364b4.a_n_codes[ 7664 ] = { #var_544c05c6:1, #var_d9d9d617:&function_8606278d };
        level.var_f13364b4.a_n_codes[ 1841 ] = { #var_544c05c6:1, #var_d9d9d617:&function_b54f6326 };
        level.var_f13364b4.a_n_codes[ 8459 ] = { #var_544c05c6:1, #var_d9d9d617:&function_685d3dab };
        level.var_f13364b4.a_n_codes[ 5653 ] = { #var_544c05c6:6, #var_d9d9d617:&function_7d008839 };
        level.var_f13364b4.a_n_codes[ 9296 ] = { #var_544c05c6:1, #var_d9d9d617:&function_a823412a };
        level.var_f13364b4.a_n_codes[ 1111 ] = { #var_544c05c6:1, #var_d9d9d617:&function_a823412a };
        level.var_f13364b4.a_n_codes[ 8368 ] = { #var_544c05c6:1, #var_d9d9d617:&function_90dbeb67 };
        level.var_f13364b4.a_n_codes[ 7268 ] = { #var_544c05c6:1, #var_d9d9d617:&function_90dbeb67 };
        level.var_f13364b4.a_n_codes[ 5683 ] = { #var_544c05c6:1, #var_d9d9d617:&function_6755931f };
        level.var_f13364b4.a_n_codes[ 5433 ] = { #var_544c05c6:1, #var_d9d9d617:&function_b94ecbd8 };
        level.var_f13364b4.a_n_codes[ 8333 ] = { #var_544c05c6:1, #var_d9d9d617:&function_ac121b1c };
        level.var_f13364b4.a_n_codes[ 1 ] = { #var_544c05c6:1, #var_d9d9d617:&function_7e966dbe };
        level.var_f13364b4.a_n_codes[ 2 ] = { #var_544c05c6:1, #var_d9d9d617:&function_9b96f239 };
        level.var_f13364b4.a_n_codes[ 3 ] = { #var_544c05c6:1, #var_d9d9d617:&function_c36b1f94 };
        level.var_f13364b4.a_n_codes[ 4 ] = { #var_544c05c6:1, #var_d9d9d617:&function_27d39a4f };
        level.var_f13364b4.a_n_codes[ 1001 ] = { #var_544c05c6:1, #var_d9d9d617:&function_998eba45 };
        level.var_f13364b4.a_n_codes[ 1002 ] = { #var_544c05c6:1, #var_d9d9d617:&function_be76c1b8 };
        level.var_f13364b4.a_n_codes[ 1003 ] = { #var_544c05c6:1, #var_d9d9d617:&function_fadd27d6 };
        level.var_f13364b4.a_n_codes[ 1004 ] = { #var_544c05c6:1, #var_d9d9d617:&function_cd2168cb };
        level.var_f13364b4.a_n_codes[ 1005 ] = { #var_544c05c6:1, #var_d9d9d617:&function_6b002f3c };
        level thread function_6338402();
        level.var_f13364b4.var_8deb4ed2 = 7626;
        level.var_f13364b4.a_n_codes[ level.var_f13364b4.var_8deb4ed2 ] = { #var_544c05c6:1, #var_d9d9d617:&function_c9dcb3aa };
        level.var_f13364b4.var_a7450be4 = function_4696e086( 1, &function_69dd6c5b );
        level.var_f13364b4.var_72c3e48c = function_4696e086( 1, &function_97ab5da4 );
        level.var_f13364b4.var_98e79e76 = function_4696e086( 1, &function_9a405843 );
        level.var_f13364b4.var_3c358113 = function_4696e086( 1, &function_7ddee93a );
        level.var_f13364b4.var_c8629019 = function_4696e086( 1, &function_68dfeba9 );
        level.var_f13364b4.var_becc7ced = function_4696e086( 1, &function_68dfeba9 );
        level.var_f13364b4.var_5beab72b = function_4696e086( 1, &function_68dfeba9 );
        level.var_d7e5aaac = array( level.var_f13364b4.var_8deb4ed2, level.var_f13364b4.var_a7450be4, level.var_f13364b4.var_72c3e48c, level.var_f13364b4.var_98e79e76, level.var_f13364b4.var_c8629019, level.var_f13364b4.var_becc7ced, level.var_f13364b4.var_5beab72b, level.var_f13364b4.var_3c358113 );
        level thread function_ca3efcd8();
        function_7ee18649();
        return;
    }
    
    if ( !zm_utility::is_standard() )
    {
        level thread function_ca3efcd8();
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x864a1c0f, Offset: 0x1bc0
// Size: 0xb4
function function_ca3efcd8()
{
    level thread function_d83247cd();
    function_8fff2dd();
    var_369dd48c = array( "mq_computer_activated", "keypad_debug" );
    level function_31890499();
    level flag::wait_till_any( var_369dd48c );
    level.var_18f1ca6e thread function_6ef53601( "style1" );
    init_keypad();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x7cd34bc3, Offset: 0x1c80
// Size: 0x13c
function init_keypad()
{
    level.var_f13364b4.s_keypad = struct::get( "keypad" );
    level.var_f13364b4.s_keypad zm_unitrigger::create( "", 32 );
    level.var_f13364b4.s_keypad thread function_44748fe7();
    zm_unitrigger::function_89380dda( level.var_f13364b4.s_keypad.s_unitrigger, 1 );
    level.var_f13364b4.a_s_keys = zm_hms_util::function_2719d4c0( "keypad_keys", "targetname", "script_int" );
    function_52838f02( "keypad", 1 );
    level function_9a2a7f26();
    
    if ( zm_utility::is_ee_enabled() )
    {
        level.var_18f1ca6e thread function_cafaeead();
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x91a79ca8, Offset: 0x1dc8
// Size: 0x190
function function_44748fe7()
{
    level endon( #"end_computer" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( !level.var_5dd0d3ff.isspeaking || level.var_f13364b4.var_e3d3636b === 1 )
        {
            foreach ( s_key in level.var_f13364b4.a_s_keys )
            {
                var_48b3293c = s_key.origin + anglestoup( s_key.angles ) * 0;
                
                if ( zombie_utility::is_player_valid( e_who ) && e_who function_bcec00bc( var_48b3293c, 8, 0 ) )
                {
                    function_f359c8a0( s_key, e_who );
                    break;
                }
            }
        }
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 4
// Checksum 0x6aa14569, Offset: 0x1f60
// Size: 0xb4
function function_bcec00bc( origin, arc_angle_degrees = 90, do_trace, e_ignore = undefined )
{
    arc_angle_degrees = absangleclamp360( arc_angle_degrees );
    dot = cos( arc_angle_degrees * 0.5 );
    
    if ( self util::is_player_looking_at( origin, dot, do_trace, e_ignore ) )
    {
        return 1;
    }
    
    return 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 2
// Checksum 0x3ea35e6a, Offset: 0x2020
// Size: 0x482
function function_f359c8a0( s_key, e_player )
{
    e_player clientfield::increment_to_player( "" + #"hash_33c373888aa78dc2", 1 );
    level.var_f13364b4.var_12633dc5 = e_player;
    
    switch ( s_key.script_string )
    {
        case #"number":
            if ( level.var_f13364b4.var_b1e1ac14 >= 4 )
            {
                /#
                    iprintlnbold( "<dev string:x38>" );
                #/
                
                playsoundatposition( "zmb_comp_keypad_action_full", self.origin );
                break;
            }
            
            level.var_f13364b4.var_d7813dfd[ level.var_f13364b4.var_b1e1ac14 ] = s_key.script_int;
            level function_edbb34e5( level.var_f13364b4.var_b1e1ac14, s_key.script_int );
            level.var_f13364b4.var_b1e1ac14++;
            
            /#
                iprintlnbold( "<dev string:x66>" + s_key.script_string + "<dev string:x71>" + s_key.script_int );
            #/
            
            playsoundatposition( "zmb_comp_keypad_press_" + s_key.script_int, self.origin );
            function_52838f02( "both", 1 );
            level.var_18f1ca6e function_b2fba7f5();
            level.var_18f1ca6e thread function_a196c54b();
            level.var_18f1ca6e thread function_450060dd();
            level.var_18f1ca6e.is_idling = 0;
            break;
        case #"enter":
            if ( level.var_f13364b4.var_b1e1ac14 < 4 )
            {
                /#
                    iprintlnbold( "<dev string:x75>" + level.var_f13364b4.var_d7813dfd[ 0 ] + level.var_f13364b4.var_d7813dfd[ 1 ] + level.var_f13364b4.var_d7813dfd[ 2 ] + level.var_f13364b4.var_d7813dfd[ 3 ] );
                #/
                
                playsoundatposition( "zmb_comp_keypad_action_full", self.origin );
                break;
            }
            
            /#
                iprintlnbold( "<dev string:x9d>" + level.var_f13364b4.var_d7813dfd[ 0 ] + level.var_f13364b4.var_d7813dfd[ 1 ] + level.var_f13364b4.var_d7813dfd[ 2 ] + level.var_f13364b4.var_d7813dfd[ 3 ] );
            #/
            
            n_code = function_352f47ae( level.var_f13364b4.var_d7813dfd );
            function_cd7e0989( n_code );
            level thread reset_computer();
            break;
        case #"clear":
            level thread reset_computer();
            
            /#
                iprintlnbold( "<dev string:xad>" );
            #/
            
            playsoundatposition( "zmb_comp_keypad_action_clear", self.origin );
            break;
        default:
            /#
                iprintlnbold( "<dev string:xbc>" );
            #/
            
            break;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0xc3cf3192, Offset: 0x24b0
// Size: 0x62
function reset_computer( n_delay = 1 )
{
    wait n_delay;
    level.var_18f1ca6e notify( #"hash_23cb7679bd15f5aa" );
    reset_code();
    level.var_18f1ca6e.is_idling = 1;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xa9461c16, Offset: 0x2520
// Size: 0x84
function reset_code()
{
    level.var_f13364b4.var_b1e1ac14 = 0;
    
    for ( i = 0; i < 4 ; i++ )
    {
        level.var_f13364b4.var_d7813dfd[ i ] = level.var_f13364b4.var_2329ffa1[ i ];
    }
    
    level function_5b1c42a6();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 2
// Checksum 0x6b58d8a6, Offset: 0x25b0
// Size: 0x112
function function_4696e086( var_5c0c59ca = undefined, var_64d0790a = undefined )
{
    n_random_int = randomintrange( 0, 10000 );
    
    while ( isdefined( level.var_f13364b4.a_n_codes[ n_random_int ] ) )
    {
        n_random_int = randomintrange( 0, 10000 );
        
        /#
            iprintlnbold( "<dev string:xee>" + n_random_int + "<dev string:x109>" );
        #/
    }
    
    if ( isdefined( var_5c0c59ca ) && isdefined( var_64d0790a ) )
    {
        level.var_f13364b4.a_n_codes[ n_random_int ] = { #var_544c05c6:var_5c0c59ca, #var_d9d9d617:var_64d0790a };
    }
    
    return n_random_int;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0x8fcabe83, Offset: 0x26d0
// Size: 0x72
function function_352f47ae( var_2ac83b81 )
{
    assert( isdefined( var_2ac83b81[ 3 ] ), "<dev string:x146>" );
    return var_2ac83b81[ 0 ] * 1000 + var_2ac83b81[ 1 ] * 100 + var_2ac83b81[ 2 ] * 10 + var_2ac83b81[ 3 ];
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0xe72aea83, Offset: 0x2750
// Size: 0x294
function function_cd7e0989( n_code )
{
    if ( !isdefined( level.var_f13364b4.a_n_codes[ n_code ] ) )
    {
        /#
            iprintlnbold( "<dev string:x19e>" );
        #/
        
        playsoundatposition( "zmb_comp_keypad_action_fail", self.origin );
        level thread zm_white_util::function_ec34b5ee( #"hash_74933b1a2d246442" );
        return;
    }
    
    if ( level.var_f13364b4.var_cf1f0c9 && !array::contains( level.var_d7e5aaac, n_code ) )
    {
        /#
            iprintlnbold( "<dev string:x1b2>" );
        #/
        
        playsoundatposition( "zmb_comp_keypad_action_fail", self.origin );
        level thread zm_white_util::function_ec34b5ee( #"hash_74933b1a2d246442" );
        return;
    }
    
    if ( level.var_f13364b4.a_n_codes[ n_code ].var_544c05c6 <= 0 )
    {
        /#
            iprintlnbold( "<dev string:x1de>" );
        #/
        
        playsoundatposition( "zmb_comp_keypad_action_fail", self.origin );
        level thread zm_white_util::function_ec34b5ee( #"hash_74933b1a2d246442" );
        return;
    }
    
    if ( isdefined( level.var_f13364b4.a_n_codes[ n_code ].var_d9d9d617 ) )
    {
        /#
            iprintlnbold( "<dev string:x1ff>" );
        #/
        
        level thread [[ level.var_f13364b4.a_n_codes[ n_code ].var_d9d9d617 ]]();
        level.var_f13364b4.a_n_codes[ n_code ].var_544c05c6--;
        playsoundatposition( "zmb_comp_keypad_action_success", self.origin );
        
        if ( !array::contains( level.var_d7e5aaac, n_code ) )
        {
            level thread function_6591945d();
        }
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x358bcbaf, Offset: 0x29f0
// Size: 0x46
function function_6591945d()
{
    level.var_f13364b4.var_cf1f0c9 = 1;
    level waittill( #"end_of_round" );
    level.var_f13364b4.var_cf1f0c9 = 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xca88e6f7, Offset: 0x2a40
// Size: 0x1c
function function_48f83a1d()
{
    level thread zm_white_cheat_codes::fall();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x355ea579, Offset: 0x2a68
// Size: 0x1c
function function_b015442e()
{
    level thread zm_white_cheat_codes::grav();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xa21fe59c, Offset: 0x2a90
// Size: 0x1c
function function_7b716b93()
{
    level thread zm_white_cheat_codes::guns();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x2b97ed24, Offset: 0x2ab8
// Size: 0x1c
function function_f4c88568()
{
    level thread zm_white_cheat_codes::time();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xd93ed2e, Offset: 0x2ae0
// Size: 0x1c
function function_ff176ced()
{
    level thread zm_white_cheat_codes::brew();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x78d9770d, Offset: 0x2b08
// Size: 0x1c
function function_95787ed2()
{
    level thread zm_white_cheat_codes::cola();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xf9e4ad26, Offset: 0x2b30
// Size: 0x1c
function function_3887862d()
{
    level thread zm_white_cheat_codes::soda();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x4a13e6be, Offset: 0x2b58
// Size: 0x62
function function_ccbd2e6c()
{
    level thread zm_white_cheat_codes::noob();
    level.var_f13364b4.a_n_codes[ 6662 ].var_544c05c6 = 0;
    level.var_f13364b4.a_n_codes[ 3279 ].var_544c05c6 = 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x14da64fe, Offset: 0x2bc8
// Size: 0x1c
function function_607f8829()
{
    level thread zm_white_cheat_codes::bank();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xf4bbff01, Offset: 0x2bf0
// Size: 0x1c
function function_d89fe502()
{
    level thread zm_white_cheat_codes::door();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x64061c13, Offset: 0x2c18
// Size: 0x1c
function function_f5468d9b()
{
    level thread zm_white_cheat_codes::warp();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x91cffee3, Offset: 0x2c40
// Size: 0x1c
function function_addac768()
{
    level thread zm_white_cheat_codes::shed();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xef0456b4, Offset: 0x2c68
// Size: 0x1c
function function_a7f962c9()
{
    level thread zm_white_cheat_codes::nuke();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xce52acb0, Offset: 0x2c90
// Size: 0x1c
function function_8e63da67()
{
    level thread zm_white_cheat_codes::hero();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xbd09eb3d, Offset: 0x2cb8
// Size: 0x1c
function function_77085b()
{
    level thread zm_white_cheat_codes::puke();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xb07ac81e, Offset: 0x2ce0
// Size: 0x62
function function_8a9baa13()
{
    level thread zm_white_cheat_codes::club();
    level.var_f13364b4.a_n_codes[ 2582 ].var_544c05c6 = 0;
    level.var_f13364b4.a_n_codes[ 7268 ].var_544c05c6 = 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x70f05754, Offset: 0x2d50
// Size: 0x1c
function function_bb800be7()
{
    level thread zm_white_cheat_codes::duck();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xc5cb1aa0, Offset: 0x2d78
// Size: 0x1c
function function_8606278d()
{
    level thread zm_white_cheat_codes::song();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xd19ff984, Offset: 0x2da0
// Size: 0x1c
function function_b54f6326()
{
    level thread zm_white_cheat_codes::quiz();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x13f6e5a9, Offset: 0x2dc8
// Size: 0x1c
function function_685d3dab()
{
    level thread zm_white_cheat_codes::ugly();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x712f75fa, Offset: 0x2df0
// Size: 0x1c
function function_7d008839()
{
    level thread zm_white_cheat_codes::joke();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xab7f9f1, Offset: 0x2e18
// Size: 0x62
function function_a823412a()
{
    level thread zm_white_cheat_codes::yawn();
    level.var_f13364b4.a_n_codes[ 9296 ].var_544c05c6 = 0;
    level.var_f13364b4.a_n_codes[ 1111 ].var_544c05c6 = 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xb9de2e9, Offset: 0x2e88
// Size: 0x62
function function_90dbeb67()
{
    level thread zm_white_cheat_codes::vent();
    level.var_f13364b4.a_n_codes[ 8368 ].var_544c05c6 = 0;
    level.var_f13364b4.a_n_codes[ 7268 ].var_544c05c6 = 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x7ba1f386, Offset: 0x2ef8
// Size: 0x1c
function function_6755931f()
{
    level thread zm_white_cheat_codes::love();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x6a92fa13, Offset: 0x2f20
// Size: 0x1c
function function_b94ecbd8()
{
    level thread zm_white_cheat_codes::life();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x52400aa5, Offset: 0x2f48
// Size: 0x62
function function_23dac63d()
{
    level thread zm_white_cheat_codes::boom();
    level.var_f13364b4.a_n_codes[ 7836 ].var_544c05c6 = 0;
    level.var_f13364b4.a_n_codes[ 2666 ].var_544c05c6 = 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x627dc18a, Offset: 0x2fb8
// Size: 0x1c
function function_9e9664bd()
{
    level thread zm_white_cheat_codes::pack();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xbb7fad7a, Offset: 0x2fe0
// Size: 0x3c
function function_ac121b1c()
{
    level thread zm_white_util::function_ec34b5ee( #"hash_2c4fa652fb89d231" );
    level thread zm_white_audio_interactables::function_a0b040d4();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x72a93b92, Offset: 0x3028
// Size: 0x34
function function_7e966dbe()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_3d3b83078e638263", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xabd4795c, Offset: 0x3068
// Size: 0x34
function function_9b96f239()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_24f10736d61f17be", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xe8291117, Offset: 0x30a8
// Size: 0x34
function function_c36b1f94()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_5f8cf3a67798b7ab", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x2d7e4b4b, Offset: 0x30e8
// Size: 0x24
function function_27d39a4f()
{
    /#
        iprintlnbold( "<dev string:x20d>" );
    #/
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x6e04cd90, Offset: 0x3118
// Size: 0x34
function function_998eba45()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_5ec22c1b18a29d51", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x4b440ec4, Offset: 0x3158
// Size: 0x34
function function_be76c1b8()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_346e9556bd641875", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x9fef93b, Offset: 0x3198
// Size: 0x34
function function_fadd27d6()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_774ea9ca1a48e4d", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xb133caed, Offset: 0x31d8
// Size: 0x34
function function_cd2168cb()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_3d1ea1a6ac1bd74c", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x4069325e, Offset: 0x3218
// Size: 0x34
function function_6b002f3c()
{
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_57bcd7bd5e8ab56e", 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xd308efad, Offset: 0x3258
// Size: 0x54
function function_c9dcb3aa()
{
    level flag::set( #"hash_3ee874ebee843004" );
    
    /#
        iprintlnbold( "<dev string:x21b>" + level.var_f13364b4.var_a7450be4 );
    #/
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x45b37e70, Offset: 0x32b8
// Size: 0xa8
function function_69dd6c5b()
{
    if ( level flag::get( #"hash_3ee874ebee843004" ) )
    {
        level flag::set( #"hash_315d0bf1d50724f0" );
        
        /#
            iprintlnbold( "<dev string:x242>" + level.var_f13364b4.var_72c3e48c );
        #/
        
        return;
    }
    
    level.var_f13364b4.a_n_codes[ level.var_f13364b4.var_a7450be4 ].var_544c05c6++;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x85442857, Offset: 0x3368
// Size: 0xd8
function function_97ab5da4()
{
    a_flags = array( #"hash_3ee874ebee843004", #"hash_315d0bf1d50724f0" );
    
    if ( level flag::get_all( a_flags ) )
    {
        level flag::set( #"hash_359cbec050523f4" );
        
        /#
            iprintlnbold( "<dev string:x269>" + level.var_f13364b4.var_98e79e76 );
        #/
        
        return;
    }
    
    level.var_f13364b4.a_n_codes[ level.var_f13364b4.var_72c3e48c ].var_544c05c6++;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xc82ecf5c, Offset: 0x3448
// Size: 0xb8
function function_9a405843()
{
    a_flags = array( #"hash_3ee874ebee843004", #"hash_315d0bf1d50724f0", #"hash_359cbec050523f4" );
    
    if ( level flag::get_all( a_flags ) )
    {
        level flag::set( #"hash_130656ec8ad5480d" );
        return;
    }
    
    level.var_f13364b4.a_n_codes[ level.var_f13364b4.var_98e79e76 ].var_544c05c6++;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x54ed3198, Offset: 0x3508
// Size: 0x24
function function_7ddee93a()
{
    level flag::set( #"hash_eb582974245f076" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x8c00052c, Offset: 0x3538
// Size: 0x54
function function_68dfeba9()
{
    level.var_e1b5b6fe++;
    
    if ( !flag::get( #"hash_66ee9231ad909f7e" ) )
    {
        level flag::set( #"hash_66ee9231ad909f7e" );
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x29887ee1, Offset: 0x3598
// Size: 0x466
function function_8fff2dd()
{
    level._effect[ #"hash_7c49a746639d8fb9" ] = "maps/zm_white/fx8_zm_white_code_type_0";
    level._effect[ #"hash_7c49a646639d8e06" ] = "maps/zm_white/fx8_zm_white_code_type_1";
    level._effect[ #"hash_7c49a546639d8c53" ] = "maps/zm_white/fx8_zm_white_code_type_2";
    level._effect[ #"hash_7c49a446639d8aa0" ] = "maps/zm_white/fx8_zm_white_code_type_3";
    level._effect[ #"hash_7c49ab46639d9685" ] = "maps/zm_white/fx8_zm_white_code_type_4";
    level._effect[ #"hash_7c49aa46639d94d2" ] = "maps/zm_white/fx8_zm_white_code_type_5";
    level._effect[ #"hash_7c49a946639d931f" ] = "maps/zm_white/fx8_zm_white_code_type_6";
    level._effect[ #"hash_7c49a846639d916c" ] = "maps/zm_white/fx8_zm_white_code_type_7";
    level._effect[ #"hash_7c49af46639d9d51" ] = "maps/zm_white/fx8_zm_white_code_type_8";
    level._effect[ #"hash_7c49ae46639d9b9e" ] = "maps/zm_white/fx8_zm_white_code_type_9";
    level._effect[ #"hash_440d5b73d8a98ff4" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_0";
    level._effect[ #"hash_440d5c73d8a991a7" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_1";
    level._effect[ #"hash_440d5d73d8a9935a" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_2";
    level._effect[ #"hash_440d5e73d8a9950d" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_3";
    level._effect[ #"hash_440d5773d8a98928" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_4";
    level._effect[ #"hash_440d5873d8a98adb" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_5";
    level._effect[ #"hash_440d5973d8a98c8e" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_6";
    level._effect[ #"hash_440d5a73d8a98e41" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_7";
    level._effect[ #"hash_440d5373d8a9825c" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_8";
    level._effect[ #"hash_440d5473d8a9840f" ] = "maps/zm_office/fx8_fxanim_zm_office_code_paint_9";
    level.var_f3c560b6[ 0 ] = getent( "code_display_digit0", "script_noteworthy" );
    
    for ( i = 0; i < 4 ; i++ )
    {
        level.var_40361d9a[ i ] = "screen_code_display_digit" + i;
        level.var_1e220e78[ i ] = getent( level.var_40361d9a[ i ], "script_noteworthy" );
        level.var_1e220e78[ i ] hide();
        level.var_3dbe29c9[ i ] = "screen_code_display_large_digit" + i;
        level.var_17ff2d5e[ i ] = getent( level.var_3dbe29c9[ i ], "script_noteworthy" );
        level.var_17ff2d5e[ i ] hide();
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 2
// Checksum 0xde8d7017, Offset: 0x3a08
// Size: 0x1b4
function function_edbb34e5( n_digit, n_value )
{
    if ( n_digit == 0 )
    {
        level.var_1e220e78[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_small_cursor" );
        level.var_17ff2d5e[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_large_cursor" );
    }
    
    if ( n_digit == 1 )
    {
        level.var_1e220e78[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_cursor" );
        level.var_17ff2d5e[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_large_cursor" );
    }
    
    if ( n_digit == 2 )
    {
        level.var_1e220e78[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_cursor" );
        level.var_17ff2d5e[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_large_cursor" );
    }
    
    var_9e6fc71b = "p8_zm_white_computer_system_code_display_small_" + n_value;
    level.var_1e220e78[ n_digit ] setmodel( var_9e6fc71b );
    var_954db43c = "p8_zm_white_computer_system_code_display_large_" + n_value;
    level.var_17ff2d5e[ n_digit ] setmodel( var_954db43c );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x6361c8a4, Offset: 0x3bc8
// Size: 0xde
function function_5b1c42a6()
{
    for ( n_digit = 0; n_digit < 4 ; n_digit++ )
    {
        if ( n_digit == 0 )
        {
            level.var_1e220e78[ n_digit ] setmodel( "p8_zm_white_computer_system_code_display_small_cursor" );
            level.var_17ff2d5e[ n_digit ] setmodel( "p8_zm_white_computer_system_code_display_large_cursor" );
            continue;
        }
        
        level.var_1e220e78[ n_digit ] setmodel( "p8_zm_white_computer_system_code_display_small_space" );
        level.var_17ff2d5e[ n_digit ] setmodel( "p8_zm_white_computer_system_code_display_large_space" );
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 2
// Checksum 0x40fd2e0, Offset: 0x3cb0
// Size: 0x1aa
function function_52838f02( str_display = "both", b_show = 1 )
{
    func_visibility = &show;
    
    if ( !b_show )
    {
        func_visibility = &hide;
    }
    
    switch ( str_display )
    {
        case #"both":
            for ( i = 0; i < 4 ; i++ )
            {
                level.var_1e220e78[ i ] [[ func_visibility ]]();
                level.var_17ff2d5e[ i ] [[ func_visibility ]]();
            }
            
            break;
        case #"keypad":
            for ( i = 0; i < 4 ; i++ )
            {
                level.var_1e220e78[ i ] [[ func_visibility ]]();
            }
            
            break;
        case #"large":
            for ( i = 0; i < 4 ; i++ )
            {
                level.var_17ff2d5e[ i ] [[ func_visibility ]]();
            }
            
            break;
        default:
            /#
                iprintlnbold( "<dev string:x291>" );
            #/
            
            break;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x492ea8f6, Offset: 0x3e68
// Size: 0x34a
function function_7ee18649()
{
    level thread function_a02dfba();
    var_127789d1 = randomint( 3 );
    var_2ec8989 = zm_hms_util::function_bffcedde( "mesh_code_display_01", "script_noteworthy", "script_int" );
    level.var_f140d610 = var_2ec8989[ var_127789d1 ];
    level.var_f140d610 function_f0af359();
    level.var_f140d610 function_66365668( function_da24090c( level.var_f13364b4.var_a7450be4 ) );
    level.var_f140d610 showpart( "tag_code_paper_1" );
    a_e_paper = zm_hms_util::function_bffcedde( "sawyer_authorization_code", "targetname", "script_int" );
    
    for ( i = 0; i < var_2ec8989.size ; i++ )
    {
        if ( i != var_127789d1 )
        {
            var_2ec8989[ i ] delete();
        }
    }
    
    waitframe( 1 );
    level.var_ff8f72ad function_66365668( function_da24090c( level.var_f13364b4.var_72c3e48c ) );
    level.var_ff8f72ad showpart( "tag_code_paper_2" );
    waitframe( 1 );
    level.var_d2e0194f function_66365668( function_da24090c( level.var_f13364b4.var_98e79e76 ) );
    level.var_d2e0194f showpart( "tag_code_paper_3" );
    level.var_a91ec5cd function_66365668( function_da24090c( level.var_f13364b4.var_3c358113 ) );
    level.var_b6696062 function_66365668( function_da24090c( level.var_f13364b4.var_c8629019 ) );
    waitframe( 1 );
    level.var_a925c5df function_66365668( function_da24090c( level.var_f13364b4.var_becc7ced ) );
    waitframe( 1 );
    level.var_b6f4617c function_66365668( function_da24090c( level.var_f13364b4.var_5beab72b ) );
    waitframe( 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x50a8b661, Offset: 0x41c0
// Size: 0x18c
function function_a02dfba()
{
    level.var_ff8f72ad = getent( "mesh_code_display_02", "script_noteworthy" );
    level.var_d2e0194f = getent( "mesh_code_display_03", "script_noteworthy" );
    level.var_a91ec5cd = getent( "mesh_code_display_04", "script_noteworthy" );
    level.var_b6696062 = getent( "mesh_code_display_05", "script_noteworthy" );
    level.var_a925c5df = getent( "mesh_code_display_06", "script_noteworthy" );
    level.var_b6f4617c = getent( "mesh_code_display_07", "script_noteworthy" );
    level.var_ff8f72ad function_f0af359();
    level.var_d2e0194f function_f0af359();
    level.var_a91ec5cd function_f0af359();
    level.var_b6696062 function_f0af359();
    level.var_a925c5df function_f0af359();
    level.var_b6f4617c function_f0af359();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xe278d4b9, Offset: 0x4358
// Size: 0xdc
function function_f0af359()
{
    for ( n_digit = 0; n_digit <= 3 ; n_digit++ )
    {
        for ( n_value = 0; n_value <= 9 ; n_value++ )
        {
            self hidepart( "tag_code_digit_" + n_digit + "_" + n_value );
        }
    }
    
    self hidepart( "tag_code_paper_1" );
    self hidepart( "tag_code_paper_2" );
    self hidepart( "tag_code_paper_3" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0x9133454c, Offset: 0x4440
// Size: 0x124
function function_66365668( a_code )
{
    var_aa2d940c = "tag_code_digit_0_" + int( a_code[ 0 ] );
    var_bfd7bf60 = "tag_code_digit_1_" + int( a_code[ 1 ] );
    var_ce0d5bcb = "tag_code_digit_2_" + int( a_code[ 2 ] );
    var_e38486c9 = "tag_code_digit_3_" + int( a_code[ 3 ] );
    self showpart( var_aa2d940c );
    self showpart( var_bfd7bf60 );
    self showpart( var_ce0d5bcb );
    self showpart( var_e38486c9 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0x461af219, Offset: 0x4570
// Size: 0xb8
function function_da24090c( n_code )
{
    a_code[ 0 ] = floor( n_code / 1000 );
    n_code %= 1000;
    a_code[ 1 ] = floor( n_code / 100 );
    n_code %= 100;
    a_code[ 2 ] = floor( n_code / 10 );
    n_code %= 10;
    a_code[ 3 ] = n_code;
    return a_code;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xe7d179e1, Offset: 0x4630
// Size: 0x76
function delete_entities()
{
    for ( i = 0; i < 4 ; i++ )
    {
        var_51d09dba = getent( "code_display_digit" + i, "script_noteworthy" );
        
        if ( isdefined( var_51d09dba ) )
        {
            var_51d09dba delete();
        }
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0x21bd400c, Offset: 0x46b0
// Size: 0xfc
function clock_init( n_id )
{
    self.var_5543b573 = n_id;
    self.var_2b315dde[ 0 ] = "string";
    self.var_731ce5fc[ 0 ] = "string";
    self.var_e3a88238 = getent( "computersystem_clock_colon", "targetname" );
    
    for ( i = 0; i < 4 ; i++ )
    {
        self.var_731ce5fc[ i ] = "computersystem_" + self.var_5543b573 + "_clock_digit" + i;
        self.var_2b315dde[ i ] = getent( self.var_731ce5fc[ i ], "script_noteworthy" );
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xecee6903, Offset: 0x47b8
// Size: 0xbc
function clock_countdown()
{
    self.var_4cdc88ae = 1;
    level.var_18f1ca6e function_b2fba7f5();
    level.var_18f1ca6e thread function_a196c54b();
    self endon( #"hash_10b7419f15453a9e" );
    self function_80707067();
    self function_5e0b6734( 1, 0, 1, 0, 1 );
    self waittill( #"hash_6cb5d5beb3730446" );
    self function_9b1511fa();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xbc25a3c3, Offset: 0x4880
// Size: 0x4e
function function_9b1511fa()
{
    self function_58dddc4e();
    self function_eb17b80b();
    self.var_4cdc88ae = 0;
    self notify( #"hash_10b7419f15453a9e" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 5
// Checksum 0x20ab843f, Offset: 0x48d8
// Size: 0x7bc
function function_5e0b6734( var_b995184a, var_2199b576, var_ec214a86, var_d1201d6b, var_f3ea62ff )
{
    self.var_5659075f = var_b995184a;
    self.var_9400d2ae = 0;
    self.var_87d84bef = 0;
    self.var_9901ee42 = 0;
    self.var_18e46e05 = 0;
    self.var_eb2b1293 = 0;
    
    if ( self.var_5659075f == 1 )
    {
        self.var_87d84bef = var_f3ea62ff;
        self.var_9901ee42 = var_d1201d6b;
        self.var_18e46e05 = var_ec214a86;
        self.var_eb2b1293 = var_2199b576;
        self.var_2b315dde[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_87d84bef );
        self.var_2b315dde[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_9901ee42 );
        self.var_2b315dde[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_18e46e05 );
        self.var_2b315dde[ 0 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_eb2b1293 );
    }
    
    while ( true )
    {
        self.var_9400d2ae++;
        
        if ( self.var_5659075f == 0 )
        {
            if ( self.var_eb2b1293 == var_2199b576 && self.var_18e46e05 == var_ec214a86 && self.var_9901ee42 == var_d1201d6b && self.var_87d84bef == var_f3ea62ff )
            {
                break;
            }
            
            self.var_87d84bef++;
            
            if ( self.var_87d84bef < 10 )
            {
                self.var_2b315dde[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_87d84bef );
            }
            
            if ( self.var_87d84bef == 10 && self.var_9901ee42 < 5 )
            {
                self.var_87d84bef = 0;
                self.var_2b315dde[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_87d84bef );
                self.var_9901ee42++;
                
                if ( self.var_9901ee42 < 6 )
                {
                    self.var_2b315dde[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_9901ee42 );
                }
            }
            
            if ( self.var_87d84bef == 10 && self.var_9901ee42 == 5 && self.var_18e46e05 < 9 )
            {
                self.var_9901ee42 = 0;
                self.var_87d84bef = 0;
                self.var_2b315dde[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_87d84bef );
                self.var_2b315dde[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_9901ee42 );
                self.var_18e46e05++;
                
                if ( self.var_18e46e05 < 10 )
                {
                    self.var_2b315dde[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_18e46e05 );
                }
            }
            
            if ( self.var_87d84bef == 10 && self.var_9901ee42 == 5 && self.var_18e46e05 >= 9 && self.var_eb2b1293 < 10 )
            {
                self.var_87d84bef = 0;
                self.var_2b315dde[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_87d84bef );
                self.var_9901ee42 = 0;
                self.var_2b315dde[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_9901ee42 );
                self.var_18e46e05 = 0;
                self.var_2b315dde[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_18e46e05 );
                self.var_eb2b1293++;
                
                if ( self.var_eb2b1293 < 10 )
                {
                    self.var_2b315dde[ 0 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_eb2b1293 );
                }
            }
            
            if ( self.var_87d84bef == 10 && self.var_9901ee42 == 5 && self.var_18e46e05 == 10 && self.var_eb2b1293 == 10 )
            {
                break;
            }
        }
        
        if ( self.var_5659075f == 1 )
        {
            self.var_87d84bef--;
            
            if ( self.var_87d84bef < 0 && self.var_9901ee42 > -1 )
            {
                self.var_9901ee42--;
                self.var_87d84bef = 9;
                
                if ( self.var_9901ee42 > -1 )
                {
                    self.var_2b315dde[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_9901ee42 );
                }
            }
            
            if ( self.var_9901ee42 < 0 )
            {
                self.var_18e46e05--;
                self.var_9901ee42 = 5;
                self.var_2b315dde[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_9901ee42 );
                
                if ( self.var_18e46e05 > -1 )
                {
                    self.var_2b315dde[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_18e46e05 );
                }
            }
            
            if ( self.var_18e46e05 < 0 )
            {
                self.var_eb2b1293--;
                self.var_18e46e05 = 9;
                self.var_2b315dde[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_18e46e05 );
                
                if ( self.var_eb2b1293 > -1 )
                {
                    self.var_2b315dde[ 0 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_eb2b1293 );
                }
            }
            
            self.var_2b315dde[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_87d84bef );
            
            if ( self.var_eb2b1293 == 0 && self.var_18e46e05 == 0 && self.var_9901ee42 == 0 && self.var_87d84bef == 0 )
            {
                break;
            }
        }
        
        wait 1;
    }
    
    self thread function_7a1b3cff();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xb4a386a, Offset: 0x50a0
// Size: 0xf4
function function_58dddc4e()
{
    self.var_87d84bef = 0;
    self.var_9901ee42 = 0;
    self.var_18e46e05 = 0;
    self.var_eb2b1293 = 0;
    self.var_2b315dde[ 3 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_87d84bef );
    self.var_2b315dde[ 2 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_9901ee42 );
    self.var_2b315dde[ 1 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_18e46e05 );
    self.var_2b315dde[ 0 ] setmodel( "p8_zm_white_computer_system_code_display_small_" + self.var_eb2b1293 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x152d4f92, Offset: 0x51a0
// Size: 0x9c
function function_80707067()
{
    self.var_e3a88238 show();
    self.var_2b315dde[ 3 ] show();
    self.var_2b315dde[ 2 ] show();
    self.var_2b315dde[ 1 ] show();
    self.var_2b315dde[ 0 ] show();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xb3fc6345, Offset: 0x5248
// Size: 0x9c
function function_eb17b80b()
{
    self.var_e3a88238 hide();
    self.var_2b315dde[ 3 ] hide();
    self.var_2b315dde[ 2 ] hide();
    self.var_2b315dde[ 1 ] hide();
    self.var_2b315dde[ 0 ] hide();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xa3f1a936, Offset: 0x52f0
// Size: 0x8e
function function_7a1b3cff()
{
    for ( i = 0; i < 3 ; i++ )
    {
        self function_eb17b80b();
        wait 0.5;
        self function_80707067();
        wait 0.5;
    }
    
    self function_eb17b80b();
    self notify( #"hash_6cb5d5beb3730446" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x4ca3fff4, Offset: 0x5388
// Size: 0xac
function function_45822b7e()
{
    level.var_18f1ca6e = getent( "face_screen", "targetname" );
    level.var_cb1cac73 = getent( "computer_system_extras", "targetname" );
    level.var_cb1cac73 hidepart( "tag_control_panel" );
    level thread function_a3442c46( "0" );
    level.var_18f1ca6e thread function_a196c54b();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0xca8ce145, Offset: 0x5440
// Size: 0x25a
function function_a3442c46( s_stage )
{
    switch ( s_stage )
    {
        case #"0":
            level.var_cb1cac73 hidepart( "tag_lights" );
            level.var_cb1cac73 hidepart( "tag_stage_01" );
            level.var_cb1cac73 hidepart( "tag_stage_02" );
            level.var_cb1cac73 hidepart( "tag_stage_03" );
            level.var_cb1cac73 hidepart( "tag_stage_04" );
            level.var_cb1cac73 hidepart( "tag_stage_05" );
            exploder::stop_exploder( "fxexp_script_computersystem_screen" );
            break;
        case #"1":
            level.var_cb1cac73 showpart( "tag_stage_01" );
            level.var_cb1cac73 showpart( "tag_lights" );
            exploder::exploder( "fxexp_script_computersystem_screen" );
            break;
        case #"2":
            level.var_cb1cac73 showpart( "tag_stage_02" );
            break;
        case #"3":
            level.var_cb1cac73 showpart( "tag_stage_03" );
            break;
        case #"4":
            level.var_cb1cac73 showpart( "tag_stage_04" );
            break;
        case #"5":
            level.var_cb1cac73 showpart( "tag_stage_05" );
            break;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0x728e0b18, Offset: 0x56a8
// Size: 0x352
function function_6ef53601( var_7e123df8 )
{
    switch ( var_7e123df8 )
    {
        case #"blink":
            self function_a196c54b();
            self showpart( "tag_glitch" );
            wait 0.2;
            self function_a196c54b();
            self showpart( "tag_blink_cycle_all" );
            break;
        case #"dynamic":
            self function_a196c54b();
            self showpart( "tag_glitch" );
            wait 0.2;
            self function_a196c54b();
            self showpart( "tag_dynamic" );
            break;
        case #"glitch":
            self function_a196c54b();
            self showpart( "tag_glitch" );
            wait 0.2;
            self function_a196c54b();
            self showpart( "tag_glitch" );
            break;
        case #"style1":
            self function_a196c54b();
            self showpart( "tag_glitch" );
            wait 0.2;
            self function_a196c54b();
            self showpart( "tag_style1" );
            break;
        case #"style2":
            self function_a196c54b();
            self showpart( "tag_glitch" );
            wait 0.2;
            self function_a196c54b();
            self showpart( "tag_style2" );
            break;
        case #"vector":
            self function_a196c54b();
            self showpart( "tag_glitch" );
            wait 0.2;
            self function_a196c54b();
            self showpart( "tag_vector" );
            break;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x523739e6, Offset: 0x5a08
// Size: 0x8c
function function_450060dd()
{
    self notify( #"hash_23cb7679bd15f5aa" );
    self endon( #"end_game", #"hash_23cb7679bd15f5aa" );
    self thread function_a196c54b();
    n_start_time = gettime();
    
    while ( gettime() < n_start_time + 60000 )
    {
        wait 0.5;
    }
    
    level thread reset_computer();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x54d36f05, Offset: 0x5aa0
// Size: 0xb0
function function_cafaeead()
{
    self endon( #"end_game" );
    self.is_idling = 0;
    
    while ( true )
    {
        if ( self.is_idling && !( isdefined( self.var_1549a0a5 ) && self.var_1549a0a5 ) )
        {
            if ( !level.countdown_clock.var_4cdc88ae && level.var_f13364b4.var_b1e1ac14 == 0 )
            {
                level.var_18f1ca6e thread function_67621880();
            }
        }
        
        wait 0.5;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x48830fae, Offset: 0x5b58
// Size: 0x100
function function_67621880()
{
    self notify( #"hash_23cb7679bd15f5aa" );
    function_52838f02( "large", 0 );
    self.var_1549a0a5 = 1;
    var_745db666 = array( "blink", "dynamic", "style1", "style2" );
    self endon( #"end_game", #"hash_3f68e1ecf3892766" );
    
    while ( true )
    {
        var_745db666 = array::randomize( var_745db666 );
        self thread function_6ef53601( var_745db666[ 0 ] );
        wait randomfloatrange( 5, 10 );
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xa12bf856, Offset: 0x5c60
// Size: 0x26
function function_b2fba7f5()
{
    level.var_18f1ca6e notify( #"hash_3f68e1ecf3892766" );
    self.var_1549a0a5 = 0;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xc579ab93, Offset: 0x5c90
// Size: 0xc4
function function_a196c54b()
{
    self hidepart( "tag_blink_cycle_all" );
    self hidepart( "tag_dynamic" );
    self hidepart( "tag_glitch" );
    self hidepart( "tag_style1" );
    self hidepart( "tag_style2" );
    self hidepart( "tag_vector" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x2112bca2, Offset: 0x5d60
// Size: 0x44
function function_9a2a7f26()
{
    level.var_cb1cac73 showpart( "tag_control_panel" );
    level.var_cb1cac73 showpart( "tag_lights" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xbe9ccd36, Offset: 0x5db0
// Size: 0x44
function function_31890499()
{
    level.var_cb1cac73 hidepart( "tag_control_panel" );
    level.var_cb1cac73 hidepart( "tag_lights" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x3259490e, Offset: 0x5e00
// Size: 0xb4
function function_d83247cd()
{
    level.var_5d577798 = getent( "code_printer_monitor", "targetname" );
    level.var_5d577798 showpart( "tag_screen_static" );
    level.var_5d577798 hidepart( "tag_screen_unbroken" );
    level.var_5d577798 hidepart( "tag_screen_broken" );
    level.var_5d577798 playloopsound( #"hash_340bf847392d3d2f" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xee4e1196, Offset: 0x5ec0
// Size: 0xb4
function function_5fbede7a()
{
    level.var_5d577798 hidepart( "tag_screen_static" );
    level.var_5d577798 showpart( "tag_screen_unbroken" );
    level.var_5d577798 hidepart( "tag_screen_broken" );
    level.var_5d577798 playloopsound( #"hash_781ac45f11aba91e" );
    level.var_5d577798 playsound( #"hash_d959f93f00640e9" );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xa113a123, Offset: 0x5f80
// Size: 0x1a4
function function_60f15ca8()
{
    var_a94d1ca3 = getent( "code_printer_paper", "targetname" );
    level._effect[ #"hash_ae7ff67227046f2" ] = #"hash_731cff4f6f2d012d";
    var_73a8928d = var_a94d1ca3.origin;
    level.var_5d577798 stoploopsound();
    level.var_5d577798 playsound( #"hash_42924f60b7b4c07a" );
    playfxontag( level._effect[ #"hash_ae7ff67227046f2" ], level.var_5d577798, "tag_fx" );
    level.var_5d577798 hidepart( "tag_screen_static" );
    level.var_5d577798 showpart( "tag_screen_broken" );
    level.var_5d577798 hidepart( "tag_screen_unbroken" );
    wait 2;
    var_a94d1ca3 playsound( #"hash_51945414465e1801" );
    var_a94d1ca3 moveto( var_73a8928d + ( 0, -6, 0 ), 0.3 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x46030c34, Offset: 0x6130
// Size: 0xac
function function_6338402()
{
    level flag::wait_till( "mq_computer_activated" );
    level.var_70407389 = [];
    level thread rushmore_speech_hamilton();
    level thread rushmore_speech_franklin();
    level thread rushmore_speech_madison();
    level thread rushmore_speech_jefferson();
    level thread rushmore_speech_flag();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xff0f7353, Offset: 0x61e8
// Size: 0x144
function rushmore_speech_hamilton()
{
    s_interact = struct::get( "rushmore_speech_hamilton" );
    
    if ( !isdefined( level.var_70407389 ) )
    {
        level.var_70407389 = [];
    }
    else if ( !isarray( level.var_70407389 ) )
    {
        level.var_70407389 = array( level.var_70407389 );
    }
    
    level.var_70407389[ level.var_70407389.size ] = s_interact;
    b_spoke = 0;
    
    while ( !b_spoke )
    {
        s_interact zm_unitrigger::function_fac87205( &function_a74f51a8, 32 );
        
        if ( level.var_5dd0d3ff zm_audio::can_speak() )
        {
            level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_3bb62fc3dd0ef854", 0, 0 );
            b_spoke = 1;
            continue;
        }
        
        wait 2;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x55f9879c, Offset: 0x6338
// Size: 0x144
function rushmore_speech_franklin()
{
    s_interact = struct::get( "rushmore_speech_franklin" );
    
    if ( !isdefined( level.var_70407389 ) )
    {
        level.var_70407389 = [];
    }
    else if ( !isarray( level.var_70407389 ) )
    {
        level.var_70407389 = array( level.var_70407389 );
    }
    
    level.var_70407389[ level.var_70407389.size ] = s_interact;
    b_spoke = 0;
    
    while ( !b_spoke )
    {
        s_interact zm_unitrigger::function_fac87205( &function_a74f51a8, 32 );
        
        if ( level.var_5dd0d3ff zm_audio::can_speak() )
        {
            level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_3d5961d25aa763a8", 0, 0 );
            b_spoke = 1;
            continue;
        }
        
        wait 2;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xf4654fa5, Offset: 0x6488
// Size: 0x144
function rushmore_speech_madison()
{
    s_interact = struct::get( "rushmore_speech_madison" );
    
    if ( !isdefined( level.var_70407389 ) )
    {
        level.var_70407389 = [];
    }
    else if ( !isarray( level.var_70407389 ) )
    {
        level.var_70407389 = array( level.var_70407389 );
    }
    
    level.var_70407389[ level.var_70407389.size ] = s_interact;
    b_spoke = 0;
    
    while ( !b_spoke )
    {
        s_interact zm_unitrigger::function_fac87205( &function_a74f51a8, 32 );
        
        if ( level.var_5dd0d3ff zm_audio::can_speak() )
        {
            level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_6bbfaf4e608a79b8", 0, 0 );
            b_spoke = 1;
            continue;
        }
        
        wait 2;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xb2c0a4a8, Offset: 0x65d8
// Size: 0x144
function rushmore_speech_jefferson()
{
    s_interact = struct::get( "rushmore_speech_jefferson" );
    
    if ( !isdefined( level.var_70407389 ) )
    {
        level.var_70407389 = [];
    }
    else if ( !isarray( level.var_70407389 ) )
    {
        level.var_70407389 = array( level.var_70407389 );
    }
    
    level.var_70407389[ level.var_70407389.size ] = s_interact;
    b_spoke = 0;
    
    while ( !b_spoke )
    {
        s_interact zm_unitrigger::function_fac87205( &function_a74f51a8, 32 );
        
        if ( level.var_5dd0d3ff zm_audio::can_speak() )
        {
            level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_c11fc3ab92db957", 0, 0 );
            b_spoke = 1;
            continue;
        }
        
        wait 2;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xf00bea7b, Offset: 0x6728
// Size: 0x12c
function rushmore_speech_flag()
{
    s_interact = struct::get( "rushmore_speech_flag" );
    
    if ( !isdefined( level.var_70407389 ) )
    {
        level.var_70407389 = [];
    }
    else if ( !isarray( level.var_70407389 ) )
    {
        level.var_70407389 = array( level.var_70407389 );
    }
    
    level.var_70407389[ level.var_70407389.size ] = s_interact;
    b_spoke = 0;
    
    while ( !b_spoke )
    {
        s_interact zm_unitrigger::function_fac87205( &function_a74f51a8, 32 );
        
        if ( level.var_5dd0d3ff zm_audio::can_speak() )
        {
            function_5b16217f();
            b_spoke = 1;
            continue;
        }
        
        wait 2;
    }
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xa7416ff0, Offset: 0x6860
// Size: 0xd4
function function_5b16217f()
{
    level endon( #"hash_1a91b42d31e0b28d" );
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_45f67ba6693762f7", 0, 0 );
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_45f67ba6693762f7", 1, 0, 1 );
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_45f67ba6693762f7", 2, 0, 1 );
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d( #"hash_45f67ba6693762f7", 3, 0, 1 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0xb53eacc0, Offset: 0x6940
// Size: 0x2a
function function_792d350a( b_pause = 1 )
{
    level.var_fb7b424 = b_pause;
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 1
// Checksum 0x18e8d237, Offset: 0x6978
// Size: 0x1c, Type: bool
function function_a74f51a8( e_player )
{
    return level.var_fb7b424 !== 1;
}

