// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_cleanup_mgr.gsc;
#include script_3aa0f32b70d4f7cb;
#include script_caf007e2a98afa2;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/spawner_shared.gsc;

#namespace zm_ai_zipline;

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 0, eflags: 0x2
// Checksum 0x5a7e462c, Offset: 0x100
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_zipline", &__init__, &__main__, undefined);
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 0, eflags: 0x1 linked
// Checksum 0xcdc67937, Offset: 0x150
// Size: 0x3ae
function __init__() {
    /#
        assert(isscriptfunctionptr(&function_dedfe444));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a881cd7648d875a", &function_dedfe444);
    /#
        assert(isscriptfunctionptr(&function_79554a79));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6049ac9ce94751b0", &function_79554a79);
    /#
        assert(!isdefined(&function_fc646a7e) || isscriptfunctionptr(&function_fc646a7e));
    #/
    /#
        assert(!isdefined(&function_d31cb502) || isscriptfunctionptr(&function_d31cb502));
    #/
    /#
        assert(!isdefined(&function_1a4b60ca) || isscriptfunctionptr(&function_1a4b60ca));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"ziplinetraverse", &function_fc646a7e, &function_d31cb502, &function_1a4b60ca);
    /#
        assert(!isdefined(&function_a2185434) || isscriptfunctionptr(&function_a2185434));
    #/
    /#
        assert(!isdefined(&function_48ef356e) || isscriptfunctionptr(&function_48ef356e));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"ziplinerelease", &function_a2185434, &function_48ef356e, undefined);
    /#
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
    #/
    zm_cleanup::function_cdf5a512(#"zombie", &function_16f40942);
    level.var_e5a996e8 = &function_e5a996e8;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x508
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 3, eflags: 0x1 linked
// Checksum 0x9512dd20, Offset: 0x518
// Size: 0x96
function function_61418721(point, line_start, line_end) {
    var_13d62e0a = point - line_start;
    var_1ad356b8 = vectornormalize(line_end - line_start);
    var_f6451fc1 = vectordot(var_13d62e0a, var_1ad356b8);
    closest_point = line_start + var_1ad356b8 * var_f6451fc1;
    return closest_point;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 4, eflags: 0x1 linked
// Checksum 0x2a1df6a2, Offset: 0x5b8
// Size: 0xdc
function number_b_(var_5c57c958, var_f3e138f3, var_3800dad7, plane_normal) {
    var_a979e3a2 = vectordot(plane_normal, var_f3e138f3);
    result = undefined;
    if (abs(var_a979e3a2) > 0.001) {
        var_fa608360 = var_3800dad7 - var_5c57c958;
        var_bc4566f4 = vectordot(var_fa608360, plane_normal);
        hit_time = var_bc4566f4 / var_a979e3a2;
        if (hit_time >= 0) {
            result = hit_time;
        }
    }
    return result;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 3, eflags: 0x0
// Checksum 0xf5935d8d, Offset: 0x6a0
// Size: 0x674
function function_dc61ccae(vnd_start, var_6f06d19d, var_ca144d1e) {
    self endon(#"death");
    self.var_b20b0960 endon(#"death");
    while (1) {
        waitframe(1);
        enabled = getdvarint(#"hash_6e0cbdce6b2104a3", 0);
        if (enabled) {
            var_8e89eaf2 = self gettagorigin("tag_weapon_left");
            var_bb4eaebf = getvehiclenode(vnd_start.target, "targetname");
            var_3573db0e = function_61418721(var_8e89eaf2, vnd_start.origin, var_bb4eaebf.origin);
            var_f687fa19 = var_3573db0e - var_8e89eaf2;
            var_56b5839 = length(var_f687fa19);
            /#
                sphere(self.var_b20b0960.origin, 2, (0, 1, 0), 0.3, 0, 8, 1);
                line(var_8e89eaf2, var_3573db0e, (1, 1, 0));
                sphere(var_8e89eaf2, 2, (1, 0.5, 0), 0.3, 0, 8, 1);
            #/
            if (isdefined(var_6f06d19d) && isdefined(var_ca144d1e)) {
                var_af2e4b51 = function_61418721(self.var_b20b0960.origin, var_6f06d19d, var_ca144d1e);
                var_2b30dcba = vectornormalize(self.var_b20b0960.origin - var_af2e4b51);
                var_41aabd6d = number_b_(self.var_b20b0960.origin, (0, 0, 1), var_af2e4b51, var_2b30dcba);
                if (isdefined(var_41aabd6d)) {
                    var_b43bc141 = self.var_b20b0960.origin + (0, 0, 1) * var_41aabd6d;
                    height_difference = var_b43bc141[2] - self.var_b20b0960.origin[2];
                    /#
                        line(self.var_b20b0960.origin, var_b43bc141, (1, 0, 1));
                        record3dtext("<unknown string>" + height_difference, self.var_b20b0960.origin, (1, 1, 1), "<unknown string>");
                    #/
                }
                var_3a080e11 = function_61418721(var_8e89eaf2, var_6f06d19d, var_ca144d1e);
                var_2eb8d479 = var_3a080e11 + (0, 0, 1);
                forward = vectornormalize(var_bb4eaebf.origin - vnd_start.origin);
                right = vectorcross((0, 0, 1), forward);
                up = vectorcross(forward, right);
                angles = axistoangles(forward, up);
                var_c246e8d5 = coordtransformtranspose(var_3a080e11, var_8e89eaf2, angles);
                var_e941deaa = vectornormalize(var_c246e8d5);
                /#
                    line(var_8e89eaf2, var_8e89eaf2 + var_c246e8d5, (1, 0, 1));
                    line(var_6f06d19d, var_ca144d1e, (1, 0.5, 0));
                    line(var_8e89eaf2, var_3a080e11, (1, 1, 0));
                    sphere(var_6f06d19d, 8, (1, 0.5, 0), 0.3, 0, 8, 1);
                    sphere(var_ca144d1e, 8, (1, 0.5, 0), 0.3, 0, 8, 1);
                    record3dtext("<unknown string>" + var_c246e8d5, var_8e89eaf2 + var_c246e8d5, (1, 1, 1), "<unknown string>");
                #/
            }
            var_31120f24 = vnd_start;
            while (isdefined(var_31120f24.target)) {
                var_bb4eaebf = getvehiclenode(var_31120f24.target, "targetname");
                /#
                    sphere(var_31120f24.origin, 5, (1, 1, 0), 1, 0, 8, 1);
                    sphere(var_bb4eaebf.origin, 5, (1, 1, 0), 1, 0, 8, 1);
                    line(var_31120f24.origin, var_bb4eaebf.origin, (1, 1, 0));
                #/
                var_31120f24 = var_bb4eaebf;
            }
        }
    }
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 2, eflags: 0x1 linked
// Checksum 0x1f0c2ae0, Offset: 0xd20
// Size: 0x9c
function function_aeb6539c(origin, angles) {
    self endon(#"disconnect");
    self.var_f22c83f5 = 1;
    self.var_e75517b1 = 1;
    self.allowpain = 0;
    self forceteleport(origin, angles);
    self linkto(self.var_b20b0960, "tag_origin", (0, 0, 0), angles * (-1, 0, 0));
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 1, eflags: 0x5 linked
// Checksum 0x5d33bd4, Offset: 0xdc8
// Size: 0xcc
function private function_dedfe444(entity) {
    if (isdefined(entity.traversestartnode) && isdefined(entity.traversestartnode.script_noteworthy) && entity.traversestartnode.script_noteworthy == "zipline_traversal" && isdefined(entity.traversestartnode.var_e45a0969) && entity shouldstarttraversal()) {
        /#
            record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>");
        #/
        return 1;
    }
    return 0;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 1, eflags: 0x5 linked
// Checksum 0xfeff4ad6, Offset: 0xea0
// Size: 0x46
function private function_79554a79(entity) {
    entity.vnd_start = getvehiclenode(entity.traversestartnode.var_e45a0969, "targetname");
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 0, eflags: 0x5 linked
// Checksum 0xd035c677, Offset: 0xef0
// Size: 0x52
function private function_4e6fe1be() {
    self endon(#"death");
    self.var_b20b0960 = spawner::simple_spawn_single(getent("veh_fasttravel", "targetname"));
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 2, eflags: 0x5 linked
// Checksum 0x11351eb9, Offset: 0xf50
// Size: 0x60
function private function_fc646a7e(entity, asmstatename) {
    animationstatenetworkutility::requeststate(entity, asmstatename);
    entity.var_bf8dfaf4 = 1;
    entity.var_b20b0960 = undefined;
    entity thread function_4e6fe1be();
    return 5;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 2, eflags: 0x5 linked
// Checksum 0x51447abc, Offset: 0xfb8
// Size: 0x26a
function private function_d31cb502(entity, asmstatename) {
    result = 5;
    if (isdefined(entity.var_b20b0960)) {
        if (!(isdefined(entity.var_b20b0960.vehonpath) && entity.var_b20b0960.vehonpath)) {
            entity.var_b20b0960.origin = entity.vnd_start.origin;
            entity.var_b20b0960.angles = entity.vnd_start.angles;
            entity.var_b20b0960 setspeed(32);
            entity function_aeb6539c(entity.vnd_start.origin, entity.vnd_start.angles);
            entity.var_b20b0960 thread vehicle::get_on_and_go_path(entity.vnd_start);
            /#
                line_start = struct::get(entity.vnd_start.target + "<unknown string>", "<unknown string>");
                line_end = struct::get(entity.vnd_start.target + "<unknown string>", "<unknown string>");
                if (isdefined(line_start) && isdefined(line_end)) {
                    self thread function_dc61ccae(entity.vnd_start, line_start.origin, line_end.origin);
                } else {
                    self thread function_dc61ccae(entity.vnd_start);
                }
            #/
        } else if (isdefined(entity.var_b20b0960.var_d4b82e45) && entity.var_b20b0960.var_d4b82e45 == 1) {
            result = 4;
        }
    }
    return result;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 2, eflags: 0x5 linked
// Checksum 0x1b78c402, Offset: 0x1230
// Size: 0x78
function private function_1a4b60ca(entity, asmstatename) {
    entity unlink();
    entity.var_bf8dfaf4 = 0;
    entity.allowpain = 1;
    if (isdefined(self.var_b20b0960)) {
        entity.var_b20b0960 delete();
    }
    return 4;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 2, eflags: 0x5 linked
// Checksum 0x2eb2e8fe, Offset: 0x12b0
// Size: 0x30
function private function_a2185434(entity, asmstatename) {
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 2, eflags: 0x5 linked
// Checksum 0x7ccf266b, Offset: 0x12e8
// Size: 0x4a
function private function_48ef356e(entity, asmstatename) {
    result = 5;
    if (entity isonground()) {
        result = 4;
    }
    return result;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 0, eflags: 0x5 linked
// Checksum 0xcfe4ecc9, Offset: 0x1340
// Size: 0x38
function private function_16f40942() {
    result = 0;
    if (isdefined(self.var_bf8dfaf4) && self.var_bf8dfaf4) {
        result = 1;
    }
    return result;
}

// Namespace zm_ai_zipline/zm_ai_zipline
// Params 2, eflags: 0x5 linked
// Checksum 0x929c00d2, Offset: 0x1380
// Size: 0x9a
function private function_e5a996e8(player, zone) {
    result = undefined;
    if (isdefined(player.last_valid_position)) {
        result = function_52c1730(player.last_valid_position, zone.nodes, 500);
    } else {
        result = function_52c1730(player.origin, zone.nodes, 500);
    }
    return result;
}

