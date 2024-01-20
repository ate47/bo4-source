{
    "name": "#hash_4b183a2e9966c878",
    "version": 2,
    "metatable": "#hash_d2de2434185074f8",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_5aad3c28269ed622",
                    "type": "string",
                    "offset": 1096,
                    "bitSize": 64
                },
                {
                    "name": "#hash_1a1a1855f4dcf27c",
                    "type": "int",
                    "offset": 1160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_1e6cbdb3e41597ac",
                    "type": "int",
                    "offset": 568,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_3e16ca0beaa52782",
                    "type": "enum#hash_444b6eb55bc9535",
                    "offset": 1088,
                    "bitSize": 8
                },
                {
                    "name": "#party_size",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#nat_type",
                    "type": "enum#hash_405641015bd81f7d",
                    "offset": 824,
                    "bitSize": 8
                },
                {
                    "name": "#hash_607616ff980b70cb",
                    "type": "int",
                    "offset": 792,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_1aceb844508f1077",
                    "type": "string",
                    "offset": 600,
                    "bitSize": 192
                },
                {
                    "name": "#host_xuid",
                    "type": "uint64",
                    "offset": 1024,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_2dc6184a8ee2b80b",
                    "type": "int",
                    "offset": 536,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_5a10df4d02164354",
                    "type": "uint",
                    "offset": 1192,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 32,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 832,
                    "bitSize": 192
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1193,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_444b6eb55bc9535",
            "values": [
                "#join_type_friend",
                "#join_type_playlist",
                "#join_type_normal",
                "#join_type_invite",
                "#join_type_groups",
                "#join_type_party"
            ]
        },
        {
            "name": "#hash_405641015bd81f7d",
            "values": [
                "#xonline_nat_unknown",
                "#xonline_nat_open",
                "#xonline_nat_strict",
                "#xonline_nat_moderate"
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
        }
    ]
}