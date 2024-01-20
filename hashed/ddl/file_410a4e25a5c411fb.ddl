{
    "name": "#hash_410a4e25a5c411fb",
    "version": 6,
    "metatable": "#hash_33a2006d08c2a364",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#player_xuid",
                    "type": "uint64",
                    "offset": 288,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_2da568278a84a90d",
                    "type": "uint",
                    "offset": 1184,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#vehicle",
                    "type": "float",
                    "offset": 224,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_4b57cd6a0164c365",
                    "type": "fixedpoint",
                    "offset": 1088,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_4b57cc6a0164c1b2",
                    "type": "fixedpoint",
                    "offset": 1120,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_6373313e132d49b8",
                    "type": "fixedpoint",
                    "offset": 936,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_6373323e132d4b6b",
                    "type": "fixedpoint",
                    "offset": 968,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#start_time",
                    "type": "uint",
                    "offset": 1048,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#end_time",
                    "type": "uint",
                    "offset": 904,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#start_health",
                    "type": "uint",
                    "offset": 1424,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#end_health",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#first_player",
                    "type": "uint64",
                    "offset": 1440,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_b165f7ced53ebf6",
                    "type": "byte",
                    "offset": 1080,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_493b0b37aa073d11",
                    "type": "uint",
                    "offset": 1152,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_576e854d5397d59e",
                    "type": "uint",
                    "offset": 352,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_1f6f99c615ebe865",
                    "type": "uint",
                    "offset": 1000,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_4c4e7e6968f548cd",
                    "type": "uint",
                    "offset": 1168,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_27d7493da1ae3b08",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#vehicle_kills",
                    "type": "uint",
                    "offset": 888,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_4b78f4ca0c0dd281",
                    "type": "uint",
                    "offset": 1032,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_7410c2f4f7747523",
                    "type": "uint",
                    "offset": 1016,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_2ade526a94b004f",
                    "type": "uint",
                    "offset": 1408,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#passenger_kills",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 384,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 1216,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 16,
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