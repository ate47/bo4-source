// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/math_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/vehicle_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace hawk_mp;

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x2
// Checksum 0x20061fde, Offset: 0x1f8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hawk_mp", &__init__, undefined, undefined);
}

// Namespace hawk_mp/hawk
// Params 0, eflags: 0x1 linked
// Checksum 0x93dc7979, Offset: 0x240
// Size: 0x244
function __init__() {
    level.remote_missile_targets = [];
    level.var_70a07f6f = &function_70a07f6f;
    level.var_e656f88a = &function_e656f88a;
    level.var_dde557d5 = 0;
    level.hawk_settings = spawnstruct();
    level.hawk_settings.bundle = getscriptbundle("hawk_settings");
    for (ti = 0; ti < 6; ti++) {
        level.remote_missile_targets[ti] = spawnstruct();
        clientfield::register_luielem("hawk_target_lockon" + ti, "target_visible", 13000, 1, "int", undefined, 0, 0);
    }
    clientfield::register("vehicle", "hawk_range", 13000, 1, "int", &function_6701affc, 0, 1);
    vehicle::add_vehicletype_callback("veh_hawk_player_mp", &hawk_spawned);
    vehicle::function_2f97bc52("veh_hawk_player_mp", &function_fbdbb841);
    vehicle::function_2f97bc52("veh_hawk_player_far_range_mp", &function_1ed9ef6a);
    vehicle::function_cd2ede5("veh_hawk_player_mp", &function_500d3fa7);
    vehicle::function_cd2ede5("veh_hawk_player_far_range_mp", &function_fc1227ca);
    callback::on_localplayer_spawned(&on_local_player_spawned);
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x5 linked
// Checksum 0x8de05fd1, Offset: 0x490
// Size: 0x3c
function private hawk_spawned(localclientnum) {
    self.settingsbundle = level.hawk_settings.bundle;
    self thread function_23a9e4af(localclientnum);
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x5 linked
// Checksum 0xdda19f3b, Offset: 0x4d8
// Size: 0x17c
function private function_23a9e4af(localclientnum) {
    self endon(#"death");
    while (!isdefined(self.owner)) {
        wait(0.1);
    }
    if (isplayer(self.owner) && self.owner function_21c0fa55()) {
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.hawkActive"), 1);
        self setcompassicon("icon_minimap_hawk");
        self function_811196d1(0);
        self function_5e00861(1.5);
        self function_a5edb367(#"gold");
        self thread function_2e07be71(localclientnum);
        self thread function_5a1bf101(localclientnum);
    } else {
        self function_811196d1(1);
    }
}

// Namespace hawk_mp/hawk
// Params 3, eflags: 0x1 linked
// Checksum 0x42f437d0, Offset: 0x660
// Size: 0x7c
function function_70a07f6f(localclientnum, newval, fieldname) {
    for (ti = 0; ti < 6; ti++) {
        if (fieldname == "luielement.remote_missile_target_lockon" + ti + ".clientnum") {
            level.remote_missile_targets[ti].clientnum = newval;
        }
    }
}

// Namespace hawk_mp/hawk
// Params 3, eflags: 0x1 linked
// Checksum 0x32adfed7, Offset: 0x6e8
// Size: 0x96
function function_e656f88a(localclientnum, newval, fieldname) {
    for (ti = 0; ti < 6; ti++) {
        if (fieldname == "luielement.remote_missile_target_lockon" + ti + ".target_locked") {
            if (newval) {
                playsound(localclientnum, level.hawk_settings.bundle.tag_sound);
            }
        }
    }
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0x3a91369e, Offset: 0x788
// Size: 0x44
function function_fbdbb841(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_775073e(localclientnum);
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0xfb3fb64f, Offset: 0x7d8
// Size: 0x44
function function_1ed9ef6a(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_6367489e(localclientnum);
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0x2ade28b3, Offset: 0x828
// Size: 0x44
function function_500d3fa7(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_3759fcf(localclientnum);
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0xdd96dba9, Offset: 0x878
// Size: 0x44
function function_fc1227ca(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_3759fcf(localclientnum);
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xe52066da, Offset: 0x8c8
// Size: 0xb4
function on_local_player_spawned(localclientnum) {
    player = function_5c10bd79(localclientnum);
    vehicle = getplayervehicle(player);
    if (isdefined(vehicle) && (vehicle.vehicletype === #"veh_hawk_player_mp" || vehicle.vehicletype === #"veh_hawk_player_far_range_mp")) {
        return;
    }
    function_3759fcf(localclientnum);
}

// Namespace hawk_mp/hawk
// Params 7, eflags: 0x1 linked
// Checksum 0x39b211fc, Offset: 0x988
// Size: 0x104
function function_6701affc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (self.vehicletype != #"veh_hawk_player_mp" && self.vehicletype != #"veh_hawk_player_far_range_mp") {
        return;
    }
    player = function_5c10bd79(localclientnum);
    vehicle = getplayervehicle(player);
    if (isdefined(vehicle) && self == vehicle) {
        if (newval > 0) {
            function_6367489e(localclientnum);
        } else {
            function_775073e(localclientnum);
        }
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0x5485ae82, Offset: 0xa98
// Size: 0xe4
function function_775073e(localclientnum) {
    if (function_148ccc79(localclientnum, #"hash_63b0389eb9286669")) {
        codestoppostfxbundlelocal(localclientnum, #"hash_63b0389eb9286669");
    }
    if (!function_148ccc79(localclientnum, #"hash_594d5293046135ff")) {
        function_a837926b(localclientnum, #"hash_594d5293046135ff");
    }
    var_e39026ad = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.hawkWeakSignal");
    if (isdefined(var_e39026ad)) {
        setuimodelvalue(var_e39026ad, 0);
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xc2ff78d7, Offset: 0xb88
// Size: 0xec
function function_6367489e(localclientnum) {
    if (function_148ccc79(localclientnum, #"hash_594d5293046135ff")) {
        codestoppostfxbundlelocal(localclientnum, #"hash_594d5293046135ff");
    }
    if (!function_148ccc79(localclientnum, #"hash_63b0389eb9286669")) {
        function_a837926b(localclientnum, #"hash_63b0389eb9286669");
    }
    var_e39026ad = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.hawkWeakSignal");
    if (isdefined(var_e39026ad)) {
        setuimodelvalue(var_e39026ad, 1);
    }
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0x67ecc746, Offset: 0xc80
// Size: 0xec
function function_3759fcf(localclientnum, var_c5e2f09a) {
    if (function_148ccc79(localclientnum, #"hash_594d5293046135ff")) {
        codestoppostfxbundlelocal(localclientnum, #"hash_594d5293046135ff");
    }
    if (function_148ccc79(localclientnum, #"hash_63b0389eb9286669")) {
        codestoppostfxbundlelocal(localclientnum, #"hash_63b0389eb9286669");
    }
    var_e39026ad = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.hawkWeakSignal");
    if (isdefined(var_e39026ad)) {
        setuimodelvalue(var_e39026ad, 0);
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0x5c48ae2f, Offset: 0xd78
// Size: 0x15c
function function_2e07be71(localclientnum) {
    notifyparam = localclientnum + "_" + self getentitynumber();
    self notify("cfc7ae5c0a7a3ce" + notifyparam);
    self endon("cfc7ae5c0a7a3ce" + notifyparam);
    /#
        assert(isdefined(self.owner));
    #/
    var_3216cebd = self.owner getentitynumber();
    self waittill(#"death");
    if (isdefined(var_3216cebd)) {
        hawk_owner = getentbynum(localclientnum, var_3216cebd);
        if (isdefined(hawk_owner) && isplayer(hawk_owner) && hawk_owner function_21c0fa55()) {
            setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.hawkActive"), 0);
        }
    }
}

// Namespace hawk_mp/hawk
// Params 1, eflags: 0x1 linked
// Checksum 0xea7b787b, Offset: 0xee0
// Size: 0x8ee
function function_5a1bf101(localclientnum) {
    notifyparam = localclientnum + "_" + self getentitynumber();
    self notify("7f2100a11fa32baf" + notifyparam);
    self endon("7f2100a11fa32baf" + notifyparam);
    self endon(#"death");
    hawk_owner = self.owner;
    controllermodel = getuimodelforcontroller(localclientnum);
    var_84528d5d = 0.5;
    var_9acf630f = 0.3;
    var_8ecbc09b = 2;
    if (isdefined(level.hawk_settings) && isdefined(level.hawk_settings.bundle)) {
        bundle = level.hawk_settings.bundle;
    }
    if (isdefined(bundle)) {
        var_59d4144b = isdefined(bundle.var_59d4144b) ? bundle.var_59d4144b : 0.5;
        var_e7c561e2 = isdefined(bundle.var_e7c561e2) ? bundle.var_e7c561e2 : 0.3;
        var_98977cea = isdefined(bundle.var_98977cea) ? bundle.var_98977cea : 2;
    }
    var_ebf5b862 = [];
    var_15d793e8 = [];
    var_1f3cc5f9 = [];
    var_2e31947c = [];
    for (ti = 0; ti < 6; ti++) {
        var_9935a809 = "luielement.remote_missile_target_lockon" + ti;
        var_24a98e1f = var_9935a809 + ".target_locked";
        var_ebf5b862[ti] = createuimodel(controllermodel, var_24a98e1f);
        var_b4fbb3cb = var_9935a809 + ".clientnum";
        var_15d793e8[ti] = createuimodel(controllermodel, var_b4fbb3cb);
        var_3d384de3 = var_9935a809 + ".lockonScale";
        var_1f3cc5f9[ti] = createuimodel(controllermodel, var_3d384de3);
        var_907cb130 = var_9935a809 + ".lockonObscured";
        var_78e27c6d[ti] = createuimodel(controllermodel, var_907cb130);
    }
    var_c0443ab2 = 0;
    var_8736e321 = 1;
    var_6c8b920a = [];
    stance_offsets = [];
    stance_offsets[#"stand"] = vectorscale((0, 0, 1), 60);
    stance_offsets[#"crouch"] = vectorscale((0, 0, 1), 40);
    stance_offsets[#"prone"] = vectorscale((0, 0, 1), 12);
    while (isdefined(hawk_owner) && isplayer(hawk_owner) && hawk_owner function_21c0fa55()) {
        if (hawk_owner isremotecontrolling(localclientnum)) {
            if (!isinvehicle(localclientnum, self) && isdefined(hawk_owner.weapon) && hawk_owner.weapon.statname == #"remote_missile") {
                if (var_c0443ab2) {
                    function_86f17acc(controllermodel, var_1f3cc5f9);
                    var_6c8b920a = [];
                    var_c0443ab2 = 0;
                }
                wait(0.1);
                continue;
            }
        }
        /#
            if (isdefined(bundle)) {
                var_59d4144b = isdefined(bundle.var_59d4144b) ? bundle.var_59d4144b : 0.5;
                var_e7c561e2 = isdefined(bundle.var_e7c561e2) ? bundle.var_e7c561e2 : 0.3;
                var_98977cea = isdefined(bundle.var_98977cea) ? bundle.var_98977cea : 2;
            }
        #/
        now = hawk_owner getclienttime();
        var_c0443ab2 = 1;
        var_1d7ce7ba = project2dto3d(localclientnum, 0, 0, 12);
        var_14569a7a = 0;
        cam_angles = getcamanglesbylocalclientnum(localclientnum);
        var_ca5159f1 = anglestoforward(cam_angles);
        for (ti = 0; ti < 6; ti++) {
            if (getuimodelvalue(var_ebf5b862[ti]) == 0) {
                ti = [];
            } else {
                var_8347ac20 = getuimodelvalue(var_15d793e8[ti]);
                target_player = getentbynum(localclientnum, var_8347ac20);
                if (!isdefined(target_player) || !isplayer(target_player)) {
                    ti = [];
                } else if (vectordot(var_ca5159f1, target_player.origin - var_1d7ce7ba) < 0) {
                    ti = [];
                } else {
                    if (!isdefined(var_6c8b920a[ti])) {
                        var_6c8b920a[ti] = now - 100 - 10;
                    }
                    var_4759b4d3 = project3dto2d(localclientnum, target_player.origin);
                    var_20a99afd = project3dto2d(localclientnum, target_player.origin + vectorscale((0, 0, 1), 60));
                    screen_height = distance2d(var_4759b4d3, var_20a99afd);
                    var_fcd926d5 = var_59d4144b * screen_height / 60;
                    var_fcd926d5 = math::clamp(var_fcd926d5, var_e7c561e2, var_98977cea);
                    setuimodelvalue(var_1f3cc5f9[ti], var_fcd926d5);
                    cooldown_time = now - var_6c8b920a[ti];
                    if (var_14569a7a < 1 || cooldown_time > 200) {
                        if (cooldown_time > 100) {
                            var_6c8b920a[ti] = now;
                            var_14569a7a++;
                            trace = bullettrace(var_1d7ce7ba, target_player.origin + stance_offsets[target_player getstance()], 0, hawk_owner);
                            if (isdefined(trace)) {
                                var_d7caaee9 = trace[#"fraction"] < 1;
                                setuimodelvalue(var_78e27c6d[ti], var_d7caaee9);
                            }
                        }
                    }
                }
            }
        }
        waitframe(1);
        if (isdefined(self.owner)) {
            hawk_owner = self.owner;
        }
    }
}

// Namespace hawk_mp/hawk
// Params 2, eflags: 0x1 linked
// Checksum 0x39122974, Offset: 0x17d8
// Size: 0x5e
function function_86f17acc(controllermodel, &var_1f3cc5f9) {
    for (ti = 0; ti < 6; ti++) {
        setuimodelvalue(var_1f3cc5f9[ti], 1);
    }
}

