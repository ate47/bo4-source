{
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 66,
    "metatable": "#hash_eb02739ba6108f5c",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 41936
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 44528,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 44529,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 44593,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 36040,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 39880,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 41929,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 41930,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 41928,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 35904
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 41931,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 65,
    "metatable": "#hash_7e2cc2ab4fe5054f",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 41936
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 44528,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 44529,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 44593,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 36040,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 39880,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 41929,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 41930,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 41928,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 35904
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 41931,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 64,
    "metatable": "#hash_17806d88f1591443",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 38864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 41456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 41457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 41521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 32968,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 36808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 38857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 38858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 38856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 32832
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 38859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 63,
    "metatable": "#hash_afb810becb571d6c",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 38864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 41456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 41457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 41521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 32968,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 36808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 38857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 38858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 38856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 32832
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 38859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 62,
    "metatable": "#hash_b98c08dd8e62a9f1",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 38864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 41456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 41457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 41521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 32968,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 36808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 38857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 38858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 38856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 32832
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 38859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 61,
    "metatable": "#hash_c82af4be2fad98f1",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 38864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 41456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 41457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 41521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 32968,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 36808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 38857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 38858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 38856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 32832
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 38859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 60,
    "metatable": "#hash_7fec61d3616c7d43",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 38864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 41456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 41457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 41521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 32968,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 36808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 38857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 38858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 38856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 32832
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 38859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 59,
    "metatable": "#hash_2934edf8e4b52c9d",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 38864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 41456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 41457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 41521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 32968,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 36808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 38857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 38858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 38856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 32832
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 38859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 58,
    "metatable": "#hash_2feeb1deff6dce53",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 30672
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 33264,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 33265,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 33329,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 24776,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 28616,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 30665,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 30666,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 30664,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 24640
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 30667,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 57,
    "metatable": "#hash_18523246e13e6bfb",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 30864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 33456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 33457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 33521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 24968,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 28808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 30857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 30858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 30856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 24832
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 30859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 56,
    "metatable": "#hash_f3805436146dadd3",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 31440
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 34032,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 34033,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 34097,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 25544,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 29384,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 31433,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 31434,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 31432,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 25408
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 31435,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 55,
    "metatable": "#hash_3b394766bdbe78b1",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 31440
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 34032,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 34033,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 34097,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 25544,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 29384,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 31433,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 31434,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 31432,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 25408
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 31435,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 54,
    "metatable": "#hash_eed2b73b1eccc604",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 31440
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 34032,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 34033,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 34097,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 25544,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 29384,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 31433,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 31434,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 31432,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 25408
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 31435,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 53,
    "metatable": "#hash_67e7154a35898caf",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23248
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25840,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25841,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25905,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17352,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 21192,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23241,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23242,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23240,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 17216
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23243,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 52,
    "metatable": "#hash_a565ebe95af5dea",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23248
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25840,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25841,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25905,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17352,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 21192,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23241,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23242,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23240,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 17216
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23243,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 51,
    "metatable": "#hash_190f4eadb3697bb0",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23056
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25648,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25649,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25713,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17160,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 21000,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23049,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23050,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23048,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 17024
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23051,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 50,
    "metatable": "#hash_e4c69ab39fdc934c",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23056
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25648,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25649,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25713,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17160,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 21000,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23049,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23050,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23048,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 17024
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23051,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 49,
    "metatable": "#hash_6086aafd90f39995",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 18928
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 21520,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 21521,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 21585,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 13032,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 16872,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 18921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 18922,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 18920,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 12896
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 18923,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 48,
    "metatable": "#hash_a60e9f4f68cfc033",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 18928
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 21520,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 21521,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 21585,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 13032,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 16872,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 18921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 18922,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 18920,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 12896
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 18923,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 47,
    "metatable": "#hash_bdf5edd921864e0",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23024
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25616,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25617,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25681,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17128,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20968,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23017,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23018,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23016,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23019,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 46,
    "metatable": "#hash_9d0b8175a237ad2d",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23024
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25616,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25617,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25681,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17128,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20968,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23017,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23018,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23016,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23019,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 45,
    "metatable": "#hash_a97daf93ded576c0",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23024
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25616,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25617,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25681,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17128,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20968,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23017,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23018,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23016,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23019,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 44,
    "metatable": "#hash_a1ba594d3918ce25",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 23024
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25616,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25617,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25681,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17128,
                    "bitSize": 3840
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20968,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 23017,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 23018,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 23016,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 23019,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 136,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 104
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "type": "int",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 43,
    "metatable": "#hash_7ff4983c5f48b26a",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 22768
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25360,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25361,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25425,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17128,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20712,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 22761,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 22762,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 22760,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 22763,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 42,
    "metatable": "#hash_5df7837371c65241",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 22768
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25360,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25361,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25425,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17128,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20712,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 22761,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 22762,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 22760,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 22763,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
                    "maxIntValue": 127
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
            "name": "#hash_20631b664715b1fa",
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
                    "maxIntValue": 127
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 41,
    "metatable": "#hash_2d4085f18b788abc",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 22768
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25360,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25361,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25425,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17128,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20712,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 22761,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 22762,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 22760,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16992
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 22763,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 40,
    "metatable": "#hash_68762339c3c06ea3",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 26864
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 29456,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 29457,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 29521,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 21224,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 24808,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 26857,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 26858,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 26856,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 21088
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 26859,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 39,
    "metatable": "#hash_28f66d8835395d84",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 26800
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 29392,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 29393,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 29457,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 21160,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 24744,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 26793,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 26794,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 26792,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 21024
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 26795,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 38,
    "metatable": "#hash_73fa24343f5b402f",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 22704
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25296,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25297,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25361,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17064,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20648,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 22697,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 22698,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 22696,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16928
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 22699,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 37,
    "metatable": "#hash_68aa0c431b0c74b0",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 22704
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25296,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25297,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25361,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17064,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20648,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 22697,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 22698,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 22696,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16928
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 22699,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 36,
    "metatable": "#hash_a0fba43d2f1a231c",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 22704
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 25296,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 25297,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 25361,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 17064,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 20648,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 22697,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 22698,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 22696,
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
                    "type": "struct#character[4]",
                    "offset": 136,
                    "bitSize": 16928
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 22699,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 35,
    "metatable": "#hash_912a97659fc311d9",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 73488
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 76080,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 76081,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 76145,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 67848,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 71432,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 73481,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 73482,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 73480,
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
                    "offset": 136,
                    "bitSize": 67712
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73483,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 34,
    "metatable": "#hash_c9bbe754eef02fc6",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 73488
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 76080,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 76081,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 76145,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 67848,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 71432,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 73481,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 73482,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 73480,
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
                    "offset": 136,
                    "bitSize": 67712
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73483,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 33,
    "metatable": "#hash_e00dc701266df4bd",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 78736
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 81328,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 81329,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 81393,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 73096,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 76680,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 78729,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 78730,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 78728,
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
                    "offset": 136,
                    "bitSize": 72960
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 78731,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 32,
    "metatable": "#hash_42c4020fa821759d",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 76688
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 79280,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 79281,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 79345,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 71048,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 74632,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 76681,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 76682,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 76680,
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
                    "offset": 136,
                    "bitSize": 70912
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 76683,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 31,
    "metatable": "#hash_41e1b0b5b59a5635",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 68496
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 71088,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 71089,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 71153,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 62856,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 66440,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 68489,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 68490,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 68488,
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
                    "offset": 136,
                    "bitSize": 62720
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 68491,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 30,
    "metatable": "#hash_475942033e647948",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 68496
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 71088,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 71089,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 71153,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 62856,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 66440,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 68489,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 68490,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 68488,
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
                    "offset": 136,
                    "bitSize": 62720
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 68491,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 29,
    "metatable": "#hash_ede0c5795189a76b",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 68496
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 71088,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 71089,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 71153,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 62856,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 66440,
                    "bitSize": 2048
                },
                {
                    "name": "#firstselectedcharacterindex",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4a7be35adcdd0183",
                    "type": "uint",
                    "offset": 68489,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 68490,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 68488,
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
                    "offset": 136,
                    "bitSize": 62720
                },
                {
                    "name": "#charactercontext",
                    "type": "struct#charactercontext",
                    "offset": 16,
                    "bitSize": 88
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 68491,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        },
        {
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 28,
    "metatable": "#hash_ce2ba9fe2f94c765",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 137144
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 139736,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 139737,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 139801,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 131504,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 135088,
                    "bitSize": 2048
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
                    "offset": 137137,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 137138,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 137136,
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
                    "offset": 137139,
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
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
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
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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
    "name": "#hash_1dc5ee3a0d0cdff2",
    "version": 27,
    "metatable": "#hash_a732da05dc9127fb",
    "structs": [
        {
            "name": "#root",
            "members": [
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
                    "type": "struct#hash_31d8d99be94a78b7",
                    "offset": 2592,
                    "bitSize": 137144
                },
                {
                    "name": "#loadoutinitialized",
                    "type": "uint",
                    "offset": 139736,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_d4aef679e9c5e94",
                    "type": "uint[64]",
                    "offset": 139737,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_182458d9aadf50fe",
                    "type": "byte[64]",
                    "offset": 2080,
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
                    "offset": 139801,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_31d8d99be94a78b7",
            "members": [
                {
                    "name": "#customclass",
                    "type": "struct#hash_1489c97943984433[16]",
                    "offset": 131504,
                    "bitSize": 3584
                },
                {
                    "name": "#customclassname",
                    "type": "string[16]",
                    "offset": 135088,
                    "bitSize": 2048
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
                    "offset": 137137,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_490318f2d43cdc68",
                    "type": "uint",
                    "offset": 137138,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_6daffc8ba44646eb",
                    "type": "uint",
                    "offset": 137136,
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
                    "offset": 137139,
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
            "name": "#hash_1489c97943984433",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 128,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
                    "offset": 32,
                    "bitSize": 96
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
                    "name": "#herogadget",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
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
            "name": "#hash_2c79abcce61676aa",
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
            "name": "#hash_20631b664715b1fa",
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