{
    "name": "#hash_6d70113ed53a25a9",
    "version": 2,
    "metatable": "#hash_59e070c81225284d",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#shots",
                    "type": "uint",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hits",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#kills",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#headshots",
                    "type": "uint",
                    "offset": 1576,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#died",
                    "type": "uint",
                    "offset": 1592,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#time_used_s",
                    "type": "uint",
                    "offset": 776,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#longest_hit_distance",
                    "type": "fixedpoint",
                    "offset": 16,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attachment1",
                    "type": "float",
                    "offset": 1128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#attachment2",
                    "type": "float",
                    "offset": 1192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#attachment3",
                    "type": "float",
                    "offset": 1256,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#attachment4",
                    "type": "float",
                    "offset": 1320,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#attachment5",
                    "type": "float",
                    "offset": 1384,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#reticle",
                    "type": "float",
                    "offset": 808,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#attachment6",
                    "type": "float",
                    "offset": 1448,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#attachment7",
                    "type": "float",
                    "offset": 1512,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#weapon",
                    "type": "float",
                    "offset": 1064,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 272,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 872,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#hash_8057a5478d9bca",
                    "offset": 64,
                    "bitSize": 192
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1593,
                    "bitSize": 7,
                    "intSize": 7
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