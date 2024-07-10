#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace contracts;

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x2
// Checksum 0xa7dcfe01, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"contracts", &__init__, undefined, undefined);
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xb6afb595, Offset: 0x160
// Size: 0x54
function __init__() {
    if (!isdefined(level.challengescallbacks)) {
        level.challengescallbacks = [];
    }
    init_player_contract_events();
    callback::on_finalize_initialization(&finalize_init);
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x72fb636b, Offset: 0x1c0
// Size: 0xea
function finalize_init() {
    if (can_process_contracts()) {
        callback::on_connect(&on_player_connect);
        callback::function_74872db6(&function_74872db6);
        callback::on_round_end(&on_round_end);
        zm_player::function_a827358a(&function_8968a076);
        level.var_79a93566 = &function_902ef0de;
        level.var_c3e2bb05 = 3;
        /#
            level thread devgui_setup();
            level.var_b4ef4d73 = 1;
        #/
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x6ba71deb, Offset: 0x2b8
// Size: 0x1a4
function on_player_connect() {
    self setup_player_contracts(3, &registerpower_grid_displaycontrolrobotmelee);
    self.shlocalh = 0;
    self.var_45ce0c21 = 0;
    if (self is_contract_active(#"contract_zm_no_pap") || isdefined(level.var_b4ef4d73) && level.var_b4ef4d73) {
        self thread function_677a89c8();
    }
    if (self is_contract_active(#"contract_zm_perks") || isdefined(level.var_b4ef4d73) && level.var_b4ef4d73) {
        self thread function_30dc9a23();
    }
    if (self is_contract_active(#"contract_zm_same_shield") || isdefined(level.var_b4ef4d73) && level.var_b4ef4d73) {
        self thread function_9d5cd9ee();
    }
    if (self is_contract_active(#"contract_zm_same_location") || isdefined(level.var_b4ef4d73) && level.var_b4ef4d73) {
        self thread function_51db541e();
    }
}

// Namespace contracts/zm_contracts
// Params 10, eflags: 0x1 linked
// Checksum 0xdd77ed0e, Offset: 0x468
// Size: 0x6a
function function_8968a076(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) {
    if (idamage > 0) {
        self.shlocalh = 0;
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xaf8d9f68, Offset: 0x4e0
// Size: 0x1bc
function function_74872db6() {
    if (level.round_number == 20) {
        foreach (e_player in getplayers()) {
            if (!(isdefined(e_player.var_bd1368a8) && e_player.var_bd1368a8)) {
                e_player increment_zm_contract(#"contract_zm_no_pap", 1, #"zstandard");
            }
        }
        level notify(#"hash_786860db94bcc0f3");
    }
    if (level.round_number == 30) {
        foreach (e_player in getplayers()) {
            e_player increment_zm_contract(#"contract_zm_rounds", 1, #"zstandard");
        }
        callback::function_50fdac80(&function_74872db6);
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x3bbc052b, Offset: 0x6a8
// Size: 0x2b8
function on_round_end() {
    switch (level.script) {
    case #"zm_zodt8":
        var_c5440c34 = #"contract_zm_zodt8_rounds";
        break;
    case #"zm_towers":
        var_c5440c34 = #"contract_zm_towers_rounds";
        break;
    case #"zm_escape":
        var_c5440c34 = #"contract_zm_escape_rounds";
        break;
    case #"zm_office":
        var_c5440c34 = #"contract_zm_office_rounds";
        break;
    case #"zm_mansion":
        var_c5440c34 = #"contract_zm_mansion_rounds";
        break;
    case #"zm_red":
        var_c5440c34 = #"contract_zm_red_rounds";
        break;
    case #"zm_white":
        var_c5440c34 = #"contract_zm_white_rounds";
        break;
    case #"zm_orange":
        var_c5440c34 = #"contract_zm_orange_rounds";
        break;
    }
    switch (level.var_837aa533) {
    case #"zclassic":
        var_fc80b645 = #"contract_zm_classic_rounds";
        break;
    case #"ztrials":
        var_fc80b645 = #"contract_zm_gauntlet_rounds";
        if (level flag::get("round_reset")) {
            return;
        }
        break;
    }
    foreach (e_player in getplayers()) {
        if (isdefined(var_c5440c34)) {
            e_player increment_zm_contract(var_c5440c34, 1, #"zstandard");
        }
        if (isdefined(var_fc80b645)) {
            e_player increment_zm_contract(var_fc80b645, 1);
        }
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xa8397c28, Offset: 0x968
// Size: 0xe8
function can_process_contracts() {
    if (getdvarint(#"contracts_enabled", 0) == 0) {
        return false;
    }
    if (getdvarint(#"contracts_enabled_zm", 1) == 0) {
        return false;
    }
    /#
        if (getdvarint(#"scr_debug_challenges", 0)) {
            return true;
        }
    #/
    if (!level.onlinegame || isdefined(level.var_aa2d5655) && level.var_aa2d5655) {
        return false;
    }
    if (util::get_game_type() == "ztutorial") {
        return false;
    }
    return true;
}

// Namespace contracts/zm_contracts
// Params 3, eflags: 0x1 linked
// Checksum 0x6671410c, Offset: 0xa58
// Size: 0x13c
function increment_zm_contract(var_38280f2f, delta = 1, var_86024473) {
    if (!can_process_contracts() || !self is_contract_active(var_38280f2f)) {
        return;
    }
    if (isdefined(var_86024473)) {
        if (!isdefined(var_86024473)) {
            var_86024473 = [];
        } else if (!isarray(var_86024473)) {
            var_86024473 = array(var_86024473);
        }
        foreach (var_86603201 in var_86024473) {
            if (var_86603201 == util::get_game_type()) {
                return;
            }
        }
    }
    self function_902ef0de(var_38280f2f, delta);
}

// Namespace contracts/zm_contracts
// Params 2, eflags: 0x5 linked
// Checksum 0xe7c7ec4d, Offset: 0xba0
// Size: 0x364
function private function_902ef0de(var_38280f2f, delta) {
    /#
        if (getdvarint(#"scr_contract_debug_multiplier", 0) > 0) {
            delta *= getdvarint(#"scr_contract_debug_multiplier", 1);
        }
    #/
    if (delta <= 0) {
        return;
    }
    target_value = self.pers[#"contracts"][var_38280f2f].target_value;
    old_progress = isdefined(self.pers[#"contracts"][var_38280f2f].current_value) ? self.pers[#"contracts"][var_38280f2f].current_value : self.pers[#"contracts"][var_38280f2f].var_59cb904f;
    if (old_progress == target_value) {
        return;
    }
    new_progress = int(old_progress + delta);
    if (new_progress > target_value) {
        new_progress = target_value;
    }
    if (new_progress != old_progress) {
        self.pers[#"contracts"][var_38280f2f].current_value = new_progress;
        if (isdefined(level.contract_ids[var_38280f2f])) {
            self luinotifyevent(#"hash_4b04b1cb4b3498d0", 2, level.contract_ids[var_38280f2f], new_progress);
        }
    }
    if (old_progress < target_value && target_value <= new_progress) {
        self.pers[#"contracts"][var_38280f2f].var_be5bf249 = self.pers[#"time_played_total"];
        if (isdefined(level.contract_ids[var_38280f2f])) {
            zm_stats::function_ea5b4947(0);
            self luinotifyevent(#"hash_1739c4bd5baf83bc", 1, level.contract_ids[var_38280f2f]);
        }
    }
    /#
        if (getdvarint(#"scr_contract_debug", 0) > 0) {
            iprintln(function_9e72a96(var_38280f2f) + "<dev string:x38>" + new_progress + "<dev string:x46>" + target_value);
            if (old_progress < target_value && target_value <= new_progress) {
                iprintln(function_9e72a96(var_38280f2f) + "<dev string:x4a>");
            }
        }
    #/
}

// Namespace contracts/zm_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x5f8f3a3f, Offset: 0xf10
// Size: 0x22
function registerpower_grid_displaycontrolrobotmelee(slot) {
    return function_d17bcd3c(slot);
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xcd4ed3d4, Offset: 0xf40
// Size: 0x2c
function function_4a56b14d() {
    if (!can_process_contracts()) {
        return;
    }
    function_d3fba20e();
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x9fbb6143, Offset: 0xf78
// Size: 0x84
function function_dff4c02f() {
    if (!can_process_contracts() || !self is_contract_active(#"hash_38b41a1f3105c462")) {
        return;
    }
    self.shlocalh++;
    if (self.shlocalh == 100) {
        self increment_zm_contract(#"hash_38b41a1f3105c462");
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x6f865aa7, Offset: 0x1008
// Size: 0x94
function function_ac03f21e() {
    if (!can_process_contracts() || !self is_contract_active(#"contract_zm_single_special")) {
        return;
    }
    if (self.var_72d6f15d !== 2) {
        return;
    }
    self.var_45ce0c21++;
    if (self.var_45ce0c21 == 25) {
        self increment_zm_contract(#"contract_zm_single_special");
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xe2831274, Offset: 0x10a8
// Size: 0x98
function function_677a89c8() {
    level endon(#"hash_786860db94bcc0f3");
    self endon(#"disconnect");
    while (true) {
        s_notify = self waittill(#"weapon_change");
        w_current = s_notify.weapon;
        if (zm_weapons::is_weapon_upgraded(w_current)) {
            self.var_bd1368a8 = 1;
            return;
        }
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0x77506d51, Offset: 0x1148
// Size: 0xfa
function function_30dc9a23() {
    self endoncallback(&function_1729afac, #"disconnect", #"perk_vapor_lost");
    var_c16ab86f = 0;
    while (true) {
        level waittill(#"start_of_round");
        if (!self zm_perks::function_9a0e9d65()) {
            var_c16ab86f = 0;
            continue;
        }
        level waittill(#"end_of_round");
        if (self zm_perks::function_9a0e9d65()) {
            var_c16ab86f++;
        } else {
            var_c16ab86f = 0;
        }
        if (var_c16ab86f >= 5) {
            self increment_zm_contract(#"contract_zm_perks");
            return;
        }
    }
}

// Namespace contracts/zm_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x5d749496, Offset: 0x1250
// Size: 0x44
function function_1729afac(var_c34665fc) {
    self endon(#"disconnect");
    if (var_c34665fc == "perk_vapor_lost") {
        waittillframeend();
        self thread function_30dc9a23();
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xed245fc9, Offset: 0x12a0
// Size: 0xfa
function function_9d5cd9ee() {
    self endoncallback(&function_1395d508, #"disconnect", #"destroy_riotshield");
    var_c16ab86f = 0;
    while (true) {
        level waittill(#"start_of_round");
        if (!(isdefined(self.hasriotshield) && self.hasriotshield)) {
            var_c16ab86f = 0;
            continue;
        }
        level waittill(#"end_of_round");
        if (isdefined(self.hasriotshield) && self.hasriotshield) {
            var_c16ab86f++;
        } else {
            var_c16ab86f = 0;
        }
        if (var_c16ab86f >= 10) {
            self increment_zm_contract(#"contract_zm_same_shield");
            return;
        }
    }
}

// Namespace contracts/zm_contracts
// Params 1, eflags: 0x1 linked
// Checksum 0x6ef98560, Offset: 0x13a8
// Size: 0x44
function function_1395d508(var_c34665fc) {
    self endon(#"disconnect");
    if (var_c34665fc == "destroy_riotshield") {
        waittillframeend();
        self thread function_9d5cd9ee();
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xe141bd4f, Offset: 0x13f8
// Size: 0xdc
function function_51db541e() {
    self endon(#"disconnect");
    var_c16ab86f = 0;
    while (true) {
        level waittill(#"start_of_round");
        if (!isdefined(self.var_5417136)) {
            continue;
        }
        if (!isdefined(self.var_42a6fc40)) {
            self.var_42a6fc40 = self.var_5417136;
            var_c16ab86f = 0;
            self thread function_1d4fae71();
        } else {
            var_c16ab86f++;
        }
        if (var_c16ab86f >= 10) {
            self increment_zm_contract(#"contract_zm_same_location");
            self notify(#"hash_4bf9f2755fe74a0d");
            return;
        }
    }
}

// Namespace contracts/zm_contracts
// Params 0, eflags: 0x1 linked
// Checksum 0xdd635842, Offset: 0x14e0
// Size: 0x72
function function_1d4fae71() {
    self endon(#"disconnect", #"hash_4bf9f2755fe74a0d");
    while (true) {
        if (!isalive(self) || self.var_42a6fc40 != self.var_5417136) {
            self.var_42a6fc40 = undefined;
            return;
        }
        waitframe(1);
    }
}

/#

    // Namespace contracts/zm_contracts
    // Params 0, eflags: 0x0
    // Checksum 0x17e0f488, Offset: 0x1560
    // Size: 0x54
    function devgui_setup() {
        devgui_base = "<dev string:x6b>";
        wait(3);
        function_e07e542b(devgui_base, undefined);
        function_295a8005(devgui_base);
    }

    // Namespace contracts/zm_contracts
    // Params 1, eflags: 0x0
    // Checksum 0x28a8911e, Offset: 0x15c0
    // Size: 0x96c
    function function_295a8005(var_1d89ece6) {
        var_bbd68476 = var_1d89ece6 + "<dev string:x7b>";
        var_c8d599b5 = "<dev string:x83>";
        var_86418430 = var_bbd68476 + "<dev string:xbf>";
        util::function_3f749abc(var_86418430 + "<dev string:xc8>", var_c8d599b5 + "<dev string:xd7>");
        util::function_3f749abc(var_86418430 + "<dev string:xf2>", var_c8d599b5 + "<dev string:x104>");
        util::function_3f749abc(var_86418430 + "<dev string:x11e>", var_c8d599b5 + "<dev string:x130>");
        util::function_3f749abc(var_86418430 + "<dev string:x14e>", var_c8d599b5 + "<dev string:x15f>");
        util::function_3f749abc(var_86418430 + "<dev string:x177>", var_c8d599b5 + "<dev string:x17f>");
        util::function_3f749abc(var_86418430 + "<dev string:x193>", var_c8d599b5 + "<dev string:x19e>");
        util::function_3f749abc(var_86418430 + "<dev string:x1b5>", var_c8d599b5 + "<dev string:x1c1>");
        util::function_3f749abc(var_86418430 + "<dev string:x1d9>", var_c8d599b5 + "<dev string:x1e8>");
        util::function_3f749abc(var_86418430 + "<dev string:x203>", var_c8d599b5 + "<dev string:x213>");
        util::function_3f749abc(var_86418430 + "<dev string:x22f>", var_c8d599b5 + "<dev string:x23b>");
        util::function_3f749abc(var_86418430 + "<dev string:x253>", var_c8d599b5 + "<dev string:x262>");
        util::function_3f749abc(var_86418430 + "<dev string:x27d>", var_c8d599b5 + "<dev string:x288>");
        util::function_3f749abc(var_86418430 + "<dev string:x29f>", var_c8d599b5 + "<dev string:x2ad>");
        util::function_3f749abc(var_86418430 + "<dev string:x2c7>", var_c8d599b5 + "<dev string:x2dc>");
        util::function_3f749abc(var_86418430 + "<dev string:x2f7>", var_c8d599b5 + "<dev string:x30e>");
        util::function_3f749abc(var_86418430 + "<dev string:x32a>", var_c8d599b5 + "<dev string:x338>");
        util::function_3f749abc(var_86418430 + "<dev string:x352>", var_c8d599b5 + "<dev string:x363>");
        util::function_3f749abc(var_86418430 + "<dev string:x380>", var_c8d599b5 + "<dev string:x396>");
        util::function_3f749abc(var_86418430 + "<dev string:x3b8>", var_c8d599b5 + "<dev string:x3c5>");
        util::function_3f749abc(var_86418430 + "<dev string:x3de>", var_c8d599b5 + "<dev string:x3ef>");
        util::function_3f749abc(var_86418430 + "<dev string:x40c>", var_c8d599b5 + "<dev string:x41b>");
        util::function_3f749abc(var_86418430 + "<dev string:x436>", var_c8d599b5 + "<dev string:x447>");
        var_86418430 = var_bbd68476 + "<dev string:x464>";
        util::function_3f749abc(var_86418430 + "<dev string:x476>", var_c8d599b5 + "<dev string:x490>");
        util::function_3f749abc(var_86418430 + "<dev string:x4b0>", var_c8d599b5 + "<dev string:x4dc>");
        var_86418430 = var_bbd68476 + "<dev string:x4f9>";
        util::function_3f749abc(var_86418430 + "<dev string:x506>", var_c8d599b5 + "<dev string:x515>");
        util::function_3f749abc(var_86418430 + "<dev string:x529>", var_c8d599b5 + "<dev string:x53d>");
        util::function_3f749abc(var_86418430 + "<dev string:x558>", var_c8d599b5 + "<dev string:x56b>");
        util::function_3f749abc(var_86418430 + "<dev string:x582>", var_c8d599b5 + "<dev string:x594>");
        util::function_3f749abc(var_86418430 + "<dev string:x5ab>", var_c8d599b5 + "<dev string:x5bc>");
        var_86418430 = var_bbd68476 + "<dev string:x5d9>";
        util::function_3f749abc(var_86418430 + "<dev string:x5e3>", var_c8d599b5 + "<dev string:x5f3>");
        util::function_3f749abc(var_86418430 + "<dev string:x608>", var_c8d599b5 + "<dev string:x62b>");
        util::function_3f749abc(var_86418430 + "<dev string:x63f>", var_c8d599b5 + "<dev string:x655>");
        util::function_3f749abc(var_86418430 + "<dev string:x66a>", var_c8d599b5 + "<dev string:x68e>");
        util::function_3f749abc(var_86418430 + "<dev string:x6a8>", var_c8d599b5 + "<dev string:x6c8>");
        util::function_3f749abc(var_86418430 + "<dev string:x6e4>", var_c8d599b5 + "<dev string:x6f5>");
        var_86418430 = var_bbd68476 + "<dev string:x712>";
        util::function_3f749abc(var_86418430 + "<dev string:x71c>", var_c8d599b5 + "<dev string:x72c>");
        util::function_3f749abc(var_86418430 + "<dev string:x748>", var_c8d599b5 + "<dev string:x757>");
        var_86418430 = var_bbd68476 + "<dev string:x772>";
        util::function_3f749abc(var_86418430 + "<dev string:x77e>", var_c8d599b5 + "<dev string:x78d>");
        util::function_3f749abc(var_86418430 + "<dev string:x7ab>", var_c8d599b5 + "<dev string:x7c5>");
        util::function_3f749abc(var_86418430 + "<dev string:x7e3>", var_c8d599b5 + "<dev string:x7f5>");
        var_86418430 = var_bbd68476 + "<dev string:x813>";
        util::function_3f749abc(var_86418430 + "<dev string:x81b>", var_c8d599b5 + "<dev string:x833>");
        util::function_3f749abc(var_86418430 + "<dev string:x84f>", var_c8d599b5 + "<dev string:x855>");
        util::function_3f749abc(var_86418430 + "<dev string:x84f>", var_c8d599b5 + "<dev string:x86d>");
        util::function_3f749abc(var_86418430 + "<dev string:x886>", var_c8d599b5 + "<dev string:x897>");
        var_86418430 = var_bbd68476 + "<dev string:x8b5>";
        util::function_3f749abc(var_86418430 + "<dev string:x8bd>", var_c8d599b5 + "<dev string:x8cc>");
        util::function_3f749abc(var_86418430 + "<dev string:x8e7>", var_c8d599b5 + "<dev string:x8f7>");
        util::function_3f749abc(var_86418430 + "<dev string:x913>", var_c8d599b5 + "<dev string:x923>");
        util::function_3f749abc(var_86418430 + "<dev string:x93f>", var_c8d599b5 + "<dev string:x94f>");
        util::function_3f749abc(var_86418430 + "<dev string:x96b>", var_c8d599b5 + "<dev string:x97c>");
        util::function_3f749abc(var_86418430 + "<dev string:x999>", var_c8d599b5 + "<dev string:x9a6>");
        util::function_3f749abc(var_86418430 + "<dev string:x9bf>", var_c8d599b5 + "<dev string:x9ce>");
        util::function_3f749abc(var_86418430 + "<dev string:x9e9>", var_c8d599b5 + "<dev string:x9f9>");
        var_86418430 = var_bbd68476 + "<dev string:xa15>";
        util::function_3f749abc(var_86418430 + "<dev string:xa1d>", var_c8d599b5 + "<dev string:xa28>");
        util::function_3f749abc(var_86418430 + "<dev string:xa3f>", var_c8d599b5 + "<dev string:xa50>");
        util::function_3f749abc(var_86418430 + "<dev string:xa67>", var_c8d599b5 + "<dev string:xa75>");
    }

#/
