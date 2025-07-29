#using scripts\core_common\callbacks_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\gametypes\dev;
#using scripts\mp_common\gametypes\globallogic_utils;

#namespace gameadvertisement;

// Namespace gameadvertisement/gameadvertisement
// Params 0
// Checksum 0xa47b6e1c, Offset: 0x88
// Size: 0x11c
function init()
{
    /#
        level.sessionadvertstatus = 1;
        thread sessionadvertismentupdatedebughud();
    #/
    
    level.gameadvertisementrulescorepercent = getgametypesetting( #"gameadvertisementrulescorepercent" );
    level.gameadvertisementruletimeleft = 60000 * getgametypesetting( #"gameadvertisementruletimeleft" );
    level.gameadvertisementruleround = getgametypesetting( #"gameadvertisementruleround" );
    level.gameadvertisementruleroundswon = getgametypesetting( #"gameadvertisementruleroundswon" );
    
    if ( !isdefined( level.var_a962eeb6 ) )
    {
        level.var_a962eeb6 = &default_rules;
    }
    
    callback::on_game_playing( &sessionadvertisementcheck );
}

// Namespace gameadvertisement/gameadvertisement
// Params 1
// Checksum 0xd8b5ac7c, Offset: 0x1b0
// Size: 0x34
function setadvertisedstatus( onoff )
{
    /#
        level.sessionadvertstatus = onoff;
    #/
    
    changeadvertisedstatus( onoff );
}

// Namespace gameadvertisement/gameadvertisement
// Params 0
// Checksum 0xb92ce72b, Offset: 0x1f0
// Size: 0x128
function sessionadvertisementcheck()
{
    if ( sessionmodeisprivate() )
    {
        return;
    }
    
    if ( !isdefined( level.var_a962eeb6 ) )
    {
        return;
    }
    
    level endon( #"game_end" );
    
    for ( currentadvertisedstatus = undefined; true ; currentadvertisedstatus = advertise )
    {
        sessionadvertcheckwait = getdvarint( #"sessionadvertcheckwait", 1 );
        wait sessionadvertcheckwait;
        advertise = [[ level.var_a962eeb6 ]]();
        
        if ( !isdefined( currentadvertisedstatus ) || isdefined( advertise ) && currentadvertisedstatus != advertise )
        {
            println( "<dev string:x38>" + ( advertise ? "<dev string:x4d>" : "<dev string:x54>" ) );
            setadvertisedstatus( advertise );
        }
    }
}

// Namespace gameadvertisement/gameadvertisement
// Params 2
// Checksum 0x3cea9f8d, Offset: 0x320
// Size: 0x1aa, Type: bool
function teamscorelimitcheck( rulescorepercent, debug_count )
{
    scorelimit = 0;
    
    if ( level.roundscorelimit )
    {
        scorelimit = util::get_current_round_score_limit();
    }
    else if ( level.scorelimit )
    {
        scorelimit = level.scorelimit;
    }
    
    if ( scorelimit )
    {
        minscorepercentageleft = 100;
        
        foreach ( team, _ in level.teams )
        {
            scorepercentageleft = 100 - game.stat[ #"teamscores" ][ team ] / scorelimit * 100;
            
            if ( minscorepercentageleft > scorepercentageleft )
            {
                minscorepercentageleft = scorepercentageleft;
            }
            
            if ( rulescorepercent >= scorepercentageleft )
            {
                /#
                    debug_count = updatedebughud( debug_count, "<dev string:x5c>", int( scorepercentageleft ) );
                #/
                
                return false;
            }
        }
        
        /#
            debug_count = updatedebughud( debug_count, "<dev string:x5c>", int( minscorepercentageleft ) );
        #/
    }
    
    return true;
}

// Namespace gameadvertisement/gameadvertisement
// Params 1
// Checksum 0xe75ee0dd, Offset: 0x4d8
// Size: 0x64, Type: bool
function timelimitcheck( ruletimeleft )
{
    maxtime = level.timelimit;
    
    if ( maxtime != 0 )
    {
        timeleft = globallogic_utils::gettimeremaining();
        
        if ( ruletimeleft >= timeleft )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace gameadvertisement/gameadvertisement
// Params 0
// Checksum 0x1934e19d, Offset: 0x548
// Size: 0x402, Type: bool
function default_rules()
{
    currentround = game.roundsplayed + 1;
    debug_count = 1;
    
    if ( level.gameadvertisementrulescorepercent )
    {
        /#
            debug_count = updatedebughud( debug_count, "<dev string:x76>", level.gameadvertisementrulescorepercent );
        #/
        
        if ( level.teambased )
        {
            if ( currentround >= level.gameadvertisementruleround - 1 )
            {
                if ( teamscorelimitcheck( level.gameadvertisementrulescorepercent, debug_count ) == 0 )
                {
                    return false;
                }
                
                /#
                    debug_count++;
                #/
            }
        }
        else if ( level.scorelimit )
        {
            highestscore = 0;
            players = getplayers();
            
            for ( i = 0; i < players.size ; i++ )
            {
                if ( players[ i ].pointstowin > highestscore )
                {
                    highestscore = players[ i ].pointstowin;
                }
            }
            
            scorepercentageleft = 100 - highestscore / level.scorelimit * 100;
            
            /#
                debug_count = updatedebughud( debug_count, "<dev string:x5c>", int( scorepercentageleft ) );
            #/
            
            if ( level.gameadvertisementrulescorepercent >= scorepercentageleft )
            {
                return false;
            }
        }
    }
    
    if ( level.gameadvertisementruletimeleft && currentround >= level.gameadvertisementruleround - 1 )
    {
        /#
            debug_count = updatedebughud( debug_count, "<dev string:xa9>", level.gameadvertisementruletimeleft / 60000 );
        #/
        
        if ( timelimitcheck( level.gameadvertisementruletimeleft ) == 0 )
        {
            return false;
        }
    }
    
    if ( level.gameadvertisementruleround )
    {
        /#
            debug_count = updatedebughud( debug_count, "<dev string:xd8>", level.gameadvertisementruleround );
            debug_count = updatedebughud( debug_count, "<dev string:xe5>", currentround );
        #/
        
        if ( level.gameadvertisementruleround <= currentround )
        {
            return false;
        }
    }
    
    if ( level.gameadvertisementruleroundswon )
    {
        /#
            debug_count = updatedebughud( debug_count, "<dev string:xf7>", level.gameadvertisementruleroundswon );
        #/
        
        maxroundswon = 0;
        
        foreach ( team, _ in level.teams )
        {
            roundswon = game.stat[ #"teamscores" ][ team ];
            
            if ( maxroundswon < roundswon )
            {
                maxroundswon = roundswon;
            }
            
            if ( level.gameadvertisementruleroundswon <= roundswon )
            {
                /#
                    debug_count = updatedebughud( debug_count, "<dev string:x113>", maxroundswon );
                #/
                
                return false;
            }
        }
        
        /#
            debug_count = updatedebughud( debug_count, "<dev string:x113>", maxroundswon );
        #/
    }
    
    return true;
}

/#

    // Namespace gameadvertisement/gameadvertisement
    // Params 2
    // Checksum 0x109cb562, Offset: 0x958
    // Size: 0x152, Type: dev
    function sessionadvertismentcreatedebughud( linenum, alignx )
    {
        debug_hud = dev::new_hud( "<dev string:x126>", "<dev string:x137>", 0, 0, 1 );
        debug_hud.hidewheninmenu = 1;
        debug_hud.horzalign = "<dev string:x143>";
        debug_hud.vertalign = "<dev string:x14b>";
        debug_hud.alignx = "<dev string:x143>";
        debug_hud.aligny = "<dev string:x14b>";
        debug_hud.x = alignx;
        debug_hud.y = -50 + linenum * 15;
        debug_hud.foreground = 1;
        debug_hud.font = "<dev string:x154>";
        debug_hud.fontscale = 1.5;
        debug_hud.color = ( 1, 1, 1 );
        debug_hud.alpha = 1;
        debug_hud settext( "<dev string:x15e>" );
        return debug_hud;
    }

    // Namespace gameadvertisement/gameadvertisement
    // Params 3
    // Checksum 0x2340c86d, Offset: 0xab8
    // Size: 0x10e, Type: dev
    function updatedebughud( hudindex, text, value )
    {
        switch ( hudindex )
        {
            case 1:
                level.sessionadverthud_1a_text = text;
                level.sessionadverthud_1b_text = value;
                break;
            case 2:
                level.sessionadverthud_2a_text = text;
                level.sessionadverthud_2b_text = value;
                break;
            case 3:
                level.sessionadverthud_3a_text = text;
                level.sessionadverthud_3b_text = value;
                break;
            case 4:
                level.sessionadverthud_4a_text = text;
                level.sessionadverthud_4b_text = value;
                break;
        }
        
        return hudindex + 1;
    }

    // Namespace gameadvertisement/gameadvertisement
    // Params 0
    // Checksum 0xdf131fdc, Offset: 0xbd0
    // Size: 0x660, Type: dev
    function sessionadvertismentupdatedebughud()
    {
        level endon( #"game_end" );
        sessionadverthud_0 = undefined;
        sessionadverthud_1a = undefined;
        sessionadverthud_1b = undefined;
        sessionadverthud_2a = undefined;
        sessionadverthud_2b = undefined;
        sessionadverthud_3a = undefined;
        sessionadverthud_3b = undefined;
        sessionadverthud_4a = undefined;
        sessionadverthud_4b = undefined;
        level.sessionadverthud_0_text = "<dev string:x15e>";
        level.sessionadverthud_1a_text = "<dev string:x15e>";
        level.sessionadverthud_1b_text = "<dev string:x15e>";
        level.sessionadverthud_2a_text = "<dev string:x15e>";
        level.sessionadverthud_2b_text = "<dev string:x15e>";
        level.sessionadverthud_3a_text = "<dev string:x15e>";
        level.sessionadverthud_3b_text = "<dev string:x15e>";
        level.sessionadverthud_4a_text = "<dev string:x15e>";
        level.sessionadverthud_4b_text = "<dev string:x15e>";
        
        while ( true )
        {
            wait 1;
            showdebughud = getdvarint( #"sessionadvertshowdebughud", 0 );
            level.sessionadverthud_0_text = "<dev string:x161>";
            
            if ( level.sessionadvertstatus == 0 )
            {
                level.sessionadverthud_0_text = "<dev string:x179>";
            }
            
            if ( !isdefined( sessionadverthud_0 ) && showdebughud != 0 )
            {
                host = util::gethostplayer();
                
                if ( !isdefined( host ) )
                {
                    continue;
                }
                
                sessionadverthud_0 = host sessionadvertismentcreatedebughud( 0, 0 );
                sessionadverthud_1a = host sessionadvertismentcreatedebughud( 1, -20 );
                sessionadverthud_1b = host sessionadvertismentcreatedebughud( 1, 0 );
                sessionadverthud_2a = host sessionadvertismentcreatedebughud( 2, -20 );
                sessionadverthud_2b = host sessionadvertismentcreatedebughud( 2, 0 );
                sessionadverthud_3a = host sessionadvertismentcreatedebughud( 3, -20 );
                sessionadverthud_3b = host sessionadvertismentcreatedebughud( 3, 0 );
                sessionadverthud_4a = host sessionadvertismentcreatedebughud( 4, -20 );
                sessionadverthud_4b = host sessionadvertismentcreatedebughud( 4, 0 );
                sessionadverthud_1a.color = ( 0, 0.5, 0 );
                sessionadverthud_1b.color = ( 0, 0.5, 0 );
                sessionadverthud_2a.color = ( 0, 0.5, 0 );
                sessionadverthud_2b.color = ( 0, 0.5, 0 );
            }
            
            if ( isdefined( sessionadverthud_0 ) )
            {
                if ( showdebughud == 0 )
                {
                    sessionadverthud_0 destroy();
                    sessionadverthud_1a destroy();
                    sessionadverthud_1b destroy();
                    sessionadverthud_2a destroy();
                    sessionadverthud_2b destroy();
                    sessionadverthud_3a destroy();
                    sessionadverthud_3b destroy();
                    sessionadverthud_4a destroy();
                    sessionadverthud_4b destroy();
                    sessionadverthud_0 = undefined;
                    sessionadverthud_1a = undefined;
                    sessionadverthud_1b = undefined;
                    sessionadverthud_2a = undefined;
                    sessionadverthud_2b = undefined;
                    sessionadverthud_3a = undefined;
                    sessionadverthud_3b = undefined;
                    sessionadverthud_4a = undefined;
                    sessionadverthud_4b = undefined;
                    continue;
                }
                
                if ( level.sessionadvertstatus == 1 )
                {
                    sessionadverthud_0.color = ( 1, 1, 1 );
                }
                else
                {
                    sessionadverthud_0.color = ( 0.9, 0, 0 );
                }
                
                sessionadverthud_0 settext( level.sessionadverthud_0_text );
                
                if ( level.sessionadverthud_1a_text != "<dev string:x15e>" )
                {
                    sessionadverthud_1a settext( level.sessionadverthud_1a_text );
                    sessionadverthud_1b setvalue( level.sessionadverthud_1b_text );
                }
                
                if ( level.sessionadverthud_2a_text != "<dev string:x15e>" )
                {
                    sessionadverthud_2a settext( level.sessionadverthud_2a_text );
                    sessionadverthud_2b setvalue( level.sessionadverthud_2b_text );
                }
                
                if ( level.sessionadverthud_3a_text != "<dev string:x15e>" )
                {
                    sessionadverthud_3a settext( level.sessionadverthud_3a_text );
                    sessionadverthud_3b setvalue( level.sessionadverthud_3b_text );
                }
                
                if ( level.sessionadverthud_4a_text != "<dev string:x15e>" )
                {
                    sessionadverthud_4a settext( level.sessionadverthud_4a_text );
                    sessionadverthud_4b setvalue( level.sessionadverthud_4b_text );
                }
            }
        }
    }

#/
