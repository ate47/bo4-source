{
    "name": "#hash_4f52e5fcab1efaef",
    "version": 14,
    "metatable": "#hash_f2dab06b1f830d44",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#gametime",
                    "type": "int",
                    "offset": 1080,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_16f7e8c8e28206d7",
                    "type": "int",
                    "offset": 2584,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#aitype",
                    "type": "string",
                    "offset": 1720,
                    "bitSize": 512
                },
                {
                    "name": "#archetype",
                    "type": "float",
                    "offset": 1112,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#airank",
                    "type": "string",
                    "offset": 1208,
                    "bitSize": 512
                },
                {
                    "name": "#accuracy",
                    "type": "fixedpoint",
                    "offset": 1048,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#originx",
                    "type": "fixedpoint",
                    "offset": 2488,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#originy",
                    "type": "fixedpoint",
                    "offset": 2520,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#originz",
                    "type": "fixedpoint",
                    "offset": 2552,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#weapon",
                    "type": "float",
                    "offset": 2648,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#team",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#alertlevel",
                    "type": "string",
                    "offset": 792,
                    "bitSize": 256
                },
                {
                    "name": "#grenadeawareness",
                    "type": "fixedpoint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#canflank",
                    "type": "int",
                    "offset": 2744,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#engagemaxdist",
                    "type": "fixedpoint",
                    "offset": 2424,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#engagemaxfalloffdist",
                    "type": "fixedpoint",
                    "offset": 1176,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#engagemindist",
                    "type": "fixedpoint",
                    "offset": 2616,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#engageminfalloffdist",
                    "type": "fixedpoint",
                    "offset": 2712,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#health",
                    "type": "int",
                    "offset": 2456,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
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
                    "offset": 2232,
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