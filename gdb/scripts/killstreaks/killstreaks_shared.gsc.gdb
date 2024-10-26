NAME scripts\killstreaks\killstreaks_shared.gsc
VERSION 0
CHECKSUM 0xb392ee52
######################################################
####################  DEV STRINGS  ###################
######################################################
# killstreaks::register@b0 killstreaks::trigger_killstreak@24
STRING "<dev string:x114>" 0xfd8 0x6ce4
# killstreaks::function_7e46eaea@54
STRING "<dev string:x13e>" 0x19e4
# killstreaks::function_7e46eaea@74
STRING "<dev string:x174>" 0x1a04
# killstreaks::function_1110a5de@d4
STRING "<dev string:x1b9>" 0x1bec
# killstreaks::function_181f96a6@3c
STRING "<dev string:x1fd>" 0x1ea4
# killstreaks::register_remote_override_weapon@4c
STRING "<dev string:x245>" 0x20e4
# killstreaks::register_dev_dvars@3c killstreaks::register_dev_debug_dvar@3c killstreaks::devgui_scorestreak_command@5c killstreaks::should_not_timeout@3c
STRING "<dev string:x299>" 0x22c4 0x2404 0x2784 0xcdac
# killstreaks::register_dev_dvars@64 killstreaks::register_dev_dvars@94 killstreaks::register_dev_dvars@c4 killstreaks::register_dev_debug_dvar@64
STRING "<dev string:x2df>" 0x22ec 0x231c 0x234c 0x242c
# killstreaks::register_dev_dvars@70
STRING "<dev string:x2e6>" 0x22f8
# killstreaks::register_dev_dvars@a0
STRING "<dev string:x2ee>" 0x2328
# killstreaks::register_dev_dvars@d0
STRING "<dev string:x2fb>" 0x2358
# killstreaks::register_dev_debug_dvar@70
STRING "<dev string:x308>" 0x2438
# killstreaks::register_devgui@78
STRING "<dev string:x311>" 0x2508
# killstreaks::register_devgui@84
STRING "<dev string:x318>" 0x2514
# killstreaks::devgui_scorestreak_command_givedvar@24
STRING "<dev string:x325>" 0x25f4
# killstreaks::devgui_scorestreak_command_givedvar@30
STRING "<dev string:x32c>" 0x2600
# killstreaks::devgui_scorestreak_command_timeoutdvar@1c
STRING "<dev string:x331>" 0x264c
# killstreaks::devgui_scorestreak_command_debugdvar@1c
STRING "<dev string:x33c>" 0x268c
# killstreaks::devgui_scorestreak_command@84
STRING "<dev string:x344>" 0x27ac
# killstreaks::devgui_scorestreak_command@b0
STRING "<dev string:x363>" 0x27d8
# killstreaks::devgui_scorestreak_command@c0
STRING "<dev string:x368>" 0x27e8
# killstreaks::devgui_scorestreak_command@d0
STRING "<dev string:x36d>" 0x27f8
# killstreaks::devgui_scorestreak_command@e0
STRING "<dev string:x373>" 0x2808
# killstreaks::function_2459bd2f@10
STRING "<dev string:x379>" 0x28e8
# killstreaks::register_ui@34
STRING "<dev string:x38>" 0xadc
# killstreaks::give_if_streak_count_matches@64
STRING "<dev string:x3e8>" 0x2b64
# killstreaks::give_if_streak_count_matches@88
STRING "<dev string:x401>" 0x2b88
# killstreaks::give_if_streak_count_matches@94
STRING "<dev string:x419>" 0x2b94
# killstreaks::give_if_streak_count_matches@c8
STRING "<dev string:x41d>" 0x2bc8
# killstreaks::remove_when_done@b8
STRING "<dev string:x43a>" 0x5280
# killstreaks::get_first_valid_killstreak_alt_weapon@1c
STRING "<dev string:x449>" 0x6f6c
# killstreaks::get_killstreak_usage_by_killstreak@14
STRING "<dev string:x466>" 0x7cac
# killstreaks::killstreak_data_dump@44
STRING "<dev string:x4af>" 0x81fc
# killstreaks::killstreak_data_dump@60
STRING "<dev string:x4d1>" 0x8218
# killstreaks::killstreak_data_dump@78
STRING "<dev string:x4ef>" 0x8230
# killstreaks::killstreak_data_dump@f8 killstreaks::killstreak_data_dump@120 killstreaks::killstreak_data_dump@150 killstreaks::killstreak_data_dump@1e0 killstreaks::killstreak_data_dump@214 killstreaks::killstreak_data_dump@2b0 killstreaks::killstreak_data_dump@2e4
STRING "<dev string:x557>" 0x82b0 0x82d8 0x8308 0x8398 0x83cc 0x8468 0x849c
# killstreaks::killstreak_data_dump@328
STRING "<dev string:x55b>" 0x84e0
# killstreaks::configure_team_internal@64
STRING "<dev string:x57d>" 0xbc5c
# killstreaks::register_ui@164 killstreaks::killstreak_debug_think@14 killstreaks::killstreak_debug_think@a0 killstreaks::killstreak_debug_think@b0 killstreaks::killstreak_data_dump@308
STRING "<dev string:x74>" 0xc0c 0x80e4 0x8170 0x8180 0x84c0
# killstreaks::killstreak_init@14 killstreaks::register_weapon@38 killstreaks::register_vehicle@1c killstreaks::function_1110a5de@b4 killstreaks::function_181f96a6@1c killstreaks::register_remote_override_weapon@2c killstreaks::register_dev_dvars@18 killstreaks::register_dev_debug_dvar@18 killstreaks::devgui_scorestreak_command@38 killstreaks::should_draw_debug@18 killstreaks::should_not_timeout@18
STRING "<dev string:x77>" 0xc54 0xdc0 0xe9c 0x1bcc 0x1e84 0x20c4 0x22a0 0x23e0 0x2760 0x2848 0xcd88
# killstreaks::killstreak_init@34
STRING "<dev string:xb2>" 0xc74
# killstreaks::killstreak_init@40
STRING "<dev string:xc0>" 0xc80
# killstreaks::register_weapon@8c killstreaks::register_vehicle@3c
STRING "<dev string:xd6>" 0xe14 0xebc
######################################################
####################  DEV BLOCKS  ####################
######################################################
# killstreaks::register_ui@2a
DEVBLOCK 0xad2
# killstreaks::register_ui@11c
DEVBLOCK 0xbc4
# killstreaks::killstreak_init@a
DEVBLOCK 0xc4a
# killstreaks::killstreak_init@2a
DEVBLOCK 0xc6a
# killstreaks::register_weapon@30
DEVBLOCK 0xdb8
# killstreaks::register_weapon@52
DEVBLOCK 0xdda
# killstreaks::register_weapon@82
DEVBLOCK 0xe0a
# killstreaks::register_vehicle@12
DEVBLOCK 0xe92
# killstreaks::register_vehicle@32
DEVBLOCK 0xeb2
# killstreaks::register@a6
DEVBLOCK 0xfce
# killstreaks::function_7e46eaea@4a
DEVBLOCK 0x19da
# killstreaks::function_7e46eaea@6a
DEVBLOCK 0x19fa
# killstreaks::function_1110a5de@aa
DEVBLOCK 0x1bc2
# killstreaks::function_1110a5de@ca
DEVBLOCK 0x1be2
# killstreaks::function_181f96a6@12
DEVBLOCK 0x1e7a
# killstreaks::function_181f96a6@32
DEVBLOCK 0x1e9a
# killstreaks::register_remote_override_weapon@22
DEVBLOCK 0x20ba
# killstreaks::register_remote_override_weapon@42
DEVBLOCK 0x20da
# killstreaks::register_dev_dvars@a
DEVBLOCK 0x2292
# killstreaks::register_dev_dvars@e
DEVBLOCK 0x2296
# killstreaks::register_dev_dvars@32
DEVBLOCK 0x22ba
# killstreaks::register_dev_debug_dvar@a
DEVBLOCK 0x23d2
# killstreaks::register_dev_debug_dvar@e
DEVBLOCK 0x23d6
# killstreaks::register_dev_debug_dvar@32
DEVBLOCK 0x23fa
# killstreaks::register_devgui@1a
DEVBLOCK 0x24aa
# killstreaks::devgui_scorestreak_command_givedvar@1a
DEVBLOCK 0x25ea
# killstreaks::devgui_scorestreak_command_timeoutdvar@12
DEVBLOCK 0x2642
# killstreaks::devgui_scorestreak_command_debugdvar@12
DEVBLOCK 0x2682
# killstreaks::devgui_scorestreak_command@2a
DEVBLOCK 0x2752
# killstreaks::devgui_scorestreak_command@2e
DEVBLOCK 0x2756
# killstreaks::devgui_scorestreak_command@52
DEVBLOCK 0x277a
# killstreaks::should_draw_debug@a
DEVBLOCK 0x283a
# killstreaks::should_draw_debug@e
DEVBLOCK 0x283e
# killstreaks::function_2459bd2f@2
DEVBLOCK 0x28da
# killstreaks::function_2459bd2f@6
DEVBLOCK 0x28de
# killstreaks::get_menu_name@a
DEVBLOCK 0x2982
# killstreaks::give_if_streak_count_matches@52
DEVBLOCK 0x2b52
# killstreaks::remove_when_done@b0
DEVBLOCK 0x5278
# killstreaks::get_killstreak_momentum_cost@6c
DEVBLOCK 0x5fd4
# killstreaks::function_4f415d8e@50
DEVBLOCK 0x6238
# killstreaks::trigger_killstreak@1a
DEVBLOCK 0x6cda
# killstreaks::get_first_valid_killstreak_alt_weapon@12
DEVBLOCK 0x6f62
# killstreaks::play_taacom_dialog_response@22
DEVBLOCK 0x78b2
# killstreaks::play_taacom_dialog_response@3a
DEVBLOCK 0x78ca
# killstreaks::player_killstreak_threat_tracking@62
DEVBLOCK 0x7982
# killstreaks::get_killstreak_usage_by_killstreak@a
DEVBLOCK 0x7ca2
# killstreaks::killstreak_debug_think@a
DEVBLOCK 0x80da
# killstreaks::killstreak_data_dump@3a
DEVBLOCK 0x81f2
# killstreaks::killstreak_data_dump@182
DEVBLOCK 0x833a
# killstreaks::killstreak_data_dump@242
DEVBLOCK 0x83fa
# killstreaks::defaulthackedhealthupdatecallback@20
DEVBLOCK 0xb838
# killstreaks::defaulthackedhealthupdatecallback@42
DEVBLOCK 0xb85a
# killstreaks::defaulthackedhealthupdatecallback@62
DEVBLOCK 0xb87a
# killstreaks::configure_team_internal@54
DEVBLOCK 0xbc4c
# killstreaks::configure_team_internal@5c
DEVBLOCK 0xbc54
# killstreaks::should_not_timeout@a
DEVBLOCK 0xcd7a
# killstreaks::should_not_timeout@e
DEVBLOCK 0xcd7e
# killstreaks::should_not_timeout@32
DEVBLOCK 0xcda2
# killstreaks::waitfortimeout@3a
DEVBLOCK 0xce8a
# killstreaks::add_ricochet_protection@30
DEVBLOCK 0xd520
# killstreaks::debug_ricochet_protection@5a
DEVBLOCK 0xd8da
