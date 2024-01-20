{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 68,
    "metatable": "#hash_45bf7cae33fcc823",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 67,
    "metatable": "#hash_d5956de752733ae",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 66,
    "metatable": "#hash_8ebef46489377833",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 65,
    "metatable": "#hash_c714dc2c03f5c2df",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 64,
    "metatable": "#hash_6658beaa07871622",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 63,
    "metatable": "#hash_d5846ce41cd48ebe",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 62,
    "metatable": "#hash_30fcaa56c82bdcaf",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 61,
    "metatable": "#hash_b1ad210c3926e6df",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 60,
    "metatable": "#hash_8a8a03145ba0147c",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 59,
    "metatable": "#hash_22fd0bebe6fcac36",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 58,
    "metatable": "#hash_9d9baedfa57fbad3",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 57,
    "metatable": "#hash_9266ef938d299f5c",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 56,
    "metatable": "#hash_d1912ff1c18e3664",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 20840,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3016,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_eeca5d678902a83",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#hash_4318aa0e7238f645",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 17856,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 20824,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_4148199a85d44d69",
                    "type": "uint",
                    "offset": 20832,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_18ba05e4ae1bcfff",
                    "type": "uint",
                    "offset": 3008,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 55,
    "metatable": "#hash_408ed9f30731ecc5",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 17864,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3008,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_5fd2271a4d63ae96",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 17856,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_8817152b73facf2",
                    "type": "uint",
                    "offset": 17848,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 54,
    "metatable": "#hash_fab4d485ce9590ce",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 17864,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3008,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_5fd2271a4d63ae96",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 17856,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_8817152b73facf2",
                    "type": "uint",
                    "offset": 17848,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 53,
    "metatable": "#hash_4b01509de1bf4c7e",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 17864,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3008,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_5fd2271a4d63ae96",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 17856,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_8817152b73facf2",
                    "type": "uint",
                    "offset": 17848,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 52,
    "metatable": "#hash_dc8bc2cfb64dbbfe",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 17864,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3008,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_5fd2271a4d63ae96",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 17856,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_8817152b73facf2",
                    "type": "uint",
                    "offset": 17848,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 51,
    "metatable": "#hash_2daaa2bbf7718798",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 17864,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3008,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_5fd2271a4d63ae96",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 17856,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_8817152b73facf2",
                    "type": "uint",
                    "offset": 17848,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 50,
    "metatable": "#hash_600319a4f77ce6d4",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 17864,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 3008,
                    "bitSize": 14840
                },
                {
                    "name": "#hash_5fd2271a4d63ae96",
                    "type": "struct#hash_5814f20693f11787",
                    "offset": 32,
                    "bitSize": 2968
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 17856,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 3000,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_8817152b73facf2",
                    "type": "uint",
                    "offset": 17848,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 49,
    "metatable": "#hash_c544ae650968bd5",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14888,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14840
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14880,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 48,
    "metatable": "#hash_373c45603fe4ae4e",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14888,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14840
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14880,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 47,
    "metatable": "#hash_9cbd48afd71af86c",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14888,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14840
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14880,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 46,
    "metatable": "#hash_faa2c62fb8df8cbc",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14888,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14840
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14880,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 45,
    "metatable": "#hash_4f0d0fd6b13a6153",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14888,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14840
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14880,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 44,
    "metatable": "#hash_c67c8834ecaa2ae7",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14888,
                    "bitSize": 14840
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14840
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14880,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1560
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1688,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 200,
                    "bitSize": 104
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
                    "offset": 305,
                    "bitSize": 7,
                    "intSize": 7
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 43,
    "metatable": "#hash_d799def783531706",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 42,
    "metatable": "#hash_81e1e3998137b2b5",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 41,
    "metatable": "#hash_88540e812076020b",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 40,
    "metatable": "#hash_fceaea723c13a2be",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 39,
    "metatable": "#hash_cdca7f9975d91e28",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 38,
    "metatable": "#hash_27704d2a05cb4280",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 37,
    "metatable": "#hash_afd013b47ec0ec0",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 36,
    "metatable": "#hash_7f13b750e8fa20b6",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 35,
    "metatable": "#hash_b372bb813ef30842",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 34,
    "metatable": "#hash_c5290005ead2fe47",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 33,
    "metatable": "#hash_666eee994aa06e5",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 32,
    "metatable": "#hash_a7a21f1ef40689f2",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 31,
    "metatable": "#hash_5aab6b3b7426244f",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 30,
    "metatable": "#hash_616825de39f480e4",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 29,
    "metatable": "#hash_eaaabb5e89fcf026",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 28,
    "metatable": "#hash_66cce41a24ee62bc",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
},
{
    "name": "#hash_2f9db4f54572a9f5",
    "version": 27,
    "metatable": "#hash_3dafe6b8df379914",
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
                    "name": "#publicmatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 14488,
                    "bitSize": 14440
                },
                {
                    "name": "#custommatchclasssets",
                    "type": "struct#hash_5814f20693f11787[5]",
                    "offset": 40,
                    "bitSize": 14440
                },
                {
                    "name": "#publicmatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 14480,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#custommatchcurrentclasssetindex",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                }
            ]
        },
        {
            "name": "#hash_5814f20693f11787",
            "members": [
                {
                    "name": "#classsetname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 128
                },
                {
                    "name": "#customclass",
                    "type": "struct#hash_27580df06d232ed1[5]",
                    "offset": 128,
                    "bitSize": 1480
                },
                {
                    "name": "#customclassname",
                    "type": "string[10]",
                    "offset": 1608,
                    "bitSize": 1280
                }
            ]
        },
        {
            "name": "#hash_27580df06d232ed1",
            "members": [
                {
                    "name": "#primary",
                    "type": "struct#hash_2c79abcce61676aa",
                    "offset": 192,
                    "bitSize": 96
                },
                {
                    "name": "#secondary",
                    "type": "struct#hash_20631b664715b1fa",
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
        }
    ]
}