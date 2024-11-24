#using script_4a375dc7d0573a9a;
#using scripts\core_common\audio_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_zodt8_tutorial;

// Namespace zm_zodt8_tutorial/level_init
// Params 1, eflags: 0x40
// Checksum 0x71b64ccf, Offset: 0x220
// Size: 0x3dc
function event_handler[level_init] main(eventstruct) {
    if (util::get_game_type() != "ztutorial") {
        return;
    }
    clientfield::register("actor", "tutorial_keyline_fx", 1, 2, "int", &tutorial_fx, 0, 0);
    clientfield::register("zbarrier", "tutorial_keyline_fx", 1, 2, "int", &function_a9c8f9d2, 0, 0);
    clientfield::register("item", "tutorial_keyline_fx", 1, 2, "int", &tutorial_fx, 0, 0);
    clientfield::register("scriptmover", "tutorial_keyline_fx", 1, 2, "int", &tutorial_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_1b509b0ba634a25a", 1, 1, "int", &function_7c8084eb, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_1390e08de02cbdc7", 1, 1, "int", &function_8057ebca, 0, 0);
    clientfield::register("worlduimodel", "hudItems.ztut.showLocation", 1, 1, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "hudItems.ztut.showPerks", 1, 1, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "hudItems.ztut.showEquipment", 1, 1, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "hudItems.ztut.showShield", 1, 1, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "hudItems.ztut.showSpecial", 1, 1, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "hudItems.ztut.showElixirs", 1, 1, "int", undefined, 0, 0);
    level._effect[#"hash_1b509b0ba634a25a"] = #"zombie/fx_ritual_barrier_defend_door_wide_zod_zmb";
    level._effect[#"hash_1390e08de02cbdc7"] = #"hash_5b773dbbac0012ff";
    zm_tut_hint_text::register("zm_tut_hint_text");
    callback::on_localclient_connect(&function_9fc8cc9c);
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 1, eflags: 0x1 linked
// Checksum 0x967438fb, Offset: 0x608
// Size: 0x19c
function function_9fc8cc9c(localclientnum) {
    do {
        wait 1;
    } while (!isdefined(getent(localclientnum, "altar_icon_0", "targetname")));
    for (i = 0; i < 4; i++) {
        mdl_icon = getent(localclientnum, "altar_icon_" + i, "targetname");
        if (isdefined(mdl_icon)) {
            switch (i) {
            case 0:
                mdl_icon setmodel(#"p8_zm_vapor_altar_icon_01_staminup");
                break;
            case 1:
                mdl_icon setmodel(#"p8_zm_vapor_altar_icon_01_bandolierbandit");
                break;
            case 2:
                mdl_icon setmodel(#"p8_zm_vapor_altar_icon_01_timeslip");
                break;
            case 3:
                mdl_icon setmodel(#"p8_zm_vapor_altar_icon_01_deadshot");
                break;
            }
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 7, eflags: 0x1 linked
// Checksum 0x58f61cff, Offset: 0x7b0
// Size: 0x154
function tutorial_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self playrenderoverridebundle(#"hash_2ef4d8e5fdbc8a08");
        if (self.model == "p8_fxanim_zm_vapor_altar_zeus_mod") {
            mdl_bird = getent(0, "zeus_bird_head", "targetname");
            mdl_bird playrenderoverridebundle(#"hash_2ef4d8e5fdbc8a08");
        }
        return;
    }
    if (newval == 2) {
        self stoprenderoverridebundle(#"hash_2ef4d8e5fdbc8a08");
        if (self.model == "p8_fxanim_zm_vapor_altar_zeus_mod") {
            mdl_bird = getent(0, "zeus_bird_head", "targetname");
            mdl_bird stoprenderoverridebundle(#"hash_2ef4d8e5fdbc8a08");
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 7, eflags: 0x1 linked
// Checksum 0x5373692a, Offset: 0x910
// Size: 0x13e
function function_a9c8f9d2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        n_pieces = self getnumzbarrierpieces();
        for (n_index = 0; n_index < n_pieces; n_index++) {
            e_piece = self zbarriergetpiece(n_index);
            e_piece playrenderoverridebundle(#"hash_2ef4d8e5fdbc8a08");
        }
        return;
    }
    if (newval == 2) {
        n_pieces = self getnumzbarrierpieces();
        for (n_index = 0; n_index < n_pieces; n_index++) {
            e_piece = self zbarriergetpiece(n_index);
            e_piece stoprenderoverridebundle(#"hash_2ef4d8e5fdbc8a08");
        }
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 7, eflags: 0x1 linked
// Checksum 0x353e2402, Offset: 0xa58
// Size: 0xba
function function_7c8084eb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_293d9904)) {
        stopfx(localclientnum, self.var_293d9904);
        self.var_293d9904 = undefined;
    }
    if (newval == 1) {
        self.var_293d9904 = util::playfxontag(localclientnum, level._effect[#"hash_1b509b0ba634a25a"], self, "tag_origin");
    }
}

// Namespace zm_zodt8_tutorial/zm_zodt8_tutorial
// Params 7, eflags: 0x1 linked
// Checksum 0xe2aa0759, Offset: 0xb20
// Size: 0x154
function function_8057ebca(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        v_forward = anglestoforward(self.angles);
        self.blocker_fx = playfx(localclientnum, level._effect[#"hash_1390e08de02cbdc7"], self.origin, v_forward);
        audio::playloopat(#"hash_7c4e89429c24b4bd", self.origin);
        return;
    }
    if (isdefined(self.blocker_fx)) {
        stopfx(localclientnum, self.blocker_fx);
        audio::stoploopat(#"hash_7c4e89429c24b4bd", self.origin);
        playsound(0, #"hash_2f2d6d08b47e6395", self.origin);
    }
}

