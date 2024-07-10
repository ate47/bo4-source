#using script_5520b91a8aa516ab;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace hawk_wz;

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x2
// Checksum 0x5c33fb04, Offset: 0x200
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hawk_wz", &__init__, undefined, undefined);
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x0
// Checksum 0x4fed363c, Offset: 0x248
// Size: 0x2d4
function __init__() {
    level.var_dde557d5 = 0;
    level.hawk_settings = spawnstruct();
    level.hawk_settings.bundle = getscriptbundle("hawk_settings_wz");
    level.var_ef287aa1 = [];
    level.var_eba5e1cc = [];
    level.var_eba5e1cc[#"stand"] = (0, 0, 60);
    level.var_eba5e1cc[#"crouch"] = (0, 0, 40);
    level.var_eba5e1cc[#"prone"] = (0, 0, 12);
    level.var_aac98621 = [];
    level.var_8dfa7ed7 = [];
    for (ti = 0; ti < level.hawk_settings.bundle.var_48e78794; ti++) {
        uifield = remote_missile_target_lockon::register_clientside(hash("remote_missile_target_lockon" + ti));
        level.var_aac98621[ti] = uifield;
        level.var_8dfa7ed7[uifield.var_47e79fc] = ti;
    }
    clientfield::register("vehicle", "hawk_range", 13000, 1, "int", &function_6701affc, 0, 1);
    vehicle::add_vehicletype_callback("veh_hawk_player_wz", &hawk_spawned);
    vehicle::function_2f97bc52("veh_hawk_player_wz", &function_fbdbb841);
    vehicle::function_2f97bc52("veh_hawk_player_far_range_wz", &function_1ed9ef6a);
    vehicle::function_cd2ede5("veh_hawk_player_wz", &function_500d3fa7);
    vehicle::function_cd2ede5("veh_hawk_player_far_range_wz", &function_fc1227ca);
    callback::on_localplayer_spawned(&on_local_player_spawned);
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0xd50a73db, Offset: 0x528
// Size: 0x24
function private hawk_spawned(localclientnum) {
    self thread function_23a9e4af(localclientnum);
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0xc2886bbc, Offset: 0x558
// Size: 0x2c
function private function_8bd7314c(localclientnum) {
    function_1eaaceab(level.var_ef287aa1, 0);
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x4
// Checksum 0x620960e4, Offset: 0x590
// Size: 0x42
function private function_f95544c4(team1, team2) {
    if (team1 == team2) {
        return 1;
    }
    return function_b37afded(team1, team2);
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0xb5abc05b, Offset: 0x5e0
// Size: 0xf6
function private hawk_think(localclientnum) {
    self endoncallback(&function_8bd7314c, #"death");
    self.owner endoncallback(&function_8bd7314c, #"death", #"disconnect");
    array::add(level.var_ef287aa1, self, 0);
    self.var_704e7b07 = [];
    self.targets = [];
    while (true) {
        self function_8487fabe(localclientnum);
        self function_76b4c572(localclientnum);
        self function_9ace0fb6(localclientnum);
        waitframe(1);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0xff5b1842, Offset: 0x6e0
// Size: 0xe4
function private function_23a9e4af(localclientnum) {
    self endon(#"death");
    while (!isdefined(self.owner)) {
        wait(0.1);
    }
    if (isplayer(self.owner) && self.owner function_21c0fa55()) {
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.hawkActive"), 1);
        self thread function_2e07be71(localclientnum);
    }
    self thread hawk_think(localclientnum);
}

// Namespace hawk_wz/hawk_wz
// Params 3, eflags: 0x4
// Checksum 0xe1c7cccc, Offset: 0x7d0
// Size: 0x9a
function private function_25b776e2(localclientnum, ti, entnum) {
    if (!isdefined(self.var_e4102217[ti]) || self.var_e4102217[ti] != entnum) {
        uifield = level.var_aac98621[ti];
        uifield remote_missile_target_lockon::set_clientnum(localclientnum, entnum);
        self.var_e4102217[ti] = entnum;
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x313fa99c, Offset: 0x878
// Size: 0x18
function private function_bbb5186f(ti) {
    return self.var_e4102217[ti];
}

// Namespace hawk_wz/hawk_wz
// Params 3, eflags: 0x4
// Checksum 0xd924b763, Offset: 0x898
// Size: 0x9a
function private set_target_locked(localclientnum, ti, var_3c5beee7) {
    if (!isdefined(self.var_6a09a180[ti]) || self.var_6a09a180[ti] != var_3c5beee7) {
        uifield = level.var_aac98621[ti];
        uifield remote_missile_target_lockon::set_target_locked(localclientnum, var_3c5beee7);
        self.var_6a09a180[ti] = var_3c5beee7;
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x690c460c, Offset: 0x940
// Size: 0x18
function private get_target_locked(ti) {
    return self.var_6a09a180[ti];
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x9ae109b, Offset: 0x960
// Size: 0x23a
function private function_ec2a2906(localclientnum) {
    controllermodel = getuimodelforcontroller(localclientnum);
    player_entnum = self getentitynumber();
    for (ti = 0; ti < level.hawk_settings.bundle.var_48e78794; ti++) {
        uifield = level.var_aac98621[ti];
        if (!uifield remote_missile_target_lockon::is_open(localclientnum)) {
            uifield remote_missile_target_lockon::open(localclientnum);
        }
        var_9935a809 = "client_luielems.remote_missile_target_lockon.remote_missile_target_lockon" + ti;
        var_24a98e1f = var_9935a809 + ".target_locked";
        createuimodel(controllermodel, var_24a98e1f);
        var_b4fbb3cb = var_9935a809 + ".clientnum";
        createuimodel(controllermodel, var_b4fbb3cb);
        var_3d384de3 = var_9935a809 + ".lockonScale";
        self.var_d32addbf[ti] = createuimodel(controllermodel, var_3d384de3);
        var_907cb130 = var_9935a809 + ".lockonObscured";
        self.var_fad86c46[ti] = createuimodel(controllermodel, var_907cb130);
        self function_25b776e2(localclientnum, ti, player_entnum);
        self set_target_locked(localclientnum, ti, 0);
        uifield remote_missile_target_lockon::set_ishawktag(localclientnum, 1);
    }
    self.var_89285548 = 1;
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x1a5d941b, Offset: 0xba8
// Size: 0xb2
function private function_3c760dfe(localclientnum) {
    for (ti = 0; ti < level.hawk_settings.bundle.var_48e78794; ti++) {
        uifield = level.var_aac98621[ti];
        if (uifield remote_missile_target_lockon::is_open(localclientnum)) {
            uifield remote_missile_target_lockon::close(localclientnum);
        }
    }
    self.var_e4102217 = [];
    self.var_6a09a180 = [];
    self.var_89285548 = 0;
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x4
// Checksum 0x2f8b78ae, Offset: 0xc68
// Size: 0xba
function private function_364150fd() {
    result = [];
    foreach (hawk in level.var_ef287aa1) {
        if (isdefined(hawk) && function_f95544c4(hawk.team, self.team)) {
            result[result.size] = hawk;
        }
    }
    return result;
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x16a6a2a0, Offset: 0xd30
// Size: 0xda
function private function_a0e351e0(localclientnum) {
    if (!isdefined(self.var_89285548)) {
        self.var_89285548 = 0;
    }
    if (!isdefined(self.var_e4102217)) {
        self.var_e4102217 = [];
    }
    if (!isdefined(self.var_6a09a180)) {
        self.var_6a09a180 = [];
    }
    var_a980942f = self function_364150fd();
    if (!self.var_89285548 && var_a980942f.size > 0) {
        self function_ec2a2906(localclientnum);
    }
    if (self.var_89285548 && var_a980942f.size == 0) {
        self function_3c760dfe(localclientnum);
    }
    return self.var_89285548;
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x4
// Checksum 0xfc397f52, Offset: 0xe18
// Size: 0x1a4
function private function_2d90a835(localclientnum, radius) {
    enemies = [];
    if (isdefined(self.owner)) {
        players = getentitiesinradius(localclientnum, self.origin, radius, 1);
        local_player = function_5c10bd79(localclientnum);
        if (distancesquared(local_player.origin, self.origin) < radius * radius && !array::contains(players, local_player)) {
            players[players.size] = local_player;
        }
        foreach (player in players) {
            if (isalive(player) && !function_f95544c4(self.owner.team, player.team)) {
                enemies[enemies.size] = player;
            }
        }
    }
    return enemies;
}

// Namespace hawk_wz/hawk_wz
// Params 3, eflags: 0x4
// Checksum 0x354ce6d6, Offset: 0xfc8
// Size: 0x218
function private function_d952430d(localclientnum, &array, targets) {
    var_e5cf40eb = [];
    foreach (target in targets) {
        var_e5cf40eb[target getentitynumber()] = 1;
    }
    to_remove = [];
    foreach (entnum, _ in array) {
        if (isdefined(var_e5cf40eb[entnum])) {
            ent = getentbynum(localclientnum, entnum);
            if (!isdefined(ent) || !isplayer(ent) || !isalive(ent)) {
                to_remove[to_remove.size] = entnum;
            }
            continue;
        }
        to_remove[to_remove.size] = entnum;
    }
    foreach (entnum in to_remove) {
        arrayremoveindex(array, entnum, 1);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x771b67fb, Offset: 0x11e8
// Size: 0x17a
function private function_76b4c572(localclientnum) {
    foreach (target in self.targets) {
        var_4ef4e267 = target getentitynumber();
        if (!isdefined(self.var_704e7b07[var_4ef4e267])) {
            self.var_704e7b07[var_4ef4e267] = spawnstruct();
            self.var_704e7b07[var_4ef4e267].visible = 0;
        }
    }
    foreach (var_4ef4e267, var_8712c5b8 in self.var_704e7b07) {
        var_8712c5b8.var_aaf744fe = var_8712c5b8.state === 1;
        var_8712c5b8.state = 0;
        var_8712c5b8.var_fb579b3e = var_8712c5b8.visible;
        var_8712c5b8.visible = 0;
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x81fbe4eb, Offset: 0x1370
// Size: 0x460
function private function_9ace0fb6(localclientnum) {
    time = gettime();
    bundle = level.hawk_settings.bundle;
    foreach (target in self.targets) {
        var_4ef4e267 = target getentitynumber();
        var_e5cf40eb[var_4ef4e267] = 1;
        info = self.var_704e7b07[var_4ef4e267];
        if (!info.var_fb579b3e) {
            info.first_visible = time;
        }
        info.visible = 1;
        info.var_1fe906d8 = time;
        tagtime = int(bundle.tag_time * 1000);
        if (target hasperk(localclientnum, #"specialty_nokillstreakreticle")) {
            tagtime *= bundle.var_59b7880b;
        }
        if (info.var_1fe906d8 - info.first_visible > tagtime) {
            if (isdefined(self.owner) && target function_21c0fa55() && !info.var_aaf744fe && !function_f95544c4(self.owner.team, target.team)) {
                target playsound(localclientnum, #"hash_4f43df2a649784d0");
            }
            info.state = 1;
            info.var_a7e1d732 = time;
        } else if (isdefined(info.var_a7e1d732) && time - info.var_a7e1d732 < int(bundle.var_fb7c1412 * 1000)) {
            info.state = 1;
            info.var_a7e1d732 = time;
        }
        self.var_704e7b07[var_4ef4e267] = info;
    }
    to_remove = [];
    foreach (entnum, info in self.var_704e7b07) {
        ent = getentbynum(localclientnum, entnum);
        if (!isdefined(ent) || !isplayer(ent) || !isalive(ent)) {
            to_remove[to_remove.size] = entnum;
            continue;
        }
        if (!function_cfd3bed0(info)) {
            to_remove[to_remove.size] = entnum;
        }
    }
    foreach (entnum in to_remove) {
        arrayremoveindex(self.var_704e7b07, entnum, 1);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x7a7a8387, Offset: 0x17d8
// Size: 0x60
function private function_cfd3bed0(var_8712c5b8) {
    if (!(isdefined(var_8712c5b8.visible) && var_8712c5b8.visible)) {
        if (!isdefined(var_8712c5b8.var_1fe906d8)) {
            return false;
        }
        if (gettime() - var_8712c5b8.var_1fe906d8 > 500) {
            return false;
        }
    }
    return true;
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x30cba745, Offset: 0x1840
// Size: 0x11e
function private function_35046386(target) {
    var_4ef4e267 = target getentitynumber();
    foreach (hawk in level.var_ef287aa1) {
        if (isdefined(hawk) && isdefined(hawk.owner) && function_f95544c4(hawk.owner.team, self.team)) {
            info = hawk.var_704e7b07[var_4ef4e267];
            if (isdefined(info) && info.state == 1) {
                return true;
            }
        }
    }
    return false;
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x4
// Checksum 0x838105ba, Offset: 0x1968
// Size: 0x5fe
function private function_d53feb8c(localclientnum, targets) {
    var_b3f5ea99 = self getentitynumber();
    var_1dcaad7e = [];
    var_97e92766 = [];
    for (ti = 0; ti < level.hawk_settings.bundle.var_48e78794; ti++) {
        uifield = level.var_aac98621[ti];
        entnum = self function_bbb5186f(ti);
        if (entnum == var_b3f5ea99) {
            var_97e92766[var_97e92766.size] = uifield;
            continue;
        }
        var_1dcaad7e[entnum] = uifield;
    }
    controllermodel = getuimodelforcontroller(localclientnum);
    bundle = level.hawk_settings.bundle;
    var_59d4144b = isdefined(bundle.var_59d4144b) ? bundle.var_59d4144b : 0.5;
    var_e7c561e2 = isdefined(bundle.var_e7c561e2) ? bundle.var_e7c561e2 : 0.3;
    var_98977cea = isdefined(bundle.var_98977cea) ? bundle.var_98977cea : 2;
    now = gettime();
    var_5044f28d = [];
    var_a980942f = self function_364150fd();
    foreach (target in targets) {
        var_4ef4e267 = target getentitynumber();
        uifield = undefined;
        if (isdefined(var_1dcaad7e[var_4ef4e267])) {
            uifield = var_1dcaad7e[var_4ef4e267];
        } else if (var_97e92766.size > 0) {
            uifield = var_97e92766[0];
            arrayremoveindex(var_97e92766, 0, 0);
            var_1dcaad7e[var_4ef4e267] = uifield;
        }
        if (isdefined(uifield)) {
            ti = level.var_8dfa7ed7[uifield.var_47e79fc];
            var_5044f28d[ti] = 1;
            self function_25b776e2(localclientnum, ti, var_4ef4e267);
            target_state = 0;
            if (self function_35046386(target)) {
                target_state = 1;
            }
            if (self get_target_locked(ti) != target_state) {
                self set_target_locked(localclientnum, ti, target_state);
                if (target_state == 1) {
                    self playsound(localclientnum, bundle.tag_sound);
                }
            }
            assert(isdefined(ti));
            var_4759b4d3 = project3dto2d(localclientnum, target.origin);
            var_20a99afd = project3dto2d(localclientnum, target.origin + (0, 0, 60));
            screen_height = distance2d(var_4759b4d3, var_20a99afd);
            var_fcd926d5 = var_59d4144b * screen_height / 60;
            var_fcd926d5 = math::clamp(var_fcd926d5, var_e7c561e2, var_98977cea);
            setuimodelvalue(self.var_d32addbf[ti], var_fcd926d5);
            var_d7caaee9 = 1;
            foreach (hawk in var_a980942f) {
                if (isdefined(hawk.var_5f360c48[var_4ef4e267])) {
                    var_d7caaee9 = 0;
                    break;
                }
            }
            setuimodelvalue(self.var_fad86c46[ti], var_d7caaee9);
        }
    }
    for (ti = 0; ti < level.hawk_settings.bundle.var_48e78794; ti++) {
        if (!(isdefined(var_5044f28d[ti]) && var_5044f28d[ti])) {
            self set_target_locked(localclientnum, ti, 0);
        }
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0xdf91ee80, Offset: 0x1f70
// Size: 0xae
function private function_a552c160(localclientnum) {
    self endon(#"death", #"disconnect");
    self.var_d32addbf = [];
    self.var_fad86c46 = [];
    while (true) {
        if (function_a0e351e0(localclientnum)) {
            targets = self function_bba5f8f7();
            self function_d53feb8c(localclientnum, targets);
        }
        waitframe(1);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x0
// Checksum 0x9f38a4d0, Offset: 0x2028
// Size: 0x44
function function_fbdbb841(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_775073e(localclientnum);
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x0
// Checksum 0x147f20ef, Offset: 0x2078
// Size: 0x44
function function_1ed9ef6a(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_6367489e(localclientnum);
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x0
// Checksum 0xdedc2bb3, Offset: 0x20c8
// Size: 0x44
function function_500d3fa7(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_3759fcf(localclientnum);
}

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x0
// Checksum 0xbeb5e892, Offset: 0x2118
// Size: 0x44
function function_fc1227ca(localclientnum, vehicle) {
    if (!self function_21c0fa55()) {
        return;
    }
    function_3759fcf(localclientnum);
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x0
// Checksum 0xd54f4f94, Offset: 0x2168
// Size: 0xc4
function on_local_player_spawned(localclientnum) {
    player = function_5c10bd79(localclientnum);
    vehicle = getplayervehicle(player);
    player function_a552c160(localclientnum);
    if (isdefined(vehicle) && (vehicle.vehicletype == #"veh_hawk_player_wz" || vehicle.vehicletype == #"veh_hawk_player_far_range_wz")) {
        return;
    }
    function_3759fcf(localclientnum);
}

// Namespace hawk_wz/hawk_wz
// Params 7, eflags: 0x0
// Checksum 0x24dc1f6f, Offset: 0x2238
// Size: 0x124
function function_6701affc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (self.vehicletype != #"veh_hawk_player_wz" && self.vehicletype != #"veh_hawk_player_far_range_wz") {
        return;
    }
    player = function_5c10bd79(localclientnum);
    vehicle = getplayervehicle(player);
    if (isdefined(vehicle) && self == vehicle) {
        if (newval > 0) {
            vehicle.var_b61d83c4 = 1;
            function_6367489e(localclientnum);
            return;
        }
        vehicle.var_b61d83c4 = 0;
        function_775073e(localclientnum);
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x0
// Checksum 0xad93bb08, Offset: 0x2368
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

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x0
// Checksum 0xf1ea786a, Offset: 0x2458
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

// Namespace hawk_wz/hawk_wz
// Params 2, eflags: 0x0
// Checksum 0x3cdc605e, Offset: 0x2550
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

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x0
// Checksum 0xb855d01e, Offset: 0x2648
// Size: 0x15c
function function_2e07be71(localclientnum) {
    notifyparam = localclientnum + "_" + self getentitynumber();
    self notify("4decd014c80f6da7" + notifyparam);
    self endon("4decd014c80f6da7" + notifyparam);
    assert(isdefined(self.owner));
    var_3216cebd = self.owner getentitynumber();
    self waittill(#"death");
    if (isdefined(var_3216cebd)) {
        hawk_owner = getentbynum(localclientnum, var_3216cebd);
        if (isdefined(hawk_owner) && isplayer(hawk_owner) && hawk_owner function_21c0fa55()) {
            setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.hawkActive"), 0);
        }
    }
}

// Namespace hawk_wz/hawk_wz
// Params 1, eflags: 0x4
// Checksum 0x20616449, Offset: 0x27b0
// Size: 0x6ba
function private function_8487fabe(localclientnum) {
    self endon(#"death");
    if (isdefined(self.var_b61d83c4) && self.var_b61d83c4 || !isdefined(self.owner)) {
        self.var_5f360c48 = [];
        self.var_c55be3a2 = [];
        self.targets = [];
        return;
    }
    var_82bf9f7b = self.owner getplayerangles();
    forward = anglestoforward(var_82bf9f7b);
    bundle = level.hawk_settings.bundle;
    var_e4f883c1 = bundle.var_957e91c4 * bundle.var_957e91c4;
    enemies = self function_2d90a835(localclientnum, bundle.var_957e91c4);
    if (!isdefined(self.var_5f360c48)) {
        self.var_5f360c48 = [];
    }
    if (!isdefined(self.var_c55be3a2)) {
        self.var_c55be3a2 = [];
    }
    var_4d392c1d = int((isdefined(bundle.var_4f848330) ? bundle.var_4f848330 : 0) * 1000);
    var_d691d922 = int((isdefined(bundle.var_ab326589) ? bundle.var_ab326589 : 0) * 1000);
    bullet_traces_this_frame = 0;
    targets = [];
    foreach (player in enemies) {
        if (!isalive(player)) {
            continue;
        }
        player_lookup = getentbynum(localclientnum, player getentitynumber());
        if (player_lookup !== player) {
            continue;
        }
        now = gettime();
        vehicle = getplayervehicle(player);
        stance_offset = level.var_eba5e1cc[player getstance()];
        if (isdefined(vehicle)) {
            stance_offset = level.var_eba5e1cc[#"crouch"];
        }
        toplayer = vectornormalize(player.origin + stance_offset - self.origin);
        in_sight = 0;
        var_131803ce = vectordot(toplayer, forward) >= bundle.tag_fov;
        if (var_131803ce) {
            in_sight = bullettracepassed(self.origin, player.origin + stance_offset, 0, self, player, 1);
            bullet_traces_this_frame++;
            if (!in_sight && isdefined(vehicle)) {
                trace_result = bullettrace(self.origin, player.origin + stance_offset, 0, self);
                if (trace_result[#"fraction"] < 1 && trace_result[#"entity"] === vehicle) {
                    in_sight = 1;
                    bullet_traces_this_frame++;
                }
            }
        }
        valid_target = 0;
        if (!in_sight) {
            if (var_131803ce) {
                if (bundle.var_d1a5fb3b === 1) {
                    self.var_5f360c48[player getentitynumber()] = undefined;
                    continue;
                }
                if (isdefined(self.var_5f360c48[player getentitynumber()])) {
                    valid_target = var_4d392c1d == 0 || now - self.var_5f360c48[player getentitynumber()] < var_4d392c1d;
                }
            } else {
                if (bundle.var_4917731f === 1) {
                    self.var_c55be3a2[player getentitynumber()] = undefined;
                    continue;
                }
                if (isdefined(self.var_c55be3a2[player getentitynumber()])) {
                    valid_target = var_d691d922 == 0 || now - self.var_c55be3a2[player getentitynumber()] < var_d691d922;
                }
            }
        } else {
            valid_target = 1;
            self.var_5f360c48[player getentitynumber()] = now;
            self.var_c55be3a2[player getentitynumber()] = now;
        }
        if (valid_target) {
            targets[targets.size] = player;
        }
        if (bullet_traces_this_frame >= 2) {
            waitframe(1);
        }
    }
    function_1eaaceab(targets, 0);
    function_d952430d(localclientnum, self.var_5f360c48, targets);
    function_d952430d(localclientnum, self.var_c55be3a2, targets);
    self.targets = targets;
}

// Namespace hawk_wz/hawk_wz
// Params 0, eflags: 0x4
// Checksum 0xf62e8bf, Offset: 0x2e78
// Size: 0x14a
function private function_bba5f8f7() {
    var_ef7046e6 = self.origin;
    targets = [];
    var_a980942f = function_364150fd();
    foreach (hawk in var_a980942f) {
        targets = arraycombine(targets, hawk.targets, 0, 0);
        if (hawk.owner === self) {
            var_ef7046e6 = hawk.origin;
        }
    }
    function_1eaaceab(targets);
    bundle = level.hawk_settings.bundle;
    return arraysortclosest(targets, var_ef7046e6, bundle.var_48e78794, 0, bundle.var_957e91c4);
}

