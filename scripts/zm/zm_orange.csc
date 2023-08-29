// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_orange_trials.csc;
#include scripts/zm/zm_orange_audiologs.csc;
#include scripts/zm/zm_orange_ww_quest.csc;
#include scripts/zm/zm_orange_water.csc;
#include scripts/zm/zm_orange_pap.csc;
#include scripts/zm/zm_orange_mq_soapstone.csc;
#include scripts/zm/zm_orange_mq_mgr.csc;
#include scripts/zm/zm_orange_lighthouse.csc;
#include scripts/zm/zm_orange_fx.csc;
#include scripts/zm/zm_orange_freeze_trap.csc;
#include script_1edaf4333ed0bece;
#include scripts/zm/zm_orange_ee_yellow_snow.csc;
#include scripts/zm/zm_orange_ee_tundragun.csc;
#include scripts/zm/zm_orange_ee_dynamite.csc;
#include scripts/zm/zm_orange_ee_misc.csc;
#include scripts/zm/zm_orange_challenges.csc;
#include scripts/zm/weapons/zm_weap_flamethrower.csc;
#include scripts/zm/weapons/zm_weap_gravityspikes.csc;
#include scripts/zm/weapons/zm_weap_katana.csc;
#include scripts/zm/weapons/zm_weap_minigun.csc;
#include scripts/zm/weapons/zm_weap_cymbal_monkey.csc;
#include scripts/zm/weapons/zm_weap_riotshield.csc;
#include script_5fb8da2731850d9e;
#include scripts/zm_common/zm_pack_a_punch.csc;
#include scripts/zm_common/zm_trial.csc;
#include scripts/zm_common/zm_characters.csc;
#include scripts/zm/zm_orange_sound.csc;
#include scripts/zm_common/zm_ui_inventory.csc;
#include scripts/zm_common/zm_weapons.csc;
#include scripts/zm_common/zm_wallbuy.csc;
#include scripts/zm_common/zm_utility.csc;
#include scripts/zm_common/zm_magicbox.csc;
#include scripts/zm_common/zm_loadout.csc;
#include scripts/zm_common/zm_hud.csc;
#include scripts/zm_common/zm_audio.csc;
#include scripts/zm_common/zm.csc;
#include scripts/zm_common/load.csc;
#include scripts/zm_common/callbacks.csc;
#include scripts/zm/zm_orange_fasttravel_ziplines.csc;
#include script_84f5590d2ac48f8;
#include scripts/core_common/exploder_shared.csc;
#include scripts/core_common/scene_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/trigger_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/flag_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/array_shared.csc;

#namespace zm_orange;

// Namespace zm_orange/zm_orange
// Params 0, eflags: 0x2
// Checksum 0x4fbf7d9a, Offset: 0x4d8
// Size: 0x22
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
}

// Namespace zm_orange/level_init
// Params 1, eflags: 0x40
// Checksum 0xb2d20871, Offset: 0x508
// Size: 0x3fc
function event_handler[level_init] main(eventstruct) {
    full_screen_movie::register("full_screen_movie");
    clientfield::register("actor", "sndActorUnderwater", 28000, 1, "int", &sndactorunderwater, 0, 1);
    level.setupcustomcharacterexerts = &setup_personality_character_exerts;
    level._effect[#"headshot"] = "_t6/impacts/fx_flesh_hit";
    level._effect[#"headshot_nochunks"] = "_t6/misc/fx_zombie_bloodsplat";
    level._effect[#"bloodspurt"] = "_t6/misc/fx_zombie_bloodspurt";
    level._effect[#"animscript_gib_fx"] = "zombie/fx_blood_torso_explo_zmb";
    level._effect[#"animscript_gibtrail_fx"] = "_t6/trail/fx_trail_blood_streak";
    level thread zm_orange_fx::init();
    level._uses_default_wallbuy_fx = 1;
    level._uses_sticky_grenades = 1;
    level._uses_taser_knuckles = 1;
    level.var_d0ab70a2 = #"hash_544f128e274c84e0";
    level.var_4016a739 = vectorscale((0, 1, 0), 90);
    level zm_orange_challenges::init();
    level zm_orange_ee_misc::preload();
    level zm_orange_ee_dynamite::init();
    level zm_orange_ee_tundragun::init();
    level zm_orange_ee_yellow_snow::preload();
    level namespace_6036de69::init();
    level zm_orange_fasttravel_ziplines::init();
    level zm_orange_freeze_trap::init();
    level zm_orange_mq_mgr::preload();
    level zm_orange_mq_soapstone::preload();
    level zm_orange_pap::init();
    level zm_orange_water::init();
    level zm_orange_ww_quest::init();
    level thread zm_orange_sound::main();
    level zm_orange_audiologs::preload();
    level zm_orange_trials::preload();
    load::main();
    level thread setup_personality_character_exerts();
    level thread zm_orange_challenges::main();
    level thread zm_orange_water::main();
    exploder::exploder("lgt_vending_mulekick_on");
    util::waitforclient(0);
    level thread function_b8da6f44();
    level thread function_72f1cddb();
}

// Namespace zm_orange/zm_orange
// Params 0, eflags: 0x1 linked
// Checksum 0x22a05eeb, Offset: 0x910
// Size: 0x152
function function_b8da6f44() {
    level._effect[#"hash_2bba72fdcc5508b5"] = #"hash_1e8cb303d3103833";
    level._effect[#"chest_light_closed"] = #"hash_602f075818a2fb2e";
    level._effect[#"hash_19f4dd97cbb87594"] = #"hash_2f7533f7f5b59f7c";
    level._effect[#"hash_246062f68a34e289"] = #"hash_61b9b9ada5bb46b1";
    level._effect[#"hash_73c11d9bf55cbb6"] = #"hash_71e5e40c76a09b21";
    level._effect[#"hash_5239f7431d4c72ca"] = #"hash_200de2be21c77806";
    level._effect[#"hash_b6e7f724af1ad5b"] = #"hash_6e05ede771d9fb16";
}

// Namespace zm_orange/zm_orange
// Params 0, eflags: 0x1 linked
// Checksum 0x1ffd80, Offset: 0xa70
// Size: 0x2c
function function_72f1cddb() {
    zm_utility::function_beed5764("rob_zm_eyes_red", #"zm_ai/fx8_zombie_eye_glow_red");
}

// Namespace zm_orange/zm_orange
// Params 0, eflags: 0x1 linked
// Checksum 0x4fd2633, Offset: 0xaa8
// Size: 0x288
function setup_personality_character_exerts() {
    level.exert_sounds[17][#"playerbreathinsound"] = "vox_stuh_exert_sniper_hold";
    level.exert_sounds[18][#"playerbreathinsound"] = "vox_mist_exert_sniper_hold";
    level.exert_sounds[19][#"playerbreathinsound"] = "vox_marl_exert_sniper_hold";
    level.exert_sounds[20][#"playerbreathinsound"] = "vox_russ_exert_sniper_hold";
    level.exert_sounds[17][#"playerbreathoutsound"] = "vox_stuh_exert_sniper_exhale";
    level.exert_sounds[18][#"playerbreathoutsound"] = "vox_mist_exert_sniper_exhale";
    level.exert_sounds[19][#"playerbreathoutsound"] = "vox_marl_exert_sniper_exhale";
    level.exert_sounds[20][#"playerbreathoutsound"] = "vox_russ_exert_sniper_exhale";
    level.exert_sounds[17][#"playerbreathgaspsound"] = "vox_stuh_exert_sniper_gasp";
    level.exert_sounds[18][#"playerbreathgaspsound"] = "vox_mist_exert_sniper_gasp";
    level.exert_sounds[19][#"playerbreathgaspsound"] = "vox_marl_exert_sniper_gasp";
    level.exert_sounds[20][#"playerbreathgaspsound"] = "vox_russ_exert_sniper_gasp";
    level.exert_sounds[17][#"meleeswipesoundplayer"] = "vox_stuh_exert_punch_give";
    level.exert_sounds[18][#"meleeswipesoundplayer"] = "vox_mist_exert_punch_give";
    level.exert_sounds[19][#"meleeswipesoundplayer"] = "vox_marl_exert_punch_give";
    level.exert_sounds[20][#"meleeswipesoundplayer"] = "vox_russ_exert_punch_give";
}

// Namespace zm_orange/zm_orange
// Params 7, eflags: 0x1 linked
// Checksum 0xda93b0c8, Offset: 0xd38
// Size: 0x94
function sndactorunderwater(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self setsoundentcontext("water", "under");
    } else {
        self setsoundentcontext("water", "over");
    }
}

