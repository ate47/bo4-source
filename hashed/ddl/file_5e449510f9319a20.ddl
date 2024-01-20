{
    "name": "#hash_5e449510f9319a20",
    "version": 5,
    "metatable": "#hash_4de223927eba96ed",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_1db36ca43f8ad917",
                    "type": "uint",
                    "offset": 1120,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3fb1cd058b597d26",
                    "type": "uint",
                    "offset": 3816,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_b3b9df7f8e46110",
                    "type": "int",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_4b969717ded32c59",
                    "type": "int",
                    "offset": 2920,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 1152,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 3624,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#hash_489b624635fc1faf",
                    "type": "struct#hash_46f2ea4cc6f0ef92[42]",
                    "offset": 2248,
                    "bitSize": 672
                },
                {
                    "name": "#hash_5f9e5fe5b8245404",
                    "type": "struct#hash_46f2ea4cc6f0ef92[42]",
                    "offset": 2952,
                    "bitSize": 672
                },
                {
                    "name": "#hash_62ffdd1b4c308ec8",
                    "type": "struct#hash_46f2ea4cc6f0ef92[25]",
                    "offset": 720,
                    "bitSize": 400
                },
                {
                    "name": "#hash_860e7d3dbf29ba1",
                    "type": "struct#hash_46f2ea4cc6f0ef92[31]",
                    "offset": 1752,
                    "bitSize": 496
                },
                {
                    "name": "#hash_7e1386e214ff2fac",
                    "type": "struct#hash_46f2ea4cc6f0ef92[31]",
                    "offset": 224,
                    "bitSize": 496
                },
                {
                    "name": "#hash_df9a6e6386059d2",
                    "type": "struct#hash_46f2ea4cc6f0ef92[6]",
                    "offset": 1656,
                    "bitSize": 96
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
            "name": "#hash_46f2ea4cc6f0ef92",
            "members": [
                {
                    "name": "#value",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
}