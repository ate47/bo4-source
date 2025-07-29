#using script_59a783d756554a80;
#using scripts\core_common\aat_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_item_pickup;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;

#namespace namespace_87e11242;

// Namespace namespace_87e11242/namespace_87e11242
// Params 0, eflags: 0x2
// Checksum 0x19609b03, Offset: 0x220
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_3ee2bcf1f7dc56c8", &init, undefined, undefined );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0xbf14505b, Offset: 0x268
// Size: 0x34
function init()
{
    init_clientfields();
    init_flags();
    init_quest();
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0xf28b6bf0, Offset: 0x2a8
// Size: 0x104
function init_clientfields()
{
    clientfield::register( "world", "" + #"hash_31a98ee76e835504", 1, 1, "int" );
    clientfield::register( "world", "" + #"hash_3284b0cf34bfe44e", 1, 1, "int" );
    clientfield::register( "world", "" + #"hash_b143d97bf92fc66", 1, 1, "counter" );
    clientfield::register( "world", "" + #"hash_28f972533bb468fd", 1, 1, "int" );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x67453635, Offset: 0x3b8
// Size: 0xa4
function init_flags()
{
    level flag::init( #"hash_4c30d0428f1d4060" );
    level flag::init( #"hash_5516784173c2ee27" );
    level flag::init( #"server_fixed" );
    level flag::init( #"card_inserted" );
    level flag::init( #"hash_5df188993c013698" );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x9f8e0249, Offset: 0x468
// Size: 0x69c
function init_quest()
{
    level.var_595db1e1 = struct::get( "fix_server", "targetname" );
    level.s_fix_server_spark_fx = struct::get( "fix_server_spark_fx", "targetname" );
    level.var_a73534b7 = struct::get( "punch_card_insert", "targetname" );
    level.var_af224340 = getent( "punch_card_screen", "targetname" );
    level.var_af224340 hide();
    level.var_9c0c4b0d = struct::get_array( "aat_dmg_fx", "targetname" );
    array::sort_by_script_int( level.var_9c0c4b0d, 1 );
    level.var_67599dfe = [];
    
    for ( i = 0; i < level.var_9c0c4b0d.size ; i++ )
    {
        level.var_67599dfe[ i ] = 0;
    }
    
    var_b3edfb92 = getent( "server_part_placement", "targetname" );
    var_b3edfb92 hide();
    var_240bceab = array( #"hash_1a4bbbe1a3b57e4f" );
    var_e4158c30 = array( #"hash_7544aa4a3281de20" );
    var_19bb8831 = array( #"hash_cfe3836bc9ca39", #"hash_4b18b104deb5d028" );
    var_17b5a12 = array( #"hash_ebea45d703b1ed2", #"hash_2c58be4a6b26629b", #"hash_3db46912689769f0", #"hash_1152f3ac3dddade1" );
    var_b37ebf6 = array( #"hash_4768d4b244860f63" );
    var_4e4ef50e = array( #"hash_217e6ae56b61ad3b" );
    var_2c28b1bb = array( #"hash_2747b199d121f40b" );
    level.var_5a599dbf = [];
    level.var_5a599dbf[ 0 ] = { #in_inventory:0, #vo_line:var_240bceab };
    level.var_5a599dbf[ 1 ] = { #in_inventory:0, #vo_line:var_e4158c30 };
    level.var_5a599dbf[ 2 ] = { #in_inventory:0, #vo_line:var_19bb8831 };
    level.var_5a599dbf[ 3 ] = { #in_inventory:0, #vo_line:var_17b5a12 };
    level.var_5a599dbf[ 4 ] = { #in_inventory:0, #vo_line:var_b37ebf6 };
    level.var_5a599dbf[ 5 ] = { #in_inventory:0, #vo_line:var_4e4ef50e };
    level.var_5a599dbf[ 6 ] = { #in_inventory:0, #vo_line:var_2c28b1bb };
    level.var_a035a0b9 = zm_hms_util::function_bffcedde( "office_punch_card", "targetname", "script_int" );
    level.var_3d015a65 = 0;
    
    foreach ( var_453ce50f in level.var_a035a0b9 )
    {
        var_453ce50f zm_item_pickup::item_pickup_init( &function_e8d6a81b, 1 );
    }
    
    var_453ce50f = getent( "punch_card_anim", "targetname" );
    assert( isdefined( var_453ce50f ), "<dev string:x38>" );
    var_453ce50f hide();
    zm_sq::register( #"pernell_archive", #"step_1", #"pernell_archive_step1", &pernell_archive_step1_setup, &pernell_archive_step1_cleanup );
    zm_sq::register( #"pernell_archive", #"step_2", #"pernell_archive_step2", &pernell_archive_step2_setup, &pernell_archive_step2_cleanup );
    zm_sq::start( #"pernell_archive" );
    level thread function_afb5905e();
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0xa76df726, Offset: 0xb10
// Size: 0x8c
function function_afb5905e()
{
    level waittill( #"all_players_spawned" );
    level clientfield::set( "" + #"hash_3284b0cf34bfe44e", 1 );
    level clientfield::set( "" + #"hash_31a98ee76e835504", 1 );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 1
// Checksum 0x48cdfe02, Offset: 0xba8
// Size: 0x2b4
function pernell_archive_step1_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level.var_2cbf5e38 = 0;
        s_server_part_pickup = struct::get( "server_part_pickup" );
        s_server_part_pickup zm_unitrigger::create( #"", 64, &function_8703c1fe );
        level flag::wait_till( #"hash_4c30d0428f1d4060" );
        var_185199a1 = getent( s_server_part_pickup.target, "targetname" );
        var_185199a1 playsound( #"hash_18f957b8000dd0c6" );
        var_185199a1 delete();
        zm_unitrigger::unregister_unitrigger( s_server_part_pickup.s_unitrigger );
        s_server_part_pickup struct::delete();
        level.var_595db1e1 zm_unitrigger::create( #"", 64, &function_e4fcfb0a );
        level flag::wait_till( #"hash_5516784173c2ee27" );
        playsoundatposition( #"hash_359664e44a2bb635", level.var_595db1e1.origin );
        level clientfield::set( "" + #"hash_3284b0cf34bfe44e", 0 );
        level clientfield::increment( "" + #"hash_b143d97bf92fc66", 1 );
        level.var_67599dfe[ 0 ] = 1;
        zm_unitrigger::unregister_unitrigger( level.var_595db1e1.s_unitrigger );
        var_ae88db53 = getent( "server_damage_trigger", "targetname" );
        var_ae88db53 function_a546fd97();
        level flag::wait_till( #"server_fixed" );
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 2
// Checksum 0x12361bf5, Offset: 0xe68
// Size: 0xa4
function pernell_archive_step1_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level flag::set( #"server_fixed" );
    }
    
    s_server_part_pickup = struct::get( "server_part_pickup" );
    
    if ( isdefined( s_server_part_pickup ) )
    {
        s_server_part_pickup struct::delete();
    }
    
    zm_unitrigger::unregister_unitrigger( level.var_595db1e1.s_unitrigger );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x21d02369, Offset: 0xf18
// Size: 0x7c
function function_8703c1fe()
{
    waitresult = self waittill( #"trigger" );
    level.var_2cbf5e38 = 1;
    level flag::set( #"hash_4c30d0428f1d4060" );
    
    /#
        iprintlnbold( "<dev string:x65>" );
    #/
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x9ab0db26, Offset: 0xfa0
// Size: 0x4c
function function_e4fcfb0a()
{
    waitresult = self waittill( #"trigger" );
    level flag::set( #"hash_5516784173c2ee27" );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0xf5a0ff78, Offset: 0xff8
// Size: 0x2b0
function function_a546fd97()
{
    self endon( #"death" );
    var_863c08bb = 0;
    var_c327a579 = 0;
    
    while ( !var_c327a579 )
    {
        s_notify = self waittill( #"damage" );
        add_outtime = s_notify.attacker aat::getaatonweapon( s_notify.weapon );
        
        if ( isdefined( add_outtime ) && add_outtime.name === "zm_aat_kill_o_watt" )
        {
            var_863c08bb += s_notify.amount;
            var_9ce2f88b = var_863c08bb / 15000;
            var_5c3100f7 = int( min( floor( var_9ce2f88b * level.var_9c0c4b0d.size ), level.var_9c0c4b0d.size ) );
            
            for ( i = 0; i < var_5c3100f7 ; i++ )
            {
                if ( !level.var_67599dfe[ i ] )
                {
                    level.var_67599dfe[ i ] = 1;
                    level clientfield::increment( "" + #"hash_b143d97bf92fc66", 1 );
                    waitframe( 1 );
                }
            }
            
            if ( var_863c08bb >= 15000 )
            {
                var_c327a579 = 1;
                level flag::set( #"server_fixed" );
                level clientfield::set( "" + #"hash_28f972533bb468fd", 1 );
                
                /#
                    iprintlnbold( "<dev string:x7d>" );
                #/
                
                self playsound( #"hash_4f1f1f9762add0a3" );
                s_notify.attacker thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
            }
        }
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 1
// Checksum 0x379fd1e3, Offset: 0x12b0
// Size: 0x24
function pernell_archive_step2_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        function_24510350();
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 2
// Checksum 0x8377a2ba, Offset: 0x12e0
// Size: 0x26
function pernell_archive_step2_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 1
// Checksum 0x2136b92d, Offset: 0x1310
// Size: 0xa0
function function_e8d6a81b( e_item )
{
    s_punch_card = level.var_5a599dbf[ level.var_3d015a65 ];
    s_punch_card.in_inventory = 1;
    self thread zm_vo::function_a2bd5a0c( #"hash_7e030fccc2c5a121" );
    
    if ( isdefined( e_item ) )
    {
        e_item playsound( #"hash_18f957b8000dd0c6" );
    }
    
    function_2f5993d6();
    level.var_3d015a65++;
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x6ea27c2, Offset: 0x13b8
// Size: 0x70
function function_2f5993d6()
{
    level.var_fcbb6a6b = undefined;
    
    for ( i = 0; i < level.var_5a599dbf.size ; i++ )
    {
        if ( level.var_5a599dbf[ i ].in_inventory )
        {
            level.var_fcbb6a6b = level.var_5a599dbf[ i ];
            break;
        }
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 1
// Checksum 0x74da786f, Offset: 0x1430
// Size: 0x98, Type: bool
function function_814ee815( player )
{
    if ( self.stub.in_use === 1 )
    {
        return false;
    }
    
    if ( !isdefined( level.var_fcbb6a6b ) )
    {
        return false;
    }
    
    if ( function_8b1a219a() )
    {
        self sethintstring( #"hash_28806e76718dea47" );
    }
    else
    {
        self sethintstring( #"hash_4a380545b9102af9" );
    }
    
    return true;
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x9a0522c9, Offset: 0x14d0
// Size: 0x50
function function_445e3d3d()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"trigger" );
        self.stub notify( #"play_audio" );
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x95ecc8bc, Offset: 0x1528
// Size: 0x184
function function_54db89ef()
{
    self endon( #"death" );
    var_ab007509 = 0;
    
    while ( true )
    {
        self waittill( #"play_audio" );
        
        if ( isdefined( level.var_fcbb6a6b ) )
        {
            s_card = level.var_fcbb6a6b;
            self.in_use = 1;
            s_card.in_inventory = 0;
            function_2f5993d6();
            level thread function_9f206255();
            level flag::wait_till( "card_inserted" );
            zm_hms_util::function_52c3fe8d( s_card.vo_line, level.var_a73534b7.origin );
            
            if ( s_card.vo_line[ 0 ] == #"hash_217e6ae56b61ad3b" )
            {
                level flag::set( #"hash_5df188993c013698" );
            }
            
            var_ab007509++;
            
            if ( var_ab007509 < 7 )
            {
                self.in_use = 0;
                continue;
            }
            
            break;
        }
    }
    
    zm_unitrigger::unregister_unitrigger( self );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0xaaa850f2, Offset: 0x16b8
// Size: 0xa4
function function_24510350()
{
    level.var_af224340 show();
    level clientfield::set( "" + #"hash_31a98ee76e835504", 0 );
    s_unitrigger = level.var_a73534b7 zm_unitrigger::create( &function_814ee815, 64, &function_445e3d3d );
    s_unitrigger thread function_54db89ef();
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0x63e8fbec, Offset: 0x1768
// Size: 0x1ac
function function_9f206255()
{
    var_453ce50f = getent( "punch_card_anim", "targetname" );
    assert( isdefined( var_453ce50f ), "<dev string:x38>" );
    var_453ce50f show();
    v_starting_origin = var_453ce50f.origin;
    var_5287d229 = var_453ce50f.angles;
    v_forward = anglestoforward( var_453ce50f.angles );
    wait 0.5;
    var_453ce50f playsound( "evt_ee_punchcard_insert" );
    var_453ce50f moveto( var_453ce50f.origin + v_forward * -14, 3 );
    wait 1;
    level flag::set( #"card_inserted" );
    var_453ce50f waittill( #"movedone" );
    var_453ce50f hide();
    var_453ce50f.origin = v_starting_origin;
    var_453ce50f.angles = var_5287d229;
    level flag::clear( #"card_inserted" );
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0
// Checksum 0xcb906010, Offset: 0x1920
// Size: 0x120
function function_fe05ebd7()
{
    a_e_items = getitemarray();
    
    foreach ( e_item in a_e_items )
    {
        foreach ( s_punch_card in level.var_5a599dbf )
        {
            if ( e_item.item.name == s_punch_card.name )
            {
                e_item delete();
                break;
            }
        }
    }
}

