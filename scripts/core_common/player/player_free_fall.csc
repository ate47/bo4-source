// Atian COD Tools GSC decompiler test
#using script_7ca3324ffa5389e4;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\explode.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace player_free_fall;

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x2
// Checksum 0xde2270ed, Offset: 0x1c0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"player_free_fall", &__init__, undefined, undefined);
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x1 linked
// Checksum 0x49a6984b, Offset: 0x208
// Size: 0x13e
function __init__() {
    level._effect[#"hash_2d7e36f50e763c4a"] = #"hash_3cb3a6fc9eb00337";
    level._effect[#"hash_71f4fac26bef1997"] = #"hash_3919b64dc762cab2";
    callback::add_callback(#"freefall", &function_c9a18304);
    callback::add_callback(#"parachute", &function_26d46af3);
    animation::add_notetrack_func("player_free_fall::parachute_detach", &parachute_detach);
    level.add_trails = isdefined(getgametypesetting(#"hash_6cf5f53d1fbb1066")) && getgametypesetting(#"hash_6cf5f53d1fbb1066");
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x5 linked
// Checksum 0xd54f748a, Offset: 0x350
// Size: 0x5c
function private function_6aac1790(var_dbb94a) {
    if (isdefined(var_dbb94a) && !self isattached(var_dbb94a, "tag_weapon_right")) {
        self attach(var_dbb94a, "tag_weapon_right", 1);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x5 linked
// Checksum 0x77c0deb1, Offset: 0x3b8
// Size: 0x64
function private function_a43054a8() {
    parachute = self namespace_eb06e24d::get_parachute();
    var_dbb94a = parachute.("parachuteLit");
    if (isdefined(var_dbb94a)) {
        self util::lock_model(var_dbb94a);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x4
// Checksum 0x5b9f0711, Offset: 0x428
// Size: 0x64
function private function_1c10540b() {
    parachute = self namespace_eb06e24d::get_parachute();
    var_dbb94a = parachute.("parachuteLit");
    if (isdefined(var_dbb94a)) {
        self util::unlock_model(var_dbb94a);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x5 linked
// Checksum 0xa7d7d57e, Offset: 0x498
// Size: 0x74
function private function_40635b9a(var_dbb94a) {
    if (isdefined(var_dbb94a) && self isattached(var_dbb94a, "tag_weapon_right")) {
        self detach(var_dbb94a, "tag_weapon_right");
        self util::unlock_model(var_dbb94a);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x5 linked
// Checksum 0xeb1722f5, Offset: 0x518
// Size: 0x32c
function private function_26d46af3(eventstruct) {
    if (!(isplayer(self) || self isplayercorpse())) {
        return;
    }
    /#
        println(self.name + "<unknown string>" + eventstruct.parachute);
    #/
    parachute = self namespace_eb06e24d::get_parachute();
    var_dbb94a = parachute.("parachuteLit");
    if (eventstruct.parachute) {
        parachute_weapon = parachute.("parachute");
        if (isdefined(self.currentweapon)) {
            if (self.currentweapon === parachute_weapon) {
                self playrenderoverridebundle(#"hash_336cece53ae2342f");
            }
        }
        function_6aac1790(var_dbb94a);
    } else {
        self stoprenderoverridebundle(#"hash_336cece53ae2342f");
        self function_40635b9a(var_dbb94a);
    }
    if (self function_21c0fa55()) {
        self function_57738ae7(eventstruct.localclientnum, eventstruct.parachute);
        if (eventstruct.parachute) {
            self callback::add_entity_callback(#"oob", &on_oob);
        } else {
            function_6564e987(eventstruct.localclientnum);
            self callback::function_52ac9652(#"oob", &on_oob);
        }
    }
    if (eventstruct.parachute) {
        /#
            println(self.name + "<unknown string>");
        #/
        self callback::add_entity_callback(#"death", &cleanup_player);
        self function_fb8d00bf();
    } else {
        /#
            println(self.name + "<unknown string>");
        #/
        self callback::function_52ac9652(#"death", &cleanup_player);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x5 linked
// Checksum 0x474947f5, Offset: 0x850
// Size: 0xec
function private function_c9a18304(eventstruct) {
    if (!(isplayer(self) || self isplayercorpse())) {
        return;
    }
    /#
        println(self.name + "<unknown string>" + eventstruct.freefall);
    #/
    if (eventstruct.freefall) {
        if (eventstruct.var_695a7111) {
            self function_a43054a8();
        }
        self function_ec3388e3(eventstruct.localclientnum, eventstruct.var_695a7111);
    } else {
        self freefallend(eventstruct.localclientnum);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0xa093f4f, Offset: 0x948
// Size: 0x1c0
function function_3f6dfc34(localclientnum) {
    self notify("62720c265d658b90");
    self endon("62720c265d658b90");
    self endon(#"death", #"disconnect", #"freefallend");
    while (1) {
        waitframe(1);
        if (!self postfx::function_556665f2("pstfx_speedblur_wz")) {
            self postfx::playpostfxbundle("pstfx_speedblur_wz");
        }
        blur = function_e81eebd5(localclientnum);
        self function_116b95e5("pstfx_speedblur_wz", #"blur", blur.blur);
        self function_116b95e5("pstfx_speedblur_wz", #"inner mask", blur.innermask);
        self function_116b95e5("pstfx_speedblur_wz", #"outer mask", blur.outermask);
        self function_116b95e5("pstfx_speedblur_wz", #"x offset", blur.xoffset);
        self function_116b95e5("pstfx_speedblur_wz", #"y offset", blur.yoffset);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 5, eflags: 0x0
// Checksum 0x79b91a83, Offset: 0xb10
// Size: 0x4e
function function_cc5ed6ff(pitch, min_pitch, max_pitch, var_2ff50798, var_9988e8ec) {
    return (var_9988e8ec - var_2ff50798) / (max_pitch - min_pitch) * pitch + var_2ff50798;
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x0
// Checksum 0x24059925, Offset: 0xb68
// Size: 0xbe
function printspeed(viewpitch) {
    /#
        self endon(#"death", #"disconnect", #"freefallend");
        while (1) {
            vel = self getvelocity();
            speed = length(vel);
            iprintlnbold("<unknown string>" + speed + "<unknown string>" + viewpitch);
            wait(1);
        }
    #/
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x1 linked
// Checksum 0xc11d4ede, Offset: 0xc30
// Size: 0x134
function function_ec3388e3(localclientnum, var_695a7111) {
    if (self function_21c0fa55()) {
        self callback::add_entity_callback(#"oob", &on_oob);
        self thread function_3f6dfc34(localclientnum);
        self thread function_3a56fe1b(localclientnum);
        self thread function_2bdd64a4(localclientnum);
    }
    /#
        println(self.name + "<unknown string>" + var_695a7111);
    #/
    self callback::add_entity_callback(#"death", &cleanup_player);
    self thread function_e8a9e948(localclientnum, var_695a7111);
    self function_975ebf4d(localclientnum, var_695a7111);
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0xeabc98cf, Offset: 0xd70
// Size: 0x5c
function cleanup_player(params) {
    function_1c6573a4();
    function_f404a4cc();
    self callback::function_52ac9652(#"death", &cleanup_player);
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x1 linked
// Checksum 0x694b46de, Offset: 0xdd8
// Size: 0xcc
function on_oob(local_client_num, params) {
    if (params.old_val > 0 && params.new_val > 0) {
        return;
    }
    if (params.old_val == 0 && params.new_val == 0) {
        return;
    }
    if (params.old_val > 0) {
        function_6564e987(local_client_num);
    }
    if (params.new_val > 0) {
        function_be621383(local_client_num, getmapcenter());
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x0
// Checksum 0x93e218f3, Offset: 0xeb0
// Size: 0x3c
function function_7c653916(timesec) {
    self endon(#"death");
    wait(timesec);
    self delete();
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x1 linked
// Checksum 0x408323c2, Offset: 0xef8
// Size: 0x3b4
function function_e8a9e948(localclientnum, var_695a7111) {
    if (self function_21c0fa55()) {
        self endoncallback(&function_1c6573a4, #"death", #"freefallend");
        while (1) {
            vel = self getvelocity();
            speed = length(vel);
            angles = self getcamangles();
            viewpitch = 0;
            if (isdefined(angles)) {
                viewpitch = angles[0];
                if (viewpitch > 180) {
                    viewpitch = viewpitch - 360;
                }
            }
            if (speed < 2552) {
                if (isdefined(self.var_ba907ef1)) {
                    stopfx(localclientnum, self.var_ba907ef1);
                    self.var_ba907ef1 = undefined;
                }
                if (isdefined(self.var_890b1c43)) {
                    stopfx(localclientnum, self.var_890b1c43);
                    self.var_890b1c43 = undefined;
                }
                if (isdefined(self.var_9b4d40c7)) {
                    stopfx(localclientnum, self.var_9b4d40c7);
                    self.var_9b4d40c7 = undefined;
                }
                if (isdefined(self.var_e47e532c)) {
                    stopfx(localclientnum, self.var_e47e532c);
                    self.var_e47e532c = undefined;
                }
                waitframe(1);
                continue;
            }
            contrail_fx = namespace_eb06e24d::get_trailfx();
            if (isdefined(self.var_ba907ef1) && self.angles[2] < -20) {
                stopfx(localclientnum, self.var_ba907ef1);
                self.var_ba907ef1 = undefined;
            } else if (!isdefined(self.var_ba907ef1) && self.angles[2] > -20 && isdefined(contrail_fx.("contrails"))) {
                self.var_ba907ef1 = self play_fx_on_tag(localclientnum, contrail_fx.("contrails"), contrail_fx.var_ccb00fe4);
            }
            if (isdefined(self.var_890b1c43) && self.angles[2] > 20) {
                stopfx(localclientnum, self.var_890b1c43);
                self.var_890b1c43 = undefined;
            } else if (!isdefined(self.var_890b1c43) && self.angles[2] < 20 && isdefined(contrail_fx.("contrails"))) {
                self.var_890b1c43 = self play_fx_on_tag(localclientnum, contrail_fx.("contrails"), contrail_fx.var_6a36c78c);
            }
            waitframe(1);
        }
    }
}

// Namespace player_free_fall/player_free_fall
// Params 3, eflags: 0x1 linked
// Checksum 0x404fbda1, Offset: 0x12b8
// Size: 0x4a
function play_fx_on_tag(localclientnum, fx, tag = "tag_origin") {
    return self util::playfxontag(localclientnum, fx, self, tag);
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x1 linked
// Checksum 0xfd9116d6, Offset: 0x1310
// Size: 0x18a
function function_a993866(localclientnum, var_9a17b15c) {
    if (!level.add_trails) {
        return;
    }
    if (var_9a17b15c > 0) {
        self endon(#"death", #"freefallend", #"disconnect");
        wait(var_9a17b15c);
    }
    /#
        println(self.name + "<unknown string>" + var_9a17b15c);
    #/
    trail_fx = namespace_eb06e24d::get_trailfx();
    if (self function_21c0fa55()) {
        if (isdefined(trail_fx.("body_trail"))) {
            self.var_636d5543 = self play_fx_on_tag(localclientnum, trail_fx.("body_trail"), trail_fx.var_82aadb9b);
        }
    } else if (!isdefined(self.var_d7cbaf63)) {
        if (isdefined(trail_fx.("body_trail_3p"))) {
            tag = trail_fx.var_82aadb9b;
            self.var_d7cbaf63 = self play_fx_on_tag(localclientnum, trail_fx.("body_trail_3p"), trail_fx.var_82aadb9b);
        }
    }
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x1 linked
// Checksum 0xccb5329d, Offset: 0x14a8
// Size: 0x6c
function function_975ebf4d(localclientnum, var_695a7111) {
    if (var_695a7111) {
        var_9a17b15c = getdvarfloat(#"hash_2ff67a1af0e1deec", 1);
        self thread function_a993866(localclientnum, var_9a17b15c);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0xca6f5a1e, Offset: 0x1520
// Size: 0x106
function function_1c6573a4(notifyhash) {
    if (self function_21c0fa55()) {
        if (isdefined(self.var_ba907ef1)) {
            stopfx(self.localclientnum, self.var_ba907ef1);
            self.var_ba907ef1 = undefined;
        }
        if (isdefined(self.var_890b1c43)) {
            stopfx(self.localclientnum, self.var_890b1c43);
            self.var_890b1c43 = undefined;
        }
        if (isdefined(self.var_9b4d40c7)) {
            stopfx(self.localclientnum, self.var_9b4d40c7);
            self.var_9b4d40c7 = undefined;
        }
        if (isdefined(self.var_e47e532c)) {
            stopfx(self.localclientnum, self.var_e47e532c);
            self.var_e47e532c = undefined;
        }
    }
}

// Namespace player_free_fall/player_free_fall
// Params 3, eflags: 0x1 linked
// Checksum 0x769d9771, Offset: 0x1630
// Size: 0x80
function function_ba7365ff(localclientnum, height, fxid) {
    self endon(#"death", #"freefallend");
    while (1) {
        if (self.origin[2] < height) {
            self thread function_ada640c5(localclientnum, fxid);
            return;
        }
        wait(1);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0x8c911f77, Offset: 0x16b8
// Size: 0xec
function function_3a56fe1b(localclientnum) {
    if (!isdefined(self.var_1c0f821e)) {
        self.var_1c0f821e = play_fx_on_tag(localclientnum, level._effect[#"hash_2d7e36f50e763c4a"], "tag_origin");
        self thread function_ba7365ff(localclientnum, 6000, self.var_1c0f821e);
    }
    if (!isdefined(self.var_3e64d3fb)) {
        self.var_3e64d3fb = play_fx_on_tag(localclientnum, level._effect[#"hash_71f4fac26bef1997"], "tag_origin");
        self thread function_ba7365ff(localclientnum, 25000, self.var_3e64d3fb);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x1 linked
// Checksum 0xd1229bfe, Offset: 0x17b0
// Size: 0x34
function function_ada640c5(localclientnum, fxid) {
    if (isdefined(fxid)) {
        stopfx(localclientnum, fxid);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0xc8a23ecf, Offset: 0x17f0
// Size: 0x5e
function function_fe726f7(localclientnum) {
    function_ada640c5(localclientnum, self.var_1c0f821e);
    function_ada640c5(localclientnum, self.var_3e64d3fb);
    self.var_1c0f821e = undefined;
    self.var_3e64d3fb = undefined;
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0x46fca4f2, Offset: 0x1858
// Size: 0xa4
function function_2bdd64a4(localclientnum) {
    if (isdefined(self.var_b7756d91)) {
        self stoploopsound(self.var_b7756d91, 0);
        self.var_b7756d91 = undefined;
    }
    self.var_b7756d91 = self playloopsound("evt_skydive_wind_heavy", 1);
    if (self.origin[2] > 30000) {
        self playsound(localclientnum, #"hash_214da797e3f63ec5");
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0x87f6f667, Offset: 0x1908
// Size: 0x3e
function function_577c7bd0(localclientnum) {
    if (isdefined(self.var_b7756d91)) {
        self stoploopsound(self.var_b7756d91, 0);
        self.var_b7756d91 = undefined;
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x1 linked
// Checksum 0x1ecaf860, Offset: 0x1950
// Size: 0x19c
function freefallend(localclientnum) {
    self notify(#"freefallend");
    /#
        println(self.name + "<unknown string>");
    #/
    self callback::function_52ac9652(#"death", &cleanup_player);
    function_f404a4cc();
    if (self function_21c0fa55()) {
        function_6564e987(localclientnum);
        self callback::function_52ac9652(#"oob", &on_oob);
        self thread function_fe726f7(localclientnum);
        if (self postfx::function_556665f2("pstfx_speedblur_wz")) {
            self postfx::exitpostfxbundle("pstfx_speedblur_wz");
        }
        self thread audio::dorattle(self.origin, 200, 700);
        self playrumbleonentity(localclientnum, "damage_heavy");
        self thread function_577c7bd0(localclientnum);
    }
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x1 linked
// Checksum 0x5bdeb0c0, Offset: 0x1af8
// Size: 0xbe
function function_57738ae7(localclientnum, parachute) {
    if (isdefined(parachute) && parachute) {
        self.var_fcfda7c4 = self playloopsound("evt_skydive_wind_light", 1);
    } else {
        if (isdefined(self.var_fcfda7c4)) {
            self stoploopsound(self.var_fcfda7c4, 0);
            self.var_fcfda7c4 = undefined;
        }
        if (isdefined(self.var_b7756d91)) {
            self stoploopsound(self.var_b7756d91, 0);
            self.var_b7756d91 = undefined;
        }
    }
}

// Namespace player_free_fall/player_free_fall
// Params 2, eflags: 0x0
// Checksum 0x49447f0e, Offset: 0x1bc0
// Size: 0x6a
function ground_trace(startpos, owner) {
    trace_height = 50;
    trace_depth = 100;
    return bullettrace(startpos + (0, 0, trace_height), startpos - (0, 0, trace_depth), 0, owner);
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x1 linked
// Checksum 0xb9c7d2a1, Offset: 0x1c38
// Size: 0x44
function function_5789287a() {
    self endon(#"death");
    wait(1.75);
    self stoprenderoverridebundle(#"hash_336cece53ae2342f");
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x1 linked
// Checksum 0x2563ded8, Offset: 0x1c88
// Size: 0x84
function function_fb8d00bf() {
    local_client_num = self.localclientnum;
    if (level.add_trails) {
        trail_fx = self namespace_eb06e24d::get_trailfx();
        if (isdefined(trail_fx.("dropoff"))) {
            playfx(local_client_num, trail_fx.("dropoff"), self.origin);
        }
    }
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x1 linked
// Checksum 0xddace2ec, Offset: 0x1d18
// Size: 0x134
function parachute_detach() {
    local_client_num = self.localclientnum;
    chute = self namespace_eb06e24d::get_parachute();
    parachute = util::spawn_model(local_client_num, chute.parachutelit, self.origin, self.angles);
    if (isdefined(parachute)) {
        parachute linkto(self);
        parachute useanimtree("generic");
        parachute playrenderoverridebundle(#"hash_336cece53ae2342f");
        parachute thread function_5789287a();
        parachute animation::play(#"p8_fxanim_wz_parachute_player_anim", self.origin, self.angles);
        wait(1);
        parachute delete();
    }
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x1 linked
// Checksum 0xc7ac6dc3, Offset: 0x1e58
// Size: 0xc6
function function_f404a4cc() {
    if (isdefined(self.var_d7cbaf63)) {
        /#
            println(self.name + "<unknown string>");
        #/
        stopfx(self.localclientnum, self.var_d7cbaf63);
        self.var_d7cbaf63 = undefined;
    }
    if (isdefined(self.var_636d5543)) {
        /#
            println(self.name + "<unknown string>");
        #/
        stopfx(self.localclientnum, self.var_636d5543);
        self.var_636d5543 = undefined;
    }
}

