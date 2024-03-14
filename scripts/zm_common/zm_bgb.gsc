// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace bgb;

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x2
// Checksum 0x9c672f76, Offset: 0x2b8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"bgb", &__init__, &__main__, undefined);
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x4a79712c, Offset: 0x308
// Size: 0x2dc
function private __init__() {
    callback::on_spawned(&on_player_spawned);
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    level.weaponbgbgrab = getweapon(#"zombie_bgb_grab");
    level.var_ddff6359 = array(getweapon(#"hash_d0f29de78e218ad"), getweapon(#"hash_5e07292c519531e6"), getweapon(#"hash_305e5faa9ecb625a"), getweapon(#"hash_23cc1f9c16b375c3"), getweapon(#"hash_155cc0a9ba3c3260"), getweapon(#"hash_2394c41f048f7d2"), getweapon(#"hash_4565adf3abc61ea3"));
    level.bgb = [];
    clientfield::register_clientuimodel("zmhud.bgb_current", 1, 8, "int", 0);
    clientfield::register_clientuimodel("zmhud.bgb_display", 1, 1, "int", 0);
    clientfield::register_clientuimodel("zmhud.bgb_timer", 1, 8, "float", 0);
    clientfield::register_clientuimodel("zmhud.bgb_activations_remaining", 1, 3, "int", 0);
    clientfield::register_clientuimodel("zmhud.bgb_invalid_use", 1, 1, "counter", 0);
    clientfield::register_clientuimodel("zmhud.bgb_one_shot_use", 1, 1, "counter", 0);
    clientfield::register("toplayer", "bgb_blow_bubble", 1, 1, "counter");
    zm::register_vehicle_damage_callback(&vehicle_damage_override);
    zm_perks::register_lost_perk_override(&lost_perk_override);
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x4ce7caa8, Offset: 0x5f0
// Size: 0x82
function private __main__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb_finalize();
    /#
        level thread setup_devgui();
    #/
    level._effect[#"samantha_steal"] = #"zombie/fx_monkey_lightning_zmb";
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x822709ab, Offset: 0x680
// Size: 0x56
function private on_player_spawned() {
    self.bgb = #"none";
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    self thread bgb_player_init();
    self.var_1898de24 = [];
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x10cbd8f1, Offset: 0x6e0
// Size: 0x74a
function private bgb_player_init() {
    if (isdefined(self.bgb_pack)) {
        for (i = 0; i < 4; i++) {
            if (isdefined(self.bgb_pack[i]) && isdefined(level.bgb[self.bgb_pack[i]])) {
                self bgb_pack::function_7b91e81c(i, level.bgb[self.bgb_pack[i]].item_index);
            }
        }
        return;
    }
    self.bgb_pack = self getbubblegumpack();
    for (x = 0; x < self.bgb_pack.size; x++) {
        if (isstring(self.bgb_pack[x])) {
            self.bgb_pack[x] = hash(self.bgb_pack[x]);
        }
    }
    self.bgb_pack_randomized = [];
    var_6e18a410 = array();
    for (i = 0; i < 4; i++) {
        str_bgb = self.bgb_pack[i];
        if (str_bgb == #"weapon_null") {
            continue;
        }
        if (zm_custom::function_3ac936c6(str_bgb)) {
            var_6e18a410[i] = str_bgb;
            continue;
        }
        if (str_bgb != #"weapon_null" && self getbgbremaining(str_bgb) > 0) {
            self thread zm_custom::function_deae84ba();
        }
    }
    self.bgb_pack = var_6e18a410;
    /#
        if (isdefined(self.var_d03d9cf3)) {
            self.bgb_pack = self.var_d03d9cf3;
        }
    #/
    self.bgb_stats = [];
    foreach (bgb in self.bgb_pack) {
        if (bgb == #"weapon_null") {
            continue;
        }
        if (isdefined(level.bgb) && isdefined(level.bgb[bgb]) && !(isdefined(level.bgb[bgb].consumable) && level.bgb[bgb].consumable)) {
            continue;
        }
        self.bgb_stats[bgb] = spawnstruct();
        if (!isbot(self)) {
            self.bgb_stats[bgb].var_c2a984f0 = self getbgbremaining(bgb);
        } else {
            self.bgb_stats[bgb].var_c2a984f0 = 0;
        }
        self.bgb_stats[bgb].bgb_used_this_game = 0;
    }
    self init_weapon_cycling();
    self thread bgb_player_monitor();
    self thread bgb_end_game();
    for (i = 0; i < 4; i++) {
        if (isdefined(self.bgb_pack[i]) && isdefined(level.bgb[self.bgb_pack[i]])) {
            self bgb_pack::function_7b91e81c(i, level.bgb[self.bgb_pack[i]].item_index);
        }
    }
    if (zm_custom::function_901b751c(#"zmelixirsdurables")) {
        var_66dd5e25 = array(#"zm_bgb_nowhere_but_there", #"zm_bgb_now_you_see_me");
        n_rank = self rank::getrank() + 1;
        foreach (bgb in level.bgb) {
            str_name = bgb.name;
            if (bgb.rarity === 0 && str_name != #"zm_bgb_point_drops" && !array::contains(self.bgb_pack, str_name)) {
                var_544e77f8 = level.bgb[str_name].var_a1750d43;
                if ((!isdefined(var_544e77f8) || isdefined(var_544e77f8) && n_rank >= var_544e77f8 || function_bea73b01() == 1) && zm_custom::function_3ac936c6(str_name)) {
                    if (!isinarray(var_66dd5e25, str_name)) {
                        if (!isdefined(self.var_2b74c8fe)) {
                            self.var_2b74c8fe = [];
                        } else if (!isarray(self.var_2b74c8fe)) {
                            self.var_2b74c8fe = array(self.var_2b74c8fe);
                        }
                        self.var_2b74c8fe[self.var_2b74c8fe.size] = str_name;
                    }
                    if (!isdefined(self.var_82971641)) {
                        self.var_82971641 = [];
                    } else if (!isarray(self.var_82971641)) {
                        self.var_82971641 = array(self.var_82971641);
                    }
                    self.var_82971641[self.var_82971641.size] = str_name;
                }
            }
        }
    }
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x88075591, Offset: 0xe38
// Size: 0x3c
function private bgb_end_game() {
    self endon(#"disconnect");
    self waittill(#"report_bgb_consumption");
    self thread take();
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x697d8c89, Offset: 0xe80
// Size: 0x212
function private bgb_finalize() {
    foreach (v in level.bgb) {
        v.item_index = getitemindexfromref(v.name);
        var_ddcb67f4 = getunlockableiteminfofromindex(v.item_index, 2);
        v.stat_index = isdefined(var_ddcb67f4) && isdefined(var_ddcb67f4.var_2f8e25b8) ? var_ddcb67f4.var_2f8e25b8 : 0;
        var_5415dfb9 = function_b143666d(v.item_index, 2);
        if (!isdefined(var_ddcb67f4) || !isdefined(var_5415dfb9)) {
            /#
                println("<unknown string>" + v.name + "<unknown string>");
            #/
            continue;
        }
        if (!isdefined(var_5415dfb9.bgbrarity)) {
            var_5415dfb9.bgbrarity = 0;
        }
        v.rarity = var_5415dfb9.bgbrarity;
        if (0 == v.rarity || 1 == v.rarity) {
            v.consumable = 0;
        } else {
            v.consumable = 1;
        }
        v.camo_index = var_5415dfb9.var_daefc551;
        v.dlc_index = var_ddcb67f4.dlc;
    }
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x12997996, Offset: 0x10a0
// Size: 0xd8
function private bgb_player_monitor() {
    self endon(#"disconnect");
    while (true) {
        waitresult = undefined;
        waitresult = level waittill(#"between_round_over", #"restart_round");
        str_return = waitresult._notify;
        if (isdefined(level.var_b77403b9)) {
            if (!(isdefined(self [[ level.var_b77403b9 ]]()) && self [[ level.var_b77403b9 ]]())) {
                continue;
            }
        }
        if (str_return === "restart_round") {
            level waittill(#"between_round_over");
        }
    }
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x4
// Checksum 0x40344e5e, Offset: 0x1180
// Size: 0x244
function private setup_devgui() {
    /#
        waittillframeend();
        setdvar(#"bgb_acquire_devgui", "<unknown string>");
        setdvar(#"hash_7877ee182ba11433", -1);
        bgb_devgui_base = "<unknown string>";
        keys = getarraykeys(level.bgb);
        foreach (key in keys) {
            name = function_9e72a96(level.bgb[key].name);
            adddebugcommand(bgb_devgui_base + name + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "<unknown string>");
        }
        adddebugcommand(bgb_devgui_base + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>");
        for (i = 0; i < 4; i++) {
            playernum = i + 1;
            adddebugcommand(bgb_devgui_base + "<unknown string>" + playernum + "<unknown string>" + "<unknown string>" + "<unknown string>" + i + "<unknown string>");
        }
        level thread bgb_devgui_think();
    #/
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x4
// Checksum 0x7b72272e, Offset: 0x13d0
// Size: 0x90
function private bgb_devgui_think() {
    /#
        for (;;) {
            var_522737d6 = getdvarstring(#"bgb_acquire_devgui");
            if (var_522737d6 != "<unknown string>") {
                bgb_devgui_acquire(var_522737d6);
            }
            setdvar(#"bgb_acquire_devgui", "<unknown string>");
            wait(0.5);
        }
    #/
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x4
// Checksum 0x6a748773, Offset: 0x1468
// Size: 0x146
function private bgb_devgui_acquire(bgb_name) {
    /#
        bgb_name = hash(bgb_name);
        playerid = getdvarint(#"hash_7877ee182ba11433", 0);
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (playerid != -1 && playerid != i) {
                continue;
            }
            if (#"none" == bgb_name) {
                players[i] thread take();
                continue;
            }
            players[i] bgb_gumball_anim(bgb_name);
            if (isdefined(level.bgb[bgb_name].activation_func)) {
                players[i] thread run_activation_func(bgb_name);
            }
        }
    #/
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x4
// Checksum 0x28158acb, Offset: 0x15b8
// Size: 0x142
function private bgb_debug_text_display_init() {
    /#
        self.bgb_debug_text = newdebughudelem(self);
        self.bgb_debug_text.elemtype = "<unknown string>";
        self.bgb_debug_text.font = "<unknown string>";
        self.bgb_debug_text.fontscale = 1.8;
        self.bgb_debug_text.horzalign = "<unknown string>";
        self.bgb_debug_text.vertalign = "<unknown string>";
        self.bgb_debug_text.alignx = "<unknown string>";
        self.bgb_debug_text.aligny = "<unknown string>";
        self.bgb_debug_text.x = 15;
        self.bgb_debug_text.y = 35;
        self.bgb_debug_text.sort = 2;
        self.bgb_debug_text.color = (1, 1, 1);
        self.bgb_debug_text.alpha = 1;
        self.bgb_debug_text.hidewheninmenu = 1;
    #/
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x4
// Checksum 0x5f1b83c0, Offset: 0x1708
// Size: 0x1be
function private bgb_set_debug_text(name, activations_remaining) {
    /#
        if (!isdefined(self.bgb_debug_text)) {
            return;
        }
        if (isdefined(activations_remaining)) {
        }
        self notify(#"bgb_set_debug_text_thread");
        self endon(#"bgb_set_debug_text_thread", #"disconnect");
        self.bgb_debug_text fadeovertime(0.05);
        self.bgb_debug_text.alpha = 1;
        prefix = "<unknown string>";
        short_name = name;
        if (issubstr(name, prefix)) {
            short_name = getsubstr(name, prefix.size);
        }
        if (isdefined(activations_remaining)) {
            self.bgb_debug_text settext("<unknown string>" + short_name + "<unknown string>" + activations_remaining + "<unknown string>");
        } else {
            self.bgb_debug_text settext("<unknown string>" + short_name);
        }
        wait(1);
        if (#"none" == name) {
            self.bgb_debug_text fadeovertime(1);
            self.bgb_debug_text.alpha = 0;
        }
    #/
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x0
// Checksum 0x9a6bd15, Offset: 0x18d0
// Size: 0x114
function bgb_print_stats(bgb) {
    /#
        printtoprightln(function_9e72a96(bgb) + "<unknown string>" + self.bgb_stats[bgb].var_c2a984f0, (1, 1, 1));
        printtoprightln(function_9e72a96(bgb) + "<unknown string>" + self.bgb_stats[bgb].bgb_used_this_game, (1, 1, 1));
        n_available = self.bgb_stats[bgb].var_c2a984f0 - self.bgb_stats[bgb].bgb_used_this_game;
        printtoprightln(function_9e72a96(bgb) + "<unknown string>" + n_available, (1, 1, 1));
    #/
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x5 linked
// Checksum 0x3f313718, Offset: 0x19f0
// Size: 0x6a
function private has_consumable_bgb(bgb) {
    if (!isdefined(self.bgb_stats[bgb]) || !(isdefined(level.bgb[bgb].consumable) && level.bgb[bgb].consumable)) {
        return 0;
    }
    return 1;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x3f4fd606, Offset: 0x1a68
// Size: 0xd4
function sub_consumable_bgb(bgb) {
    if (!has_consumable_bgb(bgb)) {
        return;
    }
    if (isdefined(level.bgb[bgb].var_f8d9ac8c) && ![[ level.bgb[bgb].var_f8d9ac8c ]]()) {
        return;
    }
    self.bgb_stats[bgb].bgb_used_this_game++;
    if (level flag::exists("first_consumables_used")) {
        level flag::set("first_consumables_used");
    }
    /#
        bgb_print_stats(bgb);
    #/
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xec47ff32, Offset: 0x1b48
// Size: 0xb2
function get_bgb_available(bgb) {
    if (!isdefined(bgb)) {
        return false;
    }
    if (!isdefined(self.bgb_stats[bgb])) {
        return true;
    }
    var_cb4d0349 = self.bgb_stats[bgb].var_c2a984f0;
    n_bgb_used_this_game = self.bgb_stats[bgb].bgb_used_this_game;
    n_bgb_remaining = var_cb4d0349 - n_bgb_used_this_game;
    if (isdefined(level.var_4af38aa3) && level.var_4af38aa3) {
        return true;
    }
    return 0 < n_bgb_remaining;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x5 linked
// Checksum 0x2406ffe3, Offset: 0x1c08
// Size: 0xd4
function private function_b331a28c(bgb) {
    if (!(isdefined(level.bgb[bgb].var_50206ca3) && level.bgb[bgb].var_50206ca3)) {
        return;
    }
    self val::set(#"bgb_activation", "takedamage", 0);
    s_result = undefined;
    s_result = self waittilltimeout(2, #"bgb_bubble_blow_complete");
    if (isdefined(self)) {
        self val::reset(#"bgb_activation", "takedamage");
    }
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x5 linked
// Checksum 0x94920a6f, Offset: 0x1ce8
// Size: 0x82
function private function_1f3eb76f(bgb) {
    if (!(isdefined(level.bgb[bgb].var_f1f46d6b) && level.bgb[bgb].var_f1f46d6b)) {
        return;
    }
    self.var_e75517b1 = 1;
    self waittilltimeout(2, #"bgb_bubble_blow_complete");
    if (isdefined(self)) {
        self.var_e75517b1 = 0;
    }
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xfb0827c7, Offset: 0x1d78
// Size: 0x2b8
function bgb_gumball_anim(bgb) {
    self endon(#"disconnect");
    level endon(#"end_game");
    if (self isinmovemode("ufo", "noclip")) {
        return false;
    }
    if (self laststand::player_is_in_laststand()) {
        return false;
    }
    weapon = bgb_get_gumball_anim_weapon(bgb);
    if (!isdefined(weapon)) {
        return false;
    }
    while (self isswitchingweapons() || self isusingoffhand() || self isthrowinggrenade() || self ismeleeing() || self function_61efcfe5() || self function_f071483d()) {
        waitframe(1);
    }
    while (isdefined(self.var_1d940ef6) && self.var_1d940ef6) {
        waitframe(1);
    }
    while (self getcurrentweapon() == level.weaponnone) {
        waitframe(1);
    }
    weapon_options = self calcweaponoptions(level.bgb[bgb].camo_index, 0, 0);
    self thread gestures::function_f3e2696f(bgb, weapon, weapon_options, 2.5, &function_16670e75, &function_3b2a02d8, &function_62f40b0d);
    while (self isswitchingweapons()) {
        waitframe(1);
    }
    evt = undefined;
    evt = self waittilltimeout(3, #"hash_593f920e9efd2ecd", #"bgb_gumball_anim_give");
    if (isdefined(evt) && evt.bgb === bgb) {
        if (evt._notify == #"bgb_gumball_anim_give") {
            return true;
        }
    }
    return false;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xf4696c04, Offset: 0x2038
// Size: 0x15c
function function_a6c704c(bgb) {
    self endon(#"disconnect");
    level endon(#"end_game");
    self thread function_b331a28c(bgb);
    self thread function_1f3eb76f(bgb);
    util::delay(#"offhand_fire", "death", &zm_audio::create_and_play_dialog, #"elixir", #"drink");
    if (isdefined(level.bgb[bgb].var_4a9b0cdc) && level.bgb[bgb].var_4a9b0cdc || self function_e98aa964(1)) {
        self notify(#"hash_27b238d082f65849", bgb);
        self activation_start();
        self thread run_activation_func(bgb);
        return true;
    }
    return false;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xc7adc818, Offset: 0x21a0
// Size: 0xb4
function run_activation_func(bgb) {
    self endon(#"disconnect");
    self set_active(1);
    self do_one_shot_use();
    self notify(#"bgb_bubble_blow_complete");
    self [[ level.bgb[bgb].activation_func ]]();
    self set_active(0);
    self activation_complete();
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x5 linked
// Checksum 0x4b23b282, Offset: 0x2260
// Size: 0x7c
function private bgb_get_gumball_anim_weapon(bgb) {
    var_ab8d8da3 = undefined;
    if (isdefined(level.bgb[bgb])) {
        n_rarity = level.bgb[bgb].rarity;
        if (isdefined(level.var_ddff6359) && isdefined(n_rarity)) {
            var_ab8d8da3 = level.var_ddff6359[n_rarity];
        }
    }
    return var_ab8d8da3;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x5dbd0001, Offset: 0x22e8
// Size: 0x5c
function function_16670e75(bgb) {
    if (!isdefined(self)) {
        return;
    }
    if (self laststand::player_is_in_laststand()) {
        return;
    }
    self thread function_b331a28c(bgb);
    self thread function_1f3eb76f(bgb);
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xc837ffa8, Offset: 0x2350
// Size: 0x2ec
function function_3b2a02d8(bgb) {
    if (!isdefined(self)) {
        return;
    }
    if (self laststand::player_is_in_laststand()) {
        return;
    }
    self notify(#"bgb_gumball_anim_give", {#bgb:bgb});
    self thread give(bgb);
    zm_audio::create_and_play_dialog(#"elixir", #"drink");
    self zm_stats::increment_client_stat("bgbs_chewed");
    self zm_stats::increment_player_stat("bgbs_chewed");
    self zm_stats::increment_challenge_stat(#"gum_gobbler_consume");
    self zm_stats::function_8f10788e("boas_bgbs_chewed");
    self zm_stats::function_c0c6ab19(#"hash_67f429ee3f93764d");
    if (level.bgb[bgb].rarity > 0) {
        self zm_stats::increment_challenge_stat(#"hash_41d41d501c70fb30");
    }
    self stats::inc_stat(#"bgb_stats", bgb, #"used", #"statvalue", 1);
    health = 0;
    if (isdefined(self.health)) {
        health = self.health;
    }
    if (isdefined(level.bgb[bgb].consumable) && level.bgb[bgb].consumable) {
        self luinotifyevent(#"zombie_bgb_used", 1, level.bgb[bgb].item_index);
    }
    self recordmapevent(4, gettime(), self.origin, level.round_number, level.bgb[bgb].stat_index, health);
    demo::bookmark(#"zm_player_bgb_grab", gettime(), self);
    potm::bookmark(#"zm_player_bgb_grab", gettime(), self);
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0x6faa34cd, Offset: 0x2648
// Size: 0x46
function function_62f40b0d(bgb, var_f3b15ce0) {
    if (!isdefined(self)) {
        return;
    }
    self notify(#"hash_593f920e9efd2ecd", {#bgb:bgb});
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x269c49f4, Offset: 0x2698
// Size: 0x7c
function private bgb_clear_monitors_and_clientfields() {
    self notify(#"bgb_limit_monitor");
    self notify(#"bgb_activation_monitor");
    self clientfield::set_player_uimodel("zmhud.bgb_display", 0);
    self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", 0);
    self clear_timer();
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x9b6cd048, Offset: 0x2720
// Size: 0x5dc
function private bgb_limit_monitor() {
    self notify(#"bgb_limit_monitor");
    self endon(#"bgb_limit_monitor", #"death", #"bgb_update");
    self clientfield::set_player_uimodel("zmhud.bgb_display", 1);
    self playsoundtoplayer(#"hash_56cc165edb993de8", self);
    switch (level.bgb[self.bgb].limit_type) {
    case #"activated":
        for (i = level.bgb[self.bgb].limit; i > 0; i--) {
            if (i != level.bgb[self.bgb].limit) {
                self playsoundtoplayer(#"hash_7bb31f4a25cf34a", self);
            }
            level.bgb[self.bgb].var_dbe7d224 = i;
            if (level.bgb[self.bgb].var_57eb02e) {
                function_f0d592c9();
            } else {
                self set_timer(i, level.bgb[self.bgb].limit);
            }
            self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", i);
            /#
                self thread bgb_set_debug_text(self.bgb, i);
            #/
            self waittill(#"bgb_activation");
            while (isdefined(self get_active()) && self get_active()) {
                waitframe(1);
            }
        }
        if (isdefined(self.bgb) && isdefined(level.bgb[self.bgb])) {
            level.bgb[self.bgb].var_dbe7d224 = 0;
        }
        self playsoundtoplayer(#"hash_b8e60131176554b", self);
        if (isdefined(self.bgb) && isdefined(level.bgb[self.bgb])) {
            self set_timer(0, level.bgb[self.bgb].limit);
        }
        while (isdefined(self.bgb_activation_in_progress) && self.bgb_activation_in_progress) {
            waitframe(1);
        }
        break;
    case #"time":
        /#
            self thread bgb_set_debug_text(self.bgb);
        #/
        self thread run_timer(level.bgb[self.bgb].limit);
        self waittill(#"hash_347d2afccb8337ab");
        self playsoundtoplayer(#"hash_b8e60131176554b", self);
        break;
    case #"rounds":
        /#
            self thread bgb_set_debug_text(self.bgb);
        #/
        count = level.bgb[self.bgb].limit + 1;
        for (i = 0; i < count; i++) {
            if (i != 0) {
                self playsoundtoplayer(#"hash_7bb31f4a25cf34a", self);
            }
            self set_timer(count - i, count);
            level waittill(#"end_of_round");
        }
        self playsoundtoplayer(#"hash_b8e60131176554b", self);
        break;
    case #"event":
        /#
            self thread bgb_set_debug_text(self.bgb);
        #/
        self bgb_set_timer_clientfield(1);
        self [[ level.bgb[self.bgb].limit ]]();
        self playsoundtoplayer(#"hash_b8e60131176554b", self);
        break;
    default:
        /#
            assert(0, "<unknown string>" + self.bgb + "<unknown string>" + level.bgb[self.bgb].limit_type + "<unknown string>");
        #/
        break;
    }
    self thread take();
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0xc453740b, Offset: 0x2d08
// Size: 0x94
function private bgb_bled_out_monitor() {
    self endon(#"disconnect", #"bgb_update");
    self notify(#"bgb_bled_out_monitor");
    self endon(#"bgb_bled_out_monitor");
    self waittill(#"bled_out");
    self notify(#"bgb_about_to_take_on_bled_out");
    wait(0.1);
    self thread take();
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x4
// Checksum 0xfc449ad8, Offset: 0x2da8
// Size: 0xd2
function private bgb_activation_monitor() {
    self endon(#"disconnect");
    self notify(#"bgb_activation_monitor");
    self endon(#"bgb_activation_monitor");
    if ("activated" != level.bgb[self.bgb].limit_type) {
        return;
    }
    for (;;) {
        self waittill(#"bgb_activation_request");
        waitframe(1);
        if (!self function_e98aa964(0)) {
            continue;
        }
        if (self function_a6c704c(self.bgb)) {
            self notify(#"bgb_activation", self.bgb);
        }
    }
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0xeeb79a51, Offset: 0x2e88
// Size: 0x18c
function function_e98aa964(var_3e37f503 = 0, str_check = self.bgb) {
    var_ceb582a8 = isdefined(level.bgb[str_check].validation_func) && !self [[ level.bgb[str_check].validation_func ]]();
    var_e6b14ccc = isdefined(level.var_67713b46) && !self [[ level.var_67713b46 ]]();
    if (!var_3e37f503 && isdefined(self.is_drinking) && self.is_drinking || isdefined(self.bgb_activation_in_progress) && self.bgb_activation_in_progress && !(isdefined(self.var_ec8a9710) && self.var_ec8a9710) || self laststand::player_is_in_laststand() || var_ceb582a8 || var_e6b14ccc || isdefined(self.var_16735873) && self.var_16735873 || isdefined(self.var_30cbff55) && self.var_30cbff55) {
        self clientfield::increment_uimodel("zmhud.bgb_invalid_use");
        return false;
    }
    return true;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x4
// Checksum 0xe0f85258, Offset: 0x3020
// Size: 0xbc
function private function_1fdcef80(bgb) {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    if (isdefined(level.bgb[bgb].var_5a047886) && level.bgb[bgb].var_5a047886) {
        function_9c8e12d1(6);
    } else {
        return;
    }
    self waittill(#"bgb_activation_request");
    self thread take();
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x4cd2cdec, Offset: 0x30e8
// Size: 0x4c
function function_9c8e12d1(n_value) {
    self setactionslot(1, "bgb");
    self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", n_value);
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x0
// Checksum 0x1d8a74a7, Offset: 0x3140
// Size: 0x2c
function function_f37655df(n_value) {
    self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", 0);
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xbfd207de, Offset: 0x3178
// Size: 0x2a
function function_57eb02e(name) {
    level.bgb[name].var_57eb02e = 1;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x330e3006, Offset: 0x31b0
// Size: 0x8c
function do_one_shot_use(skip_demo_bookmark = 0) {
    self clientfield::increment_uimodel("zmhud.bgb_one_shot_use");
    if (!skip_demo_bookmark) {
        demo::bookmark(#"zm_player_bgb_activate", gettime(), self);
        potm::bookmark(#"zm_player_bgb_activate", gettime(), self);
    }
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0x5e4fba5e, Offset: 0x3248
// Size: 0x12
function activation_start() {
    self.bgb_activation_in_progress = 1;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x96c71f57, Offset: 0x3268
// Size: 0x1e
function private activation_complete() {
    self.bgb_activation_in_progress = 0;
    self notify(#"activation_complete");
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x5 linked
// Checksum 0x81675e92, Offset: 0x3290
// Size: 0x1a
function private set_active(b_is_active) {
    self.bgb_active = b_is_active;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0x4470db23, Offset: 0x32b8
// Size: 0x18
function get_active() {
    return isdefined(self.bgb_active) && self.bgb_active;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x7d26294c, Offset: 0x32d8
// Size: 0x42
function is_active(name) {
    if (!isdefined(self.bgb)) {
        return false;
    }
    return self.bgb == name && isdefined(self.bgb_active) && self.bgb_active;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x0
// Checksum 0xabaffa6e, Offset: 0x3328
// Size: 0x92
function is_team_active(name) {
    foreach (player in level.players) {
        if (player is_active(name)) {
            return true;
        }
    }
    return false;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xb849adb8, Offset: 0x33c8
// Size: 0x64
function increment_ref_count(name) {
    if (!isdefined(level.bgb[name])) {
        return 0;
    }
    var_d1efe11 = level.bgb[name].ref_count;
    level.bgb[name].ref_count++;
    return var_d1efe11;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xe6d71343, Offset: 0x3438
// Size: 0x56
function decrement_ref_count(name) {
    if (!isdefined(level.bgb[name])) {
        return 0;
    }
    level.bgb[name].ref_count--;
    return level.bgb[name].ref_count;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x5 linked
// Checksum 0xc4734ee4, Offset: 0x3498
// Size: 0x92
function private calc_remaining_duration_lerp(start_time, end_time) {
    if (0 >= end_time - start_time) {
        return 0;
    }
    now = gettime();
    frac = float(end_time - now) / float(end_time - start_time);
    return math::clamp(frac, 0, 1);
}

// Namespace bgb/zm_bgb
// Params 3, eflags: 0x5 linked
// Checksum 0x7f524cec, Offset: 0x3538
// Size: 0x122
function private function_af43111c(var_f205d85d, percent, var_5f12e334 = 0) {
    self endon(#"disconnect", #"hash_6ae783a3051b411b");
    if (var_5f12e334) {
        self.var_4b0fb2fb = 1;
    }
    start_time = gettime();
    end_time = start_time + 1000;
    var_2cd46f25 = var_f205d85d;
    while (var_2cd46f25 > percent) {
        var_2cd46f25 = lerpfloat(percent, var_f205d85d, calc_remaining_duration_lerp(start_time, end_time));
        self clientfield::set_player_uimodel("zmhud.bgb_timer", var_2cd46f25);
        waitframe(1);
    }
    if (var_5f12e334) {
        self.var_76c47001 = var_2cd46f25;
        self.var_4b0fb2fb = undefined;
    }
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x5 linked
// Checksum 0x2696c7a1, Offset: 0x3668
// Size: 0xc4
function private bgb_set_timer_clientfield(percent, var_5f12e334 = 0) {
    self notify(#"hash_6ae783a3051b411b");
    var_f205d85d = self clientfield::get_player_uimodel("zmhud.bgb_timer");
    if (percent < var_f205d85d && 0.1 <= var_f205d85d - percent) {
        self thread function_af43111c(var_f205d85d, percent, var_5f12e334);
        return;
    }
    self clientfield::set_player_uimodel("zmhud.bgb_timer", percent);
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x5 linked
// Checksum 0x84385a9c, Offset: 0x3738
// Size: 0x1c
function private function_f0d592c9() {
    self bgb_set_timer_clientfield(1);
}

// Namespace bgb/zm_bgb
// Params 3, eflags: 0x1 linked
// Checksum 0xac2b698d, Offset: 0x3760
// Size: 0x64
function set_timer(current, max, var_5f12e334 = 0) {
    if (!(isdefined(self.var_4b0fb2fb) && self.var_4b0fb2fb)) {
        self bgb_set_timer_clientfield(current / max, var_5f12e334);
    }
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xa05e7ef8, Offset: 0x37d0
// Size: 0x146
function run_timer(max) {
    self endon(#"disconnect");
    self notify(#"bgb_run_timer");
    self endon(#"bgb_run_timer");
    current = max;
    self.var_ec8a9710 = 1;
    while (current > 0) {
        self set_timer(current, max);
        waitframe(1);
        if (isdefined(self.var_76c47001)) {
            current = max * self.var_76c47001;
            self.var_76c47001 = undefined;
            continue;
        }
        if (!(isdefined(self.var_4b0fb2fb) && self.var_4b0fb2fb)) {
            current = current - float(function_60d95f53()) / 1000;
        }
    }
    self notify(#"hash_347d2afccb8337ab");
    self clear_timer();
    self.var_ec8a9710 = undefined;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0x7569b22e, Offset: 0x3920
// Size: 0x2e
function clear_timer() {
    self bgb_set_timer_clientfield(0);
    self notify(#"bgb_run_timer");
}

// Namespace bgb/zm_bgb
// Params 7, eflags: 0x1 linked
// Checksum 0x9a63e2f5, Offset: 0x3958
// Size: 0x54e
function register(name, limit_type, limit, enable_func, disable_func, validation_func, activation_func) {
    /#
        assert(isdefined(name), "<unknown string>");
    #/
    /#
        assert(#"none" != name, "<unknown string>" + #"none" + "<unknown string>");
    #/
    /#
        assert(!isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(limit_type), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(limit), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(!isdefined(enable_func) || isfunctionptr(enable_func), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(!isdefined(disable_func) || isfunctionptr(disable_func), "<unknown string>" + name + "<unknown string>");
    #/
    switch (limit_type) {
    case #"activated":
        /#
            assert(!isdefined(validation_func) || isfunctionptr(validation_func), "<unknown string>" + name + "<unknown string>" + limit_type + "<unknown string>");
        #/
        /#
            assert(isdefined(activation_func), "<unknown string>" + name + "<unknown string>" + limit_type + "<unknown string>");
        #/
        /#
            assert(isfunctionptr(activation_func), "<unknown string>" + name + "<unknown string>" + limit_type + "<unknown string>");
        #/
    case #"time":
    case #"rounds":
        /#
            assert(isint(limit), "<unknown string>" + name + "<unknown string>" + limit + "<unknown string>" + limit_type + "<unknown string>");
        #/
        break;
    case #"event":
        /#
            assert(isfunctionptr(limit), "<unknown string>" + name + "<unknown string>" + limit_type + "<unknown string>");
        #/
        break;
    default:
        /#
            assert(0, "<unknown string>" + name + "<unknown string>" + limit_type + "<unknown string>");
        #/
        break;
    }
    level.bgb[name] = spawnstruct();
    level.bgb[name].name = name;
    level.bgb[name].limit_type = limit_type;
    level.bgb[name].limit = limit;
    level.bgb[name].enable_func = enable_func;
    level.bgb[name].disable_func = disable_func;
    level.bgb[name].validation_func = validation_func;
    if ("activated" == limit_type) {
        level.bgb[name].activation_func = activation_func;
        level.bgb[name].var_57eb02e = 0;
    }
    level.bgb[name].ref_count = 0;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0x34b09894, Offset: 0x3eb0
// Size: 0x72
function register_actor_damage_override(name, actor_damage_override_func) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].actor_damage_override_func = actor_damage_override_func;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0xc00e77fc, Offset: 0x3f30
// Size: 0x72
function register_vehicle_damage_override(name, vehicle_damage_override_func) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].vehicle_damage_override_func = vehicle_damage_override_func;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0x49aacfd, Offset: 0x3fb0
// Size: 0x72
function register_actor_death_override(name, actor_death_override_func) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].actor_death_override_func = actor_death_override_func;
}

// Namespace bgb/zm_bgb
// Params 3, eflags: 0x1 linked
// Checksum 0xc912ab30, Offset: 0x4030
// Size: 0x96
function register_lost_perk_override(name, lost_perk_override_func, lost_perk_override_func_always_run) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].lost_perk_override_func = lost_perk_override_func;
    level.bgb[name].lost_perk_override_func_always_run = lost_perk_override_func_always_run;
}

// Namespace bgb/zm_bgb
// Params 3, eflags: 0x1 linked
// Checksum 0x20357908, Offset: 0x40d0
// Size: 0x96
function function_c2721e81(name, add_to_player_score_override_func, add_to_player_score_override_func_always_run) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].add_to_player_score_override_func = add_to_player_score_override_func;
    level.bgb[name].add_to_player_score_override_func_always_run = add_to_player_score_override_func_always_run;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0xe908a2f1, Offset: 0x4170
// Size: 0x72
function function_72469efe(name, var_50206ca3) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].var_50206ca3 = var_50206ca3;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0x120462c4, Offset: 0x41f0
// Size: 0x72
function function_8a5d8cfb(name, var_f1f46d6b) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].var_f1f46d6b = var_f1f46d6b;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x0
// Checksum 0x9ffe911c, Offset: 0x4270
// Size: 0x72
function function_be42abb0(name, var_f8d9ac8c) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].var_f8d9ac8c = var_f8d9ac8c;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x0
// Checksum 0xc33da3ba, Offset: 0x42f0
// Size: 0x6a
function function_afe7b8e7(name) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].var_5a047886 = 1;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x6a2eeee8, Offset: 0x4368
// Size: 0x6a
function function_e1f37ce7(name) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].var_4a9b0cdc = 1;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0x1cc868df, Offset: 0x43e0
// Size: 0xa2
function function_1fee6b3(name, n_rank) {
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(n_rank), "<unknown string>" + name + "<unknown string>");
    #/
    level.bgb[name].var_a1750d43 = n_rank;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x827387c5, Offset: 0x4490
// Size: 0x224
function give(name) {
    self thread take();
    if (#"none" == name) {
        return;
    }
    /#
        assert(isdefined(level.bgb[name]), "<unknown string>" + name + "<unknown string>");
    #/
    self notify(#"bgb_update", {#var_826ddd38:self.bgb, #var_3aee8e4:name});
    self notify("bgb_update_give_" + name);
    self.bgb = name;
    self clientfield::set_player_uimodel("zmhud.bgb_current", level.bgb[name].item_index);
    self luinotifyevent(#"zombie_bgb_notification", 1, level.bgb[name].item_index);
    self luinotifyeventtospectators(#"zombie_bgb_notification", 1, level.bgb[name].item_index);
    if (isdefined(level.bgb[name].enable_func)) {
        self thread [[ level.bgb[name].enable_func ]]();
    }
    if (isdefined("activated" == level.bgb[name].limit_type)) {
        self setactionslot(1, "bgb");
    }
    self thread bgb_limit_monitor();
    self thread bgb_bled_out_monitor();
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0xd2412ecd, Offset: 0x46c0
// Size: 0x132
function take() {
    if (#"none" == self.bgb) {
        return;
    }
    self setactionslot(1, "");
    /#
        self thread bgb_set_debug_text(#"none");
    #/
    if (isdefined(level.bgb[self.bgb].disable_func)) {
        self thread [[ level.bgb[self.bgb].disable_func ]]();
    }
    self bgb_clear_monitors_and_clientfields();
    self notify(#"bgb_update", {#var_826ddd38:self.bgb, #var_3aee8e4:#"none"});
    self notify("bgb_update_take_" + self.bgb);
    self.bgb = #"none";
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0xe26da328, Offset: 0x4800
// Size: 0x4c
function get_enabled() {
    if (isplayer(self) && isdefined(self.bgb)) {
        return self.bgb;
    }
    return #"none";
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x4f686d15, Offset: 0x4858
// Size: 0x58
function is_enabled(name) {
    /#
        assert(isdefined(self.bgb));
    #/
    if (!isdefined(self) || !isdefined(self.bgb)) {
        return false;
    }
    return self.bgb === name;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x0
// Checksum 0x5b044e23, Offset: 0x48b8
// Size: 0x3c
function any_enabled() {
    /#
        assert(isdefined(self.bgb));
    #/
    return self.bgb !== #"none";
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x5dc8c478, Offset: 0x4900
// Size: 0xb4
function is_team_enabled(bgb_name) {
    foreach (player in util::get_players()) {
        /#
            assert(isdefined(player.bgb));
        #/
        if (player.bgb === bgb_name) {
            return true;
        }
    }
    return false;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0x29fd684e, Offset: 0x49c0
// Size: 0x88
function get_player_dropped_powerup_origin() {
    powerup_origin = self.origin + vectorscale(anglestoforward((0, self getplayerangles()[1], 0)), 60) + vectorscale((0, 0, 1), 5);
    self zm_stats::increment_challenge_stat(#"gum_gobbler_powerups");
    return powerup_origin;
}

// Namespace bgb/zm_bgb
// Params 3, eflags: 0x1 linked
// Checksum 0xa3bcf930, Offset: 0x4a50
// Size: 0xbc
function function_c6cd71d5(str_powerup, v_origin = self get_player_dropped_powerup_origin(), var_22a4c702) {
    e_powerup = zm_powerups::specific_powerup_drop(str_powerup, v_origin, undefined, 0.1, undefined, undefined, 1, 1, 1, 1);
    e_powerup.e_player_owner = self;
    if (isplayer(self)) {
        self zm_stats::increment_challenge_stat(#"hash_3ebae93ea866519c");
    }
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0xd250fd05, Offset: 0x4b18
// Size: 0x260
function function_9d8118f5(v_origin) {
    if (!self isonground() && !self isplayerswimming()) {
        return 0;
    }
    if (!isdefined(v_origin)) {
        v_origin = self get_player_dropped_powerup_origin();
    }
    var_116b3a00 = 1;
    var_806b07bd = util::spawn_model("tag_origin", v_origin + (0, 0, 40));
    v_origin = var_806b07bd.origin;
    if (isdefined(var_806b07bd) && !var_806b07bd zm_player::in_enabled_playable_area(96) && !var_806b07bd zm_player::in_life_brush()) {
        var_116b3a00 = 0;
    }
    if (self zm_utility::function_ab9a9770() || var_806b07bd zm_utility::function_ab9a9770()) {
        var_116b3a00 = 0;
    }
    v_close = getclosestpointonnavmesh(v_origin, 128, 24);
    if (var_116b3a00 && (!isdefined(v_close) || v_close[2] - v_origin[2] > 40 / 4) && !self isplayerswimming()) {
        var_116b3a00 = 0;
    }
    if (var_116b3a00 && !(isdefined(bullettracepassed(self geteye(), v_origin, 0, self, undefined, 0, 1)) && bullettracepassed(self geteye(), v_origin, 0, self, undefined, 0, 1))) {
        var_116b3a00 = 0;
    }
    if (isdefined(var_806b07bd)) {
        var_806b07bd delete();
    }
    return var_116b3a00;
}

// Namespace bgb/zm_bgb
// Params 12, eflags: 0x1 linked
// Checksum 0x274d0e88, Offset: 0x4d80
// Size: 0x13e
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isplayer(attacker)) {
        name = attacker get_enabled();
        if (name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].actor_damage_override_func)) {
            damage = [[ level.bgb[name].actor_damage_override_func ]](inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
        }
    }
    return damage;
}

// Namespace bgb/zm_bgb
// Params f, eflags: 0x1 linked
// Checksum 0xa05e1c2d, Offset: 0x4ec8
// Size: 0x182
function vehicle_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return idamage;
    }
    if (isplayer(eattacker)) {
        name = eattacker get_enabled();
        if (name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].vehicle_damage_override_func)) {
            idamage = [[ level.bgb[name].vehicle_damage_override_func ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
        }
    }
    return idamage;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x8c7beea8, Offset: 0x5058
// Size: 0xe2
function actor_death_override(attacker) {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return 0;
    }
    if (isplayer(attacker)) {
        name = attacker get_enabled();
        if (name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].actor_death_override_func)) {
            damage = [[ level.bgb[name].actor_death_override_func ]](attacker);
        }
    }
    return damage;
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x1 linked
// Checksum 0x1ac5315b, Offset: 0x5148
// Size: 0x234
function lost_perk_override(perk) {
    b_result = 0;
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return b_result;
    }
    keys = getarraykeys(level.bgb);
    for (i = 0; i < keys.size; i++) {
        name = keys[i];
        if (isdefined(level.bgb[name].lost_perk_override_func_always_run) && level.bgb[name].lost_perk_override_func_always_run && isdefined(level.bgb[name].lost_perk_override_func)) {
            b_result = [[ level.bgb[name].lost_perk_override_func ]](perk, self, undefined);
            if (b_result) {
                return b_result;
            }
        }
    }
    foreach (player in level.activeplayers) {
        name = player get_enabled();
        if (name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].lost_perk_override_func)) {
            b_result = [[ level.bgb[name].lost_perk_override_func ]](perk, self, player);
            if (b_result) {
                return b_result;
            }
        }
    }
    return b_result;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0xd8422194, Offset: 0x5388
// Size: 0x1c6
function add_to_player_score_override(n_points, str_awarded_by) {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return n_points;
    }
    str_enabled = self get_enabled();
    keys = getarraykeys(level.bgb);
    for (i = 0; i < keys.size; i++) {
        str_bgb = keys[i];
        if (str_bgb === str_enabled) {
            continue;
        }
        if (isdefined(level.bgb[str_bgb].add_to_player_score_override_func_always_run) && level.bgb[str_bgb].add_to_player_score_override_func_always_run && isdefined(level.bgb[str_bgb].add_to_player_score_override_func)) {
            n_points = [[ level.bgb[str_bgb].add_to_player_score_override_func ]](n_points, str_awarded_by, 0);
        }
    }
    if (str_enabled !== #"none" && isdefined(level.bgb[str_enabled]) && isdefined(level.bgb[str_enabled].add_to_player_score_override_func)) {
        n_points = [[ level.bgb[str_enabled].add_to_player_score_override_func ]](n_points, str_awarded_by, 1);
    }
    return n_points;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x0
// Checksum 0xbdd710b7, Offset: 0x5558
// Size: 0xbe
function function_3fa57f3f() {
    keys = array::randomize(getarraykeys(level.bgb));
    for (i = 0; i < keys.size; i++) {
        if (level.bgb[keys[i]].rarity != 1) {
            continue;
        }
        if (level.bgb[keys[i]].dlc_index > 0) {
            continue;
        }
        return keys[i];
    }
}

// Namespace bgb/zm_bgb
// Params 3, eflags: 0x1 linked
// Checksum 0x5676b58f, Offset: 0x5620
// Size: 0x1fa
function function_f51e3503(n_max_distance, var_5250f4f6, var_8bc18989) {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    self.var_9c42f3fe = [];
    while (true) {
        foreach (e_player in level.players) {
            if (e_player == self) {
                continue;
            }
            array::remove_undefined(self.var_9c42f3fe);
            var_fd14be26 = array::contains(self.var_9c42f3fe, e_player);
            var_d9cac58e = zm_utility::is_player_valid(e_player, 0, 1) && function_b70b2809(n_max_distance, self, e_player);
            if (!var_fd14be26 && var_d9cac58e) {
                array::add(self.var_9c42f3fe, e_player, 0);
                if (isdefined(var_5250f4f6)) {
                    self thread [[ var_5250f4f6 ]](e_player);
                }
                continue;
            }
            if (var_fd14be26 && !var_d9cac58e) {
                arrayremovevalue(self.var_9c42f3fe, e_player);
                if (isdefined(var_8bc18989)) {
                    self thread [[ var_8bc18989 ]](e_player);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace bgb/zm_bgb
// Params 3, eflags: 0x5 linked
// Checksum 0x71d6604, Offset: 0x5828
// Size: 0x7c
function private function_b70b2809(n_distance, var_7b235bec, var_f8084a8) {
    var_8c1c6c8d = n_distance * n_distance;
    var_a91ae6d4 = distancesquared(var_7b235bec.origin, var_f8084a8.origin);
    if (var_a91ae6d4 <= var_8c1c6c8d) {
        return true;
    }
    return false;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0x63a37a12, Offset: 0x58b0
// Size: 0x24
function function_b57e693f() {
    self clientfield::increment_uimodel("zmhud.bgb_invalid_use");
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0x7ca47afc, Offset: 0x58e0
// Size: 0x24
function suspend_weapon_cycling() {
    self flag::clear("bgb_weapon_cycling");
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0x1c99f5d0, Offset: 0x5910
// Size: 0x24
function resume_weapon_cycling() {
    self flag::set("bgb_weapon_cycling");
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0xfed0e172, Offset: 0x5940
// Size: 0x64
function init_weapon_cycling() {
    if (!self flag::exists("bgb_weapon_cycling")) {
        self flag::init("bgb_weapon_cycling");
    }
    self flag::set("bgb_weapon_cycling");
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x0
// Checksum 0x47877f48, Offset: 0x59b0
// Size: 0x24
function function_303bde69() {
    self flag::wait_till("bgb_weapon_cycling");
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x1 linked
// Checksum 0x4c324aac, Offset: 0x59e0
// Size: 0x13c
function function_bd839f2c(e_reviver, var_84280a99) {
    if (isdefined(self.var_bdeb0f02) && self.var_bdeb0f02 || isdefined(e_reviver) && isdefined(self.bgb) && self is_enabled(#"zm_bgb_near_death_experience") || isdefined(e_reviver) && isdefined(e_reviver.bgb) && e_reviver is_enabled(#"zm_bgb_near_death_experience") || isdefined(e_reviver) && isdefined(self.bgb) && self is_enabled(#"zm_bgb_phoenix_up") || isdefined(e_reviver) && isdefined(e_reviver.bgb) && e_reviver is_enabled(#"zm_bgb_phoenix_up") || isdefined(var_84280a99)) {
        return true;
    }
    return false;
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0xea1d3aaa, Offset: 0x5b28
// Size: 0xae
function bgb_revive_watcher() {
    self endon(#"disconnect", #"death");
    self.var_bdeb0f02 = 1;
    waitresult = undefined;
    waitresult = self waittill(#"player_revived");
    e_reviver = waitresult.reviver;
    waitframe(1);
    if (isdefined(self.var_bdeb0f02) && self.var_bdeb0f02) {
        self notify(#"bgb_revive");
        self.var_bdeb0f02 = undefined;
    }
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x1 linked
// Checksum 0xab1ab3e0, Offset: 0x5be0
// Size: 0x24
function function_69b88b5() {
    if (!(isdefined(self.ready_for_score_events) && self.ready_for_score_events)) {
        return false;
    }
    return true;
}

