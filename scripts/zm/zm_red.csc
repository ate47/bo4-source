#using scripts\zm\zm_red_oracle_boons;
#using scripts\zm\zm_red_main_quest;
#using scripts\zm\zm_red_ww_quests;
#using scripts\zm\zm_red_util;
#using script_41a75e0d79b62736;
#using scripts\zm\zm_red_trap_boiling_bath;
#using scripts\zm\zm_red_power_quest;
#using scripts\zm\zm_red_pap_quest;
#using scripts\zm\zm_red_fasttravel;
#using scripts\zm\zm_red_challenges;
#using scripts\zm\zm_red_boss_battle;
#using scripts\zm\ai\zm_ai_gegenees;
#using scripts\zm\weapons\zm_weap_hand_charon;
#using scripts\zm\weapons\zm_weap_hand_hemera;
#using scripts\zm\weapons\zm_weap_hand_gaia;
#using scripts\zm\weapons\zm_weap_hand_ouranos;
#using scripts\zm\weapons\zm_weap_thunderstorm;
#using scripts\zm\weapons\zm_weap_riotshield;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_wallbuy;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_audio_sq;
#using scripts\zm_common\zm;
#using scripts\zm_common\load;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\beam_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;

#namespace zm_red;

// Namespace zm_red/zm_red
// Params 0, eflags: 0x2
// Checksum 0x6242c8c0, Offset: 0x480
// Size: 0x22
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
}

// Namespace zm_red/level_init
// Params 1, eflags: 0x40
// Checksum 0x1b228df2, Offset: 0x4b0
// Size: 0x4dc
function event_handler[level_init] main(eventstruct) {
    clientfield::register("clientuimodel", "player_lives", 16000, 2, "int", undefined, 0, 0);
    clientfield::register("scriptmover", "" + #"register_pegasus", 16000, 1, "counter", &register_pegasus, 0, 0);
    clientfield::register("scriptmover", "" + #"medusa_eyes", 16000, 1, "int", &function_deaba617, 0, 0);
    clientfield::register("scriptmover", "" + #"special_target", 16000, 1, "int", &function_adad910c, 0, 0);
    clientfield::register("actor", "" + #"hash_2856f87ecdfaf62", 16000, 1, "counter", &function_f02d282d, 0, 0);
    clientfield::register("actor", "" + #"hash_1bdce857fd614cef", 16000, 1, "counter", &function_ef690ed4, 0, 0);
    clientfield::register("world", "" + #"postfx_play", 16000, 2, "int", &function_ea4a65c1, 0, 0);
    clientfield::register("world", "" + #"hash_71f9fcfb2cd84a9c", 16000, 1, "int", &function_b16ffc7a, 0, 0);
    clientfield::register("toplayer", "" + #"eye_vignette", 16000, 1, "int", &function_3b118f17, 0, 0);
    level._uses_default_wallbuy_fx = 1;
    level._uses_sticky_grenades = 1;
    level._uses_taser_knuckles = 1;
    level.var_d0ab70a2 = #"gamedata/weapons/zm/zm_red_weapons.csv";
    level.var_5603a802 = "pstfx_gaussian_blur";
    level._effect[#"fasttravel_rail_1p"] = #"hash_51fd09e47e0cd679";
    level._effect[#"fasttravel_rail_3p"] = #"hash_51fd09e47e0cd679";
    level._effect[#"fasttravel_rail_travel"] = #"hash_51fd09e47e0cd679";
    zm_red_trap_boiling_bath::init();
    namespace_f2050961::init();
    zm_red_ww_quests::init();
    zm_red_pap_quest::init_clientfield();
    zm_red_power_quest::init();
    zm_red_fasttravel::init();
    zm_red_main_quest::init();
    zm_red_challenges::init();
    zm_red_util::init();
    red_boss_battle::init();
    zm_audio_sq::init();
    load::main();
    zm_red_fasttravel::main();
    util::waitforclient(0);
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0x59a93f74, Offset: 0x998
// Size: 0x1a4
function function_deaba617(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval == 1) {
        n_val = 0;
        self playrenderoverridebundle(#"hash_589cf36f110e3f4a");
        for (i = 0; i < 20; i++) {
            if (isdefined(self)) {
                self function_78233d29(#"hash_589cf36f110e3f4a", "", "DNI Glow", n_val);
            }
            wait 0.05;
            n_val += 0.1;
        }
        if (isdefined(self)) {
            self function_78233d29(#"hash_589cf36f110e3f4a", "", "DNI Glow", 1);
        }
        return;
    }
    if (isdefined(self)) {
        self stoprenderoverridebundle(#"hash_589cf36f110e3f4a");
        self function_78233d29(#"hash_589cf36f110e3f4a", "", "DNI Glow", 0);
    }
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0xbb50533d, Offset: 0xb48
// Size: 0xf4
function function_3b118f17(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval == 1) {
        self thread postfx::playpostfxbundle(#"hash_5e6d2d91ca059a03");
        self thread postfx::playpostfxbundle(#"hash_6422033e84a54e2d");
        level waittill(#"pstfx_off");
        self thread postfx::exitpostfxbundle(#"hash_5e6d2d91ca059a03");
        self thread postfx::exitpostfxbundle(#"hash_6422033e84a54e2d");
    }
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0xa6fd672e, Offset: 0xc48
// Size: 0x494
function function_ea4a65c1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        forcestreammaterial("mtl_postfx_dangerdog_01");
        forcestreammaterial("mtl_postfx_dangerdog_02");
        forcestreammaterial("mtl_postfx_dangerdog_03");
        forcestreammaterial("mtl_postfx_dangerdog_04");
        forcestreammaterial("mtl_postfx_dangerdog_05");
        return;
    }
    if (newval == 2) {
        forcestreammaterial("mtl_postfx_dangerdog_16");
        forcestreammaterial("mtl_postfx_dangerdog_17");
        forcestreammaterial("mtl_postfx_dangerdog_18");
        forcestreammaterial("mtl_postfx_dangerdog_19");
        forcestreammaterial("mtl_postfx_dangerdog_20");
        forcestreammaterial("mtl_postfx_dangerdog_21");
        forcestreammaterial("mtl_postfx_dangerdog_22");
        return;
    }
    if (newval == 3) {
        forcestreammaterial("mtl_postfx_dangerdog_06");
        forcestreammaterial("mtl_postfx_dangerdog_07");
        forcestreammaterial("mtl_postfx_dangerdog_08");
        forcestreammaterial("mtl_postfx_dangerdog_09");
        forcestreammaterial("mtl_postfx_dangerdog_10");
        forcestreammaterial("mtl_postfx_dangerdog_11");
        forcestreammaterial("mtl_postfx_dangerdog_12");
        forcestreammaterial("mtl_postfx_dangerdog_13");
        forcestreammaterial("mtl_postfx_dangerdog_14");
        forcestreammaterial("mtl_postfx_dangerdog_15");
        return;
    }
    stopforcestreamingmaterial("mtl_postfx_dangerdog_01");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_02");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_03");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_04");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_05");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_06");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_07");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_08");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_09");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_10");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_11");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_12");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_13");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_14");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_15");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_16");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_17");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_18");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_19");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_20");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_21");
    stopforcestreamingmaterial("mtl_postfx_dangerdog_22");
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0xbc956469, Offset: 0x10e8
// Size: 0x94
function function_adad910c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self playrenderoverridebundle(#"hash_49e717c029b47c98");
        return;
    }
    self stoprenderoverridebundle(#"hash_49e717c029b47c98");
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0x52af0808, Offset: 0x1188
// Size: 0x4a
function register_pegasus(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.var_1c8295a8 = self;
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0xa1ee68fd, Offset: 0x11e0
// Size: 0x5c
function function_f02d282d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self thread function_ade26abd(#"left");
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0xa46d48f5, Offset: 0x1248
// Size: 0x5c
function function_ef690ed4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self thread function_ade26abd(#"right");
}

// Namespace zm_red/zm_red
// Params 1, eflags: 0x1 linked
// Checksum 0x1200bb11, Offset: 0x12b0
// Size: 0xf4
function function_ade26abd(str_dir) {
    self endon(#"death");
    var_10d4f67d = level.var_1c8295a8;
    if (!isdefined(var_10d4f67d)) {
        return;
    }
    var_10d4f67d endon(#"death");
    str_tag = "j_wingulna_le";
    if (str_dir == #"right") {
        str_tag = "j_wingulna_ri";
    }
    level beam::launch(var_10d4f67d, str_tag, self, "j_spine4", "beam8_zm_red_peg_lightning_strike", 1);
    waitframe(1);
    level beam::kill(var_10d4f67d, str_tag, self, "j_spine4", "beam8_zm_red_peg_lightning_strike");
}

// Namespace zm_red/zm_red
// Params 7, eflags: 0x1 linked
// Checksum 0xb0e524d2, Offset: 0x13b0
// Size: 0x64
function function_b16ffc7a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        function_9362afb8(localclientnum, "vis_boss_arena");
    }
}

