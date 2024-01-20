{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 14,
    "metatable": "#hash_7eee96bd6abe9c13",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 28806,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 28806
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 28762,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 1024
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 28536
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 28774,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 28632,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 28760,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 28600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 13,
    "metatable": "#hash_422a17e8a7c07ce6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 28806,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 28806
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 28762,
                    "bitSize": 12,
                    "intSize": 12,
                    "maxIntValue": 1024
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 28536
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 28774,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 28632,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 28760,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 28600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 12,
    "metatable": "#hash_cf24c63833df31da",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 28802,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 28802
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 28762,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 28536
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 28770,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 28632,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 28760,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 28600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 11,
    "metatable": "#hash_ae0ad25cff514168",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 28802,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 28802
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 28762,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 28536
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 28770,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 28632,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 28760,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 28600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 10,
    "metatable": "#hash_169e842c8ef25e4",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 28652,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 28652
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 28612,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 28386
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 28620,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 28482,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 28610,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 28450,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 9,
    "metatable": "#hash_e37516a7ecc86d3d",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 28780,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 28780
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 28740,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 28514
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 28748,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 28610,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 28738,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 28578,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 8,
    "metatable": "#hash_b5a1a4eba4f8bf8",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 27730,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 27730
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 27690,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 27464
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 27698,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 27560,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 27688,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 27528,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 7,
    "metatable": "#hash_f2c7212d9fc1bedf",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 27580,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 27580
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 27540,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 27314
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 27548,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 27410,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 27538,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 27378,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 6,
    "metatable": "#hash_f21fb7d405c4af89",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 27516,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 27516
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 27476,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 27314
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 27484,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 27346,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 27474,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 27314,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
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
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/paintjobs.ddl",
    "version": 5,
    "metatable": "#hash_e240e82dd72427a6",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 27516,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 27516
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 27476,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 27314
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 27484,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 27346,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 27474,
                    "bitSize": 2,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 27314,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
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
        }
    ]
}