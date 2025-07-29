#using scripts\core_common\bots\bot;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\rat_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\item_world;
#using scripts\mp_common\laststand_warzone;

#namespace rat;

/#

    // Namespace rat/wz_rat
    // Params 0, eflags: 0x2
    // Checksum 0xde25b7c6, Offset: 0xa8
    // Size: 0x3c, Type: dev
    function autoexec __init__system__()
    {
        system::register( #"wz_rat", &__init__, undefined, undefined );
    }

    // Namespace rat/wz_rat
    // Params 0
    // Checksum 0x679306e2, Offset: 0xf0
    // Size: 0x18c, Type: dev
    function __init__()
    {
        init();
        level.rat.common.gethostplayer = &util::gethostplayer;
        level.rat.deathcount = 0;
        addratscriptcmd( "<dev string:x38>", &function_70f41194 );
        addratscriptcmd( "<dev string:x54>", &function_31980089 );
        addratscriptcmd( "<dev string:x65>", &function_1251949b );
        addratscriptcmd( "<dev string:x79>", &function_684893c8 );
        addratscriptcmd( "<dev string:x8b>", &function_7eabbc02 );
        addratscriptcmd( "<dev string:x98>", &function_d50abf44 );
        addratscriptcmd( "<dev string:xaa>", &function_89684f6a );
        setdvar( #"rat_death_count", 0 );
    }

    // Namespace rat/wz_rat
    // Params 1
    // Checksum 0x1a717484, Offset: 0x288
    // Size: 0x1e, Type: dev
    function function_d50abf44( params )
    {
        return level.players.size;
    }

    // Namespace rat/wz_rat
    // Params 1
    // Checksum 0xeda96be4, Offset: 0x2b0
    // Size: 0x166, Type: dev
    function function_7eabbc02( params )
    {
        remaining = 0;
        host = [[ level.rat.common.gethostplayer ]]();
        hostteam = host.team;
        
        if ( isdefined( params.remaining ) )
        {
            remaining = int( params.remaining );
        }
        
        if ( isdefined( level.players ) )
        {
            for ( i = 0; i < level.players.size ; i++ )
            {
                if ( level.players.size <= remaining )
                {
                    break;
                }
                
                if ( !isdefined( level.players[ i ].bot ) || level.players[ i ].team == hostteam || level.players[ i ].team == "<dev string:xc0>" )
                {
                    continue;
                }
                
                bot::remove_bot( level.players[ i ] );
            }
        }
    }

    // Namespace rat/wz_rat
    // Params 1
    // Checksum 0xfd0a82db, Offset: 0x420
    // Size: 0xb6, Type: dev
    function function_684893c8( params )
    {
        count = 0;
        
        if ( isdefined( level.players ) )
        {
            foreach ( player in level.players )
            {
                if ( player laststand::player_is_in_laststand() )
                {
                    count++;
                }
            }
        }
        
        return count;
    }

    // Namespace rat/wz_rat
    // Params 1
    // Checksum 0xf6106324, Offset: 0x4e0
    // Size: 0x4c, Type: dev
    function function_1251949b( params )
    {
        player = [[ level.rat.common.gethostplayer ]]();
        return player laststand::player_is_in_laststand();
    }

    // Namespace rat/wz_rat
    // Params 1
    // Checksum 0x7aac4e6, Offset: 0x538
    // Size: 0x50, Type: dev
    function function_70f41194( params )
    {
        player = [[ level.rat.common.gethostplayer ]]();
        return player.inventory.var_c212de25;
    }

    // Namespace rat/wz_rat
    // Params 1
    // Checksum 0x21b6307, Offset: 0x590
    // Size: 0x248, Type: dev
    function function_31980089( params )
    {
        player = [[ level.rat.common.gethostplayer ]]();
        numitems = 1000;
        distance = 1000;
        name = "<dev string:xc7>";
        
        if ( isdefined( params.var_1d978d3 ) )
        {
            numitems = int( params.var_1d978d3 );
        }
        
        if ( isdefined( params.distance ) )
        {
            distance = int( params.distance );
        }
        
        if ( isdefined( params.name ) )
        {
            name = params.name;
        }
        
        items = item_world::function_2e3efdda( player.origin, undefined, numitems, distance );
        
        foreach ( item in items )
        {
            if ( item.itementry.name == "<dev string:xca>" )
            {
                continue;
            }
            
            if ( isdefined( params.handler ) )
            {
                if ( params.handler != item.itementry.handler && params.handler != "<dev string:xe1>" )
                {
                    continue;
                }
            }
            
            if ( name == "<dev string:xc7>" || item.itementry.name == name )
            {
                function_55e20e75( params._id, item.origin );
            }
        }
    }

    // Namespace rat/wz_rat
    // Params 1
    // Checksum 0x3b323a28, Offset: 0x7e0
    // Size: 0x62, Type: dev
    function function_89684f6a( params )
    {
        player = [[ level.rat.common.gethostplayer ]]();
        return player.inventory.items[ 10 ].networkid != 32767;
    }

#/
