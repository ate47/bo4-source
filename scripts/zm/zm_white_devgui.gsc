// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_white_mee.gsc;
#using script_724752ab26bff81b;
#using scripts\zm\zm_white_special_rounds.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using script_ab862743b3070a;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_white_devgui;

/#

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x3be8b162, Offset: 0xa0
    // Size: 0x1c
    function init() {
        level thread devgui();
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0x4bf26068, Offset: 0xc8
    // Size: 0x1c
    function private function_3552f301() {
        zm_white_mee::function_6af32608();
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0xf8f7f3ef, Offset: 0xf0
    // Size: 0x6c
    function private function_2639784() {
        if (!level flag::get("<unknown string>")) {
            zm_devgui::zombie_devgui_open_sesame();
        }
        level.old_dog_spawn = &zombie_dog_util::function_62db7b1c;
        zm_white_special_rounds::function_6acd363d(1);
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0x96d0a16c, Offset: 0x168
    // Size: 0x108
    function private function_3db5079() {
        if (!level flag::get(#"hash_40856b65dff0f6eb")) {
            function_2639784();
        }
        foreach (var_ab611263 in level.var_d4a0b9f4) {
            if (var_ab611263[#"goo_state"] == #"active") {
                var_ab611263[#"gas_cloud"] zm_white_special_rounds::function_27a8604b(var_ab611263[#"group"]);
            }
        }
    }

    // Namespace zm_white_devgui/zm_white_devgui
    // Params 0, eflags: 0x4
    // Checksum 0x31b3069f, Offset: 0x278
    // Size: 0x470
    function private devgui() {
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        while (true) {
            waitframe(1);
            str_command = getdvarstring(#"zm_white_debug_cmd", "<unknown string>");
            switch (str_command) {
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
                iprintlnbold("<unknown string>" + level.var_276bd207[0] + level.var_276bd207[1] + level.var_276bd207[2] + level.var_276bd207[3]);
                break;
            case #"hash_67d502f654392103":
                e_player = getplayers()[0];
                zm_ui_inventory::function_7df6bb60("<unknown string>", 0, e_player);
                zm_ui_inventory::function_7df6bb60("<unknown string>", 2, e_player);
                e_player.var_f7694097 = 0;
                break;
            case #"hash_67d510f6543938cd":
                e_player = getplayers()[0];
                zm_ui_inventory::function_7df6bb60("<unknown string>", 1, e_player);
                zm_ui_inventory::function_7df6bb60("<unknown string>", 2, e_player);
                e_player.var_f7694097 = 1;
                break;
            case #"hash_67d50ff65439371a":
                e_player = getplayers()[0];
                zm_ui_inventory::function_7df6bb60("<unknown string>", 2, e_player);
                zm_ui_inventory::function_7df6bb60("<unknown string>", 2, e_player);
                e_player.var_f7694097 = 2;
                break;
            case #"hash_67d50ef654393567":
                e_player = getplayers()[0];
                zm_ui_inventory::function_7df6bb60("<unknown string>", 3, e_player);
                zm_ui_inventory::function_7df6bb60("<unknown string>", 2, e_player);
                e_player.var_f7694097 = 3;
                break;
            }
            setdvar(#"zm_white_debug_cmd", "<unknown string>");
        }
    }

#/
