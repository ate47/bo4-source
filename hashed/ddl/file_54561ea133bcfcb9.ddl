{
    "name": "#hash_54561ea133bcfcb9",
    "version": 2,
    "metatable": "#hash_b0f88f08fad4d2fd",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 0,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 944,
                    "bitSize": 192
                },
                {
                    "name": "#hash_4323e09d2452778a",
                    "type": "struct#hash_614dd0ece0bfbd27",
                    "offset": 504,
                    "bitSize": 72
                },
                {
                    "name": "#hash_157a5bbb9becf257",
                    "type": "struct#hash_4110ed2df03bbae",
                    "offset": 664,
                    "bitSize": 280
                },
                {
                    "name": "#hash_56264bcd868c21cc",
                    "type": "struct#hash_fb47795e5d8f8d[16]",
                    "offset": 1808,
                    "bitSize": 512
                },
                {
                    "name": "#hash_20b0f8c6f632e6ff",
                    "type": "struct#hash_e34a94c0792bab1",
                    "offset": 576,
                    "bitSize": 88
                },
                {
                    "name": "#hash_51c7d25da657076a",
                    "type": "struct#hash_c5a2a1d52b4736a[8]",
                    "offset": 1136,
                    "bitSize": 384
                },
                {
                    "name": "#header",
                    "type": "struct#hash_6a65101a136eab93",
                    "offset": 1520,
                    "bitSize": 288
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
            "name": "#hash_614dd0ece0bfbd27",
            "members": [
                {
                    "name": "#result",
                    "type": "byte",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#duration_ms",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5fcf5a02824b74de",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_4110ed2df03bbae",
            "members": [
                {
                    "name": "#hash_70259f4fbb3f7a05",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52521ecd1275d391",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#latency",
                    "type": "fixedpoint",
                    "offset": 240,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_31cdd6dd8e7999af",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_10843082d188230c",
                    "type": "uint",
                    "offset": 272,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#bandwidth_up",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_7663f2e4bf3b7a23",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3155d04edc797a1a",
                    "type": "fixedpoint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_68d55c52aa13f7b4",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5424ed280cfa4b36",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 273,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_fb47795e5d8f8d",
            "members": [
                {
                    "name": "#hash_e60a2bc44d9370a",
                    "type": "fixedpoint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32
                }
            ]
        },
        {
            "name": "#hash_e34a94c0792bab1",
            "members": [
                {
                    "name": "#nat_type",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_7eeb3b0b30e2921a",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4b5ffc955581a19e",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_78725a00fca985de",
                    "type": "int",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#hash_c5a2a1d52b4736a",
            "members": [
                {
                    "name": "#hash_585f73b9a8dbaec2",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1a03a43c6642e4d6",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#hash_6a65101a136eab93",
            "members": [
                {
                    "name": "#hash_426fb7404d1fbf32",
                    "type": "uint64",
                    "offset": 160,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#title_id",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#user_id",
                    "type": "uint64",
                    "offset": 224,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_6bdd7ebe59310aa2",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#lobby_id",
                    "type": "uint64",
                    "offset": 64,
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
        }
    ]
}