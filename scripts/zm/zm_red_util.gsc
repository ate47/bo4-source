#using script_48288470fe0b53d;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_red_zones;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;

#namespace zm_red_util;

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0xfac4a453, Offset: 0x178
// Size: 0xc2
function init() {
    clientfield::register("toplayer", "zm_red_timer", 16000, getminbitcountfornum(120), "int");
    level.var_d0d80ff8 = zm_red_challenges_hud::register("zm_red_challenges_hud");
    if (zm_utility::is_ee_enabled()) {
        level thread function_a3a07623();
    }
    level._effect[#"barrier_impact"] = #"hash_573f7a396c8ea0c1";
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0x95f5d50f, Offset: 0x248
// Size: 0x138
function barrier_impact() {
    self endon(#"death");
    self val::set("power_event", "takedamage", 1);
    self.health = 99999;
    while (true) {
        s_result = self waittill(#"damage");
        if (isdefined(s_result.amount)) {
            self.health += s_result.amount;
        }
        if (isdefined(s_result.position) && isdefined(s_result.attacker)) {
            playfx(level._effect[#"barrier_impact"], s_result.position, anglestoforward(s_result.attacker.angles) * -1);
            wait 0.25;
        }
    }
}

// Namespace zm_red_util/zm_red_util
// Params 4, eflags: 0x0
// Checksum 0xfae71d42, Offset: 0x388
// Size: 0xf0
function function_6f5a2cb2(text, n_display_time = 0, str_waittill = undefined, var_3de28ed8 = 1) {
    a_players = util::get_active_players();
    foreach (player in a_players) {
        player thread show_text(text, n_display_time, str_waittill, var_3de28ed8);
    }
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0x6afdec4a, Offset: 0x480
// Size: 0x44
function function_207cca50() {
    if (!level.var_d0d80ff8 zm_red_challenges_hud::is_open(self)) {
        level.var_d0d80ff8 zm_red_challenges_hud::open(self);
    }
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x0
// Checksum 0x222ec418, Offset: 0x4d0
// Size: 0x44
function function_18bb0d0d() {
    if (level.var_d0d80ff8 zm_red_challenges_hud::is_open(self)) {
        level.var_d0d80ff8 zm_red_challenges_hud::close(self);
    }
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0xd9f48cc4, Offset: 0x520
// Size: 0x84
function function_b4759cf8() {
    self function_207cca50();
    if (zm_utility::is_trials()) {
        level.var_d0d80ff8 zm_red_challenges_hud::set_state(self, #"trials");
        return;
    }
    level.var_d0d80ff8 zm_red_challenges_hud::set_state(self, #"visible");
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0x9ba96c22, Offset: 0x5b0
// Size: 0x44
function function_7e30f24c() {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::set_state(self, #"defaultstate");
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0x5a38bf7d, Offset: 0x600
// Size: 0x64
function function_7e617e33(var_9eb6bb80 = 1) {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::set_rewardhidden(self, var_9eb6bb80 ? 0 : 1);
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0xf9b86ede, Offset: 0x670
// Size: 0x64
function function_9ab191d3(var_447e014a = 1) {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::set_challengefailing(self, var_447e014a ? 1 : 0);
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0xce71fa2a, Offset: 0x6e0
// Size: 0x44
function set_challenge_text(text) {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::set_challengetext(self, text);
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd7afac97, Offset: 0x730
// Size: 0x44
function function_f0d355fc(text) {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::set_bottomtext(self, text);
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0xb4795570, Offset: 0x780
// Size: 0x64
function function_76f2fea0(var_3f4d60e3 = 1) {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::set_binlocation(self, var_3f4d60e3 ? 1 : 0);
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0xfaf4bfe2, Offset: 0x7f0
// Size: 0x44
function function_a6d4b55e(var_e2fdd04c) {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::set_tributeavailable(self, var_e2fdd04c);
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0x547d559e, Offset: 0x840
// Size: 0x3c
function function_34a533b1() {
    self function_207cca50();
    level.var_d0d80ff8 zm_red_challenges_hud::increment_progress(self);
}

// Namespace zm_red_util/zm_red_util
// Params 4, eflags: 0x1 linked
// Checksum 0xbee73795, Offset: 0x888
// Size: 0x15c
function show_text(text, n_display_time = 0, str_waittill = undefined, var_3de28ed8 = 1) {
    self endon(#"death");
    if (var_3de28ed8) {
        self set_challenge_text(text);
        self function_b4759cf8();
    } else {
        self function_f0d355fc(text);
        self function_b4759cf8();
    }
    if (n_display_time) {
        self waittilltimeout(n_display_time, #"death", #"disconnect", str_waittill);
    } else {
        self waittill(#"death", #"disconnect", str_waittill);
    }
    if (isdefined(self)) {
        if (level.var_d0d80ff8 zm_red_challenges_hud::is_open(self)) {
            self function_b952264e(var_3de28ed8);
        }
    }
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0x1558e3e1, Offset: 0x9f0
// Size: 0x6c
function function_b952264e(var_3de28ed8 = 1) {
    if (var_3de28ed8) {
        self set_challenge_text(#"");
        return;
    }
    self function_f0d355fc(#"");
}

// Namespace zm_red_util/zm_red_util
// Params 3, eflags: 0x1 linked
// Checksum 0xbeb091bb, Offset: 0xa68
// Size: 0x116
function can_see(v_pos, var_7b20e52b, n_dot = 0.7) {
    v_forward = anglestoforward(self.angles);
    v_dir = vectornormalize(v_pos - self.origin);
    dp = vectordot(v_forward, v_dir);
    if (dp > n_dot) {
        if (isdefined(var_7b20e52b) && var_7b20e52b) {
            trace = bullettrace(v_pos, self.origin + (0, 0, 40), 0, undefined);
            if (trace[#"fraction"] < 1) {
                return false;
            }
        }
        return true;
    }
    return false;
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0xb3da70b8, Offset: 0xb88
// Size: 0x90
function start_timer(n_time_seconds) {
    foreach (player in level.players) {
        player clientfield::set_to_player("zm_red_timer", n_time_seconds);
    }
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0x8ac45c4, Offset: 0xc20
// Size: 0x88
function stop_timer() {
    foreach (player in level.players) {
        player clientfield::set_to_player("zm_red_timer", 0);
    }
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x0
// Checksum 0x3097f338, Offset: 0xcb0
// Size: 0xd4
function function_dd9dd1cd() {
    var_90c5736d = [];
    foreach (zone in level.zones) {
        if (isdefined(zone) && zone.is_enabled) {
            var_a24af036 = zm_red_zones::function_27028b8e(zone.name);
            array::add(var_90c5736d, var_a24af036, 0);
        }
    }
    return var_90c5736d;
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x0
// Checksum 0x3a4f0bf, Offset: 0xd90
// Size: 0x4a
function function_9dcee9e4(vol_area) {
    a_players = getplayers();
    var_2a4957b4 = function_f17015c8(a_players, vol_area);
    return var_2a4957b4;
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x0
// Checksum 0xe279d30f, Offset: 0xde8
// Size: 0x52
function function_797ac3b0(vol_area) {
    a_zombies = getaiteamarray(level.zombie_team);
    var_2a4957b4 = function_f17015c8(a_zombies, vol_area);
    return var_2a4957b4;
}

// Namespace zm_red_util/zm_red_util
// Params 2, eflags: 0x1 linked
// Checksum 0x8dc730b7, Offset: 0xe48
// Size: 0xa4
function function_f17015c8(a_ents, vol_area) {
    var_2a4957b4 = 0;
    foreach (ent in a_ents) {
        if (ent istouching(vol_area)) {
            var_2a4957b4++;
        }
    }
    return var_2a4957b4;
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0xbd1b89d, Offset: 0xef8
// Size: 0x9c
function function_a3a07623() {
    a_s_collectibles = struct::get_array("collectibles_pos", "targetname");
    array::thread_all(a_s_collectibles, &function_ee58ddd4);
    a_s_scrolls = struct::get_array("scrolls_pos", "targetname");
    array::thread_all(a_s_scrolls, &function_ee58ddd4, 1);
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x5 linked
// Checksum 0xc01ef4f5, Offset: 0xfa0
// Size: 0x10c
function private function_ee58ddd4(is_scroll = 0) {
    n_radius = 64;
    if (isdefined(self.radius)) {
        n_radius = self.radius;
    }
    if (isdefined(self.model)) {
        mdl_collectible = util::spawn_model(self.model, self.origin, self.angles, 0, 1);
    }
    e_activator = self zm_unitrigger::function_fac87205("", n_radius);
    if (isplayer(e_activator)) {
        if (is_scroll) {
            e_activator thread function_eb6f144(self.script_string, mdl_collectible);
            return;
        }
        e_activator thread function_8916aa62(self.script_string);
    }
}

/#

    // Namespace zm_red_util/zm_red_util
    // Params 0, eflags: 0x0
    // Checksum 0x1a0f73ea, Offset: 0x10b8
    // Size: 0x1b8
    function function_a94baf7b() {
        a_s_collectibles = struct::get_array("<dev string:x38>", "<dev string:x4b>");
        foreach (s_collectibles in a_s_collectibles) {
            sphere(s_collectibles.origin + (0, 0, 60), 12, (0, 1, 1), 0.7, 0, 16, 10000);
        }
        a_s_scrolls = struct::get_array("<dev string:x58>", "<dev string:x4b>");
        foreach (s_scrolls in a_s_scrolls) {
            sphere(s_scrolls.origin + (0, 0, 60), 12, (1, 0.5, 0), 0.7, 0, 16, 10000);
        }
    }

#/

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd9db8149, Offset: 0x1278
// Size: 0x47e
function function_8916aa62(str_line) {
    switch (str_line) {
    case #"hash_61b0d833df7fb2c3":
        str_vo_line = #"hash_1afab8875f1342bc";
        break;
    case #"hash_13833567991bf57f":
        str_vo_line = #"hash_6602f6ff55aea604";
        break;
    case #"mural_acrisius":
        str_vo_line = #"hash_1afd1c392812ecf3";
        break;
    case #"mural_bellerophon":
        str_vo_line = #"hash_45da578907c2942c";
        break;
    case #"mural_hesperides":
        str_vo_line = #"hash_19881d774c4bb8ae";
        break;
    case #"mural_andromeda":
        str_vo_line = #"hash_60a1b31d1e49dfef";
        break;
    case #"hash_2bfb4eb3328f4aec":
        str_vo_line = #"hash_33c6fcca57aca8d";
        break;
    case #"hash_5e5b1ca453e6f455":
        str_vo_line = #"hash_497d4298ff17357a";
        break;
    case #"hash_30574e66f25be5e4":
        str_vo_line = #"hash_6ef7ae2fd8250179";
        break;
    case #"hash_50e280aeaa829e6c":
        str_vo_line = #"hash_62abf8f91f119ead";
        break;
    case #"hash_29f246efb660b3f0":
        str_vo_line = #"hash_3a5e26183d8b51c1";
        break;
    case #"hash_e2cf00499808431":
        str_vo_line = #"hash_499d5f58bb808122";
        break;
    case #"interact_automaton":
        str_vo_line = #"hash_48e9f010df79bf6b";
        break;
    case #"hash_7004febf4258ee7c":
        str_vo_line = #"hash_4ca81ffc1793c4fd";
        break;
    case #"hash_4439679b1d9196dc":
        str_vo_line = #"hash_390aa4c8a2db661d";
        break;
    case #"hash_156a2e99360d81da":
        str_vo_line = #"hash_26935699e93f1db7";
        break;
    case #"interact_sandals":
        str_vo_line = #"hash_13ae4ec246717759";
        break;
    case #"hash_4d78ef43b2835e3b":
        str_vo_line = #"hash_4125f996df00a018";
        break;
    case #"interact_forge":
        str_vo_line = #"hash_10cbb1b8573a0040";
        break;
    case #"hash_5eff508aba7e72bf":
        str_vo_line = #"hash_3675fc89d07c4c0c";
        break;
    case #"hash_59cedc66fd5105d2":
        str_vo_line = #"hash_1ca7575800b7ff57";
        break;
    case #"statue_pedestal":
        str_vo_line = #"hash_5e56b7fe2e124bbd";
        break;
    case #"hash_4ea1d73b4539f362":
        str_vo_line = #"hash_42068e9344b63c57";
        break;
    case #"hash_7d5051b5c30af3ff":
        str_vo_line = #"hash_3c592afca5126028";
        break;
    case #"hash_48f3eb6c6c2d5cea":
        str_vo_line = #"hash_3d675b5319c334b7";
        break;
    case #"statue_female":
        str_vo_line = #"hash_60fc5081c4fd6b7";
        break;
    default:
        return;
    }
    b_say = self zm_vo::vo_say(str_vo_line, 0, 1, 9999, 1, 1, 1);
}

// Namespace zm_red_util/zm_red_util
// Params 2, eflags: 0x1 linked
// Checksum 0xa8c4134b, Offset: 0x1700
// Size: 0x384
function function_eb6f144(str_line, mdl_collectible) {
    switch (str_line) {
    case #"scroll_1":
        str_vo_line = #"hash_53d277c8b1114728";
        var_bfdd8441 = #"hash_c7f396aed80374b";
        break;
    case #"scroll_2":
        str_vo_line = #"hash_e3e70858f5614e3";
        var_bfdd8441 = #"hash_c7f396aed80374b";
        break;
    case #"scroll_3":
        str_vo_line = #"hash_748ebfa215a02be6";
        var_bfdd8441 = #"hash_3d24b9655233513d";
        break;
    case #"scroll_4":
        str_vo_line = #"hash_52c2f244c43714a9";
        var_bfdd8441 = #"hash_29c7b1f9e28de2ee";
        break;
    case #"scroll_5":
        str_vo_line = #"hash_2d2ebb39be31994c";
        var_bfdd8441 = #"hash_22dbce472ee3015b";
        break;
    case #"scroll_6":
        str_vo_line = #"hash_7cd8582798401757";
        var_bfdd8441 = #"hash_29c7b0f9e28de13b";
        break;
    case #"scroll_7":
        str_vo_line = #"hash_4081f86f16c90f9a";
        var_bfdd8441 = #"hash_29c7aff9e28ddf88";
        break;
    case #"scroll_8":
        str_vo_line = #"hash_e902c086e6a174d";
        var_bfdd8441 = #"hash_73ae4e30dfdf732d";
        break;
    case #"scroll_9":
        str_vo_line = "";
        var_bfdd8441 = "";
        break;
    default:
        return;
    }
    mdl_collectible playsound(#"hash_764458163b3f25f1");
    wait 1.2;
    mdl_collectible playsound(str_vo_line);
    mdl_collectible playloopsound(var_bfdd8441);
    if (str_line != "scroll_8") {
        function_d24a0f09(str_vo_line, 0.6);
        mdl_collectible stoploopsound();
        mdl_collectible playsound(#"hash_13881a5ef6463c90");
        wait 1;
    } else {
        wait 26.5;
        mdl_collectible stoploopsound();
        mdl_collectible playsound(#"hash_6af2fc9b90813082");
        wait 18.1;
        mdl_collectible playsound(#"hash_13881a5ef6463c90");
        wait 1;
    }
    if (isdefined(mdl_collectible)) {
        mdl_collectible delete();
    }
}

// Namespace zm_red_util/zm_red_util
// Params 2, eflags: 0x1 linked
// Checksum 0x23185496, Offset: 0x1a90
// Size: 0x7e
function function_d24a0f09(str_vo_line, var_e688ce8f = 0) {
    n_duration = soundgetplaybacktime(str_vo_line);
    n_duration = float(n_duration) / 1000;
    n_duration -= var_e688ce8f;
    if (n_duration > 0) {
        wait n_duration;
    }
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x1 linked
// Checksum 0x52cc99a1, Offset: 0x1b18
// Size: 0x56
function function_f0ed2a66(v_pos) {
    vol_stands = getent("stands_vol", "script_noteworthy");
    if (istouching(v_pos, vol_stands)) {
        return false;
    }
    return true;
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0x42f21f9b, Offset: 0x1b78
// Size: 0xe4
function cleanup_zombie() {
    if (zm_utility::is_trials()) {
        self zm_cleanup::function_23621259(0);
    } else {
        self zm_cleanup::function_23621259(1);
    }
    self zombie_utility::reset_attack_spot();
    self.var_c39323b5 = 1;
    self.var_e700d5e2 = 1;
    self.allowdeath = 1;
    self kill();
    waitframe(1);
    if (isdefined(self)) {
        /#
            debugstar(self.origin, 1000, (1, 1, 1));
        #/
        self delete();
    }
}

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0xaea13bcc, Offset: 0x1c68
// Size: 0x68
function function_643916c9() {
    self endon(#"death");
    self.ignore_poi = [];
    while (true) {
        if (isdefined(level.zombie_poi_array) && level.zombie_poi_array.size) {
            self.ignore_poi = level.zombie_poi_array;
        }
        wait 0.1;
    }
}

