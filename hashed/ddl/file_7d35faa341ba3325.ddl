{
    "name": "#hash_7d35faa341ba3325",
    "version": 10,
    "metatable": "#hash_d35ca335f5c56f89",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#reason",
                    "type": "string",
                    "offset": 1016,
                    "bitSize": 512
                },
                {
                    "name": "#hash_666d0cfcf9ae78ae",
                    "type": "int",
                    "offset": 792,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#x",
                    "type": "fixedpoint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#y",
                    "type": "fixedpoint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#z",
                    "type": "fixedpoint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_35eda16df3c4d65d",
                    "type": "uint",
                    "offset": 1528,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
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
                    "offset": 824,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#hash_8057a5478d9bca",
                    "offset": 96,
                    "bitSize": 192
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1529,
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