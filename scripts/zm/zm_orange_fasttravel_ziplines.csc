#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_fasttravel;

#namespace zm_orange_fasttravel_ziplines;

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 0, eflags: 0x0
// Checksum 0x8159a84, Offset: 0xf8
// Size: 0xdc
function init() {
    clientfield::register("scriptmover", "clone_control", 24000, 1, "int", &function_f747c7cd, 0, 0);
    clientfield::register("toplayer", "hide_player_legs", 24000, 1, "int", &function_a0c1af51, 0, 0);
    clientfield::register("toplayer", "blur_post_fx", 24000, 1, "int", &play_blur_post_fx, 0, 1);
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 7, eflags: 0x0
// Checksum 0xebf78bc8, Offset: 0x1e0
// Size: 0x74
function function_f747c7cd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (self.owner == function_5c10bd79(localclientnum)) {
            self thread function_97adc67(localclientnum);
        }
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 1, eflags: 0x4
// Checksum 0x91795fb3, Offset: 0x260
// Size: 0x172
function private function_97adc67(localclientnum) {
    self endon(#"death", #"entityshutdown");
    util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    while (true) {
        if (self clientfield::get("clone_control")) {
            players = getlocalplayers();
            foreach (player in players) {
                if (isthirdperson(localclientnum)) {
                    self show();
                    player hide();
                    continue;
                }
                player show();
                self hide();
            }
        }
        waitframe(1);
    }
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 7, eflags: 0x4
// Checksum 0x54d80eac, Offset: 0x3e0
// Size: 0x94
function private function_a0c1af51(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval) {
        self hideviewlegs();
        return;
    }
    self showviewlegs();
}

// Namespace zm_orange_fasttravel_ziplines/zm_orange_fasttravel_ziplines
// Params 7, eflags: 0x0
// Checksum 0x281ef3a3, Offset: 0x480
// Size: 0x154
function play_blur_post_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval === 1) {
        if (!self postfx::function_556665f2("pstfx_speedblur")) {
            self postfx::playpostfxbundle("pstfx_speedblur");
        }
        self postfx::function_c8b5f318("pstfx_speedblur", #"blur", 0.05);
        self postfx::function_c8b5f318("pstfx_speedblur", #"inner mask", 0.3);
        self postfx::function_c8b5f318("pstfx_speedblur", #"outer mask", 0.8);
        return;
    }
    if (self postfx::function_556665f2("pstfx_speedblur")) {
        self postfx::stoppostfxbundle("pstfx_speedblur");
    }
}

