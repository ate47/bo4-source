{
    "name": "#hash_255f49928a7f32",
    "version": 10,
    "metatable": "#hash_4eb1fc3800877a96",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 57128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 57128
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 28536
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "int",
                    "offset": 28568,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 1024
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 28580,
                    "bitSize": 28536
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "int",
                    "offset": 57116,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 28536,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 28536
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 14268
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 12288
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 12288,
                    "bitSize": 1980
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 73,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 107,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 65,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 99,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 81,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 90,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 28,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 124,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 134,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 115,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 179,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 83,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 58,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 50,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 121,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 75,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 113,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 91,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 26,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 66,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 138,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 148,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 129,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 100,
                    "bitSize": 4,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 191,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 188,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 98,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 190,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 189,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 9,
    "metatable": "#hash_a1ee84142035aa6e",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 57120,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 57120
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 28536
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 28568,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 28576,
                    "bitSize": 28536
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 57112,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 28536,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 28536
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 14268
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 12288
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 12288,
                    "bitSize": 1980
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 73,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 107,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 65,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 99,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 81,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 90,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 28,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 124,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 134,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 115,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 179,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 83,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 58,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 50,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 121,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 75,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 113,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 91,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 26,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 66,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 138,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 148,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 129,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 100,
                    "bitSize": 4,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 191,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 188,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 98,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 190,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 189,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 8,
    "metatable": "#hash_ff6b8a5c4ad5f753",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 57120,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 57120
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 28536
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 28568,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 28576,
                    "bitSize": 28536
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 57112,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 28536,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 28536
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 14268
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 12288
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 12288,
                    "bitSize": 1980
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 73,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 107,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 65,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 99,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 81,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 90,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 28,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 124,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 134,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 115,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 179,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 83,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 58,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 50,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 121,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 75,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 113,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 91,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 26,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 66,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 138,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 148,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 129,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 100,
                    "bitSize": 4,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 191,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 188,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 98,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 190,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 189,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 7,
    "metatable": "#hash_c83cbb98fab48365",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 57120,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 57120
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 28536
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 28568,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 28576,
                    "bitSize": 28536
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 57112,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 28536,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 28536
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 14268
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 12288
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 12288,
                    "bitSize": 1980
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 73,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 107,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 65,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 99,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 81,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 90,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 28,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 124,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 134,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 115,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 179,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 83,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 58,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 50,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 121,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 75,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 113,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 91,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 26,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 66,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 138,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 148,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 129,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 100,
                    "bitSize": 4,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 191,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 188,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 98,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 190,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 189,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 6,
    "metatable": "#hash_2b2a773a86902a13",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 56820,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 56820
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 28386
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 28418,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 28426,
                    "bitSize": 28386
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 56812,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 28386,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 28386
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 14193
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 12224
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 12224,
                    "bitSize": 1969
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 71,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 46,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 105,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 97,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 79,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 27,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 54,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 122,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 133,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 113,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 86,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 10,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 81,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 56,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 119,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 73,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 111,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 89,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 102,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 26,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 37,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 147,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 127,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 98,
                    "bitSize": 4,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 190,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 188,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 189,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 5,
    "metatable": "#hash_5d6dcbf937b0d566",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 57076,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 57076
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 28514
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 28546,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 28554,
                    "bitSize": 28514
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 57068,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 28514,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 28514
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 14257
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 12288
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 12288,
                    "bitSize": 1969
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 71,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 46,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 105,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 97,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 79,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 27,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 54,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 122,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 133,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 113,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 177,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 174,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 86,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 178,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 55,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 47,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 182,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 103,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 36,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 137,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 148,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 159,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 97,
                    "bitSize": 6,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 191,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 189,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 190,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 4,
    "metatable": "#hash_6bd196ac16295370",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 54976,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 54976
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 27464
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 27496,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 27504,
                    "bitSize": 27464
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 54968,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 27464,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 27464
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 13732
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 11840
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 11840,
                    "bitSize": 1892
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 71,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 46,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 105,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 97,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 79,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 27,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 54,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 122,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 133,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 113,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 170,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 86,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 171,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 169,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 175,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 55,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 47,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 103,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 36,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 137,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 148,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 159,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 97,
                    "bitSize": 6,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 182,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 183,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 3,
    "metatable": "#hash_522ce183ccaef565",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 54676,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 54676
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 27314
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 27346,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 27354,
                    "bitSize": 27314
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 54668,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 27314,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 27314
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 13657
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 11776
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 11776,
                    "bitSize": 1881
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 71,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 46,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 103,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 79,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 86,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 27,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 54,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 131,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 111,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 142,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 150,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 169,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 165,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 170,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 173,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 55,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 47,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 118,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 110,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 101,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 36,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 135,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 146,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 126,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 157,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 165,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 6,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 183,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 180,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 182,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 2,
    "metatable": "#hash_2dae27813c7e7f24",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 54676,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 54676
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 27314
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 27346,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 27354,
                    "bitSize": 27314
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 54668,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 27314,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 27314
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 13657
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 11776
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 11776,
                    "bitSize": 1881
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 71,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 46,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 103,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 79,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 86,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 27,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 54,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 131,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 111,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 142,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 150,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 169,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 165,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 170,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 173,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 55,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 47,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 118,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 110,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 101,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 36,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 135,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 146,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 126,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 157,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 165,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 6,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 183,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 180,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 182,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
},
{
    "name": "#hash_255f49928a7f32",
    "version": 1,
    "metatable": "#hash_750101117843746f",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_3378d56fb431d957",
                    "type": "int",
                    "offset": 54676,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#loadoutpaintshop",
                    "type": "struct#hash_30241e465e2ee2d2",
                    "offset": 0,
                    "bitSize": 54676
                }
            ]
        },
        {
            "name": "#hash_30241e465e2ee2d2",
            "members": [
                {
                    "name": "#primaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 27314
                },
                {
                    "name": "#primaryweaponindex",
                    "type": "byte",
                    "offset": 27346,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#secondaryweaponpaintshop",
                    "type": "struct#paintshop",
                    "offset": 27354,
                    "bitSize": 27314
                },
                {
                    "name": "#secondaryweaponindex",
                    "type": "byte",
                    "offset": 54668,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_31f74c677d25a091",
                    "type": "int",
                    "offset": 27314,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        },
        {
            "name": "#paintshop",
            "members": [
                {
                    "name": "#view",
                    "type": "struct#hash_4e00feaf81ba241c[2]",
                    "offset": 0,
                    "bitSize": 27314
                }
            ]
        },
        {
            "name": "#hash_4e00feaf81ba241c",
            "members": [
                {
                    "name": "#layerinfo",
                    "type": "struct#hash_62325f44a788da78",
                    "offset": 0,
                    "bitSize": 13657
                }
            ]
        },
        {
            "name": "#hash_62325f44a788da78",
            "members": [
                {
                    "name": "#layer",
                    "type": "struct#hash_34254e6153a46174[64]",
                    "offset": 0,
                    "bitSize": 11776
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 11776,
                    "bitSize": 1881
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 158,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 71,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 46,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 38,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 103,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 79,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 86,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 27,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 54,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 131,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 111,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 142,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 150,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 169,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 165,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 167,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 170,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 166,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_34254e6153a46174",
            "members": [
                {
                    "name": "#icon",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 173,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 127
                },
                {
                    "name": "#red",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha",
                    "type": "uint",
                    "offset": 55,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 47,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 118,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 110,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 88,
                    "bitSize": 7,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 101,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 25,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 36,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 63,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 135,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 146,
                    "bitSize": 11,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 126,
                    "bitSize": 9,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 157,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 165,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 95,
                    "bitSize": 6,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 183,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 180,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 182,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 181,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        }
    ]
}