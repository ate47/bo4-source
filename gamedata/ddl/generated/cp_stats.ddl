{
    "name": "#gamedata/ddl/generated/cp_stats.ddl",
    "version": 19,
    "metatable": "#hash_a05a70f64959e7b7",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#playerxuid",
                    "type": "uint64",
                    "offset": 310936,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#playerstatslist",
                    "type": "struct#hash_6b3db80d498eb06[379]",
                    "offset": 282976,
                    "bitSize": 18192
                },
                {
                    "name": "#playercpdecorations",
                    "type": "uint[20]",
                    "offset": 562055,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 67744,
                    "bitSize": 144,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#hash_2c168e887ce14298",
                    "type": "uint",
                    "offset": 3760,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5988aeaa53d6e90c",
                    "type": "byte[50]",
                    "offset": 215624,
                    "bitSize": 400,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_42a4964bbd0c65a9",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 3440,
                    "bitSize": 320
                },
                {
                    "name": "#recenthitloccounts",
                    "type": "struct#hash_3b0f9e0921513e2c[10]",
                    "offset": 212504,
                    "bitSize": 3120
                },
                {
                    "name": "#hash_53f43899387a360d",
                    "type": "struct#hash_1a52129598e71dab[10]",
                    "offset": 146288,
                    "bitSize": 800
                },
                {
                    "name": "#afteractionreportstats",
                    "type": "struct#hash_6b411bb770fc8f6c",
                    "offset": 301744,
                    "bitSize": 8936
                },
                {
                    "name": "#completedchallengeseen",
                    "type": "uint[77]",
                    "offset": 562077,
                    "bitSize": 77,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46e7db8ceaba5b2f",
                    "type": "uint",
                    "offset": 562034,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#currenthitlocationindex",
                    "type": "uint",
                    "offset": 212464,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_2d1ef9ab49375351",
                    "type": "uint[2]",
                    "offset": 243336,
                    "bitSize": 64,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#companion",
                    "type": "uint",
                    "offset": 262568,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#faction",
                    "type": "uint",
                    "offset": 263632,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#hash_54a74aa3d5f3346d",
                    "type": "fixedpoint",
                    "offset": 282944,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#zmcampaigndata",
                    "type": "struct#hash_7690a9df20146d8a",
                    "offset": 561937,
                    "bitSize": 1
                },
                {
                    "name": "#gamehistory",
                    "type": "struct#hash_503eb0de8f9cf7c2[2]",
                    "offset": 3856,
                    "bitSize": 12368
                },
                {
                    "name": "#probation",
                    "type": "struct#hash_4bb25d7ad41fb449[2]",
                    "offset": 263408,
                    "bitSize": 192
                },
                {
                    "name": "#playerstatsbygametype",
                    "type": "struct#hash_2e1d3d3bb036d22c[12]",
                    "offset": 243400,
                    "bitSize": 18912
                },
                {
                    "name": "#currentweaponlevels",
                    "type": "uint[64]",
                    "offset": 147120,
                    "bitSize": 512,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_6dcaad4976588a44",
                    "type": "uint",
                    "offset": 212472,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_711b1260308620e7",
                    "type": "uint[20]",
                    "offset": 562035,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_3ceb201776787882",
                    "type": "uint",
                    "offset": 561936,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#highestmapreached",
                    "type": "uint",
                    "offset": 561904,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_191fbfb9e1a3acf3",
                    "type": "uint",
                    "offset": 282936,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_3de5a4846f45ad78",
                    "type": "uint[19]",
                    "offset": 216024,
                    "bitSize": 608,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#playerstatsbymap",
                    "type": "struct#hash_2e0567490210dd82[10]",
                    "offset": 216632,
                    "bitSize": 18800
                },
                {
                    "name": "#trainingsimstats",
                    "type": "struct#hash_5cb2d75a230a501f",
                    "offset": 263640,
                    "bitSize": 144
                },
                {
                    "name": "#hash_7dd9f1ac62a346d",
                    "type": "struct#hash_722a4055916df1ff",
                    "offset": 147696,
                    "bitSize": 480
                },
                {
                    "name": "#itemstats",
                    "type": "struct#hash_48cae9b9fcff7a5e[256]",
                    "offset": 324336,
                    "bitSize": 237568
                },
                {
                    "name": "#groupstats",
                    "type": "struct#hash_6ef8b9b7a8fd75e1[21]",
                    "offset": 263784,
                    "bitSize": 19152
                },
                {
                    "name": "#unlocks",
                    "type": "byte[32]",
                    "offset": 310680,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#attachments",
                    "type": "struct#hash_67b00e3091cde2fd[56]",
                    "offset": 16224,
                    "bitSize": 51520
                },
                {
                    "name": "#selectedcustomclass",
                    "type": "uint",
                    "offset": 3432,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#weaponstats",
                    "type": "struct#hash_1608f63ae729eda5[200]",
                    "offset": 67888,
                    "bitSize": 78400
                },
                {
                    "name": "#variantstats",
                    "type": "struct#hash_ca5eede65d9c59e[251]",
                    "offset": 148208,
                    "bitSize": 64256
                },
                {
                    "name": "#hash_3313a30250a39ec5",
                    "type": "uint",
                    "offset": 262640,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#skill_rating",
                    "type": "fixedpoint",
                    "offset": 262576,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#skill_variance",
                    "type": "fixedpoint",
                    "offset": 301328,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_2363e7e74077b1c0",
                    "type": "fixedpoint[12]",
                    "offset": 262672,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#hash_3a7324ad328f0e2e",
                    "type": "fixedpoint[12]",
                    "offset": 301360,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#emblemstats",
                    "type": "struct#hash_790a163d0959fa18",
                    "offset": 311000,
                    "bitSize": 13336
                },
                {
                    "name": "#clantagstats",
                    "type": "struct#hash_402baff65ae9b838",
                    "offset": 301168,
                    "bitSize": 160
                },
                {
                    "name": "#lastconsolesave",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 9
                },
                {
                    "name": "#consoleinfo",
                    "type": "struct#hash_4976dab983b23e8c[10]",
                    "offset": 235432,
                    "bitSize": 4480
                },
                {
                    "name": "#connectionid",
                    "type": "uint64",
                    "offset": 147632,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#uploadbandwidth",
                    "type": "uint",
                    "offset": 263056,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#demonwareflags",
                    "type": "byte[32]",
                    "offset": 262312,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_188ecc3aca50f93d",
                    "type": "uint64",
                    "offset": 243272,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_3ec47111a3993e52",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_37aeca4d39214e62",
                    "type": "uint64",
                    "offset": 3792,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#prestigetokens",
                    "type": "struct#hash_4f6f299a12577aa4[20]",
                    "offset": 263088,
                    "bitSize": 320
                },
                {
                    "name": "#motdversionviewed",
                    "type": "int",
                    "offset": 148176,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#motdviewtime",
                    "type": "int",
                    "offset": 263600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_weapon",
                    "type": "int",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_attachment",
                    "type": "int",
                    "offset": 262608,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#combattrainingwins",
                    "type": "int",
                    "offset": 147088,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_1576a2fd30a2dfb0",
                    "type": "uint[64]",
                    "offset": 561970,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#dlc",
                    "type": "struct#hash_68741ec332f97ee1",
                    "offset": 0,
                    "bitSize": 160
                },
                {
                    "name": "#bunkcollectibles",
                    "type": "struct#hash_78a2c506849f9dda",
                    "offset": 239912,
                    "bitSize": 3360
                },
                {
                    "name": "#facialfeatureproperties",
                    "type": "struct#hash_6962b6aa0c4853f4[5]",
                    "offset": 232,
                    "bitSize": 3200
                },
                {
                    "name": "#completedfirsttimeflow",
                    "type": "uint",
                    "offset": 562076,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_8cbe2e4ecb4fc43",
                    "type": "uint",
                    "offset": 562075,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#musicunlocks",
                    "type": "uint[32]",
                    "offset": 561938,
                    "bitSize": 32,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 562154,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6b3db80d498eb06",
            "members": [
                {
                    "name": "#statvalue",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#challengevalue",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#hash_5ef0b8418736fce5",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 25,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_503eb0de8f9cf7c2",
            "members": [
                {
                    "name": "#modehistory",
                    "type": "struct#hash_b5aec1419b9a02d",
                    "offset": 5888,
                    "bitSize": 288
                },
                {
                    "name": "#matchhistory",
                    "type": "struct#hash_5fafb39a86bc6dc7[32]",
                    "offset": 0,
                    "bitSize": 5888
                },
                {
                    "name": "#currentmatchhistoryindex",
                    "type": "byte",
                    "offset": 6176,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_3b0f9e0921513e2c",
            "members": [
                {
                    "name": "#hitlocations",
                    "type": "byte[19]",
                    "offset": 0,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#criticalhitlocations",
                    "type": "byte[19]",
                    "offset": 152,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
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
            "name": "#hash_1a52129598e71dab",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 56,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#gametype",
                    "type": "short",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6b411bb770fc8f6c",
            "members": [
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 8928,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_372ebbc622aaa659",
                    "type": "uint",
                    "offset": 8931,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#privatematch",
                    "type": "uint",
                    "offset": 8930,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_18f8a178f6083a8e",
                    "type": "uint",
                    "offset": 8929,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_2475b5a284a63853",
                    "type": "struct#hash_656bfcb3838e2907[12]",
                    "offset": 0,
                    "bitSize": 8928
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8932,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_7690a9df20146d8a",
            "members": [
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_4bb25d7ad41fb449",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timewhenprobationisdone",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#count",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_2e1d3d3bb036d22c",
            "members": [
                {
                    "name": "#assists",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 96,
                    "bitSize": 48
                },
                {
                    "name": "#cur_win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 816,
                    "bitSize": 48
                },
                {
                    "name": "#crush",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 144,
                    "bitSize": 48
                },
                {
                    "name": "#deaths",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 912,
                    "bitSize": 48
                },
                {
                    "name": "#defends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1064,
                    "bitSize": 48
                },
                {
                    "name": "#kdratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1528,
                    "bitSize": 48
                },
                {
                    "name": "#kills",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 192,
                    "bitSize": 48
                },
                {
                    "name": "#kill_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 864,
                    "bitSize": 48
                },
                {
                    "name": "#losses",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1016,
                    "bitSize": 48
                },
                {
                    "name": "#offends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1112,
                    "bitSize": 48
                },
                {
                    "name": "#score",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 240,
                    "bitSize": 48
                },
                {
                    "name": "#ties",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 0,
                    "bitSize": 48
                },
                {
                    "name": "#time_played_total",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 288,
                    "bitSize": 48
                },
                {
                    "name": "#wins",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 48,
                    "bitSize": 48
                },
                {
                    "name": "#win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 768,
                    "bitSize": 48
                },
                {
                    "name": "#wlratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 960,
                    "bitSize": 48
                },
                {
                    "name": "#challenge1",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 336,
                    "bitSize": 48
                },
                {
                    "name": "#challenge2",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 384,
                    "bitSize": 48
                },
                {
                    "name": "#challenge3",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 432,
                    "bitSize": 48
                },
                {
                    "name": "#challenge4",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 480,
                    "bitSize": 48
                },
                {
                    "name": "#challenge5",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 528,
                    "bitSize": 48
                },
                {
                    "name": "#challenge6",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 576,
                    "bitSize": 48
                },
                {
                    "name": "#challenge7",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 624,
                    "bitSize": 48
                },
                {
                    "name": "#challenge8",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 672,
                    "bitSize": 48
                },
                {
                    "name": "#challenge9",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 720,
                    "bitSize": 48
                },
                {
                    "name": "#challenge10",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1160,
                    "bitSize": 48
                },
                {
                    "name": "#prevscoreindex",
                    "type": "int",
                    "offset": 1008,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#prevscores",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 1208,
                    "bitSize": 320
                }
            ]
        },
        {
            "name": "#hash_2e0567490210dd82",
            "members": [
                {
                    "name": "#accolades",
                    "type": "struct#hash_63565a3d40f66255[19]",
                    "offset": 424,
                    "bitSize": 1368
                },
                {
                    "name": "#hash_71b609b078e360c0",
                    "type": "uint",
                    "offset": 1864,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#collectibles",
                    "type": "uint[10]",
                    "offset": 1854,
                    "bitSize": 10,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#allcollectiblescollected",
                    "type": "uint",
                    "offset": 1852,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_1e0160af4fd80dff",
                    "type": "uint[6]",
                    "offset": 1840,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_518113a79b08988",
                    "type": "uint[6]",
                    "offset": 1846,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_657891d65d881524",
                    "type": "uint[6]",
                    "offset": 1865,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_233621878f97486b",
                    "type": "uint[6]",
                    "offset": 1872,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 8,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2f236080a1058999",
                    "type": "uint[6]",
                    "offset": 200,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4643078d95a24d76",
                    "type": "uint",
                    "offset": 1853,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hasbeencompleted",
                    "type": "uint",
                    "offset": 1871,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_bf847c54dac3b",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 7
                },
                {
                    "name": "#hash_7787ac0184215bc1",
                    "type": "uint",
                    "offset": 392,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3cd96ca92c6f0d4c",
                    "type": "uint",
                    "offset": 1792,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1cc8d841efacb52a",
                    "type": "short",
                    "offset": 1824,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1878,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        },
        {
            "name": "#hash_5cb2d75a230a501f",
            "members": [
                {
                    "name": "#ranksachieved",
                    "type": "uint[4]",
                    "offset": 136,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_44b4e9269c8dc12d",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#highestscore",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52dbe660cac88df9",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_25ce643c6cf6507e",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b146f5d12b2b147",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 140,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_722a4055916df1ff",
            "members": [
                {
                    "name": "#hash_c159a616c8e909f",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_24bfa4caccae7ccc",
                    "type": "uint",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_477109e1674d778e",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2b12202dea292a78",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_65157f3e7aec5b46",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b75e7812ae582a0",
                    "type": "uint",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#numplayers",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52086efefda6cd87",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4cda3bb269028c08",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6f7512e92e96a86a",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_34212151b945069b",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4c59bf00eb8047c0",
                    "type": "uint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6e3edce84270ac4c",
                    "type": "uint",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_256e550d360e7cf6",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3ed0ae0744c78900",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_48cae9b9fcff7a5e",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 920,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 922,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6ef8b9b7a8fd75e1",
            "members": [
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_67b00e3091cde2fd",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_1608f63ae729eda5",
            "members": [
                {
                    "name": "#optionmarkedasold",
                    "type": "uint[300]",
                    "offset": 88,
                    "bitSize": 300,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#attachmentmarkedold",
                    "type": "uint[56]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#plevel",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 388,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_ca5eede65d9c59e",
            "members": [
                {
                    "name": "#stats",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 256,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_790a163d0959fa18",
            "members": [
                {
                    "name": "#layerspurchased",
                    "type": "uint",
                    "offset": 8192,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 12
                },
                {
                    "name": "#hash_4554e34a747022df",
                    "type": "struct#hash_2d74f509e9d33a86[12]",
                    "offset": 13320,
                    "bitSize": 12
                },
                {
                    "name": "#icons",
                    "type": "struct#hash_18562676c03c7954[1024]",
                    "offset": 0,
                    "bitSize": 8192
                },
                {
                    "name": "#backgrounds",
                    "type": "struct#hash_18562676c03c7954[640]",
                    "offset": 8200,
                    "bitSize": 5120
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13332,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_402baff65ae9b838",
            "members": [
                {
                    "name": "#features",
                    "type": "struct#hash_118b324c3f145926[14]",
                    "offset": 48,
                    "bitSize": 112
                },
                {
                    "name": "#selectedfeature",
                    "type": "byte",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#clanname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 40
                }
            ]
        },
        {
            "name": "#hash_4976dab983b23e8c",
            "members": [
                {
                    "name": "#consoleid64",
                    "type": "string",
                    "offset": 128,
                    "bitSize": 256
                },
                {
                    "name": "#macaddress",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#usecount",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timestamp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ipexternal",
                    "type": "struct#hash_25a11738b4152d0e",
                    "offset": 384,
                    "bitSize": 32
                },
                {
                    "name": "#nattype",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_4f6f299a12577aa4",
            "members": [
                {
                    "name": "#tokenspent",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tokentype",
                    "type": "uint[4]",
                    "offset": 9,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#itemunlocked",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        },
        {
            "name": "#hash_68741ec332f97ee1",
            "members": [
                {
                    "name": "#mappacks",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_7e353191747e874",
                    "type": "uint[128]",
                    "offset": 32,
                    "bitSize": 128,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_78a2c506849f9dda",
            "members": [
                {
                    "name": "#collectibles",
                    "type": "struct#hash_2efa05c484e77181[10]",
                    "offset": 0,
                    "bitSize": 3360
                }
            ]
        },
        {
            "name": "#hash_6962b6aa0c4853f4",
            "members": [
                {
                    "name": "#properties",
                    "type": "fixedpoint[20]",
                    "offset": 0,
                    "bitSize": 640,
                    "intSize": 32
                }
            ]
        },
        {
            "name": "#hash_b5aec1419b9a02d",
            "members": [
                {
                    "name": "#played",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 144,
                    "bitSize": 144
                },
                {
                    "name": "#hosted",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 0,
                    "bitSize": 144
                }
            ]
        },
        {
            "name": "#hash_5fafb39a86bc6dc7",
            "members": [
                {
                    "name": "#startingtime",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#endingtime",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#scoreboardposition",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 152,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#teamscoreratio",
                    "type": "fixedpoint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#gametype",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#quittype",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#forgiven",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 177,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_656bfcb3838e2907",
            "members": [
                {
                    "name": "#isactive",
                    "type": "uint",
                    "offset": 736,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xuid",
                    "type": "string",
                    "offset": 256,
                    "bitSize": 256
                },
                {
                    "name": "#name",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 256
                },
                {
                    "name": "#hash_59ef59765ff3f049",
                    "type": "short",
                    "offset": 720,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_4acf195b0eb09697",
                    "type": "short",
                    "offset": 624,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_488ffb249ad25e43",
                    "type": "uint",
                    "offset": 560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#curxp",
                    "type": "uint",
                    "offset": 512,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "short",
                    "offset": 592,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 544,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 640,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#assists",
                    "type": "short",
                    "offset": 704,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#revives",
                    "type": "short",
                    "offset": 608,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#medals",
                    "type": "short[3]",
                    "offset": 656,
                    "bitSize": 48,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 737,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_63565a3d40f66255",
            "members": [
                {
                    "name": "#highestvalue",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#value",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#state",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                }
            ]
        },
        {
            "name": "#hash_2d74f509e9d33a86",
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
        },
        {
            "name": "#hash_18562676c03c7954",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 2,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_118b324c3f145926",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 2,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_25a11738b4152d0e",
            "members": [
                {
                    "name": "#a",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#b",
                    "type": "byte",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#c",
                    "type": "byte",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#d",
                    "type": "byte",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_2efa05c484e77181",
            "members": [
                {
                    "name": "#mapname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 320
                },
                {
                    "name": "#collectibleindex",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 8
                },
                {
                    "name": "#set",
                    "type": "uint",
                    "offset": 328,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 329,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_2f60329a207db2b8",
            "members": [
                {
                    "name": "#started",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#quit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#dashboard",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#timeout",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kicked",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#completed",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                }
            ]
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/cp_stats.ddl",
    "version": 18,
    "metatable": "#hash_afe1d1921c4dede1",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#playerxuid",
                    "type": "uint64",
                    "offset": 310936,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#playerstatslist",
                    "type": "struct#hash_6b3db80d498eb06[379]",
                    "offset": 282976,
                    "bitSize": 18192
                },
                {
                    "name": "#playercpdecorations",
                    "type": "uint[20]",
                    "offset": 562055,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 67744,
                    "bitSize": 144,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#hash_2c168e887ce14298",
                    "type": "uint",
                    "offset": 3760,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5988aeaa53d6e90c",
                    "type": "byte[50]",
                    "offset": 215624,
                    "bitSize": 400,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_42a4964bbd0c65a9",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 3440,
                    "bitSize": 320
                },
                {
                    "name": "#recenthitloccounts",
                    "type": "struct#hash_3b0f9e0921513e2c[10]",
                    "offset": 212504,
                    "bitSize": 3120
                },
                {
                    "name": "#hash_53f43899387a360d",
                    "type": "struct#hash_1a52129598e71dab[10]",
                    "offset": 146288,
                    "bitSize": 800
                },
                {
                    "name": "#afteractionreportstats",
                    "type": "struct#hash_6b411bb770fc8f6c",
                    "offset": 301744,
                    "bitSize": 8936
                },
                {
                    "name": "#completedchallengeseen",
                    "type": "uint[77]",
                    "offset": 562077,
                    "bitSize": 77,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46e7db8ceaba5b2f",
                    "type": "uint",
                    "offset": 562034,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#currenthitlocationindex",
                    "type": "uint",
                    "offset": 212464,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_2d1ef9ab49375351",
                    "type": "uint[2]",
                    "offset": 243336,
                    "bitSize": 64,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#companion",
                    "type": "uint",
                    "offset": 262568,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#faction",
                    "type": "uint",
                    "offset": 263632,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#hash_54a74aa3d5f3346d",
                    "type": "fixedpoint",
                    "offset": 282944,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#zmcampaigndata",
                    "type": "struct#hash_7690a9df20146d8a",
                    "offset": 561937,
                    "bitSize": 1
                },
                {
                    "name": "#gamehistory",
                    "type": "struct#hash_503eb0de8f9cf7c2[2]",
                    "offset": 3856,
                    "bitSize": 12368
                },
                {
                    "name": "#probation",
                    "type": "struct#hash_4bb25d7ad41fb449[2]",
                    "offset": 263408,
                    "bitSize": 192
                },
                {
                    "name": "#playerstatsbygametype",
                    "type": "struct#hash_2e1d3d3bb036d22c[12]",
                    "offset": 243400,
                    "bitSize": 18912
                },
                {
                    "name": "#currentweaponlevels",
                    "type": "uint[64]",
                    "offset": 147120,
                    "bitSize": 512,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_6dcaad4976588a44",
                    "type": "uint",
                    "offset": 212472,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_711b1260308620e7",
                    "type": "uint[20]",
                    "offset": 562035,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_3ceb201776787882",
                    "type": "uint",
                    "offset": 561936,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#highestmapreached",
                    "type": "uint",
                    "offset": 561904,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_191fbfb9e1a3acf3",
                    "type": "uint",
                    "offset": 282936,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_3de5a4846f45ad78",
                    "type": "uint[19]",
                    "offset": 216024,
                    "bitSize": 608,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#playerstatsbymap",
                    "type": "struct#hash_2e0567490210dd82[10]",
                    "offset": 216632,
                    "bitSize": 18800
                },
                {
                    "name": "#trainingsimstats",
                    "type": "struct#hash_5cb2d75a230a501f",
                    "offset": 263640,
                    "bitSize": 144
                },
                {
                    "name": "#hash_7dd9f1ac62a346d",
                    "type": "struct#hash_722a4055916df1ff",
                    "offset": 147696,
                    "bitSize": 480
                },
                {
                    "name": "#itemstats",
                    "type": "struct#hash_48cae9b9fcff7a5e[256]",
                    "offset": 324336,
                    "bitSize": 237568
                },
                {
                    "name": "#groupstats",
                    "type": "struct#hash_6ef8b9b7a8fd75e1[21]",
                    "offset": 263784,
                    "bitSize": 19152
                },
                {
                    "name": "#unlocks",
                    "type": "byte[32]",
                    "offset": 310680,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#attachments",
                    "type": "struct#hash_67b00e3091cde2fd[56]",
                    "offset": 16224,
                    "bitSize": 51520
                },
                {
                    "name": "#selectedcustomclass",
                    "type": "uint",
                    "offset": 3432,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#weaponstats",
                    "type": "struct#hash_1608f63ae729eda5[200]",
                    "offset": 67888,
                    "bitSize": 78400
                },
                {
                    "name": "#variantstats",
                    "type": "struct#hash_ca5eede65d9c59e[251]",
                    "offset": 148208,
                    "bitSize": 64256
                },
                {
                    "name": "#hash_3313a30250a39ec5",
                    "type": "uint",
                    "offset": 262640,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#skill_rating",
                    "type": "fixedpoint",
                    "offset": 262576,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#skill_variance",
                    "type": "fixedpoint",
                    "offset": 301328,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_2363e7e74077b1c0",
                    "type": "fixedpoint[12]",
                    "offset": 262672,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#hash_3a7324ad328f0e2e",
                    "type": "fixedpoint[12]",
                    "offset": 301360,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#emblemstats",
                    "type": "struct#hash_790a163d0959fa18",
                    "offset": 311000,
                    "bitSize": 13336
                },
                {
                    "name": "#clantagstats",
                    "type": "struct#hash_402baff65ae9b838",
                    "offset": 301168,
                    "bitSize": 160
                },
                {
                    "name": "#lastconsolesave",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 9
                },
                {
                    "name": "#consoleinfo",
                    "type": "struct#hash_4976dab983b23e8c[10]",
                    "offset": 235432,
                    "bitSize": 4480
                },
                {
                    "name": "#connectionid",
                    "type": "uint64",
                    "offset": 147632,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#uploadbandwidth",
                    "type": "uint",
                    "offset": 263056,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#demonwareflags",
                    "type": "byte[32]",
                    "offset": 262312,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_188ecc3aca50f93d",
                    "type": "uint64",
                    "offset": 243272,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_3ec47111a3993e52",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_37aeca4d39214e62",
                    "type": "uint64",
                    "offset": 3792,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#prestigetokens",
                    "type": "struct#hash_4f6f299a12577aa4[20]",
                    "offset": 263088,
                    "bitSize": 320
                },
                {
                    "name": "#motdversionviewed",
                    "type": "int",
                    "offset": 148176,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#motdviewtime",
                    "type": "int",
                    "offset": 263600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_weapon",
                    "type": "int",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_attachment",
                    "type": "int",
                    "offset": 262608,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#combattrainingwins",
                    "type": "int",
                    "offset": 147088,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_1576a2fd30a2dfb0",
                    "type": "uint[64]",
                    "offset": 561970,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#dlc",
                    "type": "struct#hash_68741ec332f97ee1",
                    "offset": 0,
                    "bitSize": 160
                },
                {
                    "name": "#bunkcollectibles",
                    "type": "struct#hash_78a2c506849f9dda",
                    "offset": 239912,
                    "bitSize": 3360
                },
                {
                    "name": "#facialfeatureproperties",
                    "type": "struct#hash_6962b6aa0c4853f4[5]",
                    "offset": 232,
                    "bitSize": 3200
                },
                {
                    "name": "#completedfirsttimeflow",
                    "type": "uint",
                    "offset": 562076,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_8cbe2e4ecb4fc43",
                    "type": "uint",
                    "offset": 562075,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#musicunlocks",
                    "type": "uint[32]",
                    "offset": 561938,
                    "bitSize": 32,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 562154,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6b3db80d498eb06",
            "members": [
                {
                    "name": "#statvalue",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#challengevalue",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#hash_5ef0b8418736fce5",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 25,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_503eb0de8f9cf7c2",
            "members": [
                {
                    "name": "#modehistory",
                    "type": "struct#hash_b5aec1419b9a02d",
                    "offset": 5888,
                    "bitSize": 288
                },
                {
                    "name": "#matchhistory",
                    "type": "struct#hash_5fafb39a86bc6dc7[32]",
                    "offset": 0,
                    "bitSize": 5888
                },
                {
                    "name": "#currentmatchhistoryindex",
                    "type": "byte",
                    "offset": 6176,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_3b0f9e0921513e2c",
            "members": [
                {
                    "name": "#hitlocations",
                    "type": "byte[19]",
                    "offset": 0,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#criticalhitlocations",
                    "type": "byte[19]",
                    "offset": 152,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
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
            "name": "#hash_1a52129598e71dab",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 56,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#gametype",
                    "type": "short",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6b411bb770fc8f6c",
            "members": [
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 8928,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_372ebbc622aaa659",
                    "type": "uint",
                    "offset": 8931,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#privatematch",
                    "type": "uint",
                    "offset": 8930,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_18f8a178f6083a8e",
                    "type": "uint",
                    "offset": 8929,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_2475b5a284a63853",
                    "type": "struct#hash_656bfcb3838e2907[12]",
                    "offset": 0,
                    "bitSize": 8928
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8932,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_7690a9df20146d8a",
            "members": [
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_4bb25d7ad41fb449",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timewhenprobationisdone",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#count",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_2e1d3d3bb036d22c",
            "members": [
                {
                    "name": "#assists",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 96,
                    "bitSize": 48
                },
                {
                    "name": "#cur_win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 816,
                    "bitSize": 48
                },
                {
                    "name": "#crush",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 144,
                    "bitSize": 48
                },
                {
                    "name": "#deaths",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 912,
                    "bitSize": 48
                },
                {
                    "name": "#defends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1064,
                    "bitSize": 48
                },
                {
                    "name": "#kdratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1528,
                    "bitSize": 48
                },
                {
                    "name": "#kills",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 192,
                    "bitSize": 48
                },
                {
                    "name": "#kill_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 864,
                    "bitSize": 48
                },
                {
                    "name": "#losses",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1016,
                    "bitSize": 48
                },
                {
                    "name": "#offends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1112,
                    "bitSize": 48
                },
                {
                    "name": "#score",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 240,
                    "bitSize": 48
                },
                {
                    "name": "#ties",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 0,
                    "bitSize": 48
                },
                {
                    "name": "#time_played_total",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 288,
                    "bitSize": 48
                },
                {
                    "name": "#wins",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 48,
                    "bitSize": 48
                },
                {
                    "name": "#win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 768,
                    "bitSize": 48
                },
                {
                    "name": "#wlratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 960,
                    "bitSize": 48
                },
                {
                    "name": "#challenge1",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 336,
                    "bitSize": 48
                },
                {
                    "name": "#challenge2",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 384,
                    "bitSize": 48
                },
                {
                    "name": "#challenge3",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 432,
                    "bitSize": 48
                },
                {
                    "name": "#challenge4",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 480,
                    "bitSize": 48
                },
                {
                    "name": "#challenge5",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 528,
                    "bitSize": 48
                },
                {
                    "name": "#challenge6",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 576,
                    "bitSize": 48
                },
                {
                    "name": "#challenge7",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 624,
                    "bitSize": 48
                },
                {
                    "name": "#challenge8",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 672,
                    "bitSize": 48
                },
                {
                    "name": "#challenge9",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 720,
                    "bitSize": 48
                },
                {
                    "name": "#challenge10",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1160,
                    "bitSize": 48
                },
                {
                    "name": "#prevscoreindex",
                    "type": "int",
                    "offset": 1008,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#prevscores",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 1208,
                    "bitSize": 320
                }
            ]
        },
        {
            "name": "#hash_2e0567490210dd82",
            "members": [
                {
                    "name": "#accolades",
                    "type": "struct#hash_63565a3d40f66255[19]",
                    "offset": 424,
                    "bitSize": 1368
                },
                {
                    "name": "#hash_71b609b078e360c0",
                    "type": "uint",
                    "offset": 1864,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#collectibles",
                    "type": "uint[10]",
                    "offset": 1854,
                    "bitSize": 10,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#allcollectiblescollected",
                    "type": "uint",
                    "offset": 1852,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_1e0160af4fd80dff",
                    "type": "uint[6]",
                    "offset": 1840,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_518113a79b08988",
                    "type": "uint[6]",
                    "offset": 1846,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_657891d65d881524",
                    "type": "uint[6]",
                    "offset": 1865,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_233621878f97486b",
                    "type": "uint[6]",
                    "offset": 1872,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 8,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2f236080a1058999",
                    "type": "uint[6]",
                    "offset": 200,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4643078d95a24d76",
                    "type": "uint",
                    "offset": 1853,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hasbeencompleted",
                    "type": "uint",
                    "offset": 1871,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_bf847c54dac3b",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 7
                },
                {
                    "name": "#hash_7787ac0184215bc1",
                    "type": "uint",
                    "offset": 392,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3cd96ca92c6f0d4c",
                    "type": "uint",
                    "offset": 1792,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1cc8d841efacb52a",
                    "type": "short",
                    "offset": 1824,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1878,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        },
        {
            "name": "#hash_5cb2d75a230a501f",
            "members": [
                {
                    "name": "#ranksachieved",
                    "type": "uint[4]",
                    "offset": 136,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_44b4e9269c8dc12d",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#highestscore",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52dbe660cac88df9",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_25ce643c6cf6507e",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b146f5d12b2b147",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 140,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_722a4055916df1ff",
            "members": [
                {
                    "name": "#hash_c159a616c8e909f",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_24bfa4caccae7ccc",
                    "type": "uint",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_477109e1674d778e",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2b12202dea292a78",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_65157f3e7aec5b46",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b75e7812ae582a0",
                    "type": "uint",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#numplayers",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52086efefda6cd87",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4cda3bb269028c08",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6f7512e92e96a86a",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_34212151b945069b",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4c59bf00eb8047c0",
                    "type": "uint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6e3edce84270ac4c",
                    "type": "uint",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_256e550d360e7cf6",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3ed0ae0744c78900",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_48cae9b9fcff7a5e",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 920,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 922,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6ef8b9b7a8fd75e1",
            "members": [
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_67b00e3091cde2fd",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_1608f63ae729eda5",
            "members": [
                {
                    "name": "#optionmarkedasold",
                    "type": "uint[300]",
                    "offset": 88,
                    "bitSize": 300,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#attachmentmarkedold",
                    "type": "uint[56]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#plevel",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 388,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_ca5eede65d9c59e",
            "members": [
                {
                    "name": "#stats",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 256,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_790a163d0959fa18",
            "members": [
                {
                    "name": "#layerspurchased",
                    "type": "uint",
                    "offset": 8192,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 12
                },
                {
                    "name": "#hash_4554e34a747022df",
                    "type": "struct#hash_2d74f509e9d33a86[12]",
                    "offset": 13320,
                    "bitSize": 12
                },
                {
                    "name": "#icons",
                    "type": "struct#hash_18562676c03c7954[1024]",
                    "offset": 0,
                    "bitSize": 8192
                },
                {
                    "name": "#backgrounds",
                    "type": "struct#hash_18562676c03c7954[640]",
                    "offset": 8200,
                    "bitSize": 5120
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13332,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_402baff65ae9b838",
            "members": [
                {
                    "name": "#features",
                    "type": "struct#hash_118b324c3f145926[14]",
                    "offset": 48,
                    "bitSize": 112
                },
                {
                    "name": "#selectedfeature",
                    "type": "byte",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#clanname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 40
                }
            ]
        },
        {
            "name": "#hash_4976dab983b23e8c",
            "members": [
                {
                    "name": "#consoleid64",
                    "type": "string",
                    "offset": 128,
                    "bitSize": 256
                },
                {
                    "name": "#macaddress",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#usecount",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timestamp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ipexternal",
                    "type": "struct#hash_25a11738b4152d0e",
                    "offset": 384,
                    "bitSize": 32
                },
                {
                    "name": "#nattype",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_4f6f299a12577aa4",
            "members": [
                {
                    "name": "#tokenspent",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tokentype",
                    "type": "uint[4]",
                    "offset": 9,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#itemunlocked",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        },
        {
            "name": "#hash_68741ec332f97ee1",
            "members": [
                {
                    "name": "#mappacks",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_7e353191747e874",
                    "type": "uint[128]",
                    "offset": 32,
                    "bitSize": 128,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_78a2c506849f9dda",
            "members": [
                {
                    "name": "#collectibles",
                    "type": "struct#hash_2efa05c484e77181[10]",
                    "offset": 0,
                    "bitSize": 3360
                }
            ]
        },
        {
            "name": "#hash_6962b6aa0c4853f4",
            "members": [
                {
                    "name": "#properties",
                    "type": "fixedpoint[20]",
                    "offset": 0,
                    "bitSize": 640,
                    "intSize": 32
                }
            ]
        },
        {
            "name": "#hash_b5aec1419b9a02d",
            "members": [
                {
                    "name": "#played",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 144,
                    "bitSize": 144
                },
                {
                    "name": "#hosted",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 0,
                    "bitSize": 144
                }
            ]
        },
        {
            "name": "#hash_5fafb39a86bc6dc7",
            "members": [
                {
                    "name": "#startingtime",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#endingtime",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#scoreboardposition",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 152,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#teamscoreratio",
                    "type": "fixedpoint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#gametype",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#quittype",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#forgiven",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 177,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_656bfcb3838e2907",
            "members": [
                {
                    "name": "#isactive",
                    "type": "uint",
                    "offset": 736,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xuid",
                    "type": "string",
                    "offset": 256,
                    "bitSize": 256
                },
                {
                    "name": "#name",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 256
                },
                {
                    "name": "#hash_59ef59765ff3f049",
                    "type": "short",
                    "offset": 720,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_4acf195b0eb09697",
                    "type": "short",
                    "offset": 624,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_488ffb249ad25e43",
                    "type": "uint",
                    "offset": 560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#curxp",
                    "type": "uint",
                    "offset": 512,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "short",
                    "offset": 592,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 544,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 640,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#assists",
                    "type": "short",
                    "offset": 704,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#revives",
                    "type": "short",
                    "offset": 608,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#medals",
                    "type": "short[3]",
                    "offset": 656,
                    "bitSize": 48,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 737,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_63565a3d40f66255",
            "members": [
                {
                    "name": "#highestvalue",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#value",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#state",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                }
            ]
        },
        {
            "name": "#hash_2d74f509e9d33a86",
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
        },
        {
            "name": "#hash_18562676c03c7954",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 2,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_118b324c3f145926",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 2,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_25a11738b4152d0e",
            "members": [
                {
                    "name": "#a",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#b",
                    "type": "byte",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#c",
                    "type": "byte",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#d",
                    "type": "byte",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_2efa05c484e77181",
            "members": [
                {
                    "name": "#mapname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 320
                },
                {
                    "name": "#collectibleindex",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 8
                },
                {
                    "name": "#set",
                    "type": "uint",
                    "offset": 328,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 329,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_2f60329a207db2b8",
            "members": [
                {
                    "name": "#started",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#quit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#dashboard",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#timeout",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kicked",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#completed",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                }
            ]
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/cp_stats.ddl",
    "version": 17,
    "metatable": "#hash_298315c475e28de2",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#playerxuid",
                    "type": "uint64",
                    "offset": 310888,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#playerstatslist",
                    "type": "struct#hash_6b3db80d498eb06[378]",
                    "offset": 282976,
                    "bitSize": 18144
                },
                {
                    "name": "#playercpdecorations",
                    "type": "uint[20]",
                    "offset": 562007,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 67744,
                    "bitSize": 144,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#hash_2c168e887ce14298",
                    "type": "uint",
                    "offset": 3760,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5988aeaa53d6e90c",
                    "type": "byte[50]",
                    "offset": 215624,
                    "bitSize": 400,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_42a4964bbd0c65a9",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 3440,
                    "bitSize": 320
                },
                {
                    "name": "#recenthitloccounts",
                    "type": "struct#hash_3b0f9e0921513e2c[10]",
                    "offset": 212504,
                    "bitSize": 3120
                },
                {
                    "name": "#hash_53f43899387a360d",
                    "type": "struct#hash_1a52129598e71dab[10]",
                    "offset": 146288,
                    "bitSize": 800
                },
                {
                    "name": "#afteractionreportstats",
                    "type": "struct#hash_6b411bb770fc8f6c",
                    "offset": 301696,
                    "bitSize": 8936
                },
                {
                    "name": "#completedchallengeseen",
                    "type": "uint[77]",
                    "offset": 562029,
                    "bitSize": 77,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46e7db8ceaba5b2f",
                    "type": "uint",
                    "offset": 561986,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#currenthitlocationindex",
                    "type": "uint",
                    "offset": 212464,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_2d1ef9ab49375351",
                    "type": "uint[2]",
                    "offset": 243336,
                    "bitSize": 64,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#companion",
                    "type": "uint",
                    "offset": 262568,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#faction",
                    "type": "uint",
                    "offset": 263632,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#hash_54a74aa3d5f3346d",
                    "type": "fixedpoint",
                    "offset": 282944,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#zmcampaigndata",
                    "type": "struct#hash_7690a9df20146d8a",
                    "offset": 561889,
                    "bitSize": 1
                },
                {
                    "name": "#gamehistory",
                    "type": "struct#hash_503eb0de8f9cf7c2[2]",
                    "offset": 3856,
                    "bitSize": 12368
                },
                {
                    "name": "#probation",
                    "type": "struct#hash_4bb25d7ad41fb449[2]",
                    "offset": 263408,
                    "bitSize": 192
                },
                {
                    "name": "#playerstatsbygametype",
                    "type": "struct#hash_2e1d3d3bb036d22c[12]",
                    "offset": 243400,
                    "bitSize": 18912
                },
                {
                    "name": "#currentweaponlevels",
                    "type": "uint[64]",
                    "offset": 147120,
                    "bitSize": 512,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_6dcaad4976588a44",
                    "type": "uint",
                    "offset": 212472,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_711b1260308620e7",
                    "type": "uint[20]",
                    "offset": 561987,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_3ceb201776787882",
                    "type": "uint",
                    "offset": 561888,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#highestmapreached",
                    "type": "uint",
                    "offset": 561856,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_191fbfb9e1a3acf3",
                    "type": "uint",
                    "offset": 282936,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_3de5a4846f45ad78",
                    "type": "uint[19]",
                    "offset": 216024,
                    "bitSize": 608,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#playerstatsbymap",
                    "type": "struct#hash_2e0567490210dd82[10]",
                    "offset": 216632,
                    "bitSize": 18800
                },
                {
                    "name": "#trainingsimstats",
                    "type": "struct#hash_5cb2d75a230a501f",
                    "offset": 263640,
                    "bitSize": 144
                },
                {
                    "name": "#hash_7dd9f1ac62a346d",
                    "type": "struct#hash_722a4055916df1ff",
                    "offset": 147696,
                    "bitSize": 480
                },
                {
                    "name": "#itemstats",
                    "type": "struct#hash_48cae9b9fcff7a5e[256]",
                    "offset": 324288,
                    "bitSize": 237568
                },
                {
                    "name": "#groupstats",
                    "type": "struct#hash_6ef8b9b7a8fd75e1[21]",
                    "offset": 263784,
                    "bitSize": 19152
                },
                {
                    "name": "#unlocks",
                    "type": "byte[32]",
                    "offset": 310632,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#attachments",
                    "type": "struct#hash_67b00e3091cde2fd[56]",
                    "offset": 16224,
                    "bitSize": 51520
                },
                {
                    "name": "#selectedcustomclass",
                    "type": "uint",
                    "offset": 3432,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#weaponstats",
                    "type": "struct#hash_1608f63ae729eda5[200]",
                    "offset": 67888,
                    "bitSize": 78400
                },
                {
                    "name": "#variantstats",
                    "type": "struct#hash_ca5eede65d9c59e[251]",
                    "offset": 148208,
                    "bitSize": 64256
                },
                {
                    "name": "#hash_3313a30250a39ec5",
                    "type": "uint",
                    "offset": 262640,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#skill_rating",
                    "type": "fixedpoint",
                    "offset": 262576,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#skill_variance",
                    "type": "fixedpoint",
                    "offset": 301280,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_2363e7e74077b1c0",
                    "type": "fixedpoint[12]",
                    "offset": 262672,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#hash_3a7324ad328f0e2e",
                    "type": "fixedpoint[12]",
                    "offset": 301312,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#emblemstats",
                    "type": "struct#hash_790a163d0959fa18",
                    "offset": 310952,
                    "bitSize": 13336
                },
                {
                    "name": "#clantagstats",
                    "type": "struct#hash_402baff65ae9b838",
                    "offset": 301120,
                    "bitSize": 160
                },
                {
                    "name": "#lastconsolesave",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 9
                },
                {
                    "name": "#consoleinfo",
                    "type": "struct#hash_4976dab983b23e8c[10]",
                    "offset": 235432,
                    "bitSize": 4480
                },
                {
                    "name": "#connectionid",
                    "type": "uint64",
                    "offset": 147632,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#uploadbandwidth",
                    "type": "uint",
                    "offset": 263056,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#demonwareflags",
                    "type": "byte[32]",
                    "offset": 262312,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_188ecc3aca50f93d",
                    "type": "uint64",
                    "offset": 243272,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_3ec47111a3993e52",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_37aeca4d39214e62",
                    "type": "uint64",
                    "offset": 3792,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#prestigetokens",
                    "type": "struct#hash_4f6f299a12577aa4[20]",
                    "offset": 263088,
                    "bitSize": 320
                },
                {
                    "name": "#motdversionviewed",
                    "type": "int",
                    "offset": 148176,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#motdviewtime",
                    "type": "int",
                    "offset": 263600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_weapon",
                    "type": "int",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_attachment",
                    "type": "int",
                    "offset": 262608,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#combattrainingwins",
                    "type": "int",
                    "offset": 147088,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_1576a2fd30a2dfb0",
                    "type": "uint[64]",
                    "offset": 561922,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#dlc",
                    "type": "struct#hash_68741ec332f97ee1",
                    "offset": 0,
                    "bitSize": 160
                },
                {
                    "name": "#bunkcollectibles",
                    "type": "struct#hash_78a2c506849f9dda",
                    "offset": 239912,
                    "bitSize": 3360
                },
                {
                    "name": "#facialfeatureproperties",
                    "type": "struct#hash_6962b6aa0c4853f4[5]",
                    "offset": 232,
                    "bitSize": 3200
                },
                {
                    "name": "#completedfirsttimeflow",
                    "type": "uint",
                    "offset": 562028,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_8cbe2e4ecb4fc43",
                    "type": "uint",
                    "offset": 562027,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#musicunlocks",
                    "type": "uint[32]",
                    "offset": 561890,
                    "bitSize": 32,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 562106,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6b3db80d498eb06",
            "members": [
                {
                    "name": "#statvalue",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#challengevalue",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#hash_5ef0b8418736fce5",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 25,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_503eb0de8f9cf7c2",
            "members": [
                {
                    "name": "#modehistory",
                    "type": "struct#hash_b5aec1419b9a02d",
                    "offset": 5888,
                    "bitSize": 288
                },
                {
                    "name": "#matchhistory",
                    "type": "struct#hash_5fafb39a86bc6dc7[32]",
                    "offset": 0,
                    "bitSize": 5888
                },
                {
                    "name": "#currentmatchhistoryindex",
                    "type": "byte",
                    "offset": 6176,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_3b0f9e0921513e2c",
            "members": [
                {
                    "name": "#hitlocations",
                    "type": "byte[19]",
                    "offset": 0,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#criticalhitlocations",
                    "type": "byte[19]",
                    "offset": 152,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
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
            "name": "#hash_1a52129598e71dab",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 56,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#gametype",
                    "type": "short",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6b411bb770fc8f6c",
            "members": [
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 8928,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_372ebbc622aaa659",
                    "type": "uint",
                    "offset": 8931,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#privatematch",
                    "type": "uint",
                    "offset": 8930,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_18f8a178f6083a8e",
                    "type": "uint",
                    "offset": 8929,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_2475b5a284a63853",
                    "type": "struct#hash_656bfcb3838e2907[12]",
                    "offset": 0,
                    "bitSize": 8928
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8932,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_7690a9df20146d8a",
            "members": [
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_4bb25d7ad41fb449",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timewhenprobationisdone",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#count",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_2e1d3d3bb036d22c",
            "members": [
                {
                    "name": "#assists",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 96,
                    "bitSize": 48
                },
                {
                    "name": "#cur_win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 816,
                    "bitSize": 48
                },
                {
                    "name": "#crush",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 144,
                    "bitSize": 48
                },
                {
                    "name": "#deaths",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 912,
                    "bitSize": 48
                },
                {
                    "name": "#defends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1064,
                    "bitSize": 48
                },
                {
                    "name": "#kdratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1528,
                    "bitSize": 48
                },
                {
                    "name": "#kills",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 192,
                    "bitSize": 48
                },
                {
                    "name": "#kill_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 864,
                    "bitSize": 48
                },
                {
                    "name": "#losses",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1016,
                    "bitSize": 48
                },
                {
                    "name": "#offends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1112,
                    "bitSize": 48
                },
                {
                    "name": "#score",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 240,
                    "bitSize": 48
                },
                {
                    "name": "#ties",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 0,
                    "bitSize": 48
                },
                {
                    "name": "#time_played_total",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 288,
                    "bitSize": 48
                },
                {
                    "name": "#wins",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 48,
                    "bitSize": 48
                },
                {
                    "name": "#win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 768,
                    "bitSize": 48
                },
                {
                    "name": "#wlratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 960,
                    "bitSize": 48
                },
                {
                    "name": "#challenge1",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 336,
                    "bitSize": 48
                },
                {
                    "name": "#challenge2",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 384,
                    "bitSize": 48
                },
                {
                    "name": "#challenge3",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 432,
                    "bitSize": 48
                },
                {
                    "name": "#challenge4",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 480,
                    "bitSize": 48
                },
                {
                    "name": "#challenge5",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 528,
                    "bitSize": 48
                },
                {
                    "name": "#challenge6",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 576,
                    "bitSize": 48
                },
                {
                    "name": "#challenge7",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 624,
                    "bitSize": 48
                },
                {
                    "name": "#challenge8",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 672,
                    "bitSize": 48
                },
                {
                    "name": "#challenge9",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 720,
                    "bitSize": 48
                },
                {
                    "name": "#challenge10",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1160,
                    "bitSize": 48
                },
                {
                    "name": "#prevscoreindex",
                    "type": "int",
                    "offset": 1008,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#prevscores",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 1208,
                    "bitSize": 320
                }
            ]
        },
        {
            "name": "#hash_2e0567490210dd82",
            "members": [
                {
                    "name": "#accolades",
                    "type": "struct#hash_63565a3d40f66255[19]",
                    "offset": 424,
                    "bitSize": 1368
                },
                {
                    "name": "#hash_71b609b078e360c0",
                    "type": "uint",
                    "offset": 1864,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#collectibles",
                    "type": "uint[10]",
                    "offset": 1854,
                    "bitSize": 10,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#allcollectiblescollected",
                    "type": "uint",
                    "offset": 1852,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_1e0160af4fd80dff",
                    "type": "uint[6]",
                    "offset": 1840,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_518113a79b08988",
                    "type": "uint[6]",
                    "offset": 1846,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_657891d65d881524",
                    "type": "uint[6]",
                    "offset": 1865,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_233621878f97486b",
                    "type": "uint[6]",
                    "offset": 1872,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 8,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2f236080a1058999",
                    "type": "uint[6]",
                    "offset": 200,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4643078d95a24d76",
                    "type": "uint",
                    "offset": 1853,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hasbeencompleted",
                    "type": "uint",
                    "offset": 1871,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_bf847c54dac3b",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 7
                },
                {
                    "name": "#hash_7787ac0184215bc1",
                    "type": "uint",
                    "offset": 392,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3cd96ca92c6f0d4c",
                    "type": "uint",
                    "offset": 1792,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1cc8d841efacb52a",
                    "type": "short",
                    "offset": 1824,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1878,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        },
        {
            "name": "#hash_5cb2d75a230a501f",
            "members": [
                {
                    "name": "#ranksachieved",
                    "type": "uint[4]",
                    "offset": 136,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_44b4e9269c8dc12d",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#highestscore",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52dbe660cac88df9",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_25ce643c6cf6507e",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b146f5d12b2b147",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 140,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_722a4055916df1ff",
            "members": [
                {
                    "name": "#hash_c159a616c8e909f",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_24bfa4caccae7ccc",
                    "type": "uint",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_477109e1674d778e",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2b12202dea292a78",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_65157f3e7aec5b46",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b75e7812ae582a0",
                    "type": "uint",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#numplayers",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52086efefda6cd87",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4cda3bb269028c08",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6f7512e92e96a86a",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_34212151b945069b",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4c59bf00eb8047c0",
                    "type": "uint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6e3edce84270ac4c",
                    "type": "uint",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_256e550d360e7cf6",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3ed0ae0744c78900",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_48cae9b9fcff7a5e",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 920,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 922,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6ef8b9b7a8fd75e1",
            "members": [
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_67b00e3091cde2fd",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_1608f63ae729eda5",
            "members": [
                {
                    "name": "#optionmarkedasold",
                    "type": "uint[300]",
                    "offset": 88,
                    "bitSize": 300,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#attachmentmarkedold",
                    "type": "uint[56]",
                    "offset": 32,
                    "bitSize": 56,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#plevel",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 388,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_ca5eede65d9c59e",
            "members": [
                {
                    "name": "#stats",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 256,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_790a163d0959fa18",
            "members": [
                {
                    "name": "#layerspurchased",
                    "type": "uint",
                    "offset": 8192,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 12
                },
                {
                    "name": "#hash_4554e34a747022df",
                    "type": "struct#hash_2d74f509e9d33a86[12]",
                    "offset": 13320,
                    "bitSize": 12
                },
                {
                    "name": "#icons",
                    "type": "struct#hash_18562676c03c7954[1024]",
                    "offset": 0,
                    "bitSize": 8192
                },
                {
                    "name": "#backgrounds",
                    "type": "struct#hash_18562676c03c7954[640]",
                    "offset": 8200,
                    "bitSize": 5120
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13332,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_402baff65ae9b838",
            "members": [
                {
                    "name": "#features",
                    "type": "struct#hash_118b324c3f145926[14]",
                    "offset": 48,
                    "bitSize": 112
                },
                {
                    "name": "#selectedfeature",
                    "type": "byte",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#clanname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 40
                }
            ]
        },
        {
            "name": "#hash_4976dab983b23e8c",
            "members": [
                {
                    "name": "#consoleid64",
                    "type": "string",
                    "offset": 128,
                    "bitSize": 256
                },
                {
                    "name": "#macaddress",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#usecount",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timestamp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ipexternal",
                    "type": "struct#hash_25a11738b4152d0e",
                    "offset": 384,
                    "bitSize": 32
                },
                {
                    "name": "#nattype",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_4f6f299a12577aa4",
            "members": [
                {
                    "name": "#tokenspent",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tokentype",
                    "type": "uint[4]",
                    "offset": 9,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#itemunlocked",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        },
        {
            "name": "#hash_68741ec332f97ee1",
            "members": [
                {
                    "name": "#mappacks",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_7e353191747e874",
                    "type": "uint[128]",
                    "offset": 32,
                    "bitSize": 128,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_78a2c506849f9dda",
            "members": [
                {
                    "name": "#collectibles",
                    "type": "struct#hash_2efa05c484e77181[10]",
                    "offset": 0,
                    "bitSize": 3360
                }
            ]
        },
        {
            "name": "#hash_6962b6aa0c4853f4",
            "members": [
                {
                    "name": "#properties",
                    "type": "fixedpoint[20]",
                    "offset": 0,
                    "bitSize": 640,
                    "intSize": 32
                }
            ]
        },
        {
            "name": "#hash_b5aec1419b9a02d",
            "members": [
                {
                    "name": "#played",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 144,
                    "bitSize": 144
                },
                {
                    "name": "#hosted",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 0,
                    "bitSize": 144
                }
            ]
        },
        {
            "name": "#hash_5fafb39a86bc6dc7",
            "members": [
                {
                    "name": "#startingtime",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#endingtime",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#scoreboardposition",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 152,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#teamscoreratio",
                    "type": "fixedpoint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#gametype",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#quittype",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#forgiven",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 177,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_656bfcb3838e2907",
            "members": [
                {
                    "name": "#isactive",
                    "type": "uint",
                    "offset": 736,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xuid",
                    "type": "string",
                    "offset": 256,
                    "bitSize": 256
                },
                {
                    "name": "#name",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 256
                },
                {
                    "name": "#hash_59ef59765ff3f049",
                    "type": "short",
                    "offset": 720,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_4acf195b0eb09697",
                    "type": "short",
                    "offset": 624,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_488ffb249ad25e43",
                    "type": "uint",
                    "offset": 560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#curxp",
                    "type": "uint",
                    "offset": 512,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "short",
                    "offset": 592,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 544,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 640,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#assists",
                    "type": "short",
                    "offset": 704,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#revives",
                    "type": "short",
                    "offset": 608,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#medals",
                    "type": "short[3]",
                    "offset": 656,
                    "bitSize": 48,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 737,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_63565a3d40f66255",
            "members": [
                {
                    "name": "#highestvalue",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#value",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#state",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                }
            ]
        },
        {
            "name": "#hash_2d74f509e9d33a86",
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
        },
        {
            "name": "#hash_18562676c03c7954",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 2,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_118b324c3f145926",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 2,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_25a11738b4152d0e",
            "members": [
                {
                    "name": "#a",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#b",
                    "type": "byte",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#c",
                    "type": "byte",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#d",
                    "type": "byte",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_2efa05c484e77181",
            "members": [
                {
                    "name": "#mapname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 320
                },
                {
                    "name": "#collectibleindex",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 8
                },
                {
                    "name": "#set",
                    "type": "uint",
                    "offset": 328,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 329,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_2f60329a207db2b8",
            "members": [
                {
                    "name": "#started",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#quit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#dashboard",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#timeout",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kicked",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#completed",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                }
            ]
        }
    ]
},
{
    "name": "#gamedata/ddl/generated/cp_stats.ddl",
    "version": 16,
    "metatable": "#hash_15439fd61ac36bd8",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#playerxuid",
                    "type": "uint64",
                    "offset": 319848,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#playerstatslist",
                    "type": "struct#hash_6b3db80d498eb06[378]",
                    "offset": 291936,
                    "bitSize": 18144
                },
                {
                    "name": "#playercpdecorations",
                    "type": "uint[20]",
                    "offset": 570967,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 75104,
                    "bitSize": 144,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#hash_2c168e887ce14298",
                    "type": "uint",
                    "offset": 3760,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5988aeaa53d6e90c",
                    "type": "byte[50]",
                    "offset": 224584,
                    "bitSize": 400,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_42a4964bbd0c65a9",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 3440,
                    "bitSize": 320
                },
                {
                    "name": "#recenthitloccounts",
                    "type": "struct#hash_3b0f9e0921513e2c[10]",
                    "offset": 221464,
                    "bitSize": 3120
                },
                {
                    "name": "#hash_53f43899387a360d",
                    "type": "struct#hash_1a52129598e71dab[10]",
                    "offset": 155248,
                    "bitSize": 800
                },
                {
                    "name": "#afteractionreportstats",
                    "type": "struct#hash_6b411bb770fc8f6c",
                    "offset": 310656,
                    "bitSize": 8936
                },
                {
                    "name": "#completedchallengeseen",
                    "type": "uint[77]",
                    "offset": 570989,
                    "bitSize": 77,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46e7db8ceaba5b2f",
                    "type": "uint",
                    "offset": 570946,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#currenthitlocationindex",
                    "type": "uint",
                    "offset": 221424,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 10
                },
                {
                    "name": "#hash_2d1ef9ab49375351",
                    "type": "uint[2]",
                    "offset": 252296,
                    "bitSize": 64,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#companion",
                    "type": "uint",
                    "offset": 271528,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#faction",
                    "type": "uint",
                    "offset": 272592,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#hash_54a74aa3d5f3346d",
                    "type": "fixedpoint",
                    "offset": 291904,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#zmcampaigndata",
                    "type": "struct#hash_7690a9df20146d8a",
                    "offset": 570849,
                    "bitSize": 1
                },
                {
                    "name": "#gamehistory",
                    "type": "struct#hash_503eb0de8f9cf7c2[2]",
                    "offset": 3856,
                    "bitSize": 12368
                },
                {
                    "name": "#probation",
                    "type": "struct#hash_4bb25d7ad41fb449[2]",
                    "offset": 272368,
                    "bitSize": 192
                },
                {
                    "name": "#playerstatsbygametype",
                    "type": "struct#hash_2e1d3d3bb036d22c[12]",
                    "offset": 252360,
                    "bitSize": 18912
                },
                {
                    "name": "#currentweaponlevels",
                    "type": "uint[64]",
                    "offset": 156080,
                    "bitSize": 512,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_6dcaad4976588a44",
                    "type": "uint",
                    "offset": 221432,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_711b1260308620e7",
                    "type": "uint[20]",
                    "offset": 570947,
                    "bitSize": 20,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_3ceb201776787882",
                    "type": "uint",
                    "offset": 570848,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#highestmapreached",
                    "type": "uint",
                    "offset": 570816,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_191fbfb9e1a3acf3",
                    "type": "uint",
                    "offset": 291896,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 15
                },
                {
                    "name": "#hash_3de5a4846f45ad78",
                    "type": "uint[19]",
                    "offset": 224984,
                    "bitSize": 608,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#playerstatsbymap",
                    "type": "struct#hash_2e0567490210dd82[10]",
                    "offset": 225592,
                    "bitSize": 18800
                },
                {
                    "name": "#trainingsimstats",
                    "type": "struct#hash_5cb2d75a230a501f",
                    "offset": 272600,
                    "bitSize": 144
                },
                {
                    "name": "#hash_7dd9f1ac62a346d",
                    "type": "struct#hash_722a4055916df1ff",
                    "offset": 156656,
                    "bitSize": 480
                },
                {
                    "name": "#itemstats",
                    "type": "struct#hash_48cae9b9fcff7a5e[256]",
                    "offset": 333248,
                    "bitSize": 237568
                },
                {
                    "name": "#groupstats",
                    "type": "struct#hash_6ef8b9b7a8fd75e1[21]",
                    "offset": 272744,
                    "bitSize": 19152
                },
                {
                    "name": "#unlocks",
                    "type": "byte[32]",
                    "offset": 319592,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#attachments",
                    "type": "struct#hash_67b00e3091cde2fd[64]",
                    "offset": 16224,
                    "bitSize": 58880
                },
                {
                    "name": "#selectedcustomclass",
                    "type": "uint",
                    "offset": 3432,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 16
                },
                {
                    "name": "#weaponstats",
                    "type": "struct#hash_1608f63ae729eda5[200]",
                    "offset": 75248,
                    "bitSize": 80000
                },
                {
                    "name": "#variantstats",
                    "type": "struct#hash_ca5eede65d9c59e[251]",
                    "offset": 157168,
                    "bitSize": 64256
                },
                {
                    "name": "#hash_3313a30250a39ec5",
                    "type": "uint",
                    "offset": 271600,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#skill_rating",
                    "type": "fixedpoint",
                    "offset": 271536,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#skill_variance",
                    "type": "fixedpoint",
                    "offset": 310240,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#hash_2363e7e74077b1c0",
                    "type": "fixedpoint[12]",
                    "offset": 271632,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#hash_3a7324ad328f0e2e",
                    "type": "fixedpoint[12]",
                    "offset": 310272,
                    "bitSize": 384,
                    "intSize": 32
                },
                {
                    "name": "#emblemstats",
                    "type": "struct#hash_790a163d0959fa18",
                    "offset": 319912,
                    "bitSize": 13336
                },
                {
                    "name": "#clantagstats",
                    "type": "struct#hash_402baff65ae9b838",
                    "offset": 310080,
                    "bitSize": 160
                },
                {
                    "name": "#lastconsolesave",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 9
                },
                {
                    "name": "#consoleinfo",
                    "type": "struct#hash_4976dab983b23e8c[10]",
                    "offset": 244392,
                    "bitSize": 4480
                },
                {
                    "name": "#connectionid",
                    "type": "uint64",
                    "offset": 156592,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#uploadbandwidth",
                    "type": "uint",
                    "offset": 272016,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#demonwareflags",
                    "type": "byte[32]",
                    "offset": 271272,
                    "bitSize": 256,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_188ecc3aca50f93d",
                    "type": "uint64",
                    "offset": 252232,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_3ec47111a3993e52",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_37aeca4d39214e62",
                    "type": "uint64",
                    "offset": 3792,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#prestigetokens",
                    "type": "struct#hash_4f6f299a12577aa4[20]",
                    "offset": 272048,
                    "bitSize": 320
                },
                {
                    "name": "#motdversionviewed",
                    "type": "int",
                    "offset": 157136,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#motdviewtime",
                    "type": "int",
                    "offset": 272560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_weapon",
                    "type": "int",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#unlocktokencount_attachment",
                    "type": "int",
                    "offset": 271568,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#combattrainingwins",
                    "type": "int",
                    "offset": 156048,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_1576a2fd30a2dfb0",
                    "type": "uint[64]",
                    "offset": 570882,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#dlc",
                    "type": "struct#hash_68741ec332f97ee1",
                    "offset": 0,
                    "bitSize": 160
                },
                {
                    "name": "#bunkcollectibles",
                    "type": "struct#hash_78a2c506849f9dda",
                    "offset": 248872,
                    "bitSize": 3360
                },
                {
                    "name": "#facialfeatureproperties",
                    "type": "struct#hash_6962b6aa0c4853f4[5]",
                    "offset": 232,
                    "bitSize": 3200
                },
                {
                    "name": "#completedfirsttimeflow",
                    "type": "uint",
                    "offset": 570988,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_8cbe2e4ecb4fc43",
                    "type": "uint",
                    "offset": 570987,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#musicunlocks",
                    "type": "uint[32]",
                    "offset": 570850,
                    "bitSize": 32,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 571066,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6b3db80d498eb06",
            "members": [
                {
                    "name": "#statvalue",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#challengevalue",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#hash_5ef0b8418736fce5",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 25,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_503eb0de8f9cf7c2",
            "members": [
                {
                    "name": "#modehistory",
                    "type": "struct#hash_b5aec1419b9a02d",
                    "offset": 5888,
                    "bitSize": 288
                },
                {
                    "name": "#matchhistory",
                    "type": "struct#hash_5fafb39a86bc6dc7[32]",
                    "offset": 0,
                    "bitSize": 5888
                },
                {
                    "name": "#currentmatchhistoryindex",
                    "type": "byte",
                    "offset": 6176,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_3b0f9e0921513e2c",
            "members": [
                {
                    "name": "#hitlocations",
                    "type": "byte[19]",
                    "offset": 0,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#criticalhitlocations",
                    "type": "byte[19]",
                    "offset": 152,
                    "bitSize": 152,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 304,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
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
            "name": "#hash_1a52129598e71dab",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 56,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#gametype",
                    "type": "short",
                    "offset": 40,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 73,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_6b411bb770fc8f6c",
            "members": [
                {
                    "name": "#valid",
                    "type": "uint",
                    "offset": 8928,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_372ebbc622aaa659",
                    "type": "uint",
                    "offset": 8931,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#privatematch",
                    "type": "uint",
                    "offset": 8930,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_18f8a178f6083a8e",
                    "type": "uint",
                    "offset": 8929,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_2475b5a284a63853",
                    "type": "struct#hash_656bfcb3838e2907[12]",
                    "offset": 0,
                    "bitSize": 8928
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 8932,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_7690a9df20146d8a",
            "members": [
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_4bb25d7ad41fb449",
            "members": [
                {
                    "name": "#version",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timewhenprobationisdone",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#count",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_2e1d3d3bb036d22c",
            "members": [
                {
                    "name": "#assists",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 96,
                    "bitSize": 48
                },
                {
                    "name": "#cur_win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 816,
                    "bitSize": 48
                },
                {
                    "name": "#crush",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 144,
                    "bitSize": 48
                },
                {
                    "name": "#deaths",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 912,
                    "bitSize": 48
                },
                {
                    "name": "#defends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1064,
                    "bitSize": 48
                },
                {
                    "name": "#kdratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1528,
                    "bitSize": 48
                },
                {
                    "name": "#kills",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 192,
                    "bitSize": 48
                },
                {
                    "name": "#kill_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 864,
                    "bitSize": 48
                },
                {
                    "name": "#losses",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1016,
                    "bitSize": 48
                },
                {
                    "name": "#offends",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1112,
                    "bitSize": 48
                },
                {
                    "name": "#score",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 240,
                    "bitSize": 48
                },
                {
                    "name": "#ties",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 0,
                    "bitSize": 48
                },
                {
                    "name": "#time_played_total",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 288,
                    "bitSize": 48
                },
                {
                    "name": "#wins",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 48,
                    "bitSize": 48
                },
                {
                    "name": "#win_streak",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 768,
                    "bitSize": 48
                },
                {
                    "name": "#wlratio",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 960,
                    "bitSize": 48
                },
                {
                    "name": "#challenge1",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 336,
                    "bitSize": 48
                },
                {
                    "name": "#challenge2",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 384,
                    "bitSize": 48
                },
                {
                    "name": "#challenge3",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 432,
                    "bitSize": 48
                },
                {
                    "name": "#challenge4",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 480,
                    "bitSize": 48
                },
                {
                    "name": "#challenge5",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 528,
                    "bitSize": 48
                },
                {
                    "name": "#challenge6",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 576,
                    "bitSize": 48
                },
                {
                    "name": "#challenge7",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 624,
                    "bitSize": 48
                },
                {
                    "name": "#challenge8",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 672,
                    "bitSize": 48
                },
                {
                    "name": "#challenge9",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 720,
                    "bitSize": 48
                },
                {
                    "name": "#challenge10",
                    "type": "struct#hash_6b3db80d498eb06",
                    "offset": 1160,
                    "bitSize": 48
                },
                {
                    "name": "#prevscoreindex",
                    "type": "int",
                    "offset": 1008,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 10
                },
                {
                    "name": "#prevscores",
                    "type": "struct#hash_5ef0b8418736fce5[10]",
                    "offset": 1208,
                    "bitSize": 320
                }
            ]
        },
        {
            "name": "#hash_2e0567490210dd82",
            "members": [
                {
                    "name": "#accolades",
                    "type": "struct#hash_63565a3d40f66255[19]",
                    "offset": 424,
                    "bitSize": 1368
                },
                {
                    "name": "#hash_71b609b078e360c0",
                    "type": "uint",
                    "offset": 1864,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#collectibles",
                    "type": "uint[10]",
                    "offset": 1854,
                    "bitSize": 10,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#allcollectiblescollected",
                    "type": "uint",
                    "offset": 1852,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_1e0160af4fd80dff",
                    "type": "uint[6]",
                    "offset": 1840,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_518113a79b08988",
                    "type": "uint[6]",
                    "offset": 1846,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_657891d65d881524",
                    "type": "uint[6]",
                    "offset": 1865,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_233621878f97486b",
                    "type": "uint[6]",
                    "offset": 1872,
                    "bitSize": 6,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#higheststats",
                    "type": "uint[6]",
                    "offset": 8,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2f236080a1058999",
                    "type": "uint[6]",
                    "offset": 200,
                    "bitSize": 192,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4643078d95a24d76",
                    "type": "uint",
                    "offset": 1853,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hasbeencompleted",
                    "type": "uint",
                    "offset": 1871,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_bf847c54dac3b",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 7
                },
                {
                    "name": "#hash_7787ac0184215bc1",
                    "type": "uint",
                    "offset": 392,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3cd96ca92c6f0d4c",
                    "type": "uint",
                    "offset": 1792,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1cc8d841efacb52a",
                    "type": "short",
                    "offset": 1824,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 1878,
                    "bitSize": 2,
                    "intSize": 2
                }
            ]
        },
        {
            "name": "#hash_5cb2d75a230a501f",
            "members": [
                {
                    "name": "#ranksachieved",
                    "type": "uint[4]",
                    "offset": 136,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_44b4e9269c8dc12d",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#highestscore",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52dbe660cac88df9",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_25ce643c6cf6507e",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b146f5d12b2b147",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 140,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_722a4055916df1ff",
            "members": [
                {
                    "name": "#hash_c159a616c8e909f",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_24bfa4caccae7ccc",
                    "type": "uint",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_477109e1674d778e",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_2b12202dea292a78",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_65157f3e7aec5b46",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_1b75e7812ae582a0",
                    "type": "uint",
                    "offset": 352,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#numplayers",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_52086efefda6cd87",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4cda3bb269028c08",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6f7512e92e96a86a",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_34212151b945069b",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_4c59bf00eb8047c0",
                    "type": "uint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_6e3edce84270ac4c",
                    "type": "uint",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_256e550d360e7cf6",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3ed0ae0744c78900",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_48cae9b9fcff7a5e",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 920,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 921,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 922,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_6ef8b9b7a8fd75e1",
            "members": [
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_67b00e3091cde2fd",
            "members": [
                {
                    "name": "#hash_798921f18e351b13",
                    "type": "uint[8]",
                    "offset": 912,
                    "bitSize": 8,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#stats",
                    "type": "struct#hash_6b3db80d498eb06[19]",
                    "offset": 0,
                    "bitSize": 912
                }
            ]
        },
        {
            "name": "#hash_1608f63ae729eda5",
            "members": [
                {
                    "name": "#optionmarkedasold",
                    "type": "uint[300]",
                    "offset": 96,
                    "bitSize": 300,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#attachmentmarkedold",
                    "type": "uint[64]",
                    "offset": 32,
                    "bitSize": 64,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#plevel",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 396,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_ca5eede65d9c59e",
            "members": [
                {
                    "name": "#stats",
                    "type": "uint[8]",
                    "offset": 0,
                    "bitSize": 256,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_790a163d0959fa18",
            "members": [
                {
                    "name": "#layerspurchased",
                    "type": "uint",
                    "offset": 8192,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 12
                },
                {
                    "name": "#hash_4554e34a747022df",
                    "type": "struct#hash_2d74f509e9d33a86[12]",
                    "offset": 13320,
                    "bitSize": 12
                },
                {
                    "name": "#icons",
                    "type": "struct#hash_18562676c03c7954[1024]",
                    "offset": 0,
                    "bitSize": 8192
                },
                {
                    "name": "#backgrounds",
                    "type": "struct#hash_18562676c03c7954[640]",
                    "offset": 8200,
                    "bitSize": 5120
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13332,
                    "bitSize": 4,
                    "intSize": 4
                }
            ]
        },
        {
            "name": "#hash_402baff65ae9b838",
            "members": [
                {
                    "name": "#features",
                    "type": "struct#hash_118b324c3f145926[14]",
                    "offset": 48,
                    "bitSize": 112
                },
                {
                    "name": "#selectedfeature",
                    "type": "byte",
                    "offset": 40,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#clanname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 40
                }
            ]
        },
        {
            "name": "#hash_4976dab983b23e8c",
            "members": [
                {
                    "name": "#consoleid64",
                    "type": "string",
                    "offset": 128,
                    "bitSize": 256
                },
                {
                    "name": "#macaddress",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#usecount",
                    "type": "uint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timestamp",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ipexternal",
                    "type": "struct#hash_25a11738b4152d0e",
                    "offset": 384,
                    "bitSize": 32
                },
                {
                    "name": "#nattype",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_4f6f299a12577aa4",
            "members": [
                {
                    "name": "#tokenspent",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#tokentype",
                    "type": "uint[4]",
                    "offset": 9,
                    "bitSize": 4,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#itemunlocked",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 13,
                    "bitSize": 3,
                    "intSize": 3
                }
            ]
        },
        {
            "name": "#hash_68741ec332f97ee1",
            "members": [
                {
                    "name": "#mappacks",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_7e353191747e874",
                    "type": "uint[128]",
                    "offset": 32,
                    "bitSize": 128,
                    "intSize": 1,
                    "maxIntValue": 1
                }
            ]
        },
        {
            "name": "#hash_78a2c506849f9dda",
            "members": [
                {
                    "name": "#collectibles",
                    "type": "struct#hash_2efa05c484e77181[10]",
                    "offset": 0,
                    "bitSize": 3360
                }
            ]
        },
        {
            "name": "#hash_6962b6aa0c4853f4",
            "members": [
                {
                    "name": "#properties",
                    "type": "fixedpoint[20]",
                    "offset": 0,
                    "bitSize": 640,
                    "intSize": 32
                }
            ]
        },
        {
            "name": "#hash_b5aec1419b9a02d",
            "members": [
                {
                    "name": "#played",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 144,
                    "bitSize": 144
                },
                {
                    "name": "#hosted",
                    "type": "struct#hash_2f60329a207db2b8",
                    "offset": 0,
                    "bitSize": 144
                }
            ]
        },
        {
            "name": "#hash_5fafb39a86bc6dc7",
            "members": [
                {
                    "name": "#startingtime",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#endingtime",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 16,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#scoreboardposition",
                    "type": "uint",
                    "offset": 104,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 0,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 152,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#teamscoreratio",
                    "type": "fixedpoint",
                    "offset": 112,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#gametype",
                    "type": "uint",
                    "offset": 144,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#quittype",
                    "type": "uint",
                    "offset": 168,
                    "bitSize": 8,
                    "intSize": 3,
                    "maxIntValue": 4
                },
                {
                    "name": "#forgiven",
                    "type": "uint",
                    "offset": 176,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 177,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_656bfcb3838e2907",
            "members": [
                {
                    "name": "#isactive",
                    "type": "uint",
                    "offset": 736,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#xuid",
                    "type": "string",
                    "offset": 256,
                    "bitSize": 256
                },
                {
                    "name": "#name",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 256
                },
                {
                    "name": "#hash_59ef59765ff3f049",
                    "type": "short",
                    "offset": 720,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_4acf195b0eb09697",
                    "type": "short",
                    "offset": 624,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_488ffb249ad25e43",
                    "type": "uint",
                    "offset": 560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#curxp",
                    "type": "uint",
                    "offset": 512,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#score",
                    "type": "short",
                    "offset": 592,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#kills",
                    "type": "short",
                    "offset": 544,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "short",
                    "offset": 640,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#assists",
                    "type": "short",
                    "offset": 704,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#revives",
                    "type": "short",
                    "offset": 608,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#medals",
                    "type": "short[3]",
                    "offset": 656,
                    "bitSize": 48,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 737,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_63565a3d40f66255",
            "members": [
                {
                    "name": "#highestvalue",
                    "type": "uint",
                    "offset": 40,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#value",
                    "type": "uint",
                    "offset": 8,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#state",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 2,
                    "maxIntValue": 3
                }
            ]
        },
        {
            "name": "#hash_2d74f509e9d33a86",
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
        },
        {
            "name": "#hash_18562676c03c7954",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#unlocked",
                    "type": "uint",
                    "offset": 2,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 3,
                    "bitSize": 5,
                    "intSize": 5
                }
            ]
        },
        {
            "name": "#hash_118b324c3f145926",
            "members": [
                {
                    "name": "#purchased",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#markedold",
                    "type": "uint",
                    "offset": 1,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 2,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#hash_25a11738b4152d0e",
            "members": [
                {
                    "name": "#a",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#b",
                    "type": "byte",
                    "offset": 8,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#c",
                    "type": "byte",
                    "offset": 16,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#d",
                    "type": "byte",
                    "offset": 24,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        },
        {
            "name": "#hash_2efa05c484e77181",
            "members": [
                {
                    "name": "#mapname",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 320
                },
                {
                    "name": "#collectibleindex",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 8,
                    "intSize": 4,
                    "maxIntValue": 8
                },
                {
                    "name": "#set",
                    "type": "uint",
                    "offset": 328,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 329,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_2f60329a207db2b8",
            "members": [
                {
                    "name": "#started",
                    "type": "uint",
                    "offset": 24,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#quit",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#dashboard",
                    "type": "uint",
                    "offset": 120,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#timeout",
                    "type": "uint",
                    "offset": 72,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#kicked",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                },
                {
                    "name": "#completed",
                    "type": "uint",
                    "offset": 48,
                    "bitSize": 24,
                    "intSize": 24,
                    "maxIntValue": 16777215
                }
            ]
        }
    ]
}