{
    "name": "#hash_696d88f16966a19d",
    "version": 11,
    "metatable": "#hash_e4b86c41b3db0844",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#gametime",
                    "type": "int",
                    "offset": 792,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_16f7e8c8e28206d7",
                    "type": "int",
                    "offset": 2232,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#aitype",
                    "type": "string",
                    "offset": 1400,
                    "bitSize": 512
                },
                {
                    "name": "#archetype",
                    "type": "float",
                    "offset": 824,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#airank",
                    "type": "string",
                    "offset": 888,
                    "bitSize": 512
                },
                {
                    "name": "#accuracy",
                    "type": "fixedpoint",
                    "offset": 760,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#originx",
                    "type": "fixedpoint",
                    "offset": 2136,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#originy",
                    "type": "fixedpoint",
                    "offset": 2168,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#originz",
                    "type": "fixedpoint",
                    "offset": 2200,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#weapon",
                    "type": "float",
                    "offset": 2264,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#melee_weapon",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#health",
                    "type": "int",
                    "offset": 2104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#roundnum",
                    "type": "byte",
                    "offset": 2328,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 256,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 1912,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#hash_8057a5478d9bca",
                    "offset": 64,
                    "bitSize": 192
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