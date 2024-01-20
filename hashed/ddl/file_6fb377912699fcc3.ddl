{
    "name": "#hash_6fb377912699fcc3",
    "version": 8,
    "metatable": "#hash_5cc056c5769358fe",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#validated",
                    "type": "uint",
                    "offset": 2493,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#processed",
                    "type": "uint",
                    "offset": 2494,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#origin_offset",
                    "type": "fixedpoint",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#yaw_offset",
                    "type": "fixedpoint",
                    "offset": 2072,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_1f6cb274898a232a",
                    "type": "fixedpoint",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_aae124f4ed1846e",
                    "type": "fixedpoint",
                    "offset": 2424,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_6ca68a826d8d5015",
                    "type": "fixedpoint",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_150b59790cfad3fa",
                    "type": "fixedpoint",
                    "offset": 2104,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#head_offset",
                    "type": "fixedpoint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_6273201c1ac36522",
                    "type": "fixedpoint",
                    "offset": 2328,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#foot_offset",
                    "type": "fixedpoint",
                    "offset": 2456,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#time_offset",
                    "type": "fixedpoint",
                    "offset": 1504,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attacker",
                    "type": "uint64",
                    "offset": 1440,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_2b9d070619bac7c1",
                    "type": "uint",
                    "offset": 2490,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_1b75b5c1eae66aa5",
                    "type": "uint",
                    "offset": 2495,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#enemy",
                    "type": "uint64",
                    "offset": 32,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_62d1da867bb2ff57",
                    "type": "int",
                    "offset": 2040,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_79ec1ef18401690b",
                    "type": "uint",
                    "offset": 2491,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_4aac85027c3a650c",
                    "type": "uint",
                    "offset": 2489,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#distance",
                    "type": "fixedpoint",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_798dacddc7e656b3",
                    "type": "uint",
                    "offset": 2488,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#weapon",
                    "type": "float",
                    "offset": 2360,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#weapon_attachments",
                    "type": "string",
                    "offset": 416,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_2a1e95e3a58c334c",
                    "type": "uint",
                    "offset": 2492,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 1536,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 2136,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 96,
                    "bitSize": 192
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
        }
    ]
}