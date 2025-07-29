#using script_724752ab26bff81b;
#using scripts\core_common\flag_shared;
#using scripts\zm\zm_white_mee;
#using scripts\zm\zm_white_special_rounds;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_ui_inventory;

#namespace zm_white_devgui;

/#

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0
    // Checksum 0x3be8b162, Offset: 0xa0
    // Size: 0x1c, Type: dev
    function init()
    {
        level thread devgui();
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0x4bf26068, Offset: 0xc8
    // Size: 0x1c, Type: dev
    function private function_3552f301()
    {
        zm_white_mee::function_6af32608();
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0xf8f7f3ef, Offset: 0xf0
    // Size: 0x6c, Type: dev
    function private function_2639784()
    {
        if ( !level flag::get( "<dev string:x38>" ) )
        {
            zm_devgui::zombie_devgui_open_sesame();
        }
        
        level.old_dog_spawn = &zombie_dog_util::function_62db7b1c;
        zm_white_special_rounds::function_6acd363d( 1 );
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0x96d0a16c, Offset: 0x168
    // Size: 0x108, Type: dev
    function private function_3db5079()
    {
        if ( !level flag::get( #"hash_40856b65dff0f6eb" ) )
        {
            function_2639784();
        }
        
        foreach ( var_ab611263 in level.var_d4a0b9f4 )
        {
            if ( var_ab611263[ #"goo_state" ] == #"active" )
            {
                var_ab611263[ #"gas_cloud" ] zm_white_special_rounds::function_27a8604b( var_ab611263[ #"group" ] );
            }
        }
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0x31b3069f, Offset: 0x278
    // Size: 0x470, Type: dev
    function private devgui()
    {
        adddebugcommand( "<dev string:x43>" );
        adddebugcommand( "<dev string:x97>" );
        adddebugcommand( "<dev string:xea>" );
        adddebugcommand( "<dev string:x141>" );
        adddebugcommand( "<dev string:x191>" );
        adddebugcommand( "<dev string:x1e5>" );
        adddebugcommand( "<dev string:x245>" );
        adddebugcommand( "<dev string:x2a5>" );
        adddebugcommand( "<dev string:x305>" );
        
        while ( true )
        {
            waitframe( 1 );
            str_command = getdvarstring( #"zm_white_debug_cmd", "<dev string:x365>" );
            
            switch ( str_command )
            {
                case #"perk1":
                    function_3552f301();
                    break;
                case #"skip1":
                    function_2639784();
                    break;
                case #"skip2":
                    function_3db5079();
                    break;
                case #"skip3":
                    function_3db5079();
                    namespace_a01a2431::function_256cc56e();
                    break;
                case #"cheat1":
                    iprintlnbold( "<dev string:x368>" + level.var_276bd207[ 0 ] + level.var_276bd207[ 1 ] + level.var_276bd207[ 2 ] + level.var_276bd207[ 3 ] );
                    break;
                case #"hash_67d502f654392103":
                    e_player = getplayers()[ 0 ];
                    zm_ui_inventory::function_7df6bb60( "<dev string:x376>", 0, e_player );
                    zm_ui_inventory::function_7df6bb60( "<dev string:x38e>", 2, e_player );
                    e_player.var_f7694097 = 0;
                    break;
                case #"hash_67d510f6543938cd":
                    e_player = getplayers()[ 0 ];
                    zm_ui_inventory::function_7df6bb60( "<dev string:x376>", 1, e_player );
                    zm_ui_inventory::function_7df6bb60( "<dev string:x3a6>", 2, e_player );
                    e_player.var_f7694097 = 1;
                    break;
                case #"hash_67d50ff65439371a":
                    e_player = getplayers()[ 0 ];
                    zm_ui_inventory::function_7df6bb60( "<dev string:x376>", 2, e_player );
                    zm_ui_inventory::function_7df6bb60( "<dev string:x3be>", 2, e_player );
                    e_player.var_f7694097 = 2;
                    break;
                case #"hash_67d50ef654393567":
                    e_player = getplayers()[ 0 ];
                    zm_ui_inventory::function_7df6bb60( "<dev string:x376>", 3, e_player );
                    zm_ui_inventory::function_7df6bb60( "<dev string:x3d6>", 2, e_player );
                    e_player.var_f7694097 = 3;
                    break;
            }
            
            setdvar( #"zm_white_debug_cmd", "<dev string:x365>" );
        }
    }

#/
