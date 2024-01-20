{
    "name": "#hash_38be5c7abb4bcadc",
    "version": 1,
    "metatable": "#hash_e0b5029a05bbcc9a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#timepassed",
                    "type": "uint",
                    "offset": 400,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#roundsplayed",
                    "type": "uint",
                    "offset": 432,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 63
                },
                {
                    "name": "#hash_20f6a5a2a3e21a16",
                    "type": "uint",
                    "offset": 28600,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                },
                {
                    "name": "#team",
                    "type": "struct#hash_37625087a54761f4[10]",
                    "offset": 0,
                    "bitSize": 400
                },
                {
                    "name": "#player",
                    "type": "struct#hash_74a00c3ceb60a0c8[32]",
                    "offset": 440,
                    "bitSize": 28160
                }
            ]
        },
        {
            "name": "#hash_37625087a54761f4",
            "members": [
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#roundswon",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 8,
                    "intSize": 5,
                    "maxIntValue": 31
                }
            ]
        },
        {
            "name": "#hash_74a00c3ceb60a0c8",
            "members": [
                {
                    "name": "#name",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 320
                },
                {
                    "name": "#hash_763e00a108f8960a",
                    "type": "string",
                    "offset": 416,
                    "bitSize": 320
                },
                {
                    "name": "#score",
                    "type": "uint",
                    "offset": 336,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#momentum",
                    "type": "uint",
                    "offset": 848,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#kills",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#deaths",
                    "type": "uint",
                    "offset": 784,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#assists",
                    "type": "uint",
                    "offset": 816,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#defends",
                    "type": "uint",
                    "offset": 736,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#plants",
                    "type": "uint",
                    "offset": 800,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#defuses",
                    "type": "uint",
                    "offset": 752,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#returns",
                    "type": "uint",
                    "offset": 384,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#captures",
                    "type": "uint",
                    "offset": 864,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#killsconfirmed",
                    "type": "uint",
                    "offset": 832,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#killsdenied",
                    "type": "uint",
                    "offset": 368,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#cur_kill_streak",
                    "type": "uint",
                    "offset": 400,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                },
                {
                    "name": "#cur_total_kill_streak",
                    "type": "uint",
                    "offset": 768,
                    "bitSize": 16,
                    "intSize": 10,
                    "maxIntValue": 1023
                }
            ]
        }
    ]
}