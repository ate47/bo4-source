{
    "name": "#hash_1673548869c6e873",
    "version": 2,
    "metatable": "#hash_56f94926fc21f03c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 4416,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 5360,
                    "bitSize": 192
                },
                {
                    "name": "#hash_5d48574fc72fa62a",
                    "type": "struct#hash_75410917f1349195",
                    "offset": 4920,
                    "bitSize": 440
                },
                {
                    "name": "#hash_7c0d8ffa40ab2f1c",
                    "type": "struct#hash_3463e9551f90555[4]",
                    "offset": 0,
                    "bitSize": 4416
                },
                {
                    "name": "#header",
                    "type": "struct#hash_6a65101a136eab93",
                    "offset": 5552,
                    "bitSize": 288
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
            "name": "#hash_75410917f1349195",
            "members": [
                {
                    "name": "#result",
                    "type": "byte",
                    "offset": 312,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#duration_ms",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_34c5635e8db13ab3",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_4d8e465f87a92f48",
                    "type": "uint",
                    "offset": 280,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2d44b36998706f7",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_383e72b38f06fdef",
                    "type": "uint",
                    "offset": 264,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_66838b2bb2c0d307",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_70f2b19ca673843f",
                    "type": "uint",
                    "offset": 352,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_54d04e9876cf3bb2",
                    "type": "byte",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_3772e4882104a032",
                    "type": "fixedpoint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_20b0abc2a13dc92b",
                    "type": "fixedpoint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_20f159c75c2c7f4e",
                    "type": "fixedpoint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_58d62c257c3f9e9d",
                    "type": "byte",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4d8b250da4767eb7",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_7a7ad9d0b762f0d3",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1050a7ff012698f8",
                    "type": "byte",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_18cb1067529b24e6",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b0d39256f62ffa4",
                    "type": "uint",
                    "offset": 400,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5bf606466b9e7bbb",
                    "type": "uint",
                    "offset": 432,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#__pad",
                    "type": "pad",
                    "offset": 433,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_3463e9551f90555",
            "members": [
                {
                    "name": "#hash_32e3f837e2ac1c9b",
                    "type": "uint",
                    "offset": 1072,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_49e2a983d2171292",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#port",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_113c5771496a44ed",
                    "type": "string",
                    "offset": 48,
                    "bitSize": 1024
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
        }
    ]
}