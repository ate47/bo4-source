{
    "name": "#hash_4e26602f21b91450",
    "version": 9,
    "metatable": "#hash_66749944facb661a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 2112,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 8656,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#hash_48c11ed545fa1e34",
                    "type": "struct#hash_583c45da3d8d77ed",
                    "offset": 8376,
                    "bitSize": 280
                },
                {
                    "name": "#party_members",
                    "type": "struct#hash_3754ae573cf9924d[10]",
                    "offset": 192,
                    "bitSize": 1920
                },
                {
                    "name": "#searches",
                    "type": "struct#hash_2f2fcb46292be6b[10]",
                    "offset": 2616,
                    "bitSize": 5760
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
            "name": "#hash_583c45da3d8d77ed",
            "members": [
                {
                    "name": "#hash_522c2d85063ec515",
                    "type": "uint64",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_56a1b6d783aa7a25",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_248adccf3c622adc",
                    "type": "uint64",
                    "offset": 8,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_3ea89a34996a2329",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
                },
                {
                    "name": "#hash_22bebb24c7131b96",
                    "type": "int",
                    "offset": 264,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
                },
                {
                    "name": "#hash_2b4a32e71c22452",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_329a52ffc78a973",
                    "type": "uint",
                    "offset": 272,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#__pad",
                    "type": "pad",
                    "offset": 273,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_3754ae573cf9924d",
            "members": [
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_1d1bf732b0333b59",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_70f1765710df7771",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#hash_2f2fcb46292be6b",
            "members": [
                {
                    "name": "#hash_46838162d06a1e0d",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_5c868775a96e3de0",
                    "type": "uint64",
                    "offset": 288,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_63088d1189c30c01",
                    "type": "uint64",
                    "offset": 512,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#search_outcome",
                    "type": "int",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_efdbe96a9503cf",
                    "type": "uint64",
                    "offset": 416,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_300f7cbb339f0026",
                    "type": "uint64",
                    "offset": 192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_4c352a5202cdd23f",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_391c576ac028696a",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#playlist_version",
                    "type": "int",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#playlist_id",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#ffotd_version",
                    "type": "int",
                    "offset": 480,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        }
    ]
}