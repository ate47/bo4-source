// Atian COD Tools GSC decompiler test
#include scripts/core_common/array_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace perks;

// Namespace perks/perks
// Params 0, eflags: 0x2
// Checksum 0xc7911a2, Offset: 0x260
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"perks", &__init__, undefined, undefined);
}

// Namespace perks/perks
// Params 0, eflags: 0x1 linked
// Checksum 0x6630d629, Offset: 0x2a8
// Size: 0x40c
function __init__() {
    clientfield::register("allplayers", "flying", 1, 1, "int", &function_ee6ecd88, 0, 1);
    callback::on_localclient_connect(&on_local_client_connect);
    callback::on_localplayer_spawned(&on_localplayer_spawned);
    callback::on_spawned(&on_player_spawned);
    level.var_b033d0d5 = 1;
    if (1) {
        level.var_aca02fa0 = &function_6c5fba66;
    }
    level.var_dc9e14d2 = getdvarint(#"hash_4af3346f18f8ff29", 2);
    level.var_3fc9795f = getdvarint(#"hash_5b11c4ca2370b0c4", 1);
    level.var_d1663d12 = getdvarint(#"hash_400ee78c1695877d", 1);
    level.var_a20f9152 = getdvarint(#"hash_b5538066c195174", 1);
    level.var_8530a2e8 = getdvarint(#"hash_2d34f874d7dd318", 50000);
    level.var_ed97598d = getdvarfloat(#"hash_736a82617ec8c0dc", 0.01);
    level.var_efa3257 = getdvarfloat(#"hash_4407e757673570af", 0.4);
    level.var_9ffeaee6 = getdvarint(#"hash_40854d1bd97a0bde", 2);
    level.var_ca01a99b = getdvarint(#"hash_3438581bc8806f07", 10);
    level.var_b9f6d550 = getdvarint(#"hash_36d1f18e342f05ae", 0);
    level.var_524daa82 = getdvarint(#"hash_22514eaa04480993", 1);
    level.var_c6fca992 = getdvarint(#"hash_2631fb7ad3229161", 50000);
    level.var_9c071676 = getdvarfloat(#"hash_45cf467187dcb1f7", 0.01);
    level.var_e3e08fdc = getdvarfloat(#"hash_27c5d6bb29d8e354", 0.4);
    callback::on_gameplay_started(&on_gameplay_started);
    level.var_6fc25f5c = getscriptbundle(#"awareness");
    level.var_842a5e1f = getscriptbundle(#"hash_7223a3f0f10bc07c");
    /#
        level thread updatedvars();
    #/
}

// Namespace perks/perks
// Params 0, eflags: 0x0
// Checksum 0x19e080e8, Offset: 0x6c0
// Size: 0xc8
function function_b7a40e4c() {
    self endon(#"death");
    while (1) {
        self function_3d033f52(0, level.var_dc9e14d2, level.var_efa3257, level.var_d1663d12, level.var_3fc9795f, level.var_a20f9152, level.var_8530a2e8, level.var_ed97598d);
        self function_3d033f52(1, level.var_9ffeaee6, level.var_e3e08fdc, level.var_b9f6d550, level.var_ca01a99b, level.var_524daa82, level.var_c6fca992, level.var_9c071676);
        wait(1);
    }
}

// Namespace perks/perks
// Params 0, eflags: 0x0
// Checksum 0x4b6c2a71, Offset: 0x790
// Size: 0x364
function updatedvars() {
    /#
        while (1) {
            level.var_dc9e14d2 = getdvarint(#"hash_4af3346f18f8ff29", level.var_dc9e14d2);
            level.var_3fc9795f = getdvarint(#"hash_5b11c4ca2370b0c4", level.var_3fc9795f);
            level.var_d1663d12 = getdvarint(#"hash_400ee78c1695877d", level.var_d1663d12);
            level.var_a20f9152 = getdvarint(#"hash_b5538066c195174", level.var_a20f9152);
            level.var_8530a2e8 = getdvarint(#"hash_2d34f874d7dd318", level.var_8530a2e8);
            level.var_ed97598d = getdvarfloat(#"hash_736a82617ec8c0dc", level.var_ed97598d);
            level.var_efa3257 = getdvarfloat(#"hash_4407e757673570af", level.var_efa3257);
            level.var_9ffeaee6 = getdvarint(#"hash_40854d1bd97a0bde", level.var_9ffeaee6);
            level.var_ca01a99b = getdvarint(#"hash_3438581bc8806f07", level.var_ca01a99b);
            level.var_b9f6d550 = getdvarint(#"hash_36d1f18e342f05ae", level.var_b9f6d550);
            level.var_524daa82 = getdvarint(#"hash_22514eaa04480993", level.var_524daa82);
            level.var_c6fca992 = getdvarint(#"hash_2631fb7ad3229161", level.var_c6fca992);
            level.var_9c071676 = getdvarfloat(#"hash_45cf467187dcb1f7", level.var_9c071676);
            level.var_e3e08fdc = getdvarfloat(#"hash_27c5d6bb29d8e354", level.var_e3e08fdc);
            level.friendlycontentoutlines = getdvarint(#"friendlycontentoutlines", level.friendlycontentoutlines);
            wait(1);
        }
    #/
}

// Namespace perks/perks
// Params 7, eflags: 0x1 linked
// Checksum 0xb5fe8fb7, Offset: 0xb00
// Size: 0x4a
function function_ee6ecd88(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.flying = newval;
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0xc7be1251, Offset: 0xb58
// Size: 0x12c
function on_local_client_connect(local_client_num) {
    registerrewindfx(local_client_num, "player/fx8_plyr_footstep_tracker_l");
    registerrewindfx(local_client_num, "player/fx8_plyr_footstep_tracker_r");
    registerrewindfx(local_client_num, "player/fx_plyr_flying_tracker_l");
    registerrewindfx(local_client_num, "player/fx_plyr_flying_tracker_r");
    registerrewindfx(local_client_num, "player/fx_plyr_footstep_tracker_lf");
    registerrewindfx(local_client_num, "player/fx_plyr_footstep_tracker_rf");
    registerrewindfx(local_client_num, "player/fx_plyr_flying_tracker_lf");
    registerrewindfx(local_client_num, "player/fx_plyr_flying_tracker_rf");
    registerrewindfx(local_client_num, "player/fx8_plyr_footstep_tracker_inair");
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0xe820a633, Offset: 0xc90
// Size: 0x26
function on_localplayer_spawned(local_client_num) {
    profilestart();
    self function_92725cf9(local_client_num);
    profilestop();
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x3e5cf87d, Offset: 0xcc0
// Size: 0x86
function on_gameplay_started(local_client_num) {
    if (sessionmodeismultiplayergame() && !isdefined(level.var_783d3911)) {
        level.var_783d3911 = getservertime(local_client_num);
    }
    waittillframeend();
    profilestart();
    local_player = function_5c10bd79(local_client_num);
    local_player function_92725cf9(local_client_num);
    profilestop();
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x921aeedd, Offset: 0xd50
// Size: 0x74
function function_92725cf9(local_client_num) {
    if (!self function_21c0fa55()) {
        return;
    }
    self thread function_632f3cb0(local_client_num);
    if (1) {
        self thread function_639917b9(local_client_num);
        self thread function_7f156fc1(local_client_num);
    }
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x40567d76, Offset: 0xdd0
// Size: 0x6c
function on_player_spawned(local_client_num) {
    /#
        self thread function_f816898(local_client_num);
    #/
    self notify(#"perks_changed");
    if (1) {
        self thread function_5f17ebea(local_client_num);
        self thread function_6c5fba66(local_client_num);
    }
}

// Namespace perks/perks
// Params 2, eflags: 0x0
// Checksum 0xd704aba7, Offset: 0xe48
// Size: 0xba
function function_c336db7f(a&, b&) {
    /#
        if (isdefined(a) && isdefined(b) && isarray(a) && isarray(b) && a.size == b.size) {
            for (i = 0; i < a.size; i++) {
                if (!(a[i] === b[i])) {
                    return 0;
                }
            }
            return 1;
        }
        return 0;
    #/
}

// Namespace perks/perks
// Params 1, eflags: 0x0
// Checksum 0x3991c125, Offset: 0xf10
// Size: 0xe8
function function_f816898(local_client_num) {
    /#
        self notify(#"hash_5bb1071a9c9824db");
        self endon(#"hash_5bb1071a9c9824db");
        self endon(#"death");
        self endon(#"disconnect");
        self.var_59e93396 = self getperks(local_client_num);
        while (isdefined(self)) {
            perks = self getperks(local_client_num);
            if (!function_c336db7f(perks, self.var_59e93396)) {
                self.var_59e93396 = perks;
                self notify(#"perks_changed");
            }
            wait(1);
        }
    #/
}

// Namespace perks/perks
// Params 1, eflags: 0x0
// Checksum 0x7dfecefe, Offset: 0x1000
// Size: 0xc8
function get_players(local_client_num) {
    players = [];
    entities = getentarray(local_client_num);
    if (isdefined(entities)) {
        foreach (ent in entities) {
            if (isplayer(ent)) {
                players[players.size] = ent;
            }
        }
    }
    return players;
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0xa1d4fe47, Offset: 0x10d0
// Size: 0xf6
function function_7f156fc1(local_client_num) {
    self endon(#"death");
    self endon(#"hash_6a5bb64e717eb757");
    self notify(#"hash_6a5bb64e717eb757");
    players = getplayers(local_client_num);
    foreach (player in players) {
        if (isdefined(player) && player != self) {
            player thread function_6c5fba66(local_client_num);
        }
        waitframe(1);
    }
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0xe6cbabcb, Offset: 0x11d0
// Size: 0x2a6
function function_639917b9(local_client_num) {
    self notify("monitor_tracker_perk_killcam" + local_client_num);
    self endon("monitor_tracker_perk_killcam" + local_client_num);
    self endon(#"death");
    if (!isdefined(level.var_7537221e)) {
        level.var_7537221e = [];
        level.var_2ab5169f = [];
    }
    if (!isdefined(level.var_7537221e[local_client_num])) {
        level.var_7537221e[local_client_num] = [];
    }
    if (!isdefined(level.var_2ab5169f[local_client_num])) {
        level.var_2ab5169f[local_client_num] = 0;
    }
    if (function_1cbf351b(local_client_num)) {
        if (function_5778f82(local_client_num, #"specialty_tracker")) {
            servertime = getservertime(local_client_num);
            for (count = 0; count < level.var_7537221e[local_client_num].size; count++) {
                if (!isdefined(level.var_7537221e[local_client_num][count])) {
                    continue;
                }
                if (level.var_7537221e[local_client_num][count].time < servertime && level.var_7537221e[local_client_num][count].time > servertime - 5000) {
                    positionandrotationstruct = level.var_7537221e[local_client_num][count];
                    tracker_playfx(local_client_num, positionandrotationstruct);
                }
            }
        }
    } else {
        for (;;) {
            waitframe(1);
            positionandrotationstruct = self gettrackerfxposition(local_client_num);
            if (isdefined(positionandrotationstruct)) {
                positionandrotationstruct.time = getservertime(local_client_num);
                level.var_7537221e[local_client_num][level.var_2ab5169f[local_client_num]] = positionandrotationstruct;
                level.var_2ab5169f[local_client_num]++;
                if (level.var_2ab5169f[local_client_num] > 20) {
                    level.var_2ab5169f[local_client_num] = 0;
                }
            }
        }
    }
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x49a80815, Offset: 0x1480
// Size: 0x1b6
function function_6c5fba66(local_client_num) {
    self notify(#"hash_2582d8c0c95da71f");
    self endon(#"hash_2582d8c0c95da71f");
    self endon(#"death");
    self endon(#"disconnect");
    self.flying = 0;
    self.var_170fa0d2 = 0;
    self.tracker_last_pos = self.origin;
    offset = (0, 0, getdvarfloat(#"perk_tracker_fx_foot_height", 0));
    dist2 = 1024;
    while (isdefined(self)) {
        waitframe(1);
        if (self function_21c0fa55()) {
            return;
        }
        if (function_5778f82(local_client_num, #"specialty_tracker")) {
            friend = self function_83973173();
            isalive = isalive(self);
            if (!friend && isalive) {
                positionandrotationstruct = self gettrackerfxposition(local_client_num);
                if (isdefined(positionandrotationstruct)) {
                    self tracker_playfx(local_client_num, positionandrotationstruct);
                }
            } else {
                self.var_170fa0d2 = 0;
            }
        }
    }
}

// Namespace perks/perks
// Params 2, eflags: 0x1 linked
// Checksum 0x272fafa7, Offset: 0x1640
// Size: 0x7c
function tracker_playfx(local_client_num, positionandrotationstruct) {
    handle = playfx(local_client_num, positionandrotationstruct.fx, positionandrotationstruct.pos, positionandrotationstruct.fwd, positionandrotationstruct.up);
    self function_2f532ba4(local_client_num, handle);
}

// Namespace perks/perks
// Params 2, eflags: 0x1 linked
// Checksum 0x52864868, Offset: 0x16c8
// Size: 0xea
function function_2f532ba4(local_client_num, handle) {
    if (handle && isdefined(self.var_56798492)) {
        servertime = getservertime(local_client_num);
        var_d94d4d3a = spawnstruct();
        var_d94d4d3a.time = servertime;
        var_d94d4d3a.handle = handle;
        index = self.var_56798492.index;
        if (index >= 40) {
            index = 0;
        }
        self.var_56798492.array[index] = var_d94d4d3a;
        self.var_56798492.index = index + 1;
    }
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0xbd31887, Offset: 0x17c0
// Size: 0x1d0
function function_5f17ebea(local_client_num) {
    self endon(#"disconnect");
    if (!(isdefined(level.var_b033d0d5) && level.var_b033d0d5)) {
        return;
    }
    if (self function_21c0fa55()) {
        return;
    }
    if (isdefined(self.var_56798492)) {
        self.var_56798492.array = [];
        self.var_56798492.index = 0;
        self.var_56798492 = undefined;
    }
    var_56798492 = spawnstruct();
    var_56798492.array = [];
    var_56798492.index = 0;
    self.var_56798492 = var_56798492;
    self waittill(#"death");
    servertime = getservertime(local_client_num);
    foreach (var_d94d4d3a in var_56798492.array) {
        if (isdefined(var_d94d4d3a) && var_d94d4d3a.time + 5000 > servertime) {
            killfx(local_client_num, var_d94d4d3a.handle);
        }
    }
    var_56798492.array = [];
    var_56798492.index = 0;
    var_56798492 = undefined;
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0xf8ce3524, Offset: 0x1998
// Size: 0x43e
function gettrackerfxposition(local_client_num) {
    positionandrotation = undefined;
    player = self;
    if (isdefined(self.var_61733ff2) && self.var_61733ff2) {
        player = self.owner;
    }
    var_f070e89b = player hasperk(local_client_num, #"specialty_trackerjammer");
    if (isdefined(self.flying) && self.flying) {
        offset = (0, 0, getdvarfloat(#"perk_tracker_fx_fly_height", 0));
        dist2 = 1024;
        if (isdefined(self.trailrightfoot) && self.trailrightfoot) {
            fx = "player/fx8_plyr_footstep_tracker_inair";
        } else {
            fx = "player/fx8_plyr_footstep_tracker_inair";
        }
    } else {
        offset = (0, 0, getdvarfloat(#"perk_tracker_fx_foot_height", 0));
        dist2 = 1024;
        if (isdefined(self.trailrightfoot) && self.trailrightfoot) {
            if (var_f070e89b) {
                fx = "player/fx_plyr_footstep_tracker_rf";
            } else {
                fx = "player/fx8_plyr_footstep_tracker_r";
            }
        } else if (var_f070e89b) {
            fx = "player/fx_plyr_footstep_tracker_lf";
        } else {
            fx = "player/fx8_plyr_footstep_tracker_l";
        }
    }
    pos = self.origin + offset;
    fwd = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    up = anglestoup(self.angles);
    vel = self getvelocity();
    if (lengthsquared(vel) > 1) {
        up = vectorcross(vel, right);
        if (lengthsquared(up) < 0.0001) {
            up = vectorcross(fwd, vel);
        }
        fwd = vel;
    }
    if (isplayer(self) && self isplayerwallrunning()) {
        if (self isplayerwallrunningright()) {
            up = vectorcross(up, fwd);
        } else {
            up = vectorcross(fwd, up);
        }
    }
    if (!(isdefined(self.var_170fa0d2) && self.var_170fa0d2)) {
        self.var_170fa0d2 = 1;
        self.tracker_last_pos = self.origin;
    } else if (distancesquared(self.tracker_last_pos, pos) > dist2) {
        positionandrotation = spawnstruct();
        positionandrotation.fx = fx;
        positionandrotation.pos = pos;
        positionandrotation.fwd = fwd;
        positionandrotation.up = up;
        self.tracker_last_pos = self.origin;
        if (isdefined(self.trailrightfoot) && self.trailrightfoot) {
            self.trailrightfoot = 0;
        } else {
            self.trailrightfoot = 1;
        }
    }
    return positionandrotation;
}

// Namespace perks/perks
// Params 3, eflags: 0x1 linked
// Checksum 0xa9a370e9, Offset: 0x1de0
// Size: 0x48
function function_3edf2cf8(dist_sq, var_73491815, var_47435b6f) {
    return dist_sq < var_47435b6f * var_47435b6f && var_47435b6f * var_47435b6f < var_73491815 * var_73491815;
}

// Namespace perks/perks
// Params 2, eflags: 0x1 linked
// Checksum 0x96dc593b, Offset: 0x1e30
// Size: 0xf2
function function_365c39ef(var_c91d7aa9, bundle) {
    switch (var_c91d7aa9) {
    case #"slide_start":
        return bundle.var_146483e7;
    case #"landing":
        return bundle.var_fe0aa1d2;
    case #"hash_156b3d94aec3cb34":
        return bundle.var_6ae8117c;
    case #"hash_7d2d2a481c2aa519":
        return bundle.var_37bac39d;
    case #"hash_589eac8b592bcb4d":
        return bundle.var_3b22f5be;
    case #"weapon_fired":
        return bundle.var_abea5dd8;
    case #"hash_552ed0592ee3fb0e":
        return bundle.var_301350af;
        break;
    }
    return 0;
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0xae21a7e9, Offset: 0x1f30
// Size: 0xecc
function function_632f3cb0(local_client_num) {
    self endon(#"death");
    controllermodel = getuimodelforcontroller(local_client_num);
    var_e4ed29e4 = createuimodel(controllermodel, "hudItems.awareness");
    setuimodelvalue(var_e4ed29e4, 0);
    var_c948d7f9 = [];
    for (i = 0; i < 6; i++) {
        array::add(var_c948d7f9, createuimodel(controllermodel, "hudItems.awareness.seg" + i + ".segmentValue"));
        setuimodelvalue(var_c948d7f9[i], 0);
    }
    var_4ba3d252 = 0;
    var_da5c86a8 = 0;
    var_ea2d507b = 0;
    var_55336d8d = level.var_6fc25f5c;
    var_c394e130 = level.var_842a5e1f;
    self.var_7122b2ff = 0;
    while (1) {
        /#
            if (getdvarint(#"hash_340cb17d497f0877", 0) > 0) {
                level.var_6fc25f5c = getscriptbundle(#"awareness");
                var_55336d8d = level.var_6fc25f5c;
                level.var_842a5e1f = getscriptbundle(#"hash_7223a3f0f10bc07c");
                var_c394e130 = level.var_842a5e1f;
            }
        #/
        localplayer = function_5c10bd79(local_client_num);
        if (isdefined(localplayer) && isplayer(localplayer) && isalive(localplayer)) {
            var_99edc583 = localplayer function_fd82b127();
        } else {
            var_99edc583 = 0;
        }
        range = var_99edc583 * 0.5;
        if (!isdefined(localplayer) || !isplayer(localplayer) || function_5778f82(local_client_num, #"specialty_detectnearbyenemies") == 0 || function_1cbf351b(local_client_num) == 1 || isalive(localplayer) == 0) {
            setuimodelvalue(var_e4ed29e4, 0);
            var_ea2d507b = 0;
            if (isdefined(level.var_783d3911) && gettime() < level.var_783d3911 + 12000) {
                wait(0.5);
                continue;
            }
            self waittill(#"death", #"spawned", #"perks_changed");
            continue;
        }
        if (self isremotecontrolling(local_client_num)) {
            setuimodelvalue(var_e4ed29e4, 0);
            if (var_ea2d507b != 0) {
                for (i = 0; i < 6; i++) {
                    self thread function_c90f8547(var_c948d7f9[i], 0, 0);
                }
            }
            var_ea2d507b = 0;
            wait(0.5);
            continue;
        }
        if (self.var_7122b2ff == 0) {
            self thread function_c2b5b27c(local_client_num);
        }
        setuimodelvalue(var_e4ed29e4, 1);
        var_77378edb = 0;
        playerangles = localplayer.angles;
        var_92b00101 = getdvarint(#"hash_701d23642a5b951", 0);
        if (var_92b00101) {
            if (playerangles[0] > 0) {
                playerangles = (1, 0, 0);
            } else {
                playerangles = (-1, 0, 0);
            }
        }
        var_2108387f = anglestoforward(playerangles);
        players = getplayers(local_client_num);
        clones = getclones(local_client_num);
        var_38749eb = arraycombine(players, clones, 0, 0);
        foreach (var_8456f31e in var_38749eb) {
            if (var_8456f31e function_83973173() || var_8456f31e == localplayer) {
                continue;
            }
            if (!isalive(var_8456f31e)) {
                continue;
            }
            bundle = var_55336d8d;
            player = var_8456f31e;
            if (isdefined(var_8456f31e.var_61733ff2) && var_8456f31e.var_61733ff2) {
                player = var_8456f31e.owner;
            }
            if (isplayer(player) && player hasperk(local_client_num, #"specialty_sixthsensejammer")) {
                bundle = var_c394e130;
            }
            var_7aeac1e7 = 0;
            speed = var_8456f31e getspeed();
            var_d6ff0766 = 0;
            var_629e57e0 = distance2dsquared(var_8456f31e.origin, localplayer.origin);
            if (!var_7aeac1e7) {
                if (speed >= bundle.var_293163bd) {
                    var_b7dddf15 = var_8456f31e getmovementtype();
                    if (isplayer(player) && (player isplayerswimming() || player function_d76efdcc())) {
                        var_b7dddf15 = "";
                    }
                    switch (var_b7dddf15) {
                    case #"run":
                    case #"walk":
                        if (var_8456f31e isplayerads()) {
                            var_d6ff0766 = bundle.var_2b6e9133 * range;
                            var_7aeac1e7 = 1;
                        } else {
                            stance = var_8456f31e getstance();
                            if (stance == "stand") {
                                var_d6ff0766 = bundle.var_dbf6038b * range;
                                var_7aeac1e7 = 1;
                            } else if (stance == "crouch") {
                                var_d6ff0766 = bundle.var_dccff18f * range;
                                var_7aeac1e7 = 1;
                            }
                        }
                        break;
                    case #"sprint":
                        var_d6ff0766 = bundle.var_a8e88375 * range;
                        var_7aeac1e7 = 1;
                        break;
                    }
                } else if (speed <= (isdefined(bundle.var_6cb0467e) ? bundle.var_6cb0467e : 0) && (isdefined(bundle.var_ad484b97) ? bundle.var_ad484b97 : 0) != 0) {
                    var_d6ff0766 = (isdefined(bundle.var_ad484b97) ? bundle.var_ad484b97 : 0) * range;
                    if (var_629e57e0 < var_d6ff0766 * var_d6ff0766) {
                        var_7aeac1e7 = 1;
                    }
                }
            }
            if (isdefined(var_8456f31e.var_629d0f94)) {
                var_fd081905 = getarraykeys(var_8456f31e.var_629d0f94);
                foreach (action in var_fd081905) {
                    var_aaf15d9a = var_8456f31e.var_629d0f94[action];
                    if (!isdefined(var_aaf15d9a)) {
                        continue;
                    }
                    if (gettime() - var_aaf15d9a > 500) {
                        action = [];
                    } else {
                        var_7cecdeb5 = function_365c39ef(action, bundle) * range;
                        if (!var_7aeac1e7 || function_3edf2cf8(var_629e57e0, var_d6ff0766, var_7cecdeb5)) {
                            var_d6ff0766 = var_7cecdeb5;
                            var_7aeac1e7 = 1;
                        }
                    }
                }
                arrayremovevalue(var_8456f31e.var_629d0f94, undefined, 1);
            }
            if (!var_7aeac1e7) {
                continue;
            }
            var_482e2661 = var_d6ff0766 * var_d6ff0766;
            var_bc27e2a7 = var_d6ff0766 == 0 || var_629e57e0 < var_482e2661;
            if (var_bc27e2a7) {
                vector = var_8456f31e.origin - localplayer.origin;
                var_f4670d99 = vectornormalize((vector[0], vector[1], 0));
                var_e8a47c93 = vectordot(var_f4670d99, var_2108387f);
                if (var_629e57e0 < range * bundle.var_7c9cab4f * range * bundle.var_7c9cab4f) {
                    var_c729e60c = 8;
                } else {
                    var_c729e60c = 2;
                }
                if (var_e8a47c93 > 0.707107) {
                    var_77378edb = var_77378edb | var_c729e60c << 0;
                } else if (var_e8a47c93 < -0.707107) {
                    var_77378edb = var_77378edb | var_c729e60c << 9;
                } else {
                    var_eddbb98b = anglestoright(playerangles);
                    var_21060744 = vectordot(var_f4670d99, var_eddbb98b) < 0;
                    if (var_e8a47c93 > 0) {
                        var_77378edb = var_77378edb | var_c729e60c << (var_21060744 ? 15 : 3);
                    } else {
                        var_77378edb = var_77378edb | var_c729e60c << (var_21060744 ? 12 : 6);
                    }
                }
            }
        }
        if (var_77378edb) {
            var_da5c86a8 = 0;
            if (var_ea2d507b != var_77378edb && var_4ba3d252 >= 0.05) {
                var_277a1951 = var_77378edb;
                for (i = 0; i < 6; i++) {
                    self thread function_c90f8547(var_c948d7f9[i], var_277a1951 & (1 << 4) - 1, bundle.var_a3d426e6);
                    var_277a1951 = var_277a1951 >> 3;
                }
                var_4ba3d252 = 0;
                diff = var_77378edb ^ var_ea2d507b;
                if (diff & var_77378edb) {
                    shouldplaysound = 0;
                    if (shouldplaysound) {
                        self playsound(local_client_num, #"hash_6e752420fbfa8a76");
                    }
                }
                if (diff & var_ea2d507b) {
                }
                var_ea2d507b = var_77378edb;
            }
            var_4ba3d252 = var_4ba3d252 + 0.05;
        } else {
            var_4ba3d252 = 0;
            if (var_ea2d507b != 0 && var_da5c86a8 >= 0.05) {
                for (i = 0; i < 6; i++) {
                    self thread function_c90f8547(var_c948d7f9[i], 0, bundle.var_a3d426e6);
                }
                var_ea2d507b = 0;
            }
            var_da5c86a8 = var_da5c86a8 + 0.05;
        }
        wait(0.05);
    }
    setuimodelvalue(var_e4ed29e4, 1);
}

// Namespace perks/perks
// Params 3, eflags: 0x1 linked
// Checksum 0x1fdfb470, Offset: 0x2e08
// Size: 0x64
function function_c90f8547(var_8bced359, var_832d6681, delay_time) {
    self endon(#"death");
    if (isdefined(delay_time) && delay_time > 0) {
        wait(delay_time);
    }
    setuimodelvalue(var_8bced359, var_832d6681);
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x69240b42, Offset: 0x2e78
// Size: 0xc2
function function_c2b5b27c(local_client_num) {
    self endon(#"death");
    self.var_7122b2ff = 1;
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"hash_f741860b69ec1b1");
        if (isdefined(waitresult.var_53714565)) {
            var_9f19a239 = waitresult.var_53714565;
            if (!isdefined(var_9f19a239.var_629d0f94)) {
                var_9f19a239.var_629d0f94 = [];
            }
            var_9f19a239.var_629d0f94[waitresult.action] = gettime();
        }
    }
}

