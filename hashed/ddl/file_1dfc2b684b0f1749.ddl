{
    "name": "#hash_1dfc2b684b0f1749",
    "version": 24,
    "metatable": "#hash_f0716b756b554c5c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_69f723a3393b550d",
                    "type": "uint64",
                    "offset": 3232,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#session_mode",
                    "type": "enum#hash_61d8fb71b3cca1df",
                    "offset": 3296,
                    "bitSize": 8
                },
                {
                    "name": "#game_type",
                    "type": "float",
                    "offset": 1176,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#map",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 384
                },
                {
                    "name": "#hash_38469d68580feff1",
                    "type": "int",
                    "offset": 1256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_7b55ebd46c7e4937",
                    "type": "float",
                    "offset": 1080,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#lobby_type",
                    "type": "int",
                    "offset": 1144,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#nat_type",
                    "type": "enum#hash_405641015bd81f7d",
                    "offset": 1248,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4676a9a4fd52e65a",
                    "type": "uint",
                    "offset": 3306,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_7212de4bfb6f8ba",
                    "type": "uint",
                    "offset": 3305,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_27f986f9f86c15ef",
                    "type": "uint",
                    "offset": 3304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_4d21d7e90f34c2d",
                    "type": "uint",
                    "offset": 3307,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_2040bac0263bbe0c",
                    "type": "uint",
                    "offset": 3309,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6e58cdc751af2093",
                    "type": "uint",
                    "offset": 3308,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_a5ceb4ab2cb3bba",
                    "type": "uint",
                    "offset": 3310,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_4639d65e1e4a1a25",
                    "type": "enum#hash_6cf1cc22ebab862c",
                    "offset": 1240,
                    "bitSize": 8
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 576,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 1288,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#hash_8057a5478d9bca",
                    "offset": 384,
                    "bitSize": 192
                },
                {
                    "name": "#region",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 1480,
                    "bitSize": 1752
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3311,
                    "bitSize": 1,
                    "intSize": 1
                }
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
        },
        {
            "name": "#hash_8057a5478d9bca",
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
            "name": "#hash_405641015bd81f7d",
            "values": [
                "#xonline_nat_unknown",
                "#xonline_nat_open",
                "#xonline_nat_strict",
                "#xonline_nat_moderate"
            ]
        },
        {
            "name": "#hash_7dcaabe0b3028e02",
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
                    "name": "#hash_69f723a3393b550d",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#hash_6cf1cc22ebab862c",
            "values": [
                "#hash_18695b82948876e3",
                "#hash_31a0fc57a92be3ec",
                "#hash_50894d28d26042e8"
            ]
        },
        {
            "name": "#hash_d61f32e738b0498",
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
                    "name": "#hash_572050e9a4cc493f",
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
                    "name": "#hash_412cb161a9856017",
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
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
                }
            ]
        },
        {
            "name": "#hash_54196e9e9860f0be",
            "values": [
                "#pc",
                "#hash_2138dd192571c4c9",
                "#hash_3f9f7d197fde67aa",
                "#scorpio",
                "#ps4"
            ]
        }
    ]
}