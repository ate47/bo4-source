#using scripts\zm\zm_orange_mq_sendoff;
#using scripts\zm\zm_orange_challenges;
#using scripts\zm\zm_orange_ee_dynamite;
#using scripts\zm\zm_orange_zones;
#using scripts\zm\zm_orange_mq_hell;
#using scripts\zm\zm_orange_pap;
#using scripts\zm\zm_orange_fasttravel_ziplines;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_devgui;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;

#namespace zm_orange_devgui;

/#

    // Namespace zm_orange_devgui/zm_orange_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x60da2a13, Offset: 0xd0
    // Size: 0x1c
    function init() {
        level thread devgui();
    }

    // Namespace zm_orange_devgui/zm_orange_devgui
    // Params 1, eflags: 0x4
    // Checksum 0x58721bff, Offset: 0xf8
    // Size: 0x6c
    function private jump_to(str_dest) {
        s_dest = struct::get(str_dest);
        self setorigin(s_dest.origin);
        self setplayerangles(s_dest.angles);
    }

    // Namespace zm_orange_devgui/zm_orange_devgui
    // Params 0, eflags: 0x4
    // Checksum 0x591a5e3, Offset: 0x170
    // Size: 0x8a8
    function private devgui() {
        adddebugcommand("<dev string:x38>");
        adddebugcommand("<dev string:x8a>");
        adddebugcommand("<dev string:xde>");
        adddebugcommand("<dev string:x14e>");
        adddebugcommand("<dev string:x1b9>");
        adddebugcommand("<dev string:x218>");
        adddebugcommand("<dev string:x26f>");
        adddebugcommand("<dev string:x2c4>");
        adddebugcommand("<dev string:x31d>");
        adddebugcommand("<dev string:x376>");
        adddebugcommand("<dev string:x3d5>");
        adddebugcommand("<dev string:x42c>");
        adddebugcommand("<dev string:x490>");
        adddebugcommand("<dev string:x4f6>");
        adddebugcommand("<dev string:x570>");
        adddebugcommand("<dev string:x5e1>");
        adddebugcommand("<dev string:x651>");
        adddebugcommand("<dev string:x6c8>");
        adddebugcommand("<dev string:x722>");
        adddebugcommand("<dev string:x784>");
        adddebugcommand("<dev string:x7d6>");
        adddebugcommand("<dev string:x83e>");
        adddebugcommand("<dev string:x891>");
        while (true) {
            waitframe(1);
            str_command = getdvarstring(#"zm_orange_debug_cmd", "<dev string:x8e8>");
            switch (str_command) {
            case #"hash_78bca375c84177d4":
                getplayers()[0] jump_to("<dev string:x8eb>");
                break;
            case #"hash_18769c2b6ae60247":
                level thread zm_orange_fasttravel_ziplines::function_80a9077f();
                break;
            case #"hash_24668a82eef6ed20":
                level thread zm_orange_pap::function_79946aff();
                break;
            case #"lava_toggle":
                zm_orange_mq_hell::lava_control();
                break;
            case #"hash_75c01ef1f8005214":
                iprintln("<dev string:x8f9>");
                level flag::set(#"soul_fill");
                break;
            case #"hash_7db70cb23b9d2739":
                iprintln("<dev string:x917>");
                level flag::clear(#"soul_fill");
                break;
            case #"hash_58843c67593e2cfe":
                zm_orange_challenges::function_e4b04738();
                break;
            case #"test_last_stand":
                zm_devgui::zombie_devgui_open_sesame();
                zm_orange_fasttravel_ziplines::function_80a9077f();
                zm_orange_zones::function_3b77181c(1);
                if (level flag::get(#"hash_6f7fd3d4d070db87") == 0) {
                    exploder::exploder("<dev string:x936>");
                    level.var_9cc989a5 delete();
                    level flag::set(#"hash_6f7fd3d4d070db87");
                }
                zm_orange_mq_hell::function_405f867d();
                break;
            case #"hash_1ff4cd3ce63b00f9":
                zm_orange_ee_dynamite::function_61511fcf(0);
                zm_orange_ee_dynamite::function_61511fcf(1);
                zm_orange_ee_dynamite::function_61511fcf(2);
                break;
            case #"hash_3c6c8aaf444d0e1a":
                level flag::set(#"hash_98e32feb5b8ac79");
                break;
            case #"hash_4f92a974297244f1":
                if (!isdefined(level.var_969fe3f1)) {
                    level.var_969fe3f1 = 0;
                }
                level.var_969fe3f1 = !level.var_969fe3f1;
                break;
            case #"hash_78366ec4a1968af6":
                foreach (item in level.var_50e4c504) {
                    item show();
                }
                break;
            case #"play_portal":
                level thread zm_orange_mq_sendoff::function_d096f18f();
                break;
            case #"hash_86a620951049404":
                zm_orange_mq_hell::function_fe36418c();
                break;
            case #"move_pap_boathouse":
                zm_orange_pap::function_ccc079bc("<dev string:x953>");
                break;
            case #"move_pap_beach":
                zm_orange_pap::function_ccc079bc("<dev string:x963>");
                break;
            case #"move_pap_ship":
                zm_orange_pap::function_ccc079bc("<dev string:x96f>");
                break;
            case #"move_pap_lagoon":
                zm_orange_pap::function_ccc079bc("<dev string:x97a>");
                break;
            case #"hash_7bfd0d4950600d9a":
                zm_orange_pap::function_ccc079bc("<dev string:x987>");
                break;
            case #"full_unlock":
                zm_devgui::zombie_devgui_open_sesame();
                zm_orange_fasttravel_ziplines::function_80a9077f();
                zm_orange_zones::function_3b77181c(1);
                level thread zm_sq::function_f2dd8601(#"pap_rock", 1);
                break;
            case #"hash_2918cc0fd8ab72cd":
                level thread zm_orange_pap::function_eaaea036();
                break;
            case #"hash_3da3831f62e16b2c":
                level thread zm_orange_pap::function_96ef31b7();
                break;
            case #"test_hell":
                zm_orange_mq_hell::test_hell();
                break;
            }
            setdvar(#"zm_orange_debug_cmd", "<dev string:x8e8>");
        }
    }

#/
