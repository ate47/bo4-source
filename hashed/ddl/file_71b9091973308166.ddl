{
    "name": "#hash_71b9091973308166",
    "version": 10,
    "metatable": "#hash_b50561ee11e06077",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_66171d46b926a0f4",
                    "type": "string",
                    "offset": 256,
                    "bitSize": 384
                },
                {
                    "name": "#run_time",
                    "type": "int",
                    "offset": 1368,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#nodes",
                    "type": "int",
                    "offset": 832,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_500de1697bd9326b",
                    "type": "int",
                    "offset": 1400,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#samples",
                    "type": "int",
                    "offset": 1560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_7283f55e08b37f54",
                    "type": "fixedpoint",
                    "offset": 1432,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_7283f65e08b38107",
                    "type": "fixedpoint",
                    "offset": 1464,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_686b40e2c86148a",
                    "type": "int",
                    "offset": 1624,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_686b50e2c86163d",
                    "type": "int",
                    "offset": 1656,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_578a31eeeebf8e86",
                    "type": "int",
                    "offset": 1496,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_578a32eeeebf9039",
                    "type": "int",
                    "offset": 1528,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_171f242bdfe3c7d5",
                    "type": "string",
                    "offset": 1912,
                    "bitSize": 192
                },
                {
                    "name": "#username",
                    "type": "string",
                    "offset": 2104,
                    "bitSize": 256
                },
                {
                    "name": "#note",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 256
                },
                {
                    "name": "#hash_277af36f6bbf409a",
                    "type": "uint",
                    "offset": 3384,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6afd5eba293e8da6",
                    "type": "string",
                    "offset": 2360,
                    "bitSize": 1024
                },
                {
                    "name": "#partition",
                    "type": "int",
                    "offset": 1592,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_2b363900460040f3",
                    "type": "int",
                    "offset": 1688,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 864,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 1720,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 640,
                    "bitSize": 192
                },
                {
                    "name": "#__pad",
                    "type": "pad",
                    "offset": 3385,
                    "bitSize": 7,
                    "intSize": 7
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