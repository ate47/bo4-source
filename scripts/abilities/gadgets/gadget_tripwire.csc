// Atian COD Tools GSC decompiler test
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace gadget_tripwire;

// Namespace gadget_tripwire/gadget_tripwire
// Params 0, eflags: 0x2
// Checksum 0x8202d603, Offset: 0x1d8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_tripwire", &__init__, undefined, undefined);
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0, eflags: 0x0
// Checksum 0x5b127090, Offset: 0x220
// Size: 0x258
function __init__() {
    callback::on_killcam_begin(&function_330a13a6);
    callback::on_killcam_end(&function_330a13a6);
    callback::add_callback(#"hash_2fc4cfecaed47583", &function_bd054816);
    clientfield::register("missile", "tripwire_state", 1, 2, "int", &function_6868fab3, 1, 1);
    clientfield::register("scriptmover", "tripwire_solo_beam_fx", 1, 1, "int", &function_9233eb94, 0, 0);
    level.var_c27600b0 = getweapon("eq_tripwire");
    if (isdefined(level.var_c27600b0.customsettings)) {
        level.var_c72e8c51 = getscriptbundle(level.var_c27600b0.customsettings);
    } else {
        level.var_c72e8c51 = getscriptbundle("tripwire_custom_settings");
    }
    if (!isdefined(level.var_77cae643)) {
        level.var_77cae643 = [];
    }
    level.tripwire = {#wires:[], #localclients:[]};
    for (i = 0; i < getmaxlocalclients(); i++) {
        level.tripwire.localclients[i] = {#beams:[], #previs:0, #model:undefined};
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0x415fb473, Offset: 0x480
// Size: 0xda
function function_330a13a6(params) {
    foreach (beam_id in level.tripwire.localclients[params.localclientnum].beams) {
        if (isdefined(beam_id)) {
            beamkill(params.localclientnum, beam_id);
        }
    }
    level.tripwire.localclients[params.localclientnum].beams = [];
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0x6dc85a78, Offset: 0x568
// Size: 0x6e
function function_bd054816(params) {
    if (level.var_c27600b0 != params.offhand_weapon) {
        return;
    }
    if (params.using_offhand) {
        function_17d973ec(params.localclientnum);
        return;
    }
    self notify(#"hash_726805ec8cfae188");
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 7, eflags: 0x0
// Checksum 0x12167ed6, Offset: 0x5e0
// Size: 0x252
function function_6868fab3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    starttime = gettime();
    while (isdefined(self) && !self hasdobj(localclientnum)) {
        if (gettime() - starttime > 1000) {
            return;
        }
        waitframe(1);
    }
    if (!isdefined(self)) {
        return;
    }
    if (bwastimejump) {
        function_6230a8a5(localclientnum);
    }
    switch (newval) {
    case 1:
        arrayinsert(level.tripwire.wires, self, level.tripwire.wires.size);
        self callback::on_shutdown(&function_6230a8a5);
        self thread function_55c50f15();
        break;
    case 2:
    case 3:
        foreach (beam_id in level.tripwire.localclients[localclientnum].beams) {
            if (isdefined(beam_id)) {
                beamkill(localclientnum, beam_id);
            }
        }
        level.tripwire.localclients[localclientnum].beams = [];
        self thread function_55c50f15();
        break;
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0xad6c4c69, Offset: 0x840
// Size: 0x34
function function_6230a8a5(localclientnum) {
    arrayremovevalue(level.tripwire.wires, self);
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0xbbef556d, Offset: 0x880
// Size: 0x30
function function_a4b3da97(trace) {
    if (trace[#"fraction"] < 1) {
        return false;
    }
    return true;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0, eflags: 0x0
// Checksum 0x2efb3d0, Offset: 0x8b8
// Size: 0x3fc
function function_55c50f15() {
    self endon(#"death");
    foreach (tripwire in level.tripwire.wires) {
        if (!isdefined(tripwire)) {
            continue;
        }
        if (self.ownernum != tripwire.ownernum) {
            continue;
        }
        if (self == tripwire) {
            continue;
        }
        if (distancesquared(tripwire.origin, self.origin) >= 100 && distancesquared(tripwire.origin, self.origin) <= level.var_c72e8c51.var_831055cb * level.var_c72e8c51.var_831055cb) {
            pos = self gettagorigin("tag_fx");
            otherpos = tripwire gettagorigin("tag_fx");
            if (isdefined(pos) && isdefined(otherpos)) {
                trace = beamtrace(pos, otherpos, 0, self, 0, tripwire);
                var_f2edf308 = beamtrace(otherpos, pos, 0, self, 0, tripwire);
                if (self function_a4b3da97(trace) && self function_a4b3da97(var_f2edf308)) {
                    if (isdefined(level.localplayers)) {
                        foreach (player in level.localplayers) {
                            if (isdefined(player)) {
                                if (player util::isenemyteam(self.owner.team)) {
                                    if (isdefined(level.var_c72e8c51.var_10e5bb56) && level.var_c72e8c51.var_10e5bb56) {
                                        beamname = "beam8_plyr_equip_ied_enmy_wz";
                                    } else {
                                        beamname = "beam8_plyr_equip_ied_enmy";
                                    }
                                } else if (isdefined(level.var_c72e8c51.var_10e5bb56) && level.var_c72e8c51.var_10e5bb56) {
                                    beamname = "beam8_plyr_equip_ied_frnd_wz";
                                } else {
                                    beamname = "beam8_plyr_equip_ied_frnd";
                                }
                                beam_id = player beam::launch(tripwire, "tag_fx", self, "tag_fx", beamname);
                                arrayinsert(level.tripwire.localclients[player.localclientnum].beams, beam_id, level.tripwire.localclients[player.localclientnum].beams.size);
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 7, eflags: 0x0
// Checksum 0x58369324, Offset: 0xcc0
// Size: 0xcc
function function_9233eb94(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self endon(#"death");
        self util::waittill_dobj(localclientnum);
        self.beam_fx = util::playfxontag(localclientnum, #"hash_253c31a9114d6029", self, "tag_origin");
        return;
    }
    if (isdefined(self.beam_fx)) {
        killfx(localclientnum, self.beam_fx);
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0x85ac8766, Offset: 0xd98
// Size: 0x7e
function function_2a919ef0(localclientnum) {
    currentoffhand = function_e9fe14ee(localclientnum);
    if (level.var_c27600b0 != currentoffhand) {
        return false;
    }
    if (!function_96d4f30e(localclientnum)) {
        return false;
    }
    if (!function_182a2ad3(localclientnum)) {
        return false;
    }
    return true;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0xe20fb4dc, Offset: 0xe20
// Size: 0x2de
function function_17d973ec(localclientnum) {
    self endon(#"death");
    self notify(#"hash_726805ec8cfae188");
    self endon(#"hash_726805ec8cfae188");
    self thread function_b882ca33(localclientnum);
    level.tripwire.localclients[localclientnum].previs = 0;
    var_9480bc93 = 0;
    level.var_41427f32 = undefined;
    while (true) {
        var_9480bc93 = level.tripwire.localclients[localclientnum].previs;
        level.tripwire.localclients[localclientnum].previs = function_2a919ef0(localclientnum);
        if (level.tripwire.localclients[localclientnum].previs) {
            if (!isdefined(level.tripwire.localclients[localclientnum].model)) {
                spawn_previs(localclientnum);
            }
            if (!var_9480bc93) {
                var_e7640260 = 1;
                level.tripwire.localclients[localclientnum].model show();
            }
            update_previs(localclientnum);
        } else if (var_9480bc93 && !level.tripwire.localclients[localclientnum].previs) {
            level.tripwire.localclients[localclientnum].model notify(#"death");
            level.tripwire.localclients[localclientnum].model delete();
            level.tripwire.localclients[localclientnum].model = undefined;
            function_c51a3b22();
            function_dc76d0d0(localclientnum);
            if (objective_state(localclientnum, self.var_61df85ff) != "invisible") {
                objective_setstate(localclientnum, self.var_61df85ff, "invisible");
            }
        }
        waitframe(1);
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0x14538828, Offset: 0x1108
// Size: 0xa4
function function_b882ca33(localclientnum) {
    self waittill(#"death");
    if (isdefined(level.tripwire.localclients[self.localclientnum].model)) {
        level.tripwire.localclients[self.localclientnum].model hide();
    }
    function_6b69576b();
    function_dc76d0d0(localclientnum);
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0x38c946e8, Offset: 0x11b8
// Size: 0x82
function spawn_previs(localclientnum) {
    localplayer = function_5c10bd79(localclientnum);
    level.tripwire.localclients[localclientnum].model = spawn(localclientnum, (0, 0, 0), "script_model", localplayer getentitynumber());
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 3, eflags: 0x0
// Checksum 0xb3a73cef, Offset: 0x1248
// Size: 0xcc
function function_3e8d9b27(local_client_num, previs_weapon, validlocation) {
    if (validlocation) {
        level.tripwire.localclients[local_client_num].model setmodel(#"hash_2edbbbe63af8213d");
    } else {
        level.tripwire.localclients[local_client_num].model setmodel(#"hash_6c54a3e97ce636f0");
    }
    level.tripwire.localclients[local_client_num].model notsolid();
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0, eflags: 0x0
// Checksum 0x91dfd9f9, Offset: 0x1320
// Size: 0x5c
function function_95d56693() {
    for (i = 0; i < level.var_77cae643.size; i++) {
        if (level.var_77cae643[i].shoulddraw == 0) {
            return i;
        }
    }
    return level.var_77cae643.size;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0x1971ba56, Offset: 0x1388
// Size: 0x54c
function update_previs(localclientnum) {
    player = self;
    function_3e8d9b27(localclientnum, level.var_c27600b0, 1);
    facing_angles = getlocalclientangles(localclientnum);
    forward = anglestoforward(facing_angles);
    up = anglestoup(facing_angles);
    velocity = function_711c258(forward, up, level.var_c27600b0);
    eye_pos = getlocalclienteyepos(localclientnum);
    trace1 = function_e6ba3ec9(eye_pos, velocity, 0, level.var_c27600b0, level.var_41427f32);
    level.tripwire.localclients[localclientnum].model.origin = trace1[#"position"];
    level.tripwire.localclients[localclientnum].model.angles = (angleclamp180(vectortoangles(trace1[#"normal"])[0] + 90), vectortoangles(trace1[#"normal"])[1], 0);
    level.tripwire.localclients[localclientnum].model.hitent = trace1[#"entity"];
    if (isdefined(level.tripwire.localclients[localclientnum].model.hitent) && level.tripwire.localclients[localclientnum].model.hitent.weapon == level.var_c27600b0) {
        level.var_41427f32 = level.tripwire.localclients[localclientnum].model.hitent;
    }
    if (level.tripwire.wires.size > 0) {
        level.tripwire.localclients[localclientnum].model function_adb3eb2c(localclientnum);
    } else if (!isdefined(level.tripwire.localclients[localclientnum].model.var_2045ae5c)) {
        level.tripwire.localclients[localclientnum].model.var_2045ae5c = util::playfxontag(localclientnum, #"hash_79d94632506eafee", level.tripwire.localclients[localclientnum].model, "tag_fx");
    }
    if (!isdefined(player.var_61df85ff)) {
        player.var_61df85ff = util::getnextobjid(localclientnum);
        player thread function_810faece(localclientnum, player.var_61df85ff);
    }
    if (isdefined(player.var_61df85ff) && !ispc()) {
        obj_id = player.var_61df85ff;
        if (function_a8cb5322(localclientnum) && !shoutcaster::is_shoutcaster(localclientnum)) {
            objective_add(localclientnum, obj_id, "active", #"tripwire_placement", trace1[#"position"]);
            objective_setgamemodeflags(localclientnum, obj_id, 0);
        } else if (objective_state(localclientnum, obj_id) != "invisible") {
            objective_setstate(localclientnum, obj_id, "invisible");
        }
    }
    function_c51a3b22();
    function_dc76d0d0(localclientnum);
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 4, eflags: 0x0
// Checksum 0xcc1b842d, Offset: 0x18e0
// Size: 0x14a
function function_26c580d9(localclientnum, tripwire, trace, var_f2edf308) {
    if (isdefined(level.tripwire.localclients[localclientnum].model.hitent) && isplayer(level.tripwire.localclients[localclientnum].model.hitent)) {
        return false;
    }
    if (distancesquared(tripwire.origin, self.origin) < 100) {
        return false;
    }
    if (distancesquared(tripwire.origin, self.origin) > level.var_c72e8c51.var_831055cb * level.var_c72e8c51.var_831055cb) {
        return false;
    }
    if (!self function_a4b3da97(trace) || !self function_a4b3da97(var_f2edf308)) {
        return false;
    }
    return true;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0x30d2f1c, Offset: 0x1a38
// Size: 0x302
function function_adb3eb2c(localclientnum) {
    self.var_c2f0f6da = 0;
    for (i = 0; i < level.tripwire.wires.size; i++) {
        tripwire = level.tripwire.wires[i];
        if (!isdefined(tripwire)) {
            continue;
        }
        if (self.ownernum != tripwire.ownernum) {
            continue;
        }
        var_1eb381e1 = function_8c308396(self, tripwire);
        pos = self gettagorigin("tag_fx");
        if (!isdefined(pos)) {
            pos = self.origin;
        }
        otherpos = tripwire gettagorigin("tag_fx");
        if (!isdefined(otherpos)) {
            otherpos = tripwire.origin;
        }
        trace = beamtrace(pos, otherpos, 0, self, 0, tripwire);
        var_f2edf308 = beamtrace(otherpos, pos, 0, self, 0, tripwire);
        if (function_26c580d9(localclientnum, tripwire, trace, var_f2edf308)) {
            self.var_c2f0f6da = 1;
            if (!isdefined(var_1eb381e1)) {
                newbeam = spawnstruct();
                newbeam.ent1 = self;
                newbeam.ent2 = tripwire;
                newbeam.shoulddraw = 1;
                newbeam.beam_id = undefined;
                level.var_77cae643[function_95d56693()] = newbeam;
            } else if (isdefined(var_1eb381e1) && !var_1eb381e1.shoulddraw) {
                var_1eb381e1.shoulddraw = 1;
            }
            if (isdefined(self.var_2045ae5c)) {
                killfx(localclientnum, self.var_2045ae5c);
                self.var_2045ae5c = undefined;
            }
            continue;
        }
        if (isdefined(var_1eb381e1)) {
            var_1eb381e1.shoulddraw = 0;
        }
    }
    if (!isdefined(self.var_2045ae5c) && !self.var_c2f0f6da) {
        self.var_2045ae5c = util::playfxontag(localclientnum, #"hash_79d94632506eafee", self, "tag_fx");
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x0
// Checksum 0xcf53b3ab, Offset: 0x1d48
// Size: 0x160
function function_dc76d0d0(localclientnum) {
    for (i = 0; i < level.var_77cae643.size; i++) {
        beam = level.var_77cae643[i];
        if (beam.shoulddraw && !isdefined(beam.beam_id) && isdefined(beam.ent1) && isdefined(beam.ent2)) {
            level.var_77cae643[i].beam_id = level beam::function_cfb2f62a(localclientnum, beam.ent1, "tag_fx", beam.ent2, "tag_fx", "beam8_plyr_equip_ied_previs");
            continue;
        }
        if (beam.shoulddraw == 0 && isdefined(beam.beam_id)) {
            beam::function_47deed80(localclientnum, beam.beam_id);
            level.var_77cae643[i].beam_id = undefined;
        }
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0, eflags: 0x0
// Checksum 0x781aa01f, Offset: 0x1eb0
// Size: 0x98
function function_c51a3b22() {
    for (i = 0; i < level.var_77cae643.size; i++) {
        beam = level.var_77cae643[i];
        if (!isdefined(beam) || !isdefined(beam.ent1) || !isdefined(beam.ent2)) {
            level.var_77cae643[i].shoulddraw = 0;
        }
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0, eflags: 0x0
// Checksum 0xf5843350, Offset: 0x1f50
// Size: 0x48
function function_6b69576b() {
    for (i = 0; i < level.var_77cae643.size; i++) {
        level.var_77cae643[i].shoulddraw = 0;
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 2, eflags: 0x0
// Checksum 0x14cfa5ee, Offset: 0x1fa0
// Size: 0xaa
function function_8c308396(ent1, ent2) {
    foreach (beam in level.var_77cae643) {
        if (beam.ent1 == ent1 && beam.ent2 == ent2) {
            return beam;
        }
    }
    return undefined;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 2, eflags: 0x0
// Checksum 0x22628350, Offset: 0x2058
// Size: 0x6c
function function_810faece(local_client_num, objective_id) {
    self waittill(#"death", #"disconnect", #"team_changed");
    if (isdefined(objective_id)) {
        objective_delete(local_client_num, objective_id);
    }
}

