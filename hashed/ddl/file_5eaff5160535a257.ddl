{
    "name": "#hash_5eaff5160535a257",
    "version": 10,
    "metatable": "#hash_132da978281e107b",
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
                    "offset": 12872,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#hash_637a0a0969aaeb3b",
                    "type": "struct#hash_3ad855a8b01f1a72",
                    "offset": 696,
                    "bitSize": 2576
                },
                {
                    "name": "#lobby_members",
                    "type": "struct#hash_38be2d6023bb72b1[50]",
                    "offset": 3272,
                    "bitSize": 9600
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
            "name": "#hash_3ad855a8b01f1a72",
            "members": [
                {
                    "name": "#hash_529f1b2656189232",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_522c2d85063ec515",
                    "type": "uint64",
                    "offset": 1032,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_56a1b6d783aa7a25",
                    "type": "uint64",
                    "offset": 2056,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#lobby_id",
                    "type": "uint64",
                    "offset": 1160,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_300f7cbb339f0026",
                    "type": "uint64",
                    "offset": 1096,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#is_dedi",
                    "type": "uint",
                    "offset": 2568,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_5e523aef49ce7554",
                    "type": "string",
                    "offset": 2312,
                    "bitSize": 256
                },
                {
                    "name": "#hash_7a177695ffbdbbbf",
                    "type": "string",
                    "offset": 1288,
                    "bitSize": 736
                },
                {
                    "name": "#playlist_version",
                    "type": "int",
                    "offset": 2120,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#playlist_id",
                    "type": "int",
                    "offset": 2024,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#ffotd_version",
                    "type": "int",
                    "offset": 2248,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_72623ba80a26ad5a",
                    "type": "int",
                    "offset": 2280,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_274f4160f246b900",
                    "type": "uint64",
                    "offset": 512,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_238a1943270a668e",
                    "type": "uint64",
                    "offset": 448,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_3bca0a9c8f341c79",
                    "type": "string",
                    "offset": 64,
                    "bitSize": 384
                },
                {
                    "name": "#hash_623fd292cbf4dd16",
                    "type": "uint",
                    "offset": 2216,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_573a96edffbd3a8e",
                    "type": "uint64",
                    "offset": 1224,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_204f262b1f3b8ccf",
                    "type": "uint64",
                    "offset": 968,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_296aeed34055c468",
                    "type": "string",
                    "offset": 584,
                    "bitSize": 384
                },
                {
                    "name": "#hash_3d6dceb705c92439",
                    "type": "enum#hash_745a9340fca86465",
                    "offset": 576,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4f2f10801676ac78",
                    "type": "uint64",
                    "offset": 2152,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#__pad",
                    "type": "pad",
                    "offset": 2569,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_745a9340fca86465",
            "values": [
                "#hash_2154483008068688",
                "#game_start",
                "#hash_6a20f1f681a1a426"
            ]
        },
        {
            "name": "#hash_38be2d6023bb72b1",
            "members": [
                {
                    "name": "#user_id",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_26fcf92f9ee7fc5",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_4fd83cafec6d041d",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        }
    ]
}