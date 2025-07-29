#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_pablo;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_mq_soapstone;

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0x5e0b7277, Offset: 0x2b8
// Size: 0xb4
function preload()
{
    level flag::init( #"hash_710c2f40baf302c8" );
    level flag::init( #"hash_3a8a317fc0b5e5b0" );
    level flag::init( #"hash_57d2cbf7d6c2035a" );
    level flag::init( #"hash_238e5c8b416f855" );
    clientfield::register( "scriptmover", "soapstone_start_fx", 24000, 2, "int" );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0xbc561b96, Offset: 0x378
// Size: 0x1c
function main()
{
    level scene_test_with_reachs();
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0xd28bd8c0, Offset: 0x3a0
// Size: 0x3a4
function scene_test_with_reachs()
{
    getent( "mama_bear", "targetname" ) hide();
    getent( "papa_bear", "targetname" ) hide();
    e_stone = getent( "electro", "targetname" );
    e_stone hide();
    var_28f1732d = getent( e_stone.target, "targetname" );
    var_28f1732d hide();
    level.var_6b37a126 = struct::get( e_stone.script_noteworthy, "targetname" );
    level.var_6b37a126.e_stone = e_stone;
    level.var_6b37a126.var_28f1732d = var_28f1732d;
    level.var_9369090c = [];
    
    foreach ( e_stone in getentarray( "disco", "targetname" ) )
    {
        e_stone hide();
        var_28f1732d = getent( e_stone.target, "targetname" );
        var_28f1732d hide();
        var_1ca0c514 = struct::get( e_stone.script_noteworthy, "targetname" );
        var_1ca0c514.e_stone = e_stone;
        var_1ca0c514.var_28f1732d = var_28f1732d;
        
        if ( !isdefined( level.var_9369090c ) )
        {
            level.var_9369090c = [];
        }
        else if ( !isarray( level.var_9369090c ) )
        {
            level.var_9369090c = array( level.var_9369090c );
        }
        
        level.var_9369090c[ level.var_9369090c.size ] = var_1ca0c514;
    }
    
    level.s_soapstone = struct::get( "baby_bear", "targetname" );
    level.s_soapstone.is_hot = 1;
    level.s_soapstone.is_charged = 0;
    level.s_soapstone.e_stone = undefined;
    level.s_soapstone.var_e15f0d15 = 0;
    level.s_soapstone.var_b6e5b65f = 2;
    level.s_soapstone.var_d143df71 = 0;
    level function_88a86ef8( 3 );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 1
// Checksum 0x3e37d855, Offset: 0x750
// Size: 0x24c
function function_d878e1ee( var_a276c861 )
{
    zm_ui_inventory::function_7df6bb60( #"zm_orange_objective_progress", 4 );
    
    if ( !var_a276c861 )
    {
        zm_orange_pablo::function_3f9e02b8( 7, #"hash_3a5a3e5c65b49526", #"hash_f90cca21dd0dd02", &function_a9c8883f );
        waitframe( 1 );
        zm_orange_pablo::function_d83490c5( 7 );
        level flag::wait_till( #"hash_710c2f40baf302c8" );
        level thread function_1c744b3f();
        e_stone = getent( "papa_bear", "targetname" );
        e_stone.s_unitrigger = e_stone zm_unitrigger::create( "", 96 );
        e_stone.is_placed = 0;
        e_stone thread function_9961d00();
        level thread function_557d25c1();
        e_stone = getent( "mama_bear", "targetname" );
        e_stone.s_unitrigger = e_stone zm_unitrigger::create( "", 96 );
        e_stone.is_placed = 0;
        e_stone thread function_9961d00();
        level flag::wait_till( #"hash_3a8a317fc0b5e5b0" );
        e_fuse = getent( "porridge", "targetname" );
        e_fuse.s_unitrigger = e_fuse zm_unitrigger::create( "", 96 );
        e_fuse function_afa2f621();
    }
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0x515d7a56, Offset: 0x9a8
// Size: 0x24
function function_a9c8883f()
{
    level flag::set( #"hash_710c2f40baf302c8" );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0xe52d6cc6, Offset: 0x9d8
// Size: 0x8c
function function_afa2f621()
{
    s_activation = self waittill( #"trigger_activated" );
    self playsound( #"hash_95a3e7ee778d597" );
    self hide();
    s_activation.e_who zm_orange_util::function_51b752a9( "vox_fuse_get" );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 1
// Checksum 0x5175528, Offset: 0xa70
// Size: 0x36a
function function_88a86ef8( n_position )
{
    e_dial = getent( "bear_claw", "targetname" );
    
    switch ( n_position )
    {
        case 0:
            if ( level.s_soapstone.var_d143df71 != 0 )
            {
                s_position = struct::get( "bear_digit_0", "targetname" );
                e_dial rotateto( s_position.angles, 1.5, 0.25, 0.25 );
                level.s_soapstone.var_d143df71 = 0;
            }
            
            break;
        case 1:
            if ( level.s_soapstone.var_d143df71 != 1 )
            {
                s_position = struct::get( "bear_digit_1", "targetname" );
                e_dial rotateto( s_position.angles, 1.5, 0.25, 0.25 );
                level.s_soapstone.var_d143df71 = 1;
            }
            
            break;
        case 2:
            if ( level.s_soapstone.var_d143df71 != 2 )
            {
                s_position = struct::get( "bear_digit_2", "targetname" );
                e_dial rotateto( s_position.angles, 1.5, 0.25, 0.25 );
                level.s_soapstone.var_d143df71 = 2;
            }
            
            break;
        case 3:
            if ( level.s_soapstone.var_d143df71 != 3 )
            {
                s_position = struct::get( "bear_digit_3", "targetname" );
                e_dial rotateto( s_position.angles, 1.5, 0.25, 0.25 );
                level.s_soapstone.var_d143df71 = 3;
            }
            
            break;
        case 4:
            if ( level.s_soapstone.var_d143df71 != 4 )
            {
                s_position = struct::get( "bear_digit_4", "targetname" );
                e_dial rotateto( s_position.angles, 1.5, 0.25, 0.25 );
                level.s_soapstone.var_d143df71 = 4;
            }
            
            break;
    }
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0x7fbd134a, Offset: 0xde8
// Size: 0x340
function function_476d4cb5()
{
    level endon( #"soapstone_placed" );
    level endon( #"hash_3a8a317fc0b5e5b0" );
    s_activation = self waittill( #"trigger_activated" );
    
    if ( !level.s_soapstone.is_charged )
    {
        self.e_stone setmodel( "p8_zm_ora_soapstone_01" );
        self.e_stone clientfield::set( "soapstone_start_fx", 0 );
        
        if ( level.s_soapstone.var_b6e5b65f == 2 )
        {
            self.var_28f1732d setmodel( "p8_zm_ora_soapstone_01" );
            self.var_28f1732d clientfield::set( "soapstone_start_fx", 0 );
        }
    }
    else if ( level.s_soapstone.is_hot )
    {
        self.e_stone setmodel( "p8_zm_ora_soapstone_01_hot" );
        self.e_stone clientfield::set( "soapstone_start_fx", 2 );
        
        if ( level.s_soapstone.var_b6e5b65f == 2 )
        {
            self.var_28f1732d setmodel( "p8_zm_ora_soapstone_01_hot" );
            self.var_28f1732d clientfield::set( "soapstone_start_fx", 2 );
        }
    }
    else
    {
        self.e_stone setmodel( "p8_zm_ora_soapstone_01_cold" );
        self.e_stone clientfield::set( "soapstone_start_fx", 1 );
        
        if ( level.s_soapstone.var_b6e5b65f == 2 )
        {
            self.var_28f1732d setmodel( "p8_zm_ora_soapstone_01_cold" );
            self.var_28f1732d clientfield::set( "soapstone_start_fx", 1 );
        }
    }
    
    self.e_stone show();
    self.e_stone playsound( #"hash_16631d7fd4c4e599" );
    
    if ( level.s_soapstone.var_b6e5b65f == 2 )
    {
        self.var_28f1732d show();
    }
    
    level.s_soapstone.s_placement = self;
    self thread function_b4ad839e();
    level notify( #"soapstone_placed" );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0xdce68abf, Offset: 0x1130
// Size: 0x118
function function_b4ad839e()
{
    level endon( #"hash_3a8a317fc0b5e5b0" );
    s_activation = self waittill( #"trigger_activated" );
    self.e_stone clientfield::set( "soapstone_start_fx", 0 );
    self.e_stone playsound( #"hash_5f8cb5b7320b0002" );
    self.e_stone hide();
    
    if ( level.s_soapstone.var_b6e5b65f == 2 )
    {
        self.var_28f1732d clientfield::set( "soapstone_start_fx", 0 );
        self.var_28f1732d hide();
    }
    
    level.s_soapstone.s_placement = undefined;
    level notify( #"soapstone_collected" );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0xaf4085d8, Offset: 0x1250
// Size: 0x1b0
function function_1c744b3f()
{
    level endon( #"hash_3a8a317fc0b5e5b0" );
    
    foreach ( s_soapstone in level.var_9369090c )
    {
        s_soapstone.s_unitrigger = s_soapstone zm_unitrigger::create( "", 128 );
    }
    
    while ( true )
    {
        foreach ( s_soapstone in level.var_9369090c )
        {
            s_soapstone thread function_476d4cb5();
        }
        
        level waittill( #"soapstone_collected" );
    }
    
    foreach ( s_soapstone in level.var_9369090c )
    {
        s_soapstone zm_unitrigger::unregister_unitrigger( s_soapstone.s_unitrigger );
    }
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0x1f094063, Offset: 0x1408
// Size: 0xb4
function function_557d25c1()
{
    level endon( #"hash_3a8a317fc0b5e5b0" );
    level.var_6b37a126.s_unitrigger = level.var_6b37a126 zm_unitrigger::create( "", 128 );
    
    while ( true )
    {
        level.var_6b37a126 thread function_2b438f6f();
        level waittill( #"soapstone_collected" );
    }
    
    level.var_6b37a126 zm_unitrigger::unregister_unitrigger( level.var_6b37a126.s_unitrigger );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0x590ac6ee, Offset: 0x14c8
// Size: 0x350
function function_2b438f6f()
{
    level endon( #"hash_3a8a317fc0b5e5b0" );
    level endon( #"soapstone_placed" );
    s_activation = self waittill( #"trigger_activated" );
    
    if ( !level.s_soapstone.is_charged )
    {
        self.e_stone setmodel( "p8_zm_ora_soapstone_01" );
        self.e_stone clientfield::set( "soapstone_start_fx", 0 );
        
        if ( level.s_soapstone.var_b6e5b65f == 2 )
        {
            self.var_28f1732d setmodel( "p8_zm_ora_soapstone_01" );
            self.var_28f1732d clientfield::set( "soapstone_start_fx", 0 );
        }
    }
    else if ( level.s_soapstone.is_hot )
    {
        self.e_stone setmodel( "p8_zm_ora_soapstone_01_hot" );
        self.e_stone clientfield::set( "soapstone_start_fx", 2 );
        
        if ( level.s_soapstone.var_b6e5b65f == 2 )
        {
            self.var_28f1732d setmodel( "p8_zm_ora_soapstone_01_hot" );
            self.var_28f1732d clientfield::set( "soapstone_start_fx", 2 );
        }
    }
    else
    {
        self.e_stone setmodel( "p8_zm_ora_soapstone_01_cold" );
        self.e_stone clientfield::set( "soapstone_start_fx", 1 );
        
        if ( level.s_soapstone.var_b6e5b65f == 2 )
        {
            self.var_28f1732d setmodel( "p8_zm_ora_soapstone_01_cold" );
            self.var_28f1732d clientfield::set( "soapstone_start_fx", 1 );
        }
    }
    
    self.e_stone show();
    self.e_stone playsound( #"hash_16631d7fd4c4e599" );
    
    if ( level.s_soapstone.var_b6e5b65f == 2 )
    {
        self.var_28f1732d show();
    }
    
    level.s_soapstone.s_placement = self;
    level.s_soapstone.var_e15f0d15 = 0;
    self thread function_a9511f0f();
    level notify( #"soapstone_placed" );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0x23f001f4, Offset: 0x1820
// Size: 0x118
function function_a9511f0f()
{
    level endon( #"hash_3a8a317fc0b5e5b0" );
    s_activation = self waittill( #"trigger_activated" );
    self.e_stone clientfield::set( "soapstone_start_fx", 0 );
    self.e_stone playsound( #"hash_5f8cb5b7320b0002" );
    self.e_stone hide();
    
    if ( level.s_soapstone.var_b6e5b65f == 2 )
    {
        self.var_28f1732d clientfield::set( "soapstone_start_fx", 0 );
        self.var_28f1732d hide();
    }
    
    level.s_soapstone.s_placement = undefined;
    level notify( #"soapstone_collected" );
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0
// Checksum 0x61a494fd, Offset: 0x1940
// Size: 0x54e
function function_9961d00()
{
    level endon( #"hash_3a8a317fc0b5e5b0" );
    
    while ( !self.is_placed )
    {
        s_activation = self waittill( #"trigger_activated" );
        
        switch ( level.s_soapstone.var_d143df71 )
        {
            case 0:
                if ( level.s_soapstone.is_charged && !level.s_soapstone.is_hot )
                {
                    self setmodel( "p8_zm_ora_soapstone_01_cold" );
                    self show();
                    level function_88a86ef8( 2 );
                    self playsound( #"hash_7605be4297c1ed23" );
                    level.s_soapstone.var_b6e5b65f -= 1;
                    self.is_placed = 1;
                    level flag::clear( #"hash_57d2cbf7d6c2035a" );
                    level flag::set( #"hash_3a8a317fc0b5e5b0" );
                }
                else
                {
                    s_activation.e_who zm_orange_util::function_51b752a9( "vox_soap_stones_insert_room_temp", -1, 1, 0 );
                }
                
                break;
            case 3:
                if ( level.s_soapstone.is_charged && !level.s_soapstone.is_hot )
                {
                    self setmodel( "p8_zm_ora_soapstone_01_cold" );
                    self show();
                    level function_88a86ef8( 4 );
                    self playsound( #"hash_7605be4297c1ed23" );
                    level.s_soapstone.var_b6e5b65f -= 1;
                    self.is_placed = 1;
                    level flag::set( #"hash_238e5c8b416f855" );
                }
                else if ( level.s_soapstone.is_charged && level.s_soapstone.is_hot )
                {
                    self setmodel( "p8_zm_ora_soapstone_01_hot" );
                    self show();
                    level function_88a86ef8( 0 );
                    self playsound( #"hash_69b229acb5e3a598" );
                    level.s_soapstone.var_b6e5b65f -= 1;
                    self.is_placed = 1;
                    level flag::set( #"hash_57d2cbf7d6c2035a" );
                }
                else
                {
                    s_activation.e_who zm_orange_util::function_51b752a9( "vox_soap_stones_insert_room_temp", -1, 1, 0 );
                }
                
                break;
            case 4:
                if ( level.s_soapstone.is_charged && level.s_soapstone.is_hot )
                {
                    self setmodel( "p8_zm_ora_soapstone_01_hot" );
                    self show();
                    level function_88a86ef8( 2 );
                    self playsound( #"hash_69b229acb5e3a598" );
                    level.s_soapstone.var_b6e5b65f -= 1;
                    self.is_placed = 1;
                    level flag::clear( #"hash_238e5c8b416f855" );
                    level flag::set( #"hash_3a8a317fc0b5e5b0" );
                }
                else
                {
                    s_activation.e_who zm_orange_util::function_51b752a9( "vox_soap_stones_insert_room_temp", -1, 1, 0 );
                }
                
                break;
        }
    }
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 2
// Checksum 0x60453a4d, Offset: 0x1e98
// Size: 0x24c
function function_9ee4c8c3( var_a276c861, var_19e802fa )
{
    if ( var_a276c861 || var_19e802fa )
    {
        level flag::set( #"hash_3a8a317fc0b5e5b0" );
        getent( "mama_bear", "targetname" ) show();
        getent( "papa_bear", "targetname" ) show();
        e_stone = getent( "electro", "targetname" );
        e_stone hide();
        var_28f1732d = getent( e_stone.target, "targetname" );
        var_28f1732d hide();
        
        foreach ( e_stone in getentarray( "disco", "targetname" ) )
        {
            e_stone hide();
            var_28f1732d = getent( e_stone.target, "targetname" );
            var_28f1732d hide();
        }
        
        level function_88a86ef8( 2 );
        level flag::clear( #"hash_57d2cbf7d6c2035a" );
        level flag::clear( #"hash_238e5c8b416f855" );
    }
}

