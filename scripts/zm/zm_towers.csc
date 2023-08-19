// Atian COD Tools GSC decompiler test
#include script_3f48538738283547;
#include scripts/zm/ai/zm_ai_elephant.csc;
#include scripts/zm/weapons/zm_weap_riotshield.csc;
#include scripts/zm/powerup/zm_powerup_free_perk.csc;
#include scripts/zm/zm_towers_challenges.csc;
#include scripts/zm_common/zm_ui_inventory.csc;
#include scripts/zm/zm_towers_gamemodes.csc;
#include scripts/zm_common/zm_characters.csc;
#include scripts/zm_common/zm_weapons.csc;
#include scripts/zm_common/zm_wallbuy.csc;
#include scripts/zm_common/zm_utility.csc;
#include scripts/zm_common/zm_pack_a_punch.csc;
#include scripts/zm_common/zm_audio_sq.csc;
#include scripts/zm_common/zm.csc;
#include scripts/zm_common/load.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/flag_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/math_shared.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/exploder_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/beam_shared.csc;
#include scripts/core_common/audio_shared.csc;
#include scripts/core_common/array_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_towers;

// Namespace zm_towers/zm_towers
// Params 0, eflags: 0x2
// Checksum 0x72b6cae1, Offset: 0xd68
// Size: 0x22
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
}

// Namespace zm_towers/level_init
// Params 1, eflags: 0x40
// Checksum 0xe386cafa, Offset: 0xd98
// Size: 0x29c2
function event<level_init> main(eventstruct) {
    clientfield::register("clientuimodel", "player_lives", 1, 2, "int", undefined, 0, 0);
    clientfield::register("scriptmover", "entry_gate_dust", 1, 1, "int", &function_ce727843, 0, 0);
    clientfield::register("scriptmover", "zombie_head_pickup_glow", 1, 1, "int", &function_b675c8b2, 0, 0);
    clientfield::register("scriptmover", "blue_glow", 1, 1, "int", &toggle_blue_glow, 0, 0);
    clientfield::register("scriptmover", "" + #"chaos_ball", 1, 1, "int", &function_f3866f6b, 0, 0);
    clientfield::register("scriptmover", "sentinel_artifact_fx_mist", 1, 1, "int", &function_46125384, 0, 0);
    clientfield::register("allplayers", "force_pap_models", 1, 1, "int", &function_5eaabec, 0, 1);
    clientfield::register("world", "special_round_smoke", 1, 1, "int", &function_94675baf, 0, 0);
    clientfield::register("allplayers", "special_round_camera", 1, 2, "int", &special_round_camera_fx, 0, 1);
    clientfield::register("world", "brazier_fire_blue", 1, 2, "int", &function_57f3914e, 0, 0);
    clientfield::register("world", "brazier_fire_green", 1, 2, "int", &function_6e6d4bfc, 0, 0);
    clientfield::register("world", "brazier_fire_purple", 1, 2, "int", &function_66050c9e, 0, 0);
    clientfield::register("world", "brazier_fire_red", 1, 2, "int", &function_1c231f3f, 0, 0);
    clientfield::register("scriptmover", "head_fire_blue", 1, 1, "int", &function_bdc63758, 0, 0);
    clientfield::register("scriptmover", "head_fire_green", 1, 1, "int", &function_c41817fc, 0, 0);
    clientfield::register("scriptmover", "head_fire_purple", 1, 1, "int", &function_27a7a3be, 0, 0);
    clientfield::register("scriptmover", "head_fire_red", 1, 1, "int", &function_d056a230, 0, 0);
    clientfield::register("scriptmover", "energy_soul", 1, 1, "int", &function_87e8980d, 0, 0);
    clientfield::register("scriptmover", "energy_soul_target", 1, 1, "int", &function_b29b7566, 0, 0);
    clientfield::register("scriptmover", "banner_soul_burst", 1, 1, "counter", &banner_soul_burst, 0, 0);
    clientfield::register("toplayer", "" + #"hash_2bbcb9e09bd7bb26", 1, 1, "counter", &function_ee4f01d8, 0, 0);
    clientfield::register("allplayers", "force_challenge_model", 1, 1, "int", &function_a1d393ad, 0, 1);
    clientfield::register("actor", "acid_trap_death_fx", 1, 1, "int", &acid_trap_death_fx, 0, 0);
    clientfield::register("scriptmover", "trap_switch_green", 1, 1, "int", &function_29bd0c51, 0, 0);
    clientfield::register("scriptmover", "trap_switch_red", 1, 1, "int", &function_75347b12, 0, 0);
    clientfield::register("scriptmover", "trap_switch_smoke", 1, 1, "int", &function_25ebc4f7, 0, 0);
    clientfield::register("toplayer", "acid_trap_postfx", 1, 1, "int", &acid_trap_postfx, 0, 0);
    clientfield::register("toplayer", "" + #"pickup_dung", 1, 1, "int", &pickup_dung, 0, 0);
    clientfield::register("world", "crowd_react", 1, 2, "int", &crowd_react, 0, 1);
    clientfield::register("world", "crowd_react_boss", 1, 1, "int", &crowd_react_boss, 0, 1);
    clientfield::register("world", "" + #"crowd_react_wave", 1, 1, "int", &crowd_react_wave, 0, 1);
    clientfield::register("toplayer", "snd_crowd_react", 1, 4, "int", &snd_crowd_react, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_42cc4bf5e47478c5", 1, 1, "int", &function_a8195148, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_3b746cf6eec416b2", 1, 1, "int", &function_24673586, 0, 0);
    clientfield::register("world", "" + #"hash_584e8f7433246444", 1, 1, "int", &function_e9a85af, 0, 0);
    clientfield::register("world", "" + #"hash_418c1c843450232b", 1, 1, "int", &function_90076b73, 0, 0);
    clientfield::register("world", "" + #"hash_4d547bf36c6cb2d8", 1, 1, "int", &function_e26b1e6b, 0, 0);
    clientfield::register("world", "" + #"hash_38ba3ad0902aa355", 1, 1, "int", &function_25a6ede2, 0, 0);
    clientfield::register("world", "" + #"hash_24d7233bb17e6558", 1, 1, "int", &function_a2800857, 0, 0);
    clientfield::register("scriptmover", "" + #"ww_quest_melting", 1, 1, "counter", &ww_quest_melting, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2c6f04d08665dbda", 1, 1, "int", &function_76dd176c, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2a332df32456c86f", 1, 1, "int", &function_5dc8b5fa, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_48ad84f9cf6a33f0", 1, 1, "counter", &function_91305947, 0, 0);
    clientfield::register("zbarrier", "" + #"hash_3974bea828fbf7f7", 1, 1, "int", &function_ba86af94, 0, 0);
    clientfield::register("zbarrier", "" + #"hash_3a51c9895d4afcf7", 1, 1, "int", &function_36469123, 0, 0);
    clientfield::register("zbarrier", "" + #"hash_1add6939914df65a", 1, 1, "int", &function_a7b41dea, 0, 0);
    clientfield::register("zbarrier", "" + #"hash_5dc6f97e5850e1d1", 1, 1, "int", &function_1941a5ca, 0, 0);
    clientfield::register("toplayer", "" + #"ww_quest_earthquake", 1, 1, "counter", &ww_quest_earthquake, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_333e3741e6552db3", 1, 1, "int", &function_e63747a9, 0, 0);
    clientfield::register("world", "" + #"hash_3c58464f16d8a1be", 1, 1, "int", &function_44a2fe02, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_6ff3eb2dd0078a51", 1, 1, "counter", &function_8565be53, 0, 0);
    clientfield::register("world", "" + #"hash_445060dbbf244b04", 1, 1, "int", &function_35bf68a, 0, 0);
    clientfield::register("world", "" + #"hash_a2fb645044ed12e", 1, 1, "int", &function_605da720, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_3f79f6da0222ebc2", 1, 1, "int", &function_2312778c, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_c382c02584ba249", 1, 1, "int", &function_240a3342, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_273efcc293063e5e", 1, 1, "int", &function_9eb43a48, 0, 0);
    clientfield::register("scriptmover", "" + #"fertilizer_smell", 1, 1, "int", &fertilizer_smell, 0, 0);
    clientfield::register("world", "" + #"hash_5a3e1454226ef7a4", 1, 1, "int", &function_8fc72b02, 0, 0);
    clientfield::register("world", "" + #"hash_73088ea3053b96f1", 1, 1, "int", &function_70e21be0, 0, 0);
    clientfield::register("actor", "" + #"hash_233e31d0c2b47b1b", 1, 1, "int", &function_9cb4a774, 0, 0);
    clientfield::register("actor", "" + #"hash_12dfb8249f8212d2", 1, 1, "int", &function_eba8a203, 0, 0);
    clientfield::register("actor", "" + #"hash_17e3041649954b9f", 1, 1, "int", &function_1467cfe7, 0, 0);
    clientfield::register("scriptmover", "ra_eyes_beam_fire", 1, 1, "int", &ra_eyes_beam_fire, 0, 0);
    clientfield::register("scriptmover", "ra_rooftop_eyes_beam_fire", 1, 1, "int", &ra_rooftop_eyes_beam_fire, 0, 0);
    clientfield::register("world", "" + #"hash_57c08e5f4792690c", 1, 1, "int", &function_339af7bd, 0, 0);
    clientfield::register("world", "" + #"hash_440f23773f551a48", 1, 1, "int", &function_e131f9b8, 0, 0);
    clientfield::register("world", "" + #"hash_4e5e2b411c997804", 1, 1, "int", &function_98d53b6b, 0, 0);
    clientfield::register("toplayer", "" + #"maelstrom_initiate", 1, 1, "counter", &maelstrom_initiate, 0, 0);
    clientfield::register("world", "" + #"maelstrom_initiate_fx", 1, 1, "int", &maelstrom_initiate_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"maelstrom_conduct", 1, 1, "int", &maelstrom_conduct, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_1814d4cc1867739c", 1, 1, "int", &function_e21e7dbe, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_314d3a2e542805c0", 1, 1, "int", &function_4a9243dc, 0, 0);
    clientfield::register("scriptmover", "" + #"maelstrom_discharge", 1, 1, "counter", &maelstrom_discharge, 0, 0);
    clientfield::register("actor", "" + #"maelstrom_death", 1, 1, "counter", &maelstrom_death, 0, 0);
    clientfield::register("toplayer", "" + #"maelstrom_storm", 1, 1, "int", &maelstrom_storm, 0, 0);
    clientfield::register("toplayer", "" + #"hash_182c03ff2a21c07c", 1, 1, "counter", &function_2d6ec02, 0, 0);
    clientfield::register("toplayer", "" + #"maelstrom_ending", 1, 1, "int", &maelstrom_ending, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_63e758aa5387132a", 1, 1, "counter", &function_7dbeb0c5, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_23ba00d2f804acc2", 1, 1, "int", &function_fa2e6690, 0, 0);
    clientfield::register("world", "" + #"hash_16b9e3d69cb7a017", 1, 1, "int", &function_fc502d48, 0, 1);
    clientfield::register("world", "" + #"hash_1f09a5290d31eb37", 1, 1, "counter", &function_5b893414, 0, 0);
    clientfield::register("world", "" + #"hash_2383fd01b106ced8", 1, 1, "int", &function_4c2b87ed, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2407f687f7d24a83", 1, 1, "int", &function_5cdc8b28, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_5afda864f8b64f5c", 1, 1, "int", &function_5c9f28ec, 0, 0);
    clientfield::register("world", "" + #"hash_39e6b14b9e5b0f3d", 1, 1, "int", &function_99220e91, 0, 0);
    level._effect[#"headshot"] = #"zombie/fx_bul_flesh_head_fatal_zmb";
    level._effect[#"headshot_nochunks"] = #"zombie/fx_bul_flesh_head_nochunks_zmb";
    level._effect[#"bloodspurt"] = #"zombie/fx_bul_flesh_neck_spurt_zmb";
    level._effect[#"animscript_gib_fx"] = #"zombie/fx_blood_torso_explo_zmb";
    level._effect[#"animscript_gibtrail_fx"] = #"blood/fx_blood_gib_limb_trail";
    level._effect[#"hash_73172b799c18404e"] = #"hash_7d94f7b4389cad84";
    level._effect[#"entry_gate_dust"] = #"hash_43b2eaf6037de947";
    level._effect[#"special_round_smoke"] = #"hash_7f90f442be248933";
    level._effect[#"hash_2a49b738100ad198"] = #"hash_573f4333a69a2e97";
    level._effect[#"special_round_camera_start"] = #"hash_5e456969dcb6d449";
    level._effect[#"special_round_camera_persist"] = #"hash_30a51086d1de2e56";
    level._effect[#"trap_switch_green"] = #"hash_24ce0898c3432283";
    level._effect[#"trap_switch_red"] = #"hash_1d6280fe28ef047";
    level._effect[#"trap_switch_smoke"] = #"hash_22722c91ebbd77f9";
    level._effect[#"hash_42cc4bf5e47478c5"] = #"hash_387c78244f5f45e5";
    level._effect[#"hash_3b746cf6eec416b2"] = #"hash_396a3bd29f816da1";
    level._effect[#"hash_36535f89ec2488d7"] = #"hash_5efc6976bcba1957";
    level._effect[#"hash_584e8f7433246444"] = #"hash_682f944518a1171c";
    level._effect[#"ww_quest_scorpio"] = #"hash_2b4f2f30d115f02a";
    level._effect[#"ww_quest_melting"] = #"hash_2947a74c2209d11";
    level._effect[#"hash_48ad84f9cf6a33f0"] = #"hash_232d6ea0cf34968b";
    level._effect[#"hash_3974bea828fbf7f7"] = #"hash_6fd3d30a984a4585";
    level._effect[#"hash_3a51c9895d4afcf7"] = #"hash_393af938c98cf4d0";
    level._effect[#"hash_1add6939914df65a"] = #"hash_24d0d45080034da";
    level._effect[#"hash_5dc6f97e5850e1d1"] = #"hash_14d7c3ad478543a";
    level._effect[#"hash_56c34d8ec9a098c2"] = #"hash_266633b36a852fd5";
    level._effect[#"brazier_fire_blue"] = #"hash_6d3f50f00db41676";
    level._effect[#"brazier_fire_green"] = #"hash_1839d27856f4aed9";
    level._effect[#"brazier_fire_red"] = #"hash_4d95d8d2f3b07ca5";
    level._effect[#"brazier_fire_purple"] = #"hash_231c5e173b446f0c";
    level._effect[#"hash_169c8ab62603115c"] = #"hash_2a4dc3aacf70bb96";
    level._effect[#"head_fire_blue"] = #"hash_5089724c9ec9d4f7";
    level._effect[#"head_fire_green"] = #"hash_29adecede9b00a2";
    level._effect[#"head_fire_purple"] = #"hash_19cfaef54c89e021";
    level._effect[#"head_fire_red"] = #"hash_46234b48f3c3d22";
    level._effect[#"energy_soul"] = #"hash_24eb30a2d07ae5a9";
    level._effect[#"energy_soul_target"] = #"hash_6f5f4eb9267613e3";
    level._effect[#"banner_soul_burst"] = #"hash_38a043ca24c928f5";
    level._effect[#"acid_death"] = #"hash_78c487ac760f594c";
    level._effect[#"hash_233e31d0c2b47b1b"] = #"hash_4d11f0ab46451330";
    level._effect[#"chaos_ball"] = #"hash_2fa6e69cbbe0de1";
    level._effect[#"hash_4eddc2f547bc55f6"] = #"hash_246ba1502485a840";
    level._effect[#"hash_7bd75ae600e0a590"] = "maps/zm_towers/fx8_crowd_reward_flower_exp";
    level._effect[#"hash_4c4f96aa02c32a2a"] = "maps/zm_towers/fx8_crowd_reward_flower_trail";
    level._effect[#"hash_6ff3eb2dd0078a51"] = #"hash_71198dfc5b0fd85";
    level._effect[#"hash_3f79f6da0222ebc2"] = #"hash_2f1958cd9b473bec";
    level._effect[#"fertilizer_smell"] = #"hash_48344f893bb65bf2";
    level._effect[#"hash_5a3e1454226ef7a4"] = #"hash_62ef4090559ca8c8";
    level._effect[#"hash_1f7bfd354d2472e3"] = #"hash_153286962fe0c0c5";
    level._effect[#"hash_1f7511354d1e7631"] = #"hash_153992962fe6f3d7";
    level._effect[#"maelstrom_initiate"] = #"hash_223c6a623adb13fb";
    level._effect[#"hash_504ad50f841882fe"] = #"hash_26b672f2c1c8a570";
    level._effect[#"hash_2cf77bcee904664d"] = #"hash_50ce930e4dd4bc12";
    level._effect[#"hash_2cf75dcee9043353"] = #"hash_50c7bb0e4dcee15c";
    level._effect[#"hash_4a9ad8ec06102c34"] = #"hash_4d91ce766ebeda81";
    level._effect[#"hash_4a9abeec06100006"] = #"hash_4db3c6766edbb34f";
    level._effect[#"hash_59efd6cf7ca11195"] = #"hash_35d31a887a79e68e";
    level._effect[#"hash_59efc8cf7ca0f9cb"] = #"hash_361dea887ab98078";
    level._effect[#"hash_416145285a01faa3"] = #"hash_28ad85abec3ad058";
    level._effect[#"hash_416143285a01f73d"] = #"hash_28479dabebe445ee";
    level._effect[#"hash_df4673638509cab"] = #"hash_2543453edaf343d4";
    level._effect[#"hash_df475363850b475"] = #"hash_259b253edb3d834a";
    level._effect[#"maelstrom_conduct"] = #"zm_ai/fx8_elec_bolt";
    level._effect[#"hash_1814d4cc1867739c"] = #"hash_13f09e4051884309";
    level._effect[#"hash_314d3a2e542805c0"] = #"zombie/fx_powerup_on_red_zmb";
    level._effect[#"maelstrom_death"] = #"hash_6a5c671e82cb5243";
    level._effect[#"maelstrom_camera_fx"] = #"hash_33ca6401bbf3798c";
    level._effect[#"hash_63e758aa5387132a"] = #"hash_7df55a8e3d87037a";
    level._effect[#"hash_23ba00d2f804acc2"] = #"hash_56b121a7e7eee303";
    level._effect[#"hash_5afda864f8b64f5c"] = #"hash_5f48f8d916a0f612";
    level thread zm_audio_sq::init();
    level.var_d0ab70a2 = #"hash_42dcec7533a676b0";
    level.var_210ce105 = zm_towers_crowd_meter::register("zm_towers_crowd_meter");
    load::main();
    util::waitforclient(0);
    if (!zm_utility::is_ee_enabled()) {
        a_decals = findvolumedecalindexarray("nardec");
        foreach (i in a_decals) {
            hidevolumedecal(i);
        }
    }
    level thread startzmbspawnersoundloops();
    level thread setup_personality_character_exerts();
    level.fx_special_round_camera = [];
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xa6a114e8, Offset: 0x3768
// Size: 0x54
function function_5b893414(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level thread function_26c4a8d5();
}

// Namespace zm_towers/zm_towers
// Params 0, eflags: 0x1 linked
// Checksum 0x73de6f41, Offset: 0x37c8
// Size: 0xd4
function function_26c4a8d5() {
    self notify("273a0aad6f4ce331");
    self endon("273a0aad6f4ce331");
    level waittill(#"hash_2a33c8604d0de6ea");
    a_players = getlocalplayers();
    array::thread_all(a_players, &postfx::playpostfxbundle, #"pstfx_slowed");
    level waittill(#"hash_785fd96b8f6dfcc0");
    a_players = getlocalplayers();
    array::thread_all(a_players, &postfx::exitpostfxbundle, #"pstfx_slowed");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x23b776f8, Offset: 0x38a8
// Size: 0x7c
function function_ce727843(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        function_239993de(localclientnum, level._effect[#"entry_gate_dust"], self, "p8_zm_gla_tunnel_gate");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x4a0be8b8, Offset: 0x3930
// Size: 0xbe
function pickup_dung(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_2ee8588651571cb");
    } else {
        self postfx::stoppostfxbundle(#"hash_2ee8588651571cb");
        if (isdefined(self.var_eb695935)) {
            stopfx(localclientnum, self.var_eb695935);
            self.var_eb695935 = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xb8b0fef2, Offset: 0x39f8
// Size: 0x9c
function function_8565be53(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playfx(localclientnum, level._effect[#"hash_6ff3eb2dd0078a51"], self.origin);
    playsound(localclientnum, #"hash_2e08e4ff8f949d48", self.origin);
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x372dbe7a, Offset: 0x3aa0
// Size: 0x8c
function function_35bf68a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(#"hash_77659f61538a4beb");
    } else {
        stopforcestreamingxmodel(#"hash_77659f61538a4beb");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xfac860a7, Offset: 0x3b38
// Size: 0x8c
function function_605da720(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(#"hash_4286272708c5e5c0");
    } else {
        stopforcestreamingxmodel(#"hash_4286272708c5e5c0");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x90078555, Offset: 0x3bd0
// Size: 0x15e
function function_2312778c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.var_cf369100)) {
        self.var_cf369100 = util::spawn_model(localclientnum, "tag_origin", self.origin);
        self.var_cf369100 linkto(self);
    }
    if (newval) {
        self.var_e76fb9a5 = util::playfxontag(localclientnum, level._effect[#"hash_3f79f6da0222ebc2"], self.var_cf369100, "tag_origin");
    } else {
        if (isdefined(self.var_e76fb9a5)) {
            stopfx(localclientnum, self.var_e76fb9a5);
            self.var_e76fb9a5 = undefined;
        }
        if (isdefined(self.var_cf369100)) {
            self.var_cf369100 unlink();
            self.var_cf369100 delete();
            self.var_cf369100 = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x70175afe, Offset: 0x3d38
// Size: 0x8c
function function_240a3342(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"hash_3e2336a0454b9574");
    } else {
        self stoprenderoverridebundle(#"hash_3e2336a0454b9574");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xf8d0cd14, Offset: 0x3dd0
// Size: 0x8c
function function_9eb43a48(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"hash_616b1855bf6ea5f2");
    } else {
        self stoprenderoverridebundle(#"hash_616b1855bf6ea5f2");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x52bd6ab4, Offset: 0x3e68
// Size: 0x15e
function fertilizer_smell(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_2bcd3d7c = playfx(localclientnum, level._effect[#"fertilizer_smell"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
        if (!isdefined(self.var_e29d710c)) {
            self.var_e29d710c = self playloopsound(#"zmb_funtime_fert_smell_lp");
        }
    } else {
        if (isdefined(self.var_2bcd3d7c)) {
            stopfx(localclientnum, self.var_2bcd3d7c);
            self.var_2bcd3d7c = undefined;
        }
        if (isdefined(self.var_e29d710c)) {
            self stoploopsound(self.var_e29d710c);
            self.var_e29d710c = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x3a07f43e, Offset: 0x3fd0
// Size: 0x17c
function function_8fc72b02(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_fx = struct::get(#"hash_44451a49b3653789");
    if (newval) {
        s_fx.var_c0a2fa6f = playfx(localclientnum, level._effect[#"hash_5a3e1454226ef7a4"], s_fx.origin + vectorscale((0, 0, 1), 4), anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
        audio::playloopat("zmb_funtime_fert_smell_lp", s_fx.origin);
    } else {
        if (isdefined(s_fx.var_c0a2fa6f)) {
            stopfx(localclientnum, s_fx.var_c0a2fa6f);
            s_fx.var_c0a2fa6f = undefined;
        }
        audio::stoploopat("zmb_funtime_fert_smell_lp", s_fx.origin);
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xee6e26c, Offset: 0x4158
// Size: 0x1ec
function function_70e21be0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!level flag::exists(#"hash_3f632a7ca8c645e9")) {
        level flag::init(#"hash_3f632a7ca8c645e9");
    }
    if (newval) {
        if (level flag::get(#"hash_3f632a7ca8c645e9")) {
            return;
        }
        level flag::set(#"hash_3f632a7ca8c645e9");
        callback::on_spawned(&function_345ea423);
        a_e_players = getplayers(localclientnum);
        a_e_players = array::remove_dead(a_e_players);
        array::thread_all(a_e_players, &function_345ea423, localclientnum);
    } else {
        if (!level flag::get(#"hash_3f632a7ca8c645e9")) {
            return;
        }
        level flag::clear(#"hash_3f632a7ca8c645e9");
        callback::remove_on_spawned(&function_345ea423);
        array::notify_all(getplayers(localclientnum), #"hash_5f06618b8c668b18");
    }
}

// Namespace zm_towers/zm_towers
// Params 1, eflags: 0x1 linked
// Checksum 0x615680d9, Offset: 0x4350
// Size: 0x146
function function_345ea423(localclientnum) {
    self notify("4e849ddafe66746f");
    self endon("4e849ddafe66746f");
    self endon(#"death", #"hash_5f06618b8c668b18");
    n_random_wait = randomfloatrange(1, 3);
    wait(n_random_wait);
    while (1) {
        e_client = function_5c10bd79(localclientnum);
        if (self === e_client && function_d17ae3cc(localclientnum)) {
            playfxoncamera(localclientnum, level._effect[#"hash_1f7bfd354d2472e3"], (0, 0, 0), (1, 0, 0));
        } else {
            util::playfxontag(localclientnum, level._effect[#"hash_1f7511354d1e7631"], self, "j_head");
        }
        wait(3);
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xd58c04bb, Offset: 0x44a0
// Size: 0x276
function ra_eyes_beam_fire(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        var_d9ad5cc8 = struct::get("s_puzzle_beam_end", "targetname");
        self.var_96ce3194 = util::spawn_model(localclientnum, "tag_origin", var_d9ad5cc8.origin, var_d9ad5cc8.angles);
        level beam::launch(self, "tag_origin", self.var_96ce3194, "tag_origin", "beam8_zm_scepter_ray_lvl3");
        self playsound(localclientnum, #"hash_473e265e57e397c8");
        soundlineemitter(#"hash_4bc05f42a04dcfd8", self.origin, self.var_96ce3194.origin);
        self.var_96ce3194.sfx_id = self.var_96ce3194 playloopsound(#"hash_c0bb4bb6f79f737");
    } else if (isdefined(self) && isdefined(self.var_96ce3194)) {
        soundstoplineemitter(#"hash_4bc05f42a04dcfd8", self.origin, self.var_96ce3194.origin);
        self.var_96ce3194 stoploopsound(self.var_96ce3194.sfx_id);
        self playsound(localclientnum, #"hash_488e51364172acd9");
        level beam::kill(self, "tag_origin", self.var_96ce3194, "tag_origin", "beam8_zm_scepter_ray_lvl3");
        self.var_96ce3194 delete();
        self.var_96ce3194 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x942bba7f, Offset: 0x4720
// Size: 0x276
function ra_rooftop_eyes_beam_fire(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        var_d9ad5cc8 = struct::get("s_puzzle_complete_beam_end", "targetname");
        self.var_96ce3194 = util::spawn_model(localclientnum, "tag_origin", var_d9ad5cc8.origin, var_d9ad5cc8.angles);
        level beam::launch(self, "tag_origin", self.var_96ce3194, "tag_origin", "beam8_zm_scepter_ray_lvl3");
        self playsound(localclientnum, #"hash_4ad6201a8477162e");
        soundlineemitter(#"hash_1befd714ba572b72", self.origin, self.var_96ce3194.origin);
        self.var_96ce3194.sfx_id = self.var_96ce3194 playloopsound(#"hash_625ff5d45245151d");
    } else if (isdefined(self) && isdefined(self.var_96ce3194)) {
        soundstoplineemitter(#"hash_1befd714ba572b72", self.origin, self.var_96ce3194.origin);
        self.var_96ce3194 stoploopsound(self.var_96ce3194.sfx_id);
        self playsound(localclientnum, #"hash_1eeb0d38cf56cc1b");
        level beam::kill(self, "tag_origin", self.var_96ce3194, "tag_origin", "beam8_zm_scepter_ray_lvl3");
        self.var_96ce3194 delete();
        self.var_96ce3194 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x3068f971, Offset: 0x49a0
// Size: 0x7c
function function_339af7bd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel("p8_zm_gla_target_bull_flat");
    } else {
        stopforcestreamingxmodel("p8_zm_gla_target_bull_flat");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x645cca51, Offset: 0x4a28
// Size: 0x7c
function function_e131f9b8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel("p8_zm_gla_obelisk_med_02_glyph");
    } else {
        stopforcestreamingxmodel("p8_zm_gla_obelisk_med_02_glyph");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x15d59f9c, Offset: 0x4ab0
// Size: 0x156
function function_b675c8b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_4e35f286 = util::playfxontag(localclientnum, level._effect[#"powerup_on_solo"], self, "tag_eye");
        if (!isdefined(self.var_a863bc25)) {
            self playsound(localclientnum, #"zmb_spawn_powerup");
            self.var_a863bc25 = self playloopsound(#"zmb_spawn_powerup_loop");
        }
    } else {
        if (isdefined(self.var_4e35f286)) {
            stopfx(localclientnum, self.var_4e35f286);
            self.var_4e35f286 = undefined;
        }
        if (isdefined(self.var_a863bc25)) {
            self stoploopsound(self.var_a863bc25);
            self.var_a863bc25 = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x676f9bb1, Offset: 0x4c10
// Size: 0xbe
function function_9cb4a774(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_4e35f286 = util::playfxontag(localclientnum, level._effect[#"hash_233e31d0c2b47b1b"], self, "j_neck");
    } else if (isdefined(self.var_4e35f286)) {
        stopfx(localclientnum, self.var_4e35f286);
        self.var_4e35f286 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x24cf9272, Offset: 0x4cd8
// Size: 0xbe
function function_eba8a203(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_e9c6dd3 = util::playfxontag(localclientnum, level._effect[#"hash_4eddc2f547bc55f6"], self, "tag_weapon_left");
    } else if (isdefined(self.var_e9c6dd3)) {
        stopfx(localclientnum, self.var_e9c6dd3);
        self.var_e9c6dd3 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xee72911e, Offset: 0x4da0
// Size: 0xbe
function function_1467cfe7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_2d78a6d1 = util::playfxontag(localclientnum, level._effect[#"hash_4eddc2f547bc55f6"], self, "tag_weapon_right");
    } else if (isdefined(self.var_2d78a6d1)) {
        stopfx(localclientnum, self.var_2d78a6d1);
        self.var_2d78a6d1 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xdc11b347, Offset: 0x4e68
// Size: 0xbe
function toggle_blue_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_4e35f286 = playfx(localclientnum, level._effect[#"powerup_on_solo"], self.origin);
    } else if (isdefined(self.var_4e35f286)) {
        stopfx(localclientnum, self.var_4e35f286);
        self.var_4e35f286 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x8ff53f7f, Offset: 0x4f30
// Size: 0xbe
function function_f3866f6b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_9f5d50f5 = util::playfxontag(localclientnum, level._effect[#"chaos_ball"], self, "tag_origin");
    } else if (isdefined(self.var_9f5d50f5)) {
        stopfx(localclientnum, self.var_9f5d50f5);
        self.var_9f5d50f5 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x0
// Checksum 0xd1d17320, Offset: 0x4ff8
// Size: 0xbe
function function_fd119bd7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_4e35f286 = playfx(localclientnum, level._effect[#"hash_37043a271f6dd852"], self.origin);
    } else if (isdefined(self.var_4e35f286)) {
        stopfx(localclientnum, self.var_4e35f286);
        self.var_4e35f286 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xa770fef7, Offset: 0x50c0
// Size: 0xbe
function function_46125384(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_c1713f0a = util::playfxontag(localclientnum, level._effect[#"hash_73172b799c18404e"], self, "tag_origin");
    } else if (isdefined(self.var_c1713f0a)) {
        stopfx(localclientnum, self.var_c1713f0a);
        self.var_c1713f0a = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x3b014961, Offset: 0x5188
// Size: 0x10c
function function_5eaabec(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(#"hash_7046550bbfeaf740");
        forcestreamxmodel(#"hash_7c166ef26a8ce946");
        forcestreamxmodel(#"c_t8_zmb_dlc0_zombie_marauder_decapitated_head1");
    } else {
        stopforcestreamingxmodel(#"hash_7046550bbfeaf740");
        stopforcestreamingxmodel(#"hash_7c166ef26a8ce946");
        stopforcestreamingxmodel(#"c_t8_zmb_dlc0_zombie_marauder_decapitated_head1");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x5a6bd5a5, Offset: 0x52a0
// Size: 0x2a0
function crowd_react_boss(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        smodelanimcmd("siege_crowds_battle", "unpause", "set_anim", array::random(array(#"hash_5cb3945473641f29", #"hash_503f5811c1c5e5e6", #"hash_1f6ed2b98c8d027b", #"hash_64e6aa218a7720e8", #"hash_4754434927e48765", #"hash_121b33ccb82a7192")));
    } else {
        smodelanimcmd("siege_crowds_battle", "unpause", "set_anim", array::random(array(#"hash_6b5a40bc4e870ff3", #"hash_56072b7700ddf344", #"hash_36841dd229ef8ac1", #"hash_592b16ba1f2e74aa", #"hash_23b34e6a58a2c83f", #"hash_5669312379919260")));
    }
    smodelanimcmd("siege_crowds_battle", "goto_random", "set_playback_speed", randomfloatrange(0.75, 1));
    if (newval) {
        a_structs = struct::get_array("mus_crowd_bossbattle", "targetname");
        foreach (s_struct in a_structs) {
            wait(randomfloatrange(0.15, 0.5));
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xa0f6d2e5, Offset: 0x5548
// Size: 0x440
function crowd_react(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify("c259832513fb682");
    self endon("c259832513fb682");
    if (!isdefined(level.var_a258da8d)) {
        level.var_a258da8d = 0;
    }
    switch (level.var_a258da8d) {
    case 0:
        switch (newval) {
        case 0:
            var_eafa8a1a = "seated";
            break;
        case 1:
            var_eafa8a1a = "seated_to_angry";
            break;
        case 2:
            var_eafa8a1a = "seated_to_neutral";
            break;
        case 3:
            var_eafa8a1a = "seated_to_cheer";
            break;
        }
        break;
    case 1:
        switch (newval) {
        case 0:
            var_eafa8a1a = "angry_to_seated";
            break;
        case 1:
            var_eafa8a1a = "angry";
            break;
        case 2:
            var_eafa8a1a = "angry_to_neutral";
            break;
        case 3:
            var_eafa8a1a = "angry_to_cheer";
            break;
        }
        break;
    case 2:
        switch (newval) {
        case 0:
            var_eafa8a1a = "neutral_to_seated";
            break;
        case 1:
            var_eafa8a1a = "neutral_to_angry";
            break;
        case 2:
            var_eafa8a1a = "neutral";
            break;
        case 3:
            var_eafa8a1a = "neutral_to_cheer";
            break;
        }
        break;
    case 3:
        switch (newval) {
        case 0:
            var_eafa8a1a = "cheer_to_seated";
            break;
        case 1:
            var_eafa8a1a = "cheer_to_angry";
            break;
        case 2:
            var_eafa8a1a = "cheer_to_neutral";
            break;
        case 3:
            var_eafa8a1a = "cheer";
            break;
        }
        break;
    }
    level.var_a258da8d = newval;
    foreach (str_group in array("siege_crowds_grp27", "siege_zm_crowds_indv_1", "siege_zm_crowds_indv_2", "siege_zm_crowds_indv_3", "siege_zm_crowds_indv_4", "siege_zm_crowds_indv_5")) {
        if (str_group == "siege_crowds_grp27") {
            level thread function_1e3bd96a(str_group, var_eafa8a1a);
        } else {
            level thread function_628c5b1f(str_group, var_eafa8a1a);
        }
        function_1bb8e9c4();
    }
}

// Namespace zm_towers/zm_towers
// Params 3, eflags: 0x1 linked
// Checksum 0x1d345ccd, Offset: 0x5990
// Size: 0xfec
function function_628c5b1f(str_group, var_eafa8a1a, var_55a37c48) {
    /#
        assert(isdefined(var_eafa8a1a), "tag_eye");
    #/
    var_55a37c48 = isdefined(var_55a37c48) ? var_55a37c48 : randomfloatrange(0.75, 1);
    switch (var_eafa8a1a) {
    case #"seated_to_angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_5c60a6f5f1a9d64a")), "set_playback_speed", var_55a37c48);
        wait(1.733 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_5596d5887d732c0e", #"hash_5596d4887d732a5b", #"hash_5596d3887d7328a8", #"hash_5596da887d73348d", #"hash_5596d9887d7332da")), "set_playback_speed", var_55a37c48);
        break;
    case #"seated_to_neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_dec580832649b0")), "set_playback_speed", var_55a37c48);
        wait(1.733 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_146c97641992ac6c", #"hash_146c9a641992b185", #"hash_146c99641992afd2", #"hash_146c94641992a753")), "set_playback_speed", var_55a37c48);
        break;
    case #"seated_to_cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_1ce343c6e117581e")), "set_playback_speed", var_55a37c48);
        wait(2.033 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_4da666f21f604782", #"hash_4da665f21f6045cf", #"hash_4da664f21f60441c", #"hash_4da663f21f604269", #"hash_4da662f21f6040b6")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry_to_seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_4d9e626e573c7720")), "set_playback_speed", var_55a37c48);
        wait(3.8333 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_73397fae2c5e2e65", #"hash_73397cae2c5e294c", #"hash_73397dae2c5e2aff", #"hash_73397aae2c5e25e6", #"hash_73397bae2c5e2799", #"hash_733978ae2c5e2280")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry_to_neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_4cff3d99c8e94c1")), "set_playback_speed", var_55a37c48);
        wait(5 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_146c97641992ac6c", #"hash_146c9a641992b185", #"hash_146c99641992afd2", #"hash_146c94641992a753")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry_to_cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_4da666f21f604782", #"hash_4da665f21f6045cf", #"hash_4da664f21f60441c", #"hash_4da663f21f604269", #"hash_4da662f21f6040b6")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral_to_seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6938770d4f4e8ff2")), "set_playback_speed", var_55a37c48);
        wait(3.9 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_73397fae2c5e2e65", #"hash_73397cae2c5e294c", #"hash_73397dae2c5e2aff", #"hash_73397aae2c5e25e6", #"hash_73397bae2c5e2799", #"hash_733978ae2c5e2280")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral_to_angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_130c0f8d88ebfed1")), "set_playback_speed", var_55a37c48);
        wait(5 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_5596d5887d732c0e", #"hash_5596d4887d732a5b", #"hash_5596d3887d7328a8", #"hash_5596da887d73348d", #"hash_5596d9887d7332da")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral_to_cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6c2063a701bdda05")), "set_playback_speed", var_55a37c48);
        wait(3.333 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_4da666f21f604782", #"hash_4da665f21f6045cf", #"hash_4da664f21f60441c", #"hash_4da663f21f604269", #"hash_4da662f21f6040b6")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer_to_seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_72e771137a0c1fb4")), "set_playback_speed", var_55a37c48);
        wait(2.7 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_73397fae2c5e2e65", #"hash_73397cae2c5e294c", #"hash_73397dae2c5e2aff", #"hash_73397aae2c5e25e6", #"hash_73397bae2c5e2799", #"hash_733978ae2c5e2280")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer_to_angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_5596d5887d732c0e", #"hash_5596d4887d732a5b", #"hash_5596d3887d7328a8", #"hash_5596da887d73348d", #"hash_5596d9887d7332da")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer_to_neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_4573975901365b65")), "set_playback_speed", var_55a37c48);
        wait(5 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_146c97641992ac6c", #"hash_146c9a641992b185", #"hash_146c99641992afd2", #"hash_146c94641992a753")), "set_playback_speed", var_55a37c48);
        break;
    case #"seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_73397fae2c5e2e65", #"hash_73397cae2c5e294c", #"hash_73397dae2c5e2aff", #"hash_73397aae2c5e25e6", #"hash_73397bae2c5e2799", #"hash_733978ae2c5e2280")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_5596d5887d732c0e", #"hash_5596d4887d732a5b", #"hash_5596d3887d7328a8", #"hash_5596da887d73348d", #"hash_5596d9887d7332da")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_146c97641992ac6c", #"hash_146c9a641992b185", #"hash_146c99641992afd2", #"hash_146c94641992a753")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_4da666f21f604782", #"hash_4da665f21f6045cf", #"hash_4da664f21f60441c", #"hash_4da663f21f604269", #"hash_4da662f21f6040b6")), "set_playback_speed", var_55a37c48);
        break;
    }
    smodelanimcmd(str_group, "goto_random");
}

// Namespace zm_towers/zm_towers
// Params 3, eflags: 0x1 linked
// Checksum 0x370f30, Offset: 0x6988
// Size: 0xbca
function function_1e3bd96a(str_group, var_eafa8a1a, var_55a37c48) {
    /#
        assert(isdefined(var_eafa8a1a), "vox_plr_3_exert_punch_give");
    #/
    var_55a37c48 = isdefined(var_55a37c48) ? var_55a37c48 : randomfloatrange(0.75, 1);
    switch (var_eafa8a1a) {
    case #"seated_to_angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_2e2971c6c8f10114")), "set_playback_speed", var_55a37c48);
        wait(2.7);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6b167472b1814bb2")), "set_playback_speed", var_55a37c48);
        break;
    case #"seated_to_neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_12629d4e935c4656")), "set_playback_speed", var_55a37c48);
        wait(2.7 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_69dc776360ba1330")), "set_playback_speed", var_55a37c48);
        break;
    case #"seated_to_cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_2da56ff9700d9164")), "set_playback_speed", var_55a37c48);
        wait(2.7 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_43f1a9a1879ea5d6")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry_to_seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6c024bd52bb7e766")), "set_playback_speed", var_55a37c48);
        wait(5 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_f31fa5dc0acf5f")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry_to_neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_baf5290a3576eed")), "set_playback_speed", var_55a37c48);
        wait(8.333 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_69dc776360ba1330")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry_to_cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_43f1a9a1879ea5d6")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral_to_seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_3e5b404caf7e8b58")), "set_playback_speed", var_55a37c48);
        wait(5 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_f31fa5dc0acf5f")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral_to_angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_196682111694d8f1")), "set_playback_speed", var_55a37c48);
        wait(8.333 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6b167472b1814bb2")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral_to_cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6afc936043f3a9f9")), "set_playback_speed", var_55a37c48);
        wait(8.333 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_43f1a9a1879ea5d6")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer_to_seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6f45d5578dd7000a")), "set_playback_speed", var_55a37c48);
        wait(5 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_f31fa5dc0acf5f")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer_to_angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6b167472b1814bb2")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer_to_neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_556eddf8af2677b1")), "set_playback_speed", var_55a37c48);
        wait(6.666 / var_55a37c48);
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_69dc776360ba1330")), "set_playback_speed", var_55a37c48);
        break;
    case #"seated":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_f31fa5dc0acf5f")), "set_playback_speed", var_55a37c48);
        break;
    case #"angry":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_6b167472b1814bb2")), "set_playback_speed", var_55a37c48);
        break;
    case #"neutral":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_69dc776360ba1330")), "set_playback_speed", var_55a37c48);
        break;
    case #"cheer":
        smodelanimcmd(str_group, "unpause", "set_anim", array::random(array(#"hash_43f1a9a1879ea5d6")), "set_playback_speed", var_55a37c48);
        break;
    }
}

// Namespace zm_towers/zm_towers
// Params 0, eflags: 0x1 linked
// Checksum 0x1acd5a6, Offset: 0x7560
// Size: 0x34
function function_1bb8e9c4() {
    if (math::cointoss()) {
        wait(randomfloatrange(0.15, 0.5));
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x59a3ab48, Offset: 0x75a0
// Size: 0x11e
function crowd_react_wave(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        level thread _crowd_react_wave();
    } else {
        level notify(#"hash_53c191bb10cd9670");
        for (var_1cc68a25 = 0; var_1cc68a25 < array("siege_crowd_stand_a_grp27", "siege_crowd_stand_b_grp27", "siege_crowd_stand_c_grp27", "siege_crowd_stand_d_grp27").size; var_1cc68a25++) {
            level thread function_1e3bd96a(array("siege_crowd_stand_a_grp27", "siege_crowd_stand_b_grp27", "siege_crowd_stand_c_grp27", "siege_crowd_stand_d_grp27")[var_1cc68a25], "cheer_to_seated");
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 0, eflags: 0x1 linked
// Checksum 0xd54391f4, Offset: 0x76c8
// Size: 0x148
function _crowd_react_wave() {
    level notify(#"hash_53c191bb10cd9670");
    level endon(#"hash_53c191bb10cd9670");
    var_1cc68a25 = 0;
    while (1) {
        level thread function_1e3bd96a(array("siege_crowd_stand_a_grp27", "siege_crowd_stand_b_grp27", "siege_crowd_stand_c_grp27", "siege_crowd_stand_d_grp27")[var_1cc68a25], "seated_to_cheer", 2);
        wait(2);
        level thread function_1e3bd96a(array("siege_crowd_stand_a_grp27", "siege_crowd_stand_b_grp27", "siege_crowd_stand_c_grp27", "siege_crowd_stand_d_grp27")[var_1cc68a25], "cheer_to_seated", 2);
        var_1cc68a25++;
        if (var_1cc68a25 > array("siege_crowd_stand_a_grp27", "siege_crowd_stand_b_grp27", "siege_crowd_stand_c_grp27", "siege_crowd_stand_d_grp27").size - 1) {
            var_1cc68a25 = 0;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xe8c100d0, Offset: 0x7818
// Size: 0x62
function function_99220e91(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        level.var_a46ee0d5 = 1;
    } else {
        level.var_a46ee0d5 = 0;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x45116812, Offset: 0x7888
// Size: 0x48c
function snd_crowd_react(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 8) {
        level thread function_cdc077de(localclientnum);
        return;
    }
    if (newval == 11) {
        if (oldval == 5) {
            level thread function_cbe2ea1(localclientnum, 0);
        }
        playsound(0, #"hash_4e3cdd42739b4a0b", (0, 0, 0));
        a_structs = struct::get_array("mus_crowd_bossbattle", "targetname");
        foreach (struct in a_structs) {
            playsound(localclientnum, #"hash_61052d99f398097", struct.origin);
            waitframe(1);
        }
        level notify(#"hash_18e33e7f341865b5");
        return;
    }
    if (newval == 12) {
        level thread function_f68a332e(localclientnum, 1);
        return;
    }
    if (newval == 13) {
        level thread function_f68a332e(localclientnum, 0);
        return;
    }
    if (newval == 9 || newval == 10) {
        if (oldval == 5) {
            level thread function_cbe2ea1(localclientnum, 0);
        }
        level thread function_21a2fea4(localclientnum, newval);
        return;
    }
    if (newval == 14 || newval == 15) {
        if (oldval == 5) {
            level thread function_cbe2ea1(localclientnum, 0);
        }
        level thread function_ba9941c(localclientnum, newval);
        return;
    }
    if (newval == 5) {
        level thread function_cbe2ea1(localclientnum, 1);
        return;
    } else if (oldval == 5) {
        level thread function_cbe2ea1(localclientnum, 0);
    }
    switch (newval) {
    case 0:
        str_alias = #"hash_90cda71914ccf25";
        break;
    case 1:
        str_alias = #"hash_2a3c75c57c227b04";
        break;
    case 2:
        str_alias = #"hash_2a3c75c57c227b04";
        break;
    case 3:
        str_alias = #"hash_4857544e0712e0cc";
        break;
    case 4:
        str_alias = #"hash_4857544e0712e0cc";
        break;
    case 6:
        str_alias = #"hash_2a3c75c57c227b04";
        break;
    case 7:
        str_alias = #"hash_4857544e0712e0cc";
        break;
    case 8:
        str_alias = #"hash_4857544e0712e0cc";
        break;
    }
    level thread function_9ed12c12(localclientnum, str_alias);
}

// Namespace zm_towers/zm_towers
// Params 2, eflags: 0x1 linked
// Checksum 0xcf71af87, Offset: 0x7d20
// Size: 0x100
function function_9ed12c12(localclientnum, str_alias) {
    a_structs = struct::get_array("sndCrowdOneshot", "targetname");
    foreach (s_struct in a_structs) {
        if (isdefined(s_struct.script_int) && s_struct.script_int) {
            playsound(localclientnum, str_alias, s_struct.origin);
            wait(randomfloatrange(0.15, 0.5));
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 1, eflags: 0x1 linked
// Checksum 0x1d1c92e4, Offset: 0x7e28
// Size: 0x214
function function_cdc077de(localclientnum) {
    a_structs = struct::get_array("sndCrowdOneshot", "targetname");
    a_structs = array::randomize(a_structs);
    s_oneshot = struct::get("sndCrowdLevelstart", "targetname");
    playsound(localclientnum, #"hash_481bb2830d09d01f", s_oneshot.origin);
    n_int = 1;
    foreach (s_struct in a_structs) {
        if (isdefined(s_struct.script_int) && s_struct.script_int) {
            playsound(localclientnum, #"hash_7ef570749fdb2ff2" + n_int, s_struct.origin);
            wait(randomfloatrange(0.15, 0.5));
            n_int++;
        }
    }
    level notify(#"hash_18e33e7f341865b5");
    level notify(#"hash_61e23ff49a338bcf");
    wait(3);
    if (zm_utility::is_standard() || zm_utility::is_trials()) {
        return;
    }
    level thread function_21a2fea4(localclientnum, 9);
}

// Namespace zm_towers/zm_towers
// Params 2, eflags: 0x1 linked
// Checksum 0xe0646967, Offset: 0x8048
// Size: 0x166
function function_21a2fea4(localclientnum, var_a0d24aa6) {
    a_structs = struct::get_array("mus_crowd", "targetname");
    var_ffc05b22 = "_start_";
    var_5babe62d = randomintrange(1, 5);
    if (var_a0d24aa6 == 10) {
        var_ffc05b22 = "_end_";
        var_5babe62d = randomintrange(1, 4);
    }
    foreach (s_struct in a_structs) {
        var_1f2066a = s_struct.script_string;
        playsound(localclientnum, "mus_crowd_" + var_1f2066a + var_ffc05b22 + var_5babe62d, s_struct.origin);
        waitframe(1);
    }
}

// Namespace zm_towers/zm_towers
// Params 3, eflags: 0x1 linked
// Checksum 0xe93c5212, Offset: 0x81b8
// Size: 0x24e
function function_cbe2ea1(localclientnum, var_49f77cdc, var_4b327660 = 0) {
    if (!isdefined(level.var_ecc6b1b0)) {
        level.var_ecc6b1b0 = 0;
    }
    if (var_49f77cdc) {
        level.var_ecc6b1b0 = function_21a3a673(0, 4);
        a_structs = struct::get_array("sndCrowdOneshot", "targetname");
        a_structs = array::randomize(a_structs);
        foreach (s_struct in a_structs) {
            if (isdefined(s_struct.script_int) && s_struct.script_int || var_4b327660) {
                audio::playloopat("amb_crowd_positive_max_lp_" + level.var_ecc6b1b0, s_struct.origin);
                waitframe(1);
            }
        }
    } else {
        a_structs = struct::get_array("sndCrowdOneshot", "targetname");
        foreach (s_struct in a_structs) {
            if (isdefined(s_struct.script_int) && s_struct.script_int || var_4b327660) {
                audio::stoploopat("amb_crowd_positive_max_lp_" + level.var_ecc6b1b0, s_struct.origin);
                waitframe(1);
            }
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 2, eflags: 0x1 linked
// Checksum 0x7956a726, Offset: 0x8410
// Size: 0x42c
function function_ba9941c(localclientnum, newval) {
    if (!isdefined(level.var_7994da16)) {
        level.var_7994da16 = "_good";
    }
    a_structs = struct::get_array("mus_crowd", "targetname");
    if (newval == 14) {
        foreach (s_struct in a_structs) {
            var_1f2066a = s_struct.script_string;
            playsound(localclientnum, "mus_crowd_" + var_1f2066a + "_special_start", s_struct.origin);
            waitframe(1);
        }
        wait(6.3);
        foreach (s_struct in a_structs) {
            var_1f2066a = s_struct.script_string;
            audio::playloopat("mus_crowd_" + var_1f2066a + "_special_loop", s_struct.origin);
            waitframe(1);
        }
        if (isdefined(level.var_a46ee0d5) && level.var_a46ee0d5) {
            level.var_7994da16 = "_good";
            if (math::cointoss() && math::cointoss()) {
                level.var_7994da16 = "_shreds";
            }
            audio::playloopat("mus_crowd_arena_rock_main" + level.var_7994da16, (0, 1205, 715));
            waitframe(1);
            audio::playloopat("mus_crowd_arena_rock_swt" + level.var_7994da16, (0, -803, 439));
        }
    } else if (newval == 15 || newval == 16) {
        foreach (s_struct in a_structs) {
            var_1f2066a = s_struct.script_string;
            if (newval == 15) {
                playsound(localclientnum, "mus_crowd_" + var_1f2066a + "_special_end", s_struct.origin);
            }
            audio::stoploopat("mus_crowd_" + var_1f2066a + "_special_loop", s_struct.origin);
            waitframe(1);
        }
        if (isdefined(level.var_a46ee0d5) && level.var_a46ee0d5) {
            audio::stoploopat("mus_crowd_arena_rock_main" + level.var_7994da16, (0, 1205, 715));
            waitframe(1);
            audio::stoploopat("mus_crowd_arena_rock_swt" + level.var_7994da16, (0, -803, 439));
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 2, eflags: 0x1 linked
// Checksum 0x9a1bac92, Offset: 0x8848
// Size: 0x2f6
function function_f68a332e(localclientnum, var_12ae4a7b) {
    a_structs = struct::get_array("mus_crowd_bossbattle", "targetname");
    if (var_12ae4a7b) {
        wait(4);
        foreach (s_struct in a_structs) {
            var_1f2066a = s_struct.script_string;
            playsound(localclientnum, "mus_crowd_" + var_1f2066a + "_boss_start", s_struct.origin);
            waitframe(1);
        }
        wait(4.8);
        foreach (s_struct in a_structs) {
            var_1f2066a = s_struct.script_string;
            audio::playloopat("mus_crowd_" + var_1f2066a + "_boss_loop", s_struct.origin);
            waitframe(1);
        }
    } else {
        foreach (s_struct in a_structs) {
            var_1f2066a = s_struct.script_string;
            playsound(localclientnum, "mus_crowd_" + var_1f2066a + "_boss_end", s_struct.origin);
            waitframe(1);
        }
        wait(1);
        foreach (s_struct in a_structs) {
            var_1f2066a = s_struct.script_string;
            audio::stoploopat("mus_crowd_" + var_1f2066a + "_boss_loop", s_struct.origin);
            waitframe(1);
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 0, eflags: 0x1 linked
// Checksum 0x29c2fd0f, Offset: 0x8b48
// Size: 0x288
function setup_personality_character_exerts() {
    level.exert_sounds[1][#"playerbreathinsound"] = "vox_plr_1_exert_sniper_hold";
    level.exert_sounds[2][#"playerbreathinsound"] = "vox_plr_2_exert_sniper_hold";
    level.exert_sounds[3][#"playerbreathinsound"] = "vox_plr_3_exert_sniper_hold";
    level.exert_sounds[4][#"playerbreathinsound"] = "vox_plr_4_exert_sniper_hold";
    level.exert_sounds[1][#"playerbreathoutsound"] = "vox_plr_1_exert_sniper_exhale";
    level.exert_sounds[2][#"playerbreathoutsound"] = "vox_plr_2_exert_sniper_exhale";
    level.exert_sounds[3][#"playerbreathoutsound"] = "vox_plr_3_exert_sniper_exhale";
    level.exert_sounds[4][#"playerbreathoutsound"] = "vox_plr_4_exert_sniper_exhale";
    level.exert_sounds[1][#"playerbreathgaspsound"] = "vox_plr_1_exert_sniper_gasp";
    level.exert_sounds[2][#"playerbreathgaspsound"] = "vox_plr_2_exert_sniper_gasp";
    level.exert_sounds[3][#"playerbreathgaspsound"] = "vox_plr_3_exert_sniper_gasp";
    level.exert_sounds[4][#"playerbreathgaspsound"] = "vox_plr_4_exert_sniper_gasp";
    level.exert_sounds[1][#"meleeswipesoundplayer"] = "vox_plr_1_exert_punch_give";
    level.exert_sounds[2][#"meleeswipesoundplayer"] = "vox_plr_2_exert_punch_give";
    level.exert_sounds[3][#"meleeswipesoundplayer"] = "vox_plr_3_exert_punch_give";
    level.exert_sounds[4][#"meleeswipesoundplayer"] = "vox_plr_4_exert_punch_give";
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xc38d577c, Offset: 0x8dd8
// Size: 0x1f8
function special_round_camera_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = "special_round_camera_start";
    var_59806731 = "special_round_camera_persist";
    var_bf4d56bf = self getentitynumber();
    if (newval == 2) {
        str_fx = "maelstrom_camera_fx";
        var_59806731 = "maelstrom_camera_fx";
    }
    if (newval) {
        if (self == function_5c10bd79(localclientnum)) {
            playfxoncamera(localclientnum, level._effect[str_fx], (0, 0, 0), (1, 0, 0), (0, 0, 1));
            if (isdefined(level.fx_special_round_camera[var_bf4d56bf])) {
                deletefx(localclientnum, level.fx_special_round_camera[var_bf4d56bf]);
            }
            level.fx_special_round_camera[var_bf4d56bf] = playfxoncamera(localclientnum, level._effect[var_59806731], (0, 0, 0), (1, 0, 0), (0, 0, 1));
        }
    } else {
        foreach (fx in level.fx_special_round_camera) {
            deletefx(localclientnum, fx);
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x43625a1, Offset: 0x8fd8
// Size: 0xb4
function function_94675baf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        level exploder::exploder("exp_special_round_gas");
        setexposureactivebank(localclientnum, 2);
    } else {
        level exploder::stop_exploder("exp_special_round_gas");
        setexposureactivebank(localclientnum, 1);
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x1d36b73, Offset: 0x9098
// Size: 0x13e
function function_bdc63758(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playsound(localclientnum, #"hash_539eb529963d7db4");
        self.fx = util::playfxontag(localclientnum, level._effect[#"head_fire_blue"], self, "j_neck");
        self.sfx = self playloopsound(#"hash_38c39a7f0966480e");
    } else {
        if (isdefined(self.fx)) {
            self.fx delete();
            self.fx = undefined;
        }
        if (isdefined(self.sfx)) {
            self stoploopsound(self.sfx);
            self.sfx = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x69e11109, Offset: 0x91e0
// Size: 0x13e
function function_c41817fc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playsound(localclientnum, #"hash_539eb529963d7db4");
        self.fx = util::playfxontag(localclientnum, level._effect[#"head_fire_green"], self, "j_neck");
        self.sfx = self playloopsound(#"hash_38c39a7f0966480e");
    } else {
        if (isdefined(self.fx)) {
            self.fx delete();
            self.fx = undefined;
        }
        if (isdefined(self.sfx)) {
            self stoploopsound(self.sfx);
            self.sfx = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xd62f4329, Offset: 0x9328
// Size: 0x13e
function function_27a7a3be(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playsound(localclientnum, #"hash_539eb529963d7db4");
        self.fx = util::playfxontag(localclientnum, level._effect[#"head_fire_purple"], self, "j_neck");
        self.sfx = self playloopsound(#"hash_38c39a7f0966480e");
    } else {
        if (isdefined(self.fx)) {
            self.fx delete();
            self.fx = undefined;
        }
        if (isdefined(self.sfx)) {
            self stoploopsound(self.sfx);
            self.sfx = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xddfd6a36, Offset: 0x9470
// Size: 0x13e
function function_d056a230(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playsound(localclientnum, #"hash_539eb529963d7db4");
        self.fx = util::playfxontag(localclientnum, level._effect[#"head_fire_red"], self, "j_neck");
        self.sfx = self playloopsound(#"hash_38c39a7f0966480e");
    } else {
        if (isdefined(self.fx)) {
            self.fx delete();
            self.fx = undefined;
        }
        if (isdefined(self.sfx)) {
            self stoploopsound(self.sfx);
            self.sfx = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xf96a52cb, Offset: 0x95b8
// Size: 0x302
function function_57f3914e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_fx = struct::get("odin_brazier");
    switch (newval) {
    case 0:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 1:
        s_fx.n_fire = playfx(localclientnum, level._effect[#"brazier_fire_blue"], s_fx.origin);
        playsound(localclientnum, #"hash_6e1881a291ad6bda", s_fx.origin);
        audio::playloopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 2:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        s_fx.n_fire = playfx(localclientnum, level._effect[#"hash_169c8ab62603115c"], s_fx.origin);
        playsound(localclientnum, #"hash_5390d89dc611da6c", s_fx.origin);
        audio::playloopat(#"hash_3897a36236b75e0c", s_fx.origin);
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        break;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x7383a655, Offset: 0x98c8
// Size: 0x302
function function_6e6d4bfc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_fx = struct::get("danu_brazier");
    switch (newval) {
    case 0:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 1:
        s_fx.n_fire = playfx(localclientnum, level._effect[#"brazier_fire_green"], s_fx.origin);
        playsound(localclientnum, #"hash_6e1881a291ad6bda", s_fx.origin);
        audio::playloopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 2:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        s_fx.n_fire = playfx(localclientnum, level._effect[#"hash_169c8ab62603115c"], s_fx.origin);
        playsound(localclientnum, #"hash_5390d89dc611da6c", s_fx.origin);
        audio::playloopat(#"hash_3897a36236b75e0c", s_fx.origin);
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        break;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xf599cdcc, Offset: 0x9bd8
// Size: 0x302
function function_66050c9e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_fx = struct::get("zeus_brazier");
    switch (newval) {
    case 0:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 1:
        s_fx.n_fire = playfx(localclientnum, level._effect[#"brazier_fire_purple"], s_fx.origin);
        playsound(localclientnum, #"hash_6e1881a291ad6bda", s_fx.origin);
        audio::playloopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 2:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        s_fx.n_fire = playfx(localclientnum, level._effect[#"hash_169c8ab62603115c"], s_fx.origin);
        playsound(localclientnum, #"hash_5390d89dc611da6c", s_fx.origin);
        audio::playloopat(#"hash_3897a36236b75e0c", s_fx.origin);
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        break;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x1da59249, Offset: 0x9ee8
// Size: 0x302
function function_1c231f3f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_fx = struct::get("ra_brazier");
    switch (newval) {
    case 0:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 1:
        s_fx.n_fire = playfx(localclientnum, level._effect[#"brazier_fire_red"], s_fx.origin);
        playsound(localclientnum, #"hash_6e1881a291ad6bda", s_fx.origin);
        audio::playloopat(#"hash_929cb50cf634fb4", s_fx.origin);
        audio::stoploopat(#"hash_3897a36236b75e0c", s_fx.origin);
        break;
    case 2:
        if (isdefined(s_fx.n_fire)) {
            stopfx(localclientnum, s_fx.n_fire);
            s_fx.n_fire = undefined;
        }
        s_fx.n_fire = playfx(localclientnum, level._effect[#"hash_169c8ab62603115c"], s_fx.origin);
        playsound(localclientnum, #"hash_5390d89dc611da6c", s_fx.origin);
        audio::playloopat(#"hash_3897a36236b75e0c", s_fx.origin);
        audio::stoploopat(#"hash_929cb50cf634fb4", s_fx.origin);
        break;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x86466449, Offset: 0xa1f8
// Size: 0xb6
function function_87e8980d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"energy_soul"], self, "j_neck");
    } else if (isdefined(self.fx)) {
        self.fx delete();
        self.fx = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xb85da8c6, Offset: 0xa2b8
// Size: 0xb6
function function_b29b7566(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"energy_soul_target"], self, "j_neck");
    } else if (isdefined(self.fx)) {
        self.fx delete();
        self.fx = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x7b902582, Offset: 0xa378
// Size: 0x74
function banner_soul_burst(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playfx(localclientnum, level._effect[#"banner_soul_burst"], self.origin);
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x8ba03e6d, Offset: 0xa3f8
// Size: 0xba
function function_a1d393ad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 1:
        forcestreamxmodel(#"p8_zm_gla_heart_zombie");
        break;
    case 0:
        stopforcestreamingxmodel(#"p8_zm_gla_heart_zombie");
        break;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x888c3ed3, Offset: 0xa4c0
// Size: 0x118
function function_ee4f01d8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    a_s_crowd = struct::get_array("sndCrowdOneshot");
    foreach (s_crowd in a_s_crowd) {
        playsound(localclientnum, #"hash_4857544e0712e0cc", s_crowd.origin);
        n_random_wait = randomfloatrange(0.15, 0.5);
        wait(n_random_wait);
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x8a09bc1c, Offset: 0xa5e0
// Size: 0x10c
function acid_trap_death_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.n_acid_trap_death_fx = util::playfxontag(localclientnum, level._effect[#"acid_death"], self, "j_spine4");
        self.var_5911b395 = self playloopsound(#"hash_21fbee9ffef9a6d7");
    } else if (isdefined(self.n_acid_trap_death_fx)) {
        stopfx(localclientnum, self.n_acid_trap_death_fx);
        self.n_acid_trap_death_fx = undefined;
        self stoploopsound(self.var_5911b395);
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x2c1f84e2, Offset: 0xa6f8
// Size: 0xc6
function function_29bd0c51(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.var_eae524c4 = util::playfxontag(localclientnum, level._effect[#"trap_switch_green"], self, "p8_zm_gla_trap_switch_01_handle_jnt");
    } else if (isdefined(self.var_eae524c4)) {
        stopfx(localclientnum, self.var_eae524c4);
        self.var_eae524c4 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x151c64f8, Offset: 0xa7c8
// Size: 0xc6
function function_75347b12(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.var_326470f = util::playfxontag(localclientnum, level._effect[#"trap_switch_red"], self, "p8_zm_gla_trap_switch_01_handle_jnt");
    } else if (isdefined(self.var_326470f)) {
        stopfx(localclientnum, self.var_326470f);
        self.var_326470f = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x18c8540e, Offset: 0xa898
// Size: 0x136
function function_25ebc4f7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.var_b07a8611 = util::playfxontag(localclientnum, level._effect[#"trap_switch_smoke"], self, "p8_zm_gla_trap_switch_01_handle_jnt");
        if (!isdefined(self.var_7696023a)) {
            self.var_7696023a = self playloopsound(#"hash_228d379ca7c13b55");
        }
    } else {
        if (isdefined(self.var_b07a8611)) {
            stopfx(localclientnum, self.var_b07a8611);
            self.var_b07a8611 = undefined;
        }
        if (isdefined(self.var_7696023a)) {
            self stoploopsound(self.var_7696023a);
            self.var_7696023a = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x1400eb07, Offset: 0xa9d8
// Size: 0x114
function acid_trap_postfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self postfx::playpostfxbundle("pstfx_zm_acid_dmg_towers");
        self postfx::playpostfxbundle("pstfx_zm_acid_dmg_towers_2");
        self.var_431ddde9 = self playloopsound(#"hash_341a3fa00975f232");
    } else {
        self postfx::exitpostfxbundle("pstfx_zm_acid_dmg_towers");
        self postfx::exitpostfxbundle("pstfx_zm_acid_dmg_towers_2");
        if (isdefined(self.var_431ddde9)) {
            self stoploopsound(self.var_431ddde9);
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x187965c3, Offset: 0xaaf8
// Size: 0xbe
function function_a8195148(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_7d8225fa = util::playfxontag(localclientnum, level._effect[#"hash_42cc4bf5e47478c5"], self, "tag_origin");
    } else if (isdefined(self.var_7d8225fa)) {
        stopfx(localclientnum, self.var_7d8225fa);
        self.var_7d8225fa = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x6ff85cd1, Offset: 0xabc0
// Size: 0x126
function function_24673586(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_a7333ca8 = util::playfxontag(localclientnum, level._effect[#"hash_3b746cf6eec416b2"], self, "tag_origin");
        self.var_48eb9b0 = util::playfxontag(localclientnum, level._effect[#"hash_36535f89ec2488d7"], self, "tag_origin");
    } else if (isdefined(self.var_a7333ca8)) {
        stopfx(localclientnum, self.var_a7333ca8);
        stopfx(localclientnum, self.var_48eb9b0);
        self.var_a7333ca8 = undefined;
        self.var_48eb9b0 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x4df56c3e, Offset: 0xacf0
// Size: 0xd4
function function_e9a85af(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    s_fx = struct::get(#"hash_43872a24dfb85c96");
    playfx(localclientnum, level._effect[#"hash_584e8f7433246444"], s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xa5fcc4fc, Offset: 0xadd0
// Size: 0x5c
function function_90076b73(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    function_daa52f70(localclientnum, "danu");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xf168d246, Offset: 0xae38
// Size: 0x5c
function function_e26b1e6b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    function_daa52f70(localclientnum, "ra");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x11c88909, Offset: 0xaea0
// Size: 0x5c
function function_25a6ede2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    function_daa52f70(localclientnum, "odin");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xd2c5097e, Offset: 0xaf08
// Size: 0x5c
function function_a2800857(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    function_daa52f70(localclientnum, "zeus");
}

// Namespace zm_towers/zm_towers
// Params 2, eflags: 0x1 linked
// Checksum 0x2eeaa2f0, Offset: 0xaf70
// Size: 0x9c
function function_daa52f70(localclientnum, str_tower) {
    s_fx = struct::get(#"hash_73ea18ffc4b86f9b" + str_tower);
    playfx(localclientnum, level._effect[#"ww_quest_scorpio"], s_fx.origin, anglestoforward(s_fx.angles));
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x50968d53, Offset: 0xb018
// Size: 0xbe
function ww_quest_melting(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.registert_wallrunright_diaz_visible_lookat_round = playfx(localclientnum, level._effect[#"ww_quest_melting"], self.origin);
    } else if (isdefined(self.registert_wallrunright_diaz_visible_lookat_round)) {
        stopfx(localclientnum, self.registert_wallrunright_diaz_visible_lookat_round);
        self.registert_wallrunright_diaz_visible_lookat_round = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xda777bee, Offset: 0xb0e0
// Size: 0xbe
function function_76dd176c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_c80206ce = util::playfxontag(localclientnum, level._effect[#"hash_4c4f96aa02c32a2a"], self, "tag_origin");
    } else if (isdefined(self.var_c80206ce)) {
        stopfx(localclientnum, self.var_c80206ce);
        self.var_c80206ce = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xbb6c96d0, Offset: 0xb1a8
// Size: 0x74
function function_5dc8b5fa(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    playfx(localclientnum, level._effect[#"hash_7bd75ae600e0a590"], self.origin);
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x4d391f54, Offset: 0xb228
// Size: 0x74
function function_91305947(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    util::playfxontag(localclientnum, level._effect[#"hash_48ad84f9cf6a33f0"], self, "tag_fx");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xf7b28ce6, Offset: 0xb2a8
// Size: 0xe6
function function_ba86af94(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    var_30f4bba7 = self zbarriergetpiece(1);
    if (newval) {
        level.var_8832c6a2 = util::playfxontag(localclientnum, level._effect[#"hash_3974bea828fbf7f7"], var_30f4bba7, "tag_fx");
    } else if (isdefined(level.var_8832c6a2)) {
        stopfx(localclientnum, level.var_8832c6a2);
        level.var_8832c6a2 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xc8b470da, Offset: 0xb398
// Size: 0x2b2
function function_36469123(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    var_2462a1c = self zbarriergetpiece(1);
    var_f8c61710 = self zbarriergetpiece(2);
    if (newval) {
        var_88961f1a = util::playfxontag(localclientnum, level._effect[#"hash_3a51c9895d4afcf7"], var_2462a1c, "top_skull_head_jnt");
        var_9dd8f492 = util::playfxontag(localclientnum, level._effect[#"hash_3a51c9895d4afcf7"], var_f8c61710, "top_skull_head_jnt");
        if (!isdefined(level.var_51c2c67a)) {
            level.var_51c2c67a = [];
        } else if (!isarray(level.var_51c2c67a)) {
            level.var_51c2c67a = array(level.var_51c2c67a);
        }
        level.var_51c2c67a[level.var_51c2c67a.size] = var_88961f1a;
        if (!isdefined(level.var_51c2c67a)) {
            level.var_51c2c67a = [];
        } else if (!isarray(level.var_51c2c67a)) {
            level.var_51c2c67a = array(level.var_51c2c67a);
        }
        level.var_51c2c67a[level.var_51c2c67a.size] = var_9dd8f492;
    } else if (isdefined(level.var_51c2c67a)) {
        foreach (n_fx in level.var_51c2c67a) {
            stopfx(localclientnum, n_fx);
        }
        level.var_51c2c67a = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xac6d7ab2, Offset: 0xb658
// Size: 0x1fe
function function_a7b41dea(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    var_30f4bba7 = self zbarriergetpiece(2);
    if (!isdefined(level.var_25faefd0)) {
        v_origin = var_30f4bba7 gettagorigin("j_lid");
        v_angles = var_30f4bba7 gettagangles("j_lid");
        v_angles = v_angles + vectorscale((0, 1, 0), 90);
        level.var_25faefd0 = util::spawn_model(localclientnum, "tag_origin", v_origin, v_angles);
        level.var_25faefd0 linkto(var_30f4bba7, "j_lid");
    }
    if (newval) {
        level.var_bf78c2cd = util::playfxontag(localclientnum, level._effect[#"hash_1add6939914df65a"], level.var_25faefd0, "tag_origin");
    } else {
        if (isdefined(level.var_bf78c2cd)) {
            stopfx(localclientnum, level.var_bf78c2cd);
            level.var_bf78c2cd = undefined;
        }
        if (isdefined(level.var_25faefd0)) {
            level.var_25faefd0 unlink();
            level.var_25faefd0 delete();
            level.var_25faefd0 = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xb9b33bd6, Offset: 0xb860
// Size: 0xe6
function function_1941a5ca(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    var_30f4bba7 = self zbarriergetpiece(2);
    if (newval) {
        level.var_9354725d = util::playfxontag(localclientnum, level._effect[#"hash_5dc6f97e5850e1d1"], var_30f4bba7, "tag_fx");
    } else if (isdefined(level.var_9354725d)) {
        stopfx(localclientnum, level.var_9354725d);
        level.var_9354725d = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x11869be9, Offset: 0xb950
// Size: 0x7c
function ww_quest_earthquake(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    function_36e4ebd4(localclientnum, #"zm_towers_earthquake_heavy");
    function_36e4ebd4(localclientnum, #"zm_towers_earthquake_light");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x4363469e, Offset: 0xb9d8
// Size: 0xcc
function function_98d53b6b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        forcestreamxmodel(#"p8_zm_gla_artifact_podium");
        forcestreamxmodel(#"p8_zm_gla_artifact_podium_on");
    } else {
        stopforcestreamingxmodel(#"p8_zm_gla_artifact_podium");
        stopforcestreamingxmodel(#"p8_zm_gla_artifact_podium_on");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x9afd778e, Offset: 0xbab0
// Size: 0x8c
function maelstrom_initiate(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    function_36e4ebd4(localclientnum, "damage_heavy");
    earthquake(localclientnum, 1, 0.25, self.origin, 64);
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x4d4fd03e, Offset: 0xbb48
// Size: 0x138
function maelstrom_initiate_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    a_s_fx = struct::get_array("s_maelstrom_initiate_fx");
    foreach (s_fx in a_s_fx) {
        playfx(localclientnum, level._effect[#"maelstrom_initiate"], s_fx.origin, anglestoforward(s_fx.angles));
        playsound(localclientnum, #"hash_44163603295b2408", s_fx.origin);
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x953b1181, Offset: 0xbc88
// Size: 0xe6
function maelstrom_conduct(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_7ef98b90 = util::playfxontag(localclientnum, level._effect[#"maelstrom_conduct"], self, "tag_origin");
        self playsound(localclientnum, #"hash_68123d3c746fe40c");
    } else if (isdefined(self.var_7ef98b90)) {
        stopfx(localclientnum, self.var_7ef98b90);
        self.var_7ef98b90 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xfddfec52, Offset: 0xbd78
// Size: 0x17e
function function_e21e7dbe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_8e8be900 = util::playfxontag(localclientnum, level._effect[#"hash_1814d4cc1867739c"], self, "tag_origin");
        if (!isdefined(self.var_45052c1f)) {
            self playsound(localclientnum, #"hash_5653bacd3880f5e6");
            self.var_45052c1f = self playloopsound(#"hash_1158ca937d0645df");
        }
    } else {
        if (isdefined(self.var_8e8be900)) {
            stopfx(localclientnum, self.var_8e8be900);
            self.var_8e8be900 = undefined;
        }
        if (isdefined(self.var_45052c1f)) {
            self playsound(localclientnum, #"hash_3dc40c9d94d68a08");
            self stoploopsound(self.var_45052c1f);
            self.var_45052c1f = undefined;
        }
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x20779f9f, Offset: 0xbf00
// Size: 0x10c
function function_4a9243dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_32d23a6 = util::playfxontag(localclientnum, level._effect[#"hash_314d3a2e542805c0"], self, "tag_origin");
        self playsound(localclientnum, #"hash_7be24f149608de05");
    } else {
        if (isdefined(self.var_32d23a6)) {
            stopfx(localclientnum, self.var_32d23a6);
            self.var_32d23a6 = undefined;
        }
        self playsound(localclientnum, #"hash_484f870ae922590");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xdbf5db43, Offset: 0xc018
// Size: 0xa4
function maelstrom_discharge(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    playfx(localclientnum, level._effect[#"maelstrom_death"], self.origin, anglestoforward((0, 0, 0)), anglestoup((0, 0, 0)));
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x5f4aa64d, Offset: 0xc0c8
// Size: 0xec
function maelstrom_death(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    playfx(localclientnum, level._effect[#"maelstrom_death"], self.origin, anglestoforward((0, 0, 0)), anglestoup((0, 0, 0)));
    function_36e4ebd4(localclientnum, "lightninggun_fire");
    self playsound(localclientnum, #"hash_784c6d9757964494");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x74f460fc, Offset: 0xc1c0
// Size: 0x106
function maelstrom_storm(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        if (!isdefined(self.var_cc93270e)) {
            self playsound(localclientnum, #"hash_5949809a2b6867a3");
            self.var_cc93270e = self playloopsound(#"hash_15a98fa81782b075");
        }
    } else if (isdefined(self.var_cc93270e)) {
        self playsound(localclientnum, #"hash_2a8bc9fc5e6a2b6");
        self stoploopsound(self.var_cc93270e);
        self.var_cc93270e = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x8178c7a2, Offset: 0xc2d0
// Size: 0x64
function function_2d6ec02(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self playsound(localclientnum, #"hash_57b0d65c6bc36311");
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xf3b65e63, Offset: 0xc340
// Size: 0xa4
function maelstrom_ending(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (!isalive(self)) {
        return;
    }
    function_36e4ebd4(localclientnum, "damage_heavy");
    earthquake(localclientnum, 1, 0.25, self.origin, 64);
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xa1fbe998, Offset: 0xc3f0
// Size: 0x8c
function function_7dbeb0c5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    playfx(localclientnum, level._effect[#"hash_63e758aa5387132a"], self.origin, anglestoforward(self.angles));
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xdfe77e5a, Offset: 0xc488
// Size: 0xbe
function function_fa2e6690(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_1cac7f38 = util::playfxontag(localclientnum, level._effect[#"hash_23ba00d2f804acc2"], self, "tag_origin");
    } else if (isdefined(self.var_1cac7f38)) {
        stopfx(localclientnum, self.var_1cac7f38);
        self.var_1cac7f38 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x71ac164a, Offset: 0xc550
// Size: 0x84
function function_fc502d48(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        level exploder::exploder("fxexp_fast_travel_orbs");
    } else {
        level exploder::stop_exploder("fxexp_fast_travel_orbs");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0xc9457790, Offset: 0xc5e0
// Size: 0x54
function function_5cdc8b28(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self thread function_a8fa1dc3(newval);
}

// Namespace zm_towers/zm_towers
// Params 1, eflags: 0x1 linked
// Checksum 0x2cd1d246, Offset: 0xc640
// Size: 0x2be
function function_a8fa1dc3(b_show) {
    self notify("7dc29fd1e387db86");
    self endon("7dc29fd1e387db86");
    self endon(#"death");
    if (!self flag::exists(#"hash_71f56d0cc4c3df1f")) {
        self flag::init(#"hash_71f56d0cc4c3df1f");
        self flag::set(#"hash_71f56d0cc4c3df1f");
        self playrenderoverridebundle(#"hash_16b8b568a95931e7");
    }
    n_start_time = gettime();
    n_end_time = n_start_time + int(0.5 * 1000);
    n_alpha_start = 0;
    n_alpha_end = 1;
    b_stream = 1;
    if (!b_show) {
        n_alpha_start = 1;
        n_alpha_end = 0;
        b_stream = 0;
    }
    if (b_stream) {
        forcestreamxmodel(self.model);
    } else {
        stopforcestreamingxmodel(self.model);
    }
    while (1) {
        n_time = gettime();
        if (n_time >= n_end_time) {
            self function_78233d29(#"hash_16b8b568a95931e7", "", "brightness", n_alpha_end);
            self function_78233d29(#"hash_16b8b568a95931e7", "", "alpha", n_alpha_end);
            break;
        }
        n_alpha = mapfloat(n_start_time, n_end_time, n_alpha_start, n_alpha_end, n_time);
        self function_78233d29(#"hash_16b8b568a95931e7", "", "brightness", n_alpha);
        self function_78233d29(#"hash_16b8b568a95931e7", "", "alpha", n_alpha);
        waitframe(1);
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x145ca11d, Offset: 0xc908
// Size: 0xee
function function_5c9f28ec(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.var_7a3d3907 = playfx(localclientnum, level._effect[#"hash_5afda864f8b64f5c"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
    } else if (isdefined(self.var_7a3d3907)) {
        stopfx(localclientnum, self.var_7a3d3907);
        self.var_7a3d3907 = undefined;
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x64f5d126, Offset: 0xca00
// Size: 0xd2
function function_e63747a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval && !isdefined(self.var_2ec44947)) {
        self.var_2ec44947 = util::playfxontag(localclientnum, level._effect[#"hash_56c34d8ec9a098c2"], self, "tag_fx_eye_01");
        self.var_e1812ec2 = util::playfxontag(localclientnum, level._effect[#"hash_56c34d8ec9a098c2"], self, "tag_fx_eye_02");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x86ac0083, Offset: 0xcae0
// Size: 0xc4
function function_44a2fe02(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        function_a5777754(localclientnum, "ee_space");
        function_93620041(localclientnum, "arena_occluder_volume");
    } else {
        function_73b1f242(localclientnum, "ee_space");
        function_9362afb8(localclientnum, "arena_occluder_volume");
    }
}

// Namespace zm_towers/zm_towers
// Params 7, eflags: 0x1 linked
// Checksum 0x8f1c8cb0, Offset: 0xcbb0
// Size: 0x84
function function_4c2b87ed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_a5777754(localclientnum, "lower_pit");
    } else {
        function_73b1f242(localclientnum, "lower_pit");
    }
}

// Namespace zm_towers/zm_towers
// Params 0, eflags: 0x1 linked
// Checksum 0x13363984, Offset: 0xcc40
// Size: 0x164
function startzmbspawnersoundloops() {
    wait(2);
    loopers = struct::get_array("spawn_location", "script_noteworthy");
    if (isdefined(loopers) && loopers.size > 0) {
        delay = 0;
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                println("<unknown string>" + loopers.size + "<unknown string>");
            }
        #/
        for (i = 0; i < loopers.size; i++) {
            loopers[i] thread soundloopthink();
            delay = delay + 1;
            if (delay % 20 == 0) {
                waitframe(1);
            }
        }
    } else {
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                println("<unknown string>");
            }
        #/
    }
}

// Namespace zm_towers/zm_towers
// Params 0, eflags: 0x1 linked
// Checksum 0x1fe831bc, Offset: 0xcdb0
// Size: 0x18a
function soundloopthink() {
    if (!isdefined(self.origin)) {
        return;
    }
    if (!isdefined(self.script_sound)) {
        self.script_sound = "zmb_spawn_walla";
    }
    notifyname = "";
    /#
        assert(isdefined(notifyname));
    #/
    if (isdefined(self.script_string)) {
        notifyname = self.script_string;
    }
    /#
        assert(isdefined(notifyname));
    #/
    started = 1;
    if (isdefined(self.script_int)) {
        started = self.script_int != 0;
    }
    if (started) {
        soundloopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
    }
    if (notifyname != "") {
        for (;;) {
            level waittill(notifyname);
            if (started) {
                soundstoploopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
            } else {
                soundloopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
            }
            started = !started;
        }
    }
}

