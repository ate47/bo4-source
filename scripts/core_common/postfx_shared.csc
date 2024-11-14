#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;

#namespace postfx;

// Namespace postfx/postfx_shared
// Params 0, eflags: 0x2
// Checksum 0x98d999b0, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"postfx_bundle", &__init__, undefined, undefined);
}

// Namespace postfx/postfx_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xabb1ac02, Offset: 0xe0
// Size: 0x24
function __init__() {
    callback::on_localplayer_spawned(&localplayer_postfx_bundle_init);
}

// Namespace postfx/postfx_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9adc05d7, Offset: 0x110
// Size: 0x7c
function localplayer_postfx_bundle_init(localclientnum) {
    if (isdefined(self.postfxbundelsinited)) {
        return;
    }
    self.postfxbundelsinited = 1;
    self.playingpostfxbundle = "";
    self.forcestoppostfxbundle = 0;
    self.exitpostfxbundle = 0;
    /#
        self thread postfxbundledebuglisten();
        self thread function_764eb053();
    #/
}

/#

    // Namespace postfx/postfx_shared
    // Params 0, eflags: 0x0
    // Checksum 0xe6e58548, Offset: 0x198
    // Size: 0x210
    function postfxbundledebuglisten() {
        self endon(#"death");
        setdvar(#"scr_play_postfx_bundle", "<dev string:x38>");
        setdvar(#"scr_stop_postfx_bundle", "<dev string:x38>");
        setdvar(#"scr_exit_postfx_bundle", "<dev string:x38>");
        while (true) {
            playbundlename = getdvarstring(#"scr_play_postfx_bundle");
            if (playbundlename != "<dev string:x38>") {
                self thread playpostfxbundle(playbundlename);
                setdvar(#"scr_play_postfx_bundle", "<dev string:x38>");
            }
            stopbundlename = getdvarstring(#"scr_stop_postfx_bundle");
            if (stopbundlename != "<dev string:x38>") {
                self thread stoppostfxbundle(stopbundlename);
                setdvar(#"scr_stop_postfx_bundle", "<dev string:x38>");
            }
            var_38ce085 = getdvarstring(#"scr_exit_postfx_bundle");
            if (var_38ce085 != "<dev string:x38>") {
                self thread exitpostfxbundle(var_38ce085);
                setdvar(#"scr_exit_postfx_bundle", "<dev string:x38>");
            }
            wait 0.5;
        }
    }

    // Namespace postfx/postfx_shared
    // Params 0, eflags: 0x0
    // Checksum 0xe217f00a, Offset: 0x3b0
    // Size: 0x2b6
    function function_764eb053() {
        self endon(#"death");
        var_986c8888 = 0;
        var_4828f60f = 0;
        var_e0f0fb1d = "<dev string:x38>";
        ent = undefined;
        while (true) {
            showmodel = getdvarint(#"hash_56d8c90edb7a97b6", 0);
            showviewmodel = getdvarint(#"hash_65c459b02d95c9c9", 0);
            newspawn = 0;
            if (showmodel != var_986c8888) {
                if (showmodel > 0) {
                    if (!isdefined(ent)) {
                        newspawn = 1;
                        ent = util::spawn_model(self.localclientnum, "<dev string:x3b>");
                    }
                } else if (var_986c8888 > 0) {
                    if (isdefined(ent)) {
                        ent delete();
                        ent = undefined;
                    }
                }
                var_986c8888 = showmodel;
            }
            if ((newspawn || showmodel == 1) && isdefined(ent)) {
                ent.origin = self.origin + (0, 0, 70) + anglestoforward(self.angles) * 250;
            }
            bundlename = getdvarstring(#"cg_playrenderoverridebundle", "<dev string:x38>");
            if (bundlename != var_e0f0fb1d && isdefined(ent)) {
                ent stoprenderoverridebundle(var_e0f0fb1d);
                if (bundlename != "<dev string:x38>") {
                    ent playrenderoverridebundle(bundlename);
                }
            }
            if (showviewmodel && (showviewmodel != var_4828f60f || bundlename != var_e0f0fb1d)) {
                self stoprenderoverridebundle(var_e0f0fb1d);
                if (bundlename != "<dev string:x38>") {
                    self playrenderoverridebundle(bundlename);
                }
            }
            var_e0f0fb1d = bundlename;
            var_4828f60f = showviewmodel;
            waitframe(1);
        }
    }

#/

// Namespace postfx/postfx_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x11135e94, Offset: 0x670
// Size: 0x3c
function playpostfxbundle(playbundlename) {
    self thread watchentityshutdown(playbundlename);
    self codeplaypostfxbundle(playbundlename);
}

// Namespace postfx/postfx_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe6c4f3e2, Offset: 0x6b8
// Size: 0x84
function watchentityshutdown(playbundlename) {
    self notify("6433c543b3eba711" + playbundlename);
    self endon("6433c543b3eba711" + playbundlename);
    localclientnum = self.localclientnum;
    self waittill(#"death", #"finished_playing_postfx_bundle");
    codestoppostfxbundlelocal(localclientnum, playbundlename);
}

// Namespace postfx/postfx_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x973925d3, Offset: 0x748
// Size: 0x24
function stoppostfxbundle(bundlename) {
    self codestoppostfxbundle(bundlename);
}

// Namespace postfx/postfx_shared
// Params 3, eflags: 0x0
// Checksum 0xc2f6c9b8, Offset: 0x778
// Size: 0x3c
function function_c8b5f318(bundlename, constname, constvalue) {
    self function_116b95e5(bundlename, constname, constvalue);
}

// Namespace postfx/postfx_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x501c8811, Offset: 0x7c0
// Size: 0x22
function function_556665f2(bundlename) {
    return self function_d2cb869e(bundlename);
}

// Namespace postfx/postfx_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb03ce68d, Offset: 0x7f0
// Size: 0x24
function exitpostfxbundle(bundlename) {
    self function_3f145588(bundlename);
}

// Namespace postfx/postfx_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x437f0fba, Offset: 0x820
// Size: 0x11c
function setfrontendstreamingoverlay(localclientnum, system, enabled) {
    if (!isdefined(self.overlayclients)) {
        self.overlayclients = [];
    }
    if (!isdefined(self.overlayclients[localclientnum])) {
        self.overlayclients[localclientnum] = [];
    }
    self.overlayclients[localclientnum][system] = enabled;
    foreach (en in self.overlayclients[localclientnum]) {
        if (en) {
            enablefrontendstreamingoverlay(localclientnum, 1);
            return;
        }
    }
    enablefrontendstreamingoverlay(localclientnum, 0);
}

