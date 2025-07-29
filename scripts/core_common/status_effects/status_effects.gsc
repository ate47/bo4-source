#using scripts\core_common\callbacks_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace status_effect;

// Namespace status_effect/status_effects
// Params 0, eflags: 0x2
// Checksum 0xc6d6e42a, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"status_effects", &__init__, undefined, undefined );
}

// Namespace status_effect/status_effects
// Params 0
// Checksum 0xddb9498c, Offset: 0xd0
// Size: 0x7c
function __init__()
{
    callback::on_connect( &on_player_connect );
    callback::on_disconnect( &on_player_disconnect );
    callback::on_end_game( &on_end_game );
    
    /#
        level thread status_effects_init();
    #/
}

// Namespace status_effect/status_effects
// Params 0
// Checksum 0x6f49628f, Offset: 0x158
// Size: 0x34
function on_player_connect()
{
    if ( !isdefined( self._gadgets_player ) )
    {
        self._gadgets_player = [];
    }
    
    /#
        self thread status_effects_devgui_player_connect();
    #/
}

// Namespace status_effect/status_effects
// Params 0
// Checksum 0x416c84c8, Offset: 0x198
// Size: 0x1c
function on_player_disconnect()
{
    /#
        self thread status_effects_devgui_player_disconnect();
    #/
}

// Namespace status_effect/status_effects
// Params 0
// Checksum 0xaf45c0ac, Offset: 0x1c0
// Size: 0x80
function on_end_game()
{
    foreach ( player in level.players )
    {
        player thread function_6519f95f();
    }
}

/#

    // Namespace status_effect/status_effects
    // Params 0
    // Checksum 0xca7499a4, Offset: 0x248
    // Size: 0xe4, Type: dev
    function status_effects_init()
    {
        setdvar( #"scr_status_effects_devgui_cmd", "<dev string:x38>" );
        setdvar( #"scr_status_effects_devgui_arg", 0 );
        setdvar( #"scr_status_effects_devgui_player", 0 );
        
        if ( isdedicated() )
        {
            return;
        }
        
        level.status_effects_devgui_base = "<dev string:x3b>";
        level.status_effects_devgui_player_connect = &status_effects_devgui_player_connect;
        level.status_effects_devgui_player_disconnect = &status_effects_devgui_player_disconnect;
        level thread status_effects_devgui_think();
    }

    // Namespace status_effect/status_effects
    // Params 0
    // Checksum 0x9edf9d13, Offset: 0x338
    // Size: 0x5c, Type: dev
    function status_effects_devgui_player_disconnect()
    {
        if ( !isdefined( level.status_effects_devgui_base ) )
        {
            return;
        }
        
        remove_cmd_with_root = "<dev string:x56>" + level.status_effects_devgui_base + self.playername + "<dev string:x67>";
        util::add_queued_debug_command( remove_cmd_with_root );
    }

    // Namespace status_effect/status_effects
    // Params 0
    // Checksum 0xfe4ec3f8, Offset: 0x3a0
    // Size: 0x108, Type: dev
    function status_effects_devgui_player_connect()
    {
        if ( !isdefined( level.status_effects_devgui_base ) )
        {
            return;
        }
        
        players = getplayers();
        
        for ( i = 0; i < players.size ; i++ )
        {
            if ( players[ i ] != self )
            {
                continue;
            }
            
            status_effects_devgui_add_player_status_effects( level.status_effects_devgui_base, players[ i ].playername, i + 1 );
            status_effects_devgui_add_player_grenades( level.status_effects_devgui_base, players[ i ].playername, i + 1 );
            function_2a302935( level.status_effects_devgui_base, players[ i ].playername, i + 1 );
            return;
        }
    }

    // Namespace status_effect/status_effects
    // Params 3
    // Checksum 0x6c7c695, Offset: 0x4b0
    // Size: 0x8c, Type: dev
    function function_2a302935( root, pname, index )
    {
        add_cmd_with_root = "<dev string:x6d>" + root + pname + "<dev string:x7b>";
        pid = "<dev string:x38>" + index;
        status_effects_devgui_add_player_command( add_cmd_with_root, pid, "<dev string:x7f>", "<dev string:x95>", undefined );
    }

    // Namespace status_effect/status_effects
    // Params 3
    // Checksum 0xef073c36, Offset: 0x548
    // Size: 0x11e, Type: dev
    function status_effects_devgui_add_player_status_effects( root, pname, index )
    {
        add_cmd_with_root = "<dev string:x6d>" + root + pname + "<dev string:xa1>";
        pid = "<dev string:x38>" + index;
        
        if ( isdefined( level.var_233471d2 ) )
        {
            for ( i = 0; i < level.var_233471d2.size ; i++ )
            {
                if ( !isdefined( level.var_233471d2[ i ] ) )
                {
                    println( "<dev string:xb4>" + i );
                }
                
                if ( isdefined( level.var_233471d2[ i ].var_18d16a6b ) )
                {
                    status_effects_devgui_add_player_command( add_cmd_with_root, pid, level.var_233471d2[ i ].var_18d16a6b, "<dev string:x133>", i );
                }
            }
        }
    }

    // Namespace status_effect/status_effects
    // Params 3
    // Checksum 0xe255fb99, Offset: 0x670
    // Size: 0x136, Type: dev
    function status_effects_devgui_add_player_grenades( root, pname, index )
    {
        add_cmd_with_root = "<dev string:x6d>" + root + pname + "<dev string:x140>";
        pid = "<dev string:x38>" + index;
        
        if ( isdefined( level.var_233471d2 ) )
        {
            for ( i = 0; i < level.var_233471d2.size ; i++ )
            {
                if ( !isdefined( level.var_233471d2[ i ] ) )
                {
                    println( "<dev string:x153>" + i );
                }
                
                if ( isdefined( level.var_233471d2[ i ].var_18d16a6b ) )
                {
                    grenade = "<dev string:x1da>" + level.var_233471d2[ i ].var_18d16a6b;
                    status_effects_devgui_add_player_command( add_cmd_with_root, pid, grenade, "<dev string:x1f3>", grenade );
                }
            }
        }
    }

    // Namespace status_effect/status_effects
    // Params 5
    // Checksum 0xa064652d, Offset: 0x7b0
    // Size: 0xc4, Type: dev
    function status_effects_devgui_add_player_command( root, pid, cmdname, cmddvar, argdvar )
    {
        if ( !isdefined( argdvar ) )
        {
            argdvar = "<dev string:x202>";
        }
        
        adddebugcommand( root + cmdname + "<dev string:x20c>" + "<dev string:x216>" + "<dev string:x239>" + pid + "<dev string:x23d>" + "<dev string:x245>" + "<dev string:x239>" + cmddvar + "<dev string:x23d>" + "<dev string:x265>" + "<dev string:x239>" + argdvar + "<dev string:x67>" );
    }

    // Namespace status_effect/status_effects
    // Params 0
    // Checksum 0x4b1c36db, Offset: 0x880
    // Size: 0x178, Type: dev
    function status_effects_devgui_think()
    {
        for ( ;; )
        {
            cmd = getdvarstring( #"scr_status_effects_devgui_cmd" );
            
            if ( cmd == "<dev string:x38>" )
            {
                waitframe( 1 );
                continue;
            }
            
            pid = getdvarint( #"scr_status_effects_devgui_player", 0 );
            
            switch ( cmd )
            {
                case #"set_active":
                    status_effects_set_active_effect( pid );
                    break;
                case #"give_grenade":
                    status_effects_give_grenade( pid );
                    break;
                case #"clear_all":
                    function_64ba1c7e( pid );
                default:
                    break;
            }
            
            setdvar( #"scr_status_effects_devgui_cmd", "<dev string:x38>" );
            setdvar( #"scr_status_effects_devgui_arg", "<dev string:x38>" );
            wait 0.5;
        }
    }

    // Namespace status_effect/status_effects
    // Params 1
    // Checksum 0x1c14dd52, Offset: 0xa00
    // Size: 0x54, Type: dev
    function function_64ba1c7e( pid )
    {
        player = getplayers()[ pid - 1 ];
        
        if ( isdefined( player ) )
        {
            player function_6519f95f();
        }
    }

    // Namespace status_effect/status_effects
    // Params 1
    // Checksum 0x27c011e4, Offset: 0xa60
    // Size: 0x8c, Type: dev
    function status_effects_set_active_effect( pid )
    {
        arg = getdvarint( #"scr_status_effects_devgui_arg", 0 );
        player = getplayers()[ pid - 1 ];
        
        if ( isdefined( player ) )
        {
            player function_e2bff3ce( arg, undefined, player );
        }
    }

    // Namespace status_effect/status_effects
    // Params 1
    // Checksum 0x5b1b38f4, Offset: 0xaf8
    // Size: 0x20c, Type: dev
    function status_effects_give_grenade( pid )
    {
        arg = getdvarstring( #"scr_status_effects_devgui_arg" );
        player = getplayers()[ pid - 1 ];
        
        if ( isdefined( player ) )
        {
            weapon = getweapon( arg );
            grenades = 0;
            pweapons = player getweaponslist();
            
            foreach ( pweapon in pweapons )
            {
                if ( pweapon != weapon && pweapon.isgrenadeweapon )
                {
                    grenades++;
                }
            }
            
            if ( grenades > 1 )
            {
                foreach ( pweapon in pweapons )
                {
                    if ( pweapon != weapon && pweapon.isgrenadeweapon )
                    {
                        grenades--;
                        player takeweapon( pweapon );
                        
                        if ( grenades < 2 )
                        {
                            break;
                        }
                    }
                }
            }
            
            player giveweapon( weapon );
        }
    }

#/
