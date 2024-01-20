{
    "name": "#hash_57a0bab1631b1f08",
    "version": 14,
    "metatable": "#hash_bc654abc5783b32a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 38152
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 38104,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 1024
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 37872
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 38120,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 37968,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 38096,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 37936,
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
                    "bitSize": 37872
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
                    "bitSize": 18936
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
                    "bitSize": 16384
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 16384,
                    "bitSize": 2552
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
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 251,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 248,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 252,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 136,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 228,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 229,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 226,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 227,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 225,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 230,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 13,
    "metatable": "#hash_ac9f920fb725c39c",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 38152
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "int",
                    "offset": 38104,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 1024
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 37872
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 38120,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 37968,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 38096,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 37936,
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
                    "bitSize": 37872
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
                    "bitSize": 18936
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
                    "bitSize": 16384
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 16384,
                    "bitSize": 2552
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
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 251,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 248,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 252,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 136,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 228,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 229,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 226,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 227,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 225,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 230,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 12,
    "metatable": "#hash_d060beb532221620",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 38144
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 38104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 37872
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 38112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 37968,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 38096,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 37936,
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
                    "bitSize": 37872
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
                    "bitSize": 18936
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
                    "bitSize": 16384
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 16384,
                    "bitSize": 2552
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
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 251,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 248,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 252,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 136,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 228,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 229,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 226,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 227,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 225,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 230,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 11,
    "metatable": "#hash_cdde1ab232560e04",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 38144
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 38104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 37872
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 38112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 37968,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 38096,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 37936,
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
                    "bitSize": 37872
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
                    "bitSize": 18936
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
                    "bitSize": 16384
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 16384,
                    "bitSize": 2552
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
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 251,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 248,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 252,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 136,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 12,
                    "maxIntValue": 4095
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 228,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 229,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 226,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 227,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#mask",
                    "type": "uint",
                    "offset": 225,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 230,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 10,
    "metatable": "#hash_22ef5b890febcabd",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 38144
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 38104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 37872
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 38112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 37968,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 38096,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 37936,
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
                    "bitSize": 37872
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
                    "bitSize": 18936
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
                    "bitSize": 16384
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 16384,
                    "bitSize": 2552
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
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 11
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 248,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 136,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 227,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 228,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 225,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 226,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 229,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 9,
    "metatable": "#hash_95e6bc3291e4709b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 38144
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 38104,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 37872
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 38112,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 37968,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 38096,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 37936,
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
                    "bitSize": 37872
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
                    "bitSize": 18936
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
                    "bitSize": 16384
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 16384,
                    "bitSize": 2552
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
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 250,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 248,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 249,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 251,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 136,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#hash_4c4aff5f26267e55",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 227,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 228,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 225,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 226,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 229,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 8,
    "metatable": "#hash_c204620a1304413e",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 36944
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 36904,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 36672
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 36912,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 36768,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 36896,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 36736,
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
                    "bitSize": 36672
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
                    "bitSize": 18336
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
                    "bitSize": 15872
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 15872,
                    "bitSize": 2464
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
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 242,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 241,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 243,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 136,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 219,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 2
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 220,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 217,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 218,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 221,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 7,
    "metatable": "#hash_87e40a0c12080b05",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 35744
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 35704,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 64,
                    "bitSize": 35472
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 35712,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 35568,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 35696,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 35536,
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
                    "bitSize": 35472
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
                    "bitSize": 17736
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
                    "bitSize": 15360
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 15360,
                    "bitSize": 2376
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
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 235,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 234,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 233,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 236,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 212,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 210,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 213,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 209,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 211,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 214,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 6,
    "metatable": "#hash_b26f5143be2d8c5a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 35680
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 35640,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 35472
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 35648,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 35504,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 35632,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 35472,
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
                    "bitSize": 35472
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
                    "bitSize": 17736
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
                    "bitSize": 15360
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 15360,
                    "bitSize": 2376
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
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 235,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 234,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 233,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 236,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 212,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 210,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 213,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 209,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 211,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 214,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        }
    ]
},
{
    "name": "#hash_57a0bab1631b1f08",
    "version": 5,
    "metatable": "#hash_1d5c3658d6304a84",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#weaponpaintjob",
                    "type": "struct#weaponpaintjob",
                    "offset": 0,
                    "bitSize": 35680
                }
            ]
        },
        {
            "name": "#weaponpaintjob",
            "members": [
                {
                    "name": "#weaponindex",
                    "type": "byte",
                    "offset": 35640,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#paintjob",
                    "type": "struct#paintshop",
                    "offset": 0,
                    "bitSize": 35472
                },
                {
                    "name": "#sortindex",
                    "type": "int",
                    "offset": 35648,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#paintjobname",
                    "type": "string",
                    "offset": 35504,
                    "bitSize": 128
                },
                {
                    "name": "#readonly",
                    "type": "int",
                    "offset": 35632,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 1
                },
                {
                    "name": "#createtime",
                    "type": "uint",
                    "offset": 35472,
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
                    "bitSize": 35472
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
                    "bitSize": 17736
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
                    "bitSize": 15360
                },
                {
                    "name": "#groups",
                    "type": "struct#hash_24f699c797bc9492[11]",
                    "offset": 15360,
                    "bitSize": 2376
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
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
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
                    "offset": 104,
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
                    "offset": 72,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_4cf0321fbfe5f277",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#green1",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 112,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 216,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#groupindex",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 32
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 235,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 232,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 234,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 233,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 236,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_24f699c797bc9492",
            "members": [
                {
                    "name": "#materialid",
                    "type": "uint",
                    "offset": 200,
                    "bitSize": 8,
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
                    "offset": 88,
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
                    "offset": 128,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#blue1",
                    "type": "uint",
                    "offset": 80,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#alpha1",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#gradientfill",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 8,
                    "intSize": 7,
                    "maxIntValue": 100
                },
                {
                    "name": "#gradientangle",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#hash_c2fdd0da89578e3",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#hash_c2fdc0da8957730",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#angle",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#scalex",
                    "type": "uint",
                    "offset": 152,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#scaley",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 16,
                    "intSize": 11,
                    "maxIntValue": 1024
                },
                {
                    "name": "#materialangle",
                    "type": "uint",
                    "offset": 136,
                    "bitSize": 16,
                    "intSize": 9,
                    "maxIntValue": 511
                },
                {
                    "name": "#materialscalex",
                    "type": "uint",
                    "offset": 184,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#materialscaley",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#outline",
                    "type": "uint",
                    "offset": 212,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_55d7cd7908753e46",
                    "type": "uint",
                    "offset": 208,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#gradienttype",
                    "type": "uint",
                    "offset": 210,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#isgrouped",
                    "type": "uint",
                    "offset": 213,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#blend",
                    "type": "uint",
                    "offset": 209,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#groupedlook",
                    "type": "uint",
                    "offset": 211,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 214,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        }
    ]
}