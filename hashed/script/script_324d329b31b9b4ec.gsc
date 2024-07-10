#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace ir_strobe;

// Namespace ir_strobe/namespace_f0840611
// Params 0, eflags: 0x0
// Checksum 0x8529f911, Offset: 0x130
// Size: 0xb4
function init_shared() {
    if (!isdefined(level.var_90058911)) {
        level.var_90058911 = {};
        clientfield::register("toplayer", "marker_state", 1, 2, "int", &marker_state_changed, 0, 0);
        level.var_9c4cdb79 = [];
    }
    forcestreamxmodel(#"hash_5f05548d8aa53dc1");
    forcestreamxmodel(#"hash_5770a33506bee5a4");
}

// Namespace ir_strobe/namespace_f0840611
// Params 1, eflags: 0x0
// Checksum 0x362e9652, Offset: 0x1f0
// Size: 0x15c
function updatemarkerthread(localclientnum) {
    self endon(#"death");
    player = self;
    localplayer = function_27673a7(localclientnum);
    if (player != localplayer) {
        return;
    }
    killstreakcorebundle = struct::get_script_bundle("killstreak", "killstreak_core");
    while (isdefined(player.markerobj)) {
        viewangles = getlocalclientangles(localclientnum);
        forwardvector = vectorscale(anglestoforward(viewangles), killstreakcorebundle.ksmaxairdroptargetrange);
        results = bullettrace(player geteye(), player geteye() + forwardvector, 0, player);
        player.markerobj.origin = results[#"position"];
        waitframe(1);
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 7, eflags: 0x0
// Checksum 0xcb7ce551, Offset: 0x358
// Size: 0x13c
function marker_state_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    player = self;
    killstreakcorebundle = struct::get_script_bundle("killstreak", "killstreak_core");
    if (newval > 0) {
        if (!isdefined(level.var_9c4cdb79[localclientnum])) {
            spawn_previs(localclientnum);
        }
    }
    if (newval > 0) {
        player thread previs(localclientnum, newval - 1);
    } else {
        player notify(#"stop_previs");
    }
    if (isdefined(player.markerobj) && !player.markerobj hasdobj(localclientnum)) {
        return;
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 1, eflags: 0x0
// Checksum 0xbdf79daf, Offset: 0x4a0
// Size: 0x94
function function_6f798989(var_a27f7ab4) {
    if (function_9d295a8c(self.localclientnum)) {
        localclientnum = self.localclientnum;
    } else {
        localclientnum = self getlocalclientnumber();
    }
    if (isdefined(localclientnum) && isdefined(level.var_9c4cdb79[localclientnum])) {
        level.var_9c4cdb79[localclientnum] hide();
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x0
// Checksum 0xf6c119f9, Offset: 0x540
// Size: 0xce
function previs(localclientnum, invalid) {
    self notify(#"stop_previs");
    self endoncallback(&function_6f798989, #"death", #"weapon_change", #"stop_previs");
    level.var_9c4cdb79[localclientnum] show();
    function_3e8d9b27(!invalid, localclientnum);
    while (true) {
        update_previs(localclientnum, invalid);
        waitframe(1);
    }
}

// Namespace ir_strobe/namespace_f0840611
// Params 1, eflags: 0x0
// Checksum 0x26a36292, Offset: 0x618
// Size: 0x76
function spawn_previs(localclientnum) {
    localplayer = function_5c10bd79(localclientnum);
    level.var_9c4cdb79[localclientnum] = spawn(localclientnum, (0, 0, 0), "script_model", localplayer getentitynumber());
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x0
// Checksum 0xd1dcf249, Offset: 0x698
// Size: 0x30c
function update_previs(localclientnum, invalid) {
    player = self;
    facing_angles = getlocalclientangles(localclientnum);
    forward = anglestoforward(facing_angles);
    up = anglestoup(facing_angles);
    weapon = getweapon("ir_strobe");
    velocity = function_711c258(forward, up, weapon);
    eye_pos = getlocalclienteyepos(localclientnum);
    if (isdefined(level.var_4970b0af) && level.var_4970b0af) {
        radius = 10;
        trace1 = bullettrace(eye_pos, eye_pos + vectorscale(forward, 300), 0, player, 1);
        if (trace1[#"fraction"] >= 1) {
            trace1 = bullettrace(trace1[#"position"], trace1[#"position"] + (0, 0, -1000), 0, player, 1);
        }
    } else {
        trace1 = function_e6ba3ec9(eye_pos, velocity, 0, weapon);
    }
    level.var_9c4cdb79[localclientnum].origin = trace1[#"position"] + vectorscale(trace1[#"normal"], 7);
    level.var_9c4cdb79[localclientnum].angles = (0, vectortoangles(forward)[1] + 90, 0);
    level.var_9c4cdb79[localclientnum].hitent = trace1[#"entity"];
    if (invalid) {
        player function_bf191832(0, (0, 0, 0), (0, 0, 0));
        return;
    }
    player function_bf191832(1, level.var_9c4cdb79[localclientnum].origin, level.var_9c4cdb79[localclientnum].angles);
}

// Namespace ir_strobe/namespace_f0840611
// Params 2, eflags: 0x0
// Checksum 0x83167a4c, Offset: 0x9b0
// Size: 0x174
function function_3e8d9b27(validlocation, localclientnum) {
    if (validlocation) {
        level.var_9c4cdb79[localclientnum] setmodel(#"hash_5f05548d8aa53dc1");
        if (isdefined(level.var_5af693e8)) {
            stopfx(localclientnum, level.var_5af693e8);
        }
        level.var_5af693e8 = function_239993de(localclientnum, "killstreaks/fx8_tankrobot_previs_valid", level.var_9c4cdb79[localclientnum], "tag_fx");
    } else {
        level.var_9c4cdb79[localclientnum] setmodel(#"hash_5770a33506bee5a4");
        if (isdefined(level.var_5af693e8)) {
            stopfx(localclientnum, level.var_5af693e8);
        }
        level.var_5af693e8 = function_239993de(localclientnum, "killstreaks/fx8_tankrobot_previs_invalid", level.var_9c4cdb79[localclientnum], "tag_fx");
    }
    level.var_9c4cdb79[localclientnum] notsolid();
}

