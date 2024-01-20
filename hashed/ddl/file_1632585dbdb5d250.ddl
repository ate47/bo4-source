{
    "name": "#hash_1632585dbdb5d250",
    "version": 35,
    "metatable": "#hash_14f01c93e50e6112",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#hash_3ddb4b48b795bd91",
                    "type": "string",
                    "offset": 1752,
                    "bitSize": 320
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2872,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3832,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3896,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2864,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2880,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 2072,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[59]",
                    "offset": 2888,
                    "bitSize": 944
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[59]",
                    "offset": 3904,
                    "bitSize": 59,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3963,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 34,
    "metatable": "#hash_357511b13d992253",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#hash_3ddb4b48b795bd91",
                    "type": "string",
                    "offset": 1752,
                    "bitSize": 320
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2872,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3800,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3864,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2864,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2880,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 2072,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[57]",
                    "offset": 2888,
                    "bitSize": 912
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[57]",
                    "offset": 3872,
                    "bitSize": 57,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3929,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 33,
    "metatable": "#hash_543c58d5d63f4fb6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#hash_3ddb4b48b795bd91",
                    "type": "string",
                    "offset": 1752,
                    "bitSize": 320
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2872,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3784,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3848,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2864,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2880,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 2072,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[56]",
                    "offset": 2888,
                    "bitSize": 896
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[56]",
                    "offset": 3856,
                    "bitSize": 56,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 32,
    "metatable": "#hash_4e17738a65943c95",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#hash_3ddb4b48b795bd91",
                    "type": "string",
                    "offset": 1752,
                    "bitSize": 320
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2872,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3752,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3816,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2864,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2880,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 2072,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[54]",
                    "offset": 2888,
                    "bitSize": 864
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[54]",
                    "offset": 3824,
                    "bitSize": 54,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3878,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 31,
    "metatable": "#hash_62c88f9c57001a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2552,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3432,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3496,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2544,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2560,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[54]",
                    "offset": 2568,
                    "bitSize": 864
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[54]",
                    "offset": 3504,
                    "bitSize": 54,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3558,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 30,
    "metatable": "#hash_850e26d264e79a59",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2552,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3416,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3480,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2544,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2560,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[53]",
                    "offset": 2568,
                    "bitSize": 848
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[53]",
                    "offset": 3488,
                    "bitSize": 53,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3541,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 29,
    "metatable": "#hash_49d7ab7e72a5b579",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2552,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3416,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3480,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2544,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2560,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[53]",
                    "offset": 2568,
                    "bitSize": 848
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[53]",
                    "offset": 3488,
                    "bitSize": 53,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3541,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 28,
    "metatable": "#hash_149f138a224a237a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2456,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3320,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3384,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2448,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2464,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 696
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[53]",
                    "offset": 2472,
                    "bitSize": 848
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[53]",
                    "offset": 3392,
                    "bitSize": 53,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3445,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 40,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 104,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 168,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 27,
    "metatable": "#hash_add2766f90f3b27",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2456,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3288,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2448,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2464,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 696
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[51]",
                    "offset": 2472,
                    "bitSize": 816
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[51]",
                    "offset": 3360,
                    "bitSize": 51,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3411,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contractid",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 40,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 104,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 168,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 26,
    "metatable": "#hash_9c72ba15380486b9",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2360,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2368,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 600
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[51]",
                    "offset": 2376,
                    "bitSize": 816
                },
                {
                    "name": "#hash_4473319d8a8d9dcf",
                    "type": "uint[51]",
                    "offset": 3264,
                    "bitSize": 51,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3315,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 8,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 25,
    "metatable": "#hash_edd13a9f0eb814b9",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2360,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2368,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 600
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[51]",
                    "offset": 2376,
                    "bitSize": 816
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 8,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 24,
    "metatable": "#hash_76a3ead57551e1b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2360,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3192,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2368,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 600
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[51]",
                    "offset": 2376,
                    "bitSize": 816
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 8,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 23,
    "metatable": "#hash_ea8731b8b254dab6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2360,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3112,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3176,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2368,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 600
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[46]",
                    "offset": 2376,
                    "bitSize": 736
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 8,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 22,
    "metatable": "#hash_c6b8c98b850285ab",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2360,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3112,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3176,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2368,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 600
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[46]",
                    "offset": 2376,
                    "bitSize": 736
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 8,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 21,
    "metatable": "#hash_b7e1fccd8a280d64",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2552,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3304,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3368,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2544,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2560,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[46]",
                    "offset": 2568,
                    "bitSize": 736
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#hash_6bcde715574b1e8",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 20,
    "metatable": "#hash_828820ea2dd53f04",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2552,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3288,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2544,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2560,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[45]",
                    "offset": 2568,
                    "bitSize": 720
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#hash_6bcde715574b1e8",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 19,
    "metatable": "#hash_e8efafd7298ff1da",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2552,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3272,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3336,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_tier_boost",
                    "type": "byte",
                    "offset": 2544,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bo_pass_party_tier_boost",
                    "type": "byte",
                    "offset": 2560,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[44]",
                    "offset": 2568,
                    "bitSize": 704
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#hash_6bcde715574b1e8",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 18,
    "metatable": "#hash_25b6b84dbf4457a8",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2544,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3256,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3320,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[44]",
                    "offset": 2552,
                    "bitSize": 704
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#hash_6bcde715574b1e8",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 17,
    "metatable": "#hash_3ddae8be6ea790f1",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2544,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3256,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3320,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 792
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[44]",
                    "offset": 2552,
                    "bitSize": 704
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#hash_6bcde715574b1e8",
                    "type": "float",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 200,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 16,
    "metatable": "#hash_6345ac820af38fd6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 2352,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 3064,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 3128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#loot_contracts",
                    "type": "struct#hash_21869aff174e9b46[3]",
                    "offset": 1752,
                    "bitSize": 600
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[44]",
                    "offset": 2360,
                    "bitSize": 704
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_21869aff174e9b46",
            "members": [
                {
                    "name": "#contracthash",
                    "type": "float",
                    "offset": 8,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#progress",
                    "type": "uint64",
                    "offset": 72,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#target",
                    "type": "uint64",
                    "offset": 136,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#contractgamemode",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 5
                }
            ]
        },
        {
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 15,
    "metatable": "#hash_1482b2b38bea693c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2464,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2528,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[44]",
                    "offset": 1760,
                    "bitSize": 704
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 14,
    "metatable": "#hash_4380907c981af577",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2448,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2512,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[43]",
                    "offset": 1760,
                    "bitSize": 688
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 13,
    "metatable": "#hash_1e472360da15532e",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2448,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2512,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[43]",
                    "offset": 1760,
                    "bitSize": 688
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 12,
    "metatable": "#hash_3a2857afda340c54",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2432,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2496,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[42]",
                    "offset": 1760,
                    "bitSize": 672
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 11,
    "metatable": "#hash_4a1b801ec965636e",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2432,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2496,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[42]",
                    "offset": 1760,
                    "bitSize": 672
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 10,
    "metatable": "#hash_aedd35dc2a556b7f",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2432,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2496,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[42]",
                    "offset": 1760,
                    "bitSize": 672
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 9,
    "metatable": "#hash_9a95f563d189fd5a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2432,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2496,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[42]",
                    "offset": 1760,
                    "bitSize": 672
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 8,
    "metatable": "#hash_62e37cbbc39e6a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2432,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2496,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[42]",
                    "offset": 1760,
                    "bitSize": 672
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 7,
    "metatable": "#hash_97e99fb805b2d9aa",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 2400,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 2464,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4953b2b12f1d6b1b",
                    "type": "struct#hash_1c86958671ff27fd[40]",
                    "offset": 1760,
                    "bitSize": 640
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
            "name": "#hash_1c86958671ff27fd",
            "members": [
                {
                    "name": "#hash_50ab8b7df567cd2a",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 6,
    "metatable": "#hash_69fd4736b52053f5",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 1760,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#tier_boost",
                    "type": "byte",
                    "offset": 1824,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
        }
    ]
},
{
    "name": "#hash_1632585dbdb5d250",
    "version": 5,
    "metatable": "#hash_13f8b79e6e54a4b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4ab54418f478f3e2",
                    "type": "struct#hash_6580ccf5f8a0ef6",
                    "offset": 0,
                    "bitSize": 1752
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 1752,
                    "bitSize": 8
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 1760,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#hash_6580ccf5f8a0ef6",
            "members": [
                {
                    "name": "#hash_67599f190572ca79",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_79dab5910f08a8a2",
                    "type": "string",
                    "offset": 32,
                    "bitSize": 1024
                },
                {
                    "name": "#country",
                    "type": "string",
                    "offset": 1088,
                    "bitSize": 16
                },
                {
                    "name": "#language",
                    "type": "string",
                    "offset": 1168,
                    "bitSize": 40
                },
                {
                    "name": "#timezone",
                    "type": "string",
                    "offset": 1104,
                    "bitSize": 64
                },
                {
                    "name": "#region",
                    "type": "string",
                    "offset": 1240,
                    "bitSize": 512
                },
                {
                    "name": "#latitude",
                    "type": "fixedpoint",
                    "offset": 1208,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#longitude",
                    "type": "fixedpoint",
                    "offset": 1056,
                    "bitSize": 32,
                    "intSize": 32
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
        }
    ]
}