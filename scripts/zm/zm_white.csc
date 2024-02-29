// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_white_util.csc;
#using scripts\zm\weapons\zm_weap_flamethrower.csc;
#using scripts\zm\weapons\zm_weap_gravityspikes.csc;
#using scripts\zm\weapons\zm_weap_katana.csc;
#using scripts\zm\weapons\zm_weap_minigun.csc;
#using scripts\zm\weapons\zm_weap_cymbal_monkey.csc;
#using scripts\zm\weapons\zm_weap_riotshield.csc;
#using scripts\zm_common\zm_characters.csc;
#using scripts\zm\zm_white_sound.csc;
#using script_518e526a2898bf6d;
#using script_27a4aedb3d2a899b;
#using script_3ba495e039989116;
#using script_14e736d5e4272b3d;
#using script_102fa70a8153e81f;
#using script_412188df54bb77d9;
#using script_4deda6ab11ad22af;
#using scripts\zm\zm_white_special_rounds.csc;
#using scripts\zm\zm_white_main_quest.csc;
#using scripts\zm\zm_white_portals.csc;
#using scripts\zm\zm_white_toast.csc;
#using scripts\zm\zm_white_insanity_mode.csc;
#using script_28144a2871e71a78;
#using scripts\zm\zm_white_zstandard.csc;
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_wallbuy.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\load.csc;
#using scripts\core_common\lui_shared.csc;
#using script_84f5590d2ac48f8;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_white;

// Namespace zm_white/zm_white
// Params 0, eflags: 0x2
// Checksum 0xaf1070ff, Offset: 0x668
// Size: 0x22
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
}

// Namespace zm_white/level_init
// Params 1, eflags: 0x40
// Checksum 0xaddde21a, Offset: 0x698
// Size: 0x78c
function event_handler[level_init] main(eventstruct) {
    full_screen_movie::register("full_screen_movie");
    clientfield::register("clientuimodel", "player_lives", 1, 2, "int", undefined, 0, 0);
    level._effect[#"headshot"] = "_t6/impacts/fx_flesh_hit";
    level._effect[#"headshot_nochunks"] = "_t6/misc/fx_zombie_bloodsplat";
    level._effect[#"bloodspurt"] = "_t6/misc/fx_zombie_bloodspurt";
    level._effect[#"animscript_gib_fx"] = "zombie/fx_blood_torso_explo_zmb";
    level._effect[#"animscript_gibtrail_fx"] = "_t6/trail/fx_trail_blood_streak";
    level._effect[#"hash_4cee8d16fd03fab3"] = #"hash_d763bb85d068431";
    level._effect[#"hash_b6fb18d53b3ba8f"] = #"hash_2a09c05622f43005";
    level._effect[#"hash_50a4de8d221c0d88"] = #"hash_5088b0c20d6a9452";
    clientfield::register("scriptmover", "" + #"hash_28b770e7e782837", 1, 1, "int", &function_61c6d401, 0, 0);
    clientfield::register("world", "portal_map_magicbox_lights_init", 1, 1, "int", &portal_map_magicbox_lights_init, 0, 0);
    clientfield::register("world", "portal_map_start_chest1", 1, 1, "int", &portal_map_start_chest1, 0, 0);
    clientfield::register("world", "portal_map_start_chest2", 1, 1, "int", &portal_map_start_chest2, 0, 0);
    clientfield::register("world", "portal_map_green_backyard_chest", 1, 1, "int", &portal_map_green_backyard_chest, 0, 0);
    clientfield::register("world", "portal_map_yellow_backyard_chest", 1, 1, "int", &portal_map_yellow_backyard_chest, 0, 0);
    clientfield::register("world", "portal_map_bunker1_chest", 1, 1, "int", &portal_map_bunker1_chest, 0, 0);
    clientfield::register("world", "portal_map_bunker2_chest", 1, 1, "int", &portal_map_bunker2_chest, 0, 0);
    clientfield::register("world", "portal_map_fire_sale", 1, 1, "int", &portal_map_fire_sale, 0, 0);
    clientfield::register("world", "portal_map_cul_de_sac_chest", 1, 1, "int", &portal_map_cul_de_sac_chest, 0, 0);
    clientfield::register("world", "power_pbg_control", 1, 1, "int", &power_pbg_control, 0, 0);
    zm_white_insanity_mode::init_fx();
    zm_white_insanity_mode::init_clientfields();
    white_main_quest::init_fx();
    white_main_quest::init_clientfields();
    zm_white_toast::init_fx();
    zm_white_toast::init_clientfields();
    level._uses_default_wallbuy_fx = 1;
    level._uses_sticky_grenades = 1;
    level._uses_taser_knuckles = 1;
    level.zombiemode_using_doubletap_perk = 1;
    level.zombiemode_using_juggernaut_perk = 1;
    level.zombiemode_using_revive_perk = 1;
    level.zombiemode_using_sleightofhand_perk = 1;
    level.var_d0ab70a2 = #"gamedata/weapons/zm/zm_white_weapons.csv";
    level zm_white_zstandard::main();
    level namespace_7d8e6ec3::preload();
    level zm_white_special_rounds::register_clientfields();
    level zm_white_portals::init_clientfields();
    level namespace_a01a2431::preload();
    level namespace_87b5173f::init();
    level namespace_ca03bbb4::preload();
    level namespace_3b2b9e06::preload();
    level namespace_825eac6b::preload();
    level namespace_90b0490e::preload();
    level namespace_fddd83bd::init();
    load::main();
    level thread zm_white_sound::main();
    level thread zm_white_portals::init();
    level thread zm_white_special_rounds::init();
    level thread setup_personality_character_exerts();
    level thread function_b8da6f44();
    zm_utility::function_beed5764("rob_zm_eyes_blue_light", #"hash_7fcc925775fa9101");
    util::waitforclient(0);
}

// Namespace zm_white/zm_white
// Params 0, eflags: 0x1 linked
// Checksum 0x18251ee8, Offset: 0xe30
// Size: 0x16a
function function_b8da6f44() {
    level.var_4016a739 = vectorscale((0, 1, 0), 90);
    level._effect[#"hash_2bba72fdcc5508b5"] = #"hash_1e8cb303d3103833";
    level._effect[#"chest_light_closed"] = #"hash_602f075818a2fb2e";
    level._effect[#"hash_19f4dd97cbb87594"] = #"hash_2f7533f7f5b59f7c";
    level._effect[#"hash_246062f68a34e289"] = #"hash_61b9b9ada5bb46b1";
    level._effect[#"hash_73c11d9bf55cbb6"] = #"hash_71e5e40c76a09b21";
    level._effect[#"hash_5239f7431d4c72ca"] = #"hash_200de2be21c77806";
    level._effect[#"hash_b6e7f724af1ad5b"] = #"hash_6e05ede771d9fb16";
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x0
// Checksum 0x9c96e30e, Offset: 0xfa8
// Size: 0x2aa
function function_bc7eec87(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.a_s_fx)) {
        s_org = arraygetclosest(self.origin, struct::get_array("plasma_trap_org"));
        self.a_s_fx = struct::get_array(s_org.target);
    }
    switch (newval) {
    case 1:
        fx_id = level._effect[#"hash_4cee8d16fd03fab3"];
        break;
    case 2:
        fx_id = level._effect[#"hash_b6fb18d53b3ba8f"];
        break;
    case 3:
        fx_id = level._effect[#"hash_50a4de8d221c0d88"];
        break;
    }
    foreach (s_fx in self.a_s_fx) {
        if (isdefined(s_fx.fx_plasma)) {
            stopfx(localclientnum, s_fx.fx_plasma);
            s_fx.fx_plasma = undefined;
        }
    }
    if (isdefined(fx_id)) {
        foreach (s_fx in self.a_s_fx) {
            s_fx.fx_plasma = playfx(localclientnum, fx_id, s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
        }
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0xc7ec3906, Offset: 0x1260
// Size: 0x84
function function_61c6d401(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self playrenderoverridebundle("rob_zm_white_crate_clear");
    } else {
        self stoprenderoverridebundle("rob_zm_white_crate_clear");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0x90fb97b3, Offset: 0x12f0
// Size: 0x178
function portal_map_magicbox_lights_init(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    level.var_17199db2[0] = "tag_start_chest1";
    level.var_17199db2[1] = "tag_start_chest2";
    level.var_17199db2[2] = "tag_green_backyard_chest";
    level.var_17199db2[3] = "tag_yellow_backyard_chest";
    level.var_17199db2[4] = "tag_bunker1_chest";
    level.var_17199db2[5] = "tag_bunker2_chest";
    level.var_17199db2[6] = "tag_cul_de_sac_chest";
    foreach (var_e9739ac3 in level.var_17199db2) {
        function_86b85486(localclientnum, var_e9739ac3);
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0xa7f37a0d, Offset: 0x1470
// Size: 0x94
function portal_map_start_chest1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        function_d901bcc9(localclientnum, "tag_start_chest1");
    } else if (newval == 0) {
        function_86b85486(localclientnum, "tag_start_chest1");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0x717e491d, Offset: 0x1510
// Size: 0x94
function portal_map_start_chest2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        function_d901bcc9(localclientnum, "tag_start_chest2");
    } else if (newval == 0) {
        function_86b85486(localclientnum, "tag_start_chest2");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0x79b97f62, Offset: 0x15b0
// Size: 0x94
function portal_map_green_backyard_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        function_d901bcc9(localclientnum, "tag_green_backyard_chest");
    } else if (newval == 0) {
        function_86b85486(localclientnum, "tag_green_backyard_chest");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0xac745e33, Offset: 0x1650
// Size: 0x94
function portal_map_yellow_backyard_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        function_d901bcc9(localclientnum, "tag_yellow_backyard_chest");
    } else if (newval == 0) {
        function_86b85486(localclientnum, "tag_yellow_backyard_chest");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0xc451ce38, Offset: 0x16f0
// Size: 0x94
function portal_map_bunker1_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        function_d901bcc9(localclientnum, "tag_bunker1_chest");
    } else if (newval == 0) {
        function_86b85486(localclientnum, "tag_bunker1_chest");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0x5316b182, Offset: 0x1790
// Size: 0x94
function portal_map_bunker2_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        function_d901bcc9(localclientnum, "tag_bunker2_chest");
    } else if (newval == 0) {
        function_86b85486(localclientnum, "tag_bunker2_chest");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0x60d2818b, Offset: 0x1830
// Size: 0x94
function portal_map_cul_de_sac_chest(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        function_d901bcc9(localclientnum, "tag_cul_de_sac_chest");
    } else if (newval == 0) {
        function_86b85486(localclientnum, "tag_cul_de_sac_chest");
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0xcfee8430, Offset: 0x18d0
// Size: 0x28c
function portal_map_fire_sale(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (!isdefined(level.var_8f14a19)) {
        level.var_8f14a19 = getentarray(localclientnum, "portal_map", "targetname");
    }
    if (newval == 1) {
        foreach (var_35f97c42 in level.var_8f14a19) {
            foreach (var_acb45e05 in level.var_17199db2) {
                var_35f97c42 util::waittill_dobj(localclientnum);
                var_35f97c42 showpart(localclientnum, var_acb45e05);
            }
        }
    } else if (newval == 0) {
        foreach (var_35f97c42 in level.var_8f14a19) {
            foreach (var_acb45e05 in level.var_17199db2) {
                var_35f97c42 util::waittill_dobj(localclientnum);
                var_35f97c42 hidepart(localclientnum, var_acb45e05);
            }
        }
    }
}

// Namespace zm_white/zm_white
// Params 2, eflags: 0x1 linked
// Checksum 0xca0c8a40, Offset: 0x1b68
// Size: 0xf0
function function_d901bcc9(localclientnum, tag) {
    if (!isdefined(level.var_8f14a19)) {
        level.var_8f14a19 = getentarray(localclientnum, "portal_map", "targetname");
    }
    foreach (var_35f97c42 in level.var_8f14a19) {
        var_35f97c42 util::waittill_dobj(localclientnum);
        var_35f97c42 showpart(localclientnum, tag);
    }
}

// Namespace zm_white/zm_white
// Params 2, eflags: 0x1 linked
// Checksum 0x8d51bd4d, Offset: 0x1c60
// Size: 0xf0
function function_86b85486(localclientnum, tag) {
    if (!isdefined(level.var_8f14a19)) {
        level.var_8f14a19 = getentarray(localclientnum, "portal_map", "targetname");
    }
    foreach (var_35f97c42 in level.var_8f14a19) {
        var_35f97c42 util::waittill_dobj(localclientnum);
        var_35f97c42 hidepart(localclientnum, tag);
    }
}

// Namespace zm_white/zm_white
// Params 7, eflags: 0x1 linked
// Checksum 0x14cd79d7, Offset: 0x1d58
// Size: 0x84
function power_pbg_control(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval == 1) {
        setpbgactivebank(localclientnum, 4);
    } else {
        setpbgactivebank(localclientnum, 1);
    }
}

// Namespace zm_white/zm_white
// Params 0, eflags: 0x1 linked
// Checksum 0xf923d0ed, Offset: 0x1de8
// Size: 0x508
function setup_personality_character_exerts() {
    level.exert_sounds[5][#"playerbreathinsound"] = "vox_plr_5_exert_sniper_hold";
    level.exert_sounds[6][#"playerbreathinsound"] = "vox_plr_6_exert_sniper_hold";
    level.exert_sounds[7][#"playerbreathinsound"] = "vox_plr_7_exert_sniper_hold";
    level.exert_sounds[8][#"playerbreathinsound"] = "vox_plr_8_exert_sniper_hold";
    level.exert_sounds[13][#"playerbreathinsound"] = "vox_plr_5_exert_sniper_hold";
    level.exert_sounds[14][#"playerbreathinsound"] = "vox_plr_6_exert_sniper_hold";
    level.exert_sounds[15][#"playerbreathinsound"] = "vox_plr_7_exert_sniper_hold";
    level.exert_sounds[16][#"playerbreathinsound"] = "vox_plr_8_exert_sniper_hold";
    level.exert_sounds[5][#"playerbreathoutsound"] = "vox_plr_5_exert_sniper_exhale";
    level.exert_sounds[6][#"playerbreathoutsound"] = "vox_plr_6_exert_sniper_exhale";
    level.exert_sounds[7][#"playerbreathoutsound"] = "vox_plr_7_exert_sniper_exhale";
    level.exert_sounds[8][#"playerbreathoutsound"] = "vox_plr_8_exert_sniper_exhale";
    level.exert_sounds[13][#"playerbreathoutsound"] = "vox_plr_5_exert_sniper_exhale";
    level.exert_sounds[14][#"playerbreathoutsound"] = "vox_plr_6_exert_sniper_exhale";
    level.exert_sounds[15][#"playerbreathoutsound"] = "vox_plr_7_exert_sniper_exhale";
    level.exert_sounds[16][#"playerbreathoutsound"] = "vox_plr_8_exert_sniper_exhale";
    level.exert_sounds[5][#"playerbreathgaspsound"] = "vox_plr_5_exert_sniper_gasp";
    level.exert_sounds[6][#"playerbreathgaspsound"] = "vox_plr_6_exert_sniper_gasp";
    level.exert_sounds[7][#"playerbreathgaspsound"] = "vox_plr_7_exert_sniper_gasp";
    level.exert_sounds[8][#"playerbreathgaspsound"] = "vox_plr_8_exert_sniper_gasp";
    level.exert_sounds[13][#"playerbreathgaspsound"] = "vox_plr_5_exert_sniper_gasp";
    level.exert_sounds[14][#"playerbreathgaspsound"] = "vox_plr_6_exert_sniper_gasp";
    level.exert_sounds[15][#"playerbreathgaspsound"] = "vox_plr_7_exert_sniper_gasp";
    level.exert_sounds[16][#"playerbreathgaspsound"] = "vox_plr_8_exert_sniper_gasp";
    level.exert_sounds[5][#"meleeswipesoundplayer"] = "vox_plr_5_exert_punch_give";
    level.exert_sounds[6][#"meleeswipesoundplayer"] = "vox_plr_6_exert_punch_give";
    level.exert_sounds[7][#"meleeswipesoundplayer"] = "vox_plr_7_exert_punch_give";
    level.exert_sounds[8][#"meleeswipesoundplayer"] = "vox_plr_8_exert_punch_give";
    level.exert_sounds[13][#"meleeswipesoundplayer"] = "vox_plr_5_exert_punch_give";
    level.exert_sounds[14][#"meleeswipesoundplayer"] = "vox_plr_6_exert_punch_give";
    level.exert_sounds[15][#"meleeswipesoundplayer"] = "vox_plr_7_exert_punch_give";
    level.exert_sounds[16][#"meleeswipesoundplayer"] = "vox_plr_8_exert_punch_give";
}

