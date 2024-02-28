// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_white_util.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_white_ww_quest_modkit;

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 0, eflags: 0x1 linked
// Checksum 0x38a247b0, Offset: 0x380
// Size: 0x28c
function init() {
    level.var_57f4595b = [];
    level.var_57f4595b[0] = getweapon("ray_gun_mk2v");
    level.var_57f4595b[1] = getweapon("ray_gun_mk2x");
    level.var_57f4595b[2] = getweapon("ray_gun_mk2y");
    level.var_57f4595b[3] = getweapon("ray_gun_mk2z");
    level.var_88cb369b = [];
    level.var_88cb369b[0] = "zm_white_ww_mk2v_ammo";
    level.var_88cb369b[1] = "zm_white_ww_mk2x_ammo";
    level.var_88cb369b[2] = "zm_white_ww_mk2y_ammo";
    level.var_88cb369b[3] = "zm_white_ww_mk2z_ammo";
    level.var_380f8974 = [];
    level.var_380f8974[0] = "yellow";
    level.var_380f8974[1] = "purple";
    level.var_380f8974[2] = "orange";
    level.var_380f8974[3] = "magenta_pink";
    level.var_aa3c02c3 = getentarray("ww_modkit_part", "targetname");
    array::run_all(level.var_aa3c02c3, &hide);
    level flag::init(#"hash_6f791dc137e0b695");
    if (zm_utility::is_standard() || !zm_custom::function_901b751c(#"zmwonderweaponisenabled")) {
        function_456e91dd();
        zm_crafting::function_ca244624(#"hash_586280338ab7ad11");
    }
    start_step_1();
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 0, eflags: 0x1 linked
// Checksum 0x8c8828cb, Offset: 0x618
// Size: 0x130
function function_456e91dd() {
    a_w_parts = array(getweapon(#"hash_eb070d4a71cdba8"), getweapon(#"hash_eb073d4a71ce0c1"), getweapon(#"hash_eb072d4a71cdf0e"));
    a_e_items = getitemarray();
    foreach (e_item in a_e_items) {
        if (isinarray(a_w_parts, e_item.item)) {
            e_item delete();
        }
    }
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 0, eflags: 0x0
// Checksum 0xb9f09026, Offset: 0x750
// Size: 0x8a
function function_269676a2() {
    foreach (var_780f21bf in level.var_57f4595b) {
        if (self zm_weapons::has_weapon_or_upgrade(var_780f21bf)) {
            return 1;
        }
    }
    return 0;
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 0, eflags: 0x1 linked
// Checksum 0xf585a13a, Offset: 0x7e8
// Size: 0x54
function start_step_1() {
    zm_crafting::function_d1f16587(#"hash_586280338ab7ad11", &modkit_crafted);
    level flag::init(#"ww_modkit_crafted");
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 1, eflags: 0x1 linked
// Checksum 0xf5fbc922, Offset: 0x848
// Size: 0x94
function modkit_crafted(e_player) {
    array::run_all(level.var_aa3c02c3, &show);
    level flag::set(#"ww_modkit_crafted");
    modkit_init();
    if (zm_utility::is_classic()) {
        e_player zm_hms_util::function_51b752a9("vox_ww_kit_built");
    }
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 0, eflags: 0x0
// Checksum 0x5dbb0bdb, Offset: 0x8e8
// Size: 0x74
function function_1665b086() {
    function_456e91dd();
    level.var_4fe2f84d[#"hash_586280338ab7ad11"][0] zm_crafting::function_a187b293(getplayers()[0]);
    zm_crafting::function_ca244624(#"hash_586280338ab7ad11");
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 0, eflags: 0x1 linked
// Checksum 0xf66e917d, Offset: 0x968
// Size: 0x9c
function modkit_init() {
    s_modkit = struct::get("ww_modkit");
    s_unitrigger = s_modkit zm_unitrigger::create(&modkit_hint, 64);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    zm_unitrigger::function_89380dda(s_unitrigger);
    s_modkit thread modkit_think();
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 1, eflags: 0x1 linked
// Checksum 0x2cf4a5b9, Offset: 0xa10
// Size: 0x238
function modkit_hint(e_player) {
    if (self.stub.related_parent.b_in_use === 1) {
        return 0;
    }
    if (level.var_7629d4e2 === 1) {
        return 0;
    }
    var_2c09b688 = e_player zm_white_util::function_c7274071();
    if (zm_white_util::function_c654e39a(var_2c09b688)) {
        self sethintstring(#"hash_253d93e1249b135c");
    } else if (e_player.var_382b64f2 !== 1) {
        self sethintstring(#"hash_38c5e4e71fc96473");
    } else if (!isdefined(e_player.var_f7694097)) {
        self sethintstring(#"hash_385e1ce240650791");
    } else {
        str_weapon_name = level.var_57f4595b[e_player.var_f7694097].displayname;
        if (e_player.currentweapon.isheroweapon === 1 || e_player.currentweapon.name === #"hash_603fdd2e4ae5b2b0") {
            self sethintstring("");
        } else if (isdefined(var_2c09b688)) {
            self sethintstring(zm_utility::function_d6046228(#"hash_172253c9314825fc", #"hash_71016e43b6fe0570"), str_weapon_name, var_2c09b688.displayname);
        } else {
            self sethintstring(zm_utility::function_d6046228(#"hash_314a7588b45256eb", #"hash_6831cfd35264e1"), str_weapon_name);
        }
    }
    return 1;
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 0, eflags: 0x1 linked
// Checksum 0xf7399e76, Offset: 0xc50
// Size: 0xe8
function modkit_think() {
    self endon(#"death");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"trigger_activated");
        e_player = s_notify.e_who;
        if (isdefined(e_player.var_f7694097) && e_player.var_382b64f2 === 1 && e_player.currentweapon.isheroweapon === 0 && e_player.currentweapon.name !== #"hash_603fdd2e4ae5b2b0") {
            self thread function_584d6092(e_player);
        }
    }
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 1, eflags: 0x1 linked
// Checksum 0xb86ba7a4, Offset: 0xd40
// Size: 0x1ea
function function_584d6092(e_user) {
    self endon(#"death");
    self.b_in_use = 1;
    s_scene = struct::get("chemistry_fluid_scene");
    s_scene thread function_9dc2db01(0.1, level.var_380f8974[e_user.var_f7694097]);
    if (isdefined(e_user)) {
        w_ray_gun = e_user zm_white_util::function_c7274071();
        if (isdefined(w_ray_gun)) {
            e_user zm_weapons::weapon_take(w_ray_gun);
        }
        e_user zm_weapons::weapon_give(level.var_57f4595b[e_user.var_f7694097]);
        e_user notify(#"hash_13f3f231b45420ef", {#e_player:e_user});
        level notify(#"hash_13f3f231b45420ef");
        if (zm_utility::is_trials()) {
            level flag::set(#"hash_6f791dc137e0b695");
        }
    }
    zm_ui_inventory::function_7df6bb60("zm_white_ww_husk_part", 0, e_user);
    zm_ui_inventory::function_7df6bb60(level.var_88cb369b[e_user.var_f7694097], 0, e_user);
    e_user.var_382b64f2 = undefined;
    e_user.var_f7694097 = undefined;
    e_user.var_9c20e2c9 = undefined;
    wait(4.1);
    self.b_in_use = undefined;
}

// Namespace zm_white_ww_quest_modkit/zm_white_ww_quest_modkit
// Params 2, eflags: 0x1 linked
// Checksum 0xa1ed8a1c, Offset: 0xf38
// Size: 0x1f4
function function_9dc2db01(var_4bef01e6, str_color) {
    self scene::play("init");
    e_model = self.scene_ents[#"fluid"];
    switch (str_color) {
    case #"green":
        e_model setmodel("p8_zm_whi_chemistry_kit_cannister_fluid_01_green");
        break;
    case #"red":
        e_model setmodel("p8_zm_whi_chemistry_kit_cannister_fluid_01_red");
        break;
    case #"yellow":
        e_model setmodel("p8_zm_whi_chemistry_kit_cannister_fluid_01_yellow");
        break;
    case #"orange":
        e_model setmodel("p8_zm_whi_chemistry_kit_cannister_fluid_01_orange");
        break;
    case #"purple":
        e_model setmodel("p8_zm_whi_chemistry_kit_cannister_fluid_01_purple");
        break;
    case #"blue":
        e_model setmodel("p8_zm_whi_chemistry_kit_cannister_fluid_01_blue");
        break;
    case #"magenta_pink":
        e_model setmodel("p8_zm_whi_chemistry_kit_cannister_fluid_01_magenta_pink");
        break;
    }
    self scene::play("fill");
    wait(var_4bef01e6);
    self scene::play("empty");
}

