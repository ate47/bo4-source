{
    "name": "#hash_3ec14795dadcb33c",
    "version": 23,
    "metatable": "#hash_75d98561f6fafb34",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 192,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 3240,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#hash_71960e91f80c3365",
                    "type": "struct#hash_5824d549adab1dc4",
                    "offset": 696,
                    "bitSize": 2064
                },
                {
                    "name": "#hash_4682ee0eb5071d2",
                    "type": "struct#hash_2a75a26c051b3f31",
                    "offset": 4840,
                    "bitSize": 736
                },
                {
                    "name": "#hash_209c80d657442a83",
                    "type": "struct#hash_13d3693b7f1216f8",
                    "offset": 5576,
                    "bitSize": 9792
                },
                {
                    "name": "#hash_43cb38816354c3aa",
                    "type": "struct#hash_42e8915aaacaff63",
                    "offset": 3432,
                    "bitSize": 896
                },
                {
                    "name": "#hash_11fcb8f188ed5050",
                    "type": "struct#hash_3506e586ba0277fb",
                    "offset": 4328,
                    "bitSize": 512
                },
                {
                    "name": "#hash_78a6c018d9f82184",
                    "type": "struct#hash_3821d9754f594c79",
                    "offset": 2760,
                    "bitSize": 320
                },
                {
                    "name": "#end_match_zm",
                    "type": "struct#hash_3a5bf7d0d7976271",
                    "offset": 3080,
                    "bitSize": 160
                }
            ]
        },
        {
            "name": "#telemetry_header",
            "members": [
                {
                    "name": "#hash_56a1b6d783aa7a25",
                    "type": "uint",
                    "offset": 408,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#action_type",
                    "type": "float",
                    "offset": 48,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#build_version",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 256
                },
                {
                    "name": "#changelist_number",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#title_id",
                    "type": "uint",
                    "offset": 376,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#source_version",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 112,
                    "bitSize": 8
                },
                {
                    "name": "#hash_f2ad74d8edb8204",
                    "type": "uint64",
                    "offset": 440,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#client_header",
            "members": [
                {
                    "name": "#user_id",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#uno_id",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#match_header",
            "members": [
                {
                    "name": "#lobby_id",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#match_id",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_c05315ddb26eb93",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#hash_5824d549adab1dc4",
            "members": [
                {
                    "name": "#session_mode",
                    "type": "enum#hash_61d8fb71b3cca1df",
                    "offset": 2016,
                    "bitSize": 8
                },
                {
                    "name": "#game_type",
                    "type": "float",
                    "offset": 608,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#private_match",
                    "type": "uint",
                    "offset": 2056,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#esports_flag",
                    "type": "int",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#ranked_play_flag",
                    "type": "uint",
                    "offset": 2057,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#game_map",
                    "type": "string",
                    "offset": 1696,
                    "bitSize": 256
                },
                {
                    "name": "#player_xuid",
                    "type": "string",
                    "offset": 352,
                    "bitSize": 256
                },
                {
                    "name": "#player_ip",
                    "type": "string",
                    "offset": 672,
                    "bitSize": 1024
                },
                {
                    "name": "#season_pass_owned",
                    "type": "uint",
                    "offset": 2058,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#dlc_owned",
                    "type": "int",
                    "offset": 2024,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_236307b2e3de4586",
                    "type": "string",
                    "offset": 96,
                    "bitSize": 256
                },
                {
                    "name": "#starting_team",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#ending_team",
                    "type": "float",
                    "offset": 1952,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#__pad",
                    "type": "pad",
                    "offset": 2059,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_2a75a26c051b3f31",
            "members": [
                {
                    "name": "#match_kills",
                    "type": "int",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_deaths",
                    "type": "int",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_xp",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_score",
                    "type": "int",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_streak",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_captures",
                    "type": "int",
                    "offset": 672,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_defends",
                    "type": "int",
                    "offset": 512,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_headshots",
                    "type": "int",
                    "offset": 704,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_longshots",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_objtime",
                    "type": "int",
                    "offset": 640,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_plants",
                    "type": "int",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_defuses",
                    "type": "int",
                    "offset": 544,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_throws",
                    "type": "int",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_carries",
                    "type": "int",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_returns",
                    "type": "int",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_result",
                    "type": "float",
                    "offset": 192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#match_duration",
                    "type": "int",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_shots",
                    "type": "int",
                    "offset": 480,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#match_hits",
                    "type": "int",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#prestige_max",
                    "type": "int",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#level_max",
                    "type": "int",
                    "offset": 576,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#specialist_kills",
                    "type": "int",
                    "offset": 608,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#hash_13d3693b7f1216f8",
            "members": [
                {
                    "name": "#player_gender",
                    "type": "string",
                    "offset": 8960,
                    "bitSize": 256
                },
                {
                    "name": "#specialist_used",
                    "type": "float",
                    "offset": 9216,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#loadout_perks",
                    "type": "string",
                    "offset": 512,
                    "bitSize": 8192
                },
                {
                    "name": "#loadout_lethal",
                    "type": "float",
                    "offset": 9408,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#loadout_tactical",
                    "type": "float",
                    "offset": 9344,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#loadout_scorestreaks",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 512
                },
                {
                    "name": "#loadout_primary_weapon",
                    "type": "float",
                    "offset": 9280,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#loadout_secondary_weapon",
                    "type": "float",
                    "offset": 9728,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#loadout_primary_attachments",
                    "type": "string",
                    "offset": 8704,
                    "bitSize": 256
                },
                {
                    "name": "#loadout_secondary_attachments",
                    "type": "string",
                    "offset": 9472,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_42e8915aaacaff63",
            "members": [
                {
                    "name": "#best_score",
                    "type": "string",
                    "offset": 288,
                    "bitSize": 256
                },
                {
                    "name": "#best_kills",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 256
                },
                {
                    "name": "#best_kd",
                    "type": "string",
                    "offset": 640,
                    "bitSize": 256
                },
                {
                    "name": "#total_kills",
                    "type": "int",
                    "offset": 608,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#total_deaths",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#total_wins",
                    "type": "int",
                    "offset": 576,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#total_xp",
                    "type": "int",
                    "offset": 544,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#hash_3506e586ba0277fb",
            "members": [
                {
                    "name": "#daily_contract_id",
                    "type": "int",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#daily_contract_target",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#daily_contract_current",
                    "type": "int",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#daily_contract_completed",
                    "type": "int",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklya_contract_id",
                    "type": "int",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklya_contract_target",
                    "type": "int",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklya_contract_current",
                    "type": "int",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklya_contract_completed",
                    "type": "int",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklyb_contract_id",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklyb_contract_target",
                    "type": "int",
                    "offset": 480,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklyb_contract_current",
                    "type": "int",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#weeklyb_contract_completed",
                    "type": "int",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#special_contract_id",
                    "type": "int",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#special_contract_target",
                    "type": "int",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#special_contract_curent",
                    "type": "int",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#special_contract_completed",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#hash_3821d9754f594c79",
            "members": [
                {
                    "name": "#hash_47b601fcc6a5c1f6",
                    "type": "float",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#specialist_head",
                    "type": "float",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#specialist_legs",
                    "type": "float",
                    "offset": 192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#specialist_torso",
                    "type": "float",
                    "offset": 256,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#specialist_showcase",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#hash_3a5bf7d0d7976271",
            "members": [
                {
                    "name": "#money",
                    "type": "int",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#zombie_waves",
                    "type": "int",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#revives",
                    "type": "int",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#doors",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#downs",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#hash_54196e9e9860f0be",
            "values": [
                "#pc",
                "#neo",
                "#xb1",
                "#scorpio",
                "#ps4"
            ]
        },
        {
            "name": "#hash_61d8fb71b3cca1df",
            "values": [
                "#mode_invalid",
                "#mode_campaign",
                "#mode_multiplayer",
                "#mode_warzone",
                "#mode_zombies"
            ]
        }
    ]
}