{
    "name": "#hash_43e0bc57f880304f",
    "version": 14,
    "metatable": "#hash_4d9d94e7eb6f6ed5",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#store_source",
                    "type": "string",
                    "offset": 728,
                    "bitSize": 384
                },
                {
                    "name": "#store_gamemode",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#store_action_source",
                    "type": "string",
                    "offset": 1880,
                    "bitSize": 256
                },
                {
                    "name": "#store_region",
                    "type": "uint",
                    "offset": 696,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#product_id",
                    "type": "string",
                    "offset": 1368,
                    "bitSize": 512
                },
                {
                    "name": "#product_category",
                    "type": "string",
                    "offset": 2136,
                    "bitSize": 512
                },
                {
                    "name": "#transaction_result",
                    "type": "enum#hash_3579cef5c6443dc8",
                    "offset": 2840,
                    "bitSize": 8
                },
                {
                    "name": "#product_price",
                    "type": "string",
                    "offset": 1112,
                    "bitSize": 256
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 192,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 2648,
                    "bitSize": 192
                }
            ]
        },
        {
            "name": "#hash_3579cef5c6443dc8",
            "values": [
                "#hash_1574bfbe3ed29bdc",
                "#hash_609719c16403e3ba",
                "#hash_7227de3f6d6e6037",
                "#hash_725e60c7c0f99711",
                "#hash_78b9dcfbba2a4f40"
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
        }
    ]
}