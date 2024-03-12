// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_office_floors.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_maptable.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_ff847c6a;

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0x46305ec6, Offset: 0x98
// Size: 0x314
function init() {
    if (!isdefined(level.var_a7b0c29c)) {
        level.var_a7b0c29c = [];
    } else if (!isarray(level.var_a7b0c29c)) {
        level.var_a7b0c29c = array(level.var_a7b0c29c);
    }
    level.var_a7b0c29c[0] = {#n_target:2, #n_index:1, #end_func:&function_55f180c2, #start_func:&function_6882655b};
    level.var_a7b0c29c[1] = {#n_target:4, #n_index:2, #end_func:&function_55f180c2, #start_func:&function_6882655b};
    level.var_a7b0c29c[2] = {#n_target:6, #n_index:3, #end_func:&function_55f180c2, #start_func:&function_6882655b};
    level.var_a7b0c29c[3] = {#n_target:8, #n_index:4, #end_func:&function_55f180c2, #start_func:&function_6882655b};
    level.var_a7b0c29c[4] = {#n_target:10, #n_index:5, #end_func:&function_55f180c2, #start_func:&function_6882655b};
    level.var_f0efd877 = 0;
    function_1525b94c();
    function_a5cebb9a(0);
    level thread function_1b350677();
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0xcbbf6ce4, Offset: 0x3b8
// Size: 0x34
function function_1525b94c() {
    start_challenge(array::pop_front(level.var_a7b0c29c));
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0xd5d8784b, Offset: 0x3f8
// Size: 0x64
function challenge_completed() {
    /#
        iprintlnbold("<unknown string>");
    #/
    wait(3);
    if (level.var_a7b0c29c.size == 0) {
        function_8bddfcc3();
        return;
    }
    function_1525b94c();
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 1, eflags: 0x0
// Checksum 0x16783153, Offset: 0x468
// Size: 0x34
function function_bc0ec5b3(b_activate) {
    level.var_f0efd877 = b_activate;
    function_a5cebb9a(level.var_f0efd877);
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 1, eflags: 0x0
// Checksum 0xb81ba13d, Offset: 0x4a8
// Size: 0x6c
function function_a5cebb9a(b_show) {
    if (b_show) {
        function_260958b(#"hash_7ed874a0ecdefd90", level.var_b92b8b07.n_index);
        return;
    }
    function_260958b(#"hash_7ed874a0ecdefd90", 0);
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0x7b147eec, Offset: 0x520
// Size: 0x6c
function function_92df87d7() {
    level.var_31e395e4++;
    function_260958b(#"hash_518608853a37856e", level.var_31e395e4);
    if (level.var_31e395e4 >= level.var_b92b8b07.n_target) {
        function_5c99b476();
    }
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0xadb52bd, Offset: 0x598
// Size: 0x3c
function function_f76df1da() {
    level.var_31e395e4 = 0;
    function_260958b(#"hash_518608853a37856e", level.var_31e395e4);
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0x50b5c28b, Offset: 0x5e0
// Size: 0x4c
function function_8bddfcc3() {
    /#
        iprintlnbold("<unknown string>");
    #/
    level notify(#"hash_4d3a2c46c22b012e");
    function_bc0ec5b3(0);
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0x311a72a4, Offset: 0x638
// Size: 0xa8
function function_1b350677() {
    level endon(#"hash_4d3a2c46c22b012e");
    while (1) {
        if (!level.var_f0efd877 && function_c32f5235()) {
            function_bc0ec5b3(1);
        } else if (level.var_f0efd877 && !function_c32f5235()) {
            function_bc0ec5b3(0);
        }
        wait(0.1);
    }
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0xab7562e2, Offset: 0x6e8
// Size: 0x9a
function function_c32f5235() {
    foreach (e_player in level.activeplayers) {
        if (!e_player istouching(level.var_b4fcac11[3])) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 2, eflags: 0x0
// Checksum 0xfe144d11, Offset: 0x790
// Size: 0x98
function function_260958b(fieldname, value) {
    foreach (e_player in level.activeplayers) {
        level zm_ui_inventory::function_7df6bb60(fieldname, value, e_player);
    }
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 1, eflags: 0x0
// Checksum 0xbb743c9a, Offset: 0x830
// Size: 0x5c
function start_challenge(s_challenge) {
    level.var_b92b8b07 = s_challenge;
    function_f76df1da();
    function_a5cebb9a(1);
    [[ level.var_b92b8b07.start_func ]]();
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0x338a3dd8, Offset: 0x898
// Size: 0x34
function function_5c99b476() {
    function_a5cebb9a(0);
    [[ level.var_b92b8b07.end_func ]]();
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0x437851eb, Offset: 0x8d8
// Size: 0x44
function function_6882655b() {
    callback::on_ai_killed(&function_5e7d8d96);
    callback::on_player_damage(&function_b8b3c1e5);
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 1, eflags: 0x0
// Checksum 0x5fc74b80, Offset: 0x928
// Size: 0x4c
function function_5e7d8d96(s_params) {
    if (!level.var_f0efd877 || !isplayer(s_params.eattacker)) {
        return;
    }
    function_92df87d7();
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 1, eflags: 0x0
// Checksum 0xebaaf4c3, Offset: 0x980
// Size: 0x1c
function function_b8b3c1e5(s_params) {
    function_f76df1da();
}

// Namespace namespace_ff847c6a/namespace_ff847c6a
// Params 0, eflags: 0x0
// Checksum 0xfebc986e, Offset: 0x9a8
// Size: 0x54
function function_55f180c2() {
    callback::remove_on_ai_killed(&function_5e7d8d96);
    callback::remove_on_player_damage(&function_b8b3c1e5);
    challenge_completed();
}

