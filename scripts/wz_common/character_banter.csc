#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace character_banter;

// Namespace character_banter/event_10eed35b
// Params 1, eflags: 0x40
// Checksum 0xdd4753e0, Offset: 0x88
// Size: 0x1ac
function event_handler[event_10eed35b] function_d8f1209f(eventstruct) {
    if (eventstruct.eventid != 1) {
        return;
    }
    if (isdefined(level.var_1536cd6d) && level.var_1536cd6d) {
        return;
    }
    level.var_1536cd6d = 1;
    player1 = eventstruct.var_40209f44;
    player2 = eventstruct.var_3d136cd9;
    if (!isdefined(player1) || !isdefined(player2)) {
        return;
    }
    if (!player1 function_ca024039() || !player2 function_ca024039()) {
        return;
    }
    banters = function_86492662(player1, player2);
    if (banters.size <= 0) {
        return;
    }
    index = eventstruct.var_7e98b410 % banters.size;
    banter = banters[index];
    var_bfc07183 = player1 function_7b99157b();
    var_d6c29f87 = player2 function_7b99157b();
    level thread play_banter(var_bfc07183, var_d6c29f87, banter[2], banter[3]);
}

// Namespace character_banter/character_banter
// Params 2, eflags: 0x0
// Checksum 0x4cabdff7, Offset: 0x240
// Size: 0x12e
function function_86492662(player1, player2) {
    banters = [];
    player1name = player1 getmpdialogname();
    player2name = player2 getmpdialogname();
    if (isdefined(player1name) && isdefined(player2name)) {
        rowcount = tablelookuprowcount(#"hash_5ec1825aeab754a2");
        for (i = 0; i < rowcount; i++) {
            row = tablelookuprow(#"hash_5ec1825aeab754a2", i);
            if (row[0] == player1name && row[1] == player2name) {
                banters[banters.size] = row;
            }
        }
    }
    return banters;
}

// Namespace character_banter/character_banter
// Params 4, eflags: 0x0
// Checksum 0x5600264b, Offset: 0x378
// Size: 0xc4
function play_banter(player1, player2, alias1, alias2) {
    player1 endon(#"death");
    player2 endon(#"death");
    handle1 = player1 playsound(-1, alias1);
    if (handle1 >= 0) {
        while (soundplaying(handle1)) {
            waitframe(1);
        }
    }
    wait 0.2;
    player2 playsound(-1, alias2);
}

// Namespace character_banter/character_banter
// Params 0, eflags: 0x0
// Checksum 0xc6d9d101, Offset: 0x448
// Size: 0xaa
function function_7b99157b() {
    if (isdefined(self getlocalclientnumber())) {
        foreach (player in getlocalplayers()) {
            if (player issplitscreenhost()) {
                return player;
            }
        }
    }
    return self;
}

