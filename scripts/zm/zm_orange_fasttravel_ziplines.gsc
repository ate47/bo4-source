#using scripts\abilities\ability_util;
#using scripts\core_common\animation_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\ai\zm_ai_zipline;
#using scripts\zm\equip\zm_equip_music_box;
#using scripts\zm\zm_orange_pablo;
#using scripts\zm\zm_orange_util;
#using scripts\zm\zm_orange_zones;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_bgb_pack;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_fasttravel_ziplines;

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x2ecdc85a, Offset: 0x408
// Size: 0xa4
function init()
{
    init_flags();
    clientfield::register( "scriptmover", "clone_control", 24000, 1, "int" );
    clientfield::register( "toplayer", "hide_player_legs", 24000, 1, "int" );
    clientfield::register( "toplayer", "blur_post_fx", 24000, 1, "int" );
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0xd711b1d, Offset: 0x4b8
// Size: 0xaa
function init_flags()
{
    level flag::init( #"hash_7d9f8ec3cb9af87e" );
    level flag::init( #"hash_7d230fa8f283c105" );
    level flag::init( #"hash_7def3e555eba842c" );
    level flag::init( #"hash_e29d662bb90e4bc" );
    level.enemy_location_override_func = &function_9305812e;
    level.var_c680e01c = [];
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x88685034, Offset: 0x570
// Size: 0xfc
function main()
{
    zm_items::function_4d230236( getweapon( #"zitem_orange_zipline_crank_part_1" ), &function_13febd4b );
    zm_items::function_4d230236( getweapon( #"zitem_orange_zipline_crank_part_2" ), &function_13febd4b );
    callback::on_connect( &on_player_connect );
    level.var_4a04c327 = array( "facility_front", "facility_back", "lighthouse_to_facility" );
    function_53b616a4();
    function_4dc96e66();
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x6bc1a252, Offset: 0x678
// Size: 0x1b8
function function_53b616a4()
{
    level.var_1537d233 = 0;
    level.var_1b737b93 = 0;
    level.a_s_zipline_cranks = struct::get_array( "s_zipline_crank", "targetname" );
    
    foreach ( s_zipline_crank in level.a_s_zipline_cranks )
    {
        s_zipline_crank.var_2e77da49 = 0;
        s_zipline_crank.var_68a09be4 = 0;
        s_zipline_crank.e_crank = getent( s_zipline_crank.var_c299d92a, "targetname" );
        s_zipline_crank.e_crank hide();
        s_zipline_crank.var_f316eff6 = getnode( s_zipline_crank.var_2da0be6c, "targetname" );
        unlinktraversal( s_zipline_crank.var_f316eff6 );
        s_zipline_crank function_6eb4fb79();
        s_zipline_crank zm_unitrigger::create( &function_29c3aabf, 64 );
        s_zipline_crank thread function_2713a96a();
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0xcb465278, Offset: 0x838
// Size: 0xce
function function_6eb4fb79()
{
    s_zipline_use = struct::get( self.var_68ae361b, "targetname" );
    s_zipline_use.var_508d5a11 = struct::get_array( s_zipline_use.var_10582773, "targetname" );
    s_zipline_use thread function_220a8687();
    s_zipline_use zm_unitrigger::create( &function_e82679f8, 85 );
    s_zipline_use thread function_d41f7e0e();
    s_zipline_use.s_zipline_crank = self;
    self.s_zipline_use = s_zipline_use;
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0xe6e86102, Offset: 0x910
// Size: 0x110
function function_4dc96e66()
{
    level.a_s_zipline_use = struct::get_array( "s_zipline_use" );
    
    foreach ( s_zipline_use in level.a_s_zipline_use )
    {
        s_zipline_use.var_508d5a11 = struct::get_array( s_zipline_use.var_10582773, "targetname" );
        s_zipline_use thread function_220a8687();
        s_zipline_use zm_unitrigger::create( &function_e82679f8, 85 );
        s_zipline_use thread function_d41f7e0e();
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 2
// Checksum 0x2da6e1ce, Offset: 0xa28
// Size: 0x112
function function_13febd4b( e_holder, w_item )
{
    switch ( w_item.name )
    {
        case #"zitem_orange_zipline_crank_part_1":
            level.var_1537d233++;
            level flag::set( #"hash_7d230fa8f283c105" );
            level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_crank_1", 1 );
            self playsound( #"hash_3ec95ad193e1c377" );
            break;
        case #"zitem_orange_zipline_crank_part_2":
            level.var_1537d233++;
            level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_crank_2", 1 );
            self playsound( #"hash_3ec95ad193e1c377" );
            break;
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x6be0c8a1, Offset: 0xb48
// Size: 0x1a
function on_player_connect()
{
    self.var_7b2ac934 = 0;
    self.var_bf8dfaf4 = 0;
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 1
// Checksum 0x8a34363a, Offset: 0xb70
// Size: 0x14a
function function_29c3aabf( e_player )
{
    s_zipline_crank = self.stub.related_parent;
    
    if ( isdefined( s_zipline_crank.var_2e77da49 ) && s_zipline_crank.var_2e77da49 )
    {
        if ( function_8b1a219a() )
        {
            self sethintstring( #"hash_1c728bc5a555de5b" );
            return 1;
        }
        else
        {
            self sethintstring( #"hash_3d93f7957f6855e5" );
            return 1;
        }
        
        return;
    }
    
    if ( level.var_1537d233 <= 0 )
    {
        self sethintstring( #"hash_63c5fccb2c10781b" );
        return 1;
    }
    
    if ( function_8b1a219a() )
    {
        self sethintstring( #"hash_2e2afc1b8f8fa0eb" );
        return 1;
    }
    
    self sethintstring( #"hash_46db6b04cc24e375" );
    return 1;
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x7bce28fd, Offset: 0xcc8
// Size: 0x1d2
function function_2713a96a()
{
    level endon( #"end_game" );
    self endon( #"hash_762e0e4561d25aeb" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( level.var_1537d233 > 0 )
        {
            self.e_crank show();
            playsoundatposition( #"hash_264544adc5386596", self.origin );
            
            if ( level flag::get( #"hash_7d230fa8f283c105" ) )
            {
                level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_crank_1", 0 );
                level flag::clear( #"hash_7d230fa8f283c105" );
            }
            else
            {
                level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_crank_2", 0 );
            }
            
            self.var_2e77da49 = 1;
            level.var_1b737b93++;
            level.var_1537d233--;
            
            if ( level.var_1b737b93 === 1 )
            {
                e_who thread zm_orange_util::function_51b752a9( #"hash_34b136597d3788ee" );
            }
            
            self thread function_665b4fa6();
            self notify( #"hash_762e0e4561d25aeb" );
        }
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x767df1ab, Offset: 0xea8
// Size: 0x2bc
function function_665b4fa6()
{
    level endon( #"end_game" );
    self endon( #"hash_6c3e5c135959d4ec" );
    self.var_191e6b71 = 5;
    
    if ( self.var_68ae361b == "s_zipline_use_aft_to_beach" )
    {
        self.var_3bc09679 = struct::get( "scene_zipline_aft", "targetname" );
    }
    else if ( self.var_68ae361b == "s_zipline_use_lighthouse_to_fore" )
    {
        self.var_3bc09679 = struct::get( "scene_zipline_fore", "targetname" );
    }
    
    self.var_3bc09679.play_queue = 0;
    var_ba7236d5 = 0;
    self.var_3bc09679 thread function_e76a1a06();
    
    while ( true )
    {
        s_activation = self waittill( #"trigger_activated" );
        e_who = s_activation.e_who;
        b_using = 1;
        
        while ( b_using )
        {
            b_using = 1;
            
            if ( !e_who usebuttonpressed() || !zm_utility::can_use( e_who ) || !isdefined( self.s_unitrigger ) || !isdefined( self.s_unitrigger.trigger ) || !e_who istouching( self.s_unitrigger.trigger ) )
            {
                b_using = 0;
                break;
            }
            
            if ( b_using )
            {
                self.e_crank rotateroll( -36, 0.1 );
                wait 0.1;
                playsoundatposition( #"hash_12cbe85436ddc720", self.origin );
                self.var_191e6b71 -= 0.1;
                var_ba7236d5++;
                
                if ( var_ba7236d5 % 5 == 0 )
                {
                    self.var_3bc09679.play_queue++;
                }
            }
            
            if ( self.var_191e6b71 <= 0 )
            {
                self function_ca1cdeca();
            }
        }
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x62e32ce, Offset: 0x1170
// Size: 0x8a
function function_e76a1a06()
{
    self endon( #"death" );
    var_efc198c = 0;
    
    while ( var_efc198c < 10 )
    {
        if ( self.play_queue > 0 )
        {
            while ( self.play_queue > 0 )
            {
                self scene::play( "move_down_" + var_efc198c );
                var_efc198c++;
                self.play_queue--;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x65b574ff, Offset: 0x1208
// Size: 0x34
function function_3238e183()
{
    self.var_c7ba375d rotatepitch( 1.17647 * -1, 0.1 );
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x546ad514, Offset: 0x1248
// Size: 0x14e
function function_ca1cdeca()
{
    linktraversal( self.var_f316eff6 );
    
    if ( self.str_location === "aft_to_beach" )
    {
        level flag::set( #"hash_7def3e555eba842c" );
        
        if ( level flag::get( #"hash_e29d662bb90e4bc" ) )
        {
            level thread function_95d14d08();
            level notify( #"hash_7231d0fc88083e2d" );
        }
    }
    else
    {
        level flag::set( #"hash_e29d662bb90e4bc" );
        
        if ( level flag::get( #"hash_7def3e555eba842c" ) )
        {
            level thread function_95d14d08();
            level notify( #"hash_7231d0fc88083e2d" );
        }
    }
    
    self.var_68a09be4 = 1;
    self zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
    self notify( #"hash_6c3e5c135959d4ec" );
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 2
// Checksum 0xf142a24a, Offset: 0x13a0
// Size: 0x5c
function function_9305812e( ai, target )
{
    result = undefined;
    
    if ( isdefined( target ) && isdefined( target.active_zipline ) )
    {
        result = level.var_c680e01c[ target.active_zipline ];
    }
    
    return result;
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x86a4817a, Offset: 0x1408
// Size: 0x5c
function function_95d14d08()
{
    zm_orange_pablo::function_3f9e02b8( 3, #"hash_3b3927bba2231a49", #"hash_52bf94e8309adfd7", &function_7ee05d66 );
    zm_orange_pablo::function_d83490c5( 3 );
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x4345f50e, Offset: 0x1470
// Size: 0x84
function function_7ee05d66()
{
    level flag::set( #"hash_7d9f8ec3cb9af87e" );
    level flag::set( #"facility_available" );
    level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_phase_num", 1 );
    level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_handle", 1 );
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x40448e7, Offset: 0x1500
// Size: 0x4a
function function_220a8687()
{
    level endon( #"end_game" );
    self.var_58f28f90 = 0;
    zm_zonemgr::zone_wait_till_enabled( self.str_destination );
    self.var_58f28f90 = 1;
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 1
// Checksum 0x95c46a08, Offset: 0x1558
// Size: 0x3da
function function_e82679f8( e_player )
{
    s_zipline_use = self.stub.related_parent;
    
    if ( level flag::get( #"hell_on_earth" ) && s_zipline_use.str_location !== "lighthouse_to_facility" )
    {
        self sethintstring( #"hash_2940c8be9ff1b294" );
        return 1;
    }
    
    if ( s_zipline_use.str_location === "aft_to_beach" )
    {
        if ( !level flag::get( #"hash_7def3e555eba842c" ) )
        {
            self sethintstring( #"hash_376f1740578b8a2e" );
            return 1;
        }
    }
    else if ( s_zipline_use.str_location === "lighthouse_to_fore" )
    {
        if ( !level flag::get( #"hash_e29d662bb90e4bc" ) )
        {
            self sethintstring( #"hash_376f1740578b8a2e" );
            return 1;
        }
    }
    
    if ( s_zipline_use.str_location === "station_to_sun_deck" || s_zipline_use.str_location === "dock" || s_zipline_use.str_location === "fore" || s_zipline_use.str_location === "lighthouse_to_facility" )
    {
        if ( !level flag::get( #"hash_7d9f8ec3cb9af87e" ) )
        {
            self sethintstring( #"hash_57d47aca62536932" );
            return 1;
        }
    }
    
    if ( !s_zipline_use.var_58f28f90 )
    {
        self sethintstring( #"hash_3d7f4136a3c462c8" );
        return 1;
    }
    
    if ( isdefined( e_player.var_7b2ac934 ) && e_player.var_7b2ac934 )
    {
        self sethintstring( #"hash_44fe179e1e8f80ad" );
        return 1;
    }
    
    if ( e_player.var_bf8dfaf4 || level flag::get( "fasttravel_disabled" ) && !isinarray( level.var_4a04c327, s_zipline_use.str_location ) || e_player util::is_ads() || e_player.var_7dc2d507 === 1 )
    {
        return 0;
    }
    
    if ( function_8b1a219a() )
    {
        zone = zm_orange_zones::function_ab7f70b9( undefined, s_zipline_use.str_destination );
        self sethintstring( #"hash_1c90be4081261de3", zone );
        return 1;
    }
    
    zone = zm_orange_zones::function_ab7f70b9( undefined, s_zipline_use.str_destination );
    self sethintstring( #"hash_498ce6b1275c33fd", zone );
    return 1;
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x9079362a, Offset: 0x1940
// Size: 0x2a8
function function_d41f7e0e()
{
    level endon( #"end_game" );
    
    while ( true )
    {
        s_activation = self waittill( #"trigger_activated" );
        e_who = s_activation.e_who;
        
        if ( e_who.var_bf8dfaf4 )
        {
            continue;
        }
        
        if ( e_who.var_7b2ac934 )
        {
            continue;
        }
        
        if ( level flag::get( "fasttravel_disabled" ) && !isinarray( level.var_4a04c327, self.str_location ) )
        {
            continue;
        }
        
        if ( !self.var_58f28f90 )
        {
            continue;
        }
        
        if ( e_who isreloading() || e_who util::is_ads() )
        {
            continue;
        }
        
        if ( level flag::get( #"hell_on_earth" ) && self.str_location !== "lighthouse_to_facility" )
        {
            continue;
        }
        
        switch ( self.str_location )
        {
            case #"aft_to_beach":
                if ( !level flag::get( #"hash_7def3e555eba842c" ) )
                {
                    continue;
                }
                else
                {
                    break;
                }
            case #"lighthouse_to_fore":
                if ( !level flag::get( #"hash_e29d662bb90e4bc" ) )
                {
                    continue;
                }
                else
                {
                    break;
                }
            case #"station_to_sun_deck":
                if ( !level flag::get( #"hash_7d9f8ec3cb9af87e" ) )
                {
                    continue;
                }
                else
                {
                    break;
                }
            case #"dock":
            case #"lighthouse_to_facility":
            case #"fore":
                if ( !level flag::get( #"hash_7d9f8ec3cb9af87e" ) )
                {
                    continue;
                }
                else
                {
                    break;
                }
                
                break;
        }
        
        e_who thread function_5dbd6a40( self );
        wait 0.5;
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 1
// Checksum 0xbf6134af, Offset: 0x1bf0
// Size: 0xb04
function function_5dbd6a40( s_zipline_use )
{
    self endon( #"death" );
    self.var_bf8dfaf4 = 1;
    self util::magic_bullet_shield();
    self zm_audio::create_and_play_dialog( #"zipline", #"activate" );
    current_weapon = self getcurrentweapon();
    var_478a6888 = array( #"zhield_riot_turret", #"zhield_riot_dw", #"launcher_standard_t8", #"launcher_standard_t8_upgraded" );
    
    if ( isinarray( var_478a6888, current_weapon.name ) || current_weapon.isheroweapon )
    {
        self.var_479965f7 = undefined;
        self notify( #"hero_weapon_power_off" );
        swap_weapon = undefined;
        primaryweapons = self getweaponslistprimaries();
        
        foreach ( primaryweapon in primaryweapons )
        {
            if ( !isinarray( var_478a6888, primaryweapon.name ) )
            {
                swap_weapon = primaryweapon;
                break;
            }
        }
        
        if ( isdefined( swap_weapon ) )
        {
            self zm_weapons::switch_back_primary_weapon( swap_weapon, 1, 0 );
        }
        else
        {
            self val::set( #"hash_dcfa1d5e7f80cba", "disable_weapons", 1 );
        }
        
        wait 1;
    }
    
    vnd_start = getvehiclenode( s_zipline_use.target, "targetname" );
    self.var_b20b0960 = spawner::simple_spawn_single( getent( "veh_fasttravel", "targetname" ) );
    
    while ( !isdefined( self.var_b20b0960 ) )
    {
        waitframe( 1 );
    }
    
    self.var_b20b0960.origin = vnd_start.origin;
    self.var_b20b0960.angles = self.angles;
    self.var_b20b0960 setspeed( 32 );
    self notify( #"hash_702a9c7f10066b19", { #str_location:s_zipline_use.str_location } );
    level notify( #"zipline_used", { #str_location:s_zipline_use.str_location } );
    self playrumbleonentity( #"jump_rumble_start" );
    self function_fc9707f4( vnd_start, s_zipline_use );
    m_player_fake = util::spawn_player_clone( self );
    m_player_fake linkto( self.var_b20b0960, "tag_origin" );
    current_weapon = self getcurrentweapon();
    
    if ( isdefined( current_weapon.name ) && current_weapon.name != #"none" )
    {
        m_weapon_fake = util::spawn_model( current_weapon.worldmodel, m_player_fake gettagorigin( "tag_weapon_right" ), m_player_fake gettagangles( "tag_weapon_right" ) );
        m_weapon_fake linkto( m_player_fake, "tag_weapon_right" );
        m_weapon_fake setowner( self );
        m_weapon_fake clientfield::set( "clone_control", 1 );
    }
    
    m_player_fake clientfield::set( "clone_control", 1 );
    self ghost();
    m_player_fake thread animation::play( "pb_t8_zipline_idle", self.var_b20b0960, "tag_origin", 1, 0.2, 0.2, 0, 0, 0, 0 );
    self.var_b20b0960 thread vehicle::get_on_and_go_path( vnd_start );
    self playrumblelooponentity( #"buzz_high" );
    
    /#
        m_player_fake.var_b20b0960 = self.var_b20b0960;
        line_start = struct::get( vnd_start.target + "<dev string:x38>", "<dev string:x41>" );
        line_end = struct::get( vnd_start.target + "<dev string:x55>", "<dev string:x41>" );
        
        if ( isdefined( line_start ) && isdefined( line_end ) )
        {
            m_player_fake thread zm_ai_zipline::function_dc61ccae( vnd_start, line_start.origin, line_end.origin );
        }
        else
        {
            m_player_fake thread zm_ai_zipline::function_dc61ccae( vnd_start );
        }
    #/
    
    var_1737c0cf = self thread gestures::function_56e00fbf( "gestable_zipline" );
    self thread function_a949ddac();
    self playsound( #"evt_zipline_start" );
    self.var_b20b0960 playloopsound( #"hash_19ebbf7f8bd1d5a5" );
    self clientfield::set_to_player( "blur_post_fx", 1 );
    self.var_b20b0960 waittill( #"reached_end_node" );
    self stoprumble( #"buzz_high" );
    self clientfield::set_to_player( "blur_post_fx", 0 );
    self notify( #"hash_3726f5b254bceb00" );
    self stopgestureviewmodel();
    self function_994538a5( s_zipline_use );
    self val::reset( #"hash_dcfa1d5e7f80cba", "disable_weapons" );
    m_player_fake clientfield::set( "clone_control", 0 );
    
    if ( isdefined( m_weapon_fake ) )
    {
        m_weapon_fake clientfield::set( "clone_control", 0 );
        m_weapon_fake delete();
    }
    
    self show();
    m_player_fake hide();
    util::wait_network_frame();
    m_player_fake delete();
    self clientfield::set_to_player( "hide_player_legs", 0 );
    self playsound( #"hash_4a546c35bc290781" );
    
    if ( isdefined( self.var_b20b0960 ) )
    {
        self.var_b20b0960 delete();
    }
    
    while ( self zm_utility::is_jumping() )
    {
        waitframe( 1 );
    }
    
    var_63259c33 = 0;
    players = getplayers();
    
    foreach ( player in players )
    {
        if ( self == player || abs( self.origin[ 2 ] - player.origin[ 2 ] ) > 60 )
        {
            continue;
        }
        
        distance_2d = distance2d( self.origin, player.origin );
        
        if ( distance_2d <= 30 )
        {
            var_63259c33 = 1;
            break;
        }
    }
    
    if ( var_63259c33 )
    {
        s_landing_point = self thread zm_fasttravel::function_d4fbc062( s_zipline_use.var_508d5a11 );
        self dontinterpolate();
        self setorigin( s_landing_point.origin );
    }
    
    self playrumbleonentity( "jump_rumble_end" );
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 2
// Checksum 0xb30184e2, Offset: 0x2700
// Size: 0x41c
function function_fc9707f4( vnd_start, s_zipline_use )
{
    self endon( #"disconnect" );
    self.active_zipline = s_zipline_use.str_location;
    self thread function_b9addb5e( self.active_zipline );
    
    if ( self isusingoffhand() )
    {
        self forceoffhandend();
    }
    
    self disableoffhandspecial();
    self disableoffhandweapons();
    w_current = self getcurrentweapon();
    
    if ( zm_loadout::is_placeable_mine( w_current ) || zm_equipment::is_equipment( w_current ) || ability_util::is_weapon_gadget( w_current ) || ability_util::is_hero_weapon( w_current ) )
    {
        var_2e07b8ff = self getweaponslistprimaries();
        
        if ( isdefined( var_2e07b8ff ) && var_2e07b8ff.size > 0 )
        {
            self switchtoweapon( var_2e07b8ff[ 0 ] );
            
            for ( var_5a7831c4 = 0; !var_5a7831c4 ; var_5a7831c4 = 1 )
            {
                waitframe( 1 );
                w_current = self getcurrentweapon();
                
                if ( w_current == var_2e07b8ff[ 0 ] )
                {
                }
            }
        }
    }
    
    self.var_f22c83f5 = 1;
    self.var_e75517b1 = 1;
    self bgb::suspend_weapon_cycling();
    self disableweaponcycling();
    self bgb_pack::function_ac9cb612( 1 );
    self.bgb_disabled = 1;
    self clientfield::set_to_player( "hide_player_legs", 1 );
    self allowsprint( 0 );
    self allowcrouch( 0 );
    self allowprone( 0 );
    self allowmelee( 0 );
    self allowads( 0 );
    
    if ( !self laststand::player_is_in_laststand() )
    {
        str_stance = self getstance();
        
        switch ( str_stance )
        {
            case #"crouch":
                self setstance( "stand" );
                wait 0.2;
                break;
            case #"prone":
                self setstance( "stand" );
                wait 1;
                break;
        }
    }
    
    self playerlinktodelta( self.var_b20b0960, "tag_origin", 0.5, 180, 180, 180, 180 );
    self setorigin( vnd_start.origin );
    self setplayerangles( vnd_start.angles );
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0, eflags: 0x4
// Checksum 0xdfb9795d, Offset: 0x2b28
// Size: 0x158
function private function_85a2c43b()
{
    self.var_b20b0960 endon( #"death" );
    
    while ( true )
    {
        waitframe( 1 );
        player_velocity = self getvelocity();
        player_forward = anglestoforward( self.angles ) * ( 0, 1, 0 );
        velocity = self.var_b20b0960 getvelocity();
        speed = length( velocity );
        speed *= 0.0568182;
        
        /#
            print3d( self.origin + player_forward * 100 + ( 0, 0, 60 ), "<dev string:x5c>" + speed, ( 1, 0, 0 ), 1, 1, 1 );
            record3dtext( "<dev string:x5c>" + speed, self.origin, ( 1, 0, 0 ), "<dev string:x5f>" );
        #/
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 1
// Checksum 0x5231a653, Offset: 0x2c88
// Size: 0x76
function function_b9addb5e( zipline )
{
    self endon( #"death" );
    s_destination = struct::get( zipline + "_destination", "targetname" );
    level.var_c680e01c[ zipline ] = s_destination.origin;
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0x17ccfff5, Offset: 0x2d08
// Size: 0x12a
function function_a949ddac()
{
    self endon( #"disconnect" );
    self.var_b20b0960 endon( #"reached_end_node" );
    wait 0.5;
    
    while ( true )
    {
        foreach ( ai in getaiteamarray( level.zombie_team ) )
        {
            if ( distancesquared( self.origin, ai.origin ) < 324 )
            {
                if ( music_box::function_3adb94b4( ai ) )
                {
                    ai zm_cleanup::function_23621259();
                    ai kill();
                }
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 1
// Checksum 0xa12e457a, Offset: 0x2e40
// Size: 0x174
function function_994538a5( s_zipline_use )
{
    self endon( #"disconnect" );
    self.active_zipline = undefined;
    self.var_bf8dfaf4 = 0;
    self.var_f22c83f5 = 0;
    self.var_e75517b1 = 0;
    self bgb_pack::function_ac9cb612( 0 );
    self.bgb_disabled = 0;
    self bgb::resume_weapon_cycling();
    self enableweaponcycling();
    self util::stop_magic_bullet_shield();
    self enableoffhandspecial();
    self enableoffhandweapons();
    self allowsprint( 1 );
    self allowcrouch( 1 );
    self allowprone( 1 );
    self allowmelee( 1 );
    self allowads( 1 );
    self thread function_a393b77f();
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0
// Checksum 0xd50cf625, Offset: 0x2fc0
// Size: 0x36
function function_a393b77f()
{
    self endon( #"disconnect" );
    self.var_7b2ac934 = 1;
    wait 10;
    self.var_7b2ac934 = 0;
}

/#

    // Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
    // Params 0
    // Checksum 0x5b66bca0, Offset: 0x3000
    // Size: 0x2cc, Type: dev
    function function_80a9077f()
    {
        foreach ( s_zipline_crank in level.a_s_zipline_cranks )
        {
            if ( !isdefined( s_zipline_crank.var_2e77da49 || !s_zipline_crank.var_2e77da49 ) )
            {
                s_zipline_crank.e_crank show();
                s_zipline_crank.var_2e77da49 = 1;
                level.var_1b737b93++;
                s_zipline_crank notify( #"hash_762e0e4561d25aeb" );
                s_zipline_crank zm_unitrigger::unregister_unitrigger( s_zipline_crank.s_unitrigger );
            }
            
            if ( !isdefined( s_zipline_crank.var_68a09be4 ) || !s_zipline_crank.var_68a09be4 )
            {
                if ( s_zipline_crank.str_location === "<dev string:x68>" )
                {
                    level flag::set( #"hash_7def3e555eba842c" );
                }
                else
                {
                    level flag::set( #"hash_e29d662bb90e4bc" );
                }
                
                if ( s_zipline_crank.var_68ae361b == "<dev string:x77>" )
                {
                    s_zipline_crank.var_3bc09679 = struct::get( "<dev string:x94>", "<dev string:xa8>" );
                }
                else if ( s_zipline_crank.var_68ae361b == "<dev string:xb5>" )
                {
                    s_zipline_crank.var_3bc09679 = struct::get( "<dev string:xd8>", "<dev string:xa8>" );
                }
                
                s_zipline_crank.var_3bc09679 scene::play( "<dev string:xed>" );
                linktraversal( s_zipline_crank.var_f316eff6 );
                s_zipline_crank.var_68a09be4 = 1;
                s_zipline_crank notify( #"hash_6c3e5c135959d4ec" );
            }
        }
        
        if ( !level flag::get( #"hash_7d9f8ec3cb9af87e" ) )
        {
            level flag::set( #"hash_7d9f8ec3cb9af87e" );
            level flag::set( #"facility_available" );
        }
    }

#/
