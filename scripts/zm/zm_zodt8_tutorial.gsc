// Atian COD Tools GSC decompiler test
#using script_25ddb1c7bb44652e;
#using scripts\core_common\struct.gsc;
#using scripts\zm\zm_zodt8_pap_quest.gsc;
#using scripts\zm\zm_zodt8.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_zodt8_tutorial;

// Namespace zm_zodt8_tutorial/level_init
// Params 1, eflags: 0x40
// Checksum 0x55f23506, Offset: 0x1820
// Size: 0x374
function event_handler[level_init] main(eventstruct) {
    if (util::get_game_type() != "ztutorial") {
        return;
    }
    setgametypesetting(#"zmtalismansenabled", 0);
    level.var_a4ad706d = array();
    level.var_2d479d61 = array();
    level.weaponbasemelee = getweapon(#"knife");
    clientfield::register("actor", "tutorial_keyline_fx", 1, 2, "int");
    clientfield::register("zbarrier", "tutorial_keyline_fx", 1, 2, "int");
    clientfield::register("item", "tutorial_keyline_fx", 1, 2, "int");
    clientfield::register("scriptmover", "tutorial_keyline_fx", 1, 2, "int");
    clientfield::register("scriptmover", "" + #"hash_1b509b0ba634a25a", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_1390e08de02cbdc7", 1, 1, "int");
    clientfield::register("worlduimodel", "hudItems.ztut.showLocation", 1, 1, "int");
    clientfield::register("worlduimodel", "hudItems.ztut.showPerks", 1, 1, "int");
    clientfield::register("worlduimodel", "hudItems.ztut.showEquipment", 1, 1, "int");
    clientfield::register("worlduimodel", "hudItems.ztut.showShield", 1, 1, "int");
    clientfield::register("worlduimodel", "hudItems.ztut.showSpecial", 1, 1, "int");
    clientfield::register("worlduimodel", "hudItems.ztut.showElixirs", 1, 1, "int");
    callback::on_spawned(&on_player_spawned);
    init_level_vars();
    level.zm_tut_hint_text = zm_tut_hint_text::register("zm_tut_hint_text");
    level thread tutorial();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xd99b69cd, Offset: 0x1ba0
// Size: 0x20c
function init_level_vars() {
    function_7573a994();
    level flag::init("tutorial_reset");
    level flag::init("tutorial_intro_screen_over");
    level flag::init("tutorial_vo_playing");
    level.fn_custom_round_ai_spawn = undefined;
    level.var_e52901a5 = 1;
    level.var_3c8ad64b = -1;
    level.var_fdba6f4b = &function_558fab23;
    level.var_7e3a9cf2 = &function_69b9de8b;
    level.var_fd2e6f70 = &function_b5000f75;
    level.player_death_override = &tutorial_reset;
    level.zm_bgb_anywhere_but_here_validation_override = &function_170ff027;
    level.var_f44e37f7 = &function_55fb48a3;
    level.player_out_of_playable_area_override = &function_912b7df6;
    level.var_77805e8 = &function_99bc766a;
    level._supress_survived_screen = 1;
    level.disablescoreevents = 1;
    level.zm_disable_recording_stats = 1;
    level._effect[#"spawn_fx"] = #"maps/zm_office/fx8_teleporter_destination";
    zm_transform::function_cfca77a7(getentarray("zombie_spawner_catalyst_plasma", "targetname")[0], "catalyst_plasma_tutorial", undefined, 5, undefined, undefined, "aib_vign_zm_zod_catalyst_plasma_spawn_pre_split_tutorial", "aib_vign_zm_zod_catalyst_plasma_spawn_post_split_tutorial");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x3a20759b, Offset: 0x1db8
// Size: 0x6
function function_912b7df6() {
    return 0;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x7f88f72, Offset: 0x1dc8
// Size: 0x13a
function function_99bc766a() {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] setclientuivisibilityflag("weapon_hud_visible", 0);
        players[i] setclientminiscoreboardhide(1);
        players[i] notify(#"report_bgb_consumption");
        players[i] notify(#"hide_equipment_hint_text");
    }
    if (isdefined(level.tutorial_complete) && level.tutorial_complete) {
        luinotifyevent(#"tutorial_complete", 0);
        self lui::screen_fade_in(1);
        wait(10);
    }
    exitlevel(0);
    wait(666);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xed27ff2a, Offset: 0x1f10
// Size: 0x10
function function_69b9de8b(drop_point) {
    return 1;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x87b526c, Offset: 0x1f28
// Size: 0xce
function function_b5000f75(a_items) {
    var_87d63a46 = getent("tutorial_forced_shield_part", "targetname");
    /#
        assert(isdefined(var_87d63a46));
    #/
    for (i = 0; i < a_items.size; i++) {
        if (a_items[i] == var_87d63a46) {
            temp = a_items[0];
            a_items[0] = a_items[i];
            a_items[i] = temp;
            break;
        }
    }
    return a_items;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x30fab480, Offset: 0x2000
// Size: 0x54
function freeze_player_controls() {
    self val::set("tutorial_reset", "freezecontrols", 1);
    self val::set("tutorial_reset", "disable_weapons", 1);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xe1aa4c0e, Offset: 0x2060
// Size: 0x54
function function_e326c0a() {
    self val::reset("tutorial_reset", "freezecontrols");
    self val::reset("tutorial_reset", "disable_weapons");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x5eb3773a, Offset: 0x20c0
// Size: 0x11e
function function_3b618e30() {
    foreach (zombie in level.var_a4ad706d) {
        if (isdefined(zombie)) {
            zombie delete();
        }
    }
    level.var_a4ad706d = [];
    foreach (zombie in level.var_2d479d61) {
        if (isdefined(zombie)) {
            zombie delete();
        }
    }
    level.var_2d479d61 = [];
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x38a9b6aa, Offset: 0x21e8
// Size: 0x2d8
function tutorial_reset() {
    if (isbot(self)) {
        return 0;
    }
    if (level flag::get("tutorial_reset") || isdefined(self.var_16735873) && self.var_16735873) {
        return 1;
    }
    level notify(#"tutorial_reset");
    level flag::set("tutorial_reset");
    self freeze_player_controls();
    self lui::screen_fade_out(0.5, "white");
    if (self.health <= 50 && !isdefined(self.var_c507ebff)) {
        level thread function_68da8e33(#"hash_7d2285e610794ffa");
        self.var_c507ebff = 1;
    }
    self.health = self.maxhealth;
    var_32bd680d = self getweaponslistprimaries();
    foreach (w_primary in var_32bd680d) {
        self setweaponammoclip(w_primary, w_primary.clipsize);
        self givemaxammo(w_primary);
    }
    if (isdefined(self.reset_score)) {
        self function_2b4bf122(self.reset_score);
    }
    function_3b618e30();
    if (isdefined(level.tutorial_reset)) {
        self [[ level.tutorial_reset ]]();
    }
    wait(0.5);
    self lui::screen_fade_in(0.5, "white");
    self function_e326c0a();
    self setstance("stand");
    level flag::clear("tutorial_reset");
    return 1;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x9b66a8f0, Offset: 0x24c8
// Size: 0x5a
function function_170ff027() {
    node = getnode("tutorial_elixers", "targetname");
    return isdefined(node) && isdefined(node.origin) && isdefined(node.angles);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x9068fecb, Offset: 0x2530
// Size: 0x3a
function function_55fb48a3() {
    level notify(#"hash_1223834837d857ba");
    return getnode("tutorial_elixers", "targetname");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xc0f5b64, Offset: 0x2578
// Size: 0x5c
function function_b40c8992(toggle) {
    if (isdefined(toggle) && toggle) {
        level flag::set("spawn_zombies");
    } else {
        level flag::clear("spawn_zombies");
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xa10e2309, Offset: 0x25e0
// Size: 0x52
function function_7573a994() {
    var_3bb5fb6b = "grand_stair_lower_chest";
    level.random_pandora_box_start = 0;
    level.start_chest_name = var_3bb5fb6b;
    level.open_chest_location = [];
    level.open_chest_location[0] = var_3bb5fb6b;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xe3201107, Offset: 0x2640
// Size: 0x1de
function on_player_spawned() {
    if (isbot(self)) {
        /#
            assert(!isdefined(level.var_d0bc9e33));
        #/
        level.var_d0bc9e33 = self;
        self.dontspeak = 1;
        self endon(#"disconnect");
        self zm_laststand::function_3d685b5f(0);
        self ai::set_behavior_attribute("control", "autonomous");
        self zm_audio::function_654ec86b();
        self waittill(#"death");
        level.var_d0bc9e33 = undefined;
    } else if (isplayer(self)) {
        /#
            assert(!isdefined(level.var_6e2a2ea1));
        #/
        level.var_6e2a2ea1 = self;
        self endon(#"disconnect");
        self bgb_pack::function_da912bff(0, 1);
        self bgb_pack::function_da912bff(1, 1);
        self bgb_pack::function_da912bff(3, 1);
        self thread function_57bf8455();
        self waittill(#"death");
        level.var_6e2a2ea1 = undefined;
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x906c0c22, Offset: 0x2828
// Size: 0x15e
function function_57bf8455() {
    self endon(#"death");
    while (1) {
        var_f7dae996 = 0;
        var_32bd680d = self getweaponslistprimaries();
        foreach (w_primary in var_32bd680d) {
            if (self getweaponammostock(w_primary) > 0 || self getweaponammoclip(w_primary) > 0) {
                var_f7dae996 = 1;
            }
        }
        if (isdefined(var_f7dae996) && !var_f7dae996) {
            if (!isdefined(self.var_21c47e5c)) {
                level thread function_68da8e33(#"hash_3d2e3c2f451c8e2a");
                self.var_21c47e5c = 1;
            }
            tutorial_reset();
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x8afad546, Offset: 0x2990
// Size: 0x100
function open_door(str_door_name) {
    a_e_zombie_doors = getentarray(str_door_name, "target");
    foreach (zombie_door in a_e_zombie_doors) {
        zombie_door notify(#"trigger", {#is_forced:1, #activator:zombie_door});
        if (str_door_name == "library_boat_deck_door") {
            zombie_door playsound(#"hash_4bddd546f43487cf");
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x5a8b041f, Offset: 0x2a98
// Size: 0x74
function function_204dd117(targetname) {
    node = getnode(targetname, "targetname");
    self setorigin(node.origin);
    self setplayerangles(node.angles);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xf6595c94, Offset: 0x2b18
// Size: 0x124
function function_f1376337(num) {
    if (num == 0) {
        clientfield::set_world_uimodel("hudItems.ztut.showLocation", 1);
    } else if (num == 1) {
        clientfield::set_world_uimodel("hudItems.ztut.showPerks", 1);
    } else if (num == 2) {
        clientfield::set_world_uimodel("hudItems.ztut.showEquipment", 1);
    } else if (num == 3) {
        clientfield::set_world_uimodel("hudItems.ztut.showShield", 1);
    } else if (num == 4) {
        clientfield::set_world_uimodel("hudItems.ztut.showSpecial", 1);
    } else if (num == 5) {
        clientfield::set_world_uimodel("hudItems.ztut.showElixirs", 1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xdf3e1b49, Offset: 0x2c48
// Size: 0x1a
function function_6e9fe428(reset) {
    level.tutorial_reset = reset;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xee93f55a, Offset: 0x2c70
// Size: 0x1c
function function_a09d93d9() {
    function_6e9fe428(undefined);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x8e265e74, Offset: 0x2c98
// Size: 0x76
function function_9e5ac2a4() {
    waitframe(3);
    s_spawn_pos = self.s_spawn_pos;
    self forceteleport(s_spawn_pos.origin, s_spawn_pos.angles);
    self notify(#"risen", {#find_flesh_struct_string:self.script_string});
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 4, eflags: 0x1 linked
// Checksum 0xba09364d, Offset: 0x2d18
// Size: 0x638
function function_cf5f5964(spawnerstr, ignore = 0, bot = undefined, b_play_fx = 0) {
    level endon(#"tutorial_reset");
    s_spawn_pos = struct::get(spawnerstr, "targetname");
    a_spawners = getentarray("spawner_zm_zombie", "targetname");
    spawner = a_spawners[randomint(a_spawners.size)];
    zombie = undefined;
    while (!isdefined(zombie)) {
        zombie = zombie_utility::spawn_zombie(spawner);
        if (!isdefined(zombie)) {
            waitframe(1);
        }
    }
    zombie.s_spawn_pos = s_spawn_pos;
    zombie.script_string = "find_flesh";
    zombie.custom_location = &function_9e5ac2a4;
    zombie.b_ignore_cleanup = 1;
    if (b_play_fx) {
        v_forward = anglestoforward(s_spawn_pos.angles);
        playfx(level._effect[#"spawn_fx"], s_spawn_pos.origin, v_forward);
        playsoundatposition(#"hash_5c3c35d4b961c962", s_spawn_pos.origin);
    }
    foreach (str in array("tutorial_zm_spawner_barrier")) {
        if (str == spawnerstr) {
            foreach (exterior_goal in level.exterior_goals) {
                if (distancesquared(s_spawn_pos.origin, exterior_goal.origin) < 100 * 100) {
                    zombie.script_string = exterior_goal.script_string;
                    break;
                }
            }
        }
    }
    if (isdefined(zombie)) {
        if (ignore) {
            if (!isdefined(level.var_2d479d61)) {
                level.var_2d479d61 = [];
            } else if (!isarray(level.var_2d479d61)) {
                level.var_2d479d61 = array(level.var_2d479d61);
            }
            level.var_2d479d61[level.var_2d479d61.size] = zombie;
            array::remove_undefined(level.var_2d479d61);
        } else {
            if (!isdefined(level.var_a4ad706d)) {
                level.var_a4ad706d = [];
            } else if (!isarray(level.var_a4ad706d)) {
                level.var_a4ad706d = array(level.var_a4ad706d);
            }
            level.var_a4ad706d[level.var_a4ad706d.size] = zombie;
            array::remove_undefined(level.var_a4ad706d);
        }
        zombie.favoriteenemy = level.var_6e2a2ea1;
        if (spawnerstr == "tutorial_catalyst_spawner") {
            zombie setcandamage(0);
            zombie.var_f256a4d9 = 0;
            wait(1);
            zm_transform::function_9acf76e6(zombie, "catalyst_plasma_tutorial");
            level endon(#"transformation_interrupted");
            eventstruct = undefined;
            eventstruct = level waittill(#"transformation_complete");
            zombie = eventstruct.var_944250d2[0];
        }
        if (isdefined(bot)) {
            /#
                assert(isbot(bot));
            #/
            bot setentitytarget(zombie);
        }
    }
    level notify(#"hash_1de610a8af6a216f", {#var_e0d94658:zombie});
    if (s_spawn_pos.targetname == "tutorial_zm_spawner_points_3" || s_spawn_pos.targetname == "tutorial_zm_spawner_points_4") {
        a_s_spot = struct::get_array("zone_state_rooms_rear_spawns", "targetname");
        arraysortclosest(a_s_spot, zombie.origin);
        zombie thread zm_spawner::function_45bb11e4(a_s_spot[0]);
    }
    return zombie;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 2, eflags: 0x1 linked
// Checksum 0x31846c6, Offset: 0x3358
// Size: 0xb8
function function_fac53b63(var_70b300bb, b_play_fx) {
    level endon(#"tutorial_reset");
    foreach (spawnerstr in var_70b300bb) {
        if (spawnerstr == "tutorial_zm_spawner_points_4") {
            wait(3);
        }
        function_cf5f5964(spawnerstr, undefined, undefined, b_play_fx);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xcb6ee422, Offset: 0x3418
// Size: 0x5e
function function_fb2e7309() {
    while (level.var_a4ad706d.size > 0 || level flag::get("tutorial_reset")) {
        function_1eaaceab(level.var_a4ad706d);
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 2, eflags: 0x1 linked
// Checksum 0x99c576b8, Offset: 0x3480
// Size: 0xa4
function function_5ea0763f(var_50e34230, activator = undefined) {
    trig = getent(var_50e34230, "targetname");
    while (1) {
        eventstruct = undefined;
        eventstruct = trig waittill(#"trigger");
        if (!isdefined(activator) || activator == eventstruct.activator) {
            break;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x1a01bf5f, Offset: 0x3530
// Size: 0x74
function function_2b4bf122(points) {
    if (self.score < points) {
        self zm_score::add_to_player_score(points - self.score);
    } else if (self.score > points) {
        self zm_score::minus_to_player_score(self.score - points, 1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x9d14ebf1, Offset: 0x35b0
// Size: 0x64
function function_3fe47ed7(weaponname) {
    weapon = getweapon(weaponname);
    /#
        assert(isdefined(weapon));
    #/
    self giveweapon(weapon);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x4641e, Offset: 0x3620
// Size: 0x54
function function_c9f9f3bb(nodename) {
    node = getnode(nodename, "targetname");
    self setgoal(node, 1);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x7d0d9d84, Offset: 0x3680
// Size: 0x9c
function function_43b2606b() {
    self zm_perks::function_4acf7b43(0, #"specialty_staminup");
    self zm_perks::function_4acf7b43(1, #"specialty_extraammo");
    self zm_perks::function_4acf7b43(2, #"specialty_cooldown");
    self zm_perks::function_4acf7b43(3, #"specialty_deadshot");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x67357ac2, Offset: 0x3728
// Size: 0x224
function function_f761f5e4() {
    self.dontspeak = 1;
    zm_characters::set_character(array(#"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6"));
    self.var_c27f1e90[0] = #"specialty_staminup";
    self.var_c27f1e90[1] = #"specialty_extraammo";
    self.var_c27f1e90[2] = #"specialty_cooldown";
    self.var_c27f1e90[3] = #"specialty_deadshot";
    self.var_47654123[0] = 0;
    self.var_47654123[1] = 0;
    self.var_47654123[2] = 0;
    self.var_47654123[3] = 0;
    self.bgb_pack[0] = "zm_bgb_arsenal_accelerator";
    self.bgb_pack[1] = "zm_bgb_danger_closest";
    self.bgb_pack[2] = "zm_bgb_anywhere_but_here";
    self.bgb_pack[3] = "zm_bgb_always_done_swiftly";
    for (i = 0; i < 4; i++) {
        if (isdefined(self.bgb_pack[i]) && isdefined(level.bgb[self.bgb_pack[i]])) {
            self bgb_pack::function_7b91e81c(i, level.bgb[self.bgb_pack[i]].item_index);
        }
    }
    self freeze_player_controls();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x462b18b9, Offset: 0x3958
// Size: 0x328
function tutorial() {
    level endon(#"end_game");
    level.var_ecdc2cb1 = getgametypesetting(#"zmdifficulty");
    setgametypesetting(#"zmdifficulty", 1);
    waitframe(1);
    level.var_4c2cc614 = &function_6313c411;
    level.var_851fb552 = spawn("script_origin", (0, 0, 0));
    function_b40c8992(0);
    level.player_out_of_playable_area_monitor = 0;
    level flag::wait_till("all_players_connected");
    level.var_6e2a2ea1 function_f761f5e4();
    zombie_utility::set_zombie_var(#"zombie_use_failsafe", 0);
    level flag::set(#"disable_fast_travel");
    function_d1dabace();
    level thread function_e30183a6();
    open_door("engine_room_door");
    level function_f1376337(0);
    level flag::wait_till("start_zombie_round_logic");
    waittillframeend();
    level.var_6e2a2ea1 zm_laststand::function_3d685b5f(0);
    switch (level.var_ecdc2cb1) {
    case 0:
        level.var_6e2a2ea1 function_513e90cf();
    case 1:
        level.var_6e2a2ea1 function_bfd3a7b1();
        break;
    }
    level.var_6e2a2ea1 function_e0c7d69(0);
    self thread lui::screen_fade_out(3);
    clientfield::set_world_uimodel("hudItems.ztut.showLocation", 0);
    wait(1);
    function_cc60408f(array(#"hash_48af8239068e44f2", #"hash_53d43a46bc0ebcd8"), "end_game");
    music::setmusicstate("zodt8_death");
    level.tutorial_complete = 1;
    level notify(#"end_game");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x55a80dee, Offset: 0x3c88
// Size: 0x24
function function_558fab23() {
    level flag::wait_till("tutorial_intro_screen_over");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x509483f6, Offset: 0x3cb8
// Size: 0xa
function function_6313c411() {
    wait(1);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xb90dcc9d, Offset: 0x3cd0
// Size: 0xc4
function function_e30183a6() {
    wait(2);
    level thread scene::play("p8_fxanim_zm_zod_smokestack_01_bundle", "Shot 1");
    level thread scene::play("p8_fxanim_zm_zod_smokestack_02_bundle", "Shot 1");
    level thread scene::play("p8_fxanim_zm_zod_smokestack_wire_snap_bundle", "Shot 1");
    level thread scene::play_from_time("p8_fxanim_zm_zod_iceberg_bundle", "iceberg_impact", undefined, 0.5);
    level thread zm_zodt8::change_water_height_fore(1);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x53408ff2, Offset: 0x3da0
// Size: 0x35c
function function_513e90cf() {
    var_2151fb35 = getentarray("state_rooms_to_lower_stairs_door", "targetname");
    foreach (mdl_door in var_2151fb35) {
        if (mdl_door.model === #"hash_9a7063a36ee590f") {
            mdl_door setmodel(#"p8_kit_zod_din_05_door_42_left_stained_wood_02");
        } else if (mdl_door.model === #"hash_41f5587fd2de45fc") {
            mdl_door setmodel(#"hash_525a2f81b2c0f847");
        }
    }
    zm_characters::set_character(array(#"hash_f531a8c2df891cc", #"hash_26072a3b34719d22"));
    music::setmusicstate("tutorial_beginner_start");
    self function_204dd117("tutorial_beginner_start");
    self takeallweapons();
    self function_3fe47ed7("pistol_topbreak_t8");
    self giveweapon(level.weaponbasemelee);
    self function_2b4bf122(2500);
    self freeze_player_controls();
    self thread function_5bc503b1();
    self function_2517cb55();
    self function_c3b8207f();
    self wallbuy();
    self points();
    self doorbuy();
    self rounds();
    self function_ec7139ac();
    self magicbox();
    self function_88b4ae49();
    function_edf32a3b(3);
    wait(3);
    music::setmusicstate("tutorial_beginner_end");
    self lui::screen_fade_out(5);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x389a790d, Offset: 0x4108
// Size: 0x182
function function_5bc503b1() {
    var_d8b36102 = getent("tutorial_door", "targetname");
    var_4f76999f = getent("tutorial_door_clip", "targetname");
    var_d8b36102 linkto(var_4f76999f);
    var_d8b36102 setcandamage(1);
    var_d8b36102.health = 10000;
    do {
        s_notify = undefined;
        s_notify = var_d8b36102 waittill(#"damage");
        var_d8b36102.health = 10000;
    } while(s_notify.mod != "MOD_MELEE");
    self playrumbleonentity("damage_light");
    earthquake(0.2, 0.4, self.origin, 500);
    var_d8b36102 playsound(#"hash_6a5e0d24e28a2c01");
    var_4f76999f rotateyaw(97, 1, 0, 0.5);
    level.var_70fed833 = 1;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xefbe8ca5, Offset: 0x4298
// Size: 0x74
function function_1dab7ef1() {
    self function_204dd117("tutorial_beginner_start");
    self function_fac53b63(array("tutorial_zm_spawner_shoot_zombie"), 1);
    level.var_a4ad706d[0] thread function_16c8867e(self);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x43150475, Offset: 0x4318
// Size: 0xa4
function function_16c8867e(e_player) {
    eventstruct = undefined;
    eventstruct = self waittill(#"death");
    if (isdefined(eventstruct) && isdefined(eventstruct.weapon) && eventstruct.weapon.type == "bullet") {
        level notify(#"zombie_shot");
    } else {
        e_player thread tutorial_reset();
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x5143c558, Offset: 0x43c8
// Size: 0x384
function function_2517cb55() {
    function_269d9f82("blocker_shoot_zombie");
    self.reset_score = self.score;
    function_b12c3aec();
    util::streamer_wait();
    level flag::set("tutorial_intro_screen_over");
    level flag::wait_till("gameplay_started");
    function_6e9fe428(&function_1dab7ef1);
    function_68da8e33(#"hash_71b1fd8d67ee8e9d");
    self function_fac53b63(array("tutorial_zm_spawner_shoot_zombie"), 1);
    level.var_a4ad706d[0] thread function_16c8867e(self);
    self function_e326c0a();
    wait(0.5);
    level thread function_68da8e33(#"hash_71b1fc8d67ee8cea");
    self thread function_3e1e39f8(#"hash_49df76352370f4a6", "shoot_zombie_completed", &function_3d825fe, 9999);
    self thread function_261ed63c(#"hash_66a9e9a056f5aa26", 6, "shoot_zombie_completed");
    level waittill(#"zombie_shot");
    function_a09d93d9();
    self notify(#"hash_268088d4f6e22961");
    self notify(#"hash_c366d831c1ff919");
    function_68da8e33(#"hash_4b3c8234832c799e", 0.3);
    w_pistol = self getcurrentweapon();
    if (self getweaponammoclip(w_pistol) != self getweaponammoclipsize(w_pistol)) {
        level thread function_68da8e33(#"hash_316ebf182aa3396b", 0.4);
        self function_3e1e39f8(#"hash_42258c918b04d5f2", "reload_completed", &function_44514728, 9999);
        wait(0.5);
        level flag::wait_till_clear("tutorial_vo_playing");
    }
    function_68da8e33(#"hash_2d6e6c147db9a32a", 0.5);
    function_269d9f82("blocker_shoot_zombie", 0);
    function_269d9f82("blocker_pre_wall_buy", 1);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x73946a4c, Offset: 0x4758
// Size: 0x1ac
function function_c3b8207f() {
    if (self getstance() != "crouch") {
        level thread function_68da8e33(#"hash_5af63888fba2594b", 0.5);
        self thread function_261ed63c(#"hash_7e3f37003051a94c", 8, "crouch_completed");
        self thread function_3e1e39f8(#"hash_1544925c6fc2b561", "crouch_completed", &function_78dbf7e8, 9999);
    }
    function_5ea0763f("tutorial_finish_crouch");
    self notify(#"crouch_completed");
    level flag::wait_till_clear("tutorial_vo_playing");
    level thread function_68da8e33(#"hash_3af16170dcb577e5", 0.5);
    self thread function_3e1e39f8(#"hash_2e816a34f4c828df", "sprint_completed", &function_40050d3e, 8);
    function_5ea0763f("tutorial_finish_pronesprint");
    level flag::wait_till_clear("tutorial_vo_playing");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xa2daa385, Offset: 0x4910
// Size: 0x264
function wallbuy() {
    var_bd118df0 = getent("shader_wallbuy", "targetname");
    var_bd118df0 clientfield::set("tutorial_keyline_fx", 1);
    s_objective = struct::get("objective_pos_wall_buy", "targetname");
    s_objective function_384bed55();
    self thread function_68da8e33(#"hash_7bb3349ac11750e5", 0.5);
    self thread function_261ed63c(#"hash_48fe2a22d51f87ea", 8, "wallbuy_completed");
    function_d1dabace(0);
    level waittill(#"weapon_bought");
    s_objective function_384bed55(0);
    var_bd118df0 delete();
    self notify(#"wallbuy_completed");
    function_d1dabace();
    function_269d9f82("blocker_post_wall_buy");
    level flag::wait_till_clear("tutorial_vo_playing");
    level thread function_68da8e33(#"hash_7f88771dfcc1a6ad");
    self function_3e1e39f8(#"hash_b7646fef6461730", "switch_completed", &function_3a885b9d, 9999);
    level flag::wait_till_clear("tutorial_vo_playing");
    function_68da8e33(#"hash_5159cbaea0605f74", 1);
    function_269d9f82("blocker_pre_wall_buy", 0);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x4f7b4f78, Offset: 0x4b80
// Size: 0x6c
function points_reset() {
    self function_204dd117("tutorial_points_start");
    self thread function_fac53b63(array("tutorial_zm_spawner_points_1", "tutorial_zm_spawner_points_2", "tutorial_zm_spawner_points_3", "tutorial_zm_spawner_points_4"), 1);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xceb5f9be, Offset: 0x4bf8
// Size: 0x1dc
function points() {
    self.reset_score = self.score;
    function_6e9fe428(&points_reset);
    self thread function_fac53b63(array("tutorial_zm_spawner_points_1", "tutorial_zm_spawner_points_2", "tutorial_zm_spawner_points_3", "tutorial_zm_spawner_points_4"), 1);
    wait(3);
    level thread function_68da8e33(#"hash_51f56d21fa70d946");
    if (!self adsbuttonpressed()) {
        self thread function_3e1e39f8(#"hash_c360659fdde1ca7", "ads_completed", &function_7b8a4b02);
    }
    self function_fb2e7309();
    function_a09d93d9();
    self notify(#"ads_completed");
    function_68da8e33(#"hash_50dc77fec1759941", 0.5);
    level thread function_68da8e33(#"hash_7d2527b8d4294bec", 0.4);
    self thread function_3e1e39f8(#"hash_23375fb65c0b9e2d", "melee_completed", &function_568b7e4b, 8);
    wait(1);
    level flag::wait_till_clear("tutorial_vo_playing");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xa7d00d17, Offset: 0x4de0
// Size: 0x194
function doorbuy() {
    s_objective = struct::get("objective_pos_door_buy", "targetname");
    s_objective function_384bed55();
    function_1cc39f51("state_rooms_to_lower_stairs_door", "p8_kit_zod_din_05_door_42_left_stained_wood_02", 1);
    function_1cc39f51("state_rooms_to_lower_stairs_door", "p8_kit_zod_din_05_door_42_right_stained_wood_02", 1);
    function_68da8e33(#"hash_42672ecc69a0efb1", 0.3);
    self thread function_261ed63c(#"hash_d7858da53c9180e", 8, "door_completed");
    function_b12c3aec(0);
    level waittill(#"door_opened", #"junk purchased");
    self notify(#"door_completed");
    s_objective function_384bed55(0);
    function_1cc39f51("state_rooms_to_lower_stairs_door", "p8_kit_zod_din_05_door_42_left_stained_wood_02", 0);
    function_1cc39f51("state_rooms_to_lower_stairs_door", "p8_kit_zod_din_05_door_42_right_stained_wood_02", 0);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x0
// Checksum 0x806191db, Offset: 0x4f80
// Size: 0x5c
function function_979b1a9f() {
    self function_204dd117("tutorial_rounds_start");
    self function_fac53b63(array("tutorial_zm_spawner_rounds_1", "tutorial_zm_spawner_rounds_2", "tutorial_zm_spawner_rounds_3"));
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xbadc0f28, Offset: 0x4fe8
// Size: 0x5c
function rounds() {
    function_269d9f82("blocker_pre_repair");
    wait(2);
    function_edf32a3b(2);
    level thread function_68da8e33(#"hash_2b436347f157eca9");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x11f2dd1e, Offset: 0x5050
// Size: 0x4c
function function_c55bfc51() {
    self function_204dd117("tutorial_barrierrepair_start");
    self function_fac53b63(array("tutorial_zm_spawner_barrier"));
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xf9b07d98, Offset: 0x50a8
// Size: 0x3c4
function function_ec7139ac() {
    function_5ea0763f("tutorial_start_barrierrepair");
    zm_blockers::open_all_zbarriers();
    self.reset_score = self.score;
    self.is_drinking = 1;
    function_6e9fe428(&function_c55bfc51);
    self function_fac53b63(array("tutorial_zm_spawner_barrier"));
    level thread function_68da8e33(#"hash_efebad6d51dae78");
    self function_fb2e7309();
    level flag::wait_till_clear("tutorial_vo_playing");
    self.is_drinking = 0;
    self thread function_68da8e33("vox_beginner_carp_narr_0", 0.5);
    foreach (s_goal in level.exterior_goals) {
        if (s_goal.script_string == "millionaire_window") {
            s_goal.zbarrier clientfield::set("tutorial_keyline_fx", 1);
        }
    }
    s_objective = struct::get("objective_pos_repair", "targetname");
    s_objective function_384bed55();
    self thread function_261ed63c(#"hash_3eac3c3c341e4070", 8, "boarding_window");
    for (var_d01c9ca2 = 0; var_d01c9ca2 < 6; var_d01c9ca2++) {
        self waittill(#"boarding_window");
    }
    self notify(#"boarding_complete");
    foreach (s_goal in level.exterior_goals) {
        if (s_goal.script_string == "millionaire_window") {
            s_goal.zbarrier clientfield::set("tutorial_keyline_fx", 2);
        }
    }
    s_objective function_384bed55(0);
    function_68da8e33(#"hash_c9ac443532e923d");
    function_a09d93d9();
    function_269d9f82("blocker_pre_repair", 0);
    function_5ea0763f("tutorial_finish_barrierrepair");
    function_269d9f82("blocker_post_repair");
    function_269d9f82("blocker_post_wall_buy", 0);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xfaf5b902, Offset: 0x5478
// Size: 0x58
function function_a97ed0b5(a_keys) {
    a_keys = [];
    forced_weapon = getweapon("smg_drum_pistol_t8");
    arrayinsert(a_keys, forced_weapon, 0);
    return a_keys;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x1e94a73a, Offset: 0x54d8
// Size: 0x2b4
function magicbox() {
    self.reset_score = self.score;
    self.is_drinking = 1;
    level.chests[level.chest_index].zbarrier clientfield::set("tutorial_keyline_fx", 1);
    s_objective = struct::get("objective_pos_box", "targetname");
    s_objective function_384bed55();
    function_cc60408f(array(#"hash_7a9ffadcf14fbabe", #"hash_7a9ffbdcf14fbc71"), "chest_opened");
    self.is_drinking = 0;
    level.customrandomweaponweights = &function_a97ed0b5;
    level.chests[level.chest_index].zbarrier waittill(#"opened");
    level.chests[level.chest_index].zbarrier clientfield::set("tutorial_keyline_fx", 2);
    s_objective function_384bed55(0);
    while (level.chests[level.chest_index].zbarrier.weapon == level.weaponnone) {
        waitframe(1);
    }
    self notify(#"weapon_settled");
    level thread function_68da8e33(#"hash_7a9ff8dcf14fb758");
    level.chests[level.chest_index].zbarrier waittill(#"weapon_grabbed");
    level.customrandomweaponweights = undefined;
    level.var_401aaa92 = 1;
    level flag::wait_till_clear("tutorial_vo_playing");
    function_68da8e33(#"hash_7a9ff9dcf14fb90b", 0.5);
    function_68da8e33(#"hash_212ed6f23e15aabf", 0.8);
    function_68da8e33(#"hash_17a3d677a0f6162e", 1);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x30eb56d5, Offset: 0x5798
// Size: 0x74
function function_dc366ad7() {
    self function_204dd117("tutorial_playerwilldie_start");
    self function_fac53b63(array("tutorial_zm_spawner_playerwilldie_1", "tutorial_zm_spawner_playerwilldie_2", "tutorial_zm_spawner_playerwilldie_3", "tutorial_zm_spawner_playerwilldie_4", "tutorial_zm_spawner_playerwilldie_5", "tutorial_zm_spawner_playerwilldie_6"));
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x7c58e5ae, Offset: 0x5818
// Size: 0x184
function function_88b4ae49() {
    self.reset_score = self.score;
    function_6e9fe428(&function_dc366ad7);
    self function_fac53b63(array("tutorial_zm_spawner_playerwilldie_1", "tutorial_zm_spawner_playerwilldie_2", "tutorial_zm_spawner_playerwilldie_3", "tutorial_zm_spawner_playerwilldie_4", "tutorial_zm_spawner_playerwilldie_5", "tutorial_zm_spawner_playerwilldie_6"));
    wait(2);
    level thread function_68da8e33("vox_beginner_end_narr_1");
    if (isdefined(level.var_70fed833)) {
        self function_fac53b63(array("tutorial_zm_spawner_playerwilldie_1", "tutorial_zm_spawner_playerwilldie_2", "tutorial_zm_spawner_playerwilldie_3", "tutorial_zm_spawner_playerwilldie_4", "tutorial_zm_spawner_playerwilldie_5", "tutorial_zm_spawner_playerwilldie_6"));
        wait(3);
        self function_fac53b63(array("tutorial_zm_spawner_playerwilldie_1", "tutorial_zm_spawner_playerwilldie_2", "tutorial_zm_spawner_playerwilldie_3", "tutorial_zm_spawner_playerwilldie_4", "tutorial_zm_spawner_playerwilldie_5", "tutorial_zm_spawner_playerwilldie_6"));
    }
    self function_fb2e7309();
    function_a09d93d9();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xa04f4b3a, Offset: 0x59a8
// Size: 0x764
function function_bfd3a7b1() {
    zm_characters::set_character(array(#"hash_68255d9ce2a09382", #"hash_1a427f842f175b3c"));
    self function_204dd117("tutorial_intermediate_start");
    music::setmusicstate("tutorial_intermediate_start");
    var_1c8259f7 = getweapon("zitem_rocketshield_part_2");
    var_57654fbc = getweapon("zitem_rocketshield_part_3");
    self giveweapon(var_1c8259f7);
    waitframe(1);
    self giveweapon(var_57654fbc);
    zm_blockers::open_all_zbarriers();
    self function_2b4bf122(2850);
    self takeallweapons();
    self function_3fe47ed7("pistol_topbreak_t8");
    self function_3fe47ed7("ar_accurate_t8");
    self giveweapon(level.weaponbasemelee);
    self function_43b2606b();
    self zm_perks::function_9bdf581f(#"specialty_staminup", 0);
    self zm_perks::function_9bdf581f(#"specialty_extraammo", 1);
    self freeze_player_controls();
    function_edf32a3b(8);
    util::streamer_wait();
    if (level.var_ecdc2cb1 == 0) {
        wait(2);
        self lui::screen_fade_in(1);
    } else {
        level flag::set("tutorial_intro_screen_over");
        music::setmusicstate("tutorial_intermediate_start");
        level flag::wait_till("gameplay_started");
        function_68da8e33(#"hash_63a9147fdc583023", 0.5);
        wait(1);
    }
    self function_e326c0a();
    self perks();
    self equipment();
    self bot();
    self function_2d18e4c9();
    self catalyst();
    self cooperative();
    self crafting();
    self power();
    music::setmusicstate("tutorial_intermediate_end");
    self lui::screen_fade_out(5);
    level thread bot::remove_bot(level.var_d0bc9e33);
    zm_characters::set_character(array(#"hash_3e63362aea484e09", #"hash_5a906d7137467771"));
    self function_204dd117("tutorial_advanced_start");
    self.is_drinking = 0;
    var_177ce8c = struct::get_array("pap_quest_interact", "targetname");
    var_177ce8c[0].unitrigger_stub thread zodt8_pap_quest::function_5c299a0f(self);
    var_177ce8c[1].unitrigger_stub thread zodt8_pap_quest::function_5c299a0f(self);
    var_177ce8c[2].unitrigger_stub thread zodt8_pap_quest::function_5c299a0f(self);
    self takeallweapons();
    self function_3fe47ed7("smg_handling_t8");
    self function_3fe47ed7("ar_stealth_t8");
    self function_3fe47ed7("hero_hammer_lv1");
    self function_3fe47ed7("eq_acid_bomb");
    self function_3fe47ed7("zhield_dw");
    self giveweapon(level.weaponbasemelee);
    self function_43b2606b();
    self zm_perks::function_9bdf581f(#"specialty_staminup", 0);
    self zm_perks::function_9bdf581f(#"specialty_extraammo", 1);
    self zm_perks::function_9bdf581f(#"specialty_cooldown", 2);
    self zm_perks::function_9bdf581f(#"specialty_deadshot", 3);
    wait(1);
    self zm_laststand::function_3d685b5f(0);
    self freeze_player_controls();
    self function_2b4bf122(5500);
    self function_e326c0a();
    self function_a2e9f78b();
    self elixirs();
    self pap();
    self fast_travel();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x58dfa5a, Offset: 0x6118
// Size: 0x1f4
function perks() {
    function_b12c3aec();
    self.is_drinking = 1;
    function_f1376337(1);
    function_cc60408f(array(#"hash_10ca256bd3dd4228", #"hash_10ca266bd3dd43db"), "vo_done");
    self thread function_261ed63c(#"hash_6479c2bd319012b3", 5, "perk_purchased");
    self.is_drinking = 0;
    var_fe79c035 = function_9152aa67("p8_fxanim_zm_vapor_altar_zeus_mod");
    var_fe79c035 clientfield::set("tutorial_keyline_fx", 1);
    s_objective = struct::get("objective_pos_altar", "targetname");
    s_objective function_384bed55();
    self waittill(#"perk_purchased");
    var_fe79c035 clientfield::set("tutorial_keyline_fx", 2);
    s_objective function_384bed55(0);
    wait(3);
    function_cc60408f(array(#"hash_10ca276bd3dd458e", #"hash_2c2903a363c22b07"), "vo_done");
    function_b12c3aec(0);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x2d12fc78, Offset: 0x6318
// Size: 0x134
function function_7cc916a4() {
    self function_204dd117("tutorial_equipment_start");
    a_grenades = getentarray("grenade", "classname");
    array::delete_all(a_grenades);
    function_fac53b63(array("tutorial_zm_spawner_equipment_1", "tutorial_zm_spawner_equipment_2", "tutorial_zm_spawner_equipment_3"), 1);
    array::thread_all(level.var_a4ad706d, &function_8406d665);
    self thread function_1beccb75();
    w_weapon = getweapon("eq_acid_bomb");
    self gadgetpowerset(self gadgetgetslot(w_weapon), 100);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xcb6f1960, Offset: 0x6458
// Size: 0x64
function function_1beccb75() {
    level endon(#"hash_7985df6134faf927", #"end_game");
    self endon(#"death");
    level waittill(#"bad_kill");
    tutorial_reset();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x9c50e79a, Offset: 0x64c8
// Size: 0xf0
function function_8406d665() {
    level endon(#"hash_7985df6134faf927", #"bad_kill");
    self.health = 50;
    self.var_72411ccf = &function_40bfbff0;
    eventstruct = undefined;
    eventstruct = self waittill(#"death");
    sticky_grenade = getweapon("eq_acid_bomb");
    if (!isdefined(eventstruct) || !isdefined(eventstruct.weapon)) {
        return;
    }
    if (eventstruct.weapon != sticky_grenade) {
        level notify(#"bad_kill");
        return;
    }
    level notify(#"hash_7985df6134faf927");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xef07469f, Offset: 0x65c0
// Size: 0x3d4
function equipment() {
    function_1cc39f51("suites_promenade_door", "p8_kit_zod_lou_05_door_left_painted_wood_01", 1);
    s_objective = struct::get("objective_pos_door_buy_2", "targetname");
    s_objective function_384bed55();
    level thread function_261ed63c(#"hash_2c2902a363c22954", 5, "door_opened");
    level waittill(#"door_opened", #"junk purchased");
    function_1cc39f51("suites_promenade_door", "p8_kit_zod_lou_05_door_left_painted_wood_01", 0);
    s_objective function_384bed55(0);
    function_269d9f82("barrier_acid_bomb");
    self thread function_68da8e33(#"hash_5040525e8af4917d");
    self thread function_261ed63c(#"hash_148814932d9c1702", 6, "grenade_fire");
    function_fac53b63(array("tutorial_zm_spawner_equipment_1", "tutorial_zm_spawner_equipment_2", "tutorial_zm_spawner_equipment_3"), 1);
    array::thread_all(level.var_a4ad706d, &function_8406d665);
    self thread function_1beccb75();
    function_f1376337(2);
    self.reset_score = self.score;
    self thread function_3e1e39f8(#"hash_3d6f9490b9f55db5", "equipment_completed", &function_fdea7676, 9999);
    sticky_grenade = getweapon("eq_acid_bomb");
    self giveweapon(sticky_grenade);
    function_6e9fe428(&function_7cc916a4);
    level waittill(#"hash_7985df6134faf927");
    self notify(#"equipment_completed");
    function_a09d93d9();
    foreach (ai_zombie in level.var_a4ad706d) {
        if (isdefined(ai_zombie) && isalive(ai_zombie)) {
            ai_zombie dodamage(ai_zombie.health + 100, ai_zombie.origin);
        }
    }
    function_68da8e33(#"hash_16b131f253cef04e");
    function_269d9f82("barrier_acid_bomb", 0);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x4a85511e, Offset: 0x69a0
// Size: 0x94
function function_2d2a2ec6() {
    level endon(#"end_game", #"tutorial_reset");
    wait(0.6);
    level.var_634ee380 = zm_powerups::specific_powerup_drop("nuke", self.origin, #"allies", 0.1, undefined, 1);
    self kill();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x9e8c85c4, Offset: 0x6a40
// Size: 0x16a
function function_a52087a1() {
    self function_204dd117("tutorial_bot_start");
    if (isdefined(level.var_634ee380)) {
        level.var_634ee380 delete();
    }
    level.var_634ee380 = undefined;
    zombie = function_cf5f5964("tutorial_zm_spawner_bot_1", 1, level.var_d0bc9e33, 1);
    zombie thread function_2d2a2ec6();
    function_fac53b63(array("tutorial_zm_spawner_bot_2", "tutorial_zm_spawner_bot_3", "tutorial_zm_spawner_bot_4", "tutorial_zm_spawner_bot_5"), 1);
    foreach (ai_zombie in level.var_a4ad706d) {
        ai_zombie.var_72411ccf = &function_40bfbff0;
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xc982a7ed, Offset: 0x6bb8
// Size: 0xb8
function function_b375d3c3() {
    level endon(#"end_game", #"hash_5cefed971a2f1a52");
    self endon(#"death");
    self waittill(#"player_downed");
    self endon(#"player_revived", #"zombified", #"disconnect");
    max_time = self.bleedout_time;
    while (1) {
        self.bleedout_time = max_time;
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x7fbcbe7f, Offset: 0x6c78
// Size: 0x3ac
function bot() {
    self.reset_score = self.score;
    trigger::wait_till("tutorial_spawn_nuke");
    self thread function_e054ad69();
    var_7d37d68d = getnode("tutorial_bot_spawn", "targetname");
    sessionmode = currentsessionmode();
    bot = bot::add_bot(#"allies", "J. Blundell [bot]");
    while (!isdefined(bot)) {
        waitframe(1);
        bot = bot::add_bot(#"allies", "J. Blundell [bot]");
    }
    bot.var_29b433bd = int(zm_characters::function_9004475c(array(#"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6")));
    bot bot::allow_all(0);
    bot thread bot::fixed_spawn_override(var_7d37d68d.origin, var_7d37d68d.angles[1], bot bot::get_nearest_node(var_7d37d68d.origin));
    waitframe(1);
    level.var_d0bc9e33 thread function_b375d3c3();
    level.var_d0bc9e33 function_2b4bf122(2000);
    level.var_d0bc9e33 dodamage(level.var_d0bc9e33.health, level.var_d0bc9e33.origin);
    zombie = function_cf5f5964("tutorial_zm_spawner_bot_1", 1, level.var_d0bc9e33, 1);
    zombie thread function_2d2a2ec6();
    waitframe(3);
    function_fac53b63(array("tutorial_zm_spawner_bot_2", "tutorial_zm_spawner_bot_3", "tutorial_zm_spawner_bot_4", "tutorial_zm_spawner_bot_5"), 1);
    foreach (ai_zombie in level.var_a4ad706d) {
        ai_zombie.var_72411ccf = &function_40bfbff0;
    }
    function_6e9fe428(&function_a52087a1);
    self thread function_c0a37283();
    self waittill(#"nuke_triggered");
    function_a09d93d9();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x82e9257, Offset: 0x7030
// Size: 0x6c
function function_e054ad69() {
    self endon(#"nuke_triggered");
    level function_68da8e33(#"hash_4570b02abda4a10");
    self thread function_261ed63c(#"hash_73ec6520c4125b7b", 5, "nuke_triggered");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xeb27c7fc, Offset: 0x70a8
// Size: 0x66
function function_c0a37283() {
    self endon(#"nuke_triggered", #"death");
    while (1) {
        if (self zm_laststand::is_reviving_any()) {
            tutorial_reset();
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xe0cfd266, Offset: 0x7118
// Size: 0xfc
function function_2d18e4c9() {
    level thread function_68da8e33(#"hash_21c376fa208dc2c", 4);
    level.var_d0bc9e33 waittill(#"stop_revive_trigger");
    level thread function_68da8e33(#"hash_409bd11382c2e617");
    level.var_d0bc9e33 function_3fe47ed7("ar_damage_t8");
    level.var_d0bc9e33 function_c9f9f3bb("tutorial_bot_ramp");
    function_5ea0763f("tutorial_finish_bot_revive", self);
    level.var_d0bc9e33 function_c9f9f3bb("tutorial_bot_upper_deck");
    function_269d9f82("barrier_post_revive");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x67be8e2a, Offset: 0x7220
// Size: 0x1ae
function catalyst() {
    level.var_d0bc9e33 ai::set_behavior_attribute("revive", 0);
    level.player_death_override = undefined;
    level thread function_68da8e33(#"hash_19f5dd3aa8491df1");
    function_cf5f5964("tutorial_catalyst_spawner", 1, level.var_d0bc9e33, 1);
    level waittill(#"hash_528115ad9eebc84f");
    self dodamage(self.health + 100, self.origin);
    level.var_d0bc9e33 function_c9f9f3bb("tutorial_bot_before_revive");
    function_68da8e33(#"hash_6698f554bf7a9501");
    function_68da8e33(#"hash_6698f454bf7a934e");
    level.var_d0bc9e33 ai::set_behavior_attribute("revive", 1);
    level.var_d0bc9e33 setgoal(self, 1);
    level.var_d0bc9e33 bot::set_revive_target(self);
    self waittill(#"stop_revive_trigger");
    level.player_death_override = &tutorial_reset;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x4705c8f4, Offset: 0x73d8
// Size: 0x114
function cooperative() {
    level.var_d0bc9e33 function_c9f9f3bb("tutorial_bot_open_door");
    function_5ea0763f("tutorial_bot_open_door_trigger", level.var_d0bc9e33);
    function_68da8e33(#"hash_3c5d16448b5aa5db");
    open_door("library_boat_deck_door");
    function_269d9f82("barrier_pre_shield");
    level.var_d0bc9e33 zm_score::player_reduce_points("take_specified", 1500);
    wait(1);
    level thread function_68da8e33(#"hash_3c5d15448b5aa428");
    level.var_d0bc9e33 function_c9f9f3bb("tutorial_bot_shield_part");
    function_b12c3aec();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x2cd2c9a8, Offset: 0x74f8
// Size: 0x704
function crafting() {
    var_171df470 = getent("tutorial_forced_shield_part", "targetname");
    if (isdefined(var_171df470)) {
        var_171df470 clientfield::set("tutorial_keyline_fx", 1);
    } else {
        /#
            assert(0, "p8_fxanim_zm_zod_smokestack_02_bundle");
        #/
    }
    s_objective = struct::get("objective_pos_shield", "targetname");
    if (isdefined(s_objective)) {
        s_objective function_384bed55();
    } else {
        /#
            assert(0, "wallbuy_completed");
        #/
    }
    wait(1);
    function_68da8e33(#"hash_5caf3fd084d30b3e");
    var_97a0a08e = getweapon("zitem_rocketshield_part_1");
    while (!zm_items::player_has(self, var_97a0a08e)) {
        waitframe(1);
    }
    s_objective function_384bed55(0);
    function_269d9f82("barrier_pick_up_shield");
    function_269d9f82("barrier_post_revive", 0);
    function_68da8e33(#"hash_12dc4515e217ec24", 0.5);
    var_1d1ba5d3 = self gamepadusedlast() ? #"hash_5de9dee0c0a470e5" : #"hash_9ddd3cf7cbddf5b";
    self thread function_3e1e39f8(var_1d1ba5d3, "zm_inventory_menu_opened", undefined, 9999);
    self waittill(#"zm_inventory_menu_opened");
    function_269d9f82("barrier_pre_shield", 0);
    function_269d9f82("barrier_post_shield");
    level.var_d0bc9e33 function_c9f9f3bb("tutorial_bot_crafting");
    var_6b69f12a = getent("tutorial_table", "targetname");
    if (isdefined(var_6b69f12a)) {
        var_6b69f12a clientfield::set("tutorial_keyline_fx", 1);
    } else {
        /#
            assert(0, "blocker_post_repair");
        #/
    }
    s_objective = struct::get("objective_pos_table", "targetname");
    if (isdefined(s_objective)) {
        s_objective function_384bed55();
    } else {
        /#
            assert(0, "wallbuy_completed");
        #/
    }
    level thread function_68da8e33(#"hash_12dc4615e217edd7", 1);
    self waittill(#"crafting_success");
    if (isdefined(var_6b69f12a)) {
        var_6b69f12a delete();
    } else {
        /#
            assert(0, "blocker_post_repair");
        #/
    }
    var_1464a7b = getent("shield_model", "targetname");
    if (isdefined(var_1464a7b)) {
        var_1464a7b clientfield::set("tutorial_keyline_fx", 1);
    } else {
        /#
            assert(0, "p8_fxanim_zm_vapor_altar_zeus_mod");
        #/
    }
    level thread function_68da8e33(#"hash_6643caefeffff6f1");
    shield = getweapon("zhield_dw");
    while (!self hasweapon(shield)) {
        waitframe(1);
    }
    if (isdefined(var_1464a7b)) {
        var_1464a7b clientfield::set("tutorial_keyline_fx", 2);
    } else {
        /#
            assert(0, "p8_fxanim_zm_vapor_altar_zeus_mod");
        #/
    }
    if (isdefined(s_objective)) {
        s_objective function_384bed55(0);
    } else {
        /#
            assert(0, "wallbuy_completed");
        #/
    }
    function_f1376337(3);
    level flag::wait_till_clear("tutorial_vo_playing");
    if (self getcurrentweapon() != shield) {
        level thread function_68da8e33(#"hash_22a9c5a0eed67aea", 0.5);
        self thread function_3e1e39f8(#"hash_4253963241ceddbb", "shield_equipped", undefined, 9999);
        wait(0.6);
        while (!(self getcurrentweapon() == shield)) {
            waitframe(1);
        }
        self notify(#"shield_equipped");
    }
    level flag::wait_till_clear("tutorial_vo_playing");
    self thread function_3e1e39f8(#"hash_6b53132afa3ea5ef", "shield_attack");
    function_68da8e33(#"hash_59580cf69ba61108", 1);
    function_269d9f82("barrier_post_shield", 0);
    function_269d9f82("barrier_pre_power");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x603165fe, Offset: 0x7c08
// Size: 0x168
function function_e35fa479() {
    level endon(#"tutorial_reset");
    self val::set(#"devgui", "ignoreme");
    self val::set(#"devgui", "takedamage", 0);
    self function_c9f9f3bb("tutorial_bot_before_power");
    self waittill(#"goal");
    function_1eaaceab(level.var_a4ad706d);
    while (level.var_a4ad706d.size > 0) {
        e_target = level.var_a4ad706d[randomint(level.var_a4ad706d.size)];
        self setentitytarget(e_target);
        e_target waittill(#"death");
        wait(randomfloatrange(1, 2));
        function_1eaaceab(level.var_a4ad706d);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x860c75bd, Offset: 0x7d78
// Size: 0x84
function function_85d01969() {
    self function_204dd117("tutorial_power_start");
    function_fac53b63(array("tutorial_zm_spawner_power_1", "tutorial_zm_spawner_power_2", "tutorial_zm_spawner_power_3", "tutorial_zm_spawner_power_4", "tutorial_zm_spawner_power_5"));
    level.var_d0bc9e33 thread function_e35fa479();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x6dafa8dd, Offset: 0x7e08
// Size: 0x262
function power() {
    level thread function_68da8e33(#"hash_2e0db4c834d8111c", 1);
    function_6e9fe428(&function_85d01969);
    self.reset_score = self.score;
    var_6106f676 = function_9152aa67("p8_fxanim_zm_zod_sentinel_chaos_wheel_mod");
    var_6106f676 clientfield::set("tutorial_keyline_fx", 1);
    s_objective = struct::get("objective_pos_power", "targetname");
    s_objective function_384bed55();
    function_fac53b63(array("tutorial_zm_spawner_power_1", "tutorial_zm_spawner_power_2", "tutorial_zm_spawner_power_3", "tutorial_zm_spawner_power_4", "tutorial_zm_spawner_power_5"));
    level.var_d0bc9e33 thread function_e35fa479();
    function_fb2e7309();
    function_269d9f82("barrier_pre_power", 0);
    function_a09d93d9();
    level.var_d0bc9e33 thread function_4491a7c();
    level thread function_68da8e33(#"hash_2e0db5c834d812cf", 1.5);
    level flag::wait_till("power_on");
    music::setmusicstate("tutorial_intermediate_sentinel");
    self.is_drinking = 1;
    s_objective function_384bed55(0);
    var_6106f676 clientfield::set("tutorial_keyline_fx", 2);
    wait(2);
    level thread function_68da8e33(#"hash_11c00751543070b6");
    wait(12);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x6b1cde14, Offset: 0x8078
// Size: 0x84
function function_4491a7c() {
    s_pos = struct::get("tutorial_zm_spawner_power_4", "targetname");
    self setgoal(s_pos.origin, 1);
    self waittill(#"goal");
    self function_c9f9f3bb("tutorial_bot_power");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x88982bac, Offset: 0x8108
// Size: 0x154
function function_23dadcc9() {
    self function_204dd117("tutorial_special_weapons_start");
    function_cf5f5964("tutorial_zm_spawner_specialweapons_charge");
    function_fac53b63(array("tutorial_zm_spawner_specialweapons_1", "tutorial_zm_spawner_specialweapons_2", "tutorial_zm_spawner_specialweapons_3", "tutorial_zm_spawner_specialweapons_4", "tutorial_zm_spawner_specialweapons_5", "tutorial_zm_spawner_specialweapons_6", "tutorial_zm_spawner_specialweapons_7", "tutorial_zm_spawner_specialweapons_8", "tutorial_zm_spawner_specialweapons_9", "tutorial_zm_spawner_specialweapons_10"));
    self gadgetpowerset(2, 100);
    if (self getcurrentweapon() != getweapon("hero_hammer_lv1")) {
        self thread function_b024c4f4();
        self thread function_3e1e39f8(#"hash_49608704d6c3dc17", "hammer_equipped", &function_a8935bf4, 9999);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xe1f9a970, Offset: 0x8268
// Size: 0x354
function function_a2e9f78b() {
    function_f1376337(4);
    self.reset_score = self.score;
    level flag::init("special_weapon_activated");
    function_6e9fe428(&function_23dadcc9);
    function_cf5f5964("tutorial_zm_spawner_specialweapons_charge");
    music::setmusicstate("tutorial_advanced_start");
    self lui::screen_fade_in(1);
    level thread function_68da8e33(#"hash_31b14ca1baedfeb7");
    if (self getcurrentweapon() != getweapon("hero_hammer_lv1")) {
        self thread function_b024c4f4();
        self thread function_3e1e39f8(#"hash_49608704d6c3dc17", "hammer_equipped", &function_a8935bf4, 9999);
    }
    level.var_43fb4347 = "run";
    level.var_102b1301 = "sprint";
    function_fac53b63(array("tutorial_zm_spawner_specialweapons_1", "tutorial_zm_spawner_specialweapons_2", "tutorial_zm_spawner_specialweapons_3", "tutorial_zm_spawner_specialweapons_4", "tutorial_zm_spawner_specialweapons_5", "tutorial_zm_spawner_specialweapons_6", "tutorial_zm_spawner_specialweapons_7", "tutorial_zm_spawner_specialweapons_8", "tutorial_zm_spawner_specialweapons_9", "tutorial_zm_spawner_specialweapons_10"));
    level flag::wait_till("special_weapon_activated");
    level thread function_68da8e33(#"hash_64de3477d85cad95");
    hammer = getweapon("hero_hammer_lv1");
    while (self getcurrentweapon() == hammer && level.var_a4ad706d.size > 0) {
        waitframe(1);
        array::remove_undefined(level.var_a4ad706d);
    }
    function_68da8e33(#"hash_3ce2164650e1e712");
    array::remove_undefined(level.var_a4ad706d);
    if (level.var_a4ad706d.size > 0) {
        function_68da8e33(#"hash_3ce2144650e1e3ac");
    }
    function_fb2e7309();
    function_a09d93d9();
    function_68da8e33(#"hash_3ce2174650e1e8c5");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xdd531078, Offset: 0x85c8
// Size: 0x64
function function_b024c4f4() {
    self endon(#"hammer_equipped", #"death");
    wait(5);
    level thread function_68da8e33("vox_advance_hammer_nag_narr_0");
    wait(3);
    tutorial_reset();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xab6a55fe, Offset: 0x8638
// Size: 0x17a
function elixirs() {
    self bgb_pack::function_da912bff(0, 1);
    self bgb_pack::function_da912bff(1, 1);
    self bgb_pack::function_da912bff(2, 1);
    self bgb_pack::function_da912bff(3, 1);
    function_f1376337(5);
    function_68da8e33(#"hash_223703d87588d1ee", 2);
    level.var_3c8ad64b = 2;
    self bgb_pack::function_da912bff(2, 0);
    if (function_8b1a219a()) {
        level notify(#"hash_7d7ad8f95ddcdcbd");
    }
    self thread function_3e1e39f8(#"hash_52ed5bafc1e1a62c", "tutorial_used_anywhere_but_here");
    level waittill(#"hash_1223834837d857ba");
    self function_204dd117("tutorial_elixers");
    level.var_3c8ad64b = -1;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x47996487, Offset: 0x87c0
// Size: 0x54
function function_3901e82e() {
    level endon(#"end_game");
    self endon(#"death");
    self waittill(#"pap_timeout");
    tutorial_reset();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xdc95c655, Offset: 0x8820
// Size: 0x7c
function function_818a3a72() {
    self function_3fe47ed7("smg_handling_t8");
    self function_3fe47ed7("ar_stealth_t8");
    self function_204dd117("tutorial_PAP_start");
    self thread function_3901e82e();
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xb7652684, Offset: 0x88a8
// Size: 0x23c
function pap() {
    self.reset_score = self.score;
    self.is_drinking = 1;
    var_812ed519 = getent("t_use_water_pump_fore", "targetname");
    var_812ed519 hide();
    function_68da8e33(#"hash_223704d87588d3a1", 0.5);
    level thread function_68da8e33(#"hash_7d57e8643f403794", 1);
    wait(1);
    var_177ce8c = getentarray("zm_pack_a_punch", "targetname");
    var_177ce8c[3] clientfield::set("tutorial_keyline_fx", 1);
    s_objective = struct::get("objective_pos_pap", "targetname");
    s_objective function_384bed55();
    self.is_drinking = 0;
    function_6e9fe428(&function_818a3a72);
    self thread function_3901e82e();
    self waittill(#"pap_taken");
    var_177ce8c[3] clientfield::set("tutorial_keyline_fx", 2);
    s_objective function_384bed55(0);
    function_a09d93d9();
    util::delay(2, undefined, &zodt8_pap_quest::function_306b4f35);
    level thread function_68da8e33(#"hash_4f966eea00afff58", 0.5);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x3d9095db, Offset: 0x8af0
// Size: 0x6c
function function_737ee059() {
    self function_204dd117("tutorial_fast_travel_start");
    function_fac53b63(array("tutorial_zm_spawner_fast_travel_1", "tutorial_zm_spawner_fast_travel_2", "tutorial_zm_spawner_fast_travel_3", "tutorial_zm_spawner_fast_travel_4", "tutorial_zm_spawner_fast_travel_5"));
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x570573cb, Offset: 0x8b68
// Size: 0x212
function fast_travel() {
    level flag::clear(#"disable_fast_travel");
    level flag::set("connect_provisions_to_engine_room");
    function_6e9fe428(&function_737ee059);
    level thread function_261ed63c(#"hash_752c91f0ab47d7eb", 25, "fast_travel_used");
    function_fac53b63(array("tutorial_zm_spawner_fast_travel_1", "tutorial_zm_spawner_fast_travel_2", "tutorial_zm_spawner_fast_travel_3", "tutorial_zm_spawner_fast_travel_4", "tutorial_zm_spawner_fast_travel_5"));
    s_objective = struct::get("objective_pos_fast_travel", "targetname");
    s_objective function_384bed55();
    self.var_16735873 = 0;
    while (!self.var_16735873) {
        waitframe(1);
    }
    level notify(#"hash_764b6fe89cf2de74");
    self freeze_player_controls();
    self val::set(#"tutorial_finished", "takedamage", 0);
    s_objective function_384bed55(0);
    level.zm_disable_recording_stats = 0;
    /#
        iprintlnbold("tutorial_bot_ramp" + self getentnum());
    #/
    self zm_utility::giveachievement_wrapper("ZM_TUTORIAL_COMPLETION", 0);
    level.zm_disable_recording_stats = 1;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x5114fee0, Offset: 0x8d88
// Size: 0xa4
function function_edf32a3b(n_round_number) {
    playsoundatposition(#"hash_58df62ae7fa7b42b", (0, 0, 0));
    level.zombie_health = zombie_utility::ai_calculate_health(zombie_utility::function_d2dfacfd(#"zombie_health_start"), n_round_number);
    zm_round_logic::set_round_number(n_round_number);
    setroundsplayed(n_round_number);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xd6eac585, Offset: 0x8e38
// Size: 0x4e
function function_d1dabace(b_disable = 1) {
    if (b_disable) {
        level.func_override_wallbuy_prompt = &function_86ff864;
    } else {
        level.func_override_wallbuy_prompt = undefined;
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 2, eflags: 0x5 linked
// Checksum 0x14896980, Offset: 0x8e90
// Size: 0x16
function private function_86ff864(e_player, player_has_weapon) {
    return 0;
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xf6e95f4a, Offset: 0x8eb0
// Size: 0x280
function function_b12c3aec(b_disable = 1) {
    if (b_disable) {
        function_fcf197fa("zombie_door", 0);
        function_fcf197fa("zombie_debris", 0);
    } else {
        function_fcf197fa("zombie_door", 1);
        function_fcf197fa("zombie_debris", 1);
    }
    var_aef40dab = getentarray("zombie_door", "targetname");
    foreach (t_door in var_aef40dab) {
        if (b_disable) {
            t_door notify(#"kill_door_think");
            t_door setinvisibletoall();
        } else {
            t_door thread zm_blockers::blocker_update_prompt_visibility();
            t_door thread zm_blockers::door_think();
            t_door setvisibletoall();
        }
    }
    var_51f66cf0 = getentarray("zombie_debris", "targetname");
    foreach (t_door in var_51f66cf0) {
        if (b_disable) {
            t_door notify(#"kill_door_think");
            t_door setinvisibletoall();
        } else {
            t_door thread zm_blockers::blocker_update_prompt_visibility();
            t_door setvisibletoall();
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x5 linked
// Checksum 0x54f50dcc, Offset: 0x9138
// Size: 0x2c
function private function_40bfbff0(entity) {
    entity setgoal(entity.origin);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 4, eflags: 0x5 linked
// Checksum 0xa4a22052, Offset: 0x9170
// Size: 0x224
function private show_hint_text(text, show_for_time = 3.2, font_scale = 1.25, ypos = 220) {
    self notify("704439256dcba54b");
    self endon("704439256dcba54b");
    self endon(#"disconnect");
    level endon(#"end_game");
    if (!level.zm_tut_hint_text zm_tut_hint_text::is_open(self)) {
        level.zm_tut_hint_text zm_tut_hint_text::open(self);
    }
    level.zm_tut_hint_text zm_tut_hint_text::set_text(self, text);
    level.zm_tut_hint_text zm_tut_hint_text::set_state(self, #"visible");
    time = undefined;
    time = self waittilltimeout(show_for_time, #"hide_equipment_hint_text", #"death", #"disconnect");
    if (isdefined(time) && isdefined(self) && level.zm_tut_hint_text zm_tut_hint_text::is_open(self)) {
        level.zm_tut_hint_text zm_tut_hint_text::set_state(self, #"defaultstate");
        self waittilltimeout(1, #"hide_equipment_hint_text");
    }
    if (isdefined(self) && level.zm_tut_hint_text zm_tut_hint_text::is_open(self)) {
        level.zm_tut_hint_text zm_tut_hint_text::close(self);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 4, eflags: 0x1 linked
// Checksum 0xc49c8d3c, Offset: 0x93a0
// Size: 0x9e
function function_3e1e39f8(str_text, str_notify, var_e6cc3687, n_timeout = 8) {
    level flag::wait_till_clear("tutorial_reset");
    self thread show_hint_text(str_text, n_timeout);
    if (isdefined(var_e6cc3687)) {
        self thread [[ var_e6cc3687 ]]();
    }
    self waittill(str_notify);
    self notify(#"hide_equipment_hint_text");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x25c8f3f1, Offset: 0x9448
// Size: 0x56
function function_3d825fe() {
    self endon(#"death", #"hash_268088d4f6e22961");
    self waittill(#"weapon_fired");
    waitframe(1);
    self notify(#"hash_268088d4f6e22961");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xbe535521, Offset: 0x94a8
// Size: 0x72
function function_78dbf7e8() {
    self endon(#"death", #"crouch_completed");
    while (1) {
        if (self getstance() == "crouch") {
            waitframe(1);
            self notify(#"crouch_completed");
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xaff40bed, Offset: 0x9528
// Size: 0x62
function function_40050d3e() {
    self endon(#"death", #"sprint_completed");
    while (1) {
        if (self issprinting()) {
            self notify(#"sprint_completed");
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x738e637c, Offset: 0x9598
// Size: 0x6a
function function_7b8a4b02() {
    self endon(#"death", #"ads_completed");
    while (1) {
        if (self adsbuttonpressed()) {
            waitframe(1);
            self notify(#"ads_completed");
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xa6969035, Offset: 0x9610
// Size: 0x6a
function function_568b7e4b() {
    self endon(#"death", #"ads_completed");
    while (1) {
        if (self ismeleeing()) {
            waitframe(1);
            self notify(#"melee_completed");
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x605c456b, Offset: 0x9688
// Size: 0x8a
function function_44514728() {
    self endon(#"death", #"reload_completed");
    w_pistol = self getcurrentweapon();
    while (1) {
        if (self isreloading()) {
            waitframe(1);
            self notify(#"reload_completed");
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x84519c1c, Offset: 0x9720
// Size: 0x132
function function_3a885b9d() {
    self endon(#"death", #"switch_completed");
    while (1) {
        if (!self gamepadusedlast() && self.currentweapon != getweapon(#"pistol_topbreak_t8")) {
            var_1f3a8d84 = 1;
        }
        if (!self gamepadusedlast() && isdefined(var_1f3a8d84) && var_1f3a8d84 && self.currentweapon == getweapon(#"pistol_topbreak_t8")) {
            waitframe(1);
            self notify(#"switch_completed");
            return;
        }
        if (self weaponswitchbuttonpressed()) {
            waitframe(1);
            self notify(#"switch_completed");
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0x4e213ebb, Offset: 0x9860
// Size: 0x6a
function function_fdea7676() {
    self endon(#"death", #"equipment_completed");
    while (1) {
        if (self isthrowinggrenade()) {
            waitframe(1);
            self notify(#"equipment_completed");
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 0, eflags: 0x1 linked
// Checksum 0xadf530af, Offset: 0x98d8
// Size: 0xa6
function function_a8935bf4() {
    self endon(#"death", #"hammer_equipped");
    hammer = getweapon("hero_hammer_lv1");
    while (!(self getcurrentweapon() == hammer)) {
        waitframe(1);
    }
    level flag::set("special_weapon_activated");
    self notify(#"hammer_equipped");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x3d241d94, Offset: 0x9988
// Size: 0xc6
function function_9152aa67(str_model_name) {
    var_4f926e93 = undefined;
    var_344a6a1a = getentarray("script_model", "classname");
    foreach (var_300fad71 in var_344a6a1a) {
        if (var_300fad71.model == str_model_name) {
            var_4f926e93 = var_300fad71;
            return var_4f926e93;
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 3, eflags: 0x1 linked
// Checksum 0x71dd8dd8, Offset: 0x9a58
// Size: 0x138
function function_1cc39f51(var_d76c2d40, str_model, var_811aae17 = 1) {
    var_344a6a1a = getentarray(var_d76c2d40, "targetname");
    foreach (e_model in var_344a6a1a) {
        if (isdefined(e_model.model) && e_model.model == str_model) {
            if (isdefined(var_811aae17) && var_811aae17) {
                e_model clientfield::set("tutorial_keyline_fx", 1);
            } else {
                e_model clientfield::set("tutorial_keyline_fx", 2);
            }
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 2, eflags: 0x1 linked
// Checksum 0xe812b063, Offset: 0x9b98
// Size: 0xc4
function function_68da8e33(str_alias, n_delay) {
    if (isdefined(n_delay)) {
        wait(n_delay);
    }
    level.var_851fb552 stopsounds();
    level.var_851fb552 zm_vo::vo_clear();
    waitframe(1);
    waitframe(1);
    level flag::set("tutorial_vo_playing");
    level.var_851fb552 zm_vo::vo_say(str_alias, 0, 0, 1, 1);
    level flag::clear("tutorial_vo_playing");
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 2, eflags: 0x1 linked
// Checksum 0x4de587b2, Offset: 0x9c68
// Size: 0x98
function function_cc60408f(var_29090c21, str_endon) {
    self endon(str_endon);
    foreach (str_alias in var_29090c21) {
        function_68da8e33(str_alias);
        wait(0.3);
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 3, eflags: 0x1 linked
// Checksum 0x9b6cf79b, Offset: 0x9d08
// Size: 0x44
function function_261ed63c(str_alias, n_time, str_endon) {
    self endon(str_endon);
    wait(n_time);
    level thread function_68da8e33(str_alias);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0xb0dddb1c, Offset: 0x9d58
// Size: 0xce
function function_384bed55(b_on = 1) {
    if (isdefined(b_on) && b_on) {
        self.objective_id = gameobjects::get_next_obj_id();
        objective_add(self.objective_id, "active", self.origin, #"hash_410c56f34d7ed87");
        function_da7940a3(self.objective_id, 1);
    } else {
        gameobjects::release_obj_id(self.objective_id);
        self.objective_id = undefined;
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 2, eflags: 0x1 linked
// Checksum 0x1d7e956a, Offset: 0x9e30
// Size: 0x3b8
function function_269d9f82(var_9b7aaa46, b_on = 1) {
    var_d3c21d73 = vectorscale((0, 0, 1), 48);
    var_d23fea4f = struct::get_array(var_9b7aaa46, "targetname");
    if (isdefined(b_on) && b_on) {
        foreach (s_position in var_d23fea4f) {
            s_position.mdl_pos = util::spawn_model("tag_origin", s_position.origin, s_position.angles);
            s_position.mdl_pos clientfield::set("" + #"hash_1b509b0ba634a25a", 1);
            s_position.mdl_fx = util::spawn_model(#"p8_zm_power_door_symbol_01", s_position.origin + var_d3c21d73, s_position.angles);
            s_position.mdl_fx clientfield::set("" + #"hash_1390e08de02cbdc7", 1);
            s_position.var_3cefdbf5 = util::spawn_model("collision_player_wall_128x128x10", s_position.origin + var_d3c21d73, s_position.angles);
            s_position.var_3cefdbf5 disconnectpaths();
            s_position.var_3cefdbf5 ghost();
        }
    } else {
        foreach (s_position in var_d23fea4f) {
            if (isdefined(s_position.mdl_pos)) {
                s_position.mdl_pos clientfield::set("" + #"hash_1b509b0ba634a25a", 0);
                util::wait_network_frame();
                s_position.mdl_pos delete();
            }
            if (isdefined(s_position.mdl_fx)) {
                s_position.mdl_fx clientfield::set("" + #"hash_1390e08de02cbdc7", 0);
                util::wait_network_frame();
                s_position.mdl_fx delete();
            }
            if (isdefined(s_position.var_3cefdbf5)) {
                s_position.var_3cefdbf5 notsolid();
                s_position.var_3cefdbf5 connectpaths();
                s_position.var_3cefdbf5 delete();
            }
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 2, eflags: 0x5 linked
// Checksum 0x7a30d1e0, Offset: 0xa1f0
// Size: 0x252
function private function_fcf197fa(targetname, show) {
    blockers = getentarray(targetname, "targetname");
    if (isdefined(blockers)) {
        foreach (blocker in blockers) {
            if (isdefined(blocker.target) && _open_arcs(blocker)) {
                var_c819ac8 = getentarray(blocker.target, "targetname");
                if (isdefined(var_c819ac8)) {
                    foreach (var_1d6a70e8 in var_c819ac8) {
                        if (isdefined(var_1d6a70e8.objectid) && !var_1d6a70e8 zm_utility::function_1a4d2910()) {
                            switch (var_1d6a70e8.objectid) {
                            case #"symbol_back_debris":
                            case #"symbol_front_power":
                            case #"symbol_back":
                            case #"symbol_front":
                            case #"symbol_front_debris":
                            case #"symbol_back_power":
                                if (show) {
                                    var_1d6a70e8 show();
                                } else {
                                    var_1d6a70e8 ghost();
                                }
                                break;
                            default:
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x5 linked
// Checksum 0x403123a5, Offset: 0xa450
// Size: 0x58
function private _open_arcs(blocker) {
    if (isdefined(blocker.script_noteworthy) && (blocker.script_noteworthy == "electric_door" || blocker.script_noteworthy == "local_electric_door")) {
        return 0;
    }
    return 1;
}

