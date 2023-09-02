// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace gadget_radiation_field;

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0, eflags: 0x1 linked
// Checksum 0x66a49a8f, Offset: 0x290
// Size: 0x190
function init_shared() {
    clientfield::register("scriptmover", "cf_overclock_fx", 1, 1, "int", &function_e6cf396d, 0, 0);
    clientfield::register("scriptmover", "self_destruct_start", 1, 1, "int", &self_destruct_start, 0, 0);
    clientfield::register("scriptmover", "self_destruct_end", 1, 1, "int", &self_destruct_end, 0, 0);
    level.var_2e0bd467 = getscriptbundle("radiation_field_bundle");
    callback::on_localplayer_spawned(&function_be4b3e9a);
    level.var_d0df06e9 = [];
    level.var_17dcd732 = [];
    for (i = 0; i < getmaxlocalclients(); i++) {
        level.var_d0df06e9[i] = [];
        level.var_17dcd732[i] = [];
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 7, eflags: 0x1 linked
// Checksum 0xf6c0d771, Offset: 0x428
// Size: 0x436
function self_destruct_start(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    isfirstperson = function_d17ae3cc(localclientnum);
    if (!isdefined(self) || !isdefined(self.owner)) {
        return;
    }
    var_7e4d34a7 = self.owner getentitynumber();
    var_3880aff8 = self getentitynumber();
    function_6a1db576(localclientnum, var_7e4d34a7, var_3880aff8);
    localplayer = function_5c10bd79(localclientnum);
    if (newval) {
        self notify(#"stop_sounds");
        if (isdefined(isfirstperson) && isfirstperson && localplayer getentitynumber() === var_7e4d34a7) {
            sound = function_604c9983(localclientnum, "mpl_rad_field_critical_loop");
            self thread function_e9e14905(localclientnum, sound, 1);
            if (isdefined(level.var_2e0bd467.var_13ce982a)) {
                self stoprumble(localclientnum, level.var_2e0bd467.var_13ce982a);
            }
            if (isdefined(level.var_2e0bd467.var_bb74ddeb)) {
                function_fe0ad36e(localclientnum, level.var_2e0bd467.var_bb74ddeb);
            }
        } else {
            sound = self playloopsound("mpl_rad_field_critical_loop_3d");
            self thread function_e9e14905(localclientnum, sound, 0);
        }
        self.owner util::waittill_dobj(localclientnum);
        self function_a225797d(localclientnum, var_7e4d34a7, 1);
        /#
            function_1a7aaaa8(localclientnum, "<unknown string>" + self getentitynumber());
        #/
        if (isdefined(localplayer)) {
            if (isdefined(localplayer.var_a5afc54b)) {
                function_196e7c4b(localclientnum, localplayer.var_a5afc54b);
                localplayer.var_a5afc54b = undefined;
            }
            if (isdefined(self.owner)) {
                localplayer.var_a5afc54b = earthquake(localclientnum, level.var_2e0bd467.var_662bb5bd, 100000, self.owner.origin, level.var_2e0bd467.var_46698a3d, 0);
            }
        }
        level thread function_95252d1f(localclientnum, var_7e4d34a7, self);
    } else {
        self notify(#"stop_sounds");
        if (isdefined(isfirstperson) && isfirstperson && isdefined(self)) {
            self function_3caac9e(localclientnum);
        }
        if (isdefined(localplayer.var_a5afc54b)) {
            function_196e7c4b(localclientnum, localplayer.var_a5afc54b);
            localplayer.var_a5afc54b = undefined;
        }
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2, eflags: 0x0
// Checksum 0xc0779014, Offset: 0x868
// Size: 0x9c
function function_1a7aaaa8(localclientnum, text) {
    /#
        if (getdvarint(#"hash_4e684995fef4afd7", 0) != 0) {
            inkillcam = function_1cbf351b(localclientnum);
            println("<unknown string>" + text + (inkillcam ? "<unknown string>" : "<unknown string>"));
        }
    #/
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 3, eflags: 0x1 linked
// Checksum 0x4079e529, Offset: 0x910
// Size: 0x9c
function function_e9e14905(localclientnum, sound, islocal) {
    self waittill(#"death", #"stop_sounds");
    if (isdefined(islocal) && islocal) {
        function_d48752e(localclientnum, sound);
    } else if (isdefined(self) && isdefined(sound)) {
        self stoploopsound(sound);
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 7, eflags: 0x1 linked
// Checksum 0x579e9d73, Offset: 0x9b8
// Size: 0x216
function self_destruct_end(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    isfirstperson = function_d17ae3cc(localclientnum);
    if (newval) {
        if (isdefined(self.owner)) {
            var_7e4d34a7 = self.owner getentitynumber();
            var_3880aff8 = self getentitynumber();
            self.owner.nobloodoverlay = 0;
            function_6a1db576(localclientnum, var_7e4d34a7, var_3880aff8);
        }
        self notify(#"stop_sounds");
        if (isdefined(isfirstperson) && isfirstperson) {
            playsound(localclientnum, "mpl_rad_field_meltdown_2d");
        } else {
            self endon(#"death");
            self util::waittill_dobj(localclientnum);
            playsound(localclientnum, "mpl_rad_field_meltdown_3d", self.origin + vectorscale((0, 0, 1), 30));
        }
    } else {
        if (isdefined(isfirstperson) && isfirstperson && isdefined(self)) {
            self function_3caac9e(localclientnum);
        }
        player = function_5c10bd79(localclientnum);
        if (isdefined(player.var_a5afc54b)) {
            function_196e7c4b(localclientnum, player.var_a5afc54b);
            player.var_a5afc54b = undefined;
        }
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2, eflags: 0x1 linked
// Checksum 0xf003d35b, Offset: 0xbd8
// Size: 0x320
function function_671d7ad5(localclientnum, attacker_entnum) {
    self notify(#"hash_31934c905f88261b");
    self endon(#"hash_31934c905f88261b");
    self endon(#"death");
    var_4c6480bf = level.var_2e0bd467.var_641f6852 * level.var_2e0bd467.var_641f6852;
    var_572ced0c = level.var_2e0bd467.var_cbe3d2b8 * level.var_2e0bd467.var_cbe3d2b8;
    var_8acd204b = #"hash_1a49fb45be903460";
    var_daa90ad6 = #"hash_1cc8ef91832fa038";
    while (1) {
        player = function_5c10bd79(localclientnum);
        if (!isdefined(player) || !isalive(player)) {
            break;
        }
        dist2 = distance2dsquared(player.origin, self.origin);
        if (dist2 > var_4c6480bf) {
            if (isdefined(player.var_71545089)) {
                player stoploopsound(player.var_71545089);
                player.var_8992c69a = undefined;
                player.var_71545089 = undefined;
                player.var_2d887425 = undefined;
            }
        } else if (dist2 < var_572ced0c) {
            if (!isdefined(player.var_2d887425) || player.var_2d887425 != var_8acd204b) {
                if (isdefined(player.var_71545089)) {
                    player stoploopsound(player.var_71545089);
                }
                player.var_8992c69a = attacker_entnum;
                player.var_71545089 = player playloopsound(#"hash_1a49fb45be903460");
                player.var_2d887425 = var_8acd204b;
            }
        } else if (!isdefined(player.var_2d887425) || player.var_2d887425 != var_daa90ad6) {
            if (isdefined(player.var_71545089)) {
                player stoploopsound(player.var_71545089);
            }
            player.var_8992c69a = attacker_entnum;
            player.var_71545089 = player playloopsound(#"hash_1cc8ef91832fa038");
            player.var_2d887425 = var_daa90ad6;
        }
        waitframe(1);
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1, eflags: 0x1 linked
// Checksum 0xfe715f6c, Offset: 0xf00
// Size: 0x1ec
function function_be4b3e9a(localclientnum) {
    self function_3caac9e(localclientnum);
    if (isdefined(self) && isdefined(self.var_a5afc54b)) {
        function_196e7c4b(localclientnum, self.var_a5afc54b);
        self.var_a5afc54b = undefined;
    }
    if (self postfx::function_556665f2("pstfx_radiation_dot")) {
        self postfx::stoppostfxbundle("pstfx_radiation_dot");
    }
    thread function_7bf69748(localclientnum);
    if (self function_da43934d()) {
        var_7e4d34a7 = self getentitynumber();
        if (isdefined(self.var_98491eb6)) {
            killfx(localclientnum, self.var_98491eb6);
            self.var_98491eb6 = undefined;
        }
        if (isdefined(level.var_d0df06e9[localclientnum][var_7e4d34a7])) {
            killfx(localclientnum, level.var_d0df06e9[localclientnum][var_7e4d34a7]);
        }
        if (isdefined(level.var_17dcd732[localclientnum][var_7e4d34a7])) {
            level.var_17dcd732[localclientnum][var_7e4d34a7] delete();
        }
        if (self postfx::function_556665f2("pstfx_burn_loop")) {
            self postfx::stoppostfxbundle("pstfx_burn_loop");
        }
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1, eflags: 0x1 linked
// Checksum 0x9bdc044b, Offset: 0x10f8
// Size: 0x6c
function function_790443a8(localclientnum) {
    self postfx::playpostfxbundle("pstfx_radiation_dot");
    self.var_98491eb6 = util::playfxontag(localclientnum, #"hash_66860bac9e69a693", self, "j_spinelower");
    self thread function_ed4a5949();
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0, eflags: 0x1 linked
// Checksum 0x7e352cf7, Offset: 0x1170
// Size: 0x84
function function_ed4a5949() {
    self notify(#"hash_1493843137e99d87");
    self endon(#"hash_1493843137e99d87");
    level waittill(#"game_ended");
    if (isdefined(self) && self postfx::function_556665f2("pstfx_radiation_dot")) {
        self postfx::stoppostfxbundle("pstfx_radiation_dot");
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1, eflags: 0x1 linked
// Checksum 0xc16b8213, Offset: 0x1200
// Size: 0x1d8
function function_7bf69748(localclientnum) {
    self endon(#"death");
    self endon(#"disconnect");
    var_e60f94d0 = 0;
    var_4c6480bf = level.var_2e0bd467.var_641f6852 * level.var_2e0bd467.var_641f6852;
    var_572ced0c = level.var_2e0bd467.var_cbe3d2b8 * level.var_2e0bd467.var_cbe3d2b8;
    while (1) {
        dist2 = function_68a9578(localclientnum);
        if (dist2 > var_4c6480bf) {
            if (var_e60f94d0) {
                self postfx::exitpostfxbundle("pstfx_radiation_dot");
                if (isdefined(self.var_98491eb6)) {
                    stopfx(localclientnum, self.var_98491eb6);
                    self.var_98491eb6 = undefined;
                }
                var_e60f94d0 = 0;
            }
        } else if (dist2 < var_572ced0c) {
            if (!(isdefined(var_e60f94d0) && var_e60f94d0) && isplayer(self) && isalive(self)) {
                if (!isthirdperson(localclientnum)) {
                    if (!self isremotecontrolling(localclientnum)) {
                        function_790443a8(localclientnum);
                        var_e60f94d0 = 1;
                    }
                }
            }
        }
        wait(0.1);
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1, eflags: 0x1 linked
// Checksum 0xbd5598ab, Offset: 0x13e0
// Size: 0x74
function function_2e24ef27(owner) {
    self endon(#"death");
    while (1) {
        if (isdefined(owner)) {
            tagorigin = owner gettagorigin("tag_fx");
            if (isdefined(tagorigin)) {
                self.origin = tagorigin;
            }
        }
        waitframe(1);
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 3, eflags: 0x1 linked
// Checksum 0xf5cf9206, Offset: 0x1460
// Size: 0x374
function function_a225797d(localclientnum, var_7e4d34a7, phase2) {
    if (isdefined(self) && isdefined(self.owner)) {
        startpos = self.owner gettagorigin("tag_fx");
        if (!isdefined(startpos)) {
            startpos = self.owner.origin;
        }
    } else {
        return;
    }
    if (!isdefined(level.var_17dcd732[localclientnum][var_7e4d34a7])) {
        level.var_17dcd732[localclientnum][var_7e4d34a7] = spawn(localclientnum, startpos, "script_model");
        level.var_17dcd732[localclientnum][var_7e4d34a7] setmodel("tag_origin");
    }
    if (isdefined(level.var_17dcd732[localclientnum][var_7e4d34a7])) {
        level.var_17dcd732[localclientnum][var_7e4d34a7] util::waittill_dobj(localclientnum);
    }
    if (phase2) {
        if (self function_83973173()) {
            level.var_d0df06e9[localclientnum][var_7e4d34a7] = util::playfxontag(localclientnum, "weapon/fx8_hero_sig_radiation_phase2_friend_v4", level.var_17dcd732[localclientnum][var_7e4d34a7], "tag_origin");
        } else {
            level.var_d0df06e9[localclientnum][var_7e4d34a7] = util::playfxontag(localclientnum, "weapon/fx8_hero_sig_radiation_phase2_foe_v4", level.var_17dcd732[localclientnum][var_7e4d34a7], "tag_origin");
        }
    } else if (self function_83973173()) {
        level.var_d0df06e9[localclientnum][var_7e4d34a7] = util::playfxontag(localclientnum, "weapon/fx8_hero_sig_radiation_phase1_friend_v4", level.var_17dcd732[localclientnum][var_7e4d34a7], "tag_origin");
    } else {
        level.var_d0df06e9[localclientnum][var_7e4d34a7] = util::playfxontag(localclientnum, "weapon/fx8_hero_sig_radiation_phase1_foe_v4", level.var_17dcd732[localclientnum][var_7e4d34a7], "tag_origin");
    }
    setfxteam(localclientnum, level.var_d0df06e9[localclientnum][var_7e4d34a7], self.team);
    level.var_17dcd732[localclientnum][var_7e4d34a7] thread function_2e24ef27(self.owner);
    level.var_17dcd732[localclientnum][var_7e4d34a7] thread cleanup_fx(localclientnum, level.var_d0df06e9[localclientnum][var_7e4d34a7]);
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2, eflags: 0x1 linked
// Checksum 0x32384891, Offset: 0x17e0
// Size: 0x5c
function cleanup_fx(localclientnum, fx) {
    self waittill(#"delete", #"death");
    if (isdefined(fx)) {
        stopfx(localclientnum, fx);
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 7, eflags: 0x1 linked
// Checksum 0xf64ec8fe, Offset: 0x1848
// Size: 0x42c
function function_e6cf396d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self) || !isdefined(self.owner)) {
        return;
    }
    var_7e4d34a7 = self.owner getentitynumber();
    var_3880aff8 = self getentitynumber();
    function_6a1db576(localclientnum, var_7e4d34a7, var_3880aff8);
    /#
        function_1a7aaaa8(localclientnum, "<unknown string>" + self getentitynumber());
    #/
    if (newval) {
        wait(0.2);
        if (isdefined(self) && isdefined(self.owner)) {
            self.owner.nobloodoverlay = 1;
            self.owner util::waittill_dobj(localclientnum);
            if (isdefined(self) && isdefined(self.owner)) {
                if (!self function_83973173()) {
                    self thread function_671d7ad5(localclientnum, self.owner getentitynumber());
                }
                self function_a225797d(localclientnum, var_7e4d34a7, 0);
                /#
                    function_1a7aaaa8(localclientnum, "<unknown string>" + self getentitynumber());
                #/
                player = function_5c10bd79(localclientnum);
                if (isdefined(player.var_a5afc54b)) {
                    function_196e7c4b(localclientnum, player.var_a5afc54b);
                    player.var_a5afc54b = undefined;
                }
                player.var_a5afc54b = earthquake(localclientnum, level.var_2e0bd467.var_e378ae56, 100000, self.owner.origin, level.var_2e0bd467.var_c09ec98c, 0);
                level thread function_95252d1f(localclientnum, var_7e4d34a7, self);
            }
        }
        if (isdefined(level.var_2e0bd467.var_13ce982a)) {
            player = function_5c10bd79(localclientnum);
            if (player getentitynumber() === var_7e4d34a7) {
                function_fe0ad36e(localclientnum, level.var_2e0bd467.var_13ce982a);
            }
        }
    } else {
        self notify(#"stop_sounds");
        player = function_5c10bd79(localclientnum);
        if (isdefined(player)) {
            if (player getentitynumber() == var_7e4d34a7) {
                player function_3caac9e(localclientnum);
            }
            if (isdefined(player.var_a5afc54b)) {
                function_196e7c4b(localclientnum, player.var_a5afc54b);
                player.var_a5afc54b = undefined;
            }
        }
        /#
            function_1a7aaaa8(localclientnum, "<unknown string>" + self getentitynumber());
        #/
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 3, eflags: 0x1 linked
// Checksum 0xe2991021, Offset: 0x1c80
// Size: 0x184
function function_6a1db576(localclientnum, var_7e4d34a7, var_3880aff8) {
    inkillcam = function_1cbf351b(localclientnum);
    /#
        function_1a7aaaa8(localclientnum, "<unknown string>" + var_3880aff8);
    #/
    if (isdefined(level.var_17dcd732[localclientnum][var_7e4d34a7])) {
        /#
            function_1a7aaaa8(localclientnum, "<unknown string>" + var_3880aff8);
        #/
        level.var_17dcd732[localclientnum][var_7e4d34a7] delete();
    }
    if (isdefined(level.var_d0df06e9[localclientnum][var_7e4d34a7])) {
        /#
            function_1a7aaaa8(localclientnum, "<unknown string>" + var_3880aff8);
        #/
        stopfx(localclientnum, level.var_d0df06e9[localclientnum][var_7e4d34a7]);
        level.var_d0df06e9[localclientnum][var_7e4d34a7] = undefined;
    } else {
        /#
            function_1a7aaaa8(localclientnum, "<unknown string>" + var_3880aff8);
        #/
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1, eflags: 0x1 linked
// Checksum 0x9f502171, Offset: 0x1e10
// Size: 0x8c
function function_3caac9e(localclientnum) {
    if (isdefined(level.var_2e0bd467.var_13ce982a)) {
        self stoprumble(localclientnum, level.var_2e0bd467.var_13ce982a);
    }
    if (isdefined(level.var_2e0bd467.var_bb74ddeb)) {
        self stoprumble(localclientnum, level.var_2e0bd467.var_bb74ddeb);
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 3, eflags: 0x1 linked
// Checksum 0x6d8cb025, Offset: 0x1ea8
// Size: 0x29e
function function_95252d1f(localclientnum, var_7e4d34a7, script_mover) {
    event = #"hash_5eb05b2054c53425" + var_7e4d34a7;
    /#
        function_1a7aaaa8(localclientnum, "<unknown string>" + script_mover getentitynumber());
    #/
    level notify(event);
    level endon(event);
    var_3880aff8 = script_mover getentitynumber();
    script_mover waittill(#"death");
    function_6a1db576(localclientnum, var_7e4d34a7, var_3880aff8);
    localplayers = getlocalplayers();
    foreach (localplayer in localplayers) {
        if (!isdefined(localplayer)) {
            continue;
        }
        if (isdefined(localplayer.var_71545089) && localplayer.var_8992c69a === var_7e4d34a7) {
            localplayer stoploopsound(localplayer.var_71545089);
            localplayer.var_8992c69a = undefined;
            localplayer.var_71545089 = undefined;
            localplayer.var_2d887425 = undefined;
        }
    }
    player = function_5c10bd79(localclientnum);
    if (isdefined(player) && isdefined(player getentitynumber() == var_7e4d34a7) && player getentitynumber() == var_7e4d34a7) {
        player function_3caac9e(localclientnum);
        player.nobloodoverlay = 0;
    }
    if (isdefined(player) && isdefined(player.var_a5afc54b)) {
        function_196e7c4b(localclientnum, player.var_a5afc54b);
        player.var_a5afc54b = undefined;
    }
}

