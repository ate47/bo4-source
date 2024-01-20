{
    "name": "#hash_1fcc3a4ddd38d2e9",
    "version": 14,
    "metatable": "#hash_adbff85b401b4868",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#gametime",
                    "type": "int",
                    "offset": 1592,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#death",
                    "type": "uint",
                    "offset": 2232,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#attackerspawnid",
                    "type": "int",
                    "offset": 856,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#attackerx",
                    "type": "fixedpoint",
                    "offset": 2104,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attackery",
                    "type": "fixedpoint",
                    "offset": 2136,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attackerz",
                    "type": "fixedpoint",
                    "offset": 2168,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attackerweapon",
                    "type": "float",
                    "offset": 888,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#victimspawnid",
                    "type": "int",
                    "offset": 2200,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#victimx",
                    "type": "fixedpoint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#victimy",
                    "type": "fixedpoint",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#victimz",
                    "type": "fixedpoint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#damage",
                    "type": "int",
                    "offset": 1816,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#damagetype",
                    "type": "string",
                    "offset": 1336,
                    "bitSize": 256
                },
                {
                    "name": "#damagelocation",
                    "type": "string",
                    "offset": 1016,
                    "bitSize": 256
                },
                {
                    "name": "#killstreak",
                    "type": "string",
                    "offset": 1848,
                    "bitSize": 256
                },
                {
                    "name": "#isusingheropower",
                    "type": "uint",
                    "offset": 2233,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_1c05f7c4256bbdb",
                    "type": "float",
                    "offset": 952,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_40ad2d946e819994",
                    "type": "float",
                    "offset": 1272,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#victimweapon",
                    "type": "float",
                    "offset": 792,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 288,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 1624,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#hash_8057a5478d9bca",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 2234,
                    "bitSize": 6,
                    "intSize": 6
                }
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
            "name": "#hash_54196e9e9860f0be",
            "values": [
                "#pc",
                "#hash_2138dd192571c4c9",
                "#hash_3f9f7d197fde67aa",
                "#scorpio",
                "#ps4"
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
        }
    ]
}