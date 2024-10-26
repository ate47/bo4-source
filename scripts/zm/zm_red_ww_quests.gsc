#using scripts\zm\ai\zm_ai_catalyst.gsc;
#using scripts\zm\zm_red.gsc;
#using scripts\zm\zm_red_util.gsc;
#using scripts\zm\weapons\zm_weap_hand_gaia.gsc;
#using scripts\zm\weapons\zm_weap_hand_hemera.gsc;
#using scripts\zm\weapons\zm_weap_hand_charon.gsc;
#using scripts\zm\weapons\zm_weap_hand_ouranos.gsc;
#using scripts\zm\perk\zm_perk_mod_additionalprimaryweapon.gsc;
#using scripts\zm\perk\zm_perk_mod_quick_revive.gsc;
#using script_8dca41f2d7c91bc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_4d00889cf8c807d5;
#using script_3aa54d3cb36ea43f;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using script_3e5ec44cfab7a201;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\ai\archetype_catalyst.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\debug_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_red_ww_quests;

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xf059358d, Offset: 0x13e8
// Size: 0xe9c
function init() {
    if (!zm_custom::function_901b751c(#"zmwonderweaponisenabled") || zm_utility::is_standard()) {
        var_9c3c3654 = getentarray("light_initiation_blocker", "targetname");
        var_9c3c3654 = arraycombine(var_9c3c3654, getentarray("death_initiation_blocker", "targetname"), 0, 0);
        var_9c3c3654 = arraycombine(var_9c3c3654, getentarray("air_initiation_blocker", "targetname"), 0, 0);
        var_9c3c3654 = arraycombine(var_9c3c3654, getentarray("earth_initiation_blocker", "targetname"), 0, 0);
        foreach (mdl_clip in var_9c3c3654) {
            mdl_clip setinvisibletoall();
            mdl_clip notsolid();
        }
        return;
    }
    function_a3e12f96();
    var_5f0c1df8 = getminbitcountfornum(4);
    clientfield::register("scriptmover", "" + #"hash_4195d99bef577e46", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_7fb27e0252c756b", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_1d886dddf28e80bc", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_1cdf2252d9f82767", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_1bf7e7b03fec9e45", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_776a3c21050eaa0", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4e65af2ec1b830f7", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_7f97409952dd051b", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4ff047c7bc266fd7", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5e8e9f6599d57c0a", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5faf31a2c4d4f4c6", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_54b4fbe8e74caf21", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4b6213be97ba0c98", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_66d67792eeae46ac", 16000, 1, "counter");
    clientfield::register("allplayers", "" + #"hash_1b4d6dabd35ebdf2", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_11e36d278c735869", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_e683dccc6a8e152", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5208f90a0114c9e", 16000, var_5f0c1df8, "int");
    clientfield::register("scriptmover", "" + #"hash_2c52721cfd82bab2", 16000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_e2692f239454272", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_27e137de4035c3b3", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_3a38a1d1eda0d02f", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_720392b899f6e8f8", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_6d443dd8ae685236", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_23ba81a7c071845d", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_194ece8e9166daad", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5d3f9aab20abf568", 16000, getminbitcountfornum(3), "int");
    clientfield::register("scriptmover", "" + #"hash_3c85334429a971b4", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"ouranos_feather_hit_fx", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_3a6cd708b9ee114c", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_3e1feb871865ccd5", 16000, 1, "int");
    clientfield::register("actor", "" + #"ww_combat_fx", 16000, getminbitcountfornum(4), "int");
    namespace_617a54f4::function_d8383812(#"ww_sc_earth", 16000, "ww_sc_g", &is_soul_capture, &soul_captured, 1);
    namespace_617a54f4::function_d8383812(#"ww_sc_death", 16000, "ww_sc_c", &is_soul_capture, &soul_captured, 1);
    namespace_617a54f4::function_d8383812(#"ww_sc_light", 16000, "ww_sc_h", &is_soul_capture, &soul_captured, 1);
    namespace_617a54f4::function_d8383812(#"ww_sc_air", 16000, "ww_sc_o", &is_soul_capture, &soul_captured, 1);
    level.var_bd33ecba = level.zombie_ai_limit;
    if (!isdefined(level.var_bd33ecba)) {
        level.var_bd33ecba = 24;
    }
    callback::on_connect(&on_player_connect);
    callback::on_disconnect(&on_player_disconnect);
    callback::function_33f0ddd3(&function_6ef2b98f);
    callback::on_ai_killed(&function_cb939976);
    level.var_67713b46 = &function_d271c27e;
    level.var_3e3d6409 = &function_f5f50d2b;
    level.var_66153d2c = [];
    spawner::function_89a2cd87(#"catalyst", &function_3f05435f);
    zm_player::function_a827358a(&on_player_damage);
    level thread function_9c17f532();
    if (!isdefined(level.var_d7522ea)) {
        level.var_d7522ea = new throttle();
        [[ level.var_d7522ea ]]->initialize(3, 0.1);
    }
    function_809767d(#"light");
    function_809767d(#"death");
    function_809767d(#"air");
    function_809767d(#"earth");
    zm_perk_mod_additionalprimaryweapon::function_69f490a(array(getweapon("ww_hand_h_uncharged"), getweapon("ww_hand_c_uncharged"), getweapon("ww_hand_g_uncharged"), getweapon("ww_hand_o_uncharged"), getweapon("ww_hand_h_upgraded"), getweapon("ww_hand_c_upgraded"), getweapon("ww_hand_g_upgraded"), getweapon("ww_hand_o_upgraded"), getweapon("ww_hand_h"), getweapon("ww_hand_c"), getweapon("ww_hand_g"), getweapon("ww_hand_o")));
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xfd2f0e1e, Offset: 0x2290
// Size: 0x6ac
function function_9c17f532() {
    var_932ea4fb = [];
    var_932ea4fb[0] = #"hash_1283dd41ca957b54";
    var_932ea4fb[1] = #"hash_1283e041ca95806d";
    var_932ea4fb[2] = #"hash_1283df41ca957eba";
    var_932ea4fb[3] = #"hash_1283da41ca95763b";
    var_932ea4fb[4] = #"hash_1283d941ca957488";
    var_932ea4fb[5] = #"hash_1283dc41ca9579a1";
    var_932ea4fb[6] = #"hash_1283db41ca9577ee";
    var_932ea4fb[7] = #"hash_1283d641ca956f6f";
    var_932ea4fb[8] = #"hash_1283d541ca956dbc";
    var_932ea4fb[9] = #"hash_b8c5acb3c00aaec";
    var_932ea4fb[10] = #"hash_b8c5bcb3c00ac9f";
    var_932ea4fb[11] = #"hash_b8c5ccb3c00ae52";
    var_932ea4fb[12] = #"hash_b8c5dcb3c00b005";
    var_932ea4fb[13] = #"hash_b8c56cb3c00a420";
    var_932ea4fb[14] = #"hash_b8c57cb3c00a5d3";
    var_932ea4fb[15] = #"hash_b8c58cb3c00a786";
    var_932ea4fb[16] = #"hash_b8c59cb3c00a939";
    var_932ea4fb[17] = #"hash_b8c62cb3c00b884";
    var_932ea4fb[18] = #"hash_b8c63cb3c00ba37";
    var_932ea4fb[19] = #"hash_b966ccb3c091e07";
    var_c1231c37[0] = #"hash_7b4a3cf3b143436a";
    var_c1231c37[1] = #"hash_22f1026b321ace65";
    var_c1231c37[2] = #"hash_1750dbb6aad726e4";
    var_c1231c37[3] = #"hash_11150d7d8bb08b6d";
    var_c1231c37[4] = #"hash_7ab942a3510a767";
    var_c1231c37[5] = #"hash_72ead4f09100f7a7";
    var_c1231c37[6] = #"hash_10c8553d48a79af3";
    var_c1231c37[7] = #"hash_665ab7c50aea32a";
    var_c1231c37[8] = #"hash_372c81df781f0287";
    var_c1231c37[9] = #"hash_5ec9c1953513bd3e";
    var_c1231c37[10] = #"hash_d63b8c5ed8cb060";
    var_c1231c37[11] = #"hash_8b809a727dc1c6e";
    var_c1231c37[12] = #"hash_7d8da2a380b75551";
    var_c1231c37[13] = #"hash_10e887d95fef1678";
    var_c1231c37[14] = #"hash_2aad936970462330";
    var_c1231c37[15] = #"hash_e16370a98ce32e7";
    var_c1231c37[16] = #"hash_f09467115bf5b17";
    var_c1231c37[17] = #"hash_636d6777ed3fc946";
    var_c1231c37[18] = #"hash_51230e1015ce6b0e";
    var_c1231c37[19] = #"hash_59860fd1852b2d19";
    a_e_hands = getentarray("s_ww_quests_dormant_hand", "script_noteworthy");
    foreach (e_hand in a_e_hands) {
        e_hand hide();
    }
    a_hands = arraycombine(a_e_hands, struct::get_array(#"s_ww_quests_dormant_hand", "script_noteworthy"), 0, 0);
    a_e_hands = undefined;
    var_2830afe6 = [];
    foreach (hand in a_hands) {
        hand.str_clue = var_932ea4fb[hand.script_int];
        hand.var_71e93cfb = var_c1231c37[hand.script_int];
        if (hand.script_string === #"light") {
            array::add(var_2830afe6, hand);
        }
    }
    var_f9a57be7[0] = array::random(var_2830afe6);
    arrayremovevalue(a_hands, var_f9a57be7[0]);
    n_hands = 4;
    if (getdvarint(#"hash_2b72f64d1e7c19b9", 0)) {
        n_hands = 20;
    }
    for (i = 1; i < n_hands; i++) {
        var_f9a57be7[i] = array::random(a_hands);
        arrayremovevalue(a_hands, var_f9a57be7[i]);
    }
    /#
        level.var_f9a57be7 = var_f9a57be7;
    #/
    level thread function_65bda766(var_f9a57be7);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xebce746a, Offset: 0x2948
// Size: 0x2c0
function function_65bda766(a_hands) {
    level endon(#"end_game");
    level flag::wait_till("all_players_spawned");
    scene::add_scene_func(#"p8_fxanim_zm_red_ww_handle_float_bundle", &function_a7e94e36);
    foreach (hand in a_hands) {
        if (hand.model === #"p8_fxanim_zm_red_ww_vase_mod" || hand.model === #"p8_fxanim_zm_red_ww_shell_chaos_mod") {
            hand thread function_5e0885f9();
        } else {
            hand thread function_7e94450c();
        }
        hand thread function_95a52218();
    }
    level flag::wait_till("power_on");
    vol_ww_oracle = getent("vol_ww_oracle", "targetname");
    while (true) {
        foreach (e_player in util::get_active_players()) {
            if (isdefined(e_player.var_93666696) && e_player.var_93666696 > 0) {
                continue;
            }
            if (e_player istouching(vol_ww_oracle)) {
                e_player.var_93666696 = randomintrangeinclusive(90, 120);
                e_player thread ww_oracle_cooldown();
                var_85a6dbde = e_player thread function_f72adc9d(a_hands);
            }
        }
        wait 0.25;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x2f19a956, Offset: 0x2c10
// Size: 0x86
function ww_oracle_cooldown() {
    vol_ww_oracle = getent("vol_ww_oracle_cooldown", "targetname");
    self endon(#"disconnect");
    while (self.var_93666696 > 0) {
        if (isdefined(vol_ww_oracle) && !self istouching(vol_ww_oracle)) {
            self.var_93666696--;
        }
        wait 1;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x635fe97, Offset: 0x2ca0
// Size: 0x292
function function_f72adc9d(a_s_hands) {
    self endon(#"disconnect");
    foreach (s_hand in a_s_hands) {
        if (s_hand.var_b1cb5669 === self && !s_hand flag::get(#"hash_35c0d9f1ff884fce")) {
            b_say = self zm_vo::vo_say(s_hand.var_71e93cfb, 0, 1, 9999, 1, 1, 1);
            return true;
        }
    }
    foreach (s_hand in a_s_hands) {
        if (!isdefined(s_hand.var_b1cb5669) && !s_hand flag::get(#"hash_35c0d9f1ff884fce")) {
            s_hand.var_b1cb5669 = self;
            b_say = self zm_vo::vo_say(s_hand.var_71e93cfb, 0, 1, 9999, 1, 1, 1);
            return true;
        }
    }
    foreach (s_hand in a_s_hands) {
        if (!s_hand flag::get(#"hash_35c0d9f1ff884fce")) {
            b_say = self zm_vo::vo_say(s_hand.var_71e93cfb, 0, 1, 9999, 1, 1, 1);
            return true;
        }
    }
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x0
// Checksum 0x64efded0, Offset: 0x2f40
// Size: 0x54
function function_4a16a553(str_clue) {
    for (i = 0; i < 3; i++) {
        /#
            self iprintlnbold(str_clue);
        #/
        wait 1;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xa86a9c34, Offset: 0x2fa0
// Size: 0x1a4
function function_95a52218() {
    level endon(#"end_game");
    self flag::init(#"hash_35c0d9f1ff884fce");
    self flag::init(#"hash_656721b8c4297ad5");
    s_result = self waittill(#"hash_6858bc0ef6a5b4b1");
    if (!(isdefined(s_result.e_player.var_4bb711cf) && s_result.e_player.var_4bb711cf)) {
        s_result.e_player.var_4bb711cf = 1;
        s_result.e_player thread zm_vo::function_a2bd5a0c(#"hash_4763c20dec1c2a7", 0, 1, 9999, 1);
    }
    self.var_2db8b01a = s_result.var_2db8b01a;
    self flag::set(#"hash_656721b8c4297ad5");
    s_unitrigger = self zm_unitrigger::create(&function_c573751a, (64, 64, 128));
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
    self thread function_cf82cb0b();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xb50a4dfe, Offset: 0x3150
// Size: 0x2a6
function function_7e94450c() {
    e_brick = util::spawn_model(self.model, self.origin, self.angles);
    self.model = e_brick.model;
    e_brick clientfield::set("" + #"hash_23ba81a7c071845d", 1);
    t_damage = self function_4186be5f();
    /#
        self.t_damage = t_damage;
    #/
    self.n_health = 10000;
    array::thread_all(getplayers(), &function_aaaf780e, self, t_damage);
    while (!(isdefined(self.var_b542e87f) && self.var_b542e87f)) {
        s_waitresult = t_damage waittill(#"damage");
        e_player = s_waitresult.attacker;
        if (s_waitresult.mod === "MOD_MELEE") {
            break;
        }
        self.n_health -= s_waitresult.amount;
        if (self.n_health <= 9400) {
            break;
        }
    }
    if (self.model === #"p8_fxanim_zm_red_ww_shell_rubble_mod") {
        e_brick thread scene::play(#"hash_23eb09f6191aa0c7", "Shot 1", e_brick);
    } else {
        e_brick thread scene::play(#"hash_71a4fbf82c039a2", "Shot 1", e_brick);
    }
    e_brick clientfield::set("" + #"hash_23ba81a7c071845d", 0);
    t_damage delete();
    self notify(#"hash_6858bc0ef6a5b4b1", {#e_player:e_player, #var_2db8b01a:e_brick.scene_ents[#"prop 1"]});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x262098d1, Offset: 0x3400
// Size: 0x13e
function function_5e0885f9() {
    self show();
    self clientfield::set("" + #"hash_23ba81a7c071845d", 1);
    self function_4186be5f();
    self thread function_10310ecb();
    array::thread_all(getplayers(), &function_fa621ff5, self);
    s_notify = self waittill(#"death");
    self clientfield::set("" + #"hash_23ba81a7c071845d", 0);
    waitframe(1);
    self notify(#"hash_6858bc0ef6a5b4b1", {#e_player:s_notify.attacker, #var_2db8b01a:self});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xb6151fcc, Offset: 0x3548
// Size: 0xb0
function function_10310ecb() {
    self endon(#"death");
    while (true) {
        s_result = self waittill(#"damage");
        if (isplayer(s_result.attacker) && s_result.mod === "MOD_MELEE") {
            self dodamage(self.health + 100, self.origin, s_result.attacker);
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x81b5c475, Offset: 0x3600
// Size: 0x138
function function_fa621ff5(e_destructible) {
    self endon(#"disconnect");
    e_destructible endon(#"death");
    while (true) {
        s_waitresult = self waittill(#"weapon_melee");
        if (isplayer(self) && s_waitresult.weapon == getweapon(#"zhield_zpear_dw") && self util::is_looking_at(e_destructible.origin) && distance2d(e_destructible.origin, self.origin) < 100) {
            e_destructible dodamage(e_destructible.health + 100, e_destructible.origin, self);
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x24043bfb, Offset: 0x3740
// Size: 0x15e
function function_4186be5f() {
    switch (self.model) {
    case #"p8_fxanim_zm_red_ww_vase_mod":
        n_trigger_radius = 9;
        n_trigger_height = 23;
        break;
    case #"p8_fxanim_zm_red_ww_shell_mound_dks_mod":
        n_trigger_radius = 22;
        n_trigger_height = 13;
        b_spawn_trigger = 1;
        break;
    case #"p8_fxanim_zm_red_ww_shell_mound_mod":
        n_trigger_radius = 22;
        n_trigger_height = 13;
        b_spawn_trigger = 1;
        break;
    case #"p8_fxanim_zm_red_ww_shell_chaos_mod":
        n_trigger_radius = 7;
        n_trigger_height = 24;
        break;
    case #"p8_fxanim_zm_red_ww_shell_rubble_mod":
        n_trigger_radius = 15;
        n_trigger_height = 19;
        b_spawn_trigger = 1;
        break;
    }
    self.n_trigger_height = n_trigger_height;
    if (isdefined(b_spawn_trigger) && b_spawn_trigger) {
        t_damage = spawn("trigger_damage", self.origin, 0, n_trigger_radius, n_trigger_height);
        return t_damage;
    }
    return undefined;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0xf93fc6b, Offset: 0x38a8
// Size: 0x14e
function function_aaaf780e(var_87658653, t_damage) {
    self endon(#"disconnect");
    var_87658653 endon(#"hash_656721b8c4297ad5");
    v_lookat = (var_87658653.origin[0], var_87658653.origin[1], var_87658653.origin[2] + var_87658653.n_trigger_height * 0.5);
    while (true) {
        self waittill(#"weapon_melee");
        if (isdefined(self) && self util::is_looking_at(v_lookat) && distance2d(var_87658653.origin, self.origin) < 100) {
            t_damage notify(#"damage", {#mod:"MOD_MELEE", #attacker:self});
            return;
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x290a012, Offset: 0x3a00
// Size: 0x44c
function function_cf82cb0b() {
    level endon(#"end_game");
    self flag::clear(#"hash_35c0d9f1ff884fce");
    v_origin = self.var_2db8b01a gettagorigin("tag_handle_attach");
    v_angles = self.var_2db8b01a gettagangles("tag_handle_attach");
    mdl_hand = util::spawn_model("p8_zm_red_gauntlet_handle", v_origin, v_angles);
    mdl_hand clientfield::set("" + #"hash_23ba81a7c071845d", 1);
    while (true) {
        s_waitresult = self waittill(#"trigger_activated");
        e_player = s_waitresult.e_who;
        if (e_player flag::get(#"hash_664c4b8d9b3d0237") || isdefined(e_player function_996fee51())) {
            continue;
        }
        break;
    }
    if (!(isdefined(e_player.var_c04a6a5d) && e_player.var_c04a6a5d)) {
        e_player.var_c04a6a5d = 1;
        e_player thread zm_vo::vo_say(#"hash_762892b530ae89ea", 0.5, 1, 9999, 1, 1);
    }
    e_player playsound(#"hash_320de21d8b9468da");
    e_player flag::set(#"hash_664c4b8d9b3d0237");
    e_player thread function_f25f67a7();
    self flag::set(#"hash_35c0d9f1ff884fce");
    mdl_hand clientfield::set("" + #"hash_23ba81a7c071845d", 0);
    mdl_hand ghost();
    foreach (s_quest in level.var_d225ea18) {
        if (s_quest.var_a1327d58.var_afda9f06 === e_player) {
            s_quest.var_a1327d58.var_481aa649 = 1;
        }
        foreach (s_quest in level.var_d225ea18) {
            var_5d53d3c9 = getent(s_quest.var_52584ae6, "targetname");
            var_5d53d3c9 clientfield::set("" + #"hash_7f97409952dd051b", 1);
            var_5d53d3c9 setvisibletoplayer(e_player);
        }
    }
    self thread function_f5639b00(e_player);
    wait 0.25;
    mdl_hand delete();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x3a85bc7, Offset: 0x3e58
// Size: 0x218
function function_c573751a(e_player) {
    var_2d61b4e1 = self.stub.related_parent flag::get(#"hash_656721b8c4297ad5");
    var_ba96a60e = e_player flag::get(#"hash_664c4b8d9b3d0237");
    var_ad6f56cb = self.stub.related_parent flag::get(#"hash_35c0d9f1ff884fce");
    var_b37a7d1e = e_player function_996fee51();
    if (zm_utility::is_player_valid(e_player, 0, 0) && !var_ba96a60e && !var_ad6f56cb && !isdefined(var_b37a7d1e) && var_2d61b4e1) {
        str_prompt = zm_utility::function_d6046228(#"hash_5e941bfa3ee0c59e", #"hash_253df7299a5a534a");
        self sethintstringforplayer(e_player, str_prompt);
        return 1;
    }
    if (zm_utility::is_player_valid(e_player, 0, 0) && (var_ba96a60e && var_2d61b4e1 || isdefined(var_b37a7d1e)) && !var_ad6f56cb) {
        self sethintstringforplayer(e_player, #"hash_719d534973590d24");
        return 1;
    }
    self sethintstringforplayer(e_player, "");
    return 0;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x25f995d7, Offset: 0x4078
// Size: 0x1484
function function_809767d(str_hand) {
    s_quest = spawnstruct();
    level.var_d225ea18[str_hand] = s_quest;
    switch (str_hand) {
    case #"light":
        var_16ba625b = #"hash_6efbb1ed3ba548d9";
        var_55661332 = #"hash_90bc5de7964eaa0";
        var_c2f7f323 = #"hash_5827ff8b059b77f3";
        var_4a8b8254 = "light_initiation_spawn";
        var_e9198efc = "s_ww_quest_light_spawn";
        var_e6a4592d = "zone_ww_quest_light";
        var_9bd3a2c6 = #"hash_2b1854c38e3be747";
        var_deb1f081 = #"hash_5a73ea61f09603bf";
        var_d39cfea7 = 3;
        s_quest.var_f94ca998 = "fxexp_wq_h_portal";
        s_quest.var_83a4152c = "fxexp_wq_h_portal_return";
        s_quest.var_4d50be8e = "fxexp_wq_h_portal_p";
        s_quest.var_99aa2e37 = #"hash_4ac1073c8fc24cfc";
        s_quest.var_7c6b53db = #"hash_3b91b084eadff65e";
        s_quest.var_eaa1f384 = #"hash_14dfce1123c05a79";
        s_quest.var_29f1fc2d = #"hash_4c08d1414859cc60";
        s_quest.var_bcd22670 = #"hash_e785e77e310b16d";
        s_quest.var_647f1375 = #"hash_2b394f251b9ab685";
        s_quest.var_78b18870 = #"hash_3eaf25c84b92c2e1";
        s_quest.var_f72f5053 = #"hash_4dc10c417b2d65ce";
        s_quest.var_723cad8 = #"hash_137b801137c6840";
        mdl_uncharged_hand = getent("mdl_ww_uncharged_hand_light", "targetname");
        w_uncharged_hand = getweapon(#"ww_hand_h_uncharged");
        w_charged_hand = getweapon(#"ww_hand_h");
        s_quest.var_e5b61ee5 = getweapon(#"ww_hand_h_upgraded");
        var_f172b16e = "" + #"hash_6d443dd8ae685236";
        s_quest.var_ea3032ca = "" + #"hash_1d886dddf28e80bc";
        var_a1327d58 = struct::get(#"s_ww_quests_light_box_interact");
        var_c476e1d9 = zm_utility::function_d6046228(#"hash_7bd41ec2e270824f", #"hash_6a0d5c52cd36b8ed");
        var_525d0532 = zm_utility::function_d6046228(#"hash_120d8fea3a066b71", #"hash_6df4c8cf91989af");
        var_cffb5613 = #"hash_3fcd7430982303db";
        var_7c70e392 = "maps/zm_red/fx8_wq_dormant_transform_hemera";
        var_ed424981 = struct::get(#"hash_11785273441947e2");
        var_5357def6 = struct::get(#"hash_5c5c740575b4e9f4");
        var_eafa668c = "light_initiation_blocker";
        var_52584ae6 = "light_initiation_blocker_visual";
        var_5fc63180 = &function_60f650e3;
        var_8aea3d8d = &function_35d91981;
        var_8af9a7e8 = &function_c9d01f4f;
        var_52990614 = &function_419874c2;
        var_6486fc00 = 3;
        var_ad816fb3 = 2;
        break;
    case #"death":
        var_16ba625b = #"hash_16fccc5d2de6233b";
        var_55661332 = #"hash_7459df6b9257ed66";
        var_c2f7f323 = #"hash_786c9a9f60b254f5";
        var_4a8b8254 = "death_initiation_spawn";
        var_e9198efc = "s_ww_quest_death_spawn";
        var_e6a4592d = "zone_ww_quest_death";
        var_9bd3a2c6 = #"hash_44fcebf63da155c5";
        var_deb1f081 = #"hash_27fa9f75dc30dadd";
        var_39ceadb3 = #"hash_7ce546dbf9ee19dc";
        var_a04ebe57 = "" + #"hash_2c52721cfd82bab2";
        var_d39cfea7 = 1;
        s_quest.var_99aa2e37 = #"p8_fxanim_zm_red_ww_hand_charon_bundle";
        s_quest.var_7c6b53db = #"hash_1bf02c1e1384b7f3";
        s_quest.var_eaa1f384 = #"hash_1a5ab7c2ce78a244";
        s_quest.var_29f1fc2d = #"hash_4ece88057c2ca9af";
        s_quest.var_bcd22670 = #"hash_3aed70e1337a02ac";
        s_quest.var_647f1375 = #"hash_3791248064be5f0a";
        s_quest.var_78b18870 = #"hash_75fdbd0fb47043a6";
        s_quest.var_f72f5053 = #"hash_4978eae5057be225";
        s_quest.var_723cad8 = #"hash_1591f1fedee3d78d";
        mdl_uncharged_hand = getent("mdl_ww_uncharged_hand_death", "targetname");
        var_f172b16e = "" + #"hash_27e137de4035c3b3";
        s_quest.var_ea3032ca = "" + #"hash_7fb27e0252c756b";
        w_uncharged_hand = getweapon(#"ww_hand_c_uncharged");
        w_charged_hand = getweapon(#"ww_hand_c");
        s_quest.var_e5b61ee5 = getweapon(#"ww_hand_c_upgraded");
        var_a1327d58 = struct::get(#"s_ww_quests_death_box_interact");
        var_c476e1d9 = zm_utility::function_d6046228(#"hash_5fe4e8fa43024e11", #"hash_51d170c27ccc550f");
        var_525d0532 = zm_utility::function_d6046228(#"hash_354a203d51c5cd8b", #"hash_327b9f441a6e0541");
        var_cffb5613 = #"hash_53c692cad67c639c";
        var_7c70e392 = "maps/zm_red/fx8_wq_dormant_transform_charon";
        var_ed424981 = struct::get(#"hash_5df2c66c15f9e008");
        var_5357def6 = struct::get(#"hash_31764ff3e1aa55fa");
        var_eafa668c = "death_initiation_blocker";
        var_52584ae6 = "death_initiation_blocker_visual";
        var_5fc63180 = &function_652b2ac5;
        var_8af9a7e8 = &function_808746de;
        var_8aea3d8d = &function_3c79dc29;
        var_52990614 = &function_7b28cf91;
        var_6486fc00 = 3;
        var_ad816fb3 = 2;
        break;
    case #"air":
        var_16ba625b = #"hash_1e77360750691961";
        var_55661332 = #"hash_7ebdb2c972023c18";
        var_c2f7f323 = #"hash_3b7c39d9b76689fb";
        var_4a8b8254 = "air_initiation_spawn";
        var_e9198efc = "s_ww_quest_air_spawn";
        var_e6a4592d = "zone_ww_quest_air";
        var_9bd3a2c6 = #"hash_3214276b0ae322cf";
        var_deb1f081 = #"hash_41d1f3e4a9bf3ae7";
        var_39ceadb3 = #"hash_a84aad49ce8f48e";
        var_d39cfea7 = 2;
        s_quest.var_f94ca998 = "fxexp_wq_o_portal";
        s_quest.var_83a4152c = "fxexp_wq_o_portal_return";
        s_quest.var_4d50be8e = "fxexp_wq_o_portal_p";
        s_quest.var_99aa2e37 = #"p8_fxanim_zm_red_ww_hand_ouranos_bundle";
        s_quest.var_7c6b53db = #"hash_1e66eec2fba6abdf";
        s_quest.var_eaa1f384 = #"hash_3393f5b9c2830aa0";
        s_quest.var_29f1fc2d = #"hash_368446c66a3fc8cb";
        s_quest.var_bcd22670 = #"hash_57285bb33ab50600";
        s_quest.var_647f1375 = #"hash_6f92861cecef280e";
        s_quest.var_78b18870 = #"hash_7bf2313c99f89a62";
        s_quest.var_f72f5053 = #"hash_3195703b0c9c24b9";
        s_quest.var_723cad8 = #"hash_4446b28dae6b9f51";
        mdl_uncharged_hand = getent("mdl_ww_uncharged_hand_air", "targetname");
        var_f172b16e = "" + #"hash_3a38a1d1eda0d02f";
        s_quest.var_ea3032ca = "" + #"hash_1cdf2252d9f82767";
        w_uncharged_hand = getweapon(#"ww_hand_o_uncharged");
        w_charged_hand = getweapon(#"ww_hand_o");
        s_quest.var_e5b61ee5 = getweapon(#"ww_hand_o_upgraded");
        var_a1327d58 = struct::get(#"s_ww_quests_air_box_interact");
        var_c476e1d9 = zm_utility::function_d6046228(#"hash_572796ab0e1cbfe7", #"hash_7c267e16e45ff895");
        var_525d0532 = zm_utility::function_d6046228(#"hash_35b1ba2834df0699", #"hash_17451ec24ccee595");
        var_cffb5613 = #"hash_425708536132f236";
        var_7c70e392 = "maps/zm_red/fx8_wq_dormant_transform_ouranos";
        var_ed424981 = struct::get(#"hash_35fa18500c0d5e42");
        var_5357def6 = struct::get(#"hash_af3d6bfd3a556fc");
        var_eafa668c = "air_initiation_blocker";
        var_52584ae6 = "air_initiation_blocker_visual";
        var_5fc63180 = &function_29022c99;
        var_8af9a7e8 = &function_d5dcd2b0;
        var_52990614 = &function_35c395f1;
        var_6486fc00 = 60;
        var_ad816fb3 = 12;
        break;
    case #"earth":
        var_16ba625b = #"hash_694c6a1b6b8ea901";
        var_55661332 = #"hash_7798eb2a7d389438";
        var_c2f7f323 = #"hash_29ac8ec32d2a389b";
        var_4a8b8254 = "earth_initiation_spawn";
        var_e9198efc = "s_ww_quest_earth_spawn";
        var_e6a4592d = "zone_ww_quest_earth";
        var_9bd3a2c6 = #"hash_1615a9783593a50f";
        var_deb1f081 = #"hash_4bd467660f46fa07";
        var_d39cfea7 = 4;
        s_quest.var_99aa2e37 = #"p8_fxanim_zm_red_ww_hand_gaia_bundle";
        s_quest.var_7c6b53db = #"hash_1c0bcda26f980cd0";
        s_quest.var_eaa1f384 = #"hash_2fd6c824434bd277";
        s_quest.var_29f1fc2d = #"hash_21955c1b3abedef2";
        s_quest.var_bcd22670 = #"hash_7bc9bdaf4d490e57";
        s_quest.var_647f1375 = #"hash_67194a0d71625bef";
        s_quest.var_78b18870 = #"hash_75fdbd0fb47043a6";
        s_quest.var_f72f5053 = #"hash_207a52f6165120c8";
        s_quest.var_723cad8 = #"hash_5fa27320c347d3fa";
        mdl_uncharged_hand = getent("mdl_ww_uncharged_hand_earth", "targetname");
        var_f172b16e = "" + #"hash_720392b899f6e8f8";
        s_quest.var_ea3032ca = "" + #"hash_4195d99bef577e46";
        w_uncharged_hand = getweapon(#"ww_hand_g_uncharged");
        w_charged_hand = getweapon(#"ww_hand_g");
        s_quest.var_e5b61ee5 = getweapon(#"ww_hand_g_upgraded");
        var_a1327d58 = struct::get(#"s_ww_quests_earth_box_interact");
        var_c476e1d9 = zm_utility::function_d6046228(#"hash_542d9f1f5c0eb557", #"hash_330a65e00da6ea85");
        var_525d0532 = zm_utility::function_d6046228(#"hash_68942e9f65e72829", #"hash_325135d069c6e5f7");
        var_cffb5613 = #"hash_15b57cf1d527f801";
        var_7c70e392 = "maps/zm_red/fx8_wq_dormant_transform_gaia";
        var_ed424981 = struct::get(#"hash_3a6f44e6a7dad462");
        var_5357def6 = struct::get(#"hash_2a2b0c50c31c7cf4");
        var_eafa668c = "earth_initiation_blocker";
        var_52584ae6 = "earth_initiation_blocker_visual";
        var_5fc63180 = &function_dd1c5ae6;
        var_8af9a7e8 = &function_ca04e287;
        var_52990614 = &function_bde99aa3;
        var_6486fc00 = 60;
        var_ad816fb3 = 12;
        break;
    }
    s_quest.targetname = str_hand;
    s_quest.var_16ba625b = var_16ba625b;
    s_quest.var_55661332 = var_55661332;
    s_quest.var_c2f7f323 = var_c2f7f323;
    s_quest.var_7c70e392 = var_7c70e392;
    s_quest.var_4a8b8254 = var_4a8b8254;
    s_quest.var_e9198efc = var_e9198efc;
    s_quest.var_e6a4592d = var_e6a4592d;
    s_quest.var_9bd3a2c6 = var_9bd3a2c6;
    s_quest.var_deb1f081 = var_deb1f081;
    s_quest.var_39ceadb3 = var_39ceadb3;
    s_quest.var_a04ebe57 = var_a04ebe57;
    s_quest.var_d39cfea7 = var_d39cfea7;
    s_quest.mdl_uncharged_hand = mdl_uncharged_hand;
    s_quest.w_uncharged_hand = w_uncharged_hand;
    s_quest.w_charged_hand = w_charged_hand;
    array::add(level.var_66153d2c, s_quest.w_charged_hand);
    s_quest.var_6486fc00 = var_6486fc00;
    s_quest.var_ad816fb3 = var_ad816fb3;
    level flag::init(var_16ba625b);
    level flag::init(var_55661332);
    level flag::init(var_c2f7f323);
    level flag::init(#"hash_39100dea955077f2");
    var_a1327d58.var_c476e1d9 = var_c476e1d9;
    var_a1327d58.var_525d0532 = var_525d0532;
    s_quest.var_cffb5613 = var_cffb5613;
    s_quest.var_f172b16e = var_f172b16e;
    var_a1327d58.var_884c4b3a = w_uncharged_hand;
    s_unitrigger = var_a1327d58 zm_unitrigger::create(&function_9f665c5d, 64, &function_75fd2345);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
    var_a1327d58 flag::init(#"hash_58c0761173ca055");
    var_a1327d58 flag::init(#"hash_19f136c3e517eb81");
    var_a1327d58 flag::init(#"hash_582906087b67b7c6");
    var_a1327d58 flag::init(#"flag_ww_quests_portal_available");
    var_a1327d58 flag::init(#"hash_71e34916a790c3f");
    s_quest.var_a1327d58 = var_a1327d58;
    s_quest.var_9c3c3654 = getentarray(var_eafa668c, "targetname");
    s_quest.var_52584ae6 = var_52584ae6;
    foreach (mdl_clip in s_quest.var_9c3c3654) {
        mdl_clip setinvisibletoall();
        mdl_clip notsolid();
    }
    scene::add_scene_func(s_quest.var_99aa2e37, &function_a7e94e36);
    var_5d53d3c9 = getent(var_52584ae6, "targetname");
    var_5d53d3c9 setinvisibletoall();
    s_quest.var_ed424981 = var_ed424981;
    s_quest.var_5357def6 = var_5357def6;
    s_quest.var_8af9a7e8 = var_8af9a7e8;
    s_quest.var_52990614 = var_52990614;
    s_quest.var_8aea3d8d = var_8aea3d8d;
    s_quest.mdl_uncharged_hand hide();
    s_quest thread [[ var_5fc63180 ]]();
    s_quest.var_a1327d58 thread function_37c18ffd(str_hand);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x45678d93, Offset: 0x5508
// Size: 0x178
function on_player_disconnect() {
    self notify(#"hash_7fe6ca08732b8a1d", {#b_success:0});
    self notify(#"hash_4d89e2bb8e3d1eb3", {#b_success:0});
    self notify(#"hash_2026d806e71dfad5", {#b_success:0});
    if (!self util::is_spectating()) {
        var_2e07b8ff = self getweaponslistprimaries();
        foreach (w_weapon in var_2e07b8ff) {
            var_b6bc44ed = self getammocount(w_weapon);
            self thread function_841236e4(w_weapon, var_b6bc44ed);
            if (w_weapon === level.w_sprout) {
                self thread function_9ef120d8();
            }
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xf4dae4e2, Offset: 0x5688
// Size: 0x174
function function_6ef2b98f(eventstruct) {
    self endon(#"disconnect");
    var_b6bc44ed = self getammocount(eventstruct.weapon);
    waitframe(1);
    if (eventstruct.event == "take_weapon" && !self flag::get(#"ww_combat_active") && !(isdefined(self.var_7e19c3db) && self.var_7e19c3db)) {
        self thread function_841236e4(eventstruct.weapon, var_b6bc44ed);
    }
    if (eventstruct.event == "give_weapon" && isdefined(function_9b3e9487(eventstruct.weapon)) && function_9b3e9487(eventstruct.weapon) && self flag::get(#"hash_664c4b8d9b3d0237")) {
        self notify(#"hash_540044cdce85f636");
    }
    self thread function_f25f67a7();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x44984e25, Offset: 0x5808
// Size: 0x274
function function_841236e4(w_weapon, var_b6bc44ed) {
    if (level flag::get("round_reset")) {
        return;
    }
    if (w_weapon.name === #"ww_hand_h_uncharged" || w_weapon.name === #"ww_hand_h" || w_weapon.name === #"ww_hand_h_upgraded") {
        self notify(#"hash_3f0faacb0cc98a9", {#b_success:0});
        var_caa76b60 = #"light";
    } else if (w_weapon.name === #"ww_hand_c_uncharged" || w_weapon.name === #"ww_hand_c" || w_weapon.name === #"ww_hand_c_upgraded") {
        self thread function_41234931();
        var_caa76b60 = #"death";
    } else if (w_weapon.name === #"ww_hand_o_uncharged" || w_weapon.name === #"ww_hand_o" || w_weapon.name === #"ww_hand_o_upgraded") {
        var_caa76b60 = #"air";
    } else if (w_weapon.name === #"ww_hand_g_uncharged" || w_weapon.name === #"ww_hand_g" || w_weapon.name === #"ww_hand_g_upgraded") {
        var_caa76b60 = #"earth";
    }
    if (isdefined(var_caa76b60)) {
        self thread function_887b7e4b(var_caa76b60, var_b6bc44ed);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x54beeca0, Offset: 0x5a88
// Size: 0xbc
function function_887b7e4b(str_hand, var_b6bc44ed) {
    s_quest = level.var_d225ea18[str_hand];
    s_quest.var_a1327d58 notify(#"hand_returned");
    s_quest thread function_530d7ea0(0);
    s_quest.var_a1327d58.var_481aa649 = 1;
    s_quest.var_a1327d58.var_c76a870a = var_b6bc44ed;
    s_quest.var_a1327d58 thread function_4c66319a(str_hand);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xcb73de1b, Offset: 0x5b50
// Size: 0x11c
function on_player_connect() {
    self flag::init(#"hash_664c4b8d9b3d0237");
    self flag::init(#"hash_9e34b0e30895cb2");
    self flag::init(#"hash_8cdde8e6a8607f1");
    self flag::init(#"ww_combat_active");
    self flag::init(#"hash_3247dad158e8b329");
    self flag::init("carrying_light_energy");
    if (zm_utility::is_ee_enabled() || zm_utility::is_trials()) {
        self thread function_d0b13de1();
        self thread function_aeaedb3c();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 10, eflags: 0x1 linked
// Checksum 0xd10a1460, Offset: 0x5c78
// Size: 0x26a
function on_player_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) {
    if (idamage >= self.health || level flag::get("round_reset")) {
        if (self flag::get(#"hash_9e34b0e30895cb2")) {
            self notify(#"hash_7fe6ca08732b8a1d", {#b_success:0});
        } else if (self flag::get(#"ww_combat_active")) {
            self notify(#"hash_4d89e2bb8e3d1eb3", {#b_success:0});
        } else if (self flag::get(#"hash_3247dad158e8b329")) {
            self notify(#"hash_2026d806e71dfad5", {#b_success:0});
        } else if (self function_996fee51() === getweapon(#"ww_hand_c_uncharged")) {
            self function_41234931(1);
        } else if (self getcurrentweapon() === level.w_sprout) {
            self notify(#"seedling_dropped", {#str_result:"dropped"});
        } else if (self flag::get("carrying_light_energy")) {
            self notify(#"hash_3f0faacb0cc98a9", {#b_success:0});
        }
    }
    return idamage;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xc534cde8, Offset: 0x5ef0
// Size: 0xbc
function function_996fee51() {
    var_2e07b8ff = self getweaponslistprimaries();
    foreach (w_weapon in var_2e07b8ff) {
        if (isdefined(function_9b3e9487(w_weapon)) && function_9b3e9487(w_weapon)) {
            return w_weapon;
        }
    }
    return undefined;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x266ffc70, Offset: 0x5fb8
// Size: 0x1fa
function function_9b3e9487(w_weapon) {
    if (w_weapon === getweapon(#"ww_hand_h_uncharged") || w_weapon === getweapon(#"ww_hand_c_uncharged") || w_weapon === getweapon(#"ww_hand_g_uncharged") || w_weapon === getweapon(#"ww_hand_o_uncharged") || w_weapon === getweapon(#"ww_hand_h") || w_weapon === getweapon(#"ww_hand_c") || w_weapon === getweapon(#"ww_hand_g") || w_weapon === getweapon(#"ww_hand_o") || w_weapon === getweapon(#"ww_hand_h_upgraded") || w_weapon === getweapon(#"ww_hand_c_upgraded") || w_weapon === getweapon(#"ww_hand_g_upgraded") || w_weapon === getweapon(#"ww_hand_o_upgraded")) {
        return true;
    }
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xfeec1f18, Offset: 0x61c0
// Size: 0xab6
function function_9f665c5d(e_player) {
    s_shrine = self.stub.related_parent;
    var_5805438d = e_player flag::get(#"hash_664c4b8d9b3d0237");
    var_ec420ce1 = s_shrine flag::get(#"hash_58c0761173ca055");
    var_41307fc = s_shrine flag::get(#"hash_19f136c3e517eb81");
    w_current = e_player getcurrentweapon();
    var_b37a7d1e = e_player function_996fee51();
    if (isdefined(e_player.a_b_coins)) {
        foreach (b_coin in e_player.a_b_coins) {
            if (isdefined(b_coin) && b_coin) {
                var_5b85ec96 = 1;
            }
        }
    }
    if (zm_utility::can_use(e_player, 1) || e_player getcurrentweapon() === level.w_sprout) {
        if (e_player flag::get(#"hash_8cdde8e6a8607f1") && e_player hasweapon(getweapon(#"ww_hand_c_uncharged")) && s_shrine.targetname !== "s_ww_quests_death_box_interact") {
            return false;
        }
        if (isdefined(s_shrine.var_481aa649) && s_shrine.var_481aa649 && isdefined(s_shrine.holding_weapon) && s_shrine.holding_weapon && (!isdefined(var_b37a7d1e) || isdefined(var_b37a7d1e) && w_current === var_b37a7d1e)) {
            str_prompt = zm_utility::function_d6046228(#"hash_5eee473576f81bf6", #"hash_39b642cbfd1606d2");
            self sethintstringforplayer(e_player, str_prompt, s_shrine.var_884c4b3a.displayname);
            return true;
        }
        if (s_shrine.var_afda9f06 === e_player && isdefined(s_shrine.holding_weapon) && s_shrine.holding_weapon && (!isdefined(var_b37a7d1e) || isdefined(var_b37a7d1e) && w_current === var_b37a7d1e)) {
            if (getplayers().size > 1) {
                str_prompt = zm_utility::function_d6046228(#"hash_6421f4712bc94b22", #"hash_d5c41a6d5b24236");
                self sethintstringforplayer(e_player, str_prompt, s_shrine.var_884c4b3a.displayname);
            } else {
                str_prompt = zm_utility::function_d6046228(#"hash_5eee473576f81bf6", #"hash_39b642cbfd1606d2");
                self sethintstringforplayer(e_player, str_prompt, s_shrine.var_884c4b3a.displayname);
            }
            return true;
        }
        if (var_5805438d && !var_ec420ce1 && !var_41307fc && !isdefined(var_b37a7d1e)) {
            self sethintstringforplayer(e_player, s_shrine.var_c476e1d9);
            return true;
        }
        if (s_shrine.targetname === "s_ww_quests_death_box_interact") {
            if (var_b37a7d1e === s_shrine.var_884c4b3a && var_5b85ec96 === 1) {
                str_prompt = zm_utility::function_d6046228(#"hash_661321e32a980373", #"hash_5ea2a3a13605ccd9");
                self sethintstringforplayer(e_player, str_prompt);
                return true;
            } else if (var_b37a7d1e === s_shrine.var_884c4b3a && s_shrine flag::get(#"hash_582906087b67b7c6")) {
                str_prompt = zm_utility::function_d6046228(#"hash_758d9ac1d50488b4", #"hash_7cf0aaa08ece2918");
                self sethintstringforplayer(e_player, str_prompt);
                return true;
            } else if (s_shrine flag::get("flag_ww_quests_portal_available")) {
                self sethintstringforplayer(e_player, #"hash_309d162d0e1cd1d1");
                return false;
            }
        }
        if (s_shrine.targetname === "s_ww_quests_earth_box_interact") {
            if (e_player getcurrentweapon() === level.w_sprout) {
                str_prompt = zm_utility::function_d6046228(#"hash_49b4beddb9e489aa", #"hash_5ad486b4756bedee");
                self sethintstringforplayer(e_player, str_prompt);
                return true;
            } else if (var_b37a7d1e === s_shrine.var_884c4b3a && s_shrine flag::get(#"hash_582906087b67b7c6")) {
                str_prompt = zm_utility::function_d6046228(#"hash_645ccf84af1a142", #"hash_3d74cbb3721616");
                self sethintstringforplayer(e_player, str_prompt);
                return true;
            } else if (s_shrine flag::get("flag_ww_quests_portal_available")) {
                self sethintstringforplayer(e_player, #"hash_74b42e74edb2b677");
                return false;
            }
        }
        if (s_shrine.targetname === "s_ww_quests_light_box_interact") {
            if (var_b37a7d1e === s_shrine.var_884c4b3a && s_shrine flag::get(#"hash_582906087b67b7c6")) {
                str_prompt = zm_utility::function_d6046228(#"hash_62361fcb7d133dca", #"hash_3bf3c84f50358ace");
                self sethintstringforplayer(e_player, str_prompt);
                return true;
            } else if (s_shrine flag::get("flag_ww_quests_portal_available")) {
                self sethintstringforplayer(e_player, #"hash_73a0c2b3998429ff");
                return false;
            }
        }
        if (s_shrine.targetname === "s_ww_quests_air_box_interact") {
            if (var_b37a7d1e === s_shrine.var_884c4b3a && s_shrine flag::get(#"hash_582906087b67b7c6")) {
                str_prompt = zm_utility::function_d6046228(#"hash_681a8bda87d29252", #"hash_7046249526e855e6");
                self sethintstringforplayer(e_player, str_prompt);
                return true;
            } else if (s_shrine flag::get("flag_ww_quests_portal_available")) {
                self sethintstringforplayer(e_player, #"hash_20aebbbc74cffc87");
                return false;
            }
        }
        if (w_current === s_shrine.var_884c4b3a && !s_shrine flag::get(#"hash_582906087b67b7c6") && !e_player flag::get(#"hash_8cdde8e6a8607f1") && e_player getcurrentweapon() != level.w_sprout && !e_player flag::get("carrying_light_energy")) {
            str_prompt = zm_utility::function_d6046228(#"hash_6591ab9f6ce79e7e", #"hash_6d78c0c2901bd46a");
            self sethintstringforplayer(e_player, str_prompt);
            return true;
        }
    }
    self sethintstringforplayer(e_player, "");
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x880d65a6, Offset: 0x6c80
// Size: 0x158
function function_75fd2345() {
    self endon(#"death");
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (zm_utility::can_use(e_player) || e_player getcurrentweapon() === level.w_sprout) {
            if (isdefined(self.stub) && isdefined(self.stub.related_parent)) {
                if (self.stub.related_parent flag::get(#"hash_582906087b67b7c6")) {
                    self.stub.related_parent notify(#"hash_16ea93eb944ff512", {#e_who:e_player});
                    continue;
                }
                self.stub.related_parent notify(#"trigger_activated", {#e_who:e_player});
            }
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x94cecd89, Offset: 0x6de0
// Size: 0x2ec
function function_37c18ffd(str_hand) {
    s_quest = level.var_d225ea18[str_hand];
    level endon(#"end_game");
    s_quest endon(#"shrine_available");
    var_a1327d58 = s_quest.var_a1327d58;
    var_a1327d58.var_afda9f06 = undefined;
    while (true) {
        s_waitresult = var_a1327d58 waittill(#"trigger_activated");
        e_player = s_waitresult.e_who;
        if (zm_utility::is_player_valid(e_player) && e_player flag::get(#"hash_664c4b8d9b3d0237")) {
            break;
        }
    }
    if (isdefined(e_player)) {
        switch (s_quest.targetname) {
        case #"death":
            if (!(isdefined(e_player.var_937e7a3c) && e_player.var_937e7a3c)) {
                e_player.var_937e7a3c = 1;
                b_played = 0;
            }
            break;
        case #"earth":
            if (!(isdefined(e_player.var_49b1b563) && e_player.var_49b1b563)) {
                e_player.var_49b1b563 = 1;
                b_played = 0;
            }
            break;
        case #"air":
            if (!(isdefined(e_player.var_c634a22d) && e_player.var_c634a22d)) {
                e_player.var_c634a22d = 1;
                b_played = 0;
            }
            break;
        case #"light":
            if (!(isdefined(e_player.var_25199339) && e_player.var_25199339)) {
                e_player.var_25199339 = 1;
                b_played = 0;
            }
            break;
        }
    }
    if (isdefined(b_played) && !b_played) {
        e_player thread zm_vo::vo_say(s_quest.var_7c6b53db, 0, 1, 9999, 1, 1);
        e_player thread zm_vo::function_a2bd5a0c(s_quest.var_eaa1f384, 0.5, 1, 9999, 1);
    }
    level thread function_7bd1fb22(str_hand, e_player);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x83700c30, Offset: 0x70d8
// Size: 0xcc
function function_7bd1fb22(str_hand, e_player) {
    s_quest = level.var_d225ea18[str_hand];
    var_a1327d58 = s_quest.var_a1327d58;
    var_a1327d58 flag::set(#"hash_58c0761173ca055");
    e_player flag::set(#"hash_9e34b0e30895cb2");
    e_player thread function_7f7c692(str_hand);
    e_player thread function_9520e85d(str_hand);
    e_player thread function_f7cee57d(s_quest);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0xed5c3267, Offset: 0x71b0
// Size: 0x518
function private function_f7cee57d(s_quest) {
    self endon(#"disconnect");
    if (distance(s_quest.var_ed424981.origin, self.origin) >= 100) {
        v_dir = vectornormalize(self.origin - s_quest.var_ed424981.origin);
        v_pos = s_quest.var_ed424981.origin + v_dir * 95;
        v_pos = getclosestpointonnavmesh(v_pos, 128, 16);
        if (positionwouldtelefrag(v_pos)) {
            a_zombies = getaiarchetypearray(#"zombie");
            a_zombies = arraysortclosest(a_zombies, v_pos, undefined, 0, 100);
            foreach (ai in a_zombies) {
                ai zombie_utility::setup_zombie_knockdown(v_pos);
            }
            waitframe(1);
        }
        if (isdefined(s_quest.var_f172b16e)) {
            self clientfield::set(s_quest.var_f172b16e, 1);
        }
        self setorigin(v_pos);
        waitframe(1);
        if (isdefined(s_quest.var_f172b16e)) {
            self clientfield::set(s_quest.var_f172b16e, 0);
        }
    }
    if (util::get_active_players().size > 1) {
        a_players = util::get_active_players();
        arrayremovevalue(a_players, self);
        foreach (e_player in a_players) {
            if (distance(s_quest.var_ed424981.origin, e_player.origin) <= 100) {
                v_dir = vectornormalize(s_quest.var_ed424981.origin - self.origin);
                v_pos = s_quest.var_ed424981.origin + v_dir * 110;
                v_pos = getclosestpointonnavmesh(v_pos, 128, 16);
                if (positionwouldtelefrag(v_pos)) {
                    a_zombies = getaiarchetypearray(#"zombie");
                    a_zombies = arraysortclosest(a_zombies, v_pos, undefined, 0, 100);
                    foreach (ai in a_zombies) {
                        ai zombie_utility::setup_zombie_knockdown(v_pos);
                    }
                    waitframe(1);
                }
                if (isdefined(s_quest.var_f172b16e)) {
                    e_player clientfield::set(s_quest.var_f172b16e, 1);
                }
                e_player setorigin(v_pos);
                waitframe(1);
                if (isdefined(s_quest.var_f172b16e)) {
                    e_player clientfield::set(s_quest.var_f172b16e, 0);
                }
            }
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x1301eede, Offset: 0x76d0
// Size: 0x2dc
function function_9520e85d(str_hand) {
    s_quest = level.var_d225ea18[str_hand];
    var_a1327d58 = s_quest.var_a1327d58;
    s_waitresult = self waittill(#"hash_7fe6ca08732b8a1d", #"fake_death");
    if (level flag::get("round_reset") || s_waitresult._notify == "fake_death") {
        s_waitresult.b_success = 0;
    }
    var_a1327d58 flag::clear(#"hash_58c0761173ca055");
    if (isdefined(self)) {
        self flag::clear(#"hash_9e34b0e30895cb2");
    }
    if (s_waitresult.b_success === 0) {
        s_quest notify(#"shrine_available");
        var_a1327d58 thread function_37c18ffd(str_hand);
        return;
    }
    var_d02a32e2 = getent(s_quest.var_52584ae6, "targetname");
    var_d02a32e2 clientfield::set("" + #"hash_7f97409952dd051b", 0);
    var_d02a32e2 clientfield::set("" + #"hash_4ff047c7bc266fd7", 1);
    var_a1327d58.var_afda9f06 = self;
    var_a1327d58 flag::set(#"hash_19f136c3e517eb81");
    self thread zm_vo::vo_say(s_quest.var_29f1fc2d, 0, 1, 9999, 1, 1);
    self flag::clear(#"hash_664c4b8d9b3d0237");
    self thread function_f25f67a7();
    self notify(#"hash_740799bb1b6c19b6");
    var_a1327d58 thread function_2db4d0dc(self);
    var_a1327d58 thread function_576d6fe0(self);
    waitframe(1);
    var_a1327d58 thread function_4c66319a(str_hand);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x2976ea4c, Offset: 0x79b8
// Size: 0x2da
function function_2a513082(weapon) {
    self endon(#"disconnect");
    switch (weapon.name) {
    case #"ww_hand_c_uncharged":
        if (!(isdefined(self.var_69544bb1) && self.var_69544bb1)) {
            self.var_69544bb1 = 1;
            var_50188067 = "vox_charon_hand_kill_first";
            var_c140172f = "vox_charon_hand_kill_first_resp_orac_0";
        }
        break;
    case #"ww_hand_h_uncharged":
        if (!(isdefined(self.var_7e6931b) && self.var_7e6931b)) {
            self.var_7e6931b = 1;
            var_50188067 = "vox_hemera_hand_kill_first";
            var_c140172f = "vox_hemera_hand_kill_first_resp_orac_0";
        }
        break;
    case #"ww_hand_o_uncharged":
        if (!(isdefined(self.var_9a5009ab) && self.var_9a5009ab)) {
            self.var_9a5009ab = 1;
            var_50188067 = "vox_ouranos_hand_kill_first";
            var_c140172f = "vox_ouranos_hand_kill_first_resp_orac_0";
        }
        break;
    case #"ww_hand_g_uncharged":
        if (!(isdefined(self.var_cdcc7c1c) && self.var_cdcc7c1c)) {
            self.var_cdcc7c1c = 1;
            var_50188067 = "vox_gaia_hand_kill_first";
            var_c140172f = "vox_gaia_hand_kill_first_resp_orac_0";
        }
        break;
    }
    if (!isdefined(var_50188067) || !isdefined(var_c140172f)) {
        return;
    }
    b_played = self zm_vo::function_a2bd5a0c(var_50188067, 0, 0, 9999, 1);
    if (isdefined(b_played) && b_played) {
        if (!self flag::get("ww_combat_active")) {
            self thread zm_vo::vo_say(var_c140172f, 0.5, 1, 9999, 1, 1);
        }
        return;
    }
    switch (weapon.name) {
    case #"ww_hand_c_uncharged":
        self.var_69544bb1 = 0;
        break;
    case #"ww_hand_h_uncharged":
        self.var_7e6931b = 0;
        break;
    case #"ww_hand_o_uncharged":
        self.var_9a5009ab = 0;
        break;
    case #"ww_hand_g_uncharged":
        self.var_cdcc7c1c = 0;
        break;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xd5a0f5c9, Offset: 0x7ca0
// Size: 0x282
function function_4c66319a(str_hand) {
    if (isdefined(self.holding_weapon) && self.holding_weapon) {
        return;
    }
    self.holding_weapon = 1;
    s_quest = level.var_d225ea18[str_hand];
    mdl_uncharged_hand = s_quest.mdl_uncharged_hand;
    w_hand = self.var_884c4b3a;
    mdl_uncharged_hand thread scene::play(s_quest.var_99aa2e37, "Shot 1");
    mdl_uncharged_hand thread function_6e84f472();
    while (true) {
        s_waitresult = self waittill(#"trigger_activated");
        e_player = s_waitresult.e_who;
        if (zm_utility::can_use(e_player, 1) && e_player.currentweapon.name != "none") {
            if (isdefined(e_player function_996fee51())) {
                var_5fd880fd = e_player function_996fee51();
                e_player zm_weapons::weapon_take(var_5fd880fd);
            }
            e_player zm_weapons::weapon_give(w_hand);
            self.holding_weapon = 0;
            if (isdefined(self.var_c76a870a)) {
                e_player setweaponammoclip(w_hand, self.var_c76a870a);
                self.var_c76a870a = undefined;
            }
            mdl_uncharged_hand thread scene::stop(s_quest.var_99aa2e37);
            mdl_uncharged_hand hide();
            if (self flag::get("flag_ww_quests_portal_available")) {
                s_quest thread function_4e2445e0();
            }
            self thread function_9aa785fe(e_player);
            s_quest [[ s_quest.var_8af9a7e8 ]](e_player);
            return;
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xc3ca327c, Offset: 0x7f30
// Size: 0x64
function function_6e84f472() {
    self clientfield::set("" + #"forcestream_crafted_item", 1);
    wait 3;
    self clientfield::set("" + #"forcestream_crafted_item", 0);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x65fa257a, Offset: 0x7fa0
// Size: 0x1c4
function function_a7e94e36(a_ents) {
    if (!isdefined(a_ents[#"prop 1"])) {
        return;
    }
    if (self.targetname === #"mdl_ww_uncharged_hand_air") {
        a_ents[#"prop 1"] clientfield::set(level.var_d225ea18[#"air"].var_ea3032ca, 1);
        return;
    }
    if (self.targetname === #"mdl_ww_uncharged_hand_death") {
        a_ents[#"prop 1"] clientfield::set(level.var_d225ea18[#"death"].var_ea3032ca, 1);
        return;
    }
    if (self.targetname === #"mdl_ww_uncharged_hand_light") {
        a_ents[#"prop 1"] clientfield::set(level.var_d225ea18[#"light"].var_ea3032ca, 1);
        return;
    }
    if (self.targetname === #"mdl_ww_uncharged_hand_earth") {
        a_ents[#"prop 1"] clientfield::set(level.var_d225ea18[#"earth"].var_ea3032ca, 1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0x23bc2295, Offset: 0x8170
// Size: 0xca
function private function_2db4d0dc(e_player) {
    e_player endon(#"disconnect");
    self endon(#"hash_c060aee019d11e0");
    while (true) {
        if (e_player ismeleeing() && e_player util::is_looking_at(self.origin) && distance2d(self.origin, e_player.origin) < 100) {
            self thread function_97c8cfa0(e_player);
            break;
        }
        waitframe(1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xfcd7eb97, Offset: 0x8248
// Size: 0x74
function function_97c8cfa0(e_player) {
    self.var_481aa649 = 1;
    self notify(#"hash_c060aee019d11e0");
    if (zm_utility::is_player_valid(e_player)) {
        e_player thread zm_audio::create_and_play_dialog(#"magicbox", #"share");
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0x553419c6, Offset: 0x82c8
// Size: 0x4c
function private function_576d6fe0(e_player) {
    self endon(#"hash_c060aee019d11e0");
    e_player waittilltimeout(180, #"disconnect");
    self thread function_97c8cfa0();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x6cd8c6de, Offset: 0x8320
// Size: 0x172
function function_9aa785fe(e_player) {
    self endon(#"hand_returned");
    while (true) {
        s_waitresult = self waittill(#"trigger_activated");
        w_hand = e_player getcurrentweapon();
        if (s_waitresult.e_who === e_player && w_hand === self.var_884c4b3a && !e_player flag::get(#"hash_8cdde8e6a8607f1") && w_hand != level.w_sprout) {
            if (!(isdefined(e_player.intermission) && e_player.intermission) && !(isdefined(e_player.is_drinking) && e_player.is_drinking)) {
                e_player takeweapon(w_hand);
                e_player zm_weapons::switch_back_primary_weapon();
                e_player playsound("zmb_gaia_hand_deposit");
                return;
            }
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x602526a3, Offset: 0x84a0
// Size: 0x20e
function function_7f7c692(str_hand) {
    s_quest = level.var_d225ea18[str_hand];
    self endon(#"disconnect", #"hash_7fe6ca08732b8a1d");
    foreach (mdl_clip in s_quest.var_9c3c3654) {
        mdl_clip thread function_313d0f8d(self);
    }
    var_d02a32e2 = getent(s_quest.var_52584ae6, "targetname");
    var_d02a32e2 setvisibletoall();
    var_d02a32e2 thread function_119d1b73(self);
    s_quest thread function_57b78484(self);
    s_quest thread function_6b3c32b6(str_hand, self);
    self thread function_89b62137(var_d02a32e2.origin);
    s_waitresult = self waittilltimeout(30, #"fake_death");
    if (s_waitresult._notify != #"timeout") {
        b_success = 0;
    } else {
        b_success = 1;
    }
    self notify(#"hash_7fe6ca08732b8a1d", {#b_success:b_success});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x6c4c524, Offset: 0x86b8
// Size: 0xac
function function_89b62137(v_anchor) {
    self endon(#"disconnect", #"hash_7fe6ca08732b8a1d");
    while (true) {
        n_dist = distancesquared(self.origin, v_anchor);
        if (n_dist > 90000) {
            self notify(#"hash_7fe6ca08732b8a1d", {#b_success:0});
        }
        wait 0.25;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x306082b6, Offset: 0x8770
// Size: 0xc4
function function_57b78484(e_player) {
    self.mdl_uncharged_hand thread scene::play(#"p8_fxanim_zm_red_ww_handle_float_bundle", "Shot 1");
    waitframe(1);
    e_player waittill(#"hash_7fe6ca08732b8a1d", #"disconnect");
    self.mdl_uncharged_hand thread scene::stop(#"p8_fxanim_zm_red_ww_handle_float_bundle", 1);
    playfxontag(self.var_7c70e392, self.mdl_uncharged_hand, "tag_origin");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0xc1830bd6, Offset: 0x8840
// Size: 0x430
function function_6b3c32b6(str_hand, e_player) {
    level endon(#"end_game");
    e_player endon(#"disconnect", #"hash_7fe6ca08732b8a1d");
    self.a_ai_spawned = [];
    a_s_spawns = struct::get_array(self.var_4a8b8254, "script_objective");
    var_417b0320 = arraycopy(a_s_spawns);
    while (true) {
        self.a_ai_spawned = array::remove_dead(self.a_ai_spawned);
        if (self.a_ai_spawned.size < 8) {
            if (var_417b0320.size < 1) {
                var_417b0320 = arraycopy(a_s_spawns);
            }
            s_spawn = array::random(var_417b0320);
            arrayremovevalue(var_417b0320, s_spawn);
            while (true) {
                ai_zombie = zombie_utility::spawn_zombie(array::random(level.zombie_spawners), undefined, s_spawn);
                if (isdefined(ai_zombie)) {
                    break;
                }
                waitframe(1);
            }
            ai_zombie val::set(#"ai_forcegoal", "ignoreall", 1);
            if (!isdefined(self.a_ai_spawned)) {
                self.a_ai_spawned = [];
            } else if (!isarray(self.a_ai_spawned)) {
                self.a_ai_spawned = array(self.a_ai_spawned);
            }
            self.a_ai_spawned[self.a_ai_spawned.size] = ai_zombie;
            ai_zombie.start_inert = 1;
            ai_zombie.var_126d7bef = 1;
            ai_zombie.ignore_round_spawn_failsafe = 1;
            ai_zombie.b_ignore_cleanup = 1;
            ai_zombie.ignore_enemy_count = 1;
            ai_zombie.no_powerups = 1;
            ai_zombie.exclude_cleanup_adding_to_total = 1;
            ai_zombie.var_12745932 = 1;
            ai_zombie.var_3c394b1b = 1;
            ai_zombie.favoriteenemy = e_player;
            foreach (var_b24e337d in level.activeplayers) {
                if (!(var_b24e337d === e_player)) {
                    ai_zombie setignoreent(var_b24e337d, 1);
                }
            }
            ai_zombie thread function_bba98e7f(e_player);
            ai_zombie thread function_4cd29565(self);
            if (isdefined(self.var_d39cfea7)) {
                ai_zombie clientfield::set("" + #"ww_combat_fx", self.var_d39cfea7);
            }
            waitframe(1);
            ai_zombie zombie_utility::set_zombie_run_cycle("run");
            wait 0.2;
            ai_zombie val::reset(#"ai_forcegoal", "ignoreall");
        }
        wait 1.8;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x15304cf9, Offset: 0x8c78
// Size: 0xa4
function function_119d1b73(e_player) {
    self setvisibletoall();
    self clientfield::set("" + #"hash_4e65af2ec1b830f7", 1);
    e_player waittill(#"hash_7fe6ca08732b8a1d", #"disconnect");
    self clientfield::set("" + #"hash_4e65af2ec1b830f7", 0);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x262a9083, Offset: 0x8d28
// Size: 0x94
function function_313d0f8d(e_player) {
    self solid();
    self setvisibletoall();
    e_player waittill(#"hash_7fe6ca08732b8a1d", #"disconnect");
    self setinvisibletoall();
    self notsolid();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x9314e693, Offset: 0x8dc8
// Size: 0xd4
function function_f5639b00(e_player) {
    level endon(#"end_game");
    e_player endon(#"hash_740799bb1b6c19b6");
    if (isplayer(e_player)) {
        e_player waittill(#"disconnect", #"hash_540044cdce85f636");
    }
    if (isdefined(e_player)) {
        e_player flag::clear(#"hash_664c4b8d9b3d0237");
        e_player thread function_f25f67a7();
    }
    self.var_b1cb5669 = undefined;
    self thread function_cf82cb0b();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xbf818785, Offset: 0x8ea8
// Size: 0x49c
function function_f25f67a7() {
    self endon(#"disconnect");
    level endon(#"end_game");
    self waittilltimeout(0.5, #"weapon_change_complete");
    var_f5716a6 = 0;
    var_64d8621e = 0;
    w_hand = self function_996fee51();
    if (self flag::get(#"hash_664c4b8d9b3d0237")) {
        var_64d8621e = 1;
    } else if (isdefined(w_hand)) {
        if (w_hand === getweapon(#"ww_hand_h_uncharged")) {
            var_f5716a6 = 0;
            var_64d8621e = 2;
        } else if (w_hand === getweapon(#"ww_hand_c_uncharged")) {
            var_f5716a6 = 1;
            var_64d8621e = 2;
        } else if (w_hand === getweapon(#"ww_hand_g_uncharged")) {
            var_f5716a6 = 2;
            var_64d8621e = 2;
        } else if (w_hand === getweapon(#"ww_hand_o_uncharged")) {
            var_f5716a6 = 3;
            var_64d8621e = 2;
        } else if (w_hand === getweapon(#"ww_hand_h")) {
            var_f5716a6 = 0;
            var_64d8621e = 6;
        } else if (w_hand === getweapon(#"ww_hand_c")) {
            var_f5716a6 = 1;
            var_64d8621e = 6;
        } else if (w_hand === getweapon(#"ww_hand_g")) {
            var_f5716a6 = 2;
            var_64d8621e = 6;
        } else if (w_hand === getweapon(#"ww_hand_o")) {
            var_f5716a6 = 3;
            var_64d8621e = 6;
        } else if (w_hand === getweapon(#"ww_hand_h_upgraded")) {
            var_f5716a6 = 0;
            var_64d8621e = 7;
        } else if (w_hand === getweapon(#"ww_hand_c_upgraded")) {
            var_f5716a6 = 1;
            var_64d8621e = 7;
        } else if (w_hand === getweapon(#"ww_hand_g_upgraded")) {
            var_f5716a6 = 2;
            var_64d8621e = 7;
        } else if (w_hand === getweapon(#"ww_hand_o_upgraded")) {
            var_f5716a6 = 3;
            var_64d8621e = 7;
        }
    } else if (self getcurrentweapon() === level.w_sprout) {
        var_f5716a6 = 2;
        var_64d8621e = 2;
    }
    zm_ui_inventory::function_7df6bb60(#"hash_28d79c40f29ecc43", var_f5716a6, self);
    if (!isdefined(level.var_5dbb0a05)) {
        level.var_5dbb0a05 = array(#"hash_17f88a64d698025", #"hash_4bd139d5a6e3ca6f", #"hash_6afbd5b12dbdae9d", #"hash_3814a46a4c2f1235");
    }
    var_7b34805b = level.var_5dbb0a05[var_f5716a6];
    if (isdefined(var_7b34805b)) {
        zm_ui_inventory::function_7df6bb60(var_7b34805b, var_64d8621e, self);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xc13982a, Offset: 0x9350
// Size: 0x104
function function_652b2ac5() {
    self thread function_e695bb99();
    self flag::init("river_styx_filled");
    self.var_d091995a = struct::get_array("s_ww_death_coin_shrine_placement_loc");
    self.var_39b71b44 = 0;
    var_83f3addf = struct::get("s_ww_death_drink", "targetname");
    self.var_e0a17499 = var_83f3addf zm_unitrigger::create(&function_adc2d252, (330, 208, 64));
    zm_unitrigger::unitrigger_force_per_player_triggers(self.var_e0a17499, 1);
    self.var_95a4f81a = 7;
    level flag::init("river_turned_on");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xcf785c3, Offset: 0x9460
// Size: 0xec
function function_808746de(e_player) {
    e_player endon(#"hash_408d46cc81bef3fc", #"disconnect");
    self notify("40f2c591d9977fee");
    self endon("40f2c591d9977fee");
    if (isdefined(self.var_4d532f57) && self.var_4d532f57) {
        return;
    }
    if (!self flag::get("river_styx_filled")) {
        level.var_2f926dcc = &function_e6e126b4;
        self flag::wait_till("river_styx_filled");
        self thread function_bce6357e();
    }
    self thread function_10139c6(e_player);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x41c68a10, Offset: 0x9558
// Size: 0x270
function function_10139c6(e_player) {
    e_player endon(#"hash_408d46cc81bef3fc", #"disconnect");
    var_83f3addf = struct::get("s_ww_death_drink", "targetname");
    e_player flag::clear(#"hash_8cdde8e6a8607f1");
    e_player thread function_af78c3b3(0);
    a_e_lights = getentarray("lgt_glowyriver", "scriptNoteworthy");
    var_83f3addf waittill(#"trigger_activated");
    e_player flag::set(#"hash_8cdde8e6a8607f1");
    e_player thread function_af78c3b3(1);
    e_player playsoundtoplayer(#"hash_a3c0c3baf61597a", e_player);
    if (!(isdefined(e_player.var_10c283af) && e_player.var_10c283af)) {
        e_player.var_10c283af = 1;
        e_player thread zm_vo::function_a2bd5a0c(#"hash_2dbe93140e212482", 0, 1, 9999, 1);
        e_player thread zm_vo::vo_say(#"hash_53feac8b61dd1f65", 0, 1, 9999, 1, 1);
    }
    e_player thread disable_health_regen();
    self thread function_6d15a744(e_player);
    foreach (e_light in a_e_lights) {
        e_light thread function_cdbadaff(11, 9, 2);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x5 linked
// Checksum 0x831a3a8a, Offset: 0x97d0
// Size: 0x2ee
function private function_e695bb99() {
    var_e2604798 = struct::get_array("s_ww_death_coin", "targetname");
    var_e2604798 = array::randomize(var_e2604798);
    self.var_167b59c7 = getentarray("mdl_ww_death_real_coin", "targetname");
    foreach (mdl_coin in self.var_167b59c7) {
        mdl_coin hidepart("tag_emissive");
    }
    self.var_18fd25ab = [];
    for (i = 0; i < self.var_167b59c7.size; i++) {
        self.var_167b59c7[i].origin = var_e2604798[0].origin;
        self.var_167b59c7[i].angles = var_e2604798[0].angles;
        self.var_18fd25ab[i] = var_e2604798[0];
        var_e2604798 = array::remove_index(var_e2604798, 0);
        self thread function_ab234072(i);
    }
    var_2dd44c8 = getentarray("mdl_ww_death_false_coin", "targetname");
    foreach (mdl_coin in var_2dd44c8) {
        mdl_coin hidepart("tag_emissive");
    }
    for (i = 0; i < var_e2604798.size; i++) {
        if (isdefined(var_e2604798[i]) && isdefined(var_2dd44c8[i])) {
            var_2dd44c8[i].origin = var_e2604798[i].origin;
            var_2dd44c8[i].angles = var_e2604798[i].angles;
            var_2dd44c8[i] thread function_8f228be7();
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0xf4f94734, Offset: 0x9ac8
// Size: 0x1d6
function private function_6d15a744(e_player) {
    var_e041507a = e_player getentitynumber() + 1;
    var_2dd44c8 = getentarray("mdl_ww_death_false_coin", "targetname");
    foreach (mdl_coin in var_2dd44c8) {
        if (isdefined(mdl_coin)) {
            if (!(isdefined(mdl_coin.var_11dc678a) && mdl_coin.var_11dc678a)) {
                mdl_coin clientfield::set("" + #"hash_5208f90a0114c9e", var_e041507a);
                mdl_coin showpart("tag_emissive");
            }
        }
    }
    for (i = 0; i < 3; i++) {
        if (isdefined(self.var_167b59c7[i])) {
            self.var_167b59c7[i] clientfield::set("" + #"hash_5208f90a0114c9e", var_e041507a);
            self.var_167b59c7[i] showpart("tag_emissive");
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xec465d19, Offset: 0x9ca8
// Size: 0x1f8
function function_a975461d(var_d4a055df = 0) {
    if (isdefined(self.var_167b59c7)) {
        foreach (mdl_coin in self.var_167b59c7) {
            if (isdefined(mdl_coin)) {
                mdl_coin clientfield::set("" + #"hash_5208f90a0114c9e", 0);
                mdl_coin hidepart("tag_emissive");
            }
        }
    }
    var_2dd44c8 = getentarray("mdl_ww_death_false_coin", "targetname");
    foreach (mdl_coin in var_2dd44c8) {
        if (isdefined(mdl_coin)) {
            mdl_coin clientfield::set("" + #"hash_5208f90a0114c9e", 0);
            mdl_coin hidepart("tag_emissive");
            if (isdefined(mdl_coin.s_unitrigger) && var_d4a055df) {
                mdl_coin zm_unitrigger::unregister_unitrigger(mdl_coin.s_unitrigger);
            }
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xbf3e0c40, Offset: 0x9ea8
// Size: 0x4ac
function function_bce6357e() {
    level endon(#"game_ended");
    var_29ae8bf9 = 0;
    a_mdl_coins = [];
    while (var_29ae8bf9 < 3) {
        var_a1327d58 = self.var_a1327d58;
        s_waitresult = var_a1327d58 waittill(#"trigger_activated");
        e_player = s_waitresult.e_who;
        if (!e_player flag::get(#"hash_8cdde8e6a8607f1")) {
            continue;
        }
        if (isdefined(e_player.a_b_coins)) {
            for (i = 0; i < 3; i++) {
                if (isdefined(e_player.a_b_coins[i]) && e_player.a_b_coins[i]) {
                    var_29ae8bf9++;
                    e_player.a_b_coins[i] = 0;
                    arrayremoveindex(self.var_167b59c7, i, 1);
                    arrayremoveindex(self.var_18fd25ab, i, 1);
                    mdl_coin = util::spawn_model(#"p8_zm_red_charron_coin_01_emissive", self.var_d091995a[i].origin, self.var_d091995a[i].angles);
                    mdl_coin setscale(2.5);
                    playsoundatposition(#"hash_1cb45295c6129bbf", self.var_d091995a[i].origin);
                    if (isdefined(e_player)) {
                        var_e041507a = e_player getentitynumber() + 1;
                        mdl_coin clientfield::set("" + #"hash_5208f90a0114c9e", var_e041507a);
                    }
                    mdl_coin showpart("tag_emissive");
                    if (!isdefined(a_mdl_coins)) {
                        a_mdl_coins = [];
                    } else if (!isarray(a_mdl_coins)) {
                        a_mdl_coins = array(a_mdl_coins);
                    }
                    if (!isinarray(a_mdl_coins, mdl_coin)) {
                        a_mdl_coins[a_mdl_coins.size] = mdl_coin;
                    }
                }
            }
        }
    }
    e_player notify(#"hash_408d46cc81bef3fc");
    self.var_4d532f57 = 1;
    s_portal_loc = struct::get("s_ww_quests_death_portal_pos", "targetname");
    do {
        self.e_portal_fx = util::spawn_model("tag_origin", s_portal_loc.origin, s_portal_loc.angles);
        waitframe(1);
    } while (!isdefined(self.e_portal_fx));
    self thread function_4e2445e0();
    e_player thread zm_vo::vo_say(#"hash_61fe324f03dd16d7", 0, 1, 9999, 1, 1);
    foreach (mdl_coin in a_mdl_coins) {
        mdl_coin clientfield::set("" + #"hash_5208f90a0114c9e", 0);
        mdl_coin hidepart("tag_emissive");
    }
    self thread function_a975461d(1);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x664bb7e, Offset: 0xa360
// Size: 0x1b4
function function_3c79dc29(e_player) {
    e_player endoncallback(&function_425a6ec6, #"hash_4d89e2bb8e3d1eb3");
    nd_entry = getvehiclenode("charon_boat_start", "targetname");
    self.var_d1e11af4 = undefined;
    self.var_b0338f1d = undefined;
    while (!isdefined(self.var_d1e11af4)) {
        self.var_d1e11af4 = spawner::simple_spawn_single("cam_vehicle");
        waitframe(1);
    }
    self.var_d1e11af4.origin = nd_entry.origin;
    self.var_d1e11af4.angles = nd_entry.angles;
    while (!isdefined(self.var_b0338f1d)) {
        self.var_b0338f1d = util::spawn_model("p8_zm_red_shrine_charron_boat_styx_full", self.var_d1e11af4.origin, self.var_d1e11af4.angles);
        waitframe(1);
    }
    self.var_b0338f1d notsolid();
    self.var_b0338f1d linkto(self.var_d1e11af4);
    self.var_d1e11af4 vehicle::get_on_and_go_path(nd_entry);
    self.var_b0338f1d delete();
    self.var_d1e11af4 delete();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x7f547f22, Offset: 0xa520
// Size: 0x94
function function_425a6ec6() {
    s_quest = level.var_d225ea18[#"death"];
    if (isdefined(s_quest.var_b0338f1d)) {
        s_quest.var_b0338f1d delete();
    }
    if (isdefined(s_quest.var_d1e11af4)) {
        s_quest.var_d1e11af4 vehicle::detach_path();
        s_quest.var_d1e11af4 delete();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0x4d77a0a3, Offset: 0xa5c0
// Size: 0x1f4
function private function_ab234072(var_cd1844a3) {
    self.var_18fd25ab[var_cd1844a3] notify("death_coins_watcher_" + var_cd1844a3);
    self.var_18fd25ab[var_cd1844a3] endoncallback(&function_2eeb736b, "death_coins_watcher_" + var_cd1844a3);
    self.var_18fd25ab[var_cd1844a3].b_picked_up = 0;
    if (isdefined(self.var_167b59c7) && isdefined(self.var_167b59c7[var_cd1844a3])) {
        self.var_167b59c7[var_cd1844a3] setvisibletoall();
    }
    e_player = self.var_18fd25ab[var_cd1844a3] zm_unitrigger::function_fac87205(&function_819b24b8, (64, 64, 128), undefined, 1);
    e_player endon(#"death");
    if (isdefined(self.var_167b59c7) && isdefined(self.var_167b59c7[var_cd1844a3])) {
        self.var_167b59c7[var_cd1844a3] setinvisibletoall();
        self.var_18fd25ab[var_cd1844a3].b_picked_up = 1;
        playsoundatposition(#"hash_657c7b4c30f7fcd3", self.var_18fd25ab[var_cd1844a3].origin);
        e_player.a_b_coins[var_cd1844a3] = 1;
        wait 0.5;
        e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_positive");
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0x35a04e03, Offset: 0xa7c0
// Size: 0x24
function private function_2eeb736b(var_c34665fc) {
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0x1fc25178, Offset: 0xa7f0
// Size: 0xd4
function private function_8f228be7(var_cd1844a3) {
    self.var_11dc678a = 0;
    e_player = self zm_unitrigger::function_fac87205(&function_92aa1a80, (64, 64, 128), undefined, 1);
    self.var_11dc678a = 1;
    self clientfield::set("" + #"hash_5208f90a0114c9e", 0);
    self hidepart("tag_emissive");
    playsoundatposition(#"hash_71e42f29ab39255f", self.origin);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x17b0b4c, Offset: 0xa8d0
// Size: 0x122
function disable_health_regen() {
    self endon(#"disconnect");
    var_d552fd05 = self.var_44d52546;
    self.var_44d52546 = 0;
    self val::set(#"ww_quest", "health_regen", 0);
    self clientfield::set_to_player("" + #"hash_e2692f239454272", 1);
    self thread function_e9127e33();
    self waittill(#"hash_408d46cc81bef3fc");
    self val::reset(#"ww_quest", "health_regen");
    self clientfield::set_to_player("" + #"hash_e2692f239454272", 0);
    self.var_44d52546 = var_d552fd05;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x5 linked
// Checksum 0x532f88a6, Offset: 0xaa00
// Size: 0xbc
function private function_e9127e33() {
    self endon(#"death");
    var_b338fe44 = 0;
    while (!(isdefined(self.heal.enabled) && self.heal.enabled)) {
        if (self hasperk(#"specialty_sprintspeed")) {
            self zm_perk_mod_quick_revive::take_perk();
            var_b338fe44 = 1;
        }
        wait 1;
    }
    if (var_b338fe44) {
        self zm_perk_mod_quick_revive::give_perk();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x53c13b6b, Offset: 0xaac8
// Size: 0x3c4
function function_e6e126b4(e_target, w_weapon) {
    s_quest = level.var_d225ea18[#"death"];
    s_quest endon(#"river_styx_filled");
    vol_river = getent("vol_ww_death_dust_river", "targetname");
    if (e_target istouching(vol_river) && isdefined(s_quest.var_39b71b44) && w_weapon === getweapon(#"ww_hand_c_uncharged") && e_target.archetype === #"zombie" && !isdefined(e_target.var_4fcc6fa6)) {
        e_target.var_4fcc6fa6 = 1;
        e_target thread zm_weap_hand_charon::function_ccd87945(self);
        n_start_time = gettime();
        for (n_total_time = 0; isdefined(e_target) && n_total_time < 5; n_total_time = float(n_current_time - n_start_time) / 1000) {
            waitframe(1);
            n_current_time = gettime();
        }
        n_increase = 4 / 11;
        s_quest.var_39b71b44++;
        a_e_lights = getentarray("lgt_glowyriver", "scriptNoteworthy");
        if (s_quest.var_39b71b44 === 1) {
            foreach (e_light in a_e_lights) {
                e_light thread function_cdbadaff(0, 7, 1);
            }
            waitframe(1);
            exploder::exploder("exp_lgt_riverglow");
        } else {
            level flag::wait_till("river_turned_on");
            s_quest.var_95a4f81a += n_increase;
            foreach (e_light in a_e_lights) {
                e_light setlightintensity(function_5d783702(s_quest.var_95a4f81a));
            }
        }
        if (s_quest.var_39b71b44 >= 13) {
            level.var_2f926dcc = undefined;
            s_quest flag::set("river_styx_filled");
        }
        return;
    }
    if (!isdefined(e_target.var_4fcc6fa6)) {
        self thread zm_weap_hand_charon::function_dced5aef(e_target, w_weapon, undefined, 5000);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 3, eflags: 0x1 linked
// Checksum 0xfc3a04a1, Offset: 0xae98
// Size: 0xfc
function function_cdbadaff(var_a06d0f4f, var_2d8a1db5, n_time) {
    starttime = gettime();
    while (gettime() <= starttime + int(n_time * 1000)) {
        ratio = (gettime() - starttime) / int(n_time * 1000);
        n_stop = lerpfloat(var_a06d0f4f, var_2d8a1db5, ratio);
        self setlightintensity(function_5d783702(n_stop));
        waitframe(1);
    }
    level flag::set("river_turned_on");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x34b9759c, Offset: 0xafa0
// Size: 0x48
function function_5d783702(n_stop) {
    n_base = pow(2, n_stop);
    var_2fcfdce8 = n_base * 1600;
    return var_2fcfdce8;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x8925514f, Offset: 0xaff0
// Size: 0x1b0
function function_adc2d252(e_player) {
    var_b37a7d1e = e_player function_996fee51();
    s_quest = level.var_d225ea18[#"death"];
    if (zm_utility::is_player_valid(e_player, 0, 0) && s_quest flag::get("river_styx_filled") && !e_player flag::get(#"hash_8cdde8e6a8607f1") && var_b37a7d1e === getweapon(#"ww_hand_c_uncharged")) {
        str_prompt = zm_utility::function_d6046228(#"hash_2e883abcdf8bdb77", #"hash_84f311770e142e5");
        self sethintstringforplayer(e_player, str_prompt);
        return 1;
    }
    if (isdefined(self.var_4d532f57) && self.var_4d532f57) {
        self sethintstringforplayer(e_player, "");
        return 0;
    }
    self sethintstringforplayer(e_player, "");
    return 0;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xfe8f349, Offset: 0xb1a8
// Size: 0xe8
function function_819b24b8(e_player) {
    if (zm_utility::is_player_valid(e_player, 0, 0) && e_player flag::get(#"hash_8cdde8e6a8607f1") && !(isdefined(self.b_picked_up) && self.b_picked_up)) {
        str_prompt = zm_utility::function_d6046228(#"hash_62d83db12ce79bd", #"hash_62f3c85e5de910a3");
        self sethintstringforplayer(e_player, str_prompt);
        return 1;
    }
    self sethintstringforplayer(e_player, "");
    return 0;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x571214b8, Offset: 0xb298
// Size: 0xe8
function function_92aa1a80(e_player) {
    if (zm_utility::is_player_valid(e_player, 0, 0) && e_player flag::get(#"hash_8cdde8e6a8607f1") && !(isdefined(self.var_11dc678a) && self.var_11dc678a)) {
        str_prompt = zm_utility::function_d6046228(#"hash_7deb7f6f097ee442", #"hash_7b30716de4500f16");
        self sethintstringforplayer(e_player, str_prompt);
        return 1;
    }
    self sethintstringforplayer(e_player, "");
    return 0;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x2feb14fd, Offset: 0xb388
// Size: 0x16c
function function_41234931(b_downed = 0) {
    self notify(#"hash_408d46cc81bef3fc");
    s_quest = level.var_d225ea18[#"death"];
    if (isdefined(self.a_b_coins)) {
        for (i = 0; i < 3; i++) {
            if (isdefined(self.a_b_coins[i]) && self.a_b_coins[i]) {
                self.a_b_coins[i] = 0;
                s_quest thread function_ab234072(i);
            }
        }
    }
    if (self flag::get(#"hash_8cdde8e6a8607f1")) {
        self flag::clear(#"hash_8cdde8e6a8607f1");
        self thread function_af78c3b3(0);
        s_quest thread function_a975461d();
    }
    if (isdefined(b_downed) && b_downed) {
        s_quest thread function_808746de(self);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xedcd8773, Offset: 0xb500
// Size: 0x74
function function_7b28cf91(e_player) {
    e_player flag::clear(#"hash_8cdde8e6a8607f1");
    e_player thread function_af78c3b3(0);
    zm_unitrigger::unregister_unitrigger(self.var_e0a17499);
    self thread function_a975461d(1);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0x7e90a220, Offset: 0xb580
// Size: 0x72
function private function_af78c3b3(b_disable = 1) {
    if (b_disable) {
        level.func_override_wallbuy_prompt = &_shit_bhb_invalid_area;
        level.var_2f57e2d2 = &_shit_bhb_invalid_area;
        return;
    }
    level.func_override_wallbuy_prompt = undefined;
    level.var_2f57e2d2 = undefined;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x5 linked
// Checksum 0x2297557c, Offset: 0xb600
// Size: 0x92
function private _shit_bhb_invalid_area(e_player, player_has_weapon) {
    if (e_player flag::get(#"hash_8cdde8e6a8607f1") && isdefined(function_9b3e9487(e_player getcurrentweapon())) && function_9b3e9487(e_player getcurrentweapon())) {
        return false;
    }
    return true;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xe4313e6a, Offset: 0xb6a0
// Size: 0x23c
function function_60f650e3() {
    level.var_137b8e71 = 1;
    self.var_20a6106d[0] = struct::get("s_light_shrine_brazier1");
    self.var_20a6106d[1] = struct::get("s_light_shrine_brazier2");
    self.var_20a6106d[2] = struct::get("s_light_shrine_brazier3");
    self.var_29aa427b = getent("e_hemera_combat_weapon_clip", "targetname");
    self.var_29aa427b.origin = (self.var_29aa427b.origin[0], self.var_29aa427b.origin[1], self.var_29aa427b.origin[2] + 3000);
    var_d445485f = struct::get_array("s_ww_light_source_brazier", "targetname");
    foreach (var_542837e6 in var_d445485f) {
        var_542837e6 flag::init("light_source_brazier_lit");
        mdl_mirror = getent(var_542837e6.target, "targetname");
        mdl_mirror thread function_4771e682(var_542837e6);
        mdl_mirror thread function_b962a4a6(var_542837e6);
        zm_weap_hand_hemera::function_25513188(mdl_mirror);
    }
    level thread function_85a789f1();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xab7bd40f, Offset: 0xb8e8
// Size: 0xb0
function function_c9d01f4f(e_player) {
    var_d445485f = struct::get_array("s_ww_light_source_brazier", "targetname");
    foreach (var_542837e6 in var_d445485f) {
        self thread function_79a8a785(var_542837e6, e_player);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x64844609, Offset: 0xb9a0
// Size: 0x264
function function_b962a4a6(var_542837e6) {
    level endon(#"game_ended");
    var_542837e6 endon(#"hash_2b524e51784167cc");
    var_53b15557 = getent(self.script_noteworthy, "targetname");
    var_53b15557 enablelinkto();
    var_53b15557 linkto(self, "tag_beam");
    var_7c73e461[0] = "Shot 1";
    var_7c73e461[1] = "Shot 2";
    var_7c73e461[2] = "Shot 3";
    var_7c73e461[3] = "Shot 4";
    var_7c73e461[4] = "Shot 5";
    self.n_index = randomintrange(1, var_7c73e461.size);
    self thread scene::play(#"p8_fxanim_zm_red_hemera_mirror_bundle", var_7c73e461[self.n_index], self);
    registerpower_room_gas_heart = getweapon(#"ww_hand_h_uncharged");
    while (true) {
        var_53b15557.health = 99999;
        s_notify = var_53b15557 waittill(#"damage");
        if (s_notify.weapon === registerpower_room_gas_heart) {
            continue;
        }
        self.n_index++;
        if (self.n_index >= var_7c73e461.size) {
            self.n_index = 0;
        }
        self scene::play(#"p8_fxanim_zm_red_hemera_mirror_bundle", var_7c73e461[self.n_index], self);
        level notify(#"mirror_hit", {#t_damage:self.script_noteworthy});
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x91fbd905, Offset: 0xbc10
// Size: 0x168
function function_4771e682(var_542837e6) {
    level endon(#"game_ended");
    var_542837e6 endon(#"hash_2b524e51784167cc");
    mdl_mirror = getent(var_542837e6.target, "targetname");
    while (true) {
        s_result = level waittill(#"ww_hemera_hit");
        if (s_result.e_entity === mdl_mirror) {
            n_dist = distance(s_result.player.origin, s_result.v_position);
            n_time = n_dist / 1500;
            n_time = n_dist / 1500;
            if (n_time >= 0.1) {
                n_time -= 0.1;
            }
            wait n_time;
            self thread function_2a290bb7(var_542837e6, s_result.v_position, s_result.player);
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 3, eflags: 0x1 linked
// Checksum 0xe9415fcf, Offset: 0xbd80
// Size: 0x5ac
function function_2a290bb7(var_542837e6, v_position, e_player) {
    do {
        v_tag_origin = self gettagorigin("tag_beam");
        e_projectile = util::spawn_model("tag_origin", v_position);
        waitframe(1);
    } while (!isdefined(e_projectile));
    e_projectile clientfield::set("" + #"hash_54b4fbe8e74caf21", 1);
    if (self.n_index == 0 && !self scene::is_playing(#"hash_11d315b7b58bb5e0")) {
        var_a8237cab = struct::get(self.target, "targetname");
        n_dist = distance(e_projectile.origin, var_a8237cab.origin);
        n_time = n_dist / 1500;
        e_projectile moveto(var_a8237cab.origin, n_time);
        e_projectile waittill(#"movedone");
        e_projectile clientfield::set("" + #"hash_54b4fbe8e74caf21", 0);
        e_projectile clientfield::increment("" + #"hash_66d67792eeae46ac");
        n_dist = distance(e_projectile.origin, var_542837e6.origin);
        n_time = n_dist / 1500;
        e_projectile moveto(var_542837e6.origin, n_time);
        e_projectile waittill(#"movedone");
        e_projectile delete();
        if (isdefined(e_player) && !(isdefined(e_player.var_5ea2c230) && e_player.var_5ea2c230)) {
            e_player.var_5ea2c230 = 1;
            e_player thread zm_vo::vo_say(#"hash_49c0129bd571abb9", 0, 1, 9999, 1, 1);
        } else if (isdefined(e_player) && !(isdefined(var_542837e6.var_a7a96a2) && var_542837e6.var_a7a96a2)) {
            var_542837e6.var_a7a96a2 = 1;
            e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_positive");
        }
        if (!isdefined(var_542837e6.var_e5c25ff9)) {
            var_542837e6.var_e5c25ff9 = util::spawn_model("tag_origin", var_542837e6.origin);
        }
        var_542837e6.var_e5c25ff9 clientfield::set("" + #"hash_5faf31a2c4d4f4c6", 1);
        var_542837e6 flag::set("light_source_brazier_lit");
        return;
    }
    if (isdefined(e_player) && !(isdefined(var_542837e6.var_53a02e35) && var_542837e6.var_53a02e35)) {
        var_542837e6 thread function_86780a1e();
        e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_negative");
    }
    v_tag_angles = self gettagangles("tag_beam");
    v_tag_origin = self gettagorigin("tag_beam");
    v_forward = anglestoforward(v_tag_angles);
    v_end = v_tag_origin + v_forward * 5000;
    a_trace = bullettrace(v_tag_origin, v_end, 1, self);
    v_end = a_trace[#"position"];
    n_dist = distance(e_projectile.origin, v_end);
    n_time = n_dist / 1500;
    e_projectile moveto(v_end, n_time);
    e_projectile waittill(#"movedone");
    e_projectile delete();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x590f8585, Offset: 0xc338
// Size: 0x36
function function_86780a1e() {
    level endon(#"game_ended");
    self.var_53a02e35 = 1;
    wait 60;
    self.var_53a02e35 = 0;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0xb50fe956, Offset: 0xc378
// Size: 0x3a4
function function_79a8a785(var_542837e6, e_player) {
    e_player endon(#"disconnect", #"hash_3a05c7c89bb72260");
    var_542837e6 endon(#"hash_2b524e51784167cc");
    while (true) {
        if (var_542837e6 flag::get("light_source_brazier_lit")) {
            if (e_player ismeleeing() && e_player util::is_looking_at(var_542837e6.origin) && distance(e_player.origin, var_542837e6.origin) < 100 && e_player getcurrentweapon() === self.w_uncharged_hand && !e_player flag::get("carrying_light_energy")) {
                break;
            }
        }
        waitframe(1);
    }
    if (isdefined(e_player) && !(isdefined(e_player.var_ce51262c) && e_player.var_ce51262c)) {
        e_player.var_ce51262c = 1;
        e_player thread zm_vo::function_a2bd5a0c(#"hash_179377c40c9fbe52", 0, 1, 9999, 1);
    }
    e_player flag::set("carrying_light_energy");
    var_542837e6.var_e5c25ff9 clientfield::set("" + #"hash_5faf31a2c4d4f4c6", 0);
    var_542837e6 flag::clear("light_source_brazier_lit");
    switch (var_542837e6.script_noteworthy) {
    case #"h_bathouse":
        str_clientfield = "" + #"hash_1b4d6dabd35ebdf2";
        n_countdown = 15;
        break;
    case #"h_road":
        str_clientfield = "" + #"hash_11e36d278c735869";
        n_countdown = 12.5;
        break;
    case #"h_temple":
        str_clientfield = "" + #"hash_e683dccc6a8e152";
        n_countdown = 20;
        break;
    default:
        str_clientfield = "" + #"hash_e683dccc6a8e152";
        n_countdown = 20;
        break;
    }
    e_player clientfield::set(str_clientfield, 1);
    e_player thread light_countdown(n_countdown);
    e_player playsound("zmb_hemera_light_transfer");
    self thread light_energy_carry(e_player);
    self thread function_9aa74e4(var_542837e6, e_player, str_clientfield);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x55985c6c, Offset: 0xc728
// Size: 0x214
function function_85a789f1() {
    level endon(#"zombie_kill_breakout", #"door_opened");
    level waittill(#"junk purchased");
    level endon(#"junk purchased");
    for (i = 0; i < 3; i++) {
        s_result = level waittill(#"mirror_hit");
        if (!(s_result.t_damage === "trig_mirror_damage1")) {
            return 0;
        }
    }
    for (i = 0; i < 2; i++) {
        s_result = level waittill(#"mirror_hit");
        if (!(s_result.t_damage === "trig_mirror_damage2")) {
            return 0;
        }
    }
    s_result = level waittill(#"mirror_hit");
    if (!(s_result.t_damage === "trig_mirror_damage3")) {
        return 0;
    }
    s_result = level waittill(#"mirror_hit");
    if (!(s_result.t_damage === "trig_mirror_damage2")) {
        return 0;
    }
    wait 3;
    a_e_players = util::get_active_players();
    e_player = a_e_players[0];
    if (e_player util::is_looking_at((-586.5, -604.5, 226))) {
        level thread function_65d82d13();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x418d0095, Offset: 0xc948
// Size: 0x876
function function_65d82d13() {
    var_2e8223db = util::spawn_model("tag_origin", (-647.5, -615, 328));
    var_2e8223db clientfield::set("" + #"hash_21f5fab6a3d22093", 4);
    var_2e8223db moveto((-647, -615.5, 266.5), 1);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_2e8223db.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 4);
        wait 0.25;
    }
    var_2e8223db moveto((-595.5, -606, 266.5), 0.75);
    for (i = 0; i < 3; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_2e8223db.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 4);
        wait 0.25;
    }
    var_2e8223db.origin = (-548.5, -597.5, 326.5);
    var_2e8223db moveto((-548, -598, 265.5), 1);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_2e8223db.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 2);
        wait 0.25;
    }
    var_2e8223db.origin = (-548.5, -597.5, 326.5);
    var_2e8223db moveto((-495, -587.5, 326.5), 1);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_2e8223db.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 2);
        wait 0.25;
    }
    var_2e8223db.origin = (-547.5, -598.5, 295.5);
    var_2e8223db moveto((-494, -588.5, 295.5), 1);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_2e8223db.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 2);
        wait 0.25;
    }
    var_2e8223db.origin = (-548, -598, 265.5);
    var_2e8223db moveto((-494.5, -588, 265.5), 1);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_2e8223db.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 2);
        wait 0.25;
    }
    var_2e8223db.origin = (-431.5, -583.5, 294);
    var_786815c = util::spawn_model("tag_origin", (-431.378, -583.812, 256.744));
    var_786815c linkto(var_2e8223db);
    var_2e8223db rotateto((90, 0, 0), 0.4);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_786815c.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 3);
        wait 0.1;
    }
    wait 0.1;
    var_2e8223db rotateto((180, 0, 0), 0.4);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_786815c.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 3);
        wait 0.1;
    }
    wait 0.1;
    var_2e8223db rotateto((270, 0, 0), 0.4);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_786815c.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 3);
        wait 0.1;
    }
    wait 0.1;
    var_2e8223db rotateto((0, 0, 0), 0.4);
    for (i = 0; i < 4; i++) {
        mdl_temp = util::spawn_model("tag_origin", var_786815c.origin);
        mdl_temp clientfield::set("" + #"hash_21f5fab6a3d22093", 3);
        wait 0.1;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x4159197, Offset: 0xd1c8
// Size: 0x132
function light_energy_carry(e_player) {
    e_player endon(#"disconnect", #"hash_3f0faacb0cc98a9");
    callback::on_weapon_change(&function_fbcb1210);
    while (true) {
        if (e_player ismeleeing() && distance(e_player.origin, self.var_a1327d58.origin) < 150 && e_player getcurrentweapon() === self.w_uncharged_hand) {
            e_player notify(#"hash_3f0faacb0cc98a9", {#b_success:1});
            callback::remove_on_weapon_change(&function_fbcb1210);
            break;
        }
        waitframe(1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x1f397c41, Offset: 0xd308
// Size: 0x36
function function_fbcb1210(s_params) {
    self notify(#"hash_3f0faacb0cc98a9", {#b_success:0});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 3, eflags: 0x1 linked
// Checksum 0xf2af6731, Offset: 0xd348
// Size: 0x294
function function_9aa74e4(var_542837e6, e_player, str_clientfield) {
    e_player endon(#"disconnect");
    s_result = e_player waittill(#"hash_3f0faacb0cc98a9", #"fake_death");
    if (s_result._notify == "fake_death") {
        s_result.b_success = 0;
    }
    e_player flag::clear("carrying_light_energy");
    if (isdefined(s_result.b_success) && s_result.b_success) {
        e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_positive");
        e_player playsound("zmb_hemera_light_transfer");
        var_542837e6 notify(#"hash_2b524e51784167cc");
        var_542837e6.var_e5c25ff9 delete();
        mdl_mirror = getent(var_542837e6.target, "targetname");
        mdl_mirror thread function_dbe1d7b8();
        self thread function_9c79eeed(e_player);
        if (isdefined(str_clientfield)) {
            e_player clientfield::set(str_clientfield, 0);
        }
        return;
    }
    if (!isdefined(e_player.var_d49744d5)) {
        e_player.var_d49744d5 = 2;
    }
    e_player.var_d49744d5++;
    if (e_player.var_d49744d5 > 2) {
        e_player.var_d49744d5 = 0;
        e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_negative");
    }
    self thread function_79a8a785(var_542837e6, e_player);
    if (isdefined(str_clientfield)) {
        e_player clientfield::set(str_clientfield, 0);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x9fc5f314, Offset: 0xd5e8
// Size: 0x294
function function_9c79eeed(e_player) {
    var_bff804cb = undefined;
    self.var_20a6106d = arraysortclosest(self.var_20a6106d, e_player.origin);
    foreach (s_shrine in self.var_20a6106d) {
        if (e_player util::is_player_looking_at(s_shrine.origin, 0.9, 1)) {
            var_bff804cb = s_shrine;
            arrayremovevalue(self.var_20a6106d, s_shrine);
            break;
        }
    }
    if (!isdefined(var_bff804cb)) {
        foreach (s_shrine in self.var_20a6106d) {
            var_bff804cb = s_shrine;
            arrayremovevalue(self.var_20a6106d, s_shrine);
            break;
        }
    }
    var_bff804cb.var_e5c25ff9 = util::spawn_model("tag_origin", var_bff804cb.origin);
    waitframe(1);
    if (isdefined(var_bff804cb.var_e5c25ff9)) {
        var_bff804cb.var_e5c25ff9 clientfield::increment("" + #"hash_4b6213be97ba0c98");
    }
    if (self.var_20a6106d.size <= 0) {
        wait 0.5;
        exploder::exploder("fxexp_wq_h_shrine");
        self.var_a1327d58 flag::set(#"hash_582906087b67b7c6");
        e_player thread zm_vo::vo_say(#"hash_31853afc1ad7ea18", 0, 1, 9999, 1, 1);
        wait 1;
        self thread function_4e2445e0();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x2149c8b0, Offset: 0xd888
// Size: 0x104
function function_dbe1d7b8() {
    a_s_loc = struct::get_array("mirror_explosion_loc", "targetname");
    s_loc = arraygetclosest(self.origin, a_s_loc);
    if (isdefined(s_loc)) {
        var_dafa2b89 = util::spawn_model("tag_origin", s_loc.origin);
        var_dafa2b89 clientfield::increment("" + #"hemera_impact");
        self hidepart("p8_zm_red_hemera_mirror_link_jnt", "", 1);
        wait 1.5;
        var_dafa2b89 delete();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x16b22582, Offset: 0xd998
// Size: 0x84
function light_countdown(n_time) {
    self endon(#"hash_3f0faacb0cc98a9");
    n_duration = 1;
    while (true) {
        n_time -= n_duration;
        if (n_time <= 0) {
            self notify(#"hash_3f0faacb0cc98a9", {#b_success:0});
            break;
        }
        wait n_duration;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xab58be9e, Offset: 0xda28
// Size: 0xe2
function function_35d91981(e_player) {
    self.var_29aa427b.origin = (self.var_29aa427b.origin[0], self.var_29aa427b.origin[1], self.var_29aa427b.origin[2] - 3000);
    e_player waittill(#"hash_4d89e2bb8e3d1eb3", #"disconnect");
    self.var_29aa427b.origin = (self.var_29aa427b.origin[0], self.var_29aa427b.origin[1], self.var_29aa427b.origin[2] + 3000);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x68e9350e, Offset: 0xdb18
// Size: 0xc
function function_419874c2(e_player) {
    
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x1723d6f3, Offset: 0xdb30
// Size: 0x24c
function function_29022c99() {
    level.var_d162b086 = struct::get("s_ww_ouranos_arrow_cliff");
    level.var_d162b086.mdl_arrow = getent("mdl_ww_ouranos_arrow_cliff", "targetname");
    level.var_d162b086.var_80d10658 = getent("ouranos_arrow_cliff_clip", "targetname");
    level.var_d162b086.var_688d8a36 = 1;
    level.var_90ac03cc = struct::get("s_ww_ouranos_arrow_serpent");
    level.var_90ac03cc.mdl_arrow = getent("mdl_ww_ouranos_arrow_serpent", "targetname");
    level.var_90ac03cc.var_80d10658 = getent("ouranos_arrow_serpent_clip", "targetname");
    level.var_90ac03cc.var_688d8a36 = 1;
    level.var_46c8296a = struct::get("s_ww_ouranos_arrow_center");
    level.var_46c8296a.mdl_arrow = getent("mdl_ww_ouranos_arrow_center", "targetname");
    level.var_46c8296a.var_80d10658 = getent("ouranos_arrow_center_clip", "targetname");
    level.var_46c8296a.var_688d8a36 = 1;
    self.var_267d1e6 = 0;
    mdl_shrine_feathers = getent("mdl_shrine_feathers_complete", "targetname");
    mdl_shrine_feathers hidepart("tag_feather_01");
    mdl_shrine_feathers hidepart("tag_feather_02");
    mdl_shrine_feathers hidepart("tag_feather_03");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x9612563d, Offset: 0xdd88
// Size: 0x36
function function_d5dcd2b0(e_player) {
    level.var_3804f7bd = &function_42afccbf;
    level.var_21343c57 = 1;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 3, eflags: 0x1 linked
// Checksum 0xf27d71d9, Offset: 0xddc8
// Size: 0x1d4
function function_42afccbf(e_target, weapon = level.weaponnone, n_damage) {
    if (e_target.archetype === #"zombie") {
        vol_cliff = getent("vol_ww_ouranos_cliff", "targetname");
        vol_serpent = getent("vol_ww_ouranos_serpent", "targetname");
        vol_center = getent("vol_ww_ouranos_center", "targetname");
        registerzmb_pod_play_preferred = 0;
        if (e_target istouching(vol_center)) {
            registerzmb_pod_play_preferred = 1;
        } else if (e_target istouching(vol_cliff)) {
            registerzmb_pod_play_preferred = 2;
        } else if (e_target istouching(vol_serpent)) {
            registerzmb_pod_play_preferred = 3;
        }
        if (registerzmb_pod_play_preferred > 0) {
            if (self issplitscreen() && !self ishost()) {
                self thread function_479cad97(e_target, registerzmb_pod_play_preferred);
            } else {
                e_target.var_acca05a0 = 1;
            }
        }
    }
    self zm_weap_hand_ouranos::function_dced5aef(e_target, weapon, n_damage);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0xfc630caa, Offset: 0xdfa8
// Size: 0x15c
function function_479cad97(e_target, registerzmb_pod_play_preferred) {
    v_to_target = e_target.origin - self.origin;
    v_to_target = vectornormalize((v_to_target[0], v_to_target[1], 0));
    switch (registerzmb_pod_play_preferred) {
    case 1:
        s_fletching = level.var_46c8296a;
        break;
    case 2:
        s_fletching = level.var_d162b086;
        break;
    case 3:
        s_fletching = level.var_90ac03cc;
        break;
    }
    var_d5498a47 = s_fletching.origin - self.origin;
    var_d5498a47 = vectornormalize((var_d5498a47[0], var_d5498a47[1], 0));
    if (vectordot(v_to_target, var_d5498a47) > 0.85) {
        self zm_weap_hand_ouranos::ouranos_feather_hit(undefined, registerzmb_pod_play_preferred);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x6931f23f, Offset: 0xe110
// Size: 0x1a4
function function_759247cd(str_loc) {
    switch (str_loc) {
    case #"hash_2ffae388c1cf246e":
        str_scene = #"p8_fxanim_zm_red_apollo_arrow_dmg_01_bundle";
        s_fletching = level.var_46c8296a;
        break;
    case #"hash_4634a6e71b6a75e7":
        str_scene = #"p8_fxanim_zm_red_apollo_arrow_dmg_02_bundle";
        s_fletching = level.var_d162b086;
        break;
    case #"hash_3a4532026857cf6":
        str_scene = #"p8_fxanim_zm_red_apollo_arrow_dmg_03_bundle";
        s_fletching = level.var_90ac03cc;
        break;
    }
    if (isdefined(s_fletching.var_688d8a36) && s_fletching.var_688d8a36) {
        level.var_3804f7bd = undefined;
        s_fletching.mdl_arrow thread scene::play(str_scene, "impact", s_fletching.mdl_arrow);
        s_fletching thread spawn_feather(self);
        if (isdefined(self) && !(isdefined(self.var_1b73e21e) && self.var_1b73e21e)) {
            self thread function_fb68b3bb();
            self thread zm_vo::vo_say(#"hash_527affa472c96d3e", 0, 1, 9999, 1, 1);
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xa35eff2f, Offset: 0xe2c0
// Size: 0x7e
function function_fb68b3bb() {
    self endon(#"disconnect", #"feather_restored");
    self.var_1b73e21e = 1;
    self waittill(#"feather_success", #"feather_fail");
    wait randomintrange(120, 180);
    self.var_1b73e21e = undefined;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x311a9e53, Offset: 0xe348
// Size: 0xe4
function spawn_feather(e_player) {
    var_5047d5ee = (self.origin[0], self.origin[1], self.origin[2] + 20);
    var_8290a028 = util::spawn_model("tag_origin", var_5047d5ee);
    mdl_feather = util::spawn_model("p8_fxanim_zm_red_ouranos_feather_mod", self.origin);
    mdl_feather linkto(var_8290a028);
    self function_759736f(var_8290a028, mdl_feather);
    self thread function_6d466962(var_8290a028, self, mdl_feather, e_player);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 4, eflags: 0x1 linked
// Checksum 0xb70b1e80, Offset: 0xe438
// Size: 0x6cc
function function_6d466962(var_8290a028, s_original, mdl_feather, e_player = undefined) {
    var_8290a028 endon(#"hash_d7ca523241e8359");
    n_max_height = var_8290a028.origin[2];
    s_quest = level.var_d225ea18[#"air"];
    var_8290a028 thread scene::play(#"p8_fxanim_zm_red_ouranos_feather_01_bundle", "feather01_float", mdl_feather);
    var_40bb500f = struct::get(self.target, "targetname");
    n_dist = distance(var_8290a028.origin, var_40bb500f.origin);
    n_time = n_dist / 100 * self.script_int / 100;
    var_8290a028 moveto(var_40bb500f.origin, n_time);
    if (!isdefined(var_40bb500f.target)) {
        var_8290a028 waittill(#"movedone");
        var_8290a028 playsound("zmb_oura_feather_complete");
        s_quest.var_267d1e6++;
        switch (s_original.targetname) {
        case #"s_ww_ouranos_arrow_center":
            var_511277e5 = #"p8_fxanim_zm_red_apollo_arrow_dmg_01_bundle";
            var_e3ed6c41 = #"p8_fxanim_zm_red_ouranos_feather_01_bundle";
            var_8806d469 = "feather01_slot01";
            var_adcf0d98 = "tag_feather_01";
            break;
        case #"s_ww_ouranos_arrow_cliff":
            var_511277e5 = #"p8_fxanim_zm_red_apollo_arrow_dmg_02_bundle";
            var_e3ed6c41 = #"p8_fxanim_zm_red_ouranos_feather_02_bundle";
            var_8806d469 = "feather02_slot02";
            var_adcf0d98 = "tag_feather_02";
            break;
        case #"s_ww_ouranos_arrow_serpent":
            var_511277e5 = #"p8_fxanim_zm_red_apollo_arrow_dmg_03_bundle";
            var_e3ed6c41 = #"hash_417d6d68cfb494d2";
            var_8806d469 = "feather03_slot03";
            var_adcf0d98 = "tag_feather_03";
            break;
        }
        s_original.mdl_arrow thread scene::play(var_511277e5, "break", s_original.mdl_arrow);
        s_original.var_688d8a36 = 0;
        var_8290a028 scene::play(var_e3ed6c41, var_8806d469, mdl_feather);
        mdl_shrine_feathers = getent("mdl_shrine_feathers_complete", "targetname");
        mdl_shrine_feathers showpart(var_adcf0d98);
        var_8290a028 delete();
        mdl_feather delete();
        if (isdefined(s_original.var_80d10658)) {
            s_original.var_80d10658 delete();
        }
        if (isdefined(e_player)) {
            e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_positive");
            e_player notify(#"feather_success");
        }
        level.var_3804f7bd = &function_42afccbf;
    } else {
        var_40bb500f thread function_381519d9(var_8290a028, mdl_feather, n_max_height, s_original);
        var_8290a028 waittill(#"movedone");
        var_f5c79a92 = (var_8290a028.origin[0], var_8290a028.origin[1], var_8290a028.origin[2] - 100);
        n_dist = distance(var_8290a028.origin, var_f5c79a92);
        n_time = n_dist / 150;
        var_8290a028 moveto(var_f5c79a92, n_time);
        var_8290a028 thread scene::play(#"p8_fxanim_zm_red_ouranos_feather_01_bundle", "feather01_fall", mdl_feather);
        var_8290a028 waittill(#"movedone");
        if (isdefined(e_player)) {
            e_player notify(#"feather_fail");
            if (!isdefined(e_player.var_707d44fa)) {
                e_player.var_707d44fa = 0;
            }
            e_player.var_707d44fa++;
            if (e_player.var_707d44fa == 2) {
                e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_negative");
                e_player.var_707d44fa = 0;
            }
        }
        level.var_3804f7bd = &function_42afccbf;
        var_8290a028 delete();
        mdl_feather delete();
    }
    if (s_quest.var_267d1e6 >= 3) {
        level.var_3804f7bd = undefined;
        if (isdefined(e_player)) {
            e_player thread zm_vo::vo_say(#"hash_1efee59e97770b5c", 0, 1, 9999, 1, 1);
            e_player notify(#"feather_restored");
        }
        exploder::exploder_stop("fxexp_wq_o_shrine");
        s_quest thread function_4e2445e0();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 4, eflags: 0x1 linked
// Checksum 0xfac36be6, Offset: 0xeb10
// Size: 0x284
function function_381519d9(var_8290a028, mdl_feather, n_max_height, s_original) {
    var_8290a028 endon(#"movedone");
    out_of_range_lp_ = 32;
    while (true) {
        s_result = level waittill(#"ww_ouranos_hit");
        e_player = s_result.player;
        var_2ed6f142 = e_player getweaponmuzzlepoint();
        var_16d329c7 = e_player getweaponforwarddir();
        v_end_pos = var_2ed6f142 + vectorscale(var_16d329c7, 3000);
        a_beamtrace = bullettrace(var_2ed6f142, v_end_pos, 0, e_player);
        var_74238e2c = out_of_range_lp_ * out_of_range_lp_;
        var_1dc736c5 = pointonsegmentnearesttopoint(var_2ed6f142, v_end_pos, var_8290a028.origin);
        n_dist = distancesquared(var_8290a028.origin, var_1dc736c5);
        if (n_dist <= var_74238e2c) {
            break;
        }
        waitframe(1);
    }
    n_dist_to_target = distance2d(var_2ed6f142, var_8290a028.origin);
    n_time = n_dist_to_target / 1500;
    if (n_time >= 0.1) {
        n_time -= 0.1;
    }
    wait n_time;
    var_8290a028 clientfield::increment("" + #"ouranos_feather_hit_fx");
    var_8290a028 notify(#"hash_d7ca523241e8359");
    self function_759736f(var_8290a028, mdl_feather);
    self thread function_6d466962(var_8290a028, s_original, mdl_feather, e_player);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x28cc9b21, Offset: 0xeda0
// Size: 0x112
function function_759736f(var_8290a028, mdl_feather) {
    var_8290a028 thread scene::play(#"p8_fxanim_zm_red_ouranos_feather_01_bundle", "feather01_gust", mdl_feather);
    var_40bb500f = struct::get(self.target, "targetname");
    var_8d1c63ac = (var_40bb500f.origin[0], var_40bb500f.origin[1], var_8290a028.origin[2] + 250);
    n_dist = distance(var_8290a028.origin, var_8d1c63ac);
    n_time = n_dist / 250;
    var_8290a028 moveto(var_8d1c63ac, n_time);
    wait 1;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x21d50fc7, Offset: 0xeec0
// Size: 0xc
function function_35c395f1(e_player) {
    
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x9f22dba5, Offset: 0xeed8
// Size: 0x37c
function function_dd1c5ae6() {
    level.var_d225ea18[#"earth"].var_8baa00ae = 0;
    self.mdl_portal = getent("mdl_gaia_portal", "targetname");
    self.mdl_return_portal = getent("mdl_gaia_return_portal", "targetname");
    self.var_285af63c = getent("mdl_gaia_p_portal", "targetname");
    level.var_1e60b889 = 1;
    level.w_sprout = getweapon("equip_sprout");
    self.var_648b1679 = array("sprout_lt_root", "sprout_rt_root", "sprout_mid_root");
    var_1d89b97b = struct::get_array("s_ww_earth_tree", "targetname");
    foreach (var_52666e80 in var_1d89b97b) {
        s_unitrigger = var_52666e80 zm_unitrigger::create(&function_73c422de);
        zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
        mdl_tree = getent(var_52666e80.script_noteworthy, "targetname");
        mdl_tree thread function_bbee7f7b();
        a_mdl_chaos = getentarray(mdl_tree.target, "targetname");
        var_52666e80.var_c2f1923d = 0;
        foreach (mdl_chaos in a_mdl_chaos) {
            mdl_chaos thread function_68080923(var_52666e80, mdl_tree);
        }
        var_cb2f80a0 = getent(var_52666e80.target, "targetname");
        var_52666e80 flag::init(#"seedling_available");
    }
    scene::add_scene_func(#"p8_fxanim_zm_red_gaia_portal_bundle", &function_ab1bce1d, "init");
    level thread scene::init("p8_fxanim_zm_red_gaia_portal_bundle");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x5 linked
// Checksum 0x43eb9c04, Offset: 0xf260
// Size: 0x54
function private function_bbee7f7b() {
    level flag::wait_till("all_players_spawned");
    self clientfield::set("" + #"hash_3c85334429a971b4", 1);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x378ab308, Offset: 0xf2c0
// Size: 0xc
function function_ca04e287(e_player) {
    
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0xf8181109, Offset: 0xf2d8
// Size: 0x2ac
function function_68080923(var_52666e80, mdl_tree) {
    level endon(#"end_game");
    level flag::wait_till("all_players_spawned");
    self clientfield::set("" + #"hash_3a6cd708b9ee114c", 1);
    zm_weap_hand_gaia::function_25513188(self);
    while (true) {
        s_result = level waittill(#"ww_gaia_hit");
        v_orig = s_result.player getweaponmuzzlepoint();
        n_dist = distance(v_orig, s_result.v_position);
        n_time = n_dist / 1500;
        if (n_time >= 0.05) {
            n_time -= 0.05;
        }
        wait n_time;
        if (s_result.e_entity === self) {
            zm_weap_hand_gaia::function_5760b289(self);
            var_52666e80.var_c2f1923d++;
            self thread function_1775f520();
            if (var_52666e80.var_c2f1923d >= 3) {
                if (isdefined(s_result.player) && !(isdefined(s_result.player.var_a381a313) && s_result.player.var_a381a313)) {
                    s_result.player.var_a381a313 = 1;
                    s_result.player thread zm_vo::vo_say(#"hash_39d30b7d40892c58", 0, 1, 9999, 1, 1);
                } else if (isdefined(s_result.player)) {
                    s_result.player thread zm_audio::create_and_play_dialog(#"generic", #"response_positive");
                }
                var_52666e80 thread function_fffb9aee(mdl_tree);
            }
            break;
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x98ccf9db, Offset: 0xf590
// Size: 0x31c
function function_1775f520() {
    switch (self.script_int) {
    case 1:
        exploder::exploder("exp_lgt_chaos_bush_iot_1");
        break;
    case 2:
        exploder::exploder("exp_lgt_chaos_bush_iot_2");
        break;
    case 3:
        exploder::exploder("exp_lgt_chaos_bush_iot_3");
        break;
    case 4:
        exploder::exploder("exp_lgt_chaos_bush_temple_1");
        break;
    case 5:
        exploder::exploder("exp_lgt_chaos_bush_temple_2");
        break;
    case 6:
        exploder::exploder("exp_lgt_chaos_bush_temple_3");
        break;
    case 7:
        exploder::exploder("exp_lgt_chaos_bush_stoa_1");
        break;
    case 8:
        exploder::exploder("exp_lgt_chaos_bush_stoa_2");
        break;
    case 9:
        exploder::exploder("exp_lgt_chaos_bush_stoa_3");
        break;
    }
    self hide();
    switch (self.model) {
    case #"hash_17ff8b184015c0d0":
        str_tag = "tag_center_01";
        break;
    case #"hash_17ff8e184015c5e9":
        str_tag = "tag_center_02";
        break;
    case #"hash_17ff8d184015c436":
        str_tag = "tag_center_03";
        break;
    }
    do {
        var_223e908d = util::spawn_model("tag_origin", self gettagorigin(str_tag), self gettagangles(str_tag));
    } while (!isdefined(var_223e908d));
    var_223e908d clientfield::set("" + #"hash_3e1feb871865ccd5", 1);
    wait 2;
    self delete();
    var_223e908d delete();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xfe077e1, Offset: 0xf8b8
// Size: 0xec
function function_ab1bce1d(a_ents) {
    level.var_643e7b15 = a_ents[#"prop 1"];
    level.var_643e7b15 hidepart("sprout_lt_root", "", 1);
    level.var_643e7b15 hidepart("sprout_rt_root", "", 1);
    level.var_643e7b15 hidepart("sprout_mid_root", "", 1);
    scene::remove_scene_func(#"p8_fxanim_zm_red_gaia_portal_bundle", &function_ab1bce1d, "init");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xb406f8d0, Offset: 0xf9b0
// Size: 0xac
function function_fffb9aee(mdl_tree) {
    level endon(#"end_game");
    self thread function_ac211843();
    mdl_tree clientfield::set("" + #"hash_3c85334429a971b4", 0);
    mdl_tree scene::play(#"hash_14bd682f680e9baa", "heal", mdl_tree);
    mdl_tree setmodel(#"hash_3cb03679991cf4ad");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x16ef08e9, Offset: 0xfa68
// Size: 0x21c
function function_ac211843(b_failed) {
    level endon(#"end_game");
    var_cb2f80a0 = getent(self.target, "targetname");
    if (isdefined(b_failed) && b_failed) {
        wait 45;
        var_cb2f80a0 scene::play(#"hash_12afdd17d7f069df", "regrow", var_cb2f80a0);
    } else {
        var_cb2f80a0 scene::play(#"hash_12afdd17d7f069df", "grow", var_cb2f80a0);
    }
    self flag::set(#"seedling_available");
    s_result = self waittill(#"trigger_activated");
    if (isdefined(s_result.e_who) && !(isdefined(s_result.e_who.var_9cf704b7) && s_result.e_who.var_9cf704b7)) {
        s_result.e_who.var_9cf704b7 = 1;
        s_result.e_who thread zm_vo::function_a2bd5a0c(#"hash_379aab9b6f7dc5f4", 0, 1, 9999, 1);
    }
    self flag::clear(#"seedling_available");
    var_cb2f80a0 hidepart("sprout_base_jnt", "", 1);
    s_result.e_who.var_52666e80 = self;
    self thread function_41cb93cc(s_result.e_who);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x20c16fc1, Offset: 0xfc90
// Size: 0x2a0
function function_41cb93cc(e_player) {
    e_player endon(#"seedling_dropped", #"disconnect");
    s_quest = level.var_d225ea18[#"earth"];
    e_player.var_7e19c3db = 1;
    e_player disableweaponcycling();
    var_b37a7d1e = e_player function_996fee51();
    e_player.var_34e10757 = e_player getammocount(var_b37a7d1e);
    e_player takeweapon(var_b37a7d1e);
    e_player zm_weapons::weapon_give(level.w_sprout);
    e_player playsound("zmb_earth_seed_take");
    e_player thread function_f4b436d5();
    w_current = e_player getcurrentweapon();
    if (w_current === getweapon("zhield_zpear_turret")) {
        e_player waittill(#"weapon_change_complete");
    }
    e_player waittill(#"weapon_change_complete");
    e_player.var_7e19c3db = 0;
    callback::on_weapon_change(&function_3462981);
    callback::function_33f0ddd3(&function_3b0917e6);
    e_player enableweaponcycling();
    self thread function_1c5aedd8(e_player);
    e_player thread function_54da9fac();
    s_quest.var_a1327d58 waittill(#"trigger_activated");
    e_player playsound("zmb_earth_seed_plant");
    e_player notify(#"seedling_dropped", {#str_result:"planted"});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x888153d0, Offset: 0xff38
// Size: 0x194
function function_f4b436d5() {
    self endon(#"disconnect");
    self.is_drinking = 1;
    self disableoffhandweapons();
    self allowmelee(0);
    self allowsprint(0);
    self allowjump(0);
    self allowcrouch(0);
    self allowprone(0);
    self bgb_pack::function_ac9cb612();
    self waittill(#"seedling_dropped");
    self.is_drinking = 0;
    self enableoffhandweapons();
    self allowmelee(1);
    self allowsprint(1);
    self allowjump(1);
    self allowcrouch(1);
    self allowprone(1);
    self bgb_pack::function_ac9cb612(0);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xe2094bb0, Offset: 0x100d8
// Size: 0x8c
function function_9ef120d8() {
    level thread function_887b7e4b(#"earth", self.var_34e10757);
    self.var_52666e80 thread function_ac211843(1);
    callback::remove_on_weapon_change(&function_3462981);
    callback::function_824d206(&function_3b0917e6);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xc63614fe, Offset: 0x10170
// Size: 0x36
function function_3462981(s_params) {
    self notify(#"seedling_dropped", {#str_result:"dropped"});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x3ccd362b, Offset: 0x101b0
// Size: 0x10e
function function_3b0917e6(eventstruct) {
    if (eventstruct.weapon === getweapon(#"hash_fb7df72cfdf8492") || eventstruct.weapon === getweapon(#"hash_fb7de72cfdf82df") || eventstruct.weapon === getweapon(#"hash_fb7dd72cfdf812c")) {
        return;
    }
    if (eventstruct.event === "take_weapon" && eventstruct.weapon === getweapon(#"zhield_zpear_dw")) {
        return;
    }
    self notify(#"seedling_dropped", {#str_result:"loadout_changed"});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xd60d2a48, Offset: 0x102c8
// Size: 0x56
function function_54da9fac() {
    self endon(#"disconnect", #"death", #"seedling_dropped");
    self waittill(#"zmb_max_ammo");
    self.var_ada0236a = 1;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xaf4100c3, Offset: 0x10328
// Size: 0x45a
function function_1c5aedd8(e_player) {
    e_player endon(#"disconnect");
    s_quest = level.var_d225ea18[#"earth"];
    s_result = e_player waittill(#"seedling_dropped", #"fake_death");
    callback::remove_on_weapon_change(&function_3462981);
    callback::function_824d206(&function_3b0917e6);
    e_player.var_52666e80 = undefined;
    if (s_result.str_result === "dropped" || s_result.str_result === "loadout_changed" || s_result._notify == "fake_death") {
        if (e_player getcurrentweapon() === level.w_sprout) {
            e_player takeweapon(level.w_sprout);
        }
        e_player thread function_fd3d477c();
        self thread function_ac211843(1);
        e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_negative");
    } else if (isdefined(s_result.str_result === "planted") && s_result.str_result === "planted") {
        e_player takeweapon(level.w_sprout);
        level.var_643e7b15 showpart(s_quest.var_648b1679[s_quest.var_8baa00ae], "", 1);
        s_quest.var_8baa00ae++;
        level.var_643e7b15 clientfield::set("" + #"hash_5d3f9aab20abf568", s_quest.var_8baa00ae);
        if (s_quest.var_8baa00ae >= 3) {
            e_player thread zm_vo::vo_say(#"hash_825b37a44371712", 0.5, 1, 9999, 1, 1);
            s_quest thread function_4e2445e0();
            level.var_1e60b889 = 0;
        } else {
            e_player thread zm_audio::create_and_play_dialog(#"generic", #"response_positive");
        }
    }
    if (s_result.str_result === "loadout_changed" || s_result._notify == "fake_death") {
        e_player function_887b7e4b(#"earth", e_player.var_34e10757);
        e_player.var_34e10757 = undefined;
        return;
    }
    e_player zm_weapons::weapon_give(s_quest.w_uncharged_hand, 1, 0);
    if (isdefined(e_player.var_ada0236a) && e_player.var_ada0236a) {
        e_player zm_weapons::function_7c5dd4bd(s_quest.w_uncharged_hand);
    } else {
        e_player setweaponammoclip(s_quest.w_uncharged_hand, e_player.var_34e10757);
    }
    e_player.var_ada0236a = undefined;
    e_player.var_34e10757 = undefined;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x8668847, Offset: 0x10790
// Size: 0x1cc
function function_fd3d477c() {
    level endon(#"game_ended");
    v_pos = (self.origin[0], self.origin[1], self.origin[2] + 32);
    v_pos_end = (self.origin[0], self.origin[1], self.origin[2] - 1000);
    a_trace = groundtrace(v_pos, v_pos_end, 0, self, 1);
    n_scale = 1.5;
    if (isdefined(a_trace[#"position"])) {
        v_spawn_pos = a_trace[#"position"];
        v_spawn_pos = (v_spawn_pos[0], v_spawn_pos[1], v_spawn_pos[2] - 4);
        mdl_plant = util::spawn_model("p8_zm_red_gaia_bush_01_sprout_01", v_spawn_pos, (0, 0, 0));
        mdl_plant setscale(n_scale);
        while (n_scale > 0.1) {
            n_scale -= 0.05;
            mdl_plant setscale(n_scale);
            waitframe(1);
        }
        mdl_plant delete();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x6806ee0f, Offset: 0x10968
// Size: 0x150
function function_73c422de(e_player) {
    if (zm_utility::is_player_valid(e_player, 0, 0) && self.stub.related_parent flag::get("seedling_available") && e_player function_996fee51() === getweapon(#"ww_hand_g_uncharged") && e_player getcurrentweapon() != level.w_sprout && e_player getstance() != "prone") {
        str_prompt = zm_utility::function_d6046228(#"hash_4ed12c15281be96e", #"hash_35c3c9f931f0049a");
        self sethintstringforplayer(e_player, str_prompt);
        return 1;
    }
    self sethintstringforplayer(e_player, "");
    return 0;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xe926fb6e, Offset: 0x10ac0
// Size: 0xc
function function_bde99aa3(e_player) {
    
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xb1b8564a, Offset: 0x10ad8
// Size: 0x194
function function_4e2445e0() {
    self.var_a1327d58 endon(#"hand_returned");
    self notify("11cf8f65a8dcdcd7");
    self endon("11cf8f65a8dcdcd7");
    var_a1327d58 = self.var_a1327d58;
    var_a1327d58 flag::set("flag_ww_quests_portal_available");
    if (isdefined(var_a1327d58.holding_weapon) && var_a1327d58.holding_weapon) {
        return;
    }
    self thread function_530d7ea0(1);
    e_player = undefined;
    while (true) {
        s_waitresult = var_a1327d58 waittill(#"hash_16ea93eb944ff512");
        if (namespace_8216831d::is_active()) {
            waitframe(1);
            continue;
        }
        e_player = s_waitresult.e_who;
        var_b37a7d1e = e_player function_996fee51();
        if (var_b37a7d1e === var_a1327d58.var_884c4b3a) {
            break;
        }
    }
    if (isdefined(self.var_8aea3d8d)) {
        self thread [[ self.var_8aea3d8d ]](e_player);
    }
    zm_zonemgr::enable_zone(self.var_e6a4592d);
    self thread function_6161ce9a(e_player);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x5e71cd63, Offset: 0x10c78
// Size: 0x7bc
function function_6161ce9a(e_player) {
    e_player endon(#"disconnect", #"hash_4d89e2bb8e3d1eb3");
    level.zones[self.var_e6a4592d].is_enabled = 1;
    e_player flag::set(#"ww_combat_active");
    e_player.var_7881756e = self.targetname;
    self thread function_8ad28be8(e_player);
    self thread function_aea7779d(e_player);
    e_player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, self.var_9bd3a2c6, self.var_5357def6, undefined, undefined, 1, 0);
    str_stance = e_player getstance();
    switch (str_stance) {
    case #"crouch":
        wait 0.2;
        break;
    case #"prone":
        wait 1;
        break;
    }
    if (isdefined(self.var_f172b16e)) {
        e_player clientfield::set(self.var_f172b16e, 1);
    }
    a_e_players = util::get_active_players();
    var_8ab262fb = a_e_players.size;
    foreach (var_774e4b90 in a_e_players) {
        if (var_774e4b90 flag::get(#"ww_combat_active") || var_774e4b90 flag::get(#"hash_3247dad158e8b329")) {
            var_8ab262fb--;
        }
    }
    if (var_8ab262fb == 0) {
        level flag::clear("spawn_zombies");
        a_e_zombies = getaiteamarray(level.zombie_team);
        if (isdefined(a_e_zombies)) {
            foreach (e_zombie in a_e_zombies) {
                if (isdefined(e_zombie.var_3c394b1b) && e_zombie.var_3c394b1b || !isalive(e_zombie)) {
                    continue;
                }
                if (!zm_utility::is_magic_bullet_shield_enabled(e_zombie)) {
                    e_zombie thread function_74337491();
                }
            }
        }
    }
    level waittill(self.var_9bd3a2c6);
    self thread function_530d7ea0(0);
    e_player.var_34e10757 = e_player getammocount(self.w_uncharged_hand);
    e_player zm_weapons::weapon_take(self.w_uncharged_hand);
    e_player zm_weapons::weapon_give(self.w_charged_hand);
    e_player switchtoweaponimmediate(self.w_charged_hand);
    e_player thread function_9c9f9731();
    self thread function_88edd220(e_player, self.w_charged_hand);
    e_player thread function_7d2500d8();
    e_player disableoffhandweapons();
    e_player bgb_pack::function_ac9cb612();
    if (isdefined(self.var_f172b16e)) {
        e_player clientfield::set(self.var_f172b16e, 0);
    }
    wait 0.5;
    if (isdefined(e_player)) {
        switch (self.targetname) {
        case #"death":
            if (!(isdefined(e_player.var_76c97d24) && e_player.var_76c97d24)) {
                e_player.var_76c97d24 = 1;
                b_played = 0;
            }
            break;
        case #"earth":
            if (!(isdefined(e_player.var_2cecc840) && e_player.var_2cecc840)) {
                e_player.var_2cecc840 = 1;
                b_played = 0;
            }
            break;
        case #"air":
            if (!(isdefined(e_player.var_bd326f1e) && e_player.var_bd326f1e)) {
                e_player.var_bd326f1e = 1;
                b_played = 0;
            }
            break;
        case #"light":
            if (!(isdefined(e_player.var_596d8add) && e_player.var_596d8add)) {
                e_player.var_596d8add = 1;
                b_played = 0;
            }
            break;
        }
    }
    if (isdefined(b_played) && !b_played) {
        e_player zm_vo::function_a2bd5a0c(self.var_bcd22670, 0, 1, 9999, 1);
    }
    self thread function_f3a9ad8c(e_player);
    wait 1.5;
    e_player thread zm_equipment::show_hint_text(self.var_cffb5613, 6);
    if (isdefined(e_player)) {
        e_player thread zm_vo::vo_say(self.var_647f1375, 0, 1, 9999, 1, 1);
    }
    if (!level flag::get("round_reset")) {
        s_result = e_player waittilltimeout(20, #"hash_1b2c21ba7b18dbf9", #"hash_52d2f17ac6d67de2", #"hash_4969a839c4e666dc", #"start_beaming", #"death");
    }
    if (isdefined(s_result) && s_result._notify === "timeout") {
        e_player thread zm_vo::vo_say(self.var_78b18870, 0, 1, 9999, 1, 1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x15f096c5, Offset: 0x11440
// Size: 0x8c
function function_74337491() {
    self endon(#"death");
    [[ level.var_d7522ea ]]->waitinqueue(self);
    self zm_cleanup::function_23621259(0);
    self.allowdeath = 1;
    self.no_powerups = 1;
    self.deathpoints_already_given = 1;
    self.marked_for_death = 1;
    self kill();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x0
// Checksum 0x7e6a11f0, Offset: 0x114d8
// Size: 0xbc
function pause_zombies(b_pause = 0, var_53458a86 = 1) {
    if (b_pause) {
        level.disable_nuke_delay_spawning = 1;
        level flag::clear("spawn_zombies");
        level zm_utility::function_9ad5aeb1(1, 1, 0, var_53458a86, 0);
        return;
    }
    level.disable_nuke_delay_spawning = 0;
    level flag::set("spawn_zombies");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x5 linked
// Checksum 0xb7614f62, Offset: 0x115a0
// Size: 0x76
function private function_9c9f9731() {
    self endon(#"hash_4d89e2bb8e3d1eb3", #"disconnect");
    level flag::wait_till(#"pegasus_takeoff");
    self notify(#"hash_4d89e2bb8e3d1eb3", {#b_success:0});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x3bb5e56a, Offset: 0x11620
// Size: 0x19e
function function_88edd220(e_player, w_charged) {
    e_player endon(#"hash_4d89e2bb8e3d1eb3", #"disconnect");
    w_weapon = e_player getcurrentweapon();
    if (!(w_weapon === w_charged)) {
        var_2e07b8ff = e_player getweaponslistprimaries();
        foreach (w_weapon in var_2e07b8ff) {
            if (w_weapon === w_charged) {
                e_player switchtoweapon(w_weapon, 1);
            }
        }
    }
    e_player disableweaponcycling();
    e_player waittill(#"weapon_change_complete");
    n_max_ammo = e_player function_b7f1fd2c(w_charged);
    while (true) {
        if (e_player getweaponammoclip(w_charged) < n_max_ammo) {
            e_player givemaxammo(w_charged);
        }
        waitframe(1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x82a92b46, Offset: 0x117c8
// Size: 0x110
function function_8ad28be8(e_player) {
    e_player endon(#"disconnect", #"hash_4d89e2bb8e3d1eb3");
    e_player.var_ac8a5779 = 0;
    for (n_time = 0; n_time < 120 && !level flag::get("round_reset"); n_time += 0.5) {
        if (e_player.var_ac8a5779 > 60) {
            break;
        }
        wait 0.5;
    }
    if (level flag::get("round_reset")) {
        b_success = 0;
    } else {
        b_success = 1;
    }
    e_player notify(#"hash_4d89e2bb8e3d1eb3", {#b_success:b_success});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x920522a5, Offset: 0x118e0
// Size: 0x154
function function_cb939976(s_params) {
    if (!isdefined(s_params.weapon)) {
        return;
    }
    level notify(#"zombie_kill_breakout");
    if (isdefined(self.var_94c53b42) && self.var_94c53b42 && s_params.eattacker === self.var_70f0d23c) {
        s_params.eattacker.var_ac8a5779++;
    }
    if (isdefined(s_params.eattacker) && isplayer(s_params.eattacker) && !(isdefined(s_params.eattacker.var_49afaaae) && s_params.eattacker.var_49afaaae) && isinarray(array(level.w_hand_charon_uncharged, level.w_hand_gaia_uncharged, level.w_hand_ouranos_uncharged, level.w_hand_hemera_uncharged), s_params.weapon)) {
        s_params.eattacker thread function_2a513082(s_params.weapon);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x7f1fbc65, Offset: 0x11a40
// Size: 0x594
function function_aea7779d(e_player) {
    e_player endon(#"disconnect");
    s_result = e_player waittill(#"hash_4d89e2bb8e3d1eb3");
    if (isdefined(s_result.b_success) && s_result.b_success) {
        e_player disableweaponfire();
        if (isdefined(self.var_a04ebe57)) {
            s_portal_loc = struct::get(self.var_39ceadb3, "targetname");
            self.var_541ec669 = util::spawn_model("tag_origin", s_portal_loc.origin, s_portal_loc.angles);
            if (isdefined(self.var_a04ebe57)) {
                self.var_541ec669 clientfield::set(self.var_a04ebe57, 1);
            }
        } else if (isdefined(self.var_83a4152c)) {
            exploder::exploder(self.var_83a4152c);
        } else if (isdefined(self.mdl_return_portal)) {
            self.mdl_return_portal clientfield::set("" + #"hash_194ece8e9166daad", 1);
        }
        wait 4;
        self thread function_530d7ea0(1);
        if (isdefined(self.var_f172b16e)) {
            e_player clientfield::set(self.var_f172b16e, 1);
        }
        e_player zm_fasttravel::function_66d020b0(undefined, undefined, undefined, self.var_9bd3a2c6, self.var_ed424981, undefined, undefined, 1, 0);
        if (isdefined(self.var_f172b16e)) {
            e_player clientfield::set(self.var_f172b16e, 0);
        }
        self.var_a1327d58.var_884c4b3a = self.w_charged_hand;
        e_player givemaxammo(self.w_charged_hand);
        self thread function_530d7ea0(0);
        self.var_a1327d58 flag::clear("flag_ww_quests_portal_available");
        level flag::set(self.var_c2f7f323);
        self thread [[ self.var_52990614 ]](e_player);
        e_player thread zm_vo::vo_say(self.var_f72f5053, 0, 1, 9999, 1, 1);
        e_player thread zm_vo::function_a2bd5a0c(self.var_723cad8, 0.5, 1, 9999, 1);
    } else {
        e_player takeweapon(self.w_charged_hand);
        e_player zm_weapons::weapon_give(self.w_uncharged_hand);
        if (isdefined(e_player.var_34e10757)) {
            e_player setweaponammoclip(self.w_uncharged_hand, e_player.var_34e10757);
            e_player.var_34e10757 = undefined;
        }
        function_4aea06b0(1);
        self thread function_530d7ea0(1);
        if (isdefined(self.var_f172b16e)) {
            e_player clientfield::set(self.var_f172b16e, 1);
        }
        e_player zm_fasttravel::function_66d020b0(undefined, undefined, undefined, self.var_9bd3a2c6, self.var_ed424981, undefined, undefined, 1, 0);
        self thread function_4e2445e0();
        function_4aea06b0(0);
    }
    e_player bgb_pack::function_ac9cb612(0);
    e_player enableweaponfire();
    e_player enableweaponcycling();
    e_player enableoffhandweapons();
    e_player notify(#"hash_2e6703c5e5328b2a");
    e_player flag::clear(#"ww_combat_active");
    e_player.var_ac8a5779 = undefined;
    e_player.var_7881756e = undefined;
    level.zones[self.var_e6a4592d].is_enabled = 0;
    level thread sndonoverride_no_();
    self function_8d47bf8(e_player);
    level flag::set("spawn_zombies");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x7542d12e, Offset: 0x11fe0
// Size: 0x3ae
function function_f3a9ad8c(e_player) {
    level endon(#"end_game");
    e_player endon(#"disconnect", #"hash_4d89e2bb8e3d1eb3");
    a_ai_spawned = [];
    wait 5;
    level thread sndonoverride_no_();
    a_s_spawns = struct::get_array(self.var_e9198efc, "targetname");
    while (true) {
        a_ai_spawned = array::remove_dead(a_ai_spawned);
        a_ai_zombies = getaiteamarray(level.zombie_team);
        if (a_ai_spawned.size < level.var_2104a92c) {
            while (a_ai_zombies.size >= 32) {
                level function_4de98257(level.var_2104a92c - a_ai_spawned.size);
                a_ai_zombies = getaiteamarray(level.zombie_team);
                waitframe(1);
            }
            s_spawn = array::random(a_s_spawns);
            while (true) {
                ai_zombie = zombie_utility::spawn_zombie(array::random(level.zombie_spawners), undefined, s_spawn);
                if (isdefined(ai_zombie)) {
                    break;
                }
                waitframe(1);
            }
            if (!isdefined(a_ai_spawned)) {
                a_ai_spawned = [];
            } else if (!isarray(a_ai_spawned)) {
                a_ai_spawned = array(a_ai_spawned);
            }
            a_ai_spawned[a_ai_spawned.size] = ai_zombie;
            ai_zombie.start_inert = 1;
            if (!isdefined(ai_zombie)) {
                continue;
            }
            ai_zombie.var_126d7bef = 1;
            ai_zombie.ignore_round_spawn_failsafe = 1;
            ai_zombie.b_ignore_cleanup = 1;
            ai_zombie.ignore_enemy_count = 1;
            ai_zombie.exclude_cleanup_adding_to_total = 1;
            ai_zombie.var_12745932 = 1;
            ai_zombie.no_powerups = 1;
            ai_zombie.var_3c394b1b = 1;
            ai_zombie.var_94c53b42 = 1;
            ai_zombie.var_70f0d23c = e_player;
            ai_zombie.favoriteenemy = e_player;
            ai_zombie thread function_bba98e7f(e_player);
            ai_zombie thread function_4cd29565(self);
            if (isdefined(self.var_d39cfea7)) {
                ai_zombie clientfield::set("" + #"ww_combat_fx", self.var_d39cfea7);
            }
            ai_zombie thread zm_red_util::function_643916c9();
            waitframe(1);
            ai_zombie zombie_utility::set_zombie_run_cycle("run");
            wait 0.5;
        }
        waitframe(1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0xbc71cf69, Offset: 0x12398
// Size: 0x72
function private function_4aea06b0(b_disable = 1) {
    if (b_disable) {
        level.var_5cfc800b = &function_c5a5fbb1;
        level.var_d97d59d7 = &function_9e0db7fd;
        return;
    }
    level.var_5cfc800b = undefined;
    level.var_d97d59d7 = undefined;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x21b0a8ed, Offset: 0x12418
// Size: 0xe
function function_9e0db7fd(player) {
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xfbc80282, Offset: 0x12430
// Size: 0x6
function function_c5a5fbb1() {
    return undefined;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x4de0b265, Offset: 0x12440
// Size: 0x1f2
function sndonoverride_no_() {
    a_e_players = util::get_active_players();
    var_7c34208b = 0;
    foreach (e_player in a_e_players) {
        if (e_player flag::get(#"ww_combat_active") || e_player flag::get(#"hash_3247dad158e8b329")) {
            var_7c34208b++;
        }
    }
    var_b0fb7b0 = a_e_players.size - var_7c34208b;
    switch (var_7c34208b) {
    case 0:
        level.var_2104a92c = 0;
        break;
    case 1:
        level.var_2104a92c = 12;
        break;
    case 2:
        if (var_b0fb7b0 == 2) {
            level.var_2104a92c = 11;
        } else {
            level.var_2104a92c = 12;
        }
        break;
    case 3:
        if (var_b0fb7b0 == 1) {
            level.var_2104a92c = 8;
        } else {
            level.var_2104a92c = 10;
        }
        break;
    case 4:
        level.var_2104a92c = 8;
        break;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xaf257182, Offset: 0x12640
// Size: 0x2ae
function function_4de98257(var_7e847524) {
    a_ai_zombies = getaiteamarray(level.zombie_team);
    var_712b972d = arraycopy(a_ai_zombies);
    foreach (ai_zombie in a_ai_zombies) {
        if (!isdefined(ai_zombie)) {
            continue;
        }
        if (isdefined(ai_zombie.var_45cec07d) || isdefined(ai_zombie.var_3c394b1b) && ai_zombie.var_3c394b1b || ai_zombie.archetype != #"zombie" && ai_zombie.archetype != #"skeleton") {
            arrayremovevalue(var_712b972d, ai_zombie);
            continue;
        }
        b_can_see = 0;
        foreach (player in level.activeplayers) {
            if (!isdefined(player)) {
                continue;
            }
            if (player cansee(ai_zombie)) {
                b_can_see = 1;
            }
        }
        if (b_can_see) {
            arrayremovevalue(var_712b972d, ai_zombie);
        }
    }
    a_ai_zombies = var_712b972d;
    for (i = 0; i < var_7e847524; i++) {
        if (!isalive(a_ai_zombies[i])) {
            continue;
        }
        a_ai_zombies[i].allowdeath = 1;
        if (!zm_utility::is_magic_bullet_shield_enabled(a_ai_zombies[i])) {
            a_ai_zombies[i] thread function_74337491();
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x34d4cfc3, Offset: 0x128f8
// Size: 0x1e4
function function_bba98e7f(e_player) {
    self endon(#"death");
    if (e_player flag::get(#"ww_combat_active") || e_player flag::get(#"hash_3247dad158e8b329") || e_player flag::get(#"hash_9e34b0e30895cb2") || namespace_8216831d::is_active()) {
        e_player waittill(#"hash_4d89e2bb8e3d1eb3", #"hash_2026d806e71dfad5", #"hash_7fe6ca08732b8a1d", #"hash_11371635986ba290", #"disconnect");
    }
    [[ level.var_d7522ea ]]->waitinqueue(self);
    if (!zm_utility::is_magic_bullet_shield_enabled(self)) {
        if (isdefined(self) && (isdefined(self.var_94c53b42) && self.var_94c53b42 || isdefined(self.var_52531256) && self.var_52531256)) {
            self clientfield::increment("" + #"zombie_delete");
            self thread ai::stun();
            wait 1;
            self delete();
            return;
        }
        self kill();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x264bbe, Offset: 0x12ae8
// Size: 0x84
function function_4cd29565(s_quest) {
    while (isalive(self) && !(isdefined(self.var_47d982a1) && self.var_47d982a1)) {
        waitframe(1);
    }
    if (isdefined(self)) {
        self clientfield::set("" + #"ww_combat_fx", 0);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x23c3a3, Offset: 0x12b78
// Size: 0x17c
function function_530d7ea0(var_bcf66490, e_player) {
    if (isdefined(self.e_portal_fx)) {
        self.e_portal_fx clientfield::set(self.var_a04ebe57, var_bcf66490);
    } else if (isdefined(self.var_f94ca998)) {
        if (isdefined(var_bcf66490) && var_bcf66490) {
            exploder::exploder(self.var_f94ca998);
            playsoundatposition(#"hash_2545ab11d0e8966a", self.var_a1327d58.origin);
        } else if (self.var_a1327d58 flag::get("flag_ww_quests_portal_available")) {
            exploder::exploder_stop(self.var_f94ca998);
        }
    } else if (isdefined(self.mdl_portal)) {
        self thread function_2d281542(var_bcf66490);
    }
    if (isdefined(var_bcf66490) && var_bcf66490) {
        self.var_a1327d58 flag::set(#"hash_582906087b67b7c6");
        return;
    }
    self.var_a1327d58 flag::clear(#"hash_582906087b67b7c6");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xecc2a00, Offset: 0x12d00
// Size: 0x16c
function function_2d281542(var_bcf66490) {
    self.mdl_portal endon(#"death");
    if (isdefined(var_bcf66490) && var_bcf66490) {
        wait 1.5;
        level.var_643e7b15 clientfield::set("" + #"hash_5d3f9aab20abf568", 0);
        level thread scene::play("p8_fxanim_zm_red_gaia_portal_bundle", "grow");
        level waittill(#"hash_3d66510793795cd4");
        self.mdl_portal clientfield::set("" + #"hash_194ece8e9166daad", var_bcf66490);
        return;
    }
    if (self.var_a1327d58 flag::get(#"hash_582906087b67b7c6")) {
        level thread scene::play("p8_fxanim_zm_red_gaia_portal_bundle", "retreat");
        self.mdl_portal clientfield::set("" + #"hash_194ece8e9166daad", var_bcf66490);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xb8c970ad, Offset: 0x12e78
// Size: 0x568
function function_aeaedb3c() {
    level endon(#"end_game", #"hash_66460bd94d177b8a");
    self endon(#"disconnect");
    a_flags = [];
    a_flags = array(level.var_d225ea18[#"earth"].var_c2f7f323, level.var_d225ea18[#"death"].var_c2f7f323, level.var_d225ea18[#"light"].var_c2f7f323, level.var_d225ea18[#"air"].var_c2f7f323);
    level.var_b40a2558 = 0;
    level.var_50a078bd = 0;
    level.var_626adbe3 = 0;
    level.var_2eadf8bc = 0;
    level.var_a08be993 = 0;
    level flag::wait_till(#"pap_quest_completed");
    level flag::wait_till_any(a_flags);
    s_tall_brazier = struct::get("s_brazier_tall", "targetname");
    mdl_fx = util::spawn_model("tag_origin", s_tall_brazier.origin, s_tall_brazier.angles);
    mdl_fx clientfield::set("" + #"hash_1bf7e7b03fec9e45", 1);
    while (true) {
        s_result = self waittill(#"weapon_fired");
        /#
            if (isdefined(level.var_29e62693) && level.var_29e62693) {
                break;
            }
        #/
        if (s_result.weapon == level.var_ce3aa8a8 || s_result.weapon == level.var_96059a93) {
            if (isdefined(self.var_b4f85096) && self.var_b4f85096) {
                var_2ed6f142 = self getweaponmuzzlepoint();
                var_16d329c7 = self getweaponforwarddir();
                v_end_pos = var_2ed6f142 + vectorscale(var_16d329c7, 3000);
                a_beamtrace = bullettrace(var_2ed6f142, v_end_pos, 0, self);
                var_74238e2c = 50 * 50;
                var_1dc736c5 = pointonsegmentnearesttopoint(var_2ed6f142, v_end_pos, s_tall_brazier.origin);
                n_dist = distancesquared(s_tall_brazier.origin, var_1dc736c5);
                if (n_dist <= var_74238e2c && var_1dc736c5[2] > s_tall_brazier.origin[2]) {
                    break;
                }
            }
        }
    }
    mdl_fx clientfield::set("" + #"hash_1bf7e7b03fec9e45", 0);
    mdl_fx clientfield::set("" + #"hash_776a3c21050eaa0", 1);
    foreach (s_quest in level.var_d225ea18) {
        var_d02a32e2 = getent(s_quest.var_52584ae6, "targetname");
        var_d02a32e2 setvisibletoall();
        var_d02a32e2 clientfield::set("" + #"hash_5e8e9f6599d57c0a", 1);
        var_d02a32e2 clientfield::set("" + #"hash_4ff047c7bc266fd7", 0);
    }
    level thread function_ec538ada();
    level notify(#"hash_66460bd94d177b8a");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x645089ae, Offset: 0x133e8
// Size: 0x84
function function_ec538ada() {
    namespace_617a54f4::function_3f808d3d(#"ww_sc_earth");
    namespace_617a54f4::function_3f808d3d(#"ww_sc_death");
    namespace_617a54f4::function_3f808d3d(#"ww_sc_light");
    namespace_617a54f4::function_3f808d3d(#"ww_sc_air");
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0xba320d24, Offset: 0x13478
// Size: 0x284
function is_soul_capture(var_88206a50, e_zombie) {
    switch (var_88206a50.script_objective) {
    case #"e":
        str_archetype = #"catalyst_plasma";
        break;
    case #"d":
        str_archetype = #"catalyst_corrosive";
        break;
    case #"l":
        str_archetype = #"catalyst_electric";
        break;
    case #"a":
        str_archetype = #"catalyst_water";
        break;
    }
    var_c87cb9d0 = getent(var_88206a50.target, "targetname");
    if (isdefined(e_zombie.attacker) && isplayer(e_zombie.attacker) || isdefined(e_zombie.damageinflictor) && isplayer(e_zombie.damageinflictor)) {
        n_dist_sq = distance2dsquared(e_zombie.origin, var_88206a50.origin);
        if (isdefined(e_zombie) && e_zombie istouching(var_c87cb9d0) || isdefined(e_zombie.var_47d982a1) && e_zombie.var_47d982a1 && n_dist_sq <= 44100) {
            if (!isdefined(var_88206a50.var_96f1a1e1) && e_zombie.archetype == #"catalyst" && e_zombie.var_9fde8624 == str_archetype) {
                var_88206a50.var_96f1a1e1 = 1;
                return true;
            } else if (isdefined(var_88206a50.var_96f1a1e1) && var_88206a50.var_96f1a1e1) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x95032e30, Offset: 0x13708
// Size: 0x504
function soul_captured(var_f0e6c7a2, ent) {
    switch (var_f0e6c7a2.script_objective) {
    case #"e":
        level.var_50a078bd++;
        if (level.var_50a078bd >= 10) {
            level.var_b40a2558++;
            namespace_617a54f4::function_2a94055d(#"ww_sc_earth");
            s_quest = level.var_d225ea18[#"earth"];
            var_d02a32e2 = getent(s_quest.var_52584ae6, "targetname");
            var_d02a32e2 clientfield::set("" + #"hash_7f97409952dd051b", 0);
            var_d02a32e2 clientfield::set("" + #"hash_4ff047c7bc266fd7", 1);
            exploder::exploder("fxexp_wq_p_g");
        }
        break;
    case #"d":
        level.var_626adbe3++;
        if (level.var_626adbe3 >= 10) {
            level.var_b40a2558++;
            namespace_617a54f4::function_2a94055d(#"ww_sc_death");
            s_quest = level.var_d225ea18[#"death"];
            var_d02a32e2 = getent(s_quest.var_52584ae6, "targetname");
            var_d02a32e2 clientfield::set("" + #"hash_7f97409952dd051b", 0);
            var_d02a32e2 clientfield::set("" + #"hash_4ff047c7bc266fd7", 1);
            exploder::exploder("fxexp_wq_p_c");
        }
        break;
    case #"l":
        level.var_2eadf8bc++;
        if (level.var_2eadf8bc >= 10) {
            level.var_b40a2558++;
            namespace_617a54f4::function_2a94055d(#"ww_sc_light");
            s_quest = level.var_d225ea18[#"light"];
            var_d02a32e2 = getent(s_quest.var_52584ae6, "targetname");
            var_d02a32e2 clientfield::set("" + #"hash_7f97409952dd051b", 0);
            var_d02a32e2 clientfield::set("" + #"hash_4ff047c7bc266fd7", 1);
            exploder::exploder("fxexp_wq_p_h");
        }
        break;
    case #"a":
        level.var_a08be993++;
        if (level.var_a08be993 >= 10) {
            level.var_b40a2558++;
            namespace_617a54f4::function_2a94055d(#"ww_sc_air");
            s_quest = level.var_d225ea18[#"air"];
            var_d02a32e2 = getent(s_quest.var_52584ae6, "targetname");
            var_d02a32e2 clientfield::set("" + #"hash_7f97409952dd051b", 0);
            var_d02a32e2 clientfield::set("" + #"hash_4ff047c7bc266fd7", 1);
            exploder::exploder("fxexp_wq_p_o");
        }
        break;
    }
    if (level.var_b40a2558 >= 4) {
        thread function_34e4438c();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x81dbd766, Offset: 0x13c18
// Size: 0xd4
function function_34e4438c() {
    s_pap_interact = struct::get("s_pap_interact", "targetname");
    s_pap_interact.s_teleport = struct::get("s_pap_teleport");
    s_pap_interact flag::init(#"hash_485aa689b0560341");
    level.var_6e322832 = s_pap_interact zm_unitrigger::create(&function_59382270);
    zm_unitrigger::unitrigger_force_per_player_triggers(level.var_6e322832, 1);
    level.var_dd4b2858 = 1;
    s_pap_interact thread function_d62ba10e();
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xf61b7789, Offset: 0x13cf8
// Size: 0x608
function function_59382270(e_player) {
    w_current = e_player getcurrentweapon();
    if (w_current != level.var_d225ea18[#"earth"].w_charged_hand && w_current != level.var_d225ea18[#"death"].w_charged_hand && w_current != level.var_d225ea18[#"light"].w_charged_hand && w_current != level.var_d225ea18[#"air"].w_charged_hand) {
        return false;
    }
    var_5e879929 = getent("zm_pack_a_punch", "targetname");
    s_pap = self.stub.related_parent;
    if (zm_utility::can_use(e_player, 1) && var_5e879929 flag::get("pap_waiting_for_user") && isdefined(level.var_dd4b2858) && !s_pap flag::get(#"hash_485aa689b0560341")) {
        switch (level.var_dd4b2858) {
        case 1:
            s_quest = level.var_d225ea18[#"earth"];
            foreach (e_active_player in util::get_active_players()) {
                if (e_active_player zm_zonemgr::get_player_zone() === s_quest.var_e6a4592d) {
                    break;
                }
            }
            str_prompt = zm_utility::function_d6046228(#"hash_238c297b9cef431e", #"hash_7cc354eb0106a3ca");
            self sethintstringforplayer(e_player, str_prompt);
            return true;
        case 2:
            s_quest = level.var_d225ea18[#"air"];
            foreach (e_active_player in util::get_active_players()) {
                if (e_active_player zm_zonemgr::get_player_zone() === s_quest.var_e6a4592d) {
                    break;
                }
            }
            str_prompt = zm_utility::function_d6046228(#"hash_1de8074c3eafd78e", #"hash_4ea5e81cd8cf0a7a");
            self sethintstringforplayer(e_player, str_prompt);
            return true;
        case 3:
            s_quest = level.var_d225ea18[#"light"];
            foreach (e_active_player in util::get_active_players()) {
                if (e_active_player zm_zonemgr::get_player_zone() === s_quest.var_e6a4592d) {
                    break;
                }
            }
            str_prompt = zm_utility::function_d6046228(#"hash_9616ad35f75b736", #"hash_6a3a3c4c0c71e312");
            self sethintstringforplayer(e_player, str_prompt);
            return true;
        case 4:
            s_quest = level.var_d225ea18[#"death"];
            foreach (e_active_player in util::get_active_players()) {
                if (e_active_player zm_zonemgr::get_player_zone() === s_quest.var_e6a4592d) {
                    break;
                }
            }
            str_prompt = zm_utility::function_d6046228(#"hash_36d8e01e329aef74", #"hash_1c6da12a0fbd82d8");
            self sethintstringforplayer(e_player, str_prompt);
            return true;
        }
        return false;
    }
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x2b16c0db, Offset: 0x14308
// Size: 0x6a
function function_d271c27e() {
    if (!namespace_8216831d::is_active() && (self flag::get(#"ww_combat_active") || self flag::get(#"hash_3247dad158e8b329"))) {
        return false;
    }
    return true;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x8a5d5c15, Offset: 0x14380
// Size: 0x188
function function_f5f50d2b(e_player) {
    w_cur = e_player getcurrentweapon();
    if (w_cur.name === #"ww_hand_h" || w_cur.name === #"ww_hand_g" || w_cur.name === #"ww_hand_c" || w_cur.name === #"ww_hand_o") {
        if (isdefined(level.var_6e857dad) && level.var_6e857dad) {
            str_prompt = zm_utility::function_d6046228(#"hash_5e781f6f61833c14", #"hash_12a6428892830e38");
            self sethintstring(str_prompt, 0);
            e_player.var_486c9d59 = 0;
            return true;
        } else {
            self sethintstringforplayer(e_player, "");
            e_player.var_486c9d59 = 1;
            return true;
        }
    }
    e_player.var_486c9d59 = 0;
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x4d418cff, Offset: 0x14510
// Size: 0x278
function function_d62ba10e() {
    level endon(#"end_game");
    while (isdefined(level.var_dd4b2858)) {
        s_result = self waittill(#"trigger_activated");
        if (namespace_8216831d::is_active()) {
            waitframe(1);
            continue;
        }
        e_player = s_result.e_who;
        w_current = e_player getcurrentweapon();
        var_5e879929 = getent("zm_pack_a_punch", "targetname");
        if (isdefined(function_9b3e9487(w_current)) && function_9b3e9487(w_current) && var_5e879929 flag::get("pap_waiting_for_user") && !self flag::get(#"hash_485aa689b0560341")) {
            self flag::set(#"hash_485aa689b0560341");
            switch (level.var_dd4b2858) {
            case 1:
                s_quest = level.var_d225ea18[#"earth"];
                break;
            case 2:
                s_quest = level.var_d225ea18[#"air"];
                break;
            case 3:
                s_quest = level.var_d225ea18[#"light"];
                break;
            case 4:
                s_quest = level.var_d225ea18[#"death"];
                break;
            }
            s_quest thread function_f53f86f8(e_player, self);
            zm_zonemgr::enable_zone(s_quest.var_e6a4592d);
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0xcc85e866, Offset: 0x14790
// Size: 0x40c
function function_f53f86f8(e_player, s_pap_interact) {
    e_player endon(#"disconnect", #"hash_2026d806e71dfad5");
    self thread pack_portal_fx(s_pap_interact);
    wait 1;
    if (e_player laststand::player_is_in_laststand() || !isalive(e_player) || level flag::get("round_reset")) {
        return;
    }
    level.zones[self.var_e6a4592d].is_enabled = 1;
    e_player flag::set(#"hash_3247dad158e8b329");
    e_player bgb_pack::function_ac9cb612();
    e_player.var_7881756e = self.targetname;
    self thread function_b2a3182b(e_player);
    self thread function_f2081007(e_player, s_pap_interact);
    e_player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, self.var_deb1f081, self.var_5357def6, undefined, undefined, 1, 0);
    if (isdefined(self.var_f172b16e)) {
        e_player clientfield::set(self.var_f172b16e, 1);
    }
    a_e_players = util::get_active_players();
    var_8ab262fb = a_e_players.size;
    foreach (var_774e4b90 in a_e_players) {
        if (var_774e4b90 flag::get(#"ww_combat_active") || var_774e4b90 flag::get(#"hash_3247dad158e8b329")) {
            var_8ab262fb--;
        }
    }
    if (var_8ab262fb == 0) {
        level flag::clear("spawn_zombies");
        a_e_zombies = getaiteamarray(level.zombie_team);
        if (isdefined(a_e_zombies)) {
            foreach (e_zombie in a_e_zombies) {
                if (isdefined(e_zombie.var_3c394b1b) && e_zombie.var_3c394b1b || !isalive(e_zombie)) {
                    continue;
                }
                e_zombie.allowdeath = 1;
                if (!zm_utility::is_magic_bullet_shield_enabled(e_zombie)) {
                    e_zombie thread function_74337491();
                }
            }
        }
    }
    level waittill(self.var_deb1f081);
    if (isdefined(self.var_f172b16e)) {
        e_player clientfield::set(self.var_f172b16e, 0);
    }
    wait 5;
    self thread function_6df333f3(e_player);
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x190a4726, Offset: 0x14ba8
// Size: 0x21c
function pack_portal_fx(s_pap_interact) {
    if (isdefined(self.var_a04ebe57)) {
        var_fba145f6 = struct::get("s_pap_fx");
        self.var_a12d09a2 = util::spawn_model("tag_origin", var_fba145f6.origin, var_fba145f6.angles);
        self.var_a12d09a2 clientfield::set(self.var_a04ebe57, 1);
    } else if (isdefined(self.var_4d50be8e)) {
        exploder::exploder(self.var_4d50be8e);
        playsoundatposition(#"hash_2545ab11d0e8966a", s_pap_interact.origin);
    } else if (isdefined(self.var_285af63c)) {
        self.var_285af63c clientfield::set("" + #"hash_194ece8e9166daad", 1);
    }
    wait 2;
    if (isdefined(self.var_a12d09a2)) {
        if (isdefined(self.var_a04ebe57)) {
            self.var_a12d09a2 clientfield::set(self.var_a04ebe57, 0);
        }
        wait 2;
        self.var_a12d09a2 delete();
        return;
    }
    if (isdefined(self.var_4d50be8e)) {
        exploder::stop_exploder(self.var_4d50be8e);
        playsoundatposition(#"hash_15e7e9734cce421e", s_pap_interact.origin);
        return;
    }
    if (isdefined(self.var_285af63c)) {
        self.var_285af63c clientfield::set("" + #"hash_194ece8e9166daad", 0);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x16997963, Offset: 0x14dd0
// Size: 0x52c
function function_6df333f3(e_player) {
    level endon(#"end_game");
    e_player endon(#"disconnect", #"hash_2026d806e71dfad5");
    a_ai_spawned = [];
    callback::on_ai_killed(&function_e7a6f333);
    level thread sndonoverride_no_();
    a_s_spawns = struct::get_array(self.var_e9198efc, "targetname");
    while (true) {
        a_ai_spawned = array::remove_dead(a_ai_spawned);
        a_ai_zombies = getaiteamarray(level.zombie_team);
        if (a_ai_spawned.size < self.var_ad816fb3) {
            while (a_ai_zombies.size >= 32) {
                level function_4de98257(self.var_ad816fb3 - a_ai_spawned.size);
                a_ai_zombies = getaiteamarray(level.zombie_team);
                waitframe(1);
            }
            s_spawn = array::random(a_s_spawns);
            while (true) {
                if (self.targetname === #"earth") {
                    ai_zombie = function_eeed4f2f(s_spawn);
                    n_wait_time = 0.5;
                } else if (self.targetname === #"air") {
                    s_spawn = array::random(a_s_spawns);
                    ai_zombie = zombie_skeleton_util::function_1ea880bd(1, s_spawn, undefined, undefined, 1);
                    n_wait_time = 0.5;
                } else if (self.targetname === #"light") {
                    if (self.var_6486fc00 - e_player.var_8331cf3d < self.var_ad816fb3) {
                        return;
                    }
                    s_spawn = array::random(struct::get_array("s_ww_quest_light_spawn_gegenees"));
                    ai_zombie = zombie_gegenees_util::spawn_single(1, s_spawn);
                    n_wait_time = 2;
                } else if (self.targetname === #"death") {
                    if (self.var_6486fc00 - e_player.var_8331cf3d < self.var_ad816fb3) {
                        return;
                    }
                    s_spawn = struct::get("s_ww_d_spawn_bl");
                    ai_zombie = function_7a15e228(s_spawn);
                    n_wait_time = 2;
                }
                if (isdefined(ai_zombie)) {
                    break;
                }
                waitframe(1);
            }
            if (!isdefined(ai_zombie)) {
                continue;
            }
            if (!isdefined(a_ai_spawned)) {
                a_ai_spawned = [];
            } else if (!isarray(a_ai_spawned)) {
                a_ai_spawned = array(a_ai_spawned);
            }
            a_ai_spawned[a_ai_spawned.size] = ai_zombie;
            ai_zombie.start_inert = 1;
            ai_zombie.favoriteenemy = e_player;
            ai_zombie.var_70f0d23c = e_player;
            ai_zombie.var_126d7bef = 1;
            ai_zombie.ignore_round_spawn_failsafe = 1;
            ai_zombie.b_ignore_cleanup = 1;
            ai_zombie.ignore_enemy_count = 1;
            ai_zombie.exclude_cleanup_adding_to_total = 1;
            ai_zombie.var_12745932 = 1;
            ai_zombie.no_powerups = 1;
            ai_zombie.var_3c394b1b = 1;
            ai_zombie.var_52531256 = 1;
            ai_zombie thread function_bba98e7f(e_player);
            waitframe(1);
            if (isalive(ai_zombie)) {
                ai_zombie zombie_utility::set_zombie_run_cycle("run");
                ai_zombie forceteleport(s_spawn.origin, s_spawn.angles);
                self thread function_a6300fa2(ai_zombie);
            }
            wait n_wait_time;
        }
        waitframe(1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xcfb5ca1, Offset: 0x15308
// Size: 0x8c
function function_a6300fa2(ai_zombie) {
    ai_zombie endon(#"death");
    while (!(isdefined(ai_zombie zm_utility::in_playable_area()) && ai_zombie zm_utility::in_playable_area())) {
        waitframe(1);
    }
    if (!ai_zombie zm_zonemgr::entity_in_zone(self.var_e6a4592d)) {
        ai_zombie kill();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xf0512d5f, Offset: 0x153a0
// Size: 0x150
function function_eeed4f2f(s_spawn_loc) {
    if (!isdefined(s_spawn_loc)) {
        return undefined;
    }
    var_546cd1ac = randomint(level.a_sp_catalyst.size - 1);
    ai = zombie_utility::spawn_zombie(level.a_sp_catalyst[var_546cd1ac], undefined, level.a_sp_catalyst[var_546cd1ac]);
    if (isdefined(ai)) {
        ai.script_string = s_spawn_loc.script_string;
        ai.b_ignore_cleanup = 1;
        ai.exclude_cleanup_adding_to_total = 1;
        ai.var_12745932 = 1;
        wait 0.5;
        if (!isdefined(ai)) {
            return undefined;
        }
        ai zm_transform::function_bbaec2fd();
        ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
        if (isdefined(level.catalyst_on_spawned)) {
            ai thread [[ level.catalyst_on_spawned ]](s_spawn_loc);
        }
    }
    return ai;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xa32ffd9b, Offset: 0x154f8
// Size: 0xac
function function_3f05435f() {
    if (isalive(self)) {
        self notify(#"risen");
        level notify(#"transformation_complete", {#new_ai:array(self)});
        if (self.catalyst_type == 1) {
            level thread zm_ai_catalyst::function_4329a51b(self);
        }
        self show();
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xefa82204, Offset: 0x155b0
// Size: 0xc0
function function_7a15e228(s_spawn_loc) {
    a_sp_blightfather = getspawnerarray("zombie_blight_father_spawner", "script_noteworthy");
    ai = zombie_utility::spawn_zombie(a_sp_blightfather[0], "scorpion");
    if (isdefined(ai)) {
        ai.script_string = s_spawn_loc.script_string;
        ai zm_transform::function_bbaec2fd();
        ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
    }
    return ai;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xaa35c1e5, Offset: 0x15678
// Size: 0x180
function function_b2a3182b(e_player) {
    e_player endon(#"disconnect", #"hash_2026d806e71dfad5");
    e_player.var_8331cf3d = 0;
    n_start_time = gettime();
    n_time_passed = 0;
    var_1715a29f = undefined;
    while (n_time_passed < 300) {
        if (e_player.var_8331cf3d >= self.var_6486fc00) {
            break;
        }
        if (!(isdefined(function_cee9fb17()) && function_cee9fb17())) {
            if (!isdefined(var_1715a29f)) {
                var_1715a29f = gettime();
            } else {
                var_d3a4b6e7 = float(gettime() - var_1715a29f) / 1000;
                if (var_d3a4b6e7 > 10) {
                    break;
                }
            }
        } else {
            var_1715a29f = undefined;
        }
        wait 0.25;
        n_time_passed = float(gettime() - n_start_time) / 1000;
    }
    e_player notify(#"hash_2026d806e71dfad5", {#b_success:1});
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x5 linked
// Checksum 0x6637307d, Offset: 0x15800
// Size: 0xac
function private function_cee9fb17() {
    a_ai_zombies = getaiteamarray(level.zombie_team);
    foreach (ai_zombie in a_ai_zombies) {
        if (isdefined(ai_zombie.var_52531256) && ai_zombie.var_52531256) {
            return true;
        }
    }
    return false;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0x1672f2d9, Offset: 0x158b8
// Size: 0x78
function function_e7a6f333(s_params) {
    if (!isdefined(s_params.weapon)) {
        return;
    }
    if (!isplayer(s_params.eattacker)) {
        return;
    }
    if (isdefined(self.var_52531256) && self.var_52531256 && isdefined(self.var_70f0d23c)) {
        self.var_70f0d23c.var_8331cf3d++;
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 2, eflags: 0x1 linked
// Checksum 0x8bdb83cb, Offset: 0x15938
// Size: 0x674
function function_f2081007(e_player, s_pap_interact) {
    e_player endon(#"disconnect");
    s_result = e_player waittill(#"hash_2026d806e71dfad5");
    if (isdefined(s_result.b_success) && s_result.b_success) {
        if (isdefined(self.var_39ceadb3)) {
            var_fba145f6 = struct::get("s_pap_fx");
            s_portal_loc = struct::get(self.var_39ceadb3, "targetname");
            self.var_541ec669 = util::spawn_model("tag_origin", s_portal_loc.origin, s_portal_loc.angles);
            if (isdefined(self.var_a04ebe57)) {
                self.var_541ec669 clientfield::set(self.var_a04ebe57, 1);
            }
            self.var_a12d09a2 = util::spawn_model("tag_origin", var_fba145f6.origin, var_fba145f6.angles);
            if (isdefined(self.var_a04ebe57)) {
                self.var_a12d09a2 clientfield::set(self.var_a04ebe57, 1);
            }
        } else if (isdefined(self.var_83a4152c)) {
            exploder::exploder(self.var_4d50be8e);
            exploder::exploder(self.var_83a4152c);
            playsoundatposition(#"hash_2545ab11d0e8966a", s_pap_interact.origin);
        } else if (isdefined(self.mdl_return_portal)) {
            self.mdl_return_portal clientfield::set("" + #"hash_194ece8e9166daad", 1);
            self.var_285af63c clientfield::set("" + #"hash_194ece8e9166daad", 1);
        }
        wait 3;
        if (isdefined(self.var_f172b16e)) {
            e_player clientfield::set(self.var_f172b16e, 1);
        }
        e_player zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, s_pap_interact.s_teleport, undefined, undefined, 1, 0);
        if (isdefined(self.var_f172b16e)) {
            e_player clientfield::set(self.var_f172b16e, 0);
        }
        level.var_dd4b2858++;
        if (level.var_dd4b2858 >= 5) {
            level flag::set(#"hash_39100dea955077f2");
            level.var_6e857dad = 1;
            level.var_dd4b2858 = undefined;
            level thread function_99b6184();
            zm_unitrigger::unregister_unitrigger(level.var_6e322832);
        }
    } else {
        if (isdefined(self.var_f172b16e)) {
            e_player clientfield::set(self.var_f172b16e, 1);
        }
        e_player zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, s_pap_interact.s_teleport, undefined, undefined, 1, 0);
    }
    s_pap_interact flag::clear(#"hash_485aa689b0560341");
    if (isdefined(self.var_f172b16e)) {
        e_player clientfield::set(self.var_f172b16e, 0);
    }
    e_player flag::clear(#"hash_3247dad158e8b329");
    e_player.var_8331cf3d = undefined;
    e_player.var_7881756e = undefined;
    e_player bgb_pack::function_ac9cb612(0);
    level.zones[self.var_e6a4592d].is_enabled = 0;
    level thread sndonoverride_no_();
    level flag::set("spawn_zombies");
    callback::remove_on_ai_killed(&function_e7a6f333);
    wait 1;
    if (isdefined(self.var_541ec669)) {
        if (isdefined(self.var_a04ebe57)) {
            self.var_541ec669 clientfield::set(self.var_a04ebe57, 0);
            self.var_a12d09a2 clientfield::set(self.var_a04ebe57, 0);
        }
        wait 2;
        self.var_541ec669 delete();
        self.var_a12d09a2 delete();
        return;
    }
    if (isdefined(self.var_83a4152c)) {
        exploder::stop_exploder(self.var_83a4152c);
        exploder::stop_exploder(self.var_4d50be8e);
        playsoundatposition(#"hash_15e7e9734cce421e", s_pap_interact.origin);
        return;
    }
    if (isdefined(self.mdl_return_portal)) {
        self.mdl_return_portal clientfield::set("" + #"hash_194ece8e9166daad", 0);
        self.var_285af63c clientfield::set("" + #"hash_194ece8e9166daad", 0);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x2a3d15f, Offset: 0x15fb8
// Size: 0xf2
function function_99b6184() {
    while (true) {
        s_result = level waittill(#"pap_taken");
        var_f75cde38 = s_result.var_5e879929.item;
        foreach (s_quest in level.var_d225ea18) {
            if (var_f75cde38 === s_quest.var_e5b61ee5) {
                s_quest.var_a1327d58.var_884c4b3a = s_quest.var_e5b61ee5;
                break;
            }
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0xc9716185, Offset: 0x160b8
// Size: 0xd8
function function_d0b13de1() {
    self endon(#"disconnect");
    while (true) {
        s_result = self waittill(#"packing_weapon");
        w_cur = s_result.w_current;
        if (isdefined(function_9b3e9487(w_cur)) && function_9b3e9487(w_cur)) {
            self.var_7e19c3db = 1;
            wait 1;
            self.var_7e19c3db = 0;
            level thread function_43a6c665(w_cur);
            self thread function_63eabd37();
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x5 linked
// Checksum 0xdd6477bb, Offset: 0x16198
// Size: 0x1d0
function private function_63eabd37() {
    level endon(#"pap_timeout");
    s_result = self waittill(#"pap_taken");
    var_eaddb452 = s_result.var_5e879929.unitrigger_stub.upgrade_weapon;
    w_previous = self.currentweapon;
    var_2e07b8ff = self getweaponslistprimaries();
    foreach (w_weapon in var_2e07b8ff) {
        if (isdefined(function_9b3e9487(w_weapon)) && function_9b3e9487(w_weapon) && w_weapon !== var_eaddb452) {
            self zm_weapons::weapon_take(w_weapon);
            if (isdefined(w_previous) && w_previous !== level.weaponnone && !(isdefined(function_9b3e9487(w_previous)) && function_9b3e9487(w_previous))) {
                self zm_weapons::weapon_give(w_previous, 0, 0);
                self switchtoweaponimmediate(var_eaddb452);
            }
        }
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x5 linked
// Checksum 0x125bee5, Offset: 0x16370
// Size: 0x7c
function private function_43a6c665(w_cur) {
    level endon(#"pap_taken");
    s_result = level waittill(#"pap_timeout");
    if (isdefined(s_result.e_player)) {
        s_result.e_player thread function_841236e4(w_cur, 0);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x9374dc1f, Offset: 0x163f8
// Size: 0xec
function function_7d2500d8() {
    self endon(#"death", #"hash_2e6703c5e5328b2a");
    if (!isdefined(self.boss_sm_warlord_support)) {
        self.boss_sm_warlord_support = 0;
    }
    while (true) {
        if (self fragbuttonpressed()) {
            n_time = gettime() / 1000;
            dt = n_time - self.boss_sm_warlord_support;
            if (dt >= 7) {
                self thread zm_equipment::show_hint_text(#"hash_1c8a5493dc5fcd7a", 3, 1.75, 120);
                self.boss_sm_warlord_support = n_time;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 0, eflags: 0x1 linked
// Checksum 0x3df81e8a, Offset: 0x164f0
// Size: 0x1b2
function function_a3e12f96() {
    if (!isdefined(level.var_142dc1b8)) {
        level.var_142dc1b8 = array();
    }
    level.var_142dc1b8[#"ww_hand_h_uncharged"] = 5;
    level.var_142dc1b8[#"ww_hand_h"] = 5;
    level.var_142dc1b8[#"ww_hand_h_upgraded"] = 5;
    level.var_142dc1b8[#"ww_hand_c_uncharged"] = 5;
    level.var_142dc1b8[#"ww_hand_c"] = 5;
    level.var_142dc1b8[#"ww_hand_c_upgraded"] = 5;
    level.var_142dc1b8[#"ww_hand_o_uncharged"] = 5;
    level.var_142dc1b8[#"ww_hand_o"] = 5;
    level.var_142dc1b8[#"ww_hand_o_upgraded"] = 5;
    level.var_142dc1b8[#"ww_hand_g_uncharged"] = 5;
    level.var_142dc1b8[#"ww_hand_g"] = 5;
    level.var_142dc1b8[#"ww_hand_g_upgraded"] = 5;
}

// Namespace zm_red_ww_quests/zm_red_ww_quests
// Params 1, eflags: 0x1 linked
// Checksum 0xb3a21efe, Offset: 0x166b0
// Size: 0xc4
function function_8d47bf8(e_player) {
    if (isdefined(self.var_541ec669)) {
        self.var_541ec669 util::delayed_delete(2);
    } else if (isdefined(self.var_83a4152c)) {
        exploder::stop_exploder(self.var_83a4152c);
    } else if (isdefined(self.mdl_return_portal)) {
        self.mdl_return_portal clientfield::set("" + #"hash_194ece8e9166daad", 0);
    }
    if (isdefined(self.var_f172b16e)) {
        e_player clientfield::set(self.var_f172b16e, 0);
    }
}

/#

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 1, eflags: 0x0
    // Checksum 0xcbb4f772, Offset: 0x16780
    // Size: 0xec
    function function_51a8e408(str_hand) {
        level function_e3a8b066(str_hand);
        waitframe(1);
        thread zm_devgui::zombie_devgui_goto_round(10);
        s_quest = level.var_d225ea18[str_hand];
        var_a1327d58 = s_quest.var_a1327d58;
        a_players = util::get_active_players();
        var_a1327d58 notify(#"trigger_activated", {#e_who:a_players[0]});
        wait 1;
        level thread function_9dc3d269();
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 1, eflags: 0x0
    // Checksum 0xca1151e8, Offset: 0x16878
    // Size: 0x20c
    function function_e3a8b066(str_hand) {
        s_quest = level.var_d225ea18[str_hand];
        var_a1327d58 = s_quest.var_a1327d58;
        a_players = util::get_active_players();
        if (!isdefined(level.var_65569374)) {
            level.var_65569374 = 0;
        }
        thread zm_devgui::zombie_devgui_goto_round(5);
        if (isdefined(level.var_f9a57be7[level.var_65569374].t_damage)) {
            level.var_f9a57be7[level.var_65569374].t_damage notify(#"damage", {#attacker:a_players[0], #mod:"<dev string:x38>"});
        } else {
            level.var_f9a57be7[level.var_65569374] dodamage(10000, level.var_f9a57be7[level.var_65569374].origin, a_players[0]);
        }
        wait 2.5;
        level.var_f9a57be7[level.var_65569374] notify(#"trigger_activated", {#e_who:a_players[0]});
        level.var_65569374++;
        s_teleport = s_quest.var_ed424981;
        if (isdefined(s_teleport)) {
            a_players[0] setorigin(s_teleport.origin);
            a_players[0] setplayerangles(s_teleport.angles);
        }
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xe430b0cb, Offset: 0x16a90
    // Size: 0x64
    function function_9dc3d269() {
        a_players = util::get_active_players();
        a_players[0] notify(#"hash_7fe6ca08732b8a1d", {#b_success:1, #b_skipped:1});
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x72075415, Offset: 0x16b00
    // Size: 0x54
    function function_34c06bf9() {
        a_players = util::get_active_players();
        a_players[0] notify(#"hash_4d89e2bb8e3d1eb3", {#b_success:1});
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xd312d486, Offset: 0x16b60
    // Size: 0x14c
    function function_f241b684() {
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"death"];
        level function_51a8e408(#"death");
        wait 1;
        exploder::exploder("<dev string:x44>");
        s_quest.var_a1327d58 notify(#"trigger_activated", {#e_who:a_players[0]});
        s_teleport = struct::get("<dev string:x58>");
        a_players[0] setorigin(s_teleport.origin);
        a_players[0] setplayerangles(s_teleport.angles);
        wait 1;
        s_quest flag::set("<dev string:x74>");
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xdb00b4ec, Offset: 0x16cb8
    // Size: 0x17c
    function function_6bf10cf9() {
        a_players = util::get_active_players();
        level function_f241b684();
        wait 1;
        var_83f3addf = struct::get("<dev string:x88>", "<dev string:x9b>");
        var_83f3addf notify(#"trigger_activated", {#e_who:a_players[0]});
        wait 1;
        s_quest = level.var_d225ea18[#"death"];
        if (isdefined(s_quest.var_18fd25ab[0])) {
            s_quest.var_18fd25ab[0] notify(#"trigger_activated", {#e_who:a_players[0]});
        }
        s_teleport = s_quest.var_ed424981;
        if (isdefined(s_teleport)) {
            a_players[0] setorigin(s_teleport.origin);
            a_players[0] setplayerangles(s_teleport.angles);
        }
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xff4d5392, Offset: 0x16e40
    // Size: 0xe6
    function function_11a0f6f8() {
        level function_6bf10cf9();
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"death"];
        if (isdefined(s_quest.var_18fd25ab)) {
            s_quest.var_18fd25ab[1] notify(#"trigger_activated", {#e_who:a_players[0]});
            s_quest.var_18fd25ab[2] notify(#"trigger_activated", {#e_who:a_players[0]});
        }
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xad1460b4, Offset: 0x16f30
    // Size: 0x11c
    function function_c5d7d69b() {
        level function_51a8e408(#"earth");
        wait 1;
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"earth"];
        s_quest.var_a1327d58 notify(#"trigger_activated", {#e_who:a_players[0]});
        s_tree = struct::get("<dev string:xa8>", "<dev string:xb9>");
        a_players[0] setorigin(s_tree.origin);
        a_players[0] setplayerangles(s_tree.angles);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x72bdce4a, Offset: 0x17058
    // Size: 0x40c
    function function_681ce100() {
        level function_51a8e408(#"earth");
        wait 1;
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"earth"];
        s_quest.var_a1327d58 notify(#"trigger_activated", {#e_who:a_players[0]});
        wait 1;
        var_1d89b97b = struct::get_array("<dev string:xcd>", "<dev string:x9b>");
        foreach (var_52666e80 in var_1d89b97b) {
            mdl_tree = getent(var_52666e80.script_noteworthy, "<dev string:x9b>");
            a_mdl_chaos = getentarray(mdl_tree.target, "<dev string:x9b>");
            a_players[0] setorigin(var_52666e80.origin);
            a_players[0] setplayerangles(var_52666e80.angles);
            foreach (mdl_chaos in a_mdl_chaos) {
                switch (mdl_chaos.model) {
                case #"hash_17ff8b184015c0d0":
                    v_tag_pos = mdl_chaos gettagorigin("<dev string:xdf>");
                    break;
                case #"hash_17ff8e184015c5e9":
                    v_tag_pos = mdl_chaos gettagorigin("<dev string:xef>");
                    break;
                case #"hash_17ff8d184015c436":
                    v_tag_pos = mdl_chaos gettagorigin("<dev string:xff>");
                    break;
                }
                level notify(#"ww_gaia_hit", {#player:a_players[0], #e_entity:mdl_chaos, #v_position:v_tag_pos});
                wait 0.25;
            }
        }
        wait 4.5;
        var_1d89b97b = struct::get_array("<dev string:xcd>", "<dev string:x9b>");
        var_1d89b97b[0] notify(#"trigger_activated", {#e_who:a_players[0]});
        s_teleport = s_quest.var_ed424981;
        if (isdefined(s_teleport)) {
            a_players[0] setorigin(s_teleport.origin);
            a_players[0] setplayerangles(s_teleport.angles);
        }
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x3e1901c2, Offset: 0x17470
    // Size: 0x9c
    function function_9fe8bfeb() {
        level function_681ce100();
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"earth"];
        s_quest.var_8baa00ae = 2;
        a_players[0] notify(#"seedling_dropped", {#str_result:"<dev string:x10f>"});
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x50960619, Offset: 0x17518
    // Size: 0x114
    function function_dcfed198() {
        s_quest = level.var_d225ea18[#"light"];
        a_players = util::get_active_players();
        s_destination = struct::get("<dev string:x119>", "<dev string:x9b>");
        level function_51a8e408(#"light");
        wait 1;
        s_quest.var_a1327d58 notify(#"trigger_activated", {#e_who:a_players[0]});
        wait 1;
        a_players[0] setorigin(s_destination.origin);
        a_players[0] setplayerangles(s_destination.angles);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x8e8e82b3, Offset: 0x17638
    // Size: 0x174
    function function_d6e30032() {
        a_players = util::get_active_players();
        a_mdl_mirrors = [];
        var_d445485f = struct::get_array("<dev string:x13a>", "<dev string:x9b>");
        foreach (var_542837e6 in var_d445485f) {
            mdl_mirror = getent(var_542837e6.target, "<dev string:x9b>");
            if (!isdefined(a_mdl_mirrors)) {
                a_mdl_mirrors = [];
            } else if (!isarray(a_mdl_mirrors)) {
                a_mdl_mirrors = array(a_mdl_mirrors);
            }
            a_mdl_mirrors[a_mdl_mirrors.size] = mdl_mirror;
        }
        mdl_mirror = arraygetclosest(a_players[0].origin, a_mdl_mirrors);
        mdl_mirror thread function_dbe1d7b8();
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x57f99dce, Offset: 0x177b8
    // Size: 0x110
    function function_ec9bf2a() {
        level function_dcfed198();
        var_d445485f = struct::get_array("<dev string:x13a>", "<dev string:x9b>");
        foreach (var_542837e6 in var_d445485f) {
            mdl_mirror = getent(var_542837e6.target, "<dev string:x9b>");
            mdl_mirror.n_index = 0;
            mdl_mirror function_2a290bb7(var_542837e6, mdl_mirror.origin, level.players[0]);
        }
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x185758a5, Offset: 0x178d0
    // Size: 0x20c
    function function_30ecec0c() {
        level function_ec9bf2a();
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"light"];
        s_teleport = s_quest.var_ed424981;
        if (isdefined(s_teleport)) {
            a_players[0] setorigin(s_teleport.origin);
            a_players[0] setplayerangles(s_teleport.angles);
        }
        a_players[0] flag::set("<dev string:x156>");
        var_6041471b = struct::get_array("<dev string:x13a>", "<dev string:x9b>");
        var_6041471b[0] flag::clear("<dev string:x16e>");
        var_6041471b[0].var_e5c25ff9 clientfield::set("<dev string:x189>" + #"hash_5faf31a2c4d4f4c6", 0);
        var_6041471b[0] notify(#"hash_3a05c7c89bb72260");
        a_players[0] clientfield::set("<dev string:x189>" + #"hash_e683dccc6a8e152", 1);
        s_quest thread function_9aa74e4(var_6041471b[0], a_players[0], "<dev string:x189>" + #"hash_e683dccc6a8e152");
        s_quest thread light_energy_carry(a_players[0]);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x5d4cff73, Offset: 0x17ae8
    // Size: 0x284
    function function_a5efeb8d() {
        level function_ec9bf2a();
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"light"];
        s_teleport = s_quest.var_ed424981;
        if (isdefined(s_teleport)) {
            a_players[0] setorigin(s_teleport.origin);
            a_players[0] setplayerangles(s_teleport.angles);
        }
        s_quest function_9c79eeed(a_players[0]);
        s_quest function_9c79eeed(a_players[0]);
        a_players[0] flag::set("<dev string:x156>");
        var_6041471b = struct::get_array("<dev string:x13a>", "<dev string:x9b>");
        var_6041471b[0] flag::clear("<dev string:x16e>");
        if (isdefined(var_6041471b[0].var_e5c25ff9)) {
            var_6041471b[0].var_e5c25ff9 clientfield::set("<dev string:x189>" + #"hash_5faf31a2c4d4f4c6", 0);
        }
        var_6041471b[0] notify(#"hash_3a05c7c89bb72260");
        a_players[0] thread light_countdown(23);
        a_players[0] clientfield::set("<dev string:x189>" + #"hash_e683dccc6a8e152", 1);
        s_quest thread function_9aa74e4(var_6041471b[0], a_players[0], "<dev string:x189>" + #"hash_e683dccc6a8e152");
        s_quest thread light_energy_carry(a_players[0]);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xea3b3de7, Offset: 0x17d78
    // Size: 0x1a4
    function function_4594e669() {
        level function_51a8e408(#"air");
        wait 1;
        a_players = util::get_active_players();
        s_quest = level.var_d225ea18[#"air"];
        s_quest.var_a1327d58 notify(#"trigger_activated", {#e_who:a_players[0]});
        wait 1;
        s_teleport = struct::get("<dev string:x18c>");
        if (isdefined(s_teleport)) {
            a_players[0] setorigin(s_teleport.origin);
            a_players[0] setplayerangles(s_teleport.angles);
        }
        s_spawn = struct::get("<dev string:x1ab>");
        ai_zombie = zombie_utility::spawn_zombie(array::random(level.zombie_spawners), undefined, s_spawn);
        ai_zombie val::set(#"ww_quests_ignoreall", "<dev string:x1ca>", 1);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x8cc2d6d, Offset: 0x17f28
    // Size: 0x4c
    function function_b8b8845() {
        s_quest = level.var_d225ea18[#"air"];
        s_quest.var_267d1e6 = 3;
        level thread function_4594e669();
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xe85bafcc, Offset: 0x17f80
    // Size: 0xb4
    function function_318c3039() {
        s_quest = level.var_d225ea18[#"air"];
        level function_51a8e408(#"air");
        wait 0.5;
        while (s_quest.var_a1327d58.holding_weapon === 1) {
            waitframe(1);
        }
        wait 3;
        exploder::exploder_stop("<dev string:x1d6>");
        s_quest thread function_4e2445e0();
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x70a73722, Offset: 0x18040
    // Size: 0x15c
    function function_37deb555() {
        a_mdl_arrows = array(getent("<dev string:x1ea>", "<dev string:x9b>"), getent("<dev string:x209>", "<dev string:x9b>"), getent("<dev string:x226>", "<dev string:x9b>"));
        mdl_arrow = arraygetclosest(level.players[0].origin, a_mdl_arrows);
        switch (mdl_arrow.targetname) {
        case #"mdl_ww_ouranos_arrow_serpent":
            var_511277e5 = "<dev string:x244>";
            break;
        case #"mdl_ww_ouranos_arrow_center":
            var_511277e5 = "<dev string:x272>";
            break;
        case #"mdl_ww_ouranos_arrow_cliff":
            var_511277e5 = "<dev string:x2a0>";
            break;
        }
        mdl_arrow thread scene::play(var_511277e5, "<dev string:x2ce>", mdl_arrow);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xa34448d7, Offset: 0x181a8
    // Size: 0x7a
    function function_d8765f3d() {
        level zm_red::function_71a6c3ea();
        level notify(level.var_d225ea18[#"earth"].var_c2f7f323);
        waitframe(1);
        level.var_29e62693 = 1;
        waitframe(1);
        level.players[0] notify(#"weapon_fired");
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x1a57dc7e, Offset: 0x18230
    // Size: 0x1b4
    function function_233156e3() {
        level function_d8765f3d();
        wait 1;
        level.var_50a078bd = 11;
        level.var_2eadf8bc = 11;
        level.var_626adbe3 = 11;
        level.var_a08be993 = 11;
        var_ee56c5b = array(struct::get("<dev string:x2d6>", "<dev string:xb9>"), struct::get("<dev string:x2e0>", "<dev string:xb9>"), struct::get("<dev string:x2ea>", "<dev string:xb9>"), struct::get("<dev string:x2f4>", "<dev string:xb9>"));
        s_capture_point = arraygetclosest(level.players[0].origin, var_ee56c5b);
        s_capture_point.var_96f1a1e1 = 1;
        ai_zombie = zombie_utility::spawn_zombie(array::random(level.zombie_spawners), undefined, s_capture_point);
        wait 0.25;
        ai_zombie dodamage(10000, ai_zombie.origin, level.players[0]);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xd8f871ed, Offset: 0x183f0
    // Size: 0x384
    function function_c4614158() {
        level function_d8765f3d();
        wait 1;
        level.var_50a078bd = 11;
        level.var_2eadf8bc = 11;
        level.var_626adbe3 = 11;
        level.var_a08be993 = 11;
        var_8e174718 = array("<dev string:x2d6>", "<dev string:x2e0>", "<dev string:x2ea>", "<dev string:x2f4>");
        foreach (var_6adc8de1 in var_8e174718) {
            if (var_6adc8de1 == "<dev string:x2d6>") {
                s_quest = level.var_d225ea18[#"earth"];
            }
            if (var_6adc8de1 == "<dev string:x2e0>") {
                s_quest = level.var_d225ea18[#"death"];
            }
            if (var_6adc8de1 == "<dev string:x2ea>") {
                s_quest = level.var_d225ea18[#"light"];
            }
            if (var_6adc8de1 == "<dev string:x2f4>") {
                s_quest = level.var_d225ea18[#"air"];
            }
            s_capture_point = struct::get(var_6adc8de1, "<dev string:xb9>");
            s_capture_point.var_96f1a1e1 = 1;
            ai_zombie = zombie_utility::spawn_zombie(array::random(level.zombie_spawners), undefined, s_capture_point);
            wait 0.25;
            ai_zombie forceteleport(s_quest.var_ed424981.origin);
            wait 0.25;
            ai_zombie dodamage(10000, ai_zombie.origin, level.players[0]);
        }
        foreach (s_quest in level.var_d225ea18) {
            zm_zonemgr::enable_zone(s_quest.var_e6a4592d);
        }
        s_pap_interact = struct::get("<dev string:x2fe>", "<dev string:x9b>");
        level.players[0] setorigin(s_pap_interact.s_teleport.origin);
        level.players[0] setplayerangles(s_pap_interact.s_teleport.angles);
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0x6e285b0a, Offset: 0x18780
    // Size: 0x3a
    function function_d963daa9() {
        level.players[0] notify(#"hash_2026d806e71dfad5", {#b_success:1});
    }

    // Namespace zm_red_ww_quests/zm_red_ww_quests
    // Params 0, eflags: 0x0
    // Checksum 0xa07fda79, Offset: 0x187c8
    // Size: 0x144
    function function_405e6a83() {
        s_pap_interact = struct::get("<dev string:x2fe>", "<dev string:x9b>");
        level function_c4614158();
        level.var_dd4b2858 = 4;
        s_quest = level.var_d225ea18[#"earth"];
        s_quest thread function_f53f86f8(level.players[0], s_pap_interact);
        wait 7;
        level.players[0] notify(#"hash_2026d806e71dfad5", {#b_success:1});
        level.players[0] setorigin(s_pap_interact.s_teleport.origin);
        level.players[0] setplayerangles(s_pap_interact.s_teleport.angles);
    }

#/
