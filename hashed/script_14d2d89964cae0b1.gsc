// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/struct.csc;

#namespace gibclientutils;

// Namespace gibclientutils/gib
// Params 0, eflags: 0x2
// Checksum 0xab3427a1, Offset: 0x228
// Size: 0xbc
function autoexec main() {
    clientfield::register("actor", "gib_state", 1, 9, "int", &_gibhandler, 0, 0);
    clientfield::register("playercorpse", "gib_state", 1, 15, "int", &_gibhandler, 0, 0);
    level.var_ad0f5efa = [];
    level thread _annihilatecorpse();
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xe7027f20, Offset: 0x2f0
// Size: 0x306
function private function_3aa023f1(name) {
    if (!isdefined(name)) {
        return undefined;
    }
    gibdef = level.var_ad0f5efa[name];
    if (isdefined(gibdef)) {
        return gibdef;
    }
    var_59dc51d9 = struct::get_script_bundle("gibcharacterdef", name);
    if (!isdefined(var_59dc51d9)) {
        /#
            assertmsg("<unknown string>" + name);
        #/
        return undefined;
    }
    var_189ec5c0 = [];
    var_189ec5c0[2] = "annihilate";
    var_189ec5c0[8] = "head";
    var_189ec5c0[16] = "rightarm";
    var_189ec5c0[32] = "leftarm";
    var_189ec5c0[128] = "rightleg";
    var_189ec5c0[256] = "leftleg";
    gibpieces = [];
    foreach (gibflag, var_fee7cbdd in var_189ec5c0) {
        if (!isdefined(var_fee7cbdd)) {
            /#
                assertmsg("<unknown string>" + gibflag);
            #/
        } else {
            var_49e98504 = spawnstruct();
            var_49e98504.var_6d43549d = var_59dc51d9.(var_fee7cbdd + "_gibmodel");
            var_49e98504.var_d241141a = var_59dc51d9.(var_fee7cbdd + "_gibtag");
            var_49e98504.var_f1af9a8e = var_59dc51d9.(var_fee7cbdd + "_gibfx");
            var_49e98504.var_d147aa1c = var_59dc51d9.(var_fee7cbdd + "_gibeffecttag");
            var_49e98504.var_d4be909b = var_59dc51d9.(var_fee7cbdd + "_gibdynentfx");
            var_49e98504.var_42c89fa1 = var_59dc51d9.(var_fee7cbdd + "_gibcinematicfx");
            var_49e98504.var_28882334 = var_59dc51d9.(var_fee7cbdd + "_gibsound");
            var_49e98504.var_7cfc4f8 = var_59dc51d9.(var_fee7cbdd + "_gibhidetag");
            gibpieces[gibflag] = var_49e98504;
        }
    }
    level.var_ad0f5efa[name] = gibpieces;
    return gibpieces;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0x86ef1cf0, Offset: 0x600
// Size: 0x366
function private function_9fe14ca3(entity, gibflag) {
    if (gibflag == 8) {
        part = "head";
    } else if (gibflag == 16 || gibflag == 32) {
        part = "arms";
    } else if (gibflag == 128 || gibflag == 256) {
        part = "legs";
    }
    if (!isdefined(part)) {
        return undefined;
    }
    name = entity getplayergibdef(part);
    if (!isdefined(name)) {
        /#
            assertmsg("<unknown string>" + gibflag);
        #/
        return undefined;
    }
    gibdef = level.var_ad0f5efa[name];
    if (isdefined(gibdef)) {
        return gibdef;
    }
    var_59dc51d9 = struct::get_script_bundle("playeroutfitgibdef", name);
    if (!isdefined(var_59dc51d9)) {
        /#
            assertmsg("<unknown string>" + name);
        #/
        return undefined;
    }
    var_189ec5c0 = [];
    var_189ec5c0[0] = "left";
    var_189ec5c0[1] = "right";
    gibpieces = [];
    foreach (side, var_fee7cbdd in var_189ec5c0) {
        if (!isdefined(var_fee7cbdd)) {
            continue;
        }
        var_49e98504 = spawnstruct();
        var_49e98504.var_6d43549d = var_59dc51d9.(var_fee7cbdd + "_gibmodel");
        var_49e98504.var_d241141a = var_59dc51d9.(var_fee7cbdd + "_gibtag");
        var_49e98504.var_f1af9a8e = var_59dc51d9.(var_fee7cbdd + "_gibfx");
        var_49e98504.var_d147aa1c = var_59dc51d9.(var_fee7cbdd + "_gibeffecttag");
        var_49e98504.var_d4be909b = var_59dc51d9.(var_fee7cbdd + "_gibdynentfx");
        var_49e98504.var_42c89fa1 = var_59dc51d9.(var_fee7cbdd + "_gibcinematicfx");
        var_49e98504.var_28882334 = var_59dc51d9.(var_fee7cbdd + "_gibsound");
        var_49e98504.var_7cfc4f8 = var_59dc51d9.(var_fee7cbdd + "_gibhidetag");
        gibpieces[side] = var_49e98504;
    }
    level.var_ad0f5efa[name] = gibpieces;
    return gibpieces;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x4e90d68, Offset: 0x970
// Size: 0xba
function function_c0099e86(entity, gibflag) {
    var_fee7cbdd = function_9fe14ca3(entity, gibflag);
    if (!isdefined(var_fee7cbdd)) {
        return undefined;
    }
    if (gibflag == 8) {
        side = 0;
    } else if (gibflag == 16 || gibflag == 128) {
        side = 1;
    } else if (gibflag == 32 || gibflag == 256) {
        side = 0;
    }
    return var_fee7cbdd[side];
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0x1d780e81, Offset: 0xa38
// Size: 0xc8
function private function_69db754(entity, gibflag) {
    if (isplayer(entity) || entity isplayercorpse()) {
        return function_c0099e86(entity, gibflag);
    }
    if (isdefined(entity.var_f203d3cd)) {
        gibpieces = function_3aa023f1(entity.var_f203d3cd.gibdef);
    } else {
        gibpieces = function_3aa023f1(entity.gibdef);
    }
    return gibpieces[gibflag];
}

// Namespace gibclientutils/gib
// Params 0, eflags: 0x5 linked
// Checksum 0xbbb1e23, Offset: 0xb08
// Size: 0x240
function private _annihilatecorpse() {
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"corpse_explode");
        localclientnum = waitresult.localclientnum;
        body = waitresult.body;
        origin = waitresult.position;
        if (!util::is_mature() || util::is_gib_restricted_build()) {
            continue;
        }
        if (isdefined(body) && _hasgibdef(body) && body isragdoll()) {
            cliententgibhead(localclientnum, body);
            cliententgibrightarm(localclientnum, body);
            cliententgibleftarm(localclientnum, body);
            cliententgibrightleg(localclientnum, body);
            cliententgibleftleg(localclientnum, body);
        }
        if (isdefined(body) && _hasgibdef(body) && body.archetype == #"human") {
            if (randomint(100) >= 50) {
                continue;
            }
            if (isdefined(origin) && distancesquared(body.origin, origin) <= 14400) {
                body.ignoreragdoll = 1;
                body _gibentity(localclientnum, 50 | 384, 1);
            }
        }
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0x77c28495, Offset: 0xd50
// Size: 0x1d6
function private _clonegibdata(localclientnum, entity, clone) {
    clone.var_f203d3cd = spawnstruct();
    clone.var_f203d3cd.gib_state = entity.gib_state;
    clone.var_f203d3cd.gibdef = entity.gibdef;
    clone.var_f203d3cd.hatmodel = entity.hatmodel;
    clone.var_f203d3cd.head = entity.head;
    clone.var_f203d3cd.legdmg1 = entity.legdmg1;
    clone.var_f203d3cd.legdmg2 = entity.legdmg2;
    clone.var_f203d3cd.legdmg3 = entity.legdmg3;
    clone.var_f203d3cd.legdmg4 = entity.legdmg4;
    clone.var_f203d3cd.torsodmg1 = entity.torsodmg1;
    clone.var_f203d3cd.torsodmg2 = entity.torsodmg2;
    clone.var_f203d3cd.torsodmg3 = entity.torsodmg3;
    clone.var_f203d3cd.torsodmg4 = entity.torsodmg4;
    clone.var_f203d3cd.torsodmg5 = entity.torsodmg5;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0xc1cc393a, Offset: 0xf30
// Size: 0x76
function private _getgibbedstate(localclientnum, entity) {
    if (isdefined(entity.var_f203d3cd) && isdefined(entity.var_f203d3cd.gib_state)) {
        return entity.var_f203d3cd.gib_state;
    } else if (isdefined(entity.gib_state)) {
        return entity.gib_state;
    }
    return 0;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0xf7d34ae0, Offset: 0xfb0
// Size: 0x15a
function private _getgibbedlegmodel(localclientnum, entity) {
    var_8f411bbf = _getgibbedstate(localclientnum, entity);
    var_ef8da8e1 = var_8f411bbf & 128;
    var_5a697610 = var_8f411bbf & 256;
    if (var_ef8da8e1 && var_5a697610) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.legdmg4 : entity.legdmg4);
    } else if (var_ef8da8e1) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.legdmg2 : entity.legdmg2);
    } else if (var_5a697610) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.legdmg3 : entity.legdmg3);
    }
    return isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.legdmg1 : entity.legdmg1;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0xde24fdb6, Offset: 0x1118
// Size: 0xcc
function private _getgibextramodel(var_d9ebff1d, entity, gibflag) {
    if (gibflag == 4) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.hatmodel : entity.hatmodel);
    } else if (gibflag == 8) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.head : entity.head);
    } else {
        /#
            assertmsg("<unknown string>");
        #/
    }
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0x3df54ee8, Offset: 0x11f0
// Size: 0x15a
function private _getgibbedtorsomodel(localclientnum, entity) {
    var_8f411bbf = _getgibbedstate(localclientnum, entity);
    rightarmgibbed = var_8f411bbf & 16;
    leftarmgibbed = var_8f411bbf & 32;
    if (rightarmgibbed && leftarmgibbed) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg2 : entity.torsodmg2);
    } else if (rightarmgibbed) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg2 : entity.torsodmg2);
    } else if (leftarmgibbed) {
        return (isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg3 : entity.torsodmg3);
    }
    return isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg1 : entity.torsodmg1;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0x1db711c0, Offset: 0x1358
// Size: 0x74
function private _gibpiecetag(localclientnum, entity, gibflag) {
    if (!_hasgibdef(self)) {
        return;
    }
    var_fee7cbdd = function_69db754(entity, gibflag);
    if (isdefined(var_fee7cbdd)) {
        return var_fee7cbdd.var_d147aa1c;
    }
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xc65f4ddd, Offset: 0x13d8
// Size: 0x72
function private function_ba120c50(var_6ea41f8a) {
    var_ec7623a6 = 0;
    if (var_6ea41f8a & 12) {
        var_ec7623a6 = var_ec7623a6 | 1;
    }
    if (var_6ea41f8a & 48) {
        var_ec7623a6 = var_ec7623a6 | 2;
    }
    if (var_6ea41f8a & 384) {
        var_ec7623a6 = var_ec7623a6 | 4;
    }
    return var_ec7623a6;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0x33af80c1, Offset: 0x1458
// Size: 0x42e
function private _gibentity(localclientnum, var_6ea41f8a, var_519d22bc) {
    entity = self;
    if (!_hasgibdef(entity)) {
        return;
    }
    var_8274e52c = 2;
    var_f7ac0901 = undefined;
    gibdirscale = undefined;
    if (isplayer(entity) || entity isplayercorpse()) {
        var_ed82c1e6 = var_6ea41f8a >> 9 & 8 - 1;
        yaw = getanglefrombits(var_ed82c1e6, 3);
        var_f7ac0901 = anglestoforward((0, yaw, 0));
    }
    while (var_6ea41f8a >= var_8274e52c) {
        if (var_6ea41f8a & var_8274e52c) {
            if (var_8274e52c == 2) {
                if (isplayer(entity) || entity isplayercorpse()) {
                    var_c0c9eae3 = entity function_4976d5ee();
                    _playgibfx(localclientnum, entity, var_c0c9eae3[#"fx"], var_c0c9eae3[#"tag"]);
                } else {
                    var_fee7cbdd = function_69db754(entity, var_8274e52c);
                    if (isdefined(var_fee7cbdd)) {
                        _playgibfx(localclientnum, entity, var_fee7cbdd.var_f1af9a8e, var_fee7cbdd.var_d147aa1c);
                        if (isdefined(var_fee7cbdd.var_42c89fa1)) {
                            if (function_92beaa28(localclientnum)) {
                                _playgibfx(localclientnum, entity, var_fee7cbdd.var_42c89fa1, var_fee7cbdd.var_d147aa1c);
                            }
                        }
                        _playgibsound(localclientnum, entity, var_fee7cbdd.var_28882334);
                    }
                }
                entity hide();
                entity.ignoreragdoll = 1;
            } else {
                var_fee7cbdd = function_69db754(entity, var_8274e52c);
                if (isdefined(var_fee7cbdd)) {
                    if (var_519d22bc) {
                        var_cd61eb7d = function_ba120c50(var_8274e52c);
                        entity thread _gibpiece(localclientnum, entity, var_fee7cbdd.var_6d43549d, var_fee7cbdd.var_d241141a, var_fee7cbdd.var_d4be909b, var_f7ac0901, gibdirscale, var_cd61eb7d);
                    }
                    _playgibfx(localclientnum, entity, var_fee7cbdd.var_f1af9a8e, var_fee7cbdd.var_d147aa1c);
                    if (isdefined(var_fee7cbdd.var_42c89fa1)) {
                        if (function_92beaa28(localclientnum)) {
                            _playgibfx(localclientnum, entity, var_fee7cbdd.var_42c89fa1, var_fee7cbdd.var_d147aa1c);
                        }
                    }
                    _playgibsound(localclientnum, entity, var_fee7cbdd.var_28882334);
                }
            }
            _handlegibcallbacks(localclientnum, entity, var_8274e52c);
        }
        var_8274e52c = var_8274e52c << 1;
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0xc3a6c62, Offset: 0x1890
// Size: 0x8a
function private _setgibbed(localclientnum, entity, gibflag) {
    gib_state = _getgibbedstate(localclientnum, entity) | gibflag & 512 - 1;
    if (isdefined(entity.var_f203d3cd)) {
        entity.var_f203d3cd.gib_state = gib_state;
    } else {
        entity.gib_state = gib_state;
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0xd321f4e, Offset: 0x1928
// Size: 0x1ac
function private _gibcliententityinternal(localclientnum, entity, gibflag) {
    if (!util::is_mature() || util::is_gib_restricted_build()) {
        return;
    }
    if (!isdefined(entity) || !_hasgibdef(entity)) {
        return;
    }
    if (entity.type !== "scriptmover") {
        return;
    }
    if (isgibbed(localclientnum, entity, gibflag)) {
        return;
    }
    if (!(_getgibbedstate(localclientnum, entity) < 16)) {
        var_5cffb0c6 = _getgibbedlegmodel(localclientnum, entity);
        entity detach(var_5cffb0c6, "");
    }
    _setgibbed(localclientnum, entity, gibflag);
    entity setmodel(_getgibbedtorsomodel(localclientnum, entity));
    entity attach(_getgibbedlegmodel(localclientnum, entity), "");
    entity _gibentity(localclientnum, gibflag, 1);
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0x1e21ce29, Offset: 0x1ae0
// Size: 0x1dc
function private _gibclientextrainternal(localclientnum, entity, gibflag) {
    if (!util::is_mature() || util::is_gib_restricted_build()) {
        return;
    }
    if (!isdefined(entity)) {
        return;
    }
    if (entity.type !== "scriptmover") {
        return;
    }
    if (isgibbed(localclientnum, entity, gibflag)) {
        return;
    }
    var_6d43549d = _getgibextramodel(localclientnum, entity, gibflag);
    if (isdefined(var_6d43549d) && entity isattached(var_6d43549d, "")) {
        entity detach(var_6d43549d, "");
    }
    if (gibflag == 8) {
        if (isdefined(isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg5 : entity.torsodmg5)) {
            entity attach(isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg5 : entity.torsodmg5, "");
        }
    }
    _setgibbed(localclientnum, entity, gibflag);
    entity _gibentity(localclientnum, gibflag, 1);
}

// Namespace gibclientutils/gib
// Params 7, eflags: 0x5 linked
// Checksum 0xbf43390b, Offset: 0x1cc8
// Size: 0x1b2
function private _gibhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (isplayer(entity) || entity isplayercorpse()) {
        if (!util::is_mature() || util::is_gib_restricted_build()) {
            return;
        }
    } else {
        if (isdefined(entity.maturegib) && entity.maturegib && (!util::is_mature() || !isshowgibsenabled())) {
            return;
        }
        if (isdefined(entity.restrictedgib) && entity.restrictedgib && !isshowgibsenabled()) {
            return;
        }
    }
    var_6ea41f8a = oldvalue ^ newvalue;
    var_519d22bc = !(newvalue & 1);
    if (bnewent) {
        var_6ea41f8a = 0 ^ newvalue;
    }
    entity _gibentity(localclientnum, var_6ea41f8a, var_519d22bc);
    entity.gib_state = newvalue;
}

// Namespace gibclientutils/gib
// Params 8, eflags: 0x1 linked
// Checksum 0x12173cb7, Offset: 0x1e88
// Size: 0x34c
function _gibpiece(localclientnum, entity, var_6d43549d, var_d241141a, var_f1af9a8e, var_f7ac0901, gibdirscale, var_bf41adc0) {
    if (!isdefined(var_d241141a) || !isdefined(var_6d43549d)) {
        return;
    }
    startposition = entity gettagorigin(var_d241141a);
    startangles = entity gettagangles(var_d241141a);
    endposition = startposition;
    var_37f80214 = startangles;
    forwardvector = undefined;
    if (!isdefined(startposition) || !isdefined(startangles)) {
        return 0;
    }
    if (isdefined(var_f7ac0901) && !isdefined(gibdirscale)) {
        startposition = (0, 0, 0);
        forwardvector = var_f7ac0901;
        forwardvector = forwardvector * randomfloatrange(100, 500);
    } else {
        waitframe(1);
        if (isdefined(entity)) {
            endposition = entity gettagorigin(var_d241141a);
            var_37f80214 = entity gettagangles(var_d241141a);
        } else {
            endposition = startposition + anglestoforward(startangles) * 10;
            var_37f80214 = startangles;
        }
        if (!isdefined(endposition) || !isdefined(var_37f80214)) {
            return 0;
        }
        scale = randomfloatrange(0.6, 1);
        dir = (randomfloatrange(0, 0.2), randomfloatrange(0, 0.2), randomfloatrange(0.2, 0.7));
        if (isdefined(var_f7ac0901) && isdefined(gibdirscale) && gibdirscale > 0) {
            dir = var_f7ac0901 + dir;
            scale = gibdirscale;
        }
        forwardvector = vectornormalize(endposition - startposition);
        forwardvector = forwardvector * scale;
        forwardvector = forwardvector + dir;
    }
    if (isdefined(entity)) {
        gibentity = createdynentandlaunch(localclientnum, var_6d43549d, endposition, var_37f80214, startposition, forwardvector, var_f1af9a8e, 1, !(isdefined(level.var_2f78f66c) && level.var_2f78f66c));
        if (isdefined(gibentity)) {
            setdynentbodyrenderoptionspacked(gibentity, entity getbodyrenderoptionspacked(), var_bf41adc0);
        }
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0x70a0c52c, Offset: 0x21e0
// Size: 0xc4
function private _handlegibcallbacks(localclientnum, entity, gibflag) {
    if (isdefined(entity.var_79a69f8d) && isdefined(entity.var_79a69f8d[gibflag])) {
        foreach (callback in entity.var_79a69f8d[gibflag]) {
            [[ callback ]](localclientnum, entity, gibflag);
        }
    }
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xa2335ca1, Offset: 0x22b0
// Size: 0x7c
function private _handlegibannihilate(localclientnum) {
    entity = self;
    entity endon(#"death");
    entity waittillmatch({#notetrack:"gib_annihilate"}, #"_anim_notify_");
    cliententgibannihilate(localclientnum, entity);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xcc7f78cf, Offset: 0x2338
// Size: 0x7c
function private _handlegibhead(localclientnum) {
    entity = self;
    entity endon(#"death");
    entity waittillmatch({#notetrack:"gib = "head""}, #"_anim_notify_");
    cliententgibhead(localclientnum, entity);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xdf41fe5c, Offset: 0x23c0
// Size: 0x7c
function private _handlegibrightarm(localclientnum) {
    entity = self;
    entity endon(#"death");
    entity waittillmatch({#notetrack:"gib = "arm_right""}, #"_anim_notify_");
    cliententgibrightarm(localclientnum, entity);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xa7949fe5, Offset: 0x2448
// Size: 0x7c
function private _handlegibleftarm(localclientnum) {
    entity = self;
    entity endon(#"death");
    entity waittillmatch({#notetrack:"gib = "arm_left""}, #"_anim_notify_");
    cliententgibleftarm(localclientnum, entity);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xff595c34, Offset: 0x24d0
// Size: 0x7c
function private _handlegibrightleg(localclientnum) {
    entity = self;
    entity endon(#"death");
    entity waittillmatch({#notetrack:"gib = "leg_right""}, #"_anim_notify_");
    cliententgibrightleg(localclientnum, entity);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xb40db692, Offset: 0x2558
// Size: 0x7c
function private _handlegibleftleg(localclientnum) {
    entity = self;
    entity endon(#"death");
    entity waittillmatch({#notetrack:"gib = "leg_left""}, #"_anim_notify_");
    cliententgibleftleg(localclientnum, entity);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0x3c3641f4, Offset: 0x25e0
// Size: 0x88
function private _hasgibdef(entity) {
    return isdefined(entity.var_f203d3cd) && isdefined(entity.var_f203d3cd.gibdef) || isdefined(entity.gibdef) || isdefined(entity getplayergibdef("arms")) && isdefined(entity getplayergibdef("legs"));
}

// Namespace gibclientutils/gib
// Params 4, eflags: 0x1 linked
// Checksum 0xd2317f83, Offset: 0x2670
// Size: 0x102
function _playgibfx(localclientnum, entity, var_7b757eab, fxtag) {
    if (isdefined(var_7b757eab) && isdefined(fxtag) && entity hasdobj(localclientnum)) {
        fx = util::playfxontag(localclientnum, var_7b757eab, entity, fxtag);
        if (isdefined(fx)) {
            if (isdefined(entity.team)) {
                setfxteam(localclientnum, fx, entity.team);
            }
            if (isdefined(level.var_b19c4792) && level.var_b19c4792) {
                setfxignorepause(localclientnum, fx, 1);
            }
        }
        return fx;
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x1 linked
// Checksum 0x5a68a21b, Offset: 0x2780
// Size: 0x44
function _playgibsound(localclientnum, entity, soundalias) {
    if (isdefined(soundalias)) {
        playsound(localclientnum, soundalias, entity.origin);
    }
}

// Namespace gibclientutils/gib
// Params 4, eflags: 0x1 linked
// Checksum 0x922b322, Offset: 0x27d0
// Size: 0xde
function addgibcallback(localclientnum, entity, gibflag, callbackfunction) {
    /#
        assert(isfunctionptr(callbackfunction));
    #/
    if (!isdefined(entity.var_79a69f8d)) {
        entity.var_79a69f8d = [];
    }
    if (!isdefined(entity.var_79a69f8d[gibflag])) {
        entity.var_79a69f8d[gibflag] = [];
    }
    var_dab820f = entity.var_79a69f8d[gibflag];
    var_dab820f[var_dab820f.size] = callbackfunction;
    entity.var_79a69f8d[gibflag] = var_dab820f;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x2db5eade, Offset: 0x28b8
// Size: 0x7c
function cliententgibannihilate(localclientnum, entity) {
    if (!util::is_mature() || util::is_gib_restricted_build()) {
        return;
    }
    entity.ignoreragdoll = 1;
    entity _gibentity(localclientnum, 50 | 384, 1);
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0xf6d35110, Offset: 0x2940
// Size: 0x34
function cliententgibhead(localclientnum, entity) {
    _gibclientextrainternal(localclientnum, entity, 8);
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0xb45e9ef4, Offset: 0x2980
// Size: 0x54
function cliententgibleftarm(localclientnum, entity) {
    if (isgibbed(localclientnum, entity, 16)) {
        return;
    }
    _gibcliententityinternal(localclientnum, entity, 32);
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x2a123c72, Offset: 0x29e0
// Size: 0x54
function cliententgibrightarm(localclientnum, entity) {
    if (isgibbed(localclientnum, entity, 32)) {
        return;
    }
    _gibcliententityinternal(localclientnum, entity, 16);
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x54b5280c, Offset: 0x2a40
// Size: 0x34
function cliententgibleftleg(localclientnum, entity) {
    _gibcliententityinternal(localclientnum, entity, 256);
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0xf366d8dc, Offset: 0x2a80
// Size: 0x34
function cliententgibrightleg(localclientnum, entity) {
    _gibcliententityinternal(localclientnum, entity, 128);
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x0
// Checksum 0xcef493e9, Offset: 0x2ac0
// Size: 0x330
function createscriptmodelofentity(localclientnum, entity) {
    clone = spawn(localclientnum, entity.origin, "script_model");
    clone.angles = entity.angles;
    _clonegibdata(localclientnum, entity, clone);
    var_8f411bbf = _getgibbedstate(localclientnum, clone);
    if (!util::is_mature() || util::is_gib_restricted_build()) {
        var_8f411bbf = 0;
    }
    if (!(_getgibbedstate(localclientnum, entity) < 16)) {
        clone setmodel(_getgibbedtorsomodel(localclientnum, entity));
        clone attach(_getgibbedlegmodel(localclientnum, entity), "");
    } else {
        clone setmodel(entity.model);
    }
    if (var_8f411bbf & 8) {
        if (isdefined(isdefined(clone.var_f203d3cd) ? clone.var_f203d3cd.torsodmg5 : clone.torsodmg5)) {
            clone attach(isdefined(clone.var_f203d3cd) ? clone.var_f203d3cd.torsodmg5 : clone.torsodmg5, "");
        }
    } else {
        if (isdefined(isdefined(clone.var_f203d3cd) ? clone.var_f203d3cd.head : clone.head)) {
            clone attach(isdefined(clone.var_f203d3cd) ? clone.var_f203d3cd.head : clone.head, "");
        }
        if (!(var_8f411bbf & 4) && isdefined(isdefined(clone.var_f203d3cd) ? clone.var_f203d3cd.hatmodel : clone.hatmodel)) {
            clone attach(isdefined(clone.var_f203d3cd) ? clone.var_f203d3cd.hatmodel : clone.hatmodel, "");
        }
    }
    return clone;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x1 linked
// Checksum 0x8798f384, Offset: 0x2df8
// Size: 0x38
function isgibbed(localclientnum, entity, gibflag) {
    return _getgibbedstate(localclientnum, entity) & gibflag;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x0
// Checksum 0xf72246d9, Offset: 0x2e38
// Size: 0x2e
function isundamaged(localclientnum, entity) {
    return _getgibbedstate(localclientnum, entity) == 0;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x38b8c3a9, Offset: 0x2e70
// Size: 0x66
function gibentity(localclientnum, var_6ea41f8a) {
    self _gibentity(localclientnum, var_6ea41f8a, 1);
    self.gib_state = _getgibbedstate(localclientnum, self) | var_6ea41f8a & 512 - 1;
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x0
// Checksum 0xbb905f6f, Offset: 0x2ee0
// Size: 0xac
function handlegibnotetracks(localclientnum) {
    entity = self;
    entity thread _handlegibannihilate(localclientnum);
    entity thread _handlegibhead(localclientnum);
    entity thread _handlegibrightarm(localclientnum);
    entity thread _handlegibleftarm(localclientnum);
    entity thread _handlegibrightleg(localclientnum);
    entity thread _handlegibleftleg(localclientnum);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x0
// Checksum 0xb8d783e4, Offset: 0x2f98
// Size: 0x2c
function playergibleftarm(localclientnum) {
    self gibentity(localclientnum, 32);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x0
// Checksum 0x30e5f3dd, Offset: 0x2fd0
// Size: 0x2c
function playergibrightarm(localclientnum) {
    self gibentity(localclientnum, 16);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x0
// Checksum 0xf4a090cf, Offset: 0x3008
// Size: 0x2c
function playergibleftleg(localclientnum) {
    self gibentity(localclientnum, 256);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x0
// Checksum 0x8994bd1f, Offset: 0x3040
// Size: 0x2c
function playergibrightleg(localclientnum) {
    self gibentity(localclientnum, 128);
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x0
// Checksum 0x54144a3c, Offset: 0x3078
// Size: 0x4c
function playergiblegs(localclientnum) {
    self gibentity(localclientnum, 128);
    self gibentity(localclientnum, 256);
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x0
// Checksum 0x4bdf8577, Offset: 0x30d0
// Size: 0x2a
function playergibtag(localclientnum, gibflag) {
    return _gibpiecetag(localclientnum, self, gibflag);
}

