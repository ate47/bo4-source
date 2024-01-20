{
    "name": "#hash_41114df22a1fbbb4",
    "version": 72,
    "metatable": "#hash_8e7e19b3f0069134",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8448,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8344
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8449,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1512,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8280,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8296,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8312,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8328,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[17]",
                    "offset": 8,
                    "bitSize": 1360
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1368,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 35
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 35
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
},
{
    "name": "#hash_41114df22a1fbbb4",
    "version": 71,
    "metatable": "#hash_9eaca1b8e5ab8511",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8448,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8344
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8449,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1512,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8280,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8296,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8312,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8328,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[17]",
                    "offset": 8,
                    "bitSize": 1360
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1368,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 35
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 35
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
},
{
    "name": "#hash_41114df22a1fbbb4",
    "version": 70,
    "metatable": "#hash_f2762ec595049be5",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8448,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8344
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8449,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1512,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8280,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8296,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8312,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8328,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[17]",
                    "offset": 8,
                    "bitSize": 1360
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1368,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
},
{
    "name": "#hash_41114df22a1fbbb4",
    "version": 69,
    "metatable": "#hash_603b178861d61d91",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8448,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8344
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8449,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1512,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8280,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8296,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8312,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8328,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[17]",
                    "offset": 8,
                    "bitSize": 1360
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1368,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
},
{
    "name": "#hash_41114df22a1fbbb4",
    "version": 68,
    "metatable": "#hash_40d7bd75e1ddd843",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8448,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8344
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8449,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1512,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8280,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8296,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8312,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8328,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[17]",
                    "offset": 8,
                    "bitSize": 1360
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1368,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
},
{
    "name": "#hash_41114df22a1fbbb4",
    "version": 67,
    "metatable": "#hash_cb960fbc0a9de8f8",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8368,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8264
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8336,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1432,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8216,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8232,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8248,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[16]",
                    "offset": 8,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1288,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
},
{
    "name": "#hash_41114df22a1fbbb4",
    "version": 66,
    "metatable": "#hash_be621d05cadc0064",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8368,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8264
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8336,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1432,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8216,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8232,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8248,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[16]",
                    "offset": 8,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1288,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
},
{
    "name": "#hash_41114df22a1fbbb4",
    "version": 65,
    "metatable": "#hash_3f90ce7bf3d1cce7",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 8368,
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
                    "type": "struct#hash_6ae2bd306baa2303",
                    "offset": 72,
                    "bitSize": 8264
                },
                {
                    "name": "#hash_6eb648836297a49d",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#hash_79b61d12da6b8b89",
                    "type": "uint",
                    "offset": 8336,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_93bd4dce8c67dc8",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8369,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6ae2bd306baa2303",
            "members": [
                {
                    "name": "#loadoutversion",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#customclass",
                    "type": "struct#mploadout[18]",
                    "offset": 1432,
                    "bitSize": 6768
                },
                {
                    "name": "#killstreak1",
                    "type": "uint",
                    "offset": 8200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak2",
                    "type": "uint",
                    "offset": 8216,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak3",
                    "type": "uint",
                    "offset": 8232,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#killstreak4",
                    "type": "uint",
                    "offset": 8248,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#characters",
                    "type": "struct#hash_19c98eedc0c386e8[16]",
                    "offset": 8,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_20d6751cb2f9ca09",
                    "type": "uint[9]",
                    "offset": 1288,
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
            "name": "#hash_19c98eedc0c386e8",
            "members": [
                {
                    "name": "#selectedoutfit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b",
                    "offset": 16,
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
        }
    ]
}