{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 72,
    "metatable": "#hash_94f2f6de4127ddc9",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 2047
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 71,
    "metatable": "#hash_336a7b35d05fd58c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 2047
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 70,
    "metatable": "#hash_6af507416991d051",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 2047
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 69,
    "metatable": "#hash_a7b60a34d7cda823",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 68,
    "metatable": "#hash_cc65ab4911849830",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 67,
    "metatable": "#hash_9271b9ca72802012",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 66,
    "metatable": "#hash_66e66254bbf2d657",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 65,
    "metatable": "#hash_928e91f051797c58",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 11744,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7dc6a8bfa8184f33",
                    "offset": 2600,
                    "bitSize": 9144
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 11745,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 11809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7dc6a8bfa8184f33",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 8,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 6776,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 9080,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 9096,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 9112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 9128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 64,
    "metatable": "#hash_718237f6ccb963f0",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 111600,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 109000
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 111601,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 111665,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 98832,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 105600,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 107904,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 107920,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 107936,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 107952,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108993,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108994,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108992,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 98560
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 98688,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 107968,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108995,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[24]",
                    "offset": 16,
                    "bitSize": 4608
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[24]",
                    "offset": 4624,
                    "bitSize": 1536
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 63,
    "metatable": "#hash_631a995dcc7300b6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 112368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 109768
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 112369,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 112433,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 99600,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 106368,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 108672,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 108688,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 108704,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 108720,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 109761,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 109762,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 109760,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 99328
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 99456,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 108736,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 109763,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[24]",
                    "offset": 64,
                    "bitSize": 4608
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[24]",
                    "offset": 4672,
                    "bitSize": 1536
                },
                {
                    "name": "#hash_44ed9a1ad38be40",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 48,
                    "intSize": 9,
                    "maxIntValue": 256
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 62,
    "metatable": "#hash_9c46de158fb1410f",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 114528,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 111928
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 114529,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 114593,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 101760,
                    "bitSize": 6768
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 108528,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 110832,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 110848,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 110864,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 110880,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 111921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 111922,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 111920,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 101632
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 110896,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 111923,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 232,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 136
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[24]",
                    "offset": 208,
                    "bitSize": 4608
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[24]",
                    "offset": 4816,
                    "bitSize": 1536
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 64,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_44ed9a1ad38be40",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 48,
                    "intSize": 9,
                    "maxIntValue": 256
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 48,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#charmindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 512
                },
                {
                    "name": "#deathfxindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 61,
    "metatable": "#hash_a23bfc9278237516",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 113664,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 111064
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 113665,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 113729,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 101760,
                    "bitSize": 5904
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 107664,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 109968,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 109984,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 110000,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 110016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 111057,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 111058,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 111056,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 101632
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 110032,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 111059,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 208,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 112
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 321,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[24]",
                    "offset": 208,
                    "bitSize": 4608
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[24]",
                    "offset": 4816,
                    "bitSize": 1536
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 64,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_44ed9a1ad38be40",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 48,
                    "intSize": 9,
                    "maxIntValue": 256
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 60,
    "metatable": "#hash_dcbef2012eaee3fd",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 113664,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 111064
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 113665,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 113729,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 101760,
                    "bitSize": 5904
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 107664,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 109968,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 109984,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 110000,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 110016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 111057,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 111058,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 111056,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 101632
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 110032,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 111059,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 208,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 112
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 321,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[24]",
                    "offset": 208,
                    "bitSize": 4608
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[24]",
                    "offset": 4816,
                    "bitSize": 1536
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 64,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_44ed9a1ad38be40",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 48,
                    "intSize": 9,
                    "maxIntValue": 256
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 59,
    "metatable": "#hash_fb250c467341e385",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 113664,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 111064
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 113665,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 113729,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 101760,
                    "bitSize": 5904
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 107664,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 109968,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 109984,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 110000,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 110016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 111057,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 111058,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 111056,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 101632
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 110032,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 111059,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 208,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 112
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 321,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[24]",
                    "offset": 208,
                    "bitSize": 4608
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 24
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[24]",
                    "offset": 4816,
                    "bitSize": 1536
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 64,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_44ed9a1ad38be40",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 48,
                    "intSize": 9,
                    "maxIntValue": 256
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 58,
    "metatable": "#hash_1789ac6464be7d37",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 80896,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 78296
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 80897,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 80961,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68992,
                    "bitSize": 5904
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 74896,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 77200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 77216,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 77232,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 77248,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 78289,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 78290,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 78288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 68864
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 77264,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78291,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 208,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 112
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 321,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 208,
                    "bitSize": 3072
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 3280,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 64,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_44ed9a1ad38be40",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 48,
                    "intSize": 9,
                    "maxIntValue": 256
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 57,
    "metatable": "#hash_22104b67bf37dbed",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 80896,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 78296
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 80897,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 80961,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68992,
                    "bitSize": 5904
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 74896,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 77200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 77216,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 77232,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 77248,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 78289,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 78290,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 78288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 68864
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 77264,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78291,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 208,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 112
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 321,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 208,
                    "bitSize": 3072
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 3280,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 64,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_44ed9a1ad38be40",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 48,
                    "intSize": 9,
                    "maxIntValue": 256
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 56,
    "metatable": "#hash_49288c13e598145d",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 80128,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 77528
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 80129,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 80193,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68224,
                    "bitSize": 5904
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 74128,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76432,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76448,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76464,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76480,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 77521,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 77522,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 77520,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 68096
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 76496,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 77523,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 208,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 112
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 321,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 160,
                    "bitSize": 3072
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 3232,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 16,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 55,
    "metatable": "#hash_949bc8f5dd0033c9",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 80128,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 77528
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 80129,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 80193,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68224,
                    "bitSize": 5904
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 74128,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76432,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76448,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76464,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76480,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 77521,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 77522,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 77520,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 68096
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 76496,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 77523,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 208,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 112
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 321,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 160,
                    "bitSize": 3072
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 3232,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 16,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 54,
    "metatable": "#hash_a7454feb6009b4d9",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 79840,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 77240
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 79841,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 79905,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68224,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73840,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76144,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76176,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76192,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 77233,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 77234,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 77232,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 68096
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 76208,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 77235,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 160,
                    "bitSize": 3072
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 3232,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 16,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#hash_63930aafa5d6ac7b",
                    "type": "uint[64]",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 53,
    "metatable": "#hash_bcb717de11c88be7",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 63328,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 60728
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 63329,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 63393,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 51712,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 57328,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 59632,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 59648,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 59664,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 59680,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 60721,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 60722,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 60720,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 51584
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 59696,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 60723,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 52,
    "metatable": "#hash_fd82d10860afb975",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 63328,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 60728
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 63329,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 63393,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 51712,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 57328,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 59632,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 59648,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 59664,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 59680,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 60721,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 60722,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 60720,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 51584
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 59696,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 60723,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 51,
    "metatable": "#hash_f75458aacfea7f9e",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78688,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 76088
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78689,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78753,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73712,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76032,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76048,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76064,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 76081,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 76082,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 76080,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 76083,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 50,
    "metatable": "#hash_c28a582c176194de",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78688,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 76088
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78689,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78753,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73712,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76032,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76048,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76064,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 76081,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 76082,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 76080,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 76083,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 49,
    "metatable": "#hash_34d9a65dad0b16f0",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78688,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 76088
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78689,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78753,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73712,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76032,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76048,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76064,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 76081,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 76082,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 76080,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 76083,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 48,
    "metatable": "#hash_af4ea509efd578c3",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78688,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 76088
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78689,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78753,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73712,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76032,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76048,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76064,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 76081,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 76082,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 76080,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 76083,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 47,
    "metatable": "#hash_2b143fdc5309de0f",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78688,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 76088
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78689,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78753,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5616
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73712,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 76016,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 76032,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 76048,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 76064,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 76081,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 76082,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 76080,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 76083,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 104
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 46,
    "metatable": "#hash_b527e0d667141576",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78400,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75800
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78401,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78465,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73424,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75728,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75744,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75760,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75776,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75793,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75794,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75792,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75795,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 45,
    "metatable": "#hash_d00b6d5bbd9c6909",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78400,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75800
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78401,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78465,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73424,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75728,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75744,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75760,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75776,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75793,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75794,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75792,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75795,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 44,
    "metatable": "#hash_2f1dc264c3eaa961",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78400,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75800
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78401,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78465,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 68096,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73424,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75728,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75744,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75760,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75776,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75793,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75794,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75792,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67968
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75795,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[16]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 3224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[16]",
                    "offset": 2200,
                    "bitSize": 1024
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 128
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[16]",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 43,
    "metatable": "#hash_eaf75df4dc0d3e40",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 94784,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 92184
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 94785,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 94849,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 84480,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 89808,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 92112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 92128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 92144,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 92160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 92177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 92178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 92176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 84352
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 92179,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 4248,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2200,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 42,
    "metatable": "#hash_134e1a4bbd5f439b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 94784,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 92184
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 94785,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 94849,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 84480,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 89808,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 92112,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 92128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 92144,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 92160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 92177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 92178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 92176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 84352
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 92179,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 152,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 4248,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2200,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 8,
                    "bitSize": 144,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 41,
    "metatable": "#hash_325da1e12fa6f6a1",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 94528,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 91928
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 94529,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 94593,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 84224,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 89552,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 91856,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 91872,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 91888,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 91904,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 91921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 91922,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 91920,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 84096
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 91923,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 136,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 4232,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2184,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[8]",
                    "offset": 8,
                    "bitSize": 128,
                    "intSize": 11,
                    "maxIntValue": 1024
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_768aeb6b928320d",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_705fa6d3f50ff148[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#hash_705fa6d3f50ff148",
            "members": [
                {
                    "name": "#hash_3d834aee4bd18d13",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 40,
    "metatable": "#hash_755f61c8e8463ff3",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78144,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75544
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 67840,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73168,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75472,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75488,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75504,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75520,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75537,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75538,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75536,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67712
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75539,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2184,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[8]",
                    "offset": 2056,
                    "bitSize": 128,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 39,
    "metatable": "#hash_4ac0f7926ec4f61a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78144,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75544
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 67840,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73168,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75472,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75488,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75504,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75520,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75537,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75538,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75536,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67712
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75539,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2184,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[8]",
                    "offset": 2056,
                    "bitSize": 128,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 38,
    "metatable": "#hash_797546a4bc34c326",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78144,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75544
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 67840,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73168,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75472,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75488,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75504,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75520,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75537,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75538,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75536,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67712
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75539,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2184,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[8]",
                    "offset": 2056,
                    "bitSize": 128,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 37,
    "metatable": "#hash_cbb9ce4fb52c184c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78144,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75544
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 67840,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73168,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75472,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75488,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75504,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75520,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75537,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75538,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75536,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67712
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75539,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2184,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[8]",
                    "offset": 2056,
                    "bitSize": 128,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 36,
    "metatable": "#hash_4edc22d4e85a5c85",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 78144,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 75544
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 78145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 67840,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 73168,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 75472,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 75488,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 75504,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 75520,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 75537,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 75538,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 75536,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 67712
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 75539,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2184,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[8]",
                    "offset": 2056,
                    "bitSize": 128,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 35,
    "metatable": "#hash_a83161b6219827",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 83392,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 80792
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 83393,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 83457,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 73088,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 78416,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 80720,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 80736,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 80752,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 80768,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 80785,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 80786,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 80784,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 72960
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 80787,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 2184,
                    "bitSize": 328
                },
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2512,
                    "bitSize": 2048
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[8]",
                    "offset": 2056,
                    "bitSize": 128,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 34,
    "metatable": "#hash_d183d838d396ee79",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 81344,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 78744
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 81345,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 81409,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 71040,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 76368,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 78672,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 78688,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 78704,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 78720,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 78737,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 78738,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 78736,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 70912
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78739,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 2056,
                    "bitSize": 328
                },
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 2048
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2384,
                    "bitSize": 2048
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[8]",
                    "offset": 0,
                    "bitSize": 64
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 33,
    "metatable": "#hash_ea0ecfeb376e3b8f",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 73152,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 70552
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 73153,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73217,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 62848,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 68176,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 70480,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 70496,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 70512,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 70528,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 70545,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 70546,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 70544,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 62720
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 70547,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 1800,
                    "bitSize": 328
                },
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 1792
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2128,
                    "bitSize": 1792
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[7]",
                    "offset": 0,
                    "bitSize": 56,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[7]",
                    "offset": 0,
                    "bitSize": 56
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 32,
    "metatable": "#hash_599087d1d2bb02b5",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 73152,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 70552
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 73153,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73217,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 62848,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 68176,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 70480,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 70496,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 70512,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 70528,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 70545,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 70546,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 70544,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 62720
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 70547,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 1800,
                    "bitSize": 328
                },
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 1792
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2128,
                    "bitSize": 1792
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[7]",
                    "offset": 0,
                    "bitSize": 56,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[7]",
                    "offset": 0,
                    "bitSize": 56
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 31,
    "metatable": "#hash_ae9f751609a05749",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 73152,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 70552
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 73153,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73217,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 62848,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 68176,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 70480,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 70496,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 70512,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 70528,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 70545,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 70546,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 70544,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 128,
                    "bitSize": 62720
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 70547,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 1800,
                    "bitSize": 328
                },
                {
                    "name": "#hash_b56427620aa34e1",
                    "type": "struct#hash_380775ab8e293fe7[32]",
                    "offset": 8,
                    "bitSize": 1792
                },
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 2128,
                    "bitSize": 1792
                }
            ]
        },
        {
            "name": "#hash_32aeae7311d2cd9b",
            "members": [
                {
                    "name": "#hash_212bcdfa518cc913",
                    "type": "uint[7]",
                    "offset": 0,
                    "bitSize": 56,
                    "intSize": 4,
                    "maxIntValue": 8
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_380775ab8e293fe7",
            "members": [
                {
                    "name": "#parts",
                    "type": "struct#hash_52f9ee07d542f724[7]",
                    "offset": 0,
                    "bitSize": 56
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#hash_52f9ee07d542f724",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_487a06a811f1cadc[8]",
                    "offset": 0,
                    "bitSize": 8
                }
            ]
        },
        {
            "name": "#hash_487a06a811f1cadc",
            "members": [
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 30,
    "metatable": "#hash_6c2cb61372444558",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 141800,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 139200
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 141801,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 141865,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 131496,
                    "bitSize": 5328
                },
                {
                    "name": "#customclassname",
                    "type": "string[18]",
                    "offset": 136824,
                    "bitSize": 2304
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 139128,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 139144,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 139160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 139176,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 2688,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#firstselectedloadouttype",
                    "type": "uint",
                    "offset": 131488,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 139193,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 139194,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 139192,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 2720,
                    "bitSize": 128768
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 8,
                    "bitSize": 2680
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 139195,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 2592,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 2648,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 2632,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 2624,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_50ee7b4f9ae0c518",
                    "type": "struct#hash_5b3226f1816b17a[2]",
                    "offset": 0,
                    "bitSize": 2592
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#itemlist",
                    "type": "struct#hash_74e0cb6ea60c0207[4]",
                    "offset": 0,
                    "bitSize": 7680
                },
                {
                    "name": "#selectedcharacteritems",
                    "type": "uint[4]",
                    "offset": 8008,
                    "bitSize": 32,
                    "intSize": 6,
                    "maxIntValue": 60
                },
                {
                    "name": "#selectedloadouttype",
                    "type": "uint",
                    "offset": 8040,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 7680,
                    "bitSize": 328
                }
            ]
        },
        {
            "name": "#hash_74e0cb6ea60c0207",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_160c0de2e27af8df[60]",
                    "offset": 0,
                    "bitSize": 1920
                }
            ]
        },
        {
            "name": "#hash_5b3226f1816b17a",
            "members": [
                {
                    "name": "#hash_506cb6b5f61bc9c5",
                    "type": "struct#hash_508eaeb5f638a293[5]",
                    "offset": 0,
                    "bitSize": 1280
                },
                {
                    "name": "#materialindex",
                    "type": "uint[2]",
                    "offset": 1280,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_160c0de2e27af8df",
            "members": [
                {
                    "name": "#colors",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 3,
                    "maxIntValue": 6
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 26,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_508eaeb5f638a293",
            "members": [
                {
                    "name": "#hash_7f4511917565841",
                    "type": "struct#hash_7bb1ee62fd31f6cb[4]",
                    "offset": 0,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_7bb1ee62fd31f6cb",
            "members": [
                {
                    "name": "#modelindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weight",
                    "type": "fixedpoint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 29,
    "metatable": "#hash_679761a970dcb439",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 140960,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 138360
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 140961,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 141025,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[16]",
                    "offset": 131504,
                    "bitSize": 4736
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 136240,
                    "bitSize": 2048
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 138288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 138304,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 138320,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 138336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 2696,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#firstselectedloadouttype",
                    "type": "uint",
                    "offset": 131496,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 138353,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 138354,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 138352,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 2728,
                    "bitSize": 128768
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 2680
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 138355,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 2592,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 2648,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 2632,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 2624,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_50ee7b4f9ae0c518",
                    "type": "struct#hash_5b3226f1816b17a[2]",
                    "offset": 0,
                    "bitSize": 2592
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#itemlist",
                    "type": "struct#hash_74e0cb6ea60c0207[4]",
                    "offset": 0,
                    "bitSize": 7680
                },
                {
                    "name": "#selectedcharacteritems",
                    "type": "uint[4]",
                    "offset": 8008,
                    "bitSize": 32,
                    "intSize": 6,
                    "maxIntValue": 60
                },
                {
                    "name": "#selectedloadouttype",
                    "type": "uint",
                    "offset": 8040,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 7680,
                    "bitSize": 328
                }
            ]
        },
        {
            "name": "#hash_74e0cb6ea60c0207",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_160c0de2e27af8df[60]",
                    "offset": 0,
                    "bitSize": 1920
                }
            ]
        },
        {
            "name": "#hash_5b3226f1816b17a",
            "members": [
                {
                    "name": "#hash_506cb6b5f61bc9c5",
                    "type": "struct#hash_508eaeb5f638a293[5]",
                    "offset": 0,
                    "bitSize": 1280
                },
                {
                    "name": "#materialindex",
                    "type": "uint[2]",
                    "offset": 1280,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 8,
                    "maxIntValue": 70
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_160c0de2e27af8df",
            "members": [
                {
                    "name": "#colors",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 3,
                    "maxIntValue": 6
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 26,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_508eaeb5f638a293",
            "members": [
                {
                    "name": "#hash_7f4511917565841",
                    "type": "struct#hash_7bb1ee62fd31f6cb[4]",
                    "offset": 0,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_7bb1ee62fd31f6cb",
            "members": [
                {
                    "name": "#modelindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weight",
                    "type": "fixedpoint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32
                }
            ]
        }
    ]
},
{
    "name": "#hash_32b2a4061b92b6cc",
    "version": 28,
    "metatable": "#hash_15b0c5c90d3bd80b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 140960,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cacloadouts",
                    "type": "struct#hash_7d7ba6a7d36476a0",
                    "offset": 2600,
                    "bitSize": 138360
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 2080,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 140961,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2088,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 32,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 141025,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_7d7ba6a7d36476a0",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[16]",
                    "offset": 131504,
                    "bitSize": 4736
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 136240,
                    "bitSize": 2048
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 138288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 138304,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 138320,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 138336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 2696,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#firstselectedloadouttype",
                    "type": "uint",
                    "offset": 131496,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 138353,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 138354,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 138352,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#loadoutversion",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#character[16]",
                    "offset": 2728,
                    "bitSize": 128768
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 2680
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 138355,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#charactercontext",
            "members": [
                {
                    "name": "#characterindex",
                    "type": "uint",
                    "offset": 2592,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#charactermode",
                    "type": "uint",
                    "offset": 2648,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#selectedheadindex",
                    "type": "uint[2]",
                    "offset": 2632,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 20
                },
                {
                    "name": "#selectedgender",
                    "type": "uint",
                    "offset": 2624,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_50ee7b4f9ae0c518",
                    "type": "struct#hash_5b3226f1816b17a[2]",
                    "offset": 0,
                    "bitSize": 2592
                }
            ]
        },
        {
            "name": "#mploadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_7455834bd1e6542c",
                    "offset": 96,
                    "bitSize": 96
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenadecount",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tacticalgear",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talent",
                    "type": "uint[6]",
                    "offset": 48,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#bonuscard",
                    "type": "uint[3]",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 289,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#itemlist",
                    "type": "struct#hash_74e0cb6ea60c0207[4]",
                    "offset": 0,
                    "bitSize": 7680
                },
                {
                    "name": "#selectedcharacteritems",
                    "type": "uint[4]",
                    "offset": 8008,
                    "bitSize": 32,
                    "intSize": 6,
                    "maxIntValue": 60
                },
                {
                    "name": "#selectedloadouttype",
                    "type": "uint",
                    "offset": 8040,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#showcaseweapon",
                    "type": "struct#variant",
                    "offset": 7680,
                    "bitSize": 328
                }
            ]
        },
        {
            "name": "#hash_74e0cb6ea60c0207",
            "members": [
                {
                    "name": "#items",
                    "type": "struct#hash_160c0de2e27af8df[60]",
                    "offset": 0,
                    "bitSize": 1920
                }
            ]
        },
        {
            "name": "#hash_5b3226f1816b17a",
            "members": [
                {
                    "name": "#hash_506cb6b5f61bc9c5",
                    "type": "struct#hash_508eaeb5f638a293[5]",
                    "offset": 0,
                    "bitSize": 1280
                },
                {
                    "name": "#materialindex",
                    "type": "uint[2]",
                    "offset": 1280,
                    "bitSize": 16,
                    "intSize": 5,
                    "maxIntValue": 16
                }
            ]
        },
        {
            "name": "#hash_7455834bd1e6542c",
            "members": [
                {
                    "name": "#itemindex",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#attachment",
                    "type": "int[7]",
                    "offset": 24,
                    "bitSize": 56,
                    "intSize": 6,
                    "maxIntValue": 31
                },
                {
                    "name": "#camoindex",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#reticleindex",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                }
            ]
        },
        {
            "name": "#variant",
            "members": [
                {
                    "name": "#variantname",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 128
                },
                {
                    "name": "#attachment",
                    "type": "int[8]",
                    "offset": 56,
                    "bitSize": 64,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#reticleindex",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#camoindex",
                    "type": "byte",
                    "offset": 288,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjobslot",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 64
                },
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 272,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 255
                },
                {
                    "name": "#variantindex",
                    "type": "int",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 512
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 248,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_160c0de2e27af8df",
            "members": [
                {
                    "name": "#colors",
                    "type": "uint[3]",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 3,
                    "maxIntValue": 6
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 26,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_508eaeb5f638a293",
            "members": [
                {
                    "name": "#hash_7f4511917565841",
                    "type": "struct#hash_7bb1ee62fd31f6cb[4]",
                    "offset": 0,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_7bb1ee62fd31f6cb",
            "members": [
                {
                    "name": "#modelindex",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weight",
                    "type": "fixedpoint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32
                }
            ]
        }
    ]
}