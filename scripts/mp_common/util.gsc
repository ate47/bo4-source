#using scripts\core_common\lui_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\util_shared;

#namespace util;

// Namespace util/util
// Params 4
// Checksum 0x5883daa4, Offset: 0x188
// Size: 0x90, Type: bool
function within_fov( start_origin, start_angles, end_origin, fov )
{
    normal = vectornormalize( end_origin - start_origin );
    forward = anglestoforward( start_angles );
    dot = vectordot( forward, normal );
    return dot >= fov;
}

// Namespace util/util
// Params 0
// Checksum 0xc6611dd2, Offset: 0x220
// Size: 0xa
function get_player_height()
{
    return 70;
}

// Namespace util/util
// Params 1
// Checksum 0xa1d23c94, Offset: 0x238
// Size: 0x3e, Type: bool
function isbulletimpactmod( smeansofdeath )
{
    return issubstr( smeansofdeath, "BULLET" ) || smeansofdeath == "MOD_HEAD_SHOT";
}

// Namespace util/util
// Params 0
// Checksum 0xb1402018, Offset: 0x280
// Size: 0x4e
function waitrespawnbutton()
{
    self endon( #"disconnect", #"end_respawn" );
    
    while ( self usebuttonpressed() != 1 )
    {
        waitframe( 1 );
    }
}

// Namespace util/util
// Params 2
// Checksum 0xc58e3fcc, Offset: 0x2d8
// Size: 0xd6
function printonteam( text, team )
{
    assert( isdefined( level.players ) );
    
    for ( i = 0; i < level.players.size ; i++ )
    {
        player = level.players[ i ];
        
        if ( isdefined( player.pers[ #"team" ] ) && player.pers[ #"team" ] == team )
        {
            player iprintln( text );
        }
    }
}

// Namespace util/util
// Params 2
// Checksum 0x774b5df5, Offset: 0x3b8
// Size: 0xd6
function printboldonteam( text, team )
{
    assert( isdefined( level.players ) );
    
    for ( i = 0; i < level.players.size ; i++ )
    {
        player = level.players[ i ];
        
        if ( isdefined( player.pers[ #"team" ] ) && player.pers[ #"team" ] == team )
        {
            player iprintlnbold( text );
        }
    }
}

// Namespace util/util
// Params 3
// Checksum 0xcb1301d0, Offset: 0x498
// Size: 0xe6
function printboldonteamarg( text, team, arg )
{
    assert( isdefined( level.players ) );
    
    for ( i = 0; i < level.players.size ; i++ )
    {
        player = level.players[ i ];
        
        if ( isdefined( player.pers[ #"team" ] ) && player.pers[ #"team" ] == team )
        {
            player iprintlnbold( text, arg );
        }
    }
}

// Namespace util/util
// Params 3
// Checksum 0xe2768f2c, Offset: 0x588
// Size: 0x1c
function printonteamarg( text, team, arg )
{
    
}

// Namespace util/util
// Params 2
// Checksum 0xf8779b4f, Offset: 0x5b0
// Size: 0xe6
function printonplayers( text, team )
{
    players = level.players;
    
    for ( i = 0; i < players.size ; i++ )
    {
        if ( isdefined( team ) )
        {
            if ( isdefined( players[ i ].pers[ #"team" ] ) && players[ i ].pers[ #"team" ] == team )
            {
                players[ i ] iprintln( text );
            }
            
            continue;
        }
        
        players[ i ] iprintln( text );
    }
}

// Namespace util/util
// Params 7
// Checksum 0x644bb4ee, Offset: 0x6a0
// Size: 0x4fe
function printandsoundoneveryone( team, enemyteam, printfriendly, printenemy, soundfriendly, soundenemy, printarg )
{
    shoulddosounds = isdefined( soundfriendly );
    shoulddoenemysounds = 0;
    
    if ( isdefined( soundenemy ) )
    {
        assert( shoulddosounds );
        shoulddoenemysounds = 1;
    }
    
    if ( !isdefined( printarg ) )
    {
        printarg = "";
    }
    
    if ( level.splitscreen || !shoulddosounds )
    {
        for ( i = 0; i < level.players.size ; i++ )
        {
            player = level.players[ i ];
            playerteam = player.pers[ #"team" ];
            
            if ( isdefined( playerteam ) )
            {
                if ( playerteam == team && isdefined( printfriendly ) && printfriendly != #"" )
                {
                    player iprintln( printfriendly, printarg );
                    continue;
                }
                
                if ( isdefined( printenemy ) && printenemy != #"" )
                {
                    if ( isdefined( enemyteam ) && playerteam == enemyteam )
                    {
                        player iprintln( printenemy, printarg );
                        continue;
                    }
                    
                    if ( !isdefined( enemyteam ) && playerteam != team )
                    {
                        player iprintln( printenemy, printarg );
                    }
                }
            }
        }
        
        if ( shoulddosounds )
        {
            assert( level.splitscreen );
            level.players[ 0 ] playlocalsound( soundfriendly );
        }
        
        return;
    }
    
    assert( shoulddosounds );
    
    if ( shoulddoenemysounds )
    {
        for ( i = 0; i < level.players.size ; i++ )
        {
            player = level.players[ i ];
            playerteam = player.pers[ #"team" ];
            
            if ( isdefined( playerteam ) )
            {
                if ( playerteam == team )
                {
                    if ( isdefined( printfriendly ) && printfriendly != #"" )
                    {
                        player iprintln( printfriendly, printarg );
                    }
                    
                    player playlocalsound( soundfriendly );
                    continue;
                }
                
                if ( isdefined( enemyteam ) && playerteam == enemyteam || !isdefined( enemyteam ) && playerteam != team )
                {
                    if ( isdefined( printenemy ) && printenemy != #"" )
                    {
                        player iprintln( printenemy, printarg );
                    }
                    
                    player playlocalsound( soundenemy );
                }
            }
        }
        
        return;
    }
    
    for ( i = 0; i < level.players.size ; i++ )
    {
        player = level.players[ i ];
        playerteam = player.pers[ #"team" ];
        
        if ( isdefined( playerteam ) )
        {
            if ( playerteam == team )
            {
                if ( isdefined( printfriendly ) && printfriendly != #"" )
                {
                    player iprintln( printfriendly, printarg );
                }
                
                player playlocalsound( soundfriendly );
                continue;
            }
            
            if ( isdefined( printenemy ) && printenemy != #"" )
            {
                if ( isdefined( enemyteam ) && playerteam == enemyteam )
                {
                    player iprintln( printenemy, printarg );
                    continue;
                }
                
                if ( !isdefined( enemyteam ) && playerteam != team )
                {
                    player iprintln( printenemy, printarg );
                }
            }
        }
    }
}

// Namespace util/util
// Params 1
// Checksum 0xc63f146d, Offset: 0xba8
// Size: 0x4c
function _playlocalsound( soundalias )
{
    if ( level.splitscreen && !self ishost() )
    {
        return;
    }
    
    self playlocalsound( soundalias );
}

// Namespace util/util
// Params 1
// Checksum 0x42d2e35a, Offset: 0xc00
// Size: 0x8c
function getotherteam( team )
{
    if ( team == #"allies" )
    {
        return #"axis";
    }
    else if ( team == #"axis" )
    {
        return #"allies";
    }
    else
    {
        return #"allies";
    }
    
    assertmsg( "<dev string:x38>" + team );
}

// Namespace util/util
// Params 1
// Checksum 0x4fdc285f, Offset: 0xc98
// Size: 0x6c
function getteamenum( team )
{
    if ( team == #"allies" )
    {
        return 1;
    }
    else if ( team == #"axis" )
    {
        return 2;
    }
    
    assertmsg( "<dev string:x56>" + team );
}

// Namespace util/util
// Params 1
// Checksum 0x7d0b987b, Offset: 0xd10
// Size: 0x74
function getteammask( team )
{
    if ( !level.teambased || !isdefined( team ) || !isdefined( level.spawnsystem.ispawn_teammask[ team ] ) )
    {
        return level.spawnsystem.ispawn_teammask_free;
    }
    
    return level.spawnsystem.ispawn_teammask[ team ];
}

// Namespace util/util
// Params 1
// Checksum 0x666b4e4b, Offset: 0xd90
// Size: 0xb0
function getotherteamsmask( skip_team )
{
    mask = 0;
    
    foreach ( team, _ in level.teams )
    {
        if ( team == skip_team )
        {
            continue;
        }
        
        mask |= getteammask( team );
    }
    
    return mask;
}

// Namespace util/util
// Params 5
// Checksum 0xc7cb1a03, Offset: 0xe48
// Size: 0x76, Type: bool
function wait_endon( waittime, endonstring, endonstring2, endonstring3, endonstring4 )
{
    self endon( endonstring );
    
    if ( isdefined( endonstring2 ) )
    {
        self endon( endonstring2 );
    }
    
    if ( isdefined( endonstring3 ) )
    {
        self endon( endonstring3 );
    }
    
    if ( isdefined( endonstring4 ) )
    {
        self endon( endonstring4 );
    }
    
    wait waittime;
    return true;
}

// Namespace util/util
// Params 1
// Checksum 0x74761c02, Offset: 0xec8
// Size: 0x5c
function getfx( fx )
{
    assert( isdefined( level._effect[ fx ] ), "<dev string:x73>" + fx + "<dev string:x79>" );
    return level._effect[ fx ];
}

// Namespace util/util
// Params 1
// Checksum 0x7ef6af5, Offset: 0xf30
// Size: 0x52
function add_trigger_to_ent( ent )
{
    if ( !isdefined( ent._triggers ) )
    {
        ent._triggers = [];
    }
    
    ent._triggers[ self getentitynumber() ] = 1;
}

// Namespace util/util
// Params 1
// Checksum 0x308aecad, Offset: 0xf90
// Size: 0x72
function remove_trigger_from_ent( ent )
{
    if ( !isdefined( ent ) )
    {
        return;
    }
    
    if ( !isdefined( ent._triggers ) )
    {
        return;
    }
    
    if ( !isdefined( ent._triggers[ self getentitynumber() ] ) )
    {
        return;
    }
    
    ent._triggers[ self getentitynumber() ] = 0;
}

// Namespace util/util
// Params 1
// Checksum 0x1aad6d12, Offset: 0x1010
// Size: 0x70, Type: bool
function ent_already_in_trigger( trig )
{
    if ( !isdefined( self._triggers ) )
    {
        return false;
    }
    
    if ( !isdefined( self._triggers[ trig getentitynumber() ] ) )
    {
        return false;
    }
    
    if ( !self._triggers[ trig getentitynumber() ] )
    {
        return false;
    }
    
    return true;
}

// Namespace util/util
// Params 2
// Checksum 0xddaf38fd, Offset: 0x1088
// Size: 0x4c
function trigger_thread_death_monitor( ent, ender )
{
    ent waittill( #"death" );
    self endon( ender );
    self remove_trigger_from_ent( ent );
}

// Namespace util/util
// Params 3
// Checksum 0xe098a3fd, Offset: 0x10e0
// Size: 0x184
function trigger_thread( ent, on_enter_payload, on_exit_payload )
{
    ent endon( #"death" );
    
    if ( ent ent_already_in_trigger( self ) )
    {
        return;
    }
    
    self add_trigger_to_ent( ent );
    ender = "end_trig_death_monitor" + self getentitynumber() + " " + ent getentitynumber();
    self thread trigger_thread_death_monitor( ent, ender );
    endon_condition = "leave_trigger_" + self getentitynumber();
    
    if ( isdefined( on_enter_payload ) )
    {
        self thread [[ on_enter_payload ]]( ent, endon_condition );
    }
    
    while ( isdefined( ent ) && ent istouching( self ) )
    {
        wait 0.01;
    }
    
    ent notify( endon_condition );
    
    if ( isdefined( ent ) && isdefined( on_exit_payload ) )
    {
        self thread [[ on_exit_payload ]]( ent );
    }
    
    if ( isdefined( ent ) )
    {
        self remove_trigger_from_ent( ent );
    }
    
    self notify( ender );
}

// Namespace util/util
// Params 2
// Checksum 0x49cd553e, Offset: 0x1270
// Size: 0x38, Type: bool
function isstrstart( string1, substr )
{
    return getsubstr( string1, 0, substr.size ) == substr;
}

// Namespace util/util
// Params 0
// Checksum 0xf0287d03, Offset: 0x12b0
// Size: 0x20, Type: bool
function iskillstreaksenabled()
{
    return isdefined( level.killstreaksenabled ) && level.killstreaksenabled;
}

// Namespace util/util
// Params 3, eflags: 0x4
// Checksum 0x964f2d33, Offset: 0x12d8
// Size: 0xa4
function private function_78e3e07b( team, index, objective_strings )
{
    setobjectivetext( team, objective_strings.text );
    
    if ( level.splitscreen )
    {
        setobjectivescoretext( team, objective_strings.score_text );
    }
    else
    {
        setobjectivescoretext( team, objective_strings.var_4687634f );
    }
    
    function_db4846b( team, index );
}

// Namespace util/util
// Params 1
// Checksum 0x89012573, Offset: 0x1388
// Size: 0x23a
function function_e17a230f( team )
{
    if ( !isdefined( level.var_d1455682 ) )
    {
        return;
    }
    
    objective_strings = level.var_d1455682.objective_strings;
    
    foreach ( index, var_53c9b682 in objective_strings )
    {
        if ( isdefined( var_53c9b682.attacker ) && var_53c9b682.attacker && team != game.attackers )
        {
            continue;
        }
        
        if ( isdefined( var_53c9b682.defender ) && var_53c9b682.defender && team != game.defenders )
        {
            continue;
        }
        
        if ( isdefined( var_53c9b682.overtime ) && var_53c9b682.overtime )
        {
            if ( !game.overtime_round )
            {
                continue;
            }
            
            if ( isdefined( var_53c9b682.overtime_round ) && var_53c9b682.overtime_round && var_53c9b682.overtime_round != game.overtime_round )
            {
                continue;
            }
            
            if ( isdefined( var_53c9b682.var_47177317 ) && var_53c9b682.var_47177317 && isdefined( game.overtime_first_winner ) && team != game.overtime_first_winner )
            {
                continue;
            }
            
            if ( isdefined( var_53c9b682.var_76fa703c ) && var_53c9b682.var_76fa703c && isdefined( game.overtime_first_winner ) && team == game.overtime_first_winner )
            {
                continue;
            }
        }
        
        function_78e3e07b( team, index, var_53c9b682 );
        return;
    }
}

// Namespace util/util
// Params 0
// Checksum 0x89473fa5, Offset: 0x15d0
// Size: 0x90
function function_9540d9b6()
{
    if ( !isdefined( level.var_d1455682 ) )
    {
        return;
    }
    
    foreach ( team, _ in level.teams )
    {
        function_e17a230f( team );
    }
}

// Namespace util/util
// Params 2
// Checksum 0x6b4bd86f, Offset: 0x1668
// Size: 0x3e
function setobjectivetext( team, text )
{
    game.strings[ "objective_" + level.teams[ team ] ] = text;
}

// Namespace util/util
// Params 2
// Checksum 0x46a70c5d, Offset: 0x16b0
// Size: 0x3e
function setobjectivescoretext( team, text )
{
    game.strings[ "objective_score_" + level.teams[ team ] ] = text;
}

// Namespace util/util
// Params 2
// Checksum 0xa6bd59d2, Offset: 0x16f8
// Size: 0x3e
function function_db4846b( team, text )
{
    game.strings[ "objective_first_spawn_hint_" + level.teams[ team ] ] = text;
}

// Namespace util/util
// Params 1
// Checksum 0x6afc51a5, Offset: 0x1740
// Size: 0x2c
function getobjectivetext( team )
{
    return game.strings[ "objective_" + level.teams[ team ] ];
}

// Namespace util/util
// Params 1
// Checksum 0x9738a88d, Offset: 0x1778
// Size: 0x2c
function getobjectivescoretext( team )
{
    return game.strings[ "objective_score_" + level.teams[ team ] ];
}

// Namespace util/util
// Params 1
// Checksum 0xd0da889d, Offset: 0x17b0
// Size: 0x2c
function function_4a118b30( team )
{
    return game.strings[ "objective_first_spawn_hint_" + level.teams[ team ] ];
}

// Namespace util/util
// Params 2
// Checksum 0xcf84b607, Offset: 0x17e8
// Size: 0x76
function registerroundswitch( minvalue, maxvalue )
{
    level.roundswitch = math::clamp( getgametypesetting( #"roundswitch" ), minvalue, maxvalue );
    level.roundswitchmin = minvalue;
    level.roundswitchmax = maxvalue;
}

// Namespace util/util
// Params 2
// Checksum 0x14ed0f00, Offset: 0x1868
// Size: 0x76
function registerroundlimit( minvalue, maxvalue )
{
    level.roundlimit = math::clamp( getgametypesetting( #"roundlimit" ), minvalue, maxvalue );
    level.roundlimitmin = minvalue;
    level.roundlimitmax = maxvalue;
}

// Namespace util/util
// Params 2
// Checksum 0x55670a7f, Offset: 0x18e8
// Size: 0x76
function registerroundwinlimit( minvalue, maxvalue )
{
    level.roundwinlimit = math::clamp( getgametypesetting( #"roundwinlimit" ), minvalue, maxvalue );
    level.roundwinlimitmin = minvalue;
    level.roundwinlimitmax = maxvalue;
}

// Namespace util/util
// Params 2
// Checksum 0x6305e3b8, Offset: 0x1968
// Size: 0x76
function registerscorelimit( minvalue, maxvalue )
{
    level.scorelimit = math::clamp( getgametypesetting( #"scorelimit" ), minvalue, maxvalue );
    level.scorelimitmin = minvalue;
    level.scorelimitmax = maxvalue;
}

// Namespace util/util
// Params 2
// Checksum 0x107cf3e8, Offset: 0x19e8
// Size: 0x76
function registerroundscorelimit( minvalue, maxvalue )
{
    level.roundscorelimit = math::clamp( getgametypesetting( #"roundscorelimit" ), minvalue, maxvalue );
    level.roundscorelimitmin = minvalue;
    level.roundscorelimitmax = maxvalue;
}

// Namespace util/util
// Params 2
// Checksum 0x55895ff2, Offset: 0x1a68
// Size: 0x8a
function registertimelimit( minvalue, maxvalue )
{
    level.timelimit = math::clamp( getgametypesetting( #"timelimit" ), minvalue, maxvalue );
    
    /#
        override_gts_timelimit();
    #/
    
    level.timelimitmin = minvalue;
    level.timelimitmax = maxvalue;
}

// Namespace util/util
// Params 4
// Checksum 0xd52bdefa, Offset: 0x1b00
// Size: 0x12e
function registernumlives( minvalue, maxvalue, teamlivesminvalue = minvalue, teamlivesmaxvalue = maxvalue )
{
    level.numlives = math::clamp( getgametypesetting( #"playernumlives" ), minvalue, maxvalue );
    level.numlivesmin = minvalue;
    level.numlivesmax = maxvalue;
    level.numteamlives = math::clamp( getgametypesetting( #"teamnumlives" ), teamlivesminvalue, teamlivesmaxvalue );
    level.numteamlivesmin = isdefined( teamlivesminvalue ) ? teamlivesminvalue : level.numlivesmin;
    level.numteamlivesmax = isdefined( teamlivesmaxvalue ) ? teamlivesmaxvalue : level.numlivesmax;
}

// Namespace util/util
// Params 1
// Checksum 0xcdb53bdc, Offset: 0x1c38
// Size: 0x82
function getplayerfromclientnum( clientnum )
{
    if ( clientnum < 0 )
    {
        return undefined;
    }
    
    for ( i = 0; i < level.players.size ; i++ )
    {
        if ( level.players[ i ] getentitynumber() == clientnum )
        {
            return level.players[ i ];
        }
    }
    
    return undefined;
}

// Namespace util/util
// Params 0
// Checksum 0x21ddabd7, Offset: 0x1cc8
// Size: 0x52, Type: bool
function ispressbuild()
{
    buildtype = getdvarstring( #"buildtype" );
    
    if ( isdefined( buildtype ) && buildtype == "press" )
    {
        return true;
    }
    
    return false;
}

// Namespace util/util
// Params 0
// Checksum 0x72ab00db, Offset: 0x1d28
// Size: 0x1e, Type: bool
function isflashbanged()
{
    return isdefined( self.flashendtime ) && gettime() < self.flashendtime;
}

// Namespace util/util
// Params 5
// Checksum 0x786b1b7f, Offset: 0x1d50
// Size: 0xbc
function domaxdamage( origin, attacker, inflictor, headshot, mod )
{
    if ( isdefined( self.damagedtodeath ) && self.damagedtodeath )
    {
        return;
    }
    
    if ( isdefined( self.maxhealth ) )
    {
        damage = self.maxhealth + 1;
    }
    else
    {
        damage = self.health + 1;
    }
    
    self.damagedtodeath = 1;
    self dodamage( damage, origin, attacker, inflictor, headshot, mod );
}

// Namespace util/util
// Params 0
// Checksum 0x55c2b6e0, Offset: 0x1e18
// Size: 0x24
function self_delete()
{
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace util/util
// Params 0
// Checksum 0x4bd7875d, Offset: 0x1e48
// Size: 0x4a
function use_button_pressed()
{
    assert( isplayer( self ), "<dev string:x9d>" );
    return self usebuttonpressed();
}

// Namespace util/util
// Params 0
// Checksum 0xbd69374f, Offset: 0x1ea0
// Size: 0x28
function waittill_use_button_pressed()
{
    while ( !self use_button_pressed() )
    {
        waitframe( 1 );
    }
}

// Namespace util/util
// Params 4
// Checksum 0xa37cec13, Offset: 0x1ed0
// Size: 0x184
function show_hint_text( str_text_to_show, b_should_blink = 0, str_turn_off_notify = "notify_turn_off_hint_text", n_display_time = 4 )
{
    self endon( #"notify_turn_off_hint_text", #"hint_text_removed" );
    
    if ( isdefined( self.hint_menu_handle ) )
    {
        hide_hint_text( 0 );
    }
    
    self.hint_menu_handle = self openluimenu( "MPHintText" );
    self setluimenudata( self.hint_menu_handle, #"hint_text_line", str_text_to_show );
    
    if ( b_should_blink )
    {
        lui::play_animation( self.hint_menu_handle, "blinking" );
    }
    else
    {
        lui::play_animation( self.hint_menu_handle, "display_noblink" );
    }
    
    if ( n_display_time != -1 )
    {
        self thread hide_hint_text_listener( n_display_time );
        self thread fade_hint_text_after_time( n_display_time, str_turn_off_notify );
    }
}

// Namespace util/util
// Params 1
// Checksum 0x1d568f28, Offset: 0x2060
// Size: 0xd6
function hide_hint_text( b_fade_before_hiding = 1 )
{
    self endon( #"hint_text_removed" );
    
    if ( isdefined( self.hint_menu_handle ) )
    {
        if ( b_fade_before_hiding )
        {
            lui::play_animation( self.hint_menu_handle, "fadeout" );
            self waittilltimeout( 0.75, #"kill_hint_text", #"death", #"hint_text_removed" );
        }
        
        self closeluimenu( self.hint_menu_handle );
        self.hint_menu_handle = undefined;
    }
    
    self notify( #"hint_text_removed" );
}

// Namespace util/util
// Params 2
// Checksum 0x3d84e9ae, Offset: 0x2140
// Size: 0x94
function fade_hint_text_after_time( n_display_time, str_turn_off_notify )
{
    self endon( #"hint_text_removed", #"death", #"kill_hint_text" );
    self waittilltimeout( n_display_time - 0.75, str_turn_off_notify, #"hint_text_removed", #"kill_hint_text" );
    hide_hint_text( 1 );
}

// Namespace util/util
// Params 1
// Checksum 0xa83199e5, Offset: 0x21e0
// Size: 0x8c
function hide_hint_text_listener( n_time )
{
    self endon( #"hint_text_removed", #"disconnect" );
    self waittilltimeout( n_time, #"kill_hint_text", #"death", #"hint_text_removed", #"disconnect" );
    hide_hint_text( 0 );
}

// Namespace util/util
// Params 2
// Checksum 0x7f3df9a, Offset: 0x2278
// Size: 0x7c
function set_team_radar( team, value )
{
    if ( team == #"allies" )
    {
        setmatchflag( "radar_allies", value );
        return;
    }
    
    if ( team == #"axis" )
    {
        setmatchflag( "radar_axis", value );
    }
}

// Namespace util/util
// Params 1
// Checksum 0x28e81586, Offset: 0x2300
// Size: 0x8a
function is_objective_game( game_type )
{
    switch ( game_type )
    {
        case #"dm":
        case #"conf":
        case #"gun":
        case #"tdm":
        case #"clean":
            return 0;
        default:
            return 1;
    }
}

// Namespace util/util
// Params 0
// Checksum 0xd6f5f398, Offset: 0x2398
// Size: 0x20, Type: bool
function isprophuntgametype()
{
    return isdefined( level.isprophunt ) && level.isprophunt;
}

// Namespace util/util
// Params 0
// Checksum 0x2712048e, Offset: 0x23c0
// Size: 0x4a, Type: bool
function isprop()
{
    return isdefined( self.pers[ #"team" ] ) && self.pers[ #"team" ] == game.defenders;
}

// Namespace util/util
// Params 1
// Checksum 0xf2b78747, Offset: 0x2418
// Size: 0x30
function function_6f4ff113( team )
{
    if ( game.switchedsides )
    {
        return getotherteam( team );
    }
    
    return team;
}

// Namespace util/util
// Params 2
// Checksum 0x6a1bfb77, Offset: 0x2450
// Size: 0x2c
function function_920dcdbf( item, var_3ec5ff40 )
{
    if ( game.switchedsides )
    {
        return var_3ec5ff40;
    }
    
    return item;
}

// Namespace util/util
// Params 1
// Checksum 0xa1c56e65, Offset: 0x2488
// Size: 0x100
function function_ff74bf7( team )
{
    players = level.players;
    
    for ( i = 0; i < players.size ; i++ )
    {
        player = players[ i ];
        
        if ( isdefined( player.pers[ #"team" ] ) && player.pers[ #"team" ] == team && isdefined( player.pers[ #"class" ] ) )
        {
            if ( player.sessionstate == "playing" && !player.afk )
            {
                return i;
            }
        }
    }
    
    return players.size;
}

// Namespace util/util
// Params 4
// Checksum 0x7199e2e7, Offset: 0x2590
// Size: 0x168
function function_5a68c330( var_e0dd85aa, s_team, n_clientnum, extradata = 0 )
{
    if ( !isdefined( var_e0dd85aa ) )
    {
        return;
    }
    
    switch ( s_team )
    {
        case #"axis":
            var_dfc4aab4 = 2;
            break;
        case #"allies":
            var_dfc4aab4 = 1;
            break;
        default:
            var_dfc4aab4 = 0;
            break;
    }
    
    if ( !isdefined( n_clientnum ) )
    {
        n_clientnum = -1;
    }
    
    players = get_players();
    
    foreach ( player in players )
    {
        player luinotifyevent( #"announcement_event", 4, var_e0dd85aa, var_dfc4aab4, n_clientnum, extradata );
    }
}

// Namespace util/util
// Params 0
// Checksum 0x1b586f69, Offset: 0x2700
// Size: 0xd8, Type: bool
function function_94a3be2()
{
    if ( isdefined( level.var_903e2252 ) && level.var_903e2252 )
    {
        return true;
    }
    
    if ( ( isdefined( getgametypesetting( #"drafttime" ) ) ? getgametypesetting( #"drafttime" ) : 0 ) < 30 )
    {
        return true;
    }
    
    if ( !( isdefined( getgametypesetting( #"draftenabled" ) ) && getgametypesetting( #"draftenabled" ) ) )
    {
        return true;
    }
    
    return false;
}

/#

    // Namespace util/util
    // Params 0
    // Checksum 0x834d28f2, Offset: 0x27e0
    // Size: 0x44, Type: dev
    function check_art_mode()
    {
        if ( getdvarint( #"art_mode", 0 ) > 0 )
        {
            init_map_art_dev();
        }
    }

    // Namespace util/util
    // Params 0
    // Checksum 0x7f90f6ca, Offset: 0x2830
    // Size: 0x1c, Type: dev
    function apply_dev_overrides()
    {
        override_gts_timelimit();
    }

    // Namespace util/util
    // Params 0
    // Checksum 0xd23b21f1, Offset: 0x2858
    // Size: 0x4c, Type: dev
    function init_map_art_dev()
    {
        disable_gameplay_timers();
        disable_draft();
        disable_ui();
        enable_art_fps();
    }

    // Namespace util/util
    // Params 0
    // Checksum 0x8a8333a0, Offset: 0x28b0
    // Size: 0x6c, Type: dev
    function disable_gameplay_timers()
    {
        setdvar( #"timelimitoverride", 0 );
        setdvar( #"prematchperiodoverride", 0 );
        setdvar( #"preroundperiodoverride", 0 );
    }

    // Namespace util/util
    // Params 0
    // Checksum 0x155c5809, Offset: 0x2928
    // Size: 0x54, Type: dev
    function disable_draft()
    {
        setdvar( #"draftenabled", 0 );
        setdvar( #"auto_select_character", 1 );
    }

    // Namespace util/util
    // Params 0
    // Checksum 0x12df9479, Offset: 0x2988
    // Size: 0x2c, Type: dev
    function disable_ui()
    {
        setdvar( #"ui_enabled", 0 );
    }

    // Namespace util/util
    // Params 0
    // Checksum 0xb17db74a, Offset: 0x29c0
    // Size: 0x7c, Type: dev
    function override_gts_timelimit()
    {
        timelimitoverride = getdvarint( #"timelimitoverride", -1 );
        
        if ( timelimitoverride >= 0 )
        {
            if ( level.timelimit != timelimitoverride )
            {
                level.timelimit = timelimitoverride;
                setgametypesetting( "<dev string:xcb>", timelimitoverride );
            }
        }
    }

    // Namespace util/util
    // Params 0
    // Checksum 0x8d2a2d36, Offset: 0x2a48
    // Size: 0x54, Type: dev
    function enable_art_fps()
    {
        setdvar( #"cg_drawfps", 0 );
        setdvar( #"cg_drawartfps", 1 );
    }

#/
