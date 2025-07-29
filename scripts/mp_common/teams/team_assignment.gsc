#using scripts\core_common\bots\bot;
#using scripts\core_common\platoons;
#using scripts\core_common\system_shared;
#using scripts\core_common\teams;
#using scripts\core_common\util_shared;
#using scripts\mp_common\teams\platoons;
#using scripts\mp_common\teams\teams;

#namespace teams;

// Namespace teams/team_assignment
// Params 0, eflags: 0x2
// Checksum 0xbeae1766, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"team_assignment", &__init__, undefined, undefined );
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0x19066028, Offset: 0x118
// Size: 0x5e
function __init__()
{
    if ( !isdefined( level.var_a3e209ba ) )
    {
        level.var_a3e209ba = &function_321f8eb5;
    }
    
    /#
        level.var_ba13fb7a = getdvarint( #"hash_40fe9055da22add4", 0 );
    #/
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xd56cdad, Offset: 0x180
// Size: 0x26
function get_assigned_team()
{
    teamname = getassignedteamname( self );
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xbd435844, Offset: 0x1b0
// Size: 0x3a
function function_2ba5e3e6()
{
    var_ac46c774 = util::gethostplayerforbots();
    
    if ( isdefined( var_ac46c774 ) )
    {
        return var_ac46c774.team;
    }
    
    return "";
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xe1f7286a, Offset: 0x1f8
// Size: 0x7c, Type: bool
function function_582e5d7c()
{
    return isbot( self ) && isdefined( self.botteam ) && self.botteam != "autoassign" && ( level.maxteamplayers == 0 || getplayers( self.botteam ).size < level.maxteamplayers );
}

// Namespace teams/team_assignment
// Params 2
// Checksum 0xeafeb618, Offset: 0x280
// Size: 0x1f0
function function_ee150fcc( team, team_players )
{
    var_ab9e77bf = [];
    
    /#
        var_f8896168 = getdvarint( #"hash_4cbf229ab691d987", 0 );
    #/
    
    foreach ( player in team_players )
    {
        party = player getparty();
        assert( party.var_a15e4438 <= level.maxteamplayers );
        var_ab9e77bf[ party.party_id ] = party.fill ? party.var_a15e4438 : level.maxteamplayers;
        
        /#
            if ( var_f8896168 )
            {
                var_ab9e77bf[ party.party_id ] = party.var_a15e4438;
            }
        #/
    }
    
    var_6195506c = 0;
    
    foreach ( count in var_ab9e77bf )
    {
        var_6195506c += count;
    }
    
    return level.maxteamplayers - var_6195506c;
}

// Namespace teams/team_assignment
// Params 2, eflags: 0x4
// Checksum 0xc2299f3d, Offset: 0x478
// Size: 0x9e, Type: bool
function private function_f18da875( platoon, player_counts )
{
    foreach ( test_platoon, count in player_counts )
    {
        if ( test_platoon != platoon && count >= player_counts[ platoon ] )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace teams/team_assignment
// Params 1
// Checksum 0xf466634f, Offset: 0x520
// Size: 0x252, Type: bool
function function_efe5a681( team )
{
    team_players = getplayers( team );
    
    if ( team_players.size >= level.maxteamplayers )
    {
        return false;
    }
    
    if ( getdvarint( #"hash_aecb27a63d1fcee", 0 ) == 0 )
    {
        if ( platoons::function_382a49e0() )
        {
            platoon = getteamplatoon( team );
            
            if ( platoon != #"invalid" && platoon != #"none" )
            {
                player_counts = platoons::count_players();
                
                if ( player_counts[ platoon ] >= level.platoon.max_players )
                {
                    return false;
                }
                
                if ( getdvarint( #"hash_52e8746b313ada90", 0 ) == 0 )
                {
                    if ( function_f18da875( platoon, player_counts ) )
                    {
                        return false;
                    }
                }
            }
        }
    }
    
    available_spots = function_ee150fcc( team, team_players );
    party = self getparty();
    
    if ( party.var_a15e4438 > available_spots )
    {
        return false;
    }
    
    /#
        if ( getdvarint( #"hash_2ffea48b89a9ff3f", 0 ) && self != getplayers()[ 0 ] && getplayers()[ 0 ].team == team && !isbot( self ) )
        {
            return false;
        }
    #/
    
    return true;
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0x7bb79739, Offset: 0x780
// Size: 0x10a
function function_ccb3bc7a()
{
    foreach ( team in level.teams )
    {
        if ( self function_efe5a681( team ) )
        {
            println( "<dev string:x38>" + "<dev string:x4c>" + self.name + "<dev string:x61>" + team + "<dev string:x71>" + getplayers( team ).size );
            
            /#
                function_d28f6fa0( team );
            #/
            
            return team;
        }
    }
    
    return #"spectator";
}

// Namespace teams/team_assignment
// Params 1
// Checksum 0x4a2f04b8, Offset: 0x898
// Size: 0x1a2
function function_b919f6aa( status )
{
    foreach ( team in level.teams )
    {
        if ( status == #"game" )
        {
            if ( isdefined( level.var_75dffa9f[ team ] ) && level.var_75dffa9f[ team ] != #"game" )
            {
                continue;
            }
        }
        else if ( isdefined( level.var_75dffa9f[ team ] ) && level.var_75dffa9f[ team ] == #"game" )
        {
            continue;
        }
        
        if ( self function_efe5a681( team ) )
        {
            println( "<dev string:x38>" + "<dev string:x4c>" + self.name + "<dev string:x7b>" + team + "<dev string:x71>" + getplayers( team ).size );
            
            /#
                function_d28f6fa0( team );
            #/
            
            return team;
        }
    }
    
    return #"spectator";
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xff3cb8dc, Offset: 0xa48
// Size: 0xa2
function function_5c389625()
{
    status = self function_3d288f14();
    assignment = self function_b919f6aa( status );
    
    if ( !isdefined( assignment ) || assignment == #"spectator" )
    {
        assignment = function_959bac94();
    }
    
    if ( !isdefined( assignment ) )
    {
        assignment = function_ccb3bc7a();
    }
    
    return assignment;
}

// Namespace teams/team_assignment
// Params 1
// Checksum 0x46122ff1, Offset: 0xaf8
// Size: 0x192
function function_5d02dd86( party )
{
    foreach ( member in party.party_members )
    {
        if ( self == member )
        {
            continue;
        }
        
        if ( member.team != "autoassign" && member.team != "spectate" )
        {
            team_players = getplayers( member.team );
            
            if ( team_players.size >= level.maxteamplayers )
            {
                break;
            }
            
            println( "<dev string:x38>" + "<dev string:x4c>" + self.name + "<dev string:x90>" + member.team + "<dev string:x9c>" + member.name );
            
            /#
                function_d28f6fa0( member.team );
            #/
            
            return member.team;
        }
    }
    
    return function_868b679c( party );
}

// Namespace teams/team_assignment
// Params 0, eflags: 0x4
// Checksum 0x63eaaca1, Offset: 0xc98
// Size: 0x160
function private function_650d105d()
{
    if ( function_582e5d7c() )
    {
        return self.botteam;
    }
    
    teamkeys = getarraykeys( level.teams );
    assignment = teamkeys[ randomint( teamkeys.size ) ];
    playercounts = self count_players();
    
    if ( teamplayercountsequal( playercounts ) )
    {
        if ( !level.splitscreen && self issplitscreen() )
        {
            assignment = self get_splitscreen_team();
            
            if ( assignment == "" )
            {
                assignment = pickteamfromscores( teamkeys );
            }
        }
        else
        {
            assignment = pickteamfromscores( teamkeys );
        }
    }
    else
    {
        assignment = function_d078493a( playercounts );
    }
    
    assert( isdefined( assignment ) );
    return assignment;
}

// Namespace teams/team_assignment
// Params 1, eflags: 0x4
// Checksum 0x93c810e2, Offset: 0xe00
// Size: 0x9c, Type: bool
function private function_75daeb56( party )
{
    /#
        var_f8896168 = getdvarint( #"hash_4cbf229ab691d987", 0 );
        
        if ( var_f8896168 && ( var_f8896168 != 2 || self ishost() ) )
        {
            return false;
        }
    #/
    
    if ( isdefined( party ) && party.fill == 0 )
    {
        return true;
    }
    
    return false;
}

// Namespace teams/team_assignment
// Params 1, eflags: 0x4
// Checksum 0xe0648e22, Offset: 0xea8
// Size: 0xa2
function private function_868b679c( party )
{
    if ( function_75daeb56( party ) )
    {
        assignment = function_959bac94();
    }
    else if ( getdvarint( #"hash_587d8e03df4f4f8a", 0 ) )
    {
        assignment = function_ccb3bc7a();
    }
    else
    {
        assignment = self function_5c389625();
    }
    
    return assignment;
}

// Namespace teams/team_assignment
// Params 0, eflags: 0x4
// Checksum 0xefe8ca61, Offset: 0xf58
// Size: 0x8a
function private function_1e545bc7()
{
    if ( function_582e5d7c() )
    {
        return self.botteam;
    }
    
    party = self getparty();
    
    if ( isdefined( party ) && party.var_a15e4438 > 1 )
    {
        return function_5d02dd86( party );
    }
    
    return function_868b679c( party );
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xc450f125, Offset: 0xff0
// Size: 0x42
function function_bec6e9a()
{
    if ( level.multiteam && level.maxteamplayers > 0 )
    {
        return function_1e545bc7();
    }
    
    return function_650d105d();
}

// Namespace teams/team_assignment
// Params 2
// Checksum 0x844d1522, Offset: 0x1040
// Size: 0x100
function function_b55ab4b3( comingfrommenu, var_4c542e39 )
{
    if ( !comingfrommenu && var_4c542e39 === "spectator" )
    {
        return var_4c542e39;
    }
    
    clientnum = self getentitynumber();
    count = 0;
    
    foreach ( team, _ in level.teams )
    {
        if ( team == "free" )
        {
            continue;
        }
        
        count++;
        
        if ( count == clientnum + 1 )
        {
            return team;
        }
    }
    
    return var_4c542e39;
}

// Namespace teams/team_assignment
// Params 2
// Checksum 0x847c6e75, Offset: 0x1148
// Size: 0x118
function function_d22a4fbb( comingfrommenu, var_4c542e39 )
{
    if ( !isdefined( var_4c542e39 ) )
    {
        teamname = getassignedteamname( self );
    }
    else
    {
        teamname = var_4c542e39;
    }
    
    if ( teamname !== "free" && !comingfrommenu )
    {
        assignment = teamname;
    }
    else if ( function_a3e209ba( teamname, comingfrommenu ) )
    {
        assignment = #"spectator";
    }
    else if ( isdefined( level.forcedplayerteam ) && !isbot( self ) )
    {
        assignment = level.forcedplayerteam;
    }
    else
    {
        assignment = function_bec6e9a();
        assert( isdefined( assignment ) );
    }
    
    return assignment;
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xd9859199, Offset: 0x1268
// Size: 0xbc, Type: bool
function teamscoresequal()
{
    score = undefined;
    
    foreach ( team, _ in level.teams )
    {
        if ( !isdefined( score ) )
        {
            score = getteamscore( team );
            continue;
        }
        
        if ( score != getteamscore( team ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0x2fcf7703, Offset: 0x1330
// Size: 0xae
function teamwithlowestscore()
{
    score = 99999999;
    lowest_team = undefined;
    
    foreach ( team, _ in level.teams )
    {
        if ( score > getteamscore( team ) )
        {
            lowest_team = team;
        }
    }
    
    return lowest_team;
}

// Namespace teams/team_assignment
// Params 1
// Checksum 0x6fb18401, Offset: 0x13e8
// Size: 0x7a
function pickteamfromscores( teams )
{
    assignment = #"allies";
    
    if ( teamscoresequal() )
    {
        assignment = teams[ randomint( teams.size ) ];
    }
    else
    {
        assignment = teamwithlowestscore();
    }
    
    return assignment;
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xd1158f57, Offset: 0x1470
// Size: 0xce
function get_splitscreen_team()
{
    for ( index = 0; index < level.players.size ; index++ )
    {
        if ( !isdefined( level.players[ index ] ) )
        {
            continue;
        }
        
        if ( level.players[ index ] == self )
        {
            continue;
        }
        
        if ( !self isplayeronsamemachine( level.players[ index ] ) )
        {
            continue;
        }
        
        team = level.players[ index ].sessionteam;
        
        if ( team != #"spectator" )
        {
            return team;
        }
    }
    
    return "";
}

// Namespace teams/team_assignment
// Params 1
// Checksum 0xf2be96c7, Offset: 0x1548
// Size: 0xb2, Type: bool
function teamplayercountsequal( playercounts )
{
    count = undefined;
    
    foreach ( team, _ in level.teams )
    {
        if ( !isdefined( count ) )
        {
            count = playercounts[ team ];
            continue;
        }
        
        if ( count != playercounts[ team ] )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace teams/team_assignment
// Params 1
// Checksum 0x8ba8f060, Offset: 0x1608
// Size: 0xb8
function function_d078493a( playercounts )
{
    count = 9999;
    lowest_team = undefined;
    
    foreach ( team, _ in level.teams )
    {
        if ( count > playercounts[ team ] )
        {
            count = playercounts[ team ];
            lowest_team = team;
        }
    }
    
    return lowest_team;
}

// Namespace teams/team_assignment
// Params 1
// Checksum 0xb7de8c3f, Offset: 0x16c8
// Size: 0x10, Type: bool
function function_321f8eb5( player )
{
    return true;
}

// Namespace teams/team_assignment
// Params 2
// Checksum 0x90b44a66, Offset: 0x16e0
// Size: 0xce, Type: bool
function function_a3e209ba( teamname, comingfrommenu )
{
    if ( level.rankedmatch )
    {
        return false;
    }
    
    if ( level.inprematchperiod )
    {
        return false;
    }
    
    if ( teamname != "free" )
    {
        return false;
    }
    
    if ( comingfrommenu )
    {
        return false;
    }
    
    if ( self ishost() )
    {
        return false;
    }
    
    if ( level.forceautoassign )
    {
        return false;
    }
    
    if ( isbot( self ) )
    {
        return false;
    }
    
    if ( self issplitscreen() )
    {
        return false;
    }
    
    if ( ![[ level.var_a3e209ba ]]() )
    {
        return false;
    }
    
    return true;
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xfbb4272b, Offset: 0x17b8
// Size: 0x1fe
function function_7d93567f()
{
    players = level.players;
    distribution = [];
    
    foreach ( player in level.players )
    {
        team = player.pers[ #"team" ];
        
        if ( !isdefined( level.teams[ team ] ) )
        {
            continue;
        }
        
        platoon = getteamplatoon( team );
        
        if ( platoon == #"invalid" )
        {
            continue;
        }
        
        if ( !isdefined( distribution[ platoon ] ) )
        {
            distribution[ platoon ] = [];
        }
        
        if ( !isdefined( distribution[ platoon ][ team ] ) )
        {
            distribution[ platoon ][ team ] = [];
        }
        
        if ( !isdefined( distribution[ platoon ][ team ] ) )
        {
            distribution[ platoon ][ team ] = [];
        }
        else if ( !isarray( distribution[ platoon ][ team ] ) )
        {
            distribution[ platoon ][ team ] = array( distribution[ platoon ][ team ] );
        }
        
        distribution[ platoon ][ team ][ distribution[ platoon ][ team ].size ] = player;
    }
    
    return distribution;
}

// Namespace teams/team_assignment
// Params 1, eflags: 0x4
// Checksum 0x2b8dc4ff, Offset: 0x19c0
// Size: 0x282
function private function_94478182( distribution )
{
    var_dd3d17c1 = [];
    
    foreach ( platoon, platoon_teams in distribution )
    {
        if ( !isdefined( var_dd3d17c1[ platoon ] ) )
        {
            var_dd3d17c1[ platoon ] = [];
        }
        
        for ( i = 1; i < level.maxteamplayers ; i++ )
        {
            var_dd3d17c1[ platoon ][ i ] = [];
        }
    }
    
    foreach ( platoon, platoon_teams in distribution )
    {
        if ( !isdefined( var_dd3d17c1[ platoon ] ) )
        {
            var_dd3d17c1[ platoon ] = [];
        }
        
        foreach ( team, team_players in platoon_teams )
        {
            if ( team_players.size < level.maxteamplayers )
            {
                var_a787dfe7 = function_ee150fcc( team, team_players );
                
                if ( var_a787dfe7 > 0 )
                {
                    if ( !isdefined( var_dd3d17c1[ platoon ][ var_a787dfe7 ] ) )
                    {
                        var_dd3d17c1[ platoon ][ var_a787dfe7 ] = [];
                    }
                    else if ( !isarray( var_dd3d17c1[ platoon ][ var_a787dfe7 ] ) )
                    {
                        var_dd3d17c1[ platoon ][ var_a787dfe7 ] = array( var_dd3d17c1[ platoon ][ var_a787dfe7 ] );
                    }
                    
                    var_dd3d17c1[ platoon ][ var_a787dfe7 ][ var_dd3d17c1[ platoon ][ var_a787dfe7 ].size ] = team;
                }
            }
        }
    }
    
    return var_dd3d17c1;
}

// Namespace teams/team_assignment
// Params 4
// Checksum 0xeca37c2, Offset: 0x1c50
// Size: 0x13e
function function_b25f48bf( for_team, var_a9ab69de, var_d9438b7, var_ed0a1ecc )
{
    foreach ( var_a787dfe7, var_75aa1f3c in var_ed0a1ecc )
    {
        if ( level.maxteamplayers - var_a787dfe7 > var_a9ab69de )
        {
            continue;
        }
        
        if ( var_75aa1f3c.size == 0 )
        {
            continue;
        }
        
        foreach ( team in var_75aa1f3c )
        {
            if ( team == #"none" )
            {
                continue;
            }
            
            if ( team == for_team )
            {
                continue;
            }
            
            return team;
        }
    }
    
    return undefined;
}

// Namespace teams/team_assignment
// Params 2, eflags: 0x4
// Checksum 0xec75617d, Offset: 0x1d98
// Size: 0xb6
function private function_78db0e06( old_team, new_team )
{
    players = getplayers( old_team );
    
    foreach ( player in players )
    {
        player function_dc7eaabd( new_team );
    }
    
    return players.size;
}

// Namespace teams/team_assignment
// Params 0
// Checksum 0xd602e, Offset: 0x1e58
// Size: 0x4b4
function function_a9822793()
{
    if ( getdvarint( #"hash_761d80face4c4459", 0 ) )
    {
        return;
    }
    
    distribution = function_7d93567f();
    var_ed0a1ecc = function_94478182( distribution );
    
    /#
        if ( level.var_ba13fb7a )
        {
            println( "<dev string:x38>" + "<dev string:xab>" );
            function_a9bfa6d6();
            println( "<dev string:x38>" + "<dev string:xbf>" );
        }
    #/
    
    foreach ( platoon, platoon_teams in var_ed0a1ecc )
    {
        println( "<dev string:xdc>" + platoon );
        
        foreach ( var_a787dfe7, var_75aa1f3c in platoon_teams )
        {
            foreach ( index, team in var_75aa1f3c )
            {
                if ( team == #"none" )
                {
                    continue;
                }
                
                current_count = level.maxteamplayers - var_a787dfe7;
                
                while ( current_count < level.maxteamplayers )
                {
                    var_6f782d8f = function_b25f48bf( team, var_a787dfe7, distribution[ platoon ], var_ed0a1ecc[ platoon ] );
                    
                    if ( !isdefined( var_6f782d8f ) )
                    {
                        break;
                    }
                    
                    assert( getplayers( team ).size + getplayers( var_6f782d8f ).size <= level.maxteamplayers );
                    println( "<dev string:xe7>" + var_ed0a1ecc[ platoon ].size );
                    
                    foreach ( var_aacd04cb in var_ed0a1ecc[ platoon ] )
                    {
                        println( "<dev string:xfa>" + var_aacd04cb.size );
                        
                        foreach ( remove_index, var_adeea4a7 in var_aacd04cb )
                        {
                            if ( var_adeea4a7 == var_6f782d8f )
                            {
                                var_aacd04cb[ remove_index ] = #"none";
                            }
                        }
                    }
                    
                    current_count += function_78db0e06( var_6f782d8f, team );
                }
                
                var_75aa1f3c[ index ] = #"none";
            }
        }
    }
    
    /#
        if ( level.var_ba13fb7a )
        {
            println( "<dev string:x38>" + "<dev string:x111>" );
            function_a9bfa6d6();
        }
    #/
}

/#

    // Namespace teams/team_assignment
    // Params 0, eflags: 0x4
    // Checksum 0x298f5252, Offset: 0x2318
    // Size: 0x90, Type: dev
    function private function_a9bfa6d6()
    {
        if ( level.var_ba13fb7a )
        {
            foreach ( team in level.teams )
            {
                self thread function_6c66cc64( team );
            }
        }
    }

    // Namespace teams/team_assignment
    // Params 1, eflags: 0x4
    // Checksum 0x65884ca4, Offset: 0x23b0
    // Size: 0x2f0, Type: dev
    function private function_6c66cc64( team )
    {
        players = getplayers( team );
        
        if ( players.size == 0 )
        {
            return;
        }
        
        team_str = string( team );
        
        if ( isdefined( level.teams[ team ] ) )
        {
            team_str = level.teams[ team ];
        }
        
        voip = "<dev string:x12e>";
        
        if ( isdefined( level.var_75dffa9f[ team ] ) )
        {
            voip += level.var_75dffa9f[ team ] == #"game" ? "<dev string:x136>" : "<dev string:x13d>";
        }
        else
        {
            voip += "<dev string:x146>";
        }
        
        platoon = getteamplatoon( team );
        platoon_name = "<dev string:x152>";
        
        if ( platoon == #"invalid" )
        {
            platoon_name += "<dev string:x15d>";
        }
        else if ( platoon == #"none" )
        {
            platoon_name += "<dev string:x167>";
        }
        else if ( isdefined( level.platoons[ platoon ] ) )
        {
            platoon_name += level.platoons[ platoon ].name;
        }
        
        println( "<dev string:x38>" + "<dev string:x16e>" + platoon_name + "<dev string:x16e>" + team_str + "<dev string:x16e>" + voip );
        
        foreach ( player in players )
        {
            party = player getparty();
            println( "<dev string:x38>" + "<dev string:x172>" + player.name + "<dev string:x177>" + ( party.fill ? "<dev string:x183>" : "<dev string:x189>" ) + "<dev string:x18e>" + party.var_a15e4438 );
        }
    }

    // Namespace teams/team_assignment
    // Params 0
    // Checksum 0xb7abb5f, Offset: 0x26a8
    // Size: 0x40c, Type: dev
    function function_58b6d2c9()
    {
        if ( level.multiteam && level.maxteamplayers > 0 )
        {
            players = getplayers();
            
            foreach ( team in level.teams )
            {
                var_dcbb8617 = getplayers( team );
                
                if ( var_dcbb8617.size > level.maxteamplayers )
                {
                    var_f554d31e = "<dev string:x197>";
                    
                    foreach ( player in var_dcbb8617 )
                    {
                        party = player getparty();
                        var_f554d31e = var_f554d31e + player.name + "<dev string:x19a>" + party.party_id + "<dev string:x1a7>";
                    }
                    
                    assertmsg( "<dev string:x1ab>" + self.name + "<dev string:x1c0>" + ( ishash( team ) ? function_9e72a96( team ) : team ) + "<dev string:x1e5>" + var_dcbb8617.size + "<dev string:x1f9>" + level.maxteamplayers + "<dev string:x1a7>" + var_f554d31e );
                }
            }
            
            if ( !level.custommatch )
            {
                foreach ( player in players )
                {
                    if ( player.team == #"spectator" )
                    {
                        continue;
                    }
                    
                    party = player getparty();
                    
                    foreach ( party_member in party.party_members )
                    {
                        if ( party_member.team == #"spectator" )
                        {
                            continue;
                        }
                        
                        if ( party_member.team != player.team )
                        {
                            assertmsg( "<dev string:x209>" + player.name + "<dev string:x237>" + function_9e72a96( player.team ) + "<dev string:x23c>" + party_member.name + "<dev string:x237>" + function_9e72a96( party_member.team ) + "<dev string:x241>" );
                        }
                    }
                }
            }
        }
    }

    // Namespace teams/team_assignment
    // Params 0
    // Checksum 0x2474ff81, Offset: 0x2ac0
    // Size: 0x144, Type: dev
    function function_1aa0418f()
    {
        while ( true )
        {
            wait 3;
            players = getplayers();
            
            if ( players.size > 0 && players[ 0 ] isstreamerready() )
            {
                setdvar( #"devgui_bot", "<dev string:x247>" );
                wait 3;
                function_a9822793();
                wait 1;
                bots = bot::get_bots();
                
                foreach ( bot in bots )
                {
                    level thread bot::remove_bot( bot );
                }
            }
        }
    }

#/
