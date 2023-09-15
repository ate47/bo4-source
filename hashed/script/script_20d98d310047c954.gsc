// Atian COD Tools GSC decompiler test
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_15b5b8d8;

// Namespace namespace_15b5b8d8/namespace_15b5b8d8
// Params 0, eflags: 0x2
// Checksum 0xb283954f, Offset: 0xe8
// Size: 0x34
function autoexec __init__system__() {
    system::register(#"hash_7b0e7e7796beb14c", undefined, &__main__, undefined);
}

// Namespace namespace_15b5b8d8/namespace_15b5b8d8
// Params 0, eflags: 0x1 linked
// Checksum 0x3c679f8f, Offset: 0x128
// Size: 0x3c
function __main__() {
    callback::on_gameplay_started(&on_gameplay_started);
    util::waitforclient(0);
}

// Namespace namespace_15b5b8d8/namespace_15b5b8d8
// Params 1, eflags: 0x1 linked
// Checksum 0x8a08a649, Offset: 0x170
// Size: 0x24
function on_gameplay_started(localclientnum) {
    level thread nuked_population_sign_think(localclientnum);
}

// Namespace namespace_15b5b8d8/namespace_15b5b8d8
// Params 1, eflags: 0x1 linked
// Checksum 0xcc799a55, Offset: 0x1a0
// Size: 0x498
function nuked_population_sign_think(localclientnum) {
    var_80ac8621 = getent(localclientnum, "counter_tens", "targetname");
    var_3c0c17f2 = getent(localclientnum, "counter_ones", "targetname");
    zone = getent(localclientnum, "nuketown_island_zone", "targetname");
    time = set_dvar_float_if_unset("scr_dial_rotate_time", "0.5");
    /#
        level thread function_102a701c(var_80ac8621, var_3c0c17f2);
    #/
    step = 36;
    ones = 0;
    tens = 0;
    var_80ac8621 rotateroll(step, 0.05);
    var_3c0c17f2 rotateroll(step, 0.05);
    for (;;) {
        wait(1);
        var_c510abcc = 0;
        players = getlocalplayers();
        foreach (localplayer in players) {
            if (!isdefined(localplayer)) {
                continue;
            }
            if (istouching(localplayer.origin, zone) && !localplayer isplayerswimming()) {
                var_c510abcc = 1;
                break;
            }
        }
        if (!var_c510abcc) {
            continue;
        }
        players = [];
        foreach (player in getplayers(localclientnum)) {
            if (istouching(player.origin, zone) && !player isplayerswimming()) {
                if (!isdefined(players)) {
                    players = [];
                } else if (!isarray(players)) {
                    players = array(players);
                }
                players[players.size] = player;
            }
        }
        dial = ones + tens * 10;
        while (players.size < dial) {
            ones--;
            if (ones < 0) {
                ones = 9;
                var_80ac8621 rotateroll(0 - step, time);
                tens--;
            }
            var_3c0c17f2 rotateroll(0 - step, time);
            var_3c0c17f2 waittill(#"rotatedone");
            dial = ones + tens * 10;
        }
        while (players.size > dial) {
            ones++;
            if (ones > 9) {
                ones = 0;
                var_80ac8621 rotateroll(step, time);
                tens++;
            }
            var_3c0c17f2 rotateroll(step, time);
            var_3c0c17f2 waittill(#"rotatedone");
            dial = ones + tens * 10;
        }
    }
}

// Namespace namespace_15b5b8d8/namespace_15b5b8d8
// Params 2, eflags: 0x1 linked
// Checksum 0x3bf303d6, Offset: 0x640
// Size: 0x6a
function set_dvar_float_if_unset(dvar, value) {
    if (getdvarstring(dvar) == "") {
        setdvar(dvar, value);
    }
    return getdvarfloat(dvar, 0);
}

// Namespace namespace_15b5b8d8/namespace_15b5b8d8
// Params 2, eflags: 0x0
// Checksum 0xa1361610, Offset: 0x6b8
// Size: 0x4e
function function_102a701c(tens, ones) {
    /#
        while (!isdefined(tens) || !isdefined(ones)) {
            iprintlnbold("<unknown string>");
            wait(2);
        }
    #/
}

