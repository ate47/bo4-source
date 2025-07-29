#using script_cb32d07c95e5628;
#using scripts\abilities\gadgets\gadget_homunculus;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\match_record;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\armor;
#using scripts\mp_common\dynent_world;
#using scripts\mp_common\item_drop;
#using scripts\mp_common\item_inventory;
#using scripts\mp_common\item_inventory_util;
#using scripts\mp_common\item_spawn_groups;
#using scripts\mp_common\item_world_util;
#using scripts\weapons\sensor_dart;
#using scripts\weapons\weaponobjects;

#namespace item_world;

// Namespace item_world/item_world
// Params 0, eflags: 0x2
// Checksum 0x307c2d71, Offset: 0x3c8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"item_world", &__init__, undefined, undefined );
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0xb75a8503, Offset: 0x410
// Size: 0x5e4
function private __init__()
{
    if ( !isdefined( getgametypesetting( #"useitemspawns" ) ) || getgametypesetting( #"useitemspawns" ) == 0 )
    {
        return;
    }
    
    level.var_9cddbf4e = [];
    level.var_9cddbf4e[ #"p8_fxanim_wz_supply_stash_01_mod" ] = { #open_sound:#"hash_3462cfb200a2367", #var_b9492c6:#"hash_32f9ba3b1da75ed5" };
    level.var_9cddbf4e[ #"p8_fxanim_wz_supply_stash_04_mod" ] = { #open_sound:#"hash_3462cfb200a2367", #var_b9492c6:#"hash_32f9ba3b1da75ed5" };
    level.var_9cddbf4e[ #"p8_fxanim_wz_death_stash_mod" ] = { #open_sound:#"hash_5e8b0f6cade25ff6", #var_b9492c6:#"hash_70fb2ee1b706a28a" };
    level.var_9cddbf4e[ #"hash_1dcbe8021fb16344" ] = { #open_sound:#"hash_56b5b65c141f4629", #var_b9492c6:#"hash_6fcb29cae6678d93" };
    level.var_9cddbf4e[ #"p8_fxanim_wz_supply_stash_ammo_mod" ] = { #open_sound:#"hash_f743d336f8b7764", #var_b9492c6:#"hash_3e62bcbd6460ff44" };
    level.var_9cddbf4e[ #"hash_574076754776e003" ] = { #open_sound:#"hash_36e23ce3e5f7e4c0", #var_b9492c6:#"hash_22f426a8593609e8" };
    level.var_9cddbf4e[ #"wpn_t7_drop_box_wz" ] = { #open_sound:#"hash_613f8a1669f8b231", #var_b9492c6:#"hash_2b751d50426093db" };
    callback::on_connect( &_on_player_connect );
    callback::on_spawned( &_on_player_spawned );
    callback::on_disconnect( &_on_player_disconnect );
    callback::add_callback( #"hash_41781454d98b676a", &function_9aefb438 );
    clientfield::register( "world", "item_world_seed", 1, 31, "int" );
    clientfield::register( "world", "item_world_disable", 1, 1, "int" );
    clientfield::register( "scriptmover", "item_world_attachments", 10000, 1, "int" );
    clientfield::register_clientuimodel( "hudItems.pickupHintGold", 1, 1, "int", 1 );
    clientfield::register( "toplayer", "disableItemPickup", 18000, 1, "int" );
    function_116fd9a7();
    level thread function_f7fb8a17( 0 );
    level thread function_e1965ae1();
    level.var_703d32de = 0;
    level.var_17c7288a = &function_23b313bd;
    level.nullprimaryoffhand = getweapon( #"null_offhand_primary" );
    level.nullsecondaryoffhand = getweapon( #"null_offhand_secondary" );
    level thread namespace_65181344::init_spawn_system();
    
    if ( !isdefined( level.var_227b9e91 ) )
    {
        level.var_227b9e91 = new throttle();
        [[ level.var_227b9e91 ]]->initialize( 4, 0.05 );
    }
    
    level.var_3dfbaf65 = &function_8e0d14c1;
    level thread function_df1098a();
    level thread function_248022d9();
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0x39c97b04, Offset: 0xa00
// Size: 0x72
function private function_e6ea1ee0()
{
    [[ level.var_227b9e91 ]]->waitinqueue( self );
    var_fee74908 = function_784b5aa6();
    var_fee74908[ var_fee74908.size ] = level flagsys::get( #"item_world_reset" ) ? 1 : 0;
    return var_fee74908;
}

// Namespace item_world/item_world
// Params 2, eflags: 0x4
// Checksum 0x45d5384e, Offset: 0xa80
// Size: 0x1fa
function private function_e0b64358( player, item )
{
    if ( !isdefined( player ) || !isdefined( item ) )
    {
        return;
    }
    
    stash = item_world_util::function_31f5aa51( item );
    
    if ( isdefined( stash ) && isdefined( stash.lootlocker ) && stash.lootlocker )
    {
        var_97809692 = player item_inventory::function_2e711614( 15 );
        
        if ( isdefined( var_97809692 ) && isdefined( var_97809692.itementry ) && var_97809692.itementry.name == #"resource_item_loot_locker_key" )
        {
            player item_inventory::use_inventory_item( var_97809692.networkid, 1 );
            
            if ( !isdefined( player.var_fbcc86d3 ) )
            {
                player.var_fbcc86d3 = [];
            }
            
            player.var_fbcc86d3[ item.itementry.weapon.name ] = 1;
        }
        
        var_97809692 = player item_inventory::function_2e711614( 15 );
        
        if ( !isdefined( var_97809692 ) || !isdefined( var_97809692.itementry ) || var_97809692.itementry.name != #"resource_item_loot_locker_key" )
        {
            stash.var_193b3626 = undefined;
        }
        
        if ( !isdefined( stash.var_80b1d504 ) )
        {
            stash.var_80b1d504 = 0;
        }
        
        stash.var_80b1d504 += 1;
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0xed7e9b1a, Offset: 0xc88
// Size: 0x20c
function private function_f3b6e182( player )
{
    assert( isplayer( player ) );
    usetrigger = spawn( "trigger_radius_use", ( 0, 0, -10000 ), 0, 128, 72 );
    usetrigger triggerignoreteam();
    usetrigger setinvisibletoall();
    usetrigger setvisibletoplayer( self );
    usetrigger setteamfortrigger( #"none" );
    usetrigger setcursorhint( "HINT_NOICON" );
    usetrigger triggerenable( 0 );
    usetrigger function_89fca53b( 0 );
    usetrigger function_49462027( 1, 1 | 16 | 8388608 | 65536 | 4194304 );
    player.var_207c9892 = getdvarint( #"hash_3ec4f617fad5b87c", 150 ) / 1000;
    function_dae4ab9b( usetrigger, player.var_207c9892 );
    player clientclaimtrigger( usetrigger );
    player.var_19caeeea = usetrigger;
    usetrigger callback::on_trigger( &function_ad7ad6ce );
}

// Namespace item_world/item_world
// Params 3, eflags: 0x4
// Checksum 0x834bfb80, Offset: 0xea0
// Size: 0x230
function private function_b516210b( var_889058cc, origin, activator )
{
    if ( !isplayer( activator ) )
    {
        return;
    }
    
    var_cde95668 = isdefined( activator ) && activator hasperk( #"specialty_quieter" );
    
    if ( isdefined( level.var_9cddbf4e[ var_889058cc ] ) )
    {
        mapping = level.var_9cddbf4e[ var_889058cc ];
        open_sound = playsoundatposition( mapping.open_sound, origin + ( 0, 0, 50 ) );
        
        if ( isdefined( open_sound ) )
        {
            open_sound hide();
        }
        
        var_b9492c6 = playsoundatposition( mapping.var_b9492c6, origin + ( 0, 0, 50 ) );
        
        if ( isdefined( var_b9492c6 ) )
        {
            var_b9492c6 hide();
        }
        
        foreach ( player in getplayers() )
        {
            if ( var_cde95668 && !player hasperk( #"specialty_loudenemies" ) )
            {
                if ( isdefined( var_b9492c6 ) )
                {
                    var_b9492c6 showtoplayer( player );
                }
                
                continue;
            }
            
            if ( isdefined( open_sound ) )
            {
                open_sound showtoplayer( player );
            }
        }
    }
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0xe25c16b1, Offset: 0x10d8
// Size: 0x132
function private function_d045e83b( item, player, networkid, itemid, itemcount, var_aec6fa7f, slot )
{
    if ( item.itementry.itemtype !== #"ammo" )
    {
        assertmsg( "<dev string:x38>" + item.name + "<dev string:x41>" );
        return 0;
    }
    
    if ( !self item_inventory::can_pickup_ammo( item ) )
    {
        return ( isdefined( item.itementry.amount ) ? item.itementry.amount : isdefined( var_aec6fa7f ) ? var_aec6fa7f : 1 );
    }
    
    player function_b00db06( 8, itemid );
    return player item_inventory::equip_ammo( item, var_aec6fa7f );
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0x5b992843, Offset: 0x1218
// Size: 0x200
function private function_2e5b5858( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    droppeditem = undefined;
    var_3d1f9df4 = 0;
    var_b0938bd7 = undefined;
    var_381f3b39 = 0;
    
    if ( player armor::has_armor() )
    {
        inventoryitem = player.inventory.items[ 11 ];
        
        if ( inventoryitem.networkid != 32767 )
        {
            droppeditem = inventoryitem.itementry;
            var_3d1f9df4 = droppeditem.amount;
        }
    }
    
    player item_inventory::drop_armor();
    remainingitems = player item_inventory::give_inventory_item( item, 1, var_aec6fa7f, slotid );
    
    if ( remainingitems < itemcount )
    {
        if ( isdefined( item.networkid ) && item_world_util::function_db35e94f( item.networkid ) )
        {
            item = item_inventory::get_inventory_item( item.networkid );
        }
        
        if ( player item_inventory::function_fba4a353( item ) )
        {
            player item_inventory::equip_armor( item );
            var_b0938bd7 = item.itementry;
            var_381f3b39 = item.itementry.amount;
        }
    }
    
    function_1a46c8ae( player, droppeditem, var_3d1f9df4, var_b0938bd7, var_381f3b39 );
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0x3d09cc7a, Offset: 0x1420
// Size: 0x80
function private function_cb9b4dd7( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    player item_inventory::function_3d113bfb();
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0xd478a3c0, Offset: 0x14a8
// Size: 0x178
function private function_14b2eddf( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    var_f0dc4e93 = player item_inventory::function_ec087745();
    weaponslotid = undefined;
    
    if ( isdefined( var_f0dc4e93 ) && var_f0dc4e93 != 32767 )
    {
        weaponslotid = player item_inventory::function_b246c573( var_f0dc4e93 );
    }
    
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    
    if ( isdefined( weaponslotid ) && isdefined( slotid ) && item_inventory_util::function_398b9770( weaponslotid, slotid ) )
    {
        if ( isdefined( item.networkid ) && item_world_util::function_db35e94f( item.networkid ) )
        {
            item = item_inventory::get_inventory_item( item.networkid );
        }
        
        player item_inventory::equip_attachment( item, var_f0dc4e93, undefined, 0 );
    }
    
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0x8746470f, Offset: 0x1628
// Size: 0x110
function private function_42ffe9b2( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    if ( player item_inventory::function_fba4a353( item ) )
    {
        slotid = 13;
    }
    
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    
    if ( remainingitems < itemcount && slotid === 13 )
    {
        if ( isdefined( item.networkid ) && item_world_util::function_db35e94f( item.networkid ) )
        {
            item = item_inventory::get_inventory_item( item.networkid );
        }
        
        player item_inventory::equip_backpack( item );
    }
    
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0x548acf6b, Offset: 0x1740
// Size: 0xf8
function private function_2eebeff5( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, var_aec6fa7f, slotid );
    
    if ( remainingitems < itemcount )
    {
        if ( isdefined( item.networkid ) && item_world_util::function_db35e94f( item.networkid ) )
        {
            item = item_inventory::get_inventory_item( item.networkid );
        }
        
        if ( player item_inventory::function_fba4a353( item ) )
        {
            player thread item_inventory::equip_equipment( item );
        }
    }
    
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0xefa8bf38, Offset: 0x1840
// Size: 0xf0
function private function_349d4c26( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    
    if ( remainingitems < itemcount )
    {
        if ( isdefined( item.networkid ) && item_world_util::function_db35e94f( item.networkid ) )
        {
            item = item_inventory::get_inventory_item( item.networkid );
        }
        
        if ( player item_inventory::function_fba4a353( item ) )
        {
            player thread item_inventory::equip_health( item );
        }
    }
    
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0x27da6b48, Offset: 0x1938
// Size: 0x6a
function private function_670cce3f( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0xb991e6d1, Offset: 0x19b0
// Size: 0x6a
function private function_41a52251( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0xbd3bf315, Offset: 0x1a28
// Size: 0x90
function private function_2b2e9302( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    player callback::callback( #"hash_3b891b6daa75c782", item );
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0x4c73e20e, Offset: 0x1ac0
// Size: 0x6a
function private function_a240798a( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, undefined, slotid );
    return remainingitems;
}

// Namespace item_world/item_world
// Params 7, eflags: 0x4
// Checksum 0xe9ce1164, Offset: 0x1b38
// Size: 0x220
function private function_a712496a( item, player, networkid, itemid, itemcount, var_aec6fa7f, slotid )
{
    assert( isplayer( self ) );
    
    if ( item_inventory::get_weapon_count() == 2 )
    {
        stashitem = item.hidetime === -1;
        stashitem &= ~( isdefined( item.deathstash ) ? item.deathstash : 0 );
        weaponitem = item_inventory::function_230ceec4( player.currentweapon );
        
        if ( !isdefined( weaponitem ) )
        {
            player takeweapon( player.currentweapon );
        }
        else
        {
            player thread item_inventory::drop_inventory_item( weaponitem.networkid, stashitem, item.origin, isdefined( item.targetnamehash ) ? item.targetnamehash : item.targetname );
        }
    }
    
    remainingitems = player item_inventory::give_inventory_item( item, itemcount, var_aec6fa7f, slotid );
    
    if ( remainingitems < itemcount )
    {
        if ( isdefined( item.networkid ) && item_world_util::function_db35e94f( item.networkid ) )
        {
            item = item_inventory::get_inventory_item( item.networkid );
        }
        
        player item_inventory::equip_weapon( item, 1, 1, 0, 1 );
    }
    
    return remainingitems;
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0x90ce3b09, Offset: 0x1d60
// Size: 0x4d8
function private function_e1965ae1()
{
    level endon( #"game_ended" );
    waitframe( 1 );
    level flagsys::wait_till( #"hash_507a4486c4a79f1d" );
    util::wait_network_frame( 1 );
    level flagsys::wait_till_clear( #"hash_2d3b2a4d082ba5ee" );
    setdvar( #"hash_21e070fbb56cf0f", 0 );
    
    if ( isdefined( level.item_spawn_stashes ) )
    {
        foreach ( supply_stash in level.item_spawn_stashes )
        {
            setdynentenabled( supply_stash, 1 );
        }
    }
    
    foreach ( player in getplayers() )
    {
        if ( isplayer( player ) )
        {
            player weaponobjects::function_ac7c2bf9();
        }
    }
    
    activemissiles = getentarraybytype( 4 );
    
    for ( index = 0; index < activemissiles.size ; index++ )
    {
        if ( isdefined( activemissiles[ index ] ) )
        {
            activemissiles[ index ] delete();
        }
    }
    
    foreach ( homunculus in level.var_2da60c10 )
    {
        if ( isdefined( homunculus ) )
        {
            homunculus gadget_homunculus::function_7bfc867f();
        }
    }
    
    reset_item_world();
    
    if ( ( isdefined( getgametypesetting( #"hash_7d8c969e384dd1c9" ) ) ? getgametypesetting( #"hash_7d8c969e384dd1c9" ) : 0 ) || ( isdefined( getgametypesetting( #"wzheavymetalheroes" ) ) ? getgametypesetting( #"wzheavymetalheroes" ) : 0 ) )
    {
        if ( isdefined( level.var_5c14d2e6 ) )
        {
            foreach ( player in getplayers() )
            {
                player thread [[ level.var_5c14d2e6 ]]();
            }
        }
    }
    
    foreach ( player in getplayers() )
    {
        player thread item_inventory::function_461de298();
    }
    
    /#
        foreach ( player in getplayers() )
        {
            player thread function_76eb9bd7();
        }
    #/
}

// Namespace item_world/freefall
// Params 1, eflags: 0x40
// Checksum 0x304a5810, Offset: 0x2240
// Size: 0x74
function event_handler[freefall] function_5019e563( eventstruct )
{
    if ( !isdefined( self.var_554ec2e2 ) )
    {
        return;
    }
    
    if ( !( isdefined( eventstruct.freefall ) && eventstruct.freefall ) && !( isdefined( eventstruct.var_695a7111 ) && eventstruct.var_695a7111 ) )
    {
        self thread [[ self.var_554ec2e2 ]]();
    }
}

// Namespace item_world/parachute
// Params 1, eflags: 0x40
// Checksum 0x192881a5, Offset: 0x22c0
// Size: 0x4c
function event_handler[parachute] function_87b05fa3( eventstruct )
{
    if ( !isdefined( self.var_554ec2e2 ) )
    {
        return;
    }
    
    if ( !( isdefined( eventstruct.parachute ) && eventstruct.parachute ) )
    {
        self thread [[ self.var_554ec2e2 ]]();
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0xdff544f4, Offset: 0x2318
// Size: 0x25c
function private function_f7fb8a17( reset = 1 )
{
    level endon( #"game_ended" );
    waitframe( 1 );
    level flagsys::wait_till_clear( #"hash_2d3b2a4d082ba5ee" );
    level flagsys::set( #"hash_2d3b2a4d082ba5ee" );
    
    if ( level flagsys::get( #"item_world_reset" ) )
    {
        return;
    }
    
    waitframe( 1 );
    level flagsys::clear( #"item_world_initialized" );
    var_47f2f5fa = ( 1 << 29 ) - 1;
    seedvalue = randomintrange( 0, var_47f2f5fa ) + 1;
    
    /#
        seedvalue = getdvarint( #"hash_46870e6b25b988eb", seedvalue );
    #/
    
    level.item_spawn_seed = seedvalue;
    match_record::set_stat( #"item_spawn_seed", seedvalue );
    setdvar( #"hash_21e070fbb56cf0f", 0 );
    var_6937495e = seedvalue << 1;
    var_6937495e |= reset ? 1 : 0;
    level clientfield::set( "item_world_seed", var_6937495e );
    level item_spawn_group::setup( seedvalue, reset );
    level flagsys::set( #"item_world_initialized" );
    
    if ( reset )
    {
        level flagsys::set( #"item_world_reset" );
    }
    
    level flagsys::clear( #"hash_2d3b2a4d082ba5ee" );
}

// Namespace item_world/item_world
// Params 2, eflags: 0x4
// Checksum 0x23e48be6, Offset: 0x2580
// Size: 0xac
function private function_a7b7d70b( player, networkid )
{
    item = player item_inventory::get_inventory_item( networkid );
    
    if ( isdefined( item ) && isdefined( item.itementry ) && isdefined( item.itementry.consumable ) && item.itementry.consumable )
    {
        player function_b00db06( 15, item.networkid );
    }
}

// Namespace item_world/item_world
// Params 2, eflags: 0x4
// Checksum 0x45aa8e, Offset: 0x2638
// Size: 0x80, Type: bool
function private function_8bac489c( supplystash, player )
{
    assert( isdefined( supplystash ) );
    assert( isplayer( player ) );
    
    if ( supplystash.var_193b3626 === player getentitynumber() )
    {
        return true;
    }
    
    return false;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0x3022341d, Offset: 0x26c0
// Size: 0x260, Type: bool
function private function_35c26e09( supplystash )
{
    supplystash.var_193b3626 = undefined;
    supplystash.var_80089988 = undefined;
    targetname = isdefined( supplystash.targetname ) ? supplystash.targetname : supplystash.target;
    var_76c7cb8a = function_91b29d2a( targetname );
    var_3c32093e = 0;
    var_3ba9a53f = [];
    
    foreach ( item in var_76c7cb8a )
    {
        if ( distancesquared( item.origin, supplystash.origin ) > 36 )
        {
            continue;
        }
        
        if ( !isdefined( item.itementry ) )
        {
            continue;
        }
        
        if ( item_world_util::can_pick_up( item ) )
        {
            var_3c32093e = 1;
            break;
        }
        
        var_3ba9a53f[ var_3ba9a53f.size ] = item;
    }
    
    if ( !var_3c32093e )
    {
        foreach ( item in var_3ba9a53f )
        {
            function_54ca5536( item.id, -1 );
            resetitem = level flagsys::get( #"item_world_reset" );
            function_bfc28859( 3, item.id, resetitem );
            break;
        }
    }
    
    setdynentstate( supplystash, 0 );
    return true;
}

// Namespace item_world/item_world
// Params 2, eflags: 0x4
// Checksum 0x70e51576, Offset: 0x2928
// Size: 0x3f8, Type: bool
function private function_199c092d( supplystash, player = undefined )
{
    assert( !isdefined( supplystash.var_193b3626 ) );
    
    if ( isdefined( supplystash.var_193b3626 ) )
    {
        return false;
    }
    
    supplystash.var_193b3626 = player getentitynumber();
    item = player item_inventory::function_2e711614( 15 );
    
    if ( item.itementry.name !== #"resource_item_loot_locker_key" )
    {
        return false;
    }
    
    lootweapons = player item_inventory_util::get_loot_weapons();
    assert( lootweapons.size > 0 );
    
    if ( lootweapons.size <= 0 )
    {
        return false;
    }
    
    var_cf23afee = [];
    
    foreach ( weaponname in lootweapons )
    {
        var_cf23afee[ weaponname ] = 1;
    }
    
    targetname = isdefined( supplystash.targetname ) ? supplystash.targetname : supplystash.target;
    var_76c7cb8a = function_91b29d2a( targetname );
    
    foreach ( item in var_76c7cb8a )
    {
        if ( distancesquared( item.origin, supplystash.origin ) > 36 )
        {
            continue;
        }
        
        if ( !isdefined( item.itementry ) || !isdefined( item.itementry.weapon ) )
        {
            continue;
        }
        
        if ( item_world_util::can_pick_up( item ) && !isdefined( var_cf23afee[ item.itementry.weapon.name ] ) )
        {
            consume_item( item );
            continue;
        }
        
        if ( isdefined( player.var_fbcc86d3 ) && isdefined( player.var_fbcc86d3[ item.itementry.weapon.name ] ) )
        {
            consume_item( item );
            continue;
        }
        
        if ( isdefined( var_cf23afee[ item.itementry.weapon.name ] ) )
        {
            function_54ca5536( item.id, -1 );
            resetitem = level flagsys::get( #"item_world_reset" );
            function_bfc28859( 3, item.id, resetitem );
        }
    }
    
    return true;
}

// Namespace item_world/item_world
// Params 4, eflags: 0x4
// Checksum 0x20e10d66, Offset: 0x2d28
// Size: 0xac2
function private function_23b313bd( player, eventtype, eventdata, var_c5a66313 )
{
    if ( isdefined( level.var_ab396c31 ) && level.var_ab396c31 )
    {
        return;
    }
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    switch ( eventtype )
    {
        case 1:
            desiredtime = eventdata ? 1 : 150;
            defaulttime = getdvarint( #"hash_3ec4f617fad5b87c", 150 );
            player.var_207c9892 = min( desiredtime, defaulttime ) / 1000;
            
            if ( isdefined( player.var_19caeeea ) )
            {
                function_dae4ab9b( player.var_19caeeea, player.var_207c9892 );
            }
            
            return;
        case 2:
            var_c1ea9cae = isdefined( eventdata ) && eventdata;
            player.var_c1ea9cae = var_c1ea9cae;
            break;
    }
    
    if ( !function_1b11e73c() )
    {
        return;
    }
    
    if ( !isdefined( player ) || !isalive( player ) )
    {
        return;
    }
    
    if ( eventtype == 4 || eventtype == 11 )
    {
        networkid = eventdata;
        quickequip = var_c5a66313;
        weaponid = eventtype == 11 ? 1 : 0;
        
        if ( player inlaststand() || !isdefined( player.inventory ) || !player item_inventory::equip_item( networkid, quickequip === 1, weaponid ) )
        {
            function_a7b7d70b( player, networkid );
            return;
        }
        
        itemid = player item_inventory::function_c48cd17f( networkid );
        
        if ( itemid != 32767 )
        {
            item = function_b1702735( itemid );
            
            if ( isdefined( item ) && isdefined( item.itementry ) )
            {
                function_1a46c8ae( player, undefined, undefined, item.itementry, item.itementry.amount );
            }
        }
        
        return;
    }
    
    if ( player inlaststand() )
    {
        return;
    }
    
    if ( !isdefined( player.inventory ) )
    {
        return;
    }
    
    switch ( eventtype )
    {
        case 3:
        case 12:
            networkid = eventdata;
            
            if ( player clientfield::get_player_uimodel( "hudItems.multiItemPickup.status" ) == 2 )
            {
                item = function_528ca826( networkid );
                
                if ( isdefined( item ) && player item_world_util::can_pick_up( item ) )
                {
                    success = player pickup_item( item, 1, eventtype == 12 );
                    
                    if ( success )
                    {
                        function_e0b64358( player, item );
                    }
                }
            }
            
            break;
        case 5:
            networkid = eventdata;
            count = var_c5a66313;
            var_a1ca235e = undefined;
            var_3d1f9df4 = undefined;
            
            if ( item_world_util::function_2c7fc531( networkid ) )
            {
                itemid = networkid;
                item = function_b1702735( itemid );
                assert( item.itementry.itemtype == #"ammo" );
                
                if ( item.itementry.itemtype == #"ammo" )
                {
                    var_a1ca235e = item.itementry;
                    var_3d1f9df4 = count;
                    player item_inventory::function_ecd1c667( itemid, count );
                }
            }
            else
            {
                if ( networkid == 32767 )
                {
                    return;
                }
                
                inventory_item = player item_inventory::get_inventory_item( networkid );
                
                if ( !isdefined( inventory_item ) )
                {
                    break;
                }
                
                removeonly = isdefined( inventory_item.endtime );
                
                if ( !isdefined( count ) || count === inventory_item.count || removeonly )
                {
                    var_3d1f9df4 = isdefined( count ) ? count : inventory_item.itementry.amount;
                    player item_inventory::drop_inventory_item( networkid );
                }
                else
                {
                    var_3d1f9df4 = count;
                    player item_inventory::function_cfe0e919( networkid, count );
                }
            }
            
            function_1a46c8ae( player, var_a1ca235e, var_3d1f9df4, undefined, undefined );
            break;
        case 6:
            networkid = eventdata;
            freeslot = player item_inventory::function_777cc133();
            
            if ( isdefined( freeslot ) )
            {
                player item_inventory::function_d019bf1d( networkid );
                attachmentslot = player item_inventory::function_b246c573( networkid );
                
                if ( isdefined( attachmentslot ) )
                {
                    player item_inventory::function_26c87da8( attachmentslot, freeslot );
                }
            }
            
            break;
        case 7:
            networkid = eventdata;
            equipdata = var_c5a66313;
            item = function_528ca826( networkid );
            
            if ( !isdefined( item ) )
            {
                return;
            }
            
            origin = player getplayercamerapos();
            
            if ( distance2dsquared( origin, item.origin ) > 128 * 128 || abs( origin[ 2 ] - item.origin[ 2 ] ) > 128 )
            {
                return;
            }
            
            if ( !isdefined( item ) || !isdefined( item.itementry ) )
            {
                return;
            }
            
            if ( item.itementry.itemtype == #"weapon" )
            {
                var_bd31d7b2 = player item_inventory::function_ec087745();
                success = 0;
                
                if ( equipdata == 1 && var_bd31d7b2 != 32767 )
                {
                    success = player item_inventory::function_9d102bbd( item, var_bd31d7b2 );
                }
                else
                {
                    success = player pickup_item( item, 1 );
                }
                
                if ( isdefined( success ) && success )
                {
                    function_e0b64358( player, item );
                }
            }
            else
            {
                if ( equipdata == 2 )
                {
                    player item_inventory::function_fba40e6c( item );
                    break;
                }
                
                var_641d3dc2 = item.itementry.itemtype != #"attachment";
                itementry = item.itementry;
                player pickup_item( item, var_641d3dc2 );
                
                if ( equipdata == 1 || equipdata == 2 )
                {
                    if ( isdefined( itementry ) )
                    {
                        inventoryitem = player item_inventory::function_8babc9f9( itementry );
                    }
                    
                    if ( isdefined( inventoryitem ) )
                    {
                        switch ( inventoryitem.itementry.itemtype )
                        {
                            case #"equipment":
                                player item_inventory::equip_equipment( inventoryitem );
                                break;
                            case #"health":
                                player item_inventory::equip_health( inventoryitem );
                                break;
                        }
                    }
                }
            }
            
            break;
        case 8:
            networkid = eventdata;
            player item_inventory::function_9ba10b94( networkid );
            break;
        case 10:
            player item_inventory::cycle_health_item();
            break;
        case 9:
            player item_inventory::cycle_equipment_item();
            break;
    }
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0x3e50adca, Offset: 0x37f8
// Size: 0xa4
function private _on_player_connect()
{
    function_f3b6e182( self );
    self item_inventory::init_inventory();
    self.var_d7a70ae4 = undefined;
    
    if ( function_76915220() && ( !self issplitscreen() || !self function_f27ff71f() ) )
    {
        self thread function_ba96cdf( self );
    }
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0xe5f99169, Offset: 0x38a8
// Size: 0x2c
function private _on_player_disconnect()
{
    if ( isdefined( self.var_19caeeea ) )
    {
        self.var_19caeeea delete();
    }
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0xeb60cad8, Offset: 0x38e0
// Size: 0x3c
function private _on_player_spawned()
{
    if ( !isdefined( self.inventory ) )
    {
        self item_inventory::init_inventory();
    }
    
    /#
        self thread function_76eb9bd7();
    #/
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0x32cbeb3a, Offset: 0x3928
// Size: 0x408
function private function_9aefb438( params )
{
    if ( isdefined( params ) && params.message == #"hash_52e9e8e985489587" )
    {
        if ( !isdefined( self ) || !isplayer( self ) || !isalive( self ) )
        {
            params.player = undefined;
            return;
        }
        
        msgtype = 13;
        networkid = undefined;
        
        if ( !isdefined( self.var_bf3cabc9 ) )
        {
            var_9b882d22 = self.var_d5673d87;
            
            if ( !isdefined( var_9b882d22 ) || !isdefined( var_9b882d22.networkid ) )
            {
                params.player = undefined;
                return;
            }
            
            if ( !( isdefined( var_9b882d22.var_5d97fed1 ) && var_9b882d22.var_5d97fed1 ) && distance2dsquared( var_9b882d22.origin, self.origin ) > 128 * 128 )
            {
                params.player = undefined;
                return;
            }
            
            if ( !( isdefined( var_9b882d22.var_5d97fed1 ) && var_9b882d22.var_5d97fed1 ) && var_9b882d22.itementry.rarity == #"epic" )
            {
                params.message = #"hash_433c75db9fd3177e";
            }
            
            networkid = var_9b882d22.networkid;
        }
        else
        {
            msgtype = 14;
            networkid = self.var_bf3cabc9 getentitynumber();
        }
        
        platoon = getteamplatoon( self.team );
        
        if ( platoon != #"none" && platoon != #"invalid" )
        {
            teams = function_37d3bfcb( platoon );
            members = [];
            
            foreach ( team in teams )
            {
                foreach ( member in getplayers( team ) )
                {
                    member function_b00db06( msgtype, networkid, self getentitynumber() );
                }
            }
            
            return;
        }
        
        members = getplayers( self.team );
        
        foreach ( member in members )
        {
            member function_b00db06( msgtype, networkid, self getentitynumber() );
        }
    }
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0x9d34a71c, Offset: 0x3d38
// Size: 0xc8, Type: bool
function private function_f27ff71f()
{
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( player == self )
        {
            continue;
        }
        
        if ( !self isplayeronsamemachine( player ) )
        {
            continue;
        }
        
        if ( isdefined( player.var_d7a70ae4 ) && player.var_d7a70ae4 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0xe59c7d36, Offset: 0x3e08
// Size: 0x106
function private function_df1098a()
{
    self notify( "10a9b70443a6baa1" );
    self endon( "10a9b70443a6baa1" );
    level endon( #"game_ended" );
    
    while ( true )
    {
        players = getplayers();
        
        for ( index = 0; index < players.size ; index++ )
        {
            player = players[ index ];
            
            if ( isalive( player ) )
            {
                player function_7c84312d( player getplayercamerapos(), player getplayerangles() );
            }
            
            if ( ( index + 1 ) % 15 == 0 )
            {
                waitframe( 1 );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0x3574e1f2, Offset: 0x3f18
// Size: 0x362
function private function_ad7ad6ce( trigger_struct )
{
    level endon( #"game_ended" );
    self endon( #"disconnect", #"death" );
    usetrigger = self;
    activator = trigger_struct.activator;
    
    if ( !isdefined( activator ) || !isplayer( activator ) || !isalive( activator ) || activator inlaststand() )
    {
        return;
    }
    
    if ( !activator function_8e0d14c1() )
    {
        return;
    }
    
    if ( isdefined( level.var_ab396c31 ) && level.var_ab396c31 )
    {
        return;
    }
    
    var_91d3170d = activator clientfield::get_player_uimodel( "hudItems.multiItemPickup.status" );
    
    if ( var_91d3170d == 4 )
    {
        return;
    }
    
    if ( var_91d3170d == 3 )
    {
        stash = item_world_util::function_31f5aa51( usetrigger.itemstruct );
        
        if ( !isdefined( stash ) )
        {
            return;
        }
        
        if ( function_199c092d( stash, activator ) )
        {
            var_91d3170d = 1;
        }
        else
        {
            return;
        }
    }
    
    if ( var_91d3170d == 1 || var_91d3170d == 0 && usetrigger.itemstruct.hidetime === -1 )
    {
        usetrigger sethintstring( #"" );
        activator clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 2 );
        activator thread function_eb900758( item_world_util::function_31f5aa51( usetrigger.itemstruct ) );
        function_a54d07e6( usetrigger.itemstruct, activator );
        return;
    }
    
    if ( var_91d3170d == 2 )
    {
        usetrigger sethintstring( #"" );
        return;
    }
    
    item = usetrigger.itemstruct;
    
    if ( isdefined( item ) && !isentity( item ) && isdefined( item.id ) )
    {
        item = function_b1702735( item.id );
    }
    
    if ( activator item_world_util::can_pick_up( item ) )
    {
        activator pickup_item( item );
        
        while ( isdefined( activator ) && activator usebuttonpressed() )
        {
            waitframe( 1 );
        }
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0x52b9b1ce, Offset: 0x4288
// Size: 0xfa
function private function_eb900758( stash )
{
    self childthread function_d87c50ae( stash );
    self childthread function_6266f448( stash );
    self waittill( #"disconnect", #"death", #"entering_last_stand", #"hash_2781407e327b42ee" );
    
    if ( isdefined( stash ) && isdefined( stash.lootlocker ) && stash.lootlocker )
    {
        function_35c26e09( stash );
    }
    
    if ( isdefined( self ) )
    {
        self clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 0 );
        self.var_c4462112 = 1;
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0x6864b3dc, Offset: 0x4390
// Size: 0xde
function private function_6266f448( stash )
{
    self notify( "6dcb0aa0e1be50d9" );
    self endon( "6dcb0aa0e1be50d9" );
    self endon( #"disconnect", #"death", #"entering_last_stand", #"hash_2781407e327b42ee" );
    
    while ( true )
    {
        waitresult = self waittill( #"menuresponse" );
        
        if ( waitresult.menu == "MultiItemPickup" && waitresult.response == "multi_item_menu_closed" )
        {
            break;
        }
    }
    
    self notify( #"hash_2781407e327b42ee" );
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0x187518b2, Offset: 0x4478
// Size: 0x1fe
function private function_d87c50ae( stash )
{
    self notify( "4bd96bb741326417" );
    self endon( "4bd96bb741326417" );
    self endon( #"disconnect", #"death", #"entering_last_stand", #"hash_2781407e327b42ee" );
    
    while ( true )
    {
        waitframe( 1 );
        
        if ( !isdefined( self.groupitems ) )
        {
            break;
        }
        
        if ( self.groupitems.size == 0 )
        {
            break;
        }
        
        var_9f69a4d3 = 0;
        
        foreach ( item in self.groupitems )
        {
            if ( isdefined( item ) && self item_world_util::can_pick_up( item ) )
            {
                var_9f69a4d3 = 1;
                break;
            }
        }
        
        if ( !var_9f69a4d3 )
        {
            break;
        }
        
        if ( self isfiring() || self playerads() > 0.3 || self ismeleeing() )
        {
            break;
        }
        
        if ( isdefined( stash ) && isdefined( stash.lootlocker ) && stash.lootlocker && !function_8bac489c( stash, self ) )
        {
            break;
        }
    }
    
    self notify( #"hash_2781407e327b42ee" );
}

// Namespace item_world/item_world
// Params 2, eflags: 0x4
// Checksum 0x4021b23a, Offset: 0x4680
// Size: 0x8a
function private function_937ea9e( identifier, handler )
{
    assert( isdefined( level.var_66383953 ), "<dev string:x77>" );
    assert( !isdefined( level.var_66383953[ identifier ] ), "<dev string:xcd>" + identifier );
    level.var_66383953[ identifier ] = handler;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x4
// Checksum 0xc8d1955c, Offset: 0x4718
// Size: 0xaa
function private function_ba96cdf( player )
{
    if ( isdefined( level.var_ab396c31 ) && level.var_ab396c31 )
    {
        return;
    }
    
    function_1b11e73c();
    
    if ( isplayer( player ) )
    {
        var_fee74908 = player function_e6ea1ee0();
        
        if ( isdefined( player ) )
        {
            player function_45ecbbc5( var_fee74908 );
            player.var_d7a70ae4 = 1;
        }
    }
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0x3d7913b2, Offset: 0x47d0
// Size: 0x254
function private function_116fd9a7()
{
    level.var_66383953 = [];
    function_937ea9e( #"hash_9ed0c30684ca35a", &function_d045e83b );
    function_937ea9e( #"generic_armor_pickup", &function_2e5b5858 );
    function_937ea9e( #"hash_3bfb97e39d67e5f9", &function_cb9b4dd7 );
    function_937ea9e( #"hash_788c59214ead02af", &function_14b2eddf );
    function_937ea9e( #"hash_6247ea34d3b1ddb6", &function_42ffe9b2 );
    function_937ea9e( #"hash_2cbf15cbb314c93e", &function_2eebeff5 );
    function_937ea9e( #"hash_51b30f6e7331e136", &function_349d4c26 );
    function_937ea9e( #"hash_2b4dff2e0db72d06", &function_670cce3f );
    function_937ea9e( #"generic_pickup", &function_41a52251 );
    function_937ea9e( #"hash_5c844f5c1207159c", &function_2b2e9302 );
    function_937ea9e( #"hash_31380667bf69d3a0", &function_a240798a );
    function_937ea9e( #"hash_50375e5de228e9fc", &function_a712496a );
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0xec7ad41a, Offset: 0x4a30
// Size: 0x12, Type: bool
function private function_76915220()
{
    return level.var_703d32de > 0;
}

// Namespace item_world/item_world
// Params 0
// Checksum 0x52031e5, Offset: 0x4a50
// Size: 0x1b6
function function_248022d9()
{
    level.var_37a4536d = [];
    
    if ( !isdefined( level.var_75dc9c49 ) )
    {
        level.var_75dc9c49 = 0;
    }
    
    resetflag = level flagsys::get( #"item_world_reset" );
    
    while ( true )
    {
        var_5610ded4 = level flagsys::get( #"item_world_reset" );
        
        if ( var_5610ded4 != resetflag )
        {
            level.var_37a4536d = [];
        }
        
        if ( level.var_75dc9c49 > 0 )
        {
            time = gettime();
            
            for ( index = 0; index < level.var_37a4536d.size ; index++ )
            {
                respawnitem = level.var_37a4536d[ index ];
                
                if ( time - respawnitem.hidetime >= level.var_75dc9c49 )
                {
                    function_54ca5536( respawnitem.id, 0 );
                    function_bfc28859( 3, respawnitem.id, var_5610ded4, 1 );
                    level.var_37a4536d[ index ] = undefined;
                    continue;
                }
                
                break;
            }
            
            arrayremovevalue( level.var_37a4536d, undefined, 0 );
        }
        
        resetflag = var_5610ded4;
        waitframe( 1 );
    }
}

// Namespace item_world/item_world
// Params 2
// Checksum 0x51537bc8, Offset: 0x4c10
// Size: 0x964
function function_a54d07e6( item, activator )
{
    assert( isdefined( item ) );
    
    if ( isdefined( item ) && ( isdefined( item.targetname ) || isdefined( item.targetnamehash ) ) )
    {
        targetname = isdefined( item.targetname ) ? item.targetname : item.targetnamehash;
        stashes = level.var_93d08989[ targetname ];
        
        if ( isdefined( stashes ) && stashes.size > 0 )
        {
            stashes = arraysortclosest( stashes, item.origin, 1, 0, 12 );
            
            if ( stashes.size <= 0 )
            {
                return;
            }
            
            state = function_ffdbe8c2( stashes[ 0 ] );
            
            if ( state == 0 )
            {
                function_b516210b( isdefined( stashes[ 0 ].var_15d44120 ) ? stashes[ 0 ].var_15d44120 : stashes[ 0 ].model, stashes[ 0 ].origin, activator );
                setdynentstate( stashes[ 0 ], 1 );
                params = { #activator:activator, #state:state };
                stashes[ 0 ] callback::callback( #"on_stash_open", params );
            }
            else if ( state == 1 )
            {
                stashitems = function_91b29d2a( targetname );
                stashitems = arraysortclosest( stashitems, stashes[ 0 ].origin, stashitems.size, 0, 12 );
                
                foreach ( stashitem in stashitems )
                {
                    if ( isdefined( stashitem.itementry ) && stashitem.hidetime === -1 )
                    {
                        return;
                    }
                }
                
                dynamicitems = [];
                
                foreach ( itemspawndrop in level.item_spawn_drops )
                {
                    if ( isdefined( itemspawndrop ) && itemspawndrop.targetnamehash === targetname )
                    {
                        dynamicitems[ dynamicitems.size ] = itemspawndrop;
                    }
                }
                
                dynamicitems = arraysortclosest( dynamicitems, stashes[ 0 ].origin, dynamicitems.size, 0, 12 );
                
                foreach ( dynamicitem in dynamicitems )
                {
                    if ( dynamicitem.hidetime === -1 )
                    {
                        return;
                    }
                }
                
                if ( isdefined( stashes[ 0 ].lootlocker ) && stashes[ 0 ].lootlocker && activator !== level )
                {
                    function_35c26e09( stashes[ 0 ] );
                    setdynentstate( stashes[ 0 ], 0 );
                    return;
                }
                
                setdynentstate( stashes[ 0 ], 2 );
                stashes[ 0 ] notify( #"hash_4c78fc894646853d" );
            }
        }
        
        if ( !isstring( targetname ) )
        {
            return;
        }
        
        stashes = getentarray( targetname, "targetname" );
        
        if ( stashes.size > 0 )
        {
            stashes = arraysortclosest( stashes, item.origin, 1, 0, 12 );
            
            if ( stashes.size <= 0 )
            {
                return;
            }
            
            stash = stashes[ 0 ];
            
            if ( stash.var_bad13452 == 0 )
            {
                function_b516210b( stash.model, stash.origin, activator );
                params = { #activator:activator, #state:state };
                stash callback::callback( #"on_stash_open", params );
                
                if ( isdefined( stash.var_a76e4941 ) && stash.var_a76e4941 )
                {
                    stash animscripted( "death_stash_open", stash.origin, stash.angles, "p8_fxanim_wz_death_stash_used_anim", "normal", "root", 1, 0 );
                }
                else if ( isdefined( stash.var_a64ed253 ) && stash.var_a64ed253 )
                {
                    stash animscripted( "supply_drop_open", stash.origin, stash.angles, "p8_fxanim_wz_supply_stash_04_open_anim", "normal", "root", 1, 0 );
                }
                
                stash.var_bad13452 = 1;
                return;
            }
            
            if ( stash.var_bad13452 == 1 )
            {
                dynamicitems = [];
                
                foreach ( itemspawndrop in level.item_spawn_drops )
                {
                    if ( isdefined( itemspawndrop ) && itemspawndrop.targetnamehash === targetname )
                    {
                        dynamicitems[ dynamicitems.size ] = itemspawndrop;
                    }
                }
                
                dynamicitems = arraysortclosest( dynamicitems, stashes[ 0 ].origin, dynamicitems.size, 0, 12 );
                
                foreach ( dynamicitem in dynamicitems )
                {
                    if ( dynamicitem.hidetime === -1 )
                    {
                        return;
                    }
                }
                
                if ( isdefined( stash.var_a76e4941 ) && stash.var_a76e4941 )
                {
                    stash animscripted( "death_stash_empty", stash.origin, stash.angles, "p8_fxanim_wz_death_stash_empty_anim", "normal", "root", 1, 0 );
                }
                else if ( isdefined( stash.var_a64ed253 ) && stash.var_a64ed253 )
                {
                    stash animscripted( "supply_drop_empty", stash.origin, stash.angles, "p8_fxanim_wz_supply_stash_04_used_anim", "normal", "root", 1, 0 );
                }
                
                stash.var_bad13452 = 2;
                stash clientfield::set( "dynamic_stash", 2 );
            }
        }
    }
}

// Namespace item_world/item_world
// Params 2, eflags: 0x4
// Checksum 0xb30412b8, Offset: 0x5580
// Size: 0xfee
function private function_7c84312d( origin, angles )
{
    assert( isplayer( self ) );
    
    if ( !isdefined( self.inventory ) )
    {
        return;
    }
    
    usetrigger = self.var_19caeeea;
    
    if ( !isdefined( usetrigger ) )
    {
        return;
    }
    
    if ( isdefined( self.disableitempickup ) && self.disableitempickup )
    {
        return;
    }
    
    var_512ddf16 = self clientfield::get_player_uimodel( "hudItems.multiItemPickup.status" ) == 2;
    forward = vectornormalize( anglestoforward( angles ) );
    maxdist = util::function_16fb0a3b();
    
    if ( var_512ddf16 )
    {
        maxdist = 128;
    }
    
    var_f4b807cb = function_2e3efdda( origin, forward, 128, maxdist, 0 );
    var_9b882d22 = undefined;
    
    if ( var_512ddf16 && isdefined( self.var_d7abc784 ) )
    {
        var_75f6d739 = anglestoforward( ( 0, angles[ 1 ], 0 ) );
        
        for ( itemindex = 0; itemindex < var_f4b807cb.size ; itemindex++ )
        {
            itemdef = var_f4b807cb[ itemindex ];
            toitem = itemdef.origin - origin;
            
            if ( itemdef.hidetime !== -1 )
            {
                continue;
            }
            
            var_1777205e = vectordot( var_75f6d739, vectornormalize( ( toitem[ 0 ], toitem[ 1 ], 0 ) ) );
            
            if ( var_1777205e >= 0.5 && distancesquared( itemdef.origin, self.var_d7abc784 ) <= 12 * 12 )
            {
                if ( item_world_util::function_2eb2c17c( origin, itemdef ) )
                {
                    var_9b882d22 = itemdef;
                    break;
                }
                
                break;
            }
        }
    }
    
    if ( !isdefined( var_9b882d22 ) )
    {
        var_4bd72bfe = self.var_c1ea9cae;
        var_9b882d22 = item_world_util::function_6061a15( var_f4b807cb, maxdist, origin, angles, forward, var_4bd72bfe );
    }
    
    if ( self inlaststand() )
    {
        var_9b882d22 = undefined;
    }
    
    var_caafaa25 = #"";
    
    if ( isdefined( var_9b882d22 ) && !self isinvehicle() )
    {
        self.groupitems = [];
        hasbackpack = self item_inventory::has_backpack();
        stashitem = var_9b882d22.hidetime === -1;
        canstack = !stashitem && item_inventory::function_550fcb41( var_9b882d22 );
        var_f4b42fba = self item_inventory::has_armor() && var_9b882d22.itementry.itemtype == #"armor";
        isammo = var_9b882d22.itementry.itemtype == #"ammo";
        var_de41d336 = !hasbackpack && var_9b882d22.itementry.itemtype == #"backpack";
        
        if ( stashitem || !isammo && !var_de41d336 && !canstack && !var_f4b42fba )
        {
            var_433d429 = 14;
            self.groupitems = function_2e3efdda( var_9b882d22.origin, undefined, 128, var_433d429 );
            self.groupitems = self array::filter( self.groupitems, 0, &item_world_util::can_pick_up );
        }
        
        if ( self.groupitems.size == 1 )
        {
            stashitem = self.groupitems[ 0 ].hidetime === -1;
        }
        
        var_b46724f6 = 0;
        
        if ( isdefined( self.var_d5673d87 ) && ( isdefined( var_9b882d22.targetname ) || isdefined( var_9b882d22.targetnamehash ) ) )
        {
            if ( isdefined( self.var_d5673d87.targetname ) || isdefined( self.var_d5673d87.targetnamehash ) )
            {
                var_45602f41 = isdefined( var_9b882d22.targetname ) ? var_9b882d22.targetname : var_9b882d22.targetnamehash;
                var_d2daaa1a = isdefined( self.var_d5673d87.targetname ) ? self.var_d5673d87.targetname : self.var_d5673d87.targetnamehash;
                var_b46724f6 = var_45602f41 != var_d2daaa1a;
            }
        }
        
        if ( stashitem )
        {
            usetrigger setcursorhint( "HINT_NOICON" );
            usetrigger sethintstring( #"" );
            usetrigger function_89fca53b( 1 );
            usetrigger function_49462027( 0 );
            stash = item_world_util::function_31f5aa51( var_9b882d22 );
            var_e30063d2 = isdefined( stash ) && isdefined( stash.lootlocker ) && stash.lootlocker;
            currentstate = self clientfield::get_player_uimodel( "hudItems.multiItemPickup.status" );
            
            if ( currentstate != 2 || currentstate == 2 && var_b46724f6 )
            {
                if ( distancesquared( origin, var_9b882d22.origin ) > 128 * 128 )
                {
                    self clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 0 );
                }
                else if ( var_e30063d2 && !function_8bac489c( stash, self ) )
                {
                    if ( self item_inventory::function_471897e2() )
                    {
                        self clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 3 );
                    }
                    else
                    {
                        self clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 4 );
                    }
                }
                else
                {
                    self clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 1 );
                }
            }
        }
        else
        {
            usetrigger function_89fca53b( 0 );
            usetrigger function_49462027( 1, 1 | 16 | 8388608 | 65536 | 4194304 );
            self clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 0 );
            itementry = var_9b882d22.itementry;
            
            if ( isdefined( itementry.weapon ) && itementry.weapon != level.weaponnone )
            {
                if ( itementry.itemtype != #"ammo" )
                {
                    usetrigger setcursorhint( "HINT_WEAPON_3D", item_inventory_util::function_2b83d3ff( var_9b882d22 ) );
                    var_caafaa25 = #"";
                    
                    if ( isdefined( itementry.weapon ) )
                    {
                        var_caafaa25 = itementry.weapon.displayname;
                    }
                    else
                    {
                        var_caafaa25 = isdefined( itementry.hintstring ) ? itementry.hintstring : #"weapon/pickupnewweapon";
                    }
                    
                    usetrigger sethintstring( var_caafaa25 );
                }
                else
                {
                    usetrigger setcursorhint( "HINT_3D" );
                    var_caafaa25 = isdefined( itementry.hintstring ) ? itementry.hintstring : #"";
                    usetrigger sethintstring( var_caafaa25 );
                }
            }
            else
            {
                usetrigger setcursorhint( "HINT_3D" );
                var_caafaa25 = isdefined( itementry.hintstring ) ? itementry.hintstring : #"";
                usetrigger sethintstring( var_caafaa25 );
            }
        }
        
        usetrigger.itemstruct = var_9b882d22;
        usetrigger.origin = var_9b882d22.origin + ( 0, 0, 4 );
        usetrigger.angles = ( 0, 0, 0 );
        usetrigger triggerenable( 1 );
        function_dae4ab9b( usetrigger, self.var_207c9892 );
        
        if ( !( isdefined( var_9b882d22.var_5d97fed1 ) && var_9b882d22.var_5d97fed1 ) )
        {
            self clientfield::set_player_uimodel( "hudItems.pickupHintGold", var_9b882d22.itementry.rarity == #"epic" );
        }
        
        if ( !( isdefined( var_9b882d22.var_5d97fed1 ) && var_9b882d22.var_5d97fed1 ) && !var_512ddf16 )
        {
            if ( var_9b882d22.itementry.itemtype == #"ammo" )
            {
                if ( !item_inventory::can_pickup_ammo( var_9b882d22 ) )
                {
                    function_dae4ab9b( usetrigger, getdvarint( #"hash_3ec4f617fad5b87c", 150 ) / 1000 );
                }
            }
            else if ( !isdefined( item_inventory::function_e66dcff5( var_9b882d22 ) ) )
            {
                function_dae4ab9b( usetrigger, getdvarint( #"hash_3ec4f617fad5b87c", 150 ) / 1000 );
            }
        }
        
        self.var_d5673d87 = var_9b882d22;
        
        if ( isdefined( self.var_d5673d87 ) )
        {
            self.var_d7abc784 = self.var_d5673d87.origin;
        }
        else
        {
            self.var_d7abc784 = undefined;
        }
    }
    else
    {
        self clientfield::set_player_uimodel( "hudItems.multiItemPickup.status", 0 );
        self clientfield::set_player_uimodel( "hudItems.pickupHintGold", 0 );
        usetrigger.itemstruct = undefined;
        usetrigger triggerenable( 0 );
        self.groupitems = undefined;
    }
    
    self.var_bb8abe86 = forward;
    self.var_1609622c = origin;
    self.var_34b00d0d = level.var_703d32de;
    self.var_cc586562 = undefined;
    self.var_bf3cabc9 = undefined;
    eyepos = self getplayercamerapos();
    
    if ( isdefined( var_9b882d22 ) && isdefined( var_9b882d22.var_5d97fed1 ) && var_9b882d22.var_5d97fed1 )
    {
        var_caafaa25 = #"wz/supply_stash";
        var_1ba7b9c8 = arraysortclosest( level.var_5ce07338, var_9b882d22.origin, 1, 0, 12 );
        
        if ( var_1ba7b9c8.size > 0 && isdefined( var_1ba7b9c8[ 0 ].displayname ) )
        {
            var_caafaa25 = var_1ba7b9c8[ 0 ].displayname;
        }
        
        var_c36bd68a = arraysortclosest( level.var_ace9fb52, var_9b882d22.origin, 1, 0, 12 );
        
        if ( var_c36bd68a.size > 0 )
        {
            var_caafaa25 = #"wz/death_stash";
        }
        else
        {
            var_6594679a = arraysortclosest( level.item_supply_drops, var_9b882d22.origin, 1, 0, 12 );
            
            if ( var_6594679a.size > 0 )
            {
                var_caafaa25 = #"wz/supply_drop";
            }
        }
    }
    else if ( !isdefined( var_9b882d22 ) || distance2dsquared( var_9b882d22.origin, eyepos ) > 128 * 128 )
    {
        angles = self getplayerangles();
        self.var_bf3cabc9 = item_world_util::function_6af455de( 0, eyepos, angles );
        hintstring = item_world_util::function_c62ad9a7( self.var_bf3cabc9 );
        
        if ( hintstring != #"" )
        {
            var_caafaa25 = hintstring;
        }
    }
    
    self.var_cc586562 = var_caafaa25;
}

// Namespace item_world/item_world
// Params 2
// Checksum 0x9cd625df, Offset: 0x6578
// Size: 0x196
function function_c8ab2022( item, var_cdf8c0d1 = 0 )
{
    if ( !isdefined( item ) )
    {
        return 0;
    }
    
    itementry = item.itementry;
    itemcount = item.count;
    
    if ( itementry.itemtype == #"cash" )
    {
        if ( var_cdf8c0d1 && !( isdefined( itementry.stackable ) && itementry.stackable ) )
        {
            return 1;
        }
        
        return ( isdefined( item.count ) ? item.count : 1 );
    }
    
    if ( !isdefined( itemcount ) )
    {
        itemcount = isdefined( itementry.amount ) ? itementry.amount : 1;
        
        if ( itementry.itemtype == #"weapon" )
        {
            itemcount = 1;
        }
    }
    
    if ( var_cdf8c0d1 && !( isdefined( itementry.stackable ) && itementry.stackable ) && ( isdefined( itementry.amount ) ? itementry.amount : 1 ) == 1 )
    {
        itemcount = 1;
    }
    
    return itemcount;
}

// Namespace item_world/item_world
// Params 1
// Checksum 0x770370cd, Offset: 0x6718
// Size: 0x3b4
function consume_item( item )
{
    if ( isdefined( level.var_ab396c31 ) && level.var_ab396c31 )
    {
        return;
    }
    
    if ( isentity( item ) )
    {
        item.hidetime = gettime();
        
        if ( isdefined( item.var_d783088e ) )
        {
            foreach ( sensordart in item.var_d783088e )
            {
                if ( !isdefined( sensordart ) )
                {
                    continue;
                }
                
                sensordart thread sensor_dart::function_4db10465();
            }
            
            item.var_d783088e = undefined;
        }
    }
    else
    {
        if ( isdefined( item ) )
        {
            function_54ca5536( item.id, gettime() );
            
            if ( isdefined( item.itementry ) && isdefined( item.itementry.wallbuyitem ) && item.itementry.wallbuyitem )
            {
                respawnitem = spawnstruct();
                respawnitem.id = item.id;
                respawnitem.hidetime = gettime();
                level.var_37a4536d[ level.var_37a4536d.size ] = respawnitem;
            }
            
            if ( level flagsys::get( #"item_world_reset" ) )
            {
                function_bfc28859( 2, item.id );
            }
            else
            {
                function_bfc28859( 1, item.id );
            }
            
            if ( isdefined( level.var_5b2a8d88 ) && isdefined( level.var_5b2a8d88[ item.id ] ) )
            {
                level.var_5b2a8d88[ item.id ] = 0;
            }
        }
        
        level.var_703d32de++;
    }
    
    if ( isdefined( item ) )
    {
        function_a54d07e6( item, self );
    }
    
    if ( isentity( item ) )
    {
        item clientfield::set( "dynamic_item_drop", 2 );
        item setitemindex( 32767 );
        item ghost();
        util::wait_network_frame( 2 );
        
        if ( !isdefined( item ) )
        {
            return;
        }
        
        if ( isdefined( item.var_38af96b9 ) )
        {
            var_38af96b9 = item.var_38af96b9;
            var_38af96b9 stopsounds();
            util::wait_network_frame( 1 );
            
            if ( isdefined( var_38af96b9 ) )
            {
                var_38af96b9 delete();
            }
        }
        
        if ( !isdefined( item ) )
        {
            return;
        }
        
        item delete();
    }
}

// Namespace item_world/item_world
// Params 0
// Checksum 0x37063829, Offset: 0x6ad8
// Size: 0x94
function function_df82b00c()
{
    if ( !isplayer( self ) )
    {
        assert( 0 );
        return;
    }
    
    if ( isdefined( self.var_19caeeea ) )
    {
        self.var_19caeeea triggerenable( 0 );
    }
    
    self.disableitempickup = 1;
    self.var_d5673d87 = undefined;
    self clientfield::set_to_player( "disableItemPickup", 1 );
}

// Namespace item_world/item_world
// Params 1
// Checksum 0x89c75e48, Offset: 0x6b78
// Size: 0xb4
function function_528ca826( networkid )
{
    if ( item_world_util::function_d9648161( networkid ) )
    {
        if ( item_world_util::function_2c7fc531( networkid ) )
        {
            return function_b1702735( networkid );
        }
        
        if ( item_world_util::function_da09de95( networkid ) )
        {
            if ( isdefined( level.item_spawn_drops[ networkid ] ) )
            {
                return level.item_spawn_drops[ networkid ];
            }
            
            return;
        }
        
        assert( 0, "<dev string:x108>" );
    }
}

// Namespace item_world/item_world
// Params 6
// Checksum 0x8f49b5ae, Offset: 0x6c38
// Size: 0x142
function function_2e3efdda( origin, dir, maxitems, maxdistance, dot, var_bc1582aa = 1 )
{
    maxitems = isdefined( maxitems ) ? int( min( maxitems, 4000 ) ) : maxitems;
    var_f4b807cb = function_abaeb170( origin, dir, maxitems, maxdistance, dot, var_bc1582aa, -2147483647 );
    var_6665e24 = arraysortclosest( level.item_spawn_drops, origin, maxitems, 0, maxdistance );
    var_f4b807cb = arraycombine( var_f4b807cb, var_6665e24, 1, 0 );
    var_f4b807cb = arraysortclosest( var_f4b807cb, origin, maxitems, 0, maxdistance );
    return var_f4b807cb;
}

// Namespace item_world/item_world
// Params 3
// Checksum 0x473717a2, Offset: 0x6d88
// Size: 0x48c
function function_de2018e3( item, player, slotid = undefined )
{
    if ( !isdefined( item ) )
    {
        return 0;
    }
    
    itementry = item.itementry;
    
    if ( isdefined( itementry.handler ) )
    {
        handlerfunc = level.var_66383953[ itementry.handler ];
        
        if ( isdefined( handlerfunc ) )
        {
            var_aec6fa7f = item.amount;
            
            if ( !isdefined( var_aec6fa7f ) || item.amount == 0 )
            {
                if ( itementry.itemtype == #"ammo" )
                {
                }
                else if ( itementry.itemtype == #"weapon" )
                {
                    if ( !isdefined( item.amount ) )
                    {
                        weapon = item_world_util::function_35e06774( itementry );
                        var_aec6fa7f = itementry.amount;
                        
                        if ( isdefined( weapon ) )
                        {
                            var_aec6fa7f = itementry.amount * weapon.clipsize;
                        }
                    }
                }
                else if ( itementry.itemtype == #"armor" )
                {
                    var_aec6fa7f = itementry.amount;
                }
                else if ( itementry.itemtype == #"equipment" )
                {
                    if ( isentity( item ) )
                    {
                        var_aec6fa7f = item.ammo;
                    }
                    
                    if ( !isdefined( var_aec6fa7f ) )
                    {
                        var_aec6fa7f = 0;
                    }
                }
                else
                {
                    var_aec6fa7f = 0;
                }
            }
            
            var_d72b1a4b = function_c8ab2022( item, 0 );
            var_8cd447d8 = function_c8ab2022( item, 1 );
            profilestart();
            var_c5781c22 = player [[ handlerfunc ]]( item, player, item.networkid, item.id, var_8cd447d8, var_aec6fa7f, slotid );
            profilestop();
            var_c5781c22 += var_d72b1a4b - var_8cd447d8;
            assert( isint( var_c5781c22 ) && var_c5781c22 >= 0 );
            
            if ( itementry.itemtype == #"ammo" && var_d72b1a4b === var_c5781c22 )
            {
            }
            else if ( var_c5781c22 == var_d72b1a4b )
            {
            }
            else
            {
                if ( isdefined( player ) )
                {
                    player gestures::function_56e00fbf( "gestable_grab", undefined, 0 );
                }
                
                if ( isdefined( item ) )
                {
                    if ( itementry.itemtype == #"ammo" )
                    {
                        item.amount = var_c5781c22;
                    }
                    else
                    {
                        item.count = var_c5781c22;
                    }
                    
                    if ( isentity( item ) )
                    {
                        item clientfield::set( "dynamic_item_drop_count", int( max( item.count, item.amount ) ) );
                    }
                }
            }
            
            if ( var_c5781c22 != var_d72b1a4b )
            {
                var_fceba0ce = { #item:item, #count:var_8cd447d8, #player:player };
                self callback::callback( #"on_item_pickup", var_fceba0ce );
            }
            
            return var_c5781c22;
        }
    }
    
    assertmsg( "<dev string:x139>" + itementry.name + "<dev string:x166>" );
}

// Namespace item_world/item_world
// Params 3
// Checksum 0x63169074, Offset: 0x7220
// Size: 0x4b4
function pickup_item( item, var_22be503 = 1, var_26a492bc = 0 )
{
    assert( isplayer( self ) );
    
    if ( !isdefined( self.inventory ) )
    {
        return 0;
    }
    
    if ( !item_world_util::can_pick_up( item ) )
    {
        return 0;
    }
    
    if ( isdefined( self.is_reviving_any ) && self.is_reviving_any || isdefined( self.var_5c574004 ) && self.var_5c574004 )
    {
        return 0;
    }
    
    if ( isdefined( item.hidefromteam ) && item.hidefromteam == self.team )
    {
        if ( !isdefined( item.var_6e788302 ) || item.var_6e788302 !== self getentitynumber() )
        {
            self playsoundtoplayer( #"uin_unavailable_charging", self );
            return 0;
        }
    }
    
    self dynent_world::function_7f2040e8();
    
    if ( var_22be503 )
    {
        var_fa3df96 = self item_inventory::function_e66dcff5( item, var_26a492bc );
    }
    
    if ( isdefined( var_fa3df96 ) )
    {
        success = self function_83ddce0f( item, var_fa3df96 );
        return success;
    }
    else if ( item.itementry.itemtype != #"weapon" )
    {
        var_d72b1a4b = function_c8ab2022( item, 0 );
        var_8cd447d8 = function_c8ab2022( item, 1 );
        remainingitems = function_de2018e3( item, self );
        remainingitems += var_d72b1a4b - var_8cd447d8;
        
        if ( remainingitems == 0 )
        {
            if ( item.itementry.itemtype != #"armor" )
            {
                if ( isdefined( item ) && isdefined( item.itementry ) )
                {
                    function_1a46c8ae( self, undefined, undefined, item.itementry, item.itementry.amount );
                }
            }
            
            consume_item( item );
            return 1;
        }
        else if ( remainingitems < var_8cd447d8 && !isentity( item ) && item.itementry.itemtype != #"ammo" )
        {
            stashitem = item.hidetime === -1;
            stashitem &= ~( isdefined( item.deathstash ) ? item.deathstash : 0 );
            dropitem = self item_drop::drop_item( item.itementry.weapon, remainingitems, item.amount, item.id, item.origin, item.angles, stashitem, undefined, isdefined( item.targetnamehash ) ? item.targetnamehash : item.targetname, undefined, undefined, 0 );
            
            if ( isdefined( dropitem ) )
            {
                dropitem.origin = item.origin;
                dropitem.angles = item.angles;
                consume_item( item );
            }
            
            return 1;
        }
    }
    
    return 0;
}

// Namespace item_world/item_world
// Params 1
// Checksum 0x2a48906b, Offset: 0x76e0
// Size: 0x146, Type: bool
function function_8e0d14c1( var_4b0875ec = 0 )
{
    assert( isplayer( self ) );
    usetrigger = self.var_19caeeea;
    
    if ( !isdefined( usetrigger ) )
    {
        return false;
    }
    
    if ( !isdefined( usetrigger.itemstruct ) )
    {
        return false;
    }
    
    if ( var_4b0875ec && usetrigger.itemstruct.hidetime === -1 )
    {
        return false;
    }
    
    origin = self getplayercamerapos();
    
    if ( distance2dsquared( usetrigger.itemstruct.origin, origin ) > 128 * 128 )
    {
        return false;
    }
    
    if ( abs( usetrigger.itemstruct.origin[ 2 ] - origin[ 2 ] ) > 128 )
    {
        return false;
    }
    
    return true;
}

// Namespace item_world/item_world
// Params 5
// Checksum 0x63ac5e40, Offset: 0x7830
// Size: 0x23c
function function_1a46c8ae( player, var_a1ca235e, var_3d1f9df4, var_7089b458, var_381f3b39 )
{
    if ( game.state == "pregame" || !isdefined( var_a1ca235e ) && !isdefined( var_7089b458 ) )
    {
        return;
    }
    
    data = { #game_time:function_f8d53445(), #player_xuid:isdefined( player ) ? int( player getxuid( 1 ) ) : 0, #dropped_item:isdefined( var_a1ca235e ) ? hash( var_a1ca235e.name ) : 0, #var_5b8ff5e9:isdefined( var_3d1f9df4 ) ? var_3d1f9df4 : 0, #var_6789038:isdefined( var_7089b458 ) ? hash( var_7089b458.name ) : 0, #var_d1f97c0f:isdefined( var_381f3b39 ) ? var_381f3b39 : 0 };
    
    /#
        if ( isdefined( var_a1ca235e ) )
        {
            println( "<dev string:x16a>" + var_a1ca235e.name + "<dev string:x176>" + ( isdefined( var_3d1f9df4 ) ? var_3d1f9df4 : 0 ) );
        }
        
        if ( isdefined( var_7089b458 ) )
        {
            println( "<dev string:x17a>" + var_7089b458.name + "<dev string:x176>" + ( isdefined( var_381f3b39 ) ? var_381f3b39 : 0 ) );
        }
    #/
    
    function_92d1707f( #"hash_1ed3b4af49015043", data );
}

// Namespace item_world/item_world
// Params 2
// Checksum 0xe9e29f0, Offset: 0x7a78
// Size: 0x508, Type: bool
function function_83ddce0f( item, inventoryslot )
{
    var_a1ca235e = undefined;
    var_3d1f9df4 = 0;
    var_8acbe1d0 = self item_inventory::function_550fcb41( item ) || item.itementry.itemtype == #"armor_shard" || item.itementry.itemtype == #"resource" || item.itementry.itemtype == #"ammo" || item.itementry.itemtype == #"backpack" && !self item_inventory::has_backpack();
    stashitem = item.hidetime === -1;
    deathstashitem = isdefined( item.deathstash ) ? item.deathstash : 0;
    stashitem &= ~deathstashitem;
    dropitem = undefined;
    
    if ( !var_8acbe1d0 && self item_inventory::has_inventory_item( inventoryslot ) )
    {
        var_69944179 = self.inventory.items[ inventoryslot ];
        var_a1ca235e = var_69944179.itementry;
        var_3d1f9df4 = var_a1ca235e.amount;
        dropitem = self item_inventory::drop_inventory_item( var_69944179.networkid, 0, item.origin, undefined, 0 );
        
        if ( !isdefined( dropitem ) )
        {
            return false;
        }
        
        waitframe( 1 );
    }
    
    if ( isdefined( item ) && !isentity( item ) && isdefined( item.id ) )
    {
        item = function_b1702735( item.id );
    }
    
    if ( !isdefined( item ) || !item_world_util::can_pick_up( item ) )
    {
        if ( isdefined( dropitem ) && isdefined( item ) && isdefined( item.itementry ) && item.itementry.itemtype == #"backpack" )
        {
            item_inventory::function_ec238da8();
        }
        
        return false;
    }
    
    remainingitems = function_de2018e3( item, self, inventoryslot );
    
    if ( remainingitems == 0 )
    {
        if ( isdefined( item ) && isdefined( item.itementry ) )
        {
            function_1a46c8ae( self, var_a1ca235e, var_3d1f9df4, item.itementry, item.itementry.amount );
            
            if ( item.itementry.itemtype == #"backpack" )
            {
                item_inventory::function_ec238da8();
            }
        }
        
        consume_item( item );
    }
    else if ( !isentity( item ) && item.itementry.itemtype != #"ammo" )
    {
        dropitem = self item_drop::drop_item( item.itementry.weapon, item.count, item.amount, item.id, item.origin, item.angles, 0, undefined, isdefined( item.targetnamehash ) ? item.targetnamehash : item.targetname, undefined, undefined, 0 );
        
        if ( isdefined( dropitem ) )
        {
            dropitem.origin = item.origin;
            dropitem.angles = item.angles;
            consume_item( item );
        }
    }
    
    return true;
}

// Namespace item_world/item_world
// Params 1
// Checksum 0xc51c0f4d, Offset: 0x7f88
// Size: 0x1fc
function function_8eee98dd( supplystash )
{
    level flagsys::wait_till( #"hash_507a4486c4a79f1d" );
    function_4de3ca98();
    assert( isdefined( supplystash ) );
    
    if ( !isdefined( supplystash ) || !isdefined( supplystash.targetname ) )
    {
        return;
    }
    
    targetname = isdefined( supplystash.targetname ) ? supplystash.targetname : supplystash.target;
    var_76c7cb8a = function_91b29d2a( targetname );
    
    foreach ( item in var_76c7cb8a )
    {
        if ( !isdefined( item.itementry ) )
        {
            continue;
        }
        
        if ( distancesquared( item.origin, supplystash.origin ) > 36 )
        {
            continue;
        }
        
        function_54ca5536( item.id, -1 );
        resetitem = level flagsys::get( #"item_world_reset" );
        function_bfc28859( 3, item.id, resetitem );
    }
    
    setdynentstate( supplystash, 0 );
}

// Namespace item_world/item_world
// Params 1
// Checksum 0xbf2c80b6, Offset: 0x8190
// Size: 0x304
function function_160294c7( supplystash )
{
    level flagsys::wait_till( #"hash_507a4486c4a79f1d" );
    function_4de3ca98();
    assert( isdefined( supplystash ) );
    
    if ( !isdefined( supplystash ) || !isdefined( supplystash.targetname ) )
    {
        return;
    }
    
    targetname = isdefined( supplystash.targetname ) ? supplystash.targetname : supplystash.target;
    var_76c7cb8a = function_91b29d2a( targetname );
    
    foreach ( item in var_76c7cb8a )
    {
        if ( distancesquared( item.origin, supplystash.origin ) > 36 )
        {
            continue;
        }
        
        if ( item_world_util::can_pick_up( item ) )
        {
            consume_item( item );
        }
    }
    
    consumeitems = [];
    
    foreach ( item in level.item_spawn_drops )
    {
        if ( !isdefined( item ) )
        {
            continue;
        }
        
        var_45602f41 = isdefined( item.targetname ) ? item.targetname : item.targetnamehash;
        
        if ( !isdefined( var_45602f41 ) )
        {
            continue;
        }
        
        if ( var_45602f41 == targetname )
        {
            if ( item_world_util::can_pick_up( item ) )
            {
                consumeitems[ consumeitems.size ] = item;
            }
        }
    }
    
    foreach ( item in consumeitems )
    {
        if ( isdefined( item ) )
        {
            consume_item( item );
        }
    }
    
    setdynentstate( supplystash, 3 );
}

// Namespace item_world/item_world
// Params 0
// Checksum 0x40e8bb37, Offset: 0x84a0
// Size: 0xf6
function function_eb0c9b9c()
{
    players = getplayers();
    var_7bba6210 = 1;
    
    while ( var_7bba6210 )
    {
        waitframe( 1 );
        var_7bba6210 = 0;
        
        foreach ( player in players )
        {
            if ( isdefined( player ) && isalive( player ) && isdefined( player.var_7bba6210 ) && player.var_7bba6210 )
            {
                var_7bba6210 = 1;
                break;
            }
        }
    }
}

// Namespace item_world/item_world
// Params 0
// Checksum 0x9117bcd3, Offset: 0x85a0
// Size: 0x186
function reset_item_world()
{
    level.var_703d32de = 0;
    level.var_ab396c31 = 1;
    util::wait_network_frame( 1 );
    assert( level.var_703d32de == 0 );
    players = getplayers();
    
    for ( index = 0; index < players.size ; index++ )
    {
        player = players[ index ];
        
        if ( isalive( player ) )
        {
            player thread item_inventory::reset_inventory();
        }
        
        if ( ( index + 1 ) % 3 == 0 )
        {
            waitframe( 1 );
        }
    }
    
    function_eb0c9b9c();
    assert( level.var_703d32de == 0 );
    function_f7fb8a17( 1 );
    util::wait_network_frame( 1 );
    assert( level.var_703d32de == 0 );
    level.var_ab396c31 = undefined;
}

// Namespace item_world/item_world
// Params 1
// Checksum 0xe2759302, Offset: 0x8730
// Size: 0x5e
function function_cbc32e1b( milliseconds )
{
    assert( isint( milliseconds ) );
    
    if ( isint( milliseconds ) )
    {
        level.var_75dc9c49 = milliseconds;
    }
}

// Namespace item_world/item_world
// Params 0
// Checksum 0xaf656e6e, Offset: 0x8798
// Size: 0x8a, Type: bool
function function_1b11e73c()
{
    reset = isdefined( level flagsys::get( #"item_world_reset" ) );
    level flagsys::wait_till( #"item_world_initialized" );
    
    if ( reset != isdefined( level flagsys::get( #"item_world_reset" ) ) )
    {
        return false;
    }
    
    return true;
}

// Namespace item_world/item_world
// Params 0
// Checksum 0xc6a215de, Offset: 0x8830
// Size: 0x84
function function_4de3ca98()
{
    level flagsys::wait_till( #"item_world_initialized" );
    level flagsys::wait_till( #"item_world_reset" );
    
    while ( isdefined( level.var_ab396c31 ) && level.var_ab396c31 )
    {
        waitframe( 1 );
    }
    
    util::wait_network_frame( 1 );
}

/#

    // Namespace item_world/item_world
    // Params 0
    // Checksum 0x10fa85b5, Offset: 0x88c0
    // Size: 0x1a8, Type: dev
    function function_76eb9bd7()
    {
        function_1b11e73c();
        
        if ( !isdefined( self ) || !isplayer( self ) || !isalive( self ) )
        {
            return;
        }
        
        while ( isdefined( self ) && !isdefined( self.inventory ) )
        {
            waitframe( 1 );
        }
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        inventorystr = getdvarstring( #"hash_7b2be9e03d9785f3", "<dev string:x184>" );
        tokens = strtok( inventorystr, "<dev string:x187>" );
        
        foreach ( token in tokens )
        {
            item = function_4ba8fde( token );
            
            if ( isdefined( item ) )
            {
                var_fa3df96 = self item_inventory::function_e66dcff5( item );
                self function_de2018e3( item, self, var_fa3df96 );
            }
        }
    }

#/
