{
    "name": "#hash_a285c93abbf5d9",
    "version": 3,
    "metatable": "#hash_864648d7bb66235f",
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
                    "offset": 5520,
                    "bitSize": 192
                },
                {
                    "name": "#content",
                    "type": "struct#hash_2f1c32e28bcd6a46",
                    "offset": 504,
                    "bitSize": 3736
                },
                {
                    "name": "#actions",
                    "type": "struct#hash_163fd421f805deef[40]",
                    "offset": 5712,
                    "bitSize": 42560
                },
                {
                    "name": "#lobby_members",
                    "type": "struct#hash_26f770aa73f71026[10]",
                    "offset": 4240,
                    "bitSize": 1280
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
            "name": "#hash_2f1c32e28bcd6a46",
            "members": [
                {
                    "name": "#process_name",
                    "type": "string",
                    "offset": 264,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_4e650e9c822cb0ce",
                    "type": "int",
                    "offset": 1392,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_2459c7bb3080c37f",
                    "type": "int",
                    "offset": 1584,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_669ca7a9de06f403",
                    "type": "int",
                    "offset": 1352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_7d8e410d4a2c6050",
                    "type": "int",
                    "offset": 1488,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_2b50577fe93b2256",
                    "type": "uint64",
                    "offset": 1288,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_438c4b6c6afd6185",
                    "type": "uint64",
                    "offset": 1424,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_740d73d751cf7979",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_7e014c3bec12cc14",
                    "type": "uint64",
                    "offset": 3664,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_43081cc1b79588f9",
                    "type": "byte",
                    "offset": 1384,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_49bf5522e36c4ff6",
                    "type": "byte",
                    "offset": 256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_68c4483fed6cf75e",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_fe1bb65e8de4d51",
                    "type": "uint64",
                    "offset": 1520,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_4c2f2b7a55fd35a8",
                    "type": "uint64",
                    "offset": 192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_7a4b7f92d7e1dc7b",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_5b950829c03b3406",
                    "type": "uint",
                    "offset": 3728,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#extra_msg",
                    "type": "string",
                    "offset": 1616,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3729,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_163fd421f805deef",
            "members": [
                {
                    "name": "#action_name",
                    "type": "string",
                    "offset": 544,
                    "bitSize": 512
                },
                {
                    "name": "#next_name",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 512
                },
                {
                    "name": "#action_id",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_273dfb188de1a27d",
                    "type": "uint",
                    "offset": 1056,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1057,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_26f770aa73f71026",
            "members": [
                {
                    "name": "#hash_79cac019c120269b",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_7faaf5ed10257a8a",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        }
    ]
}