#using script_1d29de500c266470;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\infection;
#using scripts\core_common\match_record;
#using scripts\core_common\player\player_free_fall;
#using scripts\core_common\player_insertion;
#using scripts\core_common\spawning_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\mp_common\gametypes\spawning;
#using scripts\wz_common\infection;

#namespace spawn;

// Namespace spawn/spawn
// Params 1
// Checksum 0xd2122efe, Offset: 0x1f8
// Size: 0x1dc
function function_f468d9a5( spawnpoint )
{
    distance = getdvarfloat( #"hash_69b296d9dc607a9a", 4350 );
    height = getdvarfloat( #"hash_73c6222ce96fa34a", 5000 );
    velocity = getdvarfloat( #"hash_ae6b05a24ae0d2a", 1760 );
    dir = anglestoforward( spawnpoint.angles );
    pos = spawnpoint.origin - dir * distance;
    hold_origin = ( pos[ 0 ], pos[ 1 ], spawnpoint.origin[ 2 ] + height );
    hold_angles = vectortoangles( vectornormalize( spawnpoint.origin - pos ) );
    vec = anglestoforward( hold_angles );
    vec = vectornormalize( vec );
    vec *= velocity;
    return { #origin:hold_origin, #angles:hold_angles, #freefall:vec };
}

// Namespace spawn/spawn
// Params 0
// Checksum 0x940329bb, Offset: 0x3e0
// Size: 0x438
function function_e93291ff()
{
    if ( isdefined( level.var_1710ced9 ) )
    {
        destinations = [[ level.var_1710ced9 ]]();
    }
    else
    {
        destinations = struct::get_array( "destination_influencer" );
    }
    
    if ( destinations.size <= 0 )
    {
        return;
    }
    
    destinations = arraysortclosest( destinations, ( 0, 0, 0 ) );
    
    for ( destindex = 0; destindex < destinations.size ; destindex++ )
    {
        destinations[ destindex ].globalindex = destindex;
    }
    
    level.var_7767cea8 = [];
    
    /#
        if ( getdvarint( #"hash_270a21a654a1a79f", 0 ) )
        {
            level.totalspawnpoints = [];
            
            foreach ( destination in destinations )
            {
                level.totalspawnpoints = arraycombine( level.totalspawnpoints, struct::get_array( destination.target, "<dev string:x38>" ), 0, 0 );
            }
        }
    #/
    
    foreach ( dest in destinations )
    {
        if ( dest.target === "hijacked" )
        {
            arrayremovevalue( destinations, dest );
            break;
        }
    }
    
    var_137456fd = getdvarint( #"wz_dest_id", -1 );
    
    if ( var_137456fd >= 0 && var_137456fd < destinations.size )
    {
        level.var_7767cea8[ 0 ] = destinations[ var_137456fd ];
        arrayremoveindex( destinations, var_137456fd );
    }
    else
    {
        while ( destinations.size > 0 && level.var_7767cea8.size < 5 )
        {
            destindex = randomint( destinations.size );
            level.var_7767cea8[ level.var_7767cea8.size ] = destinations[ destindex ];
            arrayremoveindex( destinations, destindex );
        }
    }
    
    foreach ( dest in level.var_7767cea8 )
    {
        dest.spawns = struct::get_array( dest.target, "targetname" );
    }
    
    foreach ( dest in destinations )
    {
        function_3b1d0553( dest );
    }
}

// Namespace spawn/spawn
// Params 0
// Checksum 0x12d33907, Offset: 0x820
// Size: 0x90
function function_cb5864fc()
{
    if ( isdefined( level.var_7767cea8 ) )
    {
        foreach ( dest in level.var_7767cea8 )
        {
            function_3b1d0553( dest );
        }
    }
}

// Namespace spawn/spawn
// Params 1
// Checksum 0xb366675e, Offset: 0x8b8
// Size: 0x4c8, Type: bool
function override_spawn( ispredictedspawn )
{
    self.var_7070a94c = 0;
    
    if ( infection::function_74650d7() && self infection::is_infected() )
    {
        self infection::function_f488681f();
        return true;
    }
    
    if ( !isdefined( level.var_7767cea8 ) )
    {
        self function_8cef1872();
        return false;
    }
    
    if ( level.var_7767cea8.size < 1 )
    {
        self.resurrect_origin = ( 0, 0, 0 );
        self.resurrect_angles = ( 0, 0, 0 );
        self function_8cef1872();
        return true;
    }
    
    teammask = getteammask( self.team );
    
    for ( teamindex = 0; teammask > 1 ; teamindex++ )
    {
        teammask >>= 1;
    }
    
    destindex = teamindex % level.var_7767cea8.size;
    dest = level.var_7767cea8[ destindex ];
    var_c1a973a4 = int( teamindex / level.var_7767cea8.size );
    var_92438b9c = var_c1a973a4 * level.maxteamplayers % dest.spawns.size;
    self.var_25fe2d03 = dest.globalindex;
    spawn = undefined;
    spawntime = gettime();
    
    if ( ispredictedspawn )
    {
        spawn = dest.spawns[ var_92438b9c ];
    }
    else if ( !isdefined( dest.spawns[ var_92438b9c ].spawntime ) )
    {
        dest.spawns[ var_92438b9c ].spawntime = spawntime;
        spawn = dest.spawns[ var_92438b9c ];
    }
    else
    {
        var_f5bb80c2 = var_92438b9c;
        var_e34bb789 = dest.spawns[ var_f5bb80c2 ].spawntime;
        
        for ( idx = 0; idx < level.maxteamplayers ; idx++ )
        {
            spawnindex = ( idx + var_92438b9c ) % dest.spawns.size;
            
            if ( !isdefined( dest.spawns[ spawnindex ].spawntime ) )
            {
                dest.spawns[ spawnindex ].spawntime = spawntime;
                spawn = dest.spawns[ spawnindex ];
                break;
            }
            
            if ( dest.spawns[ spawnindex ].spawntime < var_e34bb789 )
            {
                var_f5bb80c2 = spawnindex;
                var_e34bb789 = dest.spawns[ spawnindex ].spawntime;
            }
        }
        
        if ( !isdefined( spawn ) )
        {
            dest.spawns[ var_f5bb80c2 ].spawntime = spawntime;
            spawn = dest.spawns[ var_f5bb80c2 ];
        }
    }
    
    if ( getdvarint( #"wz_alt_spawn", 1 ) > 0 && !isbot( self ) )
    {
        info = function_f468d9a5( spawn );
        self.resurrect_origin = info.origin;
        self.resurrect_angles = info.angles;
        self.var_df8c6469 = info.freefall;
        self.var_7070a94c = 1;
    }
    else
    {
        self.resurrect_origin = spawn.origin;
        self.resurrect_angles = spawn.angles;
        self.var_7070a94c = 0;
        self function_8cef1872();
        self thread function_bb9099b9();
    }
    
    return true;
}

// Namespace spawn/spawn
// Params 0
// Checksum 0x7b997133, Offset: 0xd88
// Size: 0xc4
function function_bb9099b9()
{
    self endon( #"disconnect" );
    
    while ( !self isstreamerready() )
    {
        wait 0.5;
    }
    
    if ( game.state == "pregame" )
    {
        if ( isdefined( level.var_fd167bf6 ) )
        {
            self luinotifyevent( #"create_prematch_timer", 2, level.var_fd167bf6, level.var_5654073f );
            return;
        }
        
        self luinotifyevent( #"hash_2a9f7ecda8e925f6", 0 );
    }
}

// Namespace spawn/spawn
// Params 1
// Checksum 0xffd58764, Offset: 0xe58
// Size: 0x174
function on_spawn_player( predictedspawn )
{
    self.usingobj = undefined;
    
    if ( !isdefined( self.var_63af7f75 ) )
    {
        self.var_63af7f75 = -1;
    }
    
    if ( isdefined( level.deathcircleindex ) )
    {
        self.var_63af7f75 = level.deathcircleindex;
    }
    
    if ( level.usestartspawns && !level.ingraceperiod && !level.playerqueuedrespawn )
    {
        level.usestartspawns = 0;
    }
    
    self.var_c5134737 = 0;
    spawning::onspawnplayer( predictedspawn );
    
    if ( isdefined( self.var_25fe2d03 ) )
    {
        self clientfield::set( "StreamerSetSpawnHintIndex", self.var_25fe2d03 );
    }
    
    if ( self.pers[ #"spawns" ] == 1 )
    {
        if ( isdefined( self.var_7070a94c ) && self.var_7070a94c && !player_insertion::function_e5d4df1c() )
        {
            self thread function_c263fd97();
        }
        else
        {
            self function_8cef1872();
        }
    }
    
    self function_ea62f5af();
}

// Namespace spawn/spawn
// Params 0
// Checksum 0x2b163d49, Offset: 0xfd8
// Size: 0x13c
function function_ea62f5af()
{
    var_a56604c5 = namespace_eb06e24d::get_parachute_kit().lootid;
    var_c9b1d229 = namespace_eb06e24d::function_4a39b434().lootid;
    var_42b02106 = namespace_eb06e24d::get_wingsuit_kit().lootid;
    var_f8e6b703 = self match_record::get_player_stat( #"hash_ec4aea1a8bbd82" );
    
    if ( isdefined( var_f8e6b703 ) )
    {
        self match_record::set_stat( #"lives", var_f8e6b703, #"hash_4f557c87c0538129", var_a56604c5 );
        self match_record::set_stat( #"lives", var_f8e6b703, #"hash_4b4bd85ab964d386", var_c9b1d229 );
        self match_record::set_stat( #"lives", var_f8e6b703, #"hash_63862160f8335af2", var_42b02106 );
    }
}

// Namespace spawn/spawn
// Params 0
// Checksum 0x86c7f388, Offset: 0x1120
// Size: 0x104
function function_8cef1872()
{
    if ( isdefined( self.spawn_anchor ) )
    {
        self.spawn_anchor delete();
        self.spawn_anchor = undefined;
    }
    
    self clientfield::set_player_uimodel( "hudItems.wzLoadFinished", 1 );
    self clientfield::set_player_uimodel( "hudItems.streamerLoadFraction", 1 );
    self clientfield::set( "ClearStreamerLoadingHints", 1 );
    self val::reset( #"hash_5bb0dd6b277fc20c", "freezecontrols" );
    self val::reset( #"hash_5bb0dd6b277fc20c", "disablegadgets" );
    self callback::callback( #"hash_4fca7a48128c4741" );
}

// Namespace spawn/spawn
// Params 0, eflags: 0x4
// Checksum 0x9331f3b, Offset: 0x1230
// Size: 0x564
function private function_c263fd97()
{
    level endon( #"start_warzone" );
    self endon( #"disconnect" );
    self unlink();
    self.spawn_anchor = spawn( "script_origin", self.resurrect_origin );
    self playerlinkto( self.spawn_anchor );
    self setplayerangles( self.resurrect_angles );
    self setclientuivisibilityflag( "weapon_hud_visible", 0 );
    self ghost();
    self val::set( #"hash_5bb0dd6b277fc20c", "freezecontrols", 1 );
    self val::set( #"hash_5bb0dd6b277fc20c", "disablegadgets", 1 );
    var_80e2abb1 = getdvarfloat( #"hash_78198bd3a356f650", 0.5 );
    starttime = gettime();
    var_ffa47239 = getdvarint( #"hash_24ce936622303dc1", 4000 );
    var_2ee361bf = getdvarint( #"hash_6e24885f4fa8a2a2", 10000 );
    println( "<dev string:x45>" );
    
    while ( gettime() < starttime + var_ffa47239 )
    {
        wait 0.5;
        now = gettime();
        self clientfield::set_player_uimodel( "hudItems.streamerLoadFraction", ( now - starttime ) / ( var_ffa47239 + var_2ee361bf ) );
    }
    
    println( "<dev string:x67>" );
    var_4fcc3493 = starttime + var_ffa47239 + var_2ee361bf;
    var_8cd82180 = getdvarint( #"hash_723f28907e9e4cd0", 3 );
    var_45d7d746 = 0;
    var_ccb4a8be = player_free_fall::function_d2a1520c();
    streamermodelhint( var_ccb4a8be, float( var_ffa47239 + var_2ee361bf ) / 1000 );
    
    while ( true )
    {
        wait 0.5;
        now = gettime();
        self clientfield::set_player_uimodel( "hudItems.streamerLoadFraction", ( now - starttime ) / ( var_ffa47239 + var_2ee361bf ) );
        
        if ( now > var_4fcc3493 )
        {
            println( "<dev string:x81>" );
            break;
        }
        
        stability = 1;
        
        if ( isdefined( self.var_72d32640 ) )
        {
            stability = self.var_72d32640;
        }
        
        if ( self isstreamerready() && stability > var_80e2abb1 )
        {
            var_45d7d746++;
        }
        else
        {
            var_45d7d746 = 0;
        }
        
        println( "<dev string:x92>" + var_45d7d746 );
        
        if ( var_45d7d746 >= var_8cd82180 )
        {
            println( "<dev string:xa9>" );
            break;
        }
    }
    
    self unlink();
    self function_8cef1872();
    self setorigin( self.resurrect_origin );
    self show();
    self forcefreefall( 1, self.var_df8c6469, 0 );
    self.var_df8c6469 = undefined;
    
    if ( game.state == "pregame" )
    {
        if ( isdefined( level.var_fd167bf6 ) )
        {
            self luinotifyevent( #"create_prematch_timer", 2, level.var_fd167bf6, level.var_5654073f );
            return;
        }
        
        self luinotifyevent( #"hash_2a9f7ecda8e925f6", 0 );
    }
}

// Namespace spawn/spawn
// Params 1, eflags: 0x4
// Checksum 0xe04f7d11, Offset: 0x17a0
// Size: 0xc4
function private function_3b1d0553( dest )
{
    targets = struct::get_array( dest.target, "targetname" );
    
    foreach ( target in targets )
    {
        function_178abfd( target );
    }
    
    function_178abfd( dest );
}

// Namespace spawn/spawn
// Params 1, eflags: 0x4
// Checksum 0x75cb4d3b, Offset: 0x1870
// Size: 0xae
function private function_178abfd( struct )
{
    if ( !isarray( level.struct ) )
    {
        return;
    }
    
    foreach ( i, val in level.struct )
    {
        if ( val === struct )
        {
            level.struct[ i ] = undefined;
            return;
        }
    }
}

// Namespace spawn/spawn
// Params 1
// Checksum 0x9cd465a0, Offset: 0x1928
// Size: 0x64
function function_1390f875( num_lives )
{
    var_c6328f73 = self.pers[ #"lives" ] - 1;
    
    if ( var_c6328f73 < 0 )
    {
        var_c6328f73 = 0;
    }
    
    self clientfield::set_player_uimodel( "hudItems.playerLivesRemaining", var_c6328f73 );
}

