{
    "name": "#hash_fe1e6cc641e3a77",
    "version": 2,
    "metatable": "#hash_92b36299dba899c7",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#messages",
                    "type": "struct#message[64]",
                    "offset": 0,
                    "bitSize": 4096
                }
            ]
        },
        {
            "name": "#message",
            "members": [
                {
                    "name": "#version",
                    "type": "int",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#state",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                }
            ]
        }
    ]
}