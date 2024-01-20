{
    "name": "#hash_578dbeaea88dfab1",
    "version": 3,
    "metatable": "#hash_c06e67528eb3a05",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#status",
                    "type": "string",
                    "offset": 952,
                    "bitSize": 256
                },
                {
                    "name": "#valid_result",
                    "type": "uint",
                    "offset": 2652,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_34f06c6eeda8117e",
                    "type": "uint64",
                    "offset": 632,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_df1f57dcd0a3e0a",
                    "type": "string",
                    "offset": 2264,
                    "bitSize": 384
                },
                {
                    "name": "#hash_1531894bfd7141d0",
                    "type": "string",
                    "offset": 1816,
                    "bitSize": 384
                },
                {
                    "name": "#protocol",
                    "type": "int",
                    "offset": 920,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#is_mp",
                    "type": "uint",
                    "offset": 2648,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#is_migrating",
                    "type": "uint",
                    "offset": 2649,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_3c83aaf4b52386c5",
                    "type": "int",
                    "offset": 696,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_671438d91ee14a83",
                    "type": "int",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_756c01933e1c7b2e",
                    "type": "uint",
                    "offset": 2651,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_460665ebc12305d7",
                    "type": "uint",
                    "offset": 2650,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_60ff95c0713324a4",
                    "type": "uint",
                    "offset": 2653,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#is_dedicated",
                    "type": "uint",
                    "offset": 2654,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#host_xuid",
                    "type": "uint64",
                    "offset": 1720,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#skill",
                    "type": "int",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#largest_party",
                    "type": "int",
                    "offset": 2200,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#latency",
                    "type": "int",
                    "offset": 2232,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_3155d04edc797a1a",
                    "type": "int",
                    "offset": 1784,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_70259f4fbb3f7a05",
                    "type": "string",
                    "offset": 1208,
                    "bitSize": 512
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 128,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 728,
                    "bitSize": 192
                },
                {
                    "name": "#__pad",
                    "type": "pad",
                    "offset": 2655,
                    "bitSize": 1,
                    "intSize": 1
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
        }
    ]
}