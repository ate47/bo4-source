{
    "name": "#hash_2ec6766c0c27c8c7",
    "version": 9,
    "metatable": "#hash_ffc0d3a697b35fd7",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#mode",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#playername",
                    "type": "string",
                    "offset": 1176,
                    "bitSize": 384
                },
                {
                    "name": "#firsttime",
                    "type": "int",
                    "offset": 512,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_7d83004e168016fc",
                    "type": "int",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_501d5f909f2be786",
                    "type": "int",
                    "offset": 1112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_4b9aa114338a78f3",
                    "type": "int",
                    "offset": 480,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_7f5b1682501e1b04",
                    "type": "int",
                    "offset": 1144,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_6411a8c84e626d4d",
                    "type": "int",
                    "offset": 1560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_328cf48c5c93599c",
                    "type": "int",
                    "offset": 576,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#play",
                    "type": "int",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#forgiven",
                    "type": "int",
                    "offset": 544,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#quit",
                    "type": "int",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#dashboard",
                    "type": "int",
                    "offset": 1816,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#timeout",
                    "type": "int",
                    "offset": 1784,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#finished",
                    "type": "int",
                    "offset": 1848,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 608,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 1592,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#hash_8057a5478d9bca",
                    "offset": 256,
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