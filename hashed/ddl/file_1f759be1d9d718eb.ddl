{
    "name": "#hash_1f759be1d9d718eb",
    "version": 2,
    "metatable": "#hash_3e4c5cd1c233a103",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#issorted",
                    "type": "uint",
                    "offset": 4808,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#count",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 6,
                    "maxIntValue": 50
                },
                {
                    "name": "#hash_224419b9dcb9832d",
                    "type": "struct#recentplayer[50]",
                    "offset": 8,
                    "bitSize": 4800
                },
                {
                    "name": "#__pad",
                    "type": "pad",
                    "offset": 4809,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#recentplayer",
            "members": [
                {
                    "name": "#time",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 32,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        }
    ]
}