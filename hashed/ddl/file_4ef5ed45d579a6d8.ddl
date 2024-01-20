{
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 77,
    "metatable": "#hash_41bf556af64620dc",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 535936,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 10752,
                    "bitSize": 525184
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[60]",
                    "offset": 32,
                    "bitSize": 8160
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 535937,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 10240,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 8192,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 536001,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 254040,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 260280,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 254032,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 251472,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 262585,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 262586,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 262584,
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
                    "type": "struct#character[28]",
                    "offset": 144,
                    "bitSize": 251328
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 261560,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 262587,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[35]",
                    "offset": 16,
                    "bitSize": 6720
                },
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
                    "type": "struct#hash_32aeae7311d2cd9b[35]",
                    "offset": 6736,
                    "bitSize": 2240
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 76,
    "metatable": "#hash_8d8d55e271b67450",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 464128,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 10752,
                    "bitSize": 453376
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[60]",
                    "offset": 32,
                    "bitSize": 8160
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 464129,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 10240,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 8192,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 464193,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 218136,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 224376,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 218128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 215568,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 226681,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 226682,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 226680,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 215424
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 225656,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 226683,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[35]",
                    "offset": 16,
                    "bitSize": 6720
                },
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
                    "type": "struct#hash_32aeae7311d2cd9b[35]",
                    "offset": 6736,
                    "bitSize": 2240
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 75,
    "metatable": "#hash_52fb6418c6a9f75b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 427264,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 10752,
                    "bitSize": 416512
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[60]",
                    "offset": 32,
                    "bitSize": 8160
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 427265,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 10240,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 8192,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 427329,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199704,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205944,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199696,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 208249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 208250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 208248,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 207224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 208251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 74,
    "metatable": "#hash_e10c739ed8812536",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 425904,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 416512
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 425905,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 425969,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199704,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205944,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199696,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 208249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 208250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 208248,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 207224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 208251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 73,
    "metatable": "#hash_70ee67ee10b693b2",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 425904,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 416512
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 425905,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 425969,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199704,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205944,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199696,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 208249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 208250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 208248,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 207224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 208251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 72,
    "metatable": "#hash_244335a842bf68e9",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 425904,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 416512
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 425905,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 425969,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199704,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205944,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199696,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 208249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 208250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 208248,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 207224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 208251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 71,
    "metatable": "#hash_3204dda4898cf7de",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 425904,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 416512
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 425905,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 425969,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199704,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205944,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199696,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 208249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 208250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 208248,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 207224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 208251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 70,
    "metatable": "#hash_ed3f964b441cc354",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 425904,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 416512
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 425905,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 425969,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199704,
                    "bitSize": 6240
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205944,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199696,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2560
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 208249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 208250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 208248,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 207224,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 208251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 488,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 352,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 32,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_4e153e9373f1683c",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 80,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#hash_10b7b244c876d78a",
                    "type": "uint[5]",
                    "offset": 216,
                    "bitSize": 40,
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
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 69,
    "metatable": "#hash_c105deea1666a28",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 424144,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 414752
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 424145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 424209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199304,
                    "bitSize": 5760
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205064,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199296,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 207369,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 207370,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 207368,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 206344,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 207371,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 440,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 68,
    "metatable": "#hash_50e6cbeab2959daa",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 424144,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 414752
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 424145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 424209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 199304,
                    "bitSize": 5760
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 205064,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 199296,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 197136,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 207369,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 207370,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 207368,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 196992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 206344,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 207371,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 440,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#character",
            "members": [
                {
                    "name": "#hash_7cf85c301a206997",
                    "type": "struct#hash_768aeb6b928320d[32]",
                    "offset": 16,
                    "bitSize": 6144
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
                    "name": "#hash_4d9fceac8ff24cbd",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#hash_e5c77948998e49",
                    "type": "struct#hash_32aeae7311d2cd9b[32]",
                    "offset": 6160,
                    "bitSize": 2048
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 67,
    "metatable": "#hash_b962af15ce00d127",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 325840,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 316448
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 325841,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 325905,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 150152,
                    "bitSize": 5760
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 155912,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 150144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 147984,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 158217,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 158218,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 158216,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 147840
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 157192,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 158219,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 440,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 66,
    "metatable": "#hash_8915f4970e515867",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 328144,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 318752
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 328145,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 328209,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 151304,
                    "bitSize": 5760
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 157064,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 151296,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 149136,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 159369,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 159370,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 159368,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 148992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 158344,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 159371,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 440,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 65,
    "metatable": "#hash_f2406e9879e9d53c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 335056,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 9392,
                    "bitSize": 325664
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 6800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 335057,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 8880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 6832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 335121,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 154760,
                    "bitSize": 5760
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 160520,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 154752,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 152592,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 162825,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 162826,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 162824,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 152448
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 161800,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 162827,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 440,
                    "bitSize": 136
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 136
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 64,
    "metatable": "#hash_96d29b98438e5b90",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 332896,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 8192,
                    "bitSize": 324704
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5600
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 332897,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7680,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5632,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 332961,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 154760,
                    "bitSize": 5280
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 160040,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 154752,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 152592,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 162345,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 162346,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 162344,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 152448
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 161320,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 162347,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 416,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 112
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 63,
    "metatable": "#hash_c1d2f986ba36ba83",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 332896,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 8192,
                    "bitSize": 324704
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5600
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 332897,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7680,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5632,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 332961,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 154760,
                    "bitSize": 5280
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 160040,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 154752,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 152592,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 162345,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 162346,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 162344,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 152448
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 161320,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 162347,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 416,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 112
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 62,
    "metatable": "#hash_73c2811923492065",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 234592,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 8192,
                    "bitSize": 226400
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5600
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 234593,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7680,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5632,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 234657,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 105608,
                    "bitSize": 5280
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 110888,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 105600,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 103440,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 113193,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 113194,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 113192,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 103296
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 112168,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 113195,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 416,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 112
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 61,
    "metatable": "#hash_aa9a0ccbd8188599",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 234592,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 8192,
                    "bitSize": 226400
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5600
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 234593,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7680,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5632,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 234657,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 105608,
                    "bitSize": 5280
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 110888,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 105600,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 103440,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 113193,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 113194,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 113192,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 103296
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 112168,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 113195,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 416,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 112
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 60,
    "metatable": "#hash_867c3cc9283cf561",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 232288,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 8192,
                    "bitSize": 224096
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5600
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 232289,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7680,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5632,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 232353,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104456,
                    "bitSize": 5280
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 109736,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104448,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102288,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 112041,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 112042,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 112040,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 102144
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 111016,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 112043,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 416,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 112
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 59,
    "metatable": "#hash_4c5ff243d5f705c2",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 232288,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 8192,
                    "bitSize": 224096
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5600
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 232289,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7680,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5632,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 232353,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104456,
                    "bitSize": 5280
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 109736,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104448,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102288,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 112041,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 112042,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 112040,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 102144
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 111016,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 112043,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 416,
                    "bitSize": 112
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 112
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 58,
    "metatable": "#hash_532e0e642d090b60",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 231568,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 223776
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 231569,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 231633,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104456,
                    "bitSize": 5120
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 109576,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104448,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102288,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 111881,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 111882,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 111880,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 102144
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 110856,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 111883,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 408,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 57,
    "metatable": "#hash_995efd43c551cf6c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 182032,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 174240
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 182033,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 182097,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 79688,
                    "bitSize": 5120
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 84808,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 79680,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 77520,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 87113,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 87114,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 87112,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 77376
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 86088,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 87115,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 408,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 56,
    "metatable": "#hash_2b0bd72668cc361a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 182032,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 174240
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 182033,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 182097,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 79688,
                    "bitSize": 5120
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 84808,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 79680,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 77520,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 87113,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 87114,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 87112,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 77376
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_f48e22ced35e56d",
                    "type": "uint[1024]",
                    "offset": 86088,
                    "bitSize": 1024,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 87115,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 408,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 55,
    "metatable": "#hash_aa6eea904f56c988",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 229136,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 221344
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 229137,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 229201,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 5120
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 109384,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 110665,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 110666,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 110664,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 110667,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 408,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 54,
    "metatable": "#hash_d09e3b3e6109a18d",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 229136,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 221344
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 229137,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 229201,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 5120
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 109384,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 110665,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 110666,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 110664,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 110667,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 408,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 304,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#elixirs",
                    "type": "struct#hash_5fe8e8cb2b27ba05",
                    "offset": 72,
                    "bitSize": 216
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 53,
    "metatable": "#hash_699d7f8ea849e356",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 224816,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 217024
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 224817,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 224881,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 2960
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 107224,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108505,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108506,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108504,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108507,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 192,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 52,
    "metatable": "#hash_f255925a0247f45e",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 224816,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 217024
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 224817,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 224881,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 2960
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 107224,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108505,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108506,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108504,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108507,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 192,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 51,
    "metatable": "#hash_f3f1e63df9fa9810",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 224816,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 217024
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 224817,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 224881,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 2960
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 107224,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108505,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108506,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108504,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108507,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 192,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 50,
    "metatable": "#hash_82d756912fa336f8",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 224816,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7792,
                    "bitSize": 217024
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 5200
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 224817,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 7280,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 5232,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 224881,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
                    "name": "#weaponmodelslot",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#paintjobslot",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 2960
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 107224,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108505,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108506,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108504,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108507,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 192,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 104
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 49,
    "metatable": "#hash_a274319b40bb1564",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 224096,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 216704
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 224097,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 224161,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 107064,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108345,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108346,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108344,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108347,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 48,
    "metatable": "#hash_aabc662075357309",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 224096,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 216704
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 224097,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 224161,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 107064,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108345,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108346,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108344,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108347,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 47,
    "metatable": "#hash_fd2c5a0a638faa6c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 224096,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 216704
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 224097,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 224161,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 104264,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 107064,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 104256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 102096,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 108345,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 108346,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 108344,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101952
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 108347,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 46,
    "metatable": "#hash_b33755cd6276afa6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 273248,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 265856
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 273249,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 273313,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 128840,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 131640,
                    "bitSize": 1280
                },
                {
                    "name": "#hash_78e9cef0ed273bd",
                    "type": "uint",
                    "offset": 128832,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 126672,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 132921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 132922,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 132920,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 126528
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 132923,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
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
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 45,
    "metatable": "#hash_f7dba794f73c1f8d",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 273232,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 265840
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 273233,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 273297,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 128832,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 131632,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 126672,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 132913,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 132914,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 132912,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 126528
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 132915,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
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
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 44,
    "metatable": "#hash_e007fa72ae1dd6cc",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 272464,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 265072
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 272465,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 272529,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 128448,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 131248,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 126288,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 132529,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 132530,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 132528,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 126144
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 132531,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
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
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 43,
    "metatable": "#hash_ef7ae34f3e72eee6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 223312,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 215920
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 223313,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 223377,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 103872,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 106672,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 101712,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 107953,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 107954,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 107952,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101568
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 107955,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
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
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 42,
    "metatable": "#hash_c740288955a06c35",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 223312,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 215920
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 223313,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 223377,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 103872,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 106672,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 101712,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 107953,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 107954,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 107952,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101568
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 107955,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
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
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 41,
    "metatable": "#hash_1e6d57f104869165",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 223312,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 215920
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 223313,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 223377,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 103872,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 106672,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 101712,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 107953,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 107954,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 107952,
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
                    "type": "struct#character[24]",
                    "offset": 144,
                    "bitSize": 101568
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 107955,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
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
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 40,
    "metatable": "#hash_c251466f1118afdf",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 197920,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 190528
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 197921,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 197985,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 91176,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 93976,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 89016,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 95257,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 95258,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 95256,
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
                    "type": "struct#character[21]",
                    "offset": 144,
                    "bitSize": 88872
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 95259,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 39,
    "metatable": "#hash_cd89b40c0f136a2",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 197920,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 190528
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 197921,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 197985,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 91176,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 93976,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 89016,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 95257,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 95258,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 95256,
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
                    "type": "struct#character[21]",
                    "offset": 144,
                    "bitSize": 88872
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 95259,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 38,
    "metatable": "#hash_6e68cab41955f5f5",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 211696,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 204304
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 211697,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 211761,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 98064,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 100864,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 95904,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 102145,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 102146,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 102144,
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
                    "type": "struct#character[21]",
                    "offset": 144,
                    "bitSize": 95760
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 102147,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 37,
    "metatable": "#hash_4e12681ab01a819b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 206320,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 198928
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 206321,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 206385,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 95376,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 98176,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 93216,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 99457,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 99458,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 99456,
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
                    "type": "struct#character[21]",
                    "offset": 144,
                    "bitSize": 93072
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 99459,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 36,
    "metatable": "#hash_72a67e5bf24b587d",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 184816,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 177424
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 184817,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 184881,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 84624,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 87424,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 82464,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 88705,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 88706,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 88704,
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
                    "type": "struct#character[21]",
                    "offset": 144,
                    "bitSize": 82320
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 88707,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 35,
    "metatable": "#hash_ccbc18ad130fcff",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 184816,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 177424
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 184817,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 184881,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 84624,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 87424,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 82464,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 88705,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 88706,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 88704,
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
                    "type": "struct#character[21]",
                    "offset": 144,
                    "bitSize": 82320
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 88707,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 34,
    "metatable": "#hash_d57d6a47c9ec2314",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 184816,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 177424
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 184817,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 184881,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 84624,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 87424,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 82464,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 88705,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 88706,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 88704,
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
                    "type": "struct#character[21]",
                    "offset": 144,
                    "bitSize": 82320
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 88707,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 33,
    "metatable": "#hash_cbd9e0d3595b3b53",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 363392,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 356000
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 363393,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 363457,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 173912,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 176712,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 171744,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 2704,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#firstselectedloadouttype",
                    "type": "uint",
                    "offset": 173904,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 177993,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 177994,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 177992,
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
                    "type": "struct#character[21]",
                    "offset": 2736,
                    "bitSize": 169008
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 2680
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 177995,
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
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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
    "name": "#hash_4ef5ed45d579a6d8",
    "version": 32,
    "metatable": "#hash_10cc4875c23724fa",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 202432,
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
                    "type": "struct#hash_18b04f5b045db908[2]",
                    "offset": 7392,
                    "bitSize": 195040
                },
                {
                    "name": "#variant",
                    "type": "struct#hash_51ee933f6ee8ec54[50]",
                    "offset": 32,
                    "bitSize": 4800
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 202433,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 6880,
                    "bitSize": 512,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#reserveints",
                    "type": "int[64]",
                    "offset": 4832,
                    "bitSize": 2048,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 202497,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_18b04f5b045db908",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#zmloadout[10]",
                    "offset": 93432,
                    "bitSize": 2800
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 96232,
                    "bitSize": 1280
                },
                {
                    "name": "#bubblegumpack",
                    "type": "struct#hash_5fe8e8cb2b27ba05[10]",
                    "offset": 91264,
                    "bitSize": 2160
                },
                {
                    "name": "#equippedbubblegumpack",
                    "type": "int",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 2704,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#firstselectedloadouttype",
                    "type": "uint",
                    "offset": 93424,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 97513,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 97514,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 97512,
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
                    "type": "struct#character[11]",
                    "offset": 2736,
                    "bitSize": 88528
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 24,
                    "bitSize": 2680
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 97515,
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
            "name": "#hash_51ee933f6ee8ec54",
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
            "name": "#zmloadout",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 184,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_51ee933f6ee8ec54",
                    "offset": 88,
                    "bitSize": 96
                },
                {
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#primarygrenade",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#specialty",
                    "type": "uint[6]",
                    "offset": 24,
                    "bitSize": 48,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#talisman1",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                }
            ]
        },
        {
            "name": "#hash_5fe8e8cb2b27ba05",
            "members": [
                {
                    "name": "#packname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 136
                },
                {
                    "name": "#bubblegumbuff",
                    "type": "uint[5]",
                    "offset": 136,
                    "bitSize": 80,
                    "intSize": 10,
                    "maxIntValue": 1023
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