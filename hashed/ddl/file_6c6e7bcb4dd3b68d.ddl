{
    "name": "#hash_6c6e7bcb4dd3b68d",
    "version": 4,
    "metatable": "#hash_7f2aa3b91a07b5a7",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#arenastats",
                    "type": "struct#arenastats[9]",
                    "offset": 2656,
                    "bitSize": 11088
                },
                {
                    "name": "#arenaperseasonstats",
                    "type": "struct#arenastats",
                    "offset": 1424,
                    "bitSize": 1232
                },
                {
                    "name": "#arenabest",
                    "type": "struct#arenastats",
                    "offset": 0,
                    "bitSize": 1232
                },
                {
                    "name": "#hash_7d19b83705dea420",
                    "type": "string",
                    "offset": 13744,
                    "bitSize": 256
                },
                {
                    "name": "#arenachallengeseasons",
                    "type": "short[12]",
                    "offset": 1232,
                    "bitSize": 192,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#arenastats",
            "members": [
                {
                    "name": "#season",
                    "type": "short",
                    "offset": 640,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#skill",
                    "type": "fixedpoint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#variance",
                    "type": "fixedpoint",
                    "offset": 608,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#rankedplaystats",
                    "type": "struct#hash_3bdd45425562efbc",
                    "offset": 288,
                    "bitSize": 320
                },
                {
                    "name": "#leagueplaystats",
                    "type": "struct#hash_6ed89f7cef839c06",
                    "offset": 656,
                    "bitSize": 576
                },
                {
                    "name": "#hash_4986c748eb81d3c5",
                    "type": "struct#hash_23802d45f95d62c2",
                    "offset": 32,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_3bdd45425562efbc",
            "members": [
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchstartpoints",
                    "type": "uint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 0,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_6ed89f7cef839c06",
            "members": [
                {
                    "name": "#teamid",
                    "type": "uint64",
                    "offset": 512,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_8d21fc27cb2a58b",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 480,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_40ab2c89a089b5a1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_650daed6d12d46cc",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3a2c893b724a10b0",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3be0648edda73ae2",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5dc602053653b486",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 224,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_23802d45f95d62c2",
            "members": [
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 0,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#hash_7b048091b1488cec",
            "members": [
                {
                    "name": "#streak",
                    "type": "int",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_4b3ab6c931987e2c",
                    "type": "int",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#wins",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#losses",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_21b4d1e5aa3c24b5",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_db665f25bc15c02",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ties",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_321ef22328085145",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        }
    ]
},
{
    "name": "#hash_6c6e7bcb4dd3b68d",
    "version": 3,
    "metatable": "#hash_805abbe2db900e67",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#arenastats",
                    "type": "struct#arenastats[9]",
                    "offset": 2464,
                    "bitSize": 10224
                },
                {
                    "name": "#arenaperseasonstats",
                    "type": "struct#arenastats",
                    "offset": 1328,
                    "bitSize": 1136
                },
                {
                    "name": "#arenabest",
                    "type": "struct#arenastats",
                    "offset": 0,
                    "bitSize": 1136
                },
                {
                    "name": "#hash_7d19b83705dea420",
                    "type": "string",
                    "offset": 12688,
                    "bitSize": 256
                },
                {
                    "name": "#arenachallengeseasons",
                    "type": "short[12]",
                    "offset": 1136,
                    "bitSize": 192,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#arenastats",
            "members": [
                {
                    "name": "#season",
                    "type": "short",
                    "offset": 576,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#skill",
                    "type": "fixedpoint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#variance",
                    "type": "fixedpoint",
                    "offset": 544,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#rankedplaystats",
                    "type": "struct#hash_3bdd45425562efbc",
                    "offset": 256,
                    "bitSize": 288
                },
                {
                    "name": "#leagueplaystats",
                    "type": "struct#hash_6ed89f7cef839c06",
                    "offset": 592,
                    "bitSize": 544
                },
                {
                    "name": "#hash_4986c748eb81d3c5",
                    "type": "struct#hash_23802d45f95d62c2",
                    "offset": 32,
                    "bitSize": 224
                }
            ]
        },
        {
            "name": "#hash_3bdd45425562efbc",
            "members": [
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchstartpoints",
                    "type": "uint",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 0,
                    "bitSize": 224
                }
            ]
        },
        {
            "name": "#hash_6ed89f7cef839c06",
            "members": [
                {
                    "name": "#teamid",
                    "type": "uint64",
                    "offset": 480,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_8d21fc27cb2a58b",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 448,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_40ab2c89a089b5a1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_650daed6d12d46cc",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3a2c893b724a10b0",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3be0648edda73ae2",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5dc602053653b486",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 224,
                    "bitSize": 224
                }
            ]
        },
        {
            "name": "#hash_23802d45f95d62c2",
            "members": [
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 0,
                    "bitSize": 224
                }
            ]
        },
        {
            "name": "#hash_7b048091b1488cec",
            "members": [
                {
                    "name": "#streak",
                    "type": "int",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_4b3ab6c931987e2c",
                    "type": "int",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#wins",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#losses",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_21b4d1e5aa3c24b5",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#losses_late_join",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ties",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        }
    ]
},
{
    "name": "#hash_6c6e7bcb4dd3b68d",
    "version": 2,
    "metatable": "#hash_7fad767f5bd5fce0",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#arenastats",
                    "type": "struct#arenastats[9]",
                    "offset": 2080,
                    "bitSize": 8496
                },
                {
                    "name": "#arenaperseasonstats",
                    "type": "struct#arenastats",
                    "offset": 1136,
                    "bitSize": 944
                },
                {
                    "name": "#arenabest",
                    "type": "struct#arenastats",
                    "offset": 0,
                    "bitSize": 944
                },
                {
                    "name": "#hash_7d19b83705dea420",
                    "type": "string",
                    "offset": 10576,
                    "bitSize": 256
                },
                {
                    "name": "#arenachallengeseasons",
                    "type": "short[12]",
                    "offset": 944,
                    "bitSize": 192,
                    "intSize": 16,
                    "maxIntValue": 65535
                }
            ]
        },
        {
            "name": "#arenastats",
            "members": [
                {
                    "name": "#season",
                    "type": "short",
                    "offset": 448,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#skill",
                    "type": "fixedpoint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#variance",
                    "type": "fixedpoint",
                    "offset": 416,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#rankedplaystats",
                    "type": "struct#hash_3bdd45425562efbc",
                    "offset": 192,
                    "bitSize": 224
                },
                {
                    "name": "#leagueplaystats",
                    "type": "struct#hash_6ed89f7cef839c06",
                    "offset": 464,
                    "bitSize": 480
                },
                {
                    "name": "#hash_4986c748eb81d3c5",
                    "type": "struct#hash_23802d45f95d62c2",
                    "offset": 32,
                    "bitSize": 160
                }
            ]
        },
        {
            "name": "#hash_3bdd45425562efbc",
            "members": [
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchstartpoints",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 0,
                    "bitSize": 160
                }
            ]
        },
        {
            "name": "#hash_6ed89f7cef839c06",
            "members": [
                {
                    "name": "#teamid",
                    "type": "uint64",
                    "offset": 416,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_8d21fc27cb2a58b",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 384,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_40ab2c89a089b5a1",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_650daed6d12d46cc",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3a2c893b724a10b0",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_3be0648edda73ae2",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_5dc602053653b486",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 224,
                    "bitSize": 160
                }
            ]
        },
        {
            "name": "#hash_23802d45f95d62c2",
            "members": [
                {
                    "name": "#matchesstats",
                    "type": "struct#hash_7b048091b1488cec",
                    "offset": 0,
                    "bitSize": 160
                }
            ]
        },
        {
            "name": "#hash_7b048091b1488cec",
            "members": [
                {
                    "name": "#winstreak",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#wins",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#losses",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#losses_late_join",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ties",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        }
    ]
},
{
    "name": "#hash_6c6e7bcb4dd3b68d",
    "version": 1,
    "metatable": "#hash_b960856603728695",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#arenastats",
                    "type": "struct#arenastats[9]",
                    "offset": 1056,
                    "bitSize": 4752
                },
                {
                    "name": "#arenaperseasonstats",
                    "type": "struct#arenastats",
                    "offset": 528,
                    "bitSize": 528
                },
                {
                    "name": "#arenabest",
                    "type": "struct#arenastats",
                    "offset": 0,
                    "bitSize": 528
                },
                {
                    "name": "#hash_7d19b83705dea420",
                    "type": "string",
                    "offset": 5808,
                    "bitSize": 256
                }
            ]
        },
        {
            "name": "#arenastats",
            "members": [
                {
                    "name": "#season",
                    "type": "short",
                    "offset": 224,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#matchstartpoints",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#skill",
                    "type": "fixedpoint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#variance",
                    "type": "fixedpoint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#winstreak",
                    "type": "uint",
                    "offset": 240,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#wins",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#losses",
                    "type": "uint",
                    "offset": 160,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#losses_late_join",
                    "type": "uint",
                    "offset": 272,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#ties",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#leagueplaystats",
                    "type": "struct#hash_6ed89f7cef839c06",
                    "offset": 304,
                    "bitSize": 224
                }
            ]
        },
        {
            "name": "#hash_6ed89f7cef839c06",
            "members": [
                {
                    "name": "#teamid",
                    "type": "uint64",
                    "offset": 160,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_8d21fc27cb2a58b",
                    "type": "uint64",
                    "offset": 32,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#points",
                    "type": "uint",
                    "offset": 128,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_40ab2c89a089b5a1",
                    "type": "uint",
                    "offset": 96,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#rank",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        }
    ]
}