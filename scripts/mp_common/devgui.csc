// Atian COD Tools GSC decompiler test
#include script_5de8a8ac9320a0bf;
#include scripts/core_common/system_shared.csc;

#namespace namespace_498e3f81;

// Namespace namespace_498e3f81/devgui
// Params 0, eflags: 0x2
// Checksum 0x47758c37, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_27f7f38cbbe491cf", &__init__, undefined, undefined);
}

// Namespace namespace_498e3f81/devgui
// Params 0, eflags: 0x1 linked
// Checksum 0x752a5251, Offset: 0xe0
// Size: 0x26
function __init__() {
    level.var_f9f04b00 = debug_center_screen::register("debug_center_screen_instance");
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0xd0578543, Offset: 0x110
// Size: 0x4e
function function_1be30731(localclientnum) {
    /#
        if (level.var_d62645c2 === 1) {
            /#
                adddebugcommand(localclientnum, "<unknown string>");
            #/
            level.var_d62645c2 = undefined;
        }
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0x93f91176, Offset: 0x168
// Size: 0x112
function function_f4c99e70(localclientnum) {
    /#
        level notify(#"hash_24bdc914df54929c");
        level endon(#"hash_24bdc914df54929c");
        function_1be30731(localclientnum);
        waitframe(1);
        if (0) {
            return;
        }
        var_bacf5072 = 3;
        for (slot = 0; slot < var_bacf5072; slot++) {
            function_3c6c5b46(localclientnum, slot);
            wait(0.1);
        }
        wait(0.1);
        function_345407a7(localclientnum);
        wait(0.1);
        function_9111c0ca(localclientnum);
        level thread function_cf8a9f8e();
        level.var_d62645c2 = 1;
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0x453dd64b, Offset: 0x288
// Size: 0x436
function function_345407a7(localclientnum) {
    /#
        root = "<unknown string>";
        var_ac175f54 = "<unknown string>";
        function_a3a79297(localclientnum, root, 0);
        function_a3a79297(localclientnum, root, 1);
        function_a3a79297(localclientnum, root, 5);
        function_a3a79297(localclientnum, root, 10);
        function_a3a79297(localclientnum, root, 200);
        function_a3a79297(localclientnum, root, 3420);
        root = "<unknown string>";
        var_de1f9edf = "<unknown string>";
        var_3ffc8bcd = "<unknown string>";
        var_a3620ce9 = var_de1f9edf + "<unknown string>";
        function_71c5db37(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_a3620ce9 = var_de1f9edf + "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + var_de1f9edf + "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + var_3ffc8bcd + "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + var_3ffc8bcd + "<unknown string>";
        function_71c5db37(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_a3620ce9 = var_de1f9edf + "<unknown string>";
        function_71c5db37(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_a3620ce9 = var_de1f9edf + "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + var_de1f9edf + "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + var_3ffc8bcd + "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + var_3ffc8bcd + "<unknown string>";
        function_71c5db37(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_2922313c = "<unknown string>";
        var_7251ffaf = "<unknown string>";
        var_5a9d8a1 = "<unknown string>";
        for (i = 0; i <= 6; i++) {
            var_a3620ce9 = var_7251ffaf + "<unknown string>" + i;
            var_a3620ce9 = var_a3620ce9 + var_ac175f54;
            var_a3620ce9 = var_a3620ce9 + var_7251ffaf + "<unknown string>" + i;
            var_a3620ce9 = var_a3620ce9 + var_ac175f54;
            var_a3620ce9 = var_a3620ce9 + var_5a9d8a1 + "<unknown string>" + (i == 6 ? 1 : 0);
            var_a3620ce9 = var_a3620ce9 + var_ac175f54;
            var_a3620ce9 = var_a3620ce9 + var_5a9d8a1 + "<unknown string>" + (i == 6 ? 1 : 0);
            function_71c5db37(localclientnum, var_2922313c + "<unknown string>" + i, var_a3620ce9);
        }
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 3, eflags: 0x0
// Checksum 0x3b0735a7, Offset: 0x6c8
// Size: 0xa4
function function_a3a79297(localclientnum, root, var_77d785a8) {
    /#
        var_a3620ce9 = "<unknown string>" + var_77d785a8;
        var_20b4d3de = var_77d785a8 == 1 ? "<unknown string>" : "<unknown string>";
        function_71c5db37(localclientnum, root + "<unknown string>" + var_77d785a8 + var_20b4d3de + "<unknown string>" + var_77d785a8, var_a3620ce9);
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 2, eflags: 0x0
// Checksum 0xf815aff8, Offset: 0x778
// Size: 0x5d4
function function_3c6c5b46(localclientnum, slot) {
    /#
        root = "<unknown string>" + slot;
        var_8d10dfeb = 1;
        var_d5a2cbb2 = 1;
        switch (slot) {
        case 0:
            root = root + "<unknown string>";
            var_d5a2cbb2 = 0;
            break;
        case 1:
            root = root + "<unknown string>";
            var_d5a2cbb2 = 0;
            break;
        case 2:
            root = root + "<unknown string>";
            var_8d10dfeb = 0;
            break;
        default:
            root = root + "<unknown string>";
            break;
        }
        root = root + "<unknown string>" + slot + "<unknown string>";
        table = #"hash_14ee3b02a56347de";
        var_245dd807 = tablelookuprowcount(table);
        var_de1f9edf = "<unknown string>" + slot;
        var_ac175f54 = "<unknown string>";
        var_41de7a59 = 30;
        ellipsis = "<unknown string>";
        var_6de6dd81 = var_41de7a59 - ellipsis.size - 1;
        var_1719ef8a = 0;
        var_5fd3362 = 5;
        for (row = 1; row < var_245dd807; row++) {
            var_e32e15ad = tablelookuprow(table, row);
            if (strisnumber(var_e32e15ad[0])) {
                var_d4ec1622 = int(var_e32e15ad[0]);
                var_591adfa1 = var_d4ec1622 >= 1000;
                var_c85e3b1 = !var_591adfa1;
                if (var_591adfa1 && !var_d5a2cbb2) {
                    continue;
                }
                if (var_c85e3b1 && !var_8d10dfeb) {
                    continue;
                }
                var_98d3131f = var_e32e15ad[4].size < 0 ? var_e32e15ad[4] : var_e32e15ad[3];
                title = makelocalizedstring(#"hash_7e2a9d7d57e6b234" + var_98d3131f);
                if (title.size > var_41de7a59) {
                    title = getsubstr(title, 0, var_6de6dd81) + ellipsis;
                }
                var_a1f91047 = title + "<unknown string>" + var_d4ec1622 + "<unknown string>";
                challenge_type = var_c85e3b1 ? "<unknown string>" : "<unknown string>";
                var_a3620ce9 = var_de1f9edf + "<unknown string>" + var_d4ec1622;
                var_a3620ce9 = var_a3620ce9 + var_ac175f54;
                var_a3620ce9 = var_a3620ce9 + var_de1f9edf + "<unknown string>";
                var_a3620ce9 = var_a3620ce9 + var_ac175f54;
                var_a3620ce9 = var_a3620ce9 + var_de1f9edf + "<unknown string>";
                var_a3620ce9 = var_a3620ce9 + var_ac175f54;
                var_a3620ce9 = var_a3620ce9 + var_de1f9edf + "<unknown string>";
                var_a3620ce9 = var_a3620ce9 + var_ac175f54;
                var_a3620ce9 = var_a3620ce9 + "<unknown string>";
                var_a3620ce9 = function_20cabe72(var_a3620ce9);
                if (var_d5a2cbb2 && var_8d10dfeb) {
                    var_9326ee61 = "<unknown string>";
                } else if (var_d5a2cbb2) {
                    var_9326ee61 = "<unknown string>";
                } else if (var_8d10dfeb) {
                    var_9326ee61 = "<unknown string>";
                } else {
                    var_9326ee61 = "<unknown string>";
                }
                var_2c904f04 = var_a1f91047 + "<unknown string>" + var_d4ec1622;
                function_71c5db37(localclientnum, root + challenge_type + var_a1f91047, var_a3620ce9);
                function_71c5db37(localclientnum, root + var_9326ee61 + var_2c904f04, var_a3620ce9);
                var_1719ef8a++;
                if (var_1719ef8a >= var_5fd3362) {
                    wait(0.1);
                    var_1719ef8a = 0;
                }
            }
        }
        var_a3620ce9 = var_de1f9edf + "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + var_de1f9edf + "<unknown string>";
        function_71c5db37(localclientnum, root + "<unknown string>", var_a3620ce9);
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0xb6b56ee, Offset: 0xd58
// Size: 0x29c
function function_9111c0ca(localclientnum) {
    /#
        root = "<unknown string>";
        var_53c54763 = root + "<unknown string>";
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 86400);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 1);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 3);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 10);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 60);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 120);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 600);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 1800);
        function_ecf79cab(localclientnum, var_53c54763, "<unknown string>", 3600);
        var_a3620ce9 = "<unknown string>";
        function_6bb61a5(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_a3620ce9 = "<unknown string>";
        function_6bb61a5(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_a3620ce9 = "<unknown string>";
        function_6bb61a5(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_a3620ce9 = "<unknown string>";
        function_6bb61a5(localclientnum, root + "<unknown string>", var_a3620ce9);
        var_a3620ce9 = "<unknown string>";
        function_6bb61a5(localclientnum, root + "<unknown string>", var_a3620ce9);
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 3, eflags: 0x0
// Checksum 0x33b501e0, Offset: 0x1000
// Size: 0x6c
function function_6bb61a5(localclientnum, root, var_a3620ce9) {
    /#
        var_ac175f54 = "<unknown string>";
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + "<unknown string>";
        function_71c5db37(localclientnum, root, var_a3620ce9);
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 4, eflags: 0x0
// Checksum 0xf1b6cbc7, Offset: 0x1078
// Size: 0xb4
function function_ecf79cab(localclientnum, root, label, var_d9d182ac) {
    /#
        var_ac175f54 = "<unknown string>";
        var_a3620ce9 = "<unknown string>" + var_d9d182ac;
        var_a3620ce9 = var_a3620ce9 + var_ac175f54;
        var_a3620ce9 = var_a3620ce9 + "<unknown string>";
        var_a3620ce9 = function_20cabe72(var_a3620ce9);
        function_71c5db37(localclientnum, root + label, var_a3620ce9);
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0x6199e95c, Offset: 0x1138
// Size: 0x58
function function_20cabe72(var_a3620ce9) {
    /#
        var_ac175f54 = "<unknown string>";
        var_e9f423b9 = "<unknown string>";
        var_e9f423b9 = var_e9f423b9 + var_ac175f54;
        var_e9f423b9 = var_e9f423b9 + var_a3620ce9;
        return var_e9f423b9;
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 3, eflags: 0x0
// Checksum 0x9177e5f7, Offset: 0x1198
// Size: 0x64
function function_71c5db37(localclientnum, menu_path, var_a3620ce9) {
    /#
        /#
            adddebugcommand(localclientnum, "<unknown string>" + menu_path + "<unknown string>" + var_a3620ce9 + "<unknown string>");
        #/
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0x8d713fb7, Offset: 0x1208
// Size: 0xe0
function function_2dddc683(var_33c150e) {
    /#
        var_aacd813f = var_33c150e;
        var_d9d182ac = getdvarint(#"contracts_daily_duration", 60);
        var_8554c47 = var_d9d182ac * 7;
        var_41717bce = var_8554c47 * 8;
        var_b1c44fef = int(var_33c150e / var_41717bce);
        var_ba2d6f00 = int(var_b1c44fef / 2);
        var_aacd813f = var_aacd813f - var_ba2d6f00 * var_41717bce;
        return var_aacd813f;
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 0, eflags: 0x0
// Checksum 0x3e131207, Offset: 0x12f0
// Size: 0x2c0
function function_cf8a9f8e() {
    /#
        level notify(#"hash_7dcba694d65e991f");
        level endon(#"hash_7dcba694d65e991f");
        while (1) {
            wait(0.1);
            if (!function_aa3fb1a("<unknown string>")) {
                continue;
            }
            var_92f946a9 = getdvarint(#"dvarconfigenabled", 1);
            if (function_aa3fb1a("<unknown string>")) {
                setdvar(#"dvarconfigenabled", 0);
                now = getutc();
                setdvar(#"contracts_start_time", function_2dddc683(now));
                clear_dvar("<unknown string>");
            }
            if (function_aa3fb1a("<unknown string>")) {
                function_5da9419(-1);
                clear_dvar("<unknown string>");
            }
            if (function_aa3fb1a("<unknown string>")) {
                function_5da9419(-7);
                clear_dvar("<unknown string>");
            }
            if (function_aa3fb1a("<unknown string>")) {
                function_5da9419(1);
                clear_dvar("<unknown string>");
            }
            if (function_aa3fb1a("<unknown string>")) {
                function_5da9419(7);
                clear_dvar("<unknown string>");
            }
            if (var_92f946a9 != getdvarint(#"dvarconfigenabled", 1)) {
                setdvar(#"dvarconfigenabled", var_92f946a9);
            }
            clear_dvar("<unknown string>");
        }
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0x6ae82046, Offset: 0x15b8
// Size: 0xac
function function_5da9419(var_29e7d23f) {
    /#
        setdvar(#"dvarconfigenabled", 0);
        start_time = function_8cb77625();
        var_d9d182ac = getdvarint(#"contracts_daily_duration", 60);
        setdvar(#"contracts_start_time", start_time + var_d9d182ac * var_29e7d23f);
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0x2e6edea0, Offset: 0x1670
// Size: 0x30
function function_aa3fb1a(var_f4f31e8a) {
    /#
        return getdvarint(var_f4f31e8a, 0) != 0;
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 1, eflags: 0x0
// Checksum 0x6f9372be, Offset: 0x16a8
// Size: 0x2c
function clear_dvar(var_f4f31e8a) {
    /#
        setdvar(var_f4f31e8a, 0);
    #/
}

// Namespace namespace_498e3f81/devgui
// Params 0, eflags: 0x0
// Checksum 0xdb6474dd, Offset: 0x16e0
// Size: 0x34
function function_8cb77625() {
    /#
        return getdvarint(#"contracts_start_time", 1463418000);
    #/
}

