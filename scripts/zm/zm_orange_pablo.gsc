#using scripts\zm\zm_orange_util.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_orange_pablo;

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x1 linked
// Checksum 0xaa155675, Offset: 0x208
// Size: 0xc54
function init() {
    level.pablo_npc = getent("pablo_npc", "targetname");
    level.pablo_npc.name = "herm";
    level.pablo_npc.isspeaking = 0;
    level.pablo_npc.var_5b6ebfd0 = 0;
    level.pablo_npc flag::init(#"hash_5945cee69b029018");
    level flag::init(#"pablo_intro");
    level flag::init(#"hash_641f14d0b2fd57d7");
    level flag::init(#"hash_6e81da82129193f6");
    level flag::init(#"hash_6a7b24db9087b2eb");
    level.pablo_npc.var_3e21d491 = struct::get("s_pap_rock_dropoff");
    level.pablo_npc.var_f75b1f16 = [];
    level.pablo_npc.var_cb3ed98f = [];
    level.pablo_npc.var_cb3ed98f[2] = {#var_fcab5f41:#"hash_22abfa5a48ecff33", #var_e7b75754:#"hash_22abfa5a48ecff33", #var_c67e664c:1, #var_23d421c1:#"", #n_obj:2};
    level.pablo_npc.var_cb3ed98f[3] = {#var_fcab5f41:#"", #var_e7b75754:#"hash_6eb46d1457a1406a", #var_23d421c1:#"hash_5ec5a17bd8bad06c", #n_obj:1};
    level.pablo_npc.var_cb3ed98f[6] = {#var_fcab5f41:#"hash_37b261e51a21c0cc", #var_44dd0e20:1, #var_e7b75754:#"hash_37b261e51a21c0cc", #var_c67e664c:4, #var_23d421c1:#"hash_254c37174dfe3cd2", #n_obj:7};
    level.pablo_npc.var_cb3ed98f[8] = {#var_fcab5f41:#"hash_170341e08a9cda92", #var_44dd0e20:0, #var_e7b75754:#"hash_170341e08a9cda92", #var_c67e664c:1, #var_23d421c1:#"vox_none", #n_obj:5};
    level.pablo_npc.var_cb3ed98f[7] = {#var_fcab5f41:#"vox_soap_stones_get", #var_44dd0e20:1, #var_e7b75754:#"vox_soap_stones_get", #var_c67e664c:1, #var_23d421c1:#"", #n_obj:6};
    level.pablo_npc.var_cb3ed98f[5] = {#var_fcab5f41:#"", #var_e7b75754:#"hash_754cd427015598bc", #var_23d421c1:#"hash_5e981943f6b25ff", #n_obj:3};
    level.pablo_npc.var_cb3ed98f[4] = {#var_fcab5f41:#"", #var_e7b75754:#"hash_754cd427015598bc", #var_23d421c1:#"hash_5e981943f6b25ff", #n_obj:3};
    level.pablo_npc.var_cb3ed98f[0] = {#var_fcab5f41:#"hash_4af110e6753e70c2", #var_e7b75754:#"", #var_23d421c1:#"vox_none", #n_obj:10};
    level.pablo_npc.var_cb3ed98f[1] = {#var_fcab5f41:#"", #var_e7b75754:#"", #var_23d421c1:#"vox_none", #n_obj:11};
    level.pablo_npc.var_cb3ed98f[11] = {#var_fcab5f41:#"hash_644ae453b377363", #var_e7b75754:#"hash_644ae453b377363", #var_c67e664c:3, #var_6e67b4c4:1, #var_23d421c1:undefined, #n_obj:0};
    level.pablo_npc.var_cb3ed98f[10] = {#var_fcab5f41:#"hash_1856b015429225fa", #var_e7b75754:#"", #var_23d421c1:undefined, #n_obj:4};
    level.pablo_npc.var_cb3ed98f[15] = {#var_fcab5f41:#"", #var_e7b75754:#"hash_1859b2eb556cbe1c", #var_c67e664c:1, #var_6e67b4c4:1, #var_23d421c1:#"hash_1859b2eb556cbe1c", #var_f26e362:0, #n_obj:5};
    level.pablo_npc.var_cb3ed98f[16] = {#var_fcab5f41:#"hash_18d17175b6700e47", #var_44dd0e20:0, #var_e7b75754:#"hash_18d17175b6700e47", #var_c67e664c:1, #var_23d421c1:undefined, #n_obj:5};
    level.pablo_npc.var_cb3ed98f[12] = {#var_fcab5f41:#"hash_14448cae6cbf526", #var_e7b75754:#"", #var_23d421c1:undefined, #n_obj:9};
    level.pablo_npc.var_cb3ed98f[13] = {#var_fcab5f41:#"hash_38aad0b1eae4093a", #var_e7b75754:#"", #var_23d421c1:undefined, #n_obj:3};
    level.pablo_npc.var_cb3ed98f[14] = {#var_fcab5f41:#"hash_38aad0b1eae4093a", #var_e7b75754:#"", #var_23d421c1:undefined, #n_obj:3};
    level.npc_pablo = spawner::simple_spawn_single(getent("pablo_spawner", "targetname"));
    while (!isdefined(level.npc_pablo)) {
        waitframe(1);
        level.npc_pablo = spawner::simple_spawn_single(getent("pablo_spawner", "targetname"));
    }
    level.npc_pablo val::set(#"plot_npc", "takedamage", 0);
    if (zm_utility::is_classic()) {
        level thread pablo_intro();
        level thread pablo_lift_init();
    }
    if (zm_utility::is_trials()) {
        level pablo_lift_init();
        level flag::set(#"hash_641f14d0b2fd57d7");
        level.pablo_npc thread function_1dc9b29a();
        level.pablo_npc thread function_57c115a8();
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 2, eflags: 0x1 linked
// Checksum 0x802574fc, Offset: 0xe68
// Size: 0xcc
function function_e44c7c0c(str_alias, n_variant) {
    level.pablo_npc zm_vo::vo_stop();
    level.pablo_npc zm_hms_util::function_6a0d675d(str_alias, n_variant, 0, 1);
    if (str_alias == #"hash_18d17175b6700e47" && n_variant === 1) {
        zm_orange_util::function_fd24e47f(#"hash_35b42e4ca5afd6da", -1, 1);
        level.var_1c53964e thread zm_hms_util::function_6a0d675d(#"hash_35b42e4ca5afd6da");
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 1, eflags: 0x1 linked
// Checksum 0x437d1327, Offset: 0xf40
// Size: 0x7c
function function_b9e15919(b_crouch = 1) {
    if (b_crouch) {
        level.npc_pablo setblackboardattribute("_stance", "crouch");
        return;
    }
    level.npc_pablo setblackboardattribute("_stance", "stand");
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0x32460d87, Offset: 0xfc8
// Size: 0x344
function private pablo_intro() {
    var_de23a374 = array("lighthouse_level_1", "lighthouse_level_2", "lighthouse_level_3");
    while (true) {
        if (zm_hms_util::any_player_in_zone(var_de23a374) && level.pablo_npc zm_audio::can_speak()) {
            level function_e44c7c0c(#"hash_2a582565ea3add7e");
            a_players = [];
            foreach (zone in var_de23a374) {
                a_players = arraycombine(a_players, zm_zonemgr::get_players_in_zone(zone, 1), 0, 0);
            }
            player = zm_hms_util::function_3815943c(a_players);
            if (isdefined(player)) {
                player zm_orange_util::function_51b752a9(#"hash_2a582565ea3add7e", -1, 0, 1);
            }
            break;
        }
        wait 1;
    }
    level flag::set(#"pablo_intro");
    while (true) {
        if (zm_hms_util::any_player_in_zone("lighthouse_level_4") && level.pablo_npc zm_audio::can_speak()) {
            str_alias = #"hash_61f15b67b89a32a7";
            if (level flag::get(#"hash_3310bb35ce396e49")) {
                str_alias = #"hash_921478d69bafc7c";
            }
            level function_e44c7c0c(str_alias);
            if (!level flag::get(#"hash_3310bb35ce396e49")) {
                a_players = zm_zonemgr::get_players_in_zone("lighthouse_level_4", 1);
                player = zm_hms_util::function_3815943c(a_players);
                if (isdefined(player)) {
                    player zm_orange_util::function_51b752a9(str_alias, -1, 0, 1);
                }
            }
            level flag::set(#"hash_641f14d0b2fd57d7");
            break;
        }
        wait 1;
    }
    level.pablo_npc thread function_1dc9b29a();
    level.pablo_npc thread function_57c115a8();
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0xde1a0191, Offset: 0x1318
// Size: 0x1c8
function private function_57c115a8() {
    level endon(#"sendoff_started");
    self endon(#"death");
    i = 0;
    var_8be6334f = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    var_de23a374 = array("lighthouse_level_1");
    while (true) {
        if (self.isspeaking == 0 && self.var_f75b1f16.size > 0 && zm_hms_util::any_player_in_zone(var_de23a374) && !zm_hms_util::any_player_in_zone("lighthouse_level_4")) {
            str_nag = self function_e81ee0e3();
            if (str_nag === #"hash_75f4c63702dc54e") {
                var_93843138 = var_8be6334f[i];
                i++;
                if (i > var_8be6334f.size) {
                    i = 0;
                    var_8be6334f = array::randomize(var_8be6334f);
                }
            } else {
                var_93843138 = self function_17440011();
            }
            level thread function_e44c7c0c(str_nag, var_93843138);
            wait 60;
            continue;
        }
        wait 1;
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0xe71920bc, Offset: 0x14e8
// Size: 0x82
function private function_e81ee0e3() {
    for (i = 0; i < self.var_f75b1f16.size; i++) {
        var_4ad2924d = self.var_f75b1f16[i];
        if (isdefined(self.var_cb3ed98f[var_4ad2924d].var_23d421c1)) {
            return self.var_cb3ed98f[var_4ad2924d].var_23d421c1;
        }
    }
    return #"hash_75f4c63702dc54e";
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0xeaaf8a53, Offset: 0x1578
// Size: 0x74
function private function_17440011() {
    for (i = 0; i < self.var_f75b1f16.size; i++) {
        var_4ad2924d = self.var_f75b1f16[i];
        if (isdefined(self.var_cb3ed98f[var_4ad2924d].var_f26e362)) {
            return self.var_cb3ed98f[var_4ad2924d].var_f26e362;
        }
    }
    return undefined;
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 5, eflags: 0x1 linked
// Checksum 0x51cbf0b1, Offset: 0x15f8
// Size: 0xaa
function register_drop_off(var_e303e136, str_hint, var_306b9dd6, func_interact, func_hint = undefined) {
    s_interact = level.pablo_npc.var_cb3ed98f[var_e303e136];
    s_interact.str_hint = str_hint;
    s_interact.var_306b9dd6 = var_306b9dd6;
    s_interact.func_interact = func_interact;
    s_interact.func_hint = func_hint;
    s_interact.var_f6856302 = 1;
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 5, eflags: 0x1 linked
// Checksum 0x616d9065, Offset: 0x16b0
// Size: 0xa6
function function_3f9e02b8(n_pick_up, str_hint, var_306b9dd6, func_interact, func_hint = undefined) {
    s_interact = level.pablo_npc.var_cb3ed98f[n_pick_up];
    s_interact.str_hint = str_hint;
    s_interact.var_306b9dd6 = var_306b9dd6;
    s_interact.func_interact = func_interact;
    s_interact.func_hint = func_hint;
    s_interact.var_f6856302 = 0;
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 1, eflags: 0x1 linked
// Checksum 0xbbdbf996, Offset: 0x1760
// Size: 0xf2
function function_d83490c5(n_quest) {
    if (!isdefined(level.pablo_npc.var_f75b1f16)) {
        level.pablo_npc.var_f75b1f16 = [];
    } else if (!isarray(level.pablo_npc.var_f75b1f16)) {
        level.pablo_npc.var_f75b1f16 = array(level.pablo_npc.var_f75b1f16);
    }
    level.pablo_npc.var_f75b1f16[level.pablo_npc.var_f75b1f16.size] = n_quest;
    level.pablo_npc.var_f75b1f16 = array::sort_by_value(level.pablo_npc.var_f75b1f16, 1);
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 1, eflags: 0x1 linked
// Checksum 0x66af67ad, Offset: 0x1860
// Size: 0x6a
function function_6aaeff92(n_quest) {
    arrayremovevalue(level.pablo_npc.var_f75b1f16, n_quest);
    level.pablo_npc.var_f75b1f16 = array::sort_by_value(level.pablo_npc.var_f75b1f16, 1);
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x1 linked
// Checksum 0x285efa78, Offset: 0x18d8
// Size: 0xee
function pablo_lift_init() {
    level.var_f45a0bfd = struct::get("pablo_lift", "targetname");
    level.var_f45a0bfd flagsys::wait_till(#"scene_ents_ready");
    level.var_f45a0bfd.var_e205fbb = level.var_f45a0bfd.scene_ents[#"prop 1"];
    level.var_f45a0bfd.is_moving = 0;
    for (i = 0; i < 12; i++) {
        level.var_f45a0bfd.var_e205fbb hidepart("tag_item_" + i);
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x1 linked
// Checksum 0xdcfafcb1, Offset: 0x19d0
// Size: 0x54
function function_a61b8406() {
    function_b9e15919(1);
    level.var_f45a0bfd scene::play("lower");
    function_b9e15919(0);
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x1 linked
// Checksum 0xc9e5cea1, Offset: 0x1a30
// Size: 0x54
function function_6c49e9aa() {
    function_b9e15919(1);
    level.var_f45a0bfd scene::play("raise");
    function_b9e15919(0);
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 1, eflags: 0x1 linked
// Checksum 0x4f7bcd19, Offset: 0x1a90
// Size: 0x8c
function function_5ff0d681(index) {
    level.var_f45a0bfd.var_e205fbb showpart("tag_item_" + index);
    if (index === 5) {
        level.var_f45a0bfd.var_e205fbb clientfield::set("" + #"hash_1b72c208f2964e24", level.var_ed1e7d4d);
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 1, eflags: 0x1 linked
// Checksum 0x89d53897, Offset: 0x1b28
// Size: 0x84
function function_d9161909(index) {
    level.var_f45a0bfd.var_e205fbb hidepart("tag_item_" + index);
    if (index === 5) {
        level.var_f45a0bfd.var_e205fbb clientfield::set("" + #"hash_1b72c208f2964e24", 0);
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x4
// Checksum 0x5fdaee11, Offset: 0x1bb8
// Size: 0xb6
function private function_12d23d57() {
    while (true) {
        function_a61b8406();
        wait 1;
        for (i = 0; i < 12; i++) {
            function_5ff0d681(i);
            wait 1;
            function_d9161909(i);
            wait 0.5;
        }
        wait 3;
        function_6c49e9aa();
        function_d9161909(0);
        wait 3;
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0x8a73bc6e, Offset: 0x1c78
// Size: 0x23e
function private function_39614d4b() {
    arrayremovevalue(self.var_f75b1f16, self.var_df3d62aa);
    s_info = level.pablo_npc.var_cb3ed98f[level.pablo_npc.var_df3d62aa];
    level.var_f45a0bfd.is_moving = 1;
    /#
        iprintlnbold("<dev string:x38>");
    #/
    if (!s_info.var_f6856302) {
        function_d9161909(s_info.n_obj);
        level thread [[ s_info.func_interact ]]();
    } else {
        function_5ff0d681(s_info.n_obj);
        if (isdefined(s_info.b_all_players) && s_info.b_all_players) {
            level thread [[ s_info.func_interact ]]();
        }
    }
    wait 1;
    self thread function_9f77ef2(s_info);
    function_6c49e9aa();
    /#
        iprintlnbold("<dev string:x55>");
    #/
    if (s_info.var_f6856302) {
        function_d9161909(s_info.n_obj);
        if (!(isdefined(s_info.b_all_players) && s_info.b_all_players)) {
            level thread [[ s_info.func_interact ]]();
        }
    }
    self flag::wait_till(#"hash_5945cee69b029018");
    self flag::clear(#"hash_5945cee69b029018");
    self.var_df3d62aa = undefined;
    level.var_f45a0bfd.is_moving = 0;
    self notify(#"hash_688d0bffbc9f5888");
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 1, eflags: 0x5 linked
// Checksum 0xa9be44ab, Offset: 0x1ec0
// Size: 0xf4
function private function_9f77ef2(s_info) {
    level endon(#"end_game");
    var_d2d60dc4 = 0;
    if (isdefined(level.var_d1206a2b)) {
        var_d2d60dc4 = level.var_d1206a2b zm_orange_util::function_51b752a9(s_info.var_e7b75754, -1, 0, 0);
    }
    if (isdefined(s_info.var_6e67b4c4) && s_info.var_6e67b4c4) {
        var_d2d60dc4 = 1;
    }
    if (isdefined(var_d2d60dc4) && var_d2d60dc4) {
        level function_e44c7c0c(s_info.var_e7b75754, s_info.var_c67e664c);
    }
    self flag::set(#"hash_5945cee69b029018");
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0x6f137a0e, Offset: 0x1fc0
// Size: 0x504
function private function_1dc9b29a() {
    level endon(#"sendoff_started");
    self endon(#"death");
    while (true) {
        if (self.var_f75b1f16.size > 0 && zm_hms_util::any_player_in_zone("lighthouse_level_4")) {
            self.var_df3d62aa = self.var_f75b1f16[getfirstarraykey(self.var_f75b1f16)];
            s_info = self.var_cb3ed98f[self.var_df3d62aa];
            self.var_3e21d491.s_info = s_info;
            if (s_info.var_fcab5f41 === #"hash_37b261e51a21c0cc" && !level flag::get(#"hash_6e81da82129193f6")) {
                level function_e44c7c0c(s_info.var_fcab5f41, 0);
                level flag::set(#"hash_6e81da82129193f6");
            } else if (s_info.var_fcab5f41 === #"vox_soap_stones_get") {
                level function_e44c7c0c("vox_vessel_pablo", 0);
                if (level.var_98138d6b > 1) {
                    level.var_1c53964e zm_hms_util::function_6a0d675d("vox_vessel_pablo", 0, 0, 1);
                    level function_e44c7c0c("vox_soap_stones_get", 0);
                }
            } else if (s_info.var_fcab5f41 == #"hash_1856b015429225fa") {
                level thread function_e44c7c0c(s_info.var_fcab5f41, 0);
                wait 0.5;
                self.var_cb3ed98f[10].var_fcab5f41 = #"";
            } else if (s_info.var_fcab5f41 === #"hash_38aad0b1eae4093a" && !level flag::get(#"hash_59d5ba61f4b8f405") && !level flag::get(#"hash_6a7b24db9087b2eb")) {
                level flag::set(#"hash_6a7b24db9087b2eb");
                level thread function_e44c7c0c(s_info.var_fcab5f41, s_info.var_44dd0e20);
            }
            if (s_info.var_fcab5f41 !== #"hash_38aad0b1eae4093a") {
                level thread function_e44c7c0c(s_info.var_fcab5f41, s_info.var_44dd0e20);
            }
            level.var_f45a0bfd.is_moving = 1;
            /#
                iprintlnbold("<dev string:x68>");
            #/
            if (!s_info.var_f6856302) {
                function_5ff0d681(s_info.n_obj);
            }
            wait 1;
            function_a61b8406();
            /#
                iprintlnbold("<dev string:x86>");
            #/
            level.var_f45a0bfd.is_moving = 0;
            if (isdefined(s_info.b_all_players) && s_info.b_all_players) {
                self.var_3e21d491 zm_hms_util::function_6099877a(64, #"hash_688d0bffbc9f5888", s_info.str_hint, s_info.var_306b9dd6);
                self.var_3e21d491 function_30a02731();
            } else {
                self.var_3e21d491 zm_unitrigger::create(&function_6248ba90, 64);
                self.var_3e21d491 thread function_d7e79438();
                self thread function_e435077();
            }
            self waittill(#"hash_688d0bffbc9f5888");
        }
        wait 1;
    }
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x1 linked
// Checksum 0x500780df, Offset: 0x24d0
// Size: 0x276
function function_e435077() {
    self endon(#"hash_276524e7f5657e50");
    s_info = self.var_cb3ed98f[self.var_df3d62aa];
    var_a3992d9c = 0;
    while (var_a3992d9c < 10) {
        var_a10acf3c = zm_zonemgr::get_players_in_zone("lighthouse_level_4", 1);
        var_23cd9374 = 0;
        if (self.var_f75b1f16.size > 0 && var_a10acf3c.size > 0) {
            if (isdefined(s_info.func_hint)) {
                foreach (e_player in var_a10acf3c) {
                    if (level [[ s_info.func_hint ]](e_player)) {
                        var_23cd9374 = 1;
                    }
                }
            } else {
                var_23cd9374 = 1;
            }
        }
        if (var_23cd9374) {
            var_a3992d9c = 0;
        } else {
            var_a3992d9c += 1;
        }
        wait 1;
    }
    level.pablo_npc notify(#"hash_ed7147b69728896");
    level.var_f45a0bfd.is_moving = 1;
    /#
        iprintlnbold("<dev string:x38>");
    #/
    function_6c49e9aa();
    /#
        iprintlnbold("<dev string:x55>");
    #/
    wait 1;
    if (!s_info.var_f6856302) {
        function_d9161909(s_info.n_obj);
    }
    zm_unitrigger::unregister_unitrigger(self.var_3e21d491.s_unitrigger);
    self.var_3e21d491.s_unitrigger = undefined;
    self.var_df3d62aa = undefined;
    level.var_f45a0bfd.is_moving = 0;
    self notify(#"hash_688d0bffbc9f5888");
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 1, eflags: 0x1 linked
// Checksum 0x9408de2c, Offset: 0x2750
// Size: 0xba
function function_6248ba90(e_player) {
    s_info = self.stub.related_parent.s_info;
    var_832ffcd4 = 1;
    if (isdefined(s_info.func_hint)) {
        var_832ffcd4 = level [[ s_info.func_hint ]](e_player);
    }
    if (var_832ffcd4) {
        self sethintstring(zm_utility::function_d6046228(s_info.str_hint, s_info.var_306b9dd6));
        return 1;
    }
    return 0;
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0x417db4ba, Offset: 0x2818
// Size: 0x1b6
function private function_d7e79438() {
    self endon(#"death");
    level.pablo_npc endon(#"hash_ed7147b69728896");
    s_activation = self waittill(#"trigger_activated");
    level.var_d1206a2b = s_activation.e_who;
    s_info = level.pablo_npc.var_cb3ed98f[level.pablo_npc.var_df3d62aa];
    if (s_info.var_fcab5f41 === #"hash_38aad0b1eae4093a" && !level flag::get(#"hash_59d5ba61f4b8f405") && !level flag::get(#"hash_6a7b24db9087b2eb")) {
        level.var_d1206a2b thread zm_orange_util::function_51b752a9(s_info.var_fcab5f41, -1, 1, 0);
    }
    level.pablo_npc notify(#"hash_276524e7f5657e50");
    playsoundatposition(#"hash_512bec1d554e89f1", self.origin);
    level.pablo_npc thread function_39614d4b();
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    self.s_unitrigger = undefined;
}

// Namespace zm_orange_pablo/zm_orange_pablo
// Params 0, eflags: 0x5 linked
// Checksum 0x38bc0851, Offset: 0x29d8
// Size: 0x5c
function private function_30a02731() {
    self endon(#"death");
    playsoundatposition(#"hash_512bec1d554e89f1", self.origin);
    level.pablo_npc thread function_39614d4b();
}

