{
    "name": "#hash_5259f894d90583d0",
    "version": 8,
    "metatable": "#hash_b9991243d705d13a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#gametime",
                    "type": "int",
                    "offset": 2648,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#explosiontype",
                    "type": "string",
                    "offset": 1720,
                    "bitSize": 512
                },
                {
                    "name": "#objectname",
                    "type": "string",
                    "offset": 1208,
                    "bitSize": 512
                },
                {
                    "name": "#attackerid",
                    "type": "int",
                    "offset": 2616,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#attackerusername",
                    "type": "string",
                    "offset": 2232,
                    "bitSize": 384
                },
                {
                    "name": "#attackertype",
                    "type": "string",
                    "offset": 696,
                    "bitSize": 512
                },
                {
                    "name": "#locationx",
                    "type": "fixedpoint",
                    "offset": 2872,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#locationy",
                    "type": "fixedpoint",
                    "offset": 2904,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#locationz",
                    "type": "fixedpoint",
                    "offset": 2936,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#radius",
                    "type": "fixedpoint",
                    "offset": 2968,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attackerx",
                    "type": "fixedpoint",
                    "offset": 3000,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attackery",
                    "type": "fixedpoint",
                    "offset": 3032,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#attackerz",
                    "type": "fixedpoint",
                    "offset": 3064,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 192,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 2680,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 0,
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