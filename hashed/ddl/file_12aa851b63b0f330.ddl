{
    "name": "#hash_12aa851b63b0f330",
    "version": 2,
    "metatable": "#hash_ea22a4ef571b6e07",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_60bfa70a97ce6004",
                    "type": "uint",
                    "offset": 25617,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_710508e409e21d7a",
                    "type": "uint",
                    "offset": 25616,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#count",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 200
                },
                {
                    "name": "#hash_368023d90f637c55",
                    "type": "struct#player[200]",
                    "offset": 8,
                    "bitSize": 12800
                },
                {
                    "name": "#hash_b941cba3c015f7b",
                    "type": "uint",
                    "offset": 12808,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 200
                },
                {
                    "name": "#hash_143b64839d071be4",
                    "type": "struct#player[200]",
                    "offset": 12816,
                    "bitSize": 12800
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 25618,
                    "bitSize": 6,
                    "intSize": 6
                }
            ]
        },
        {
            "name": "#player",
            "members": [
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        }
    ]
},
{
    "name": "#hash_12aa851b63b0f330",
    "version": 1,
    "metatable": "#hash_f2ed4030b20e7b2b",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#count",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 200
                },
                {
                    "name": "#hash_368023d90f637c55",
                    "type": "struct#player[200]",
                    "offset": 8,
                    "bitSize": 12800
                }
            ]
        },
        {
            "name": "#player",
            "members": [
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        }
    ]
}