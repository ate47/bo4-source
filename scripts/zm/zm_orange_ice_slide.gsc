// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_audio.gsc;
#include scripts/core_common/gestures.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace zm_orange_ice_slide;

// Namespace zm_orange_ice_slide/zm_orange_ice_slide
// Params 0, eflags: 0x1 linked
// Checksum 0x17e3742c, Offset: 0xd8
// Size: 0x5a
function init() {
    var_fa0bcfcc = getent("ice_slide", "targetname");
    var_fa0bcfcc callback::on_trigger(&function_a8fc3bf1);
    var_fa0bcfcc.var_80360a02 = 0;
}

// Namespace zm_orange_ice_slide/zm_orange_ice_slide
// Params 1, eflags: 0x1 linked
// Checksum 0x90b60430, Offset: 0x140
// Size: 0x384
function function_a8fc3bf1(s_info) {
    e_player = s_info.activator;
    if (isalive(e_player) && !(isdefined(e_player.var_e0348559) && e_player.var_e0348559)) {
        e_player endon(#"death");
        var_e098d474 = util::spawn_model(#"tag_origin", e_player gettagorigin("tag_origin"), e_player gettagangles("tag_origin"));
        if (isdefined(var_e098d474)) {
            var_e098d474 linkto(e_player, "tag_origin");
            var_e098d474 playloopsound("evt_ice_slide");
        }
        if (self.var_80360a02 === 0 && e_player zm_audio::can_speak()) {
            self.var_80360a02 = 1;
            self.var_4ed9c192 = e_player;
            e_player thread zm_audio::create_and_play_dialog(#"ice", #"slide_start");
        }
        e_player allowstand(0);
        e_player allowjump(0);
        e_player allowprone(0);
        stance = e_player getstance();
        e_player.var_e0348559 = 1;
        e_player thread gestures::function_b6cc48ed("ges_force_slide_loop", undefined, 1);
        while (isalive(e_player) && e_player istouching(self)) {
            waitframe(1);
        }
        if (self.var_4ed9c192 === e_player) {
            self.var_4ed9c192 = e_player;
            e_player thread function_9565c969();
            self.var_4ed9c192 = undefined;
        }
        if (isdefined(e_player)) {
            e_player.var_e0348559 = 0;
            e_player allowstand(1);
            e_player allowjump(1);
            e_player allowprone(1);
            if (isalive(e_player)) {
                e_player stopgestureviewmodel("ges_force_slide_loop", 0.1, 0);
                if (isdefined(stance)) {
                    e_player setstance(stance);
                }
            }
        }
        if (isdefined(var_e098d474)) {
            var_e098d474 delete();
        }
    }
}

// Namespace zm_orange_ice_slide/zm_orange_ice_slide
// Params 0, eflags: 0x1 linked
// Checksum 0x3d4e93b, Offset: 0x4d0
// Size: 0x5c
function function_9565c969() {
    while (!self zm_audio::can_speak()) {
        waitframe(1);
    }
    self zm_audio::create_and_play_dialog(#"ice", #"slide_end");
}

