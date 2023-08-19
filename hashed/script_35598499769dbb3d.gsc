// Atian COD Tools GSC decompiler test
#include scripts/core_common/throttle_shared.gsc;
#include script_4c5c4a64a59247a2;
#include script_41fe08c37d53a635;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace gib;

// Namespace gib/gib
// Params 0, eflags: 0x2
// Checksum 0xcd6f89e8, Offset: 0x1b0
// Size: 0xb8
function autoexec main() {
    clientfield::register("actor", "gib_state", 1, 9, "int");
    clientfield::register("playercorpse", "gib_state", 1, 15, "int");
    level.var_ad0f5efa = [];
    if (!isdefined(level.var_7d99f058)) {
        level.var_7d99f058 = new throttle();
        [[ level.var_7d99f058 ]]->initialize(2, 0.2);
    }
}

#namespace gibserverutils;

// Namespace gibserverutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0x8ec906ce, Offset: 0x270
// Size: 0x30e
function private function_3aa023f1(name, entity) {
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

// Namespace gibserverutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0xb507ccf3, Offset: 0x588
// Size: 0x48
function private function_69db754(name, gibflag, entity) {
    gibpieces = function_3aa023f1(name, entity);
    return gibpieces[gibflag];
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0x5f08b9a3, Offset: 0x5d8
// Size: 0x2c
function private _annihilate(entity) {
    if (isdefined(entity)) {
        entity notsolid();
    }
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0x13b149e4, Offset: 0x610
// Size: 0xc4
function private _getgibextramodel(entity, gibflag) {
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

// Namespace gibserverutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0x183b7a57, Offset: 0x6e0
// Size: 0x68
function private _gibextra(entity, gibflag) {
    if (isgibbed(entity, gibflag)) {
        return 0;
    }
    if (!_hasgibdef(entity)) {
        return 0;
    }
    entity thread _gibextrainternal(entity, gibflag);
    return 1;
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0x3b9b43cb, Offset: 0x750
// Size: 0x1f4
function private _gibextrainternal(entity, gibflag) {
    if (entity.var_fcefee78 !== gettime()) {
        [[ level.var_7d99f058 ]]->waitinqueue(entity);
    }
    if (!isdefined(entity)) {
        return;
    }
    entity.var_fcefee78 = gettime();
    if (isgibbed(entity, gibflag)) {
        return 0;
    }
    if (gibflag == 8) {
        if (isdefined(isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg5 : entity.torsodmg5)) {
            entity attach(isdefined(entity.var_f203d3cd) ? entity.var_f203d3cd.torsodmg5 : entity.torsodmg5, "", 1);
        }
    }
    _setgibbed(entity, gibflag, undefined);
    destructserverutils::showdestructedpieces(entity);
    showhiddengibpieces(entity);
    var_6d43549d = _getgibextramodel(entity, gibflag);
    if (isdefined(var_6d43549d) && entity isattached(var_6d43549d)) {
        entity detach(var_6d43549d, "");
    }
    destructserverutils::reapplydestructedpieces(entity);
    reapplyhiddengibpieces(entity);
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0xcb7ca5c0, Offset: 0x950
// Size: 0x88
function private _gibentity(entity, gibflag) {
    if (isgibbed(entity, gibflag) || !_hasgibpieces(entity, gibflag)) {
        return 0;
    }
    if (!_hasgibdef(entity)) {
        return 0;
    }
    entity thread _gibentityinternal(entity, gibflag);
    return 1;
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0xebff824e, Offset: 0x9e0
// Size: 0x194
function private _gibentityinternal(entity, gibflag) {
    if (entity.var_fcefee78 !== gettime()) {
        [[ level.var_7d99f058 ]]->waitinqueue(entity);
    }
    if (!isdefined(entity)) {
        return;
    }
    entity.var_fcefee78 = gettime();
    if (isgibbed(entity, gibflag)) {
        return;
    }
    destructserverutils::showdestructedpieces(entity);
    showhiddengibpieces(entity);
    if (!(_getgibbedstate(entity) < 16)) {
        var_5cffb0c6 = _getgibbedlegmodel(entity);
        entity detach(var_5cffb0c6);
    }
    _setgibbed(entity, gibflag, undefined);
    entity setmodel(_getgibbedtorsomodel(entity));
    entity attach(_getgibbedlegmodel(entity));
    destructserverutils::reapplydestructedpieces(entity);
    reapplyhiddengibpieces(entity);
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xc05bf64c, Offset: 0xb80
// Size: 0x152
function private _getgibbedlegmodel(entity) {
    var_8f411bbf = _getgibbedstate(entity);
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

// Namespace gibserverutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0x64085d49, Offset: 0xce0
// Size: 0x2a
function private _getgibbedstate(entity) {
    if (isdefined(entity.gib_state)) {
        return entity.gib_state;
    }
    return 0;
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0xbad6f872, Offset: 0xd18
// Size: 0x152
function private _getgibbedtorsomodel(entity) {
    var_8f411bbf = _getgibbedstate(entity);
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

// Namespace gibserverutils/gib
// Params 1, eflags: 0x5 linked
// Checksum 0x20954053, Offset: 0xe78
// Size: 0x18
function private _hasgibdef(entity) {
    return isdefined(entity.gibdef);
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x5 linked
// Checksum 0xd1ebdf0, Offset: 0xe98
// Size: 0xae
function private _hasgibpieces(entity, gibflag) {
    var_5195c7d1 = 0;
    var_8f411bbf = _getgibbedstate(entity);
    entity.gib_state = var_8f411bbf | gibflag & 512 - 1;
    if (isdefined(_getgibbedtorsomodel(entity)) && isdefined(_getgibbedlegmodel(entity))) {
        var_5195c7d1 = 1;
    }
    entity.gib_state = var_8f411bbf;
    return var_5195c7d1;
}

// Namespace gibserverutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0xd96be9ce, Offset: 0xf50
// Size: 0x124
function private _setgibbed(entity, gibflag, var_f7ac0901) {
    if (isdefined(var_f7ac0901)) {
        angles = vectortoangles(var_f7ac0901);
        yaw = angles[1];
        var_ed82c1e6 = getbitsforangle(yaw, 3);
        entity.gib_state = (_getgibbedstate(entity) | gibflag & 512 - 1) + (var_ed82c1e6 << 9);
    } else {
        entity.gib_state = _getgibbedstate(entity) | gibflag & 512 - 1;
    }
    entity.gibbed = 1;
    entity clientfield::set("gib_state", entity.gib_state);
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0x5b9e9c89, Offset: 0x1080
// Size: 0xac
function annihilate(entity) {
    if (!_hasgibdef(entity)) {
        return 0;
    }
    var_87573695 = function_69db754(entity.gibdef, 2, entity);
    if (isdefined(var_87573695)) {
        if (isdefined(var_87573695.var_f1af9a8e)) {
            _setgibbed(entity, 2, undefined);
            entity thread _annihilate(entity);
            return 1;
        }
    }
    return 0;
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x2a3f61bf, Offset: 0x1138
// Size: 0x64
function copygibstate(var_1ce9f6a3, var_db6edef1) {
    var_db6edef1.gib_state = _getgibbedstate(var_1ce9f6a3);
    togglespawngibs(var_db6edef1, 0);
    reapplyhiddengibpieces(var_db6edef1);
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x2fc1f586, Offset: 0x11a8
// Size: 0x30
function isgibbed(entity, gibflag) {
    return _getgibbedstate(entity) & gibflag;
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0xfe0175f6, Offset: 0x11e0
// Size: 0x22
function gibhat(entity) {
    return _gibextra(entity, 4);
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0xa43595dd, Offset: 0x1210
// Size: 0x92
function gibhead(entity) {
    gibhat(entity);
    level notify(#"gib", {#area:"head", #attacker:self.attacker, #entity:entity});
    return _gibextra(entity, 8);
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0xc7069ca8, Offset: 0x12b0
// Size: 0xb8
function gibleftarm(entity) {
    if (isgibbed(entity, 16)) {
        return 0;
    }
    if (_gibentity(entity, 32)) {
        destructserverutils::destructleftarmpieces(entity);
        level notify(#"gib", {#area:"left_arm", #attacker:self.attacker, #entity:entity});
        return 1;
    }
    return 0;
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0xaefc3a27, Offset: 0x1370
// Size: 0xd0
function gibrightarm(entity) {
    if (isgibbed(entity, 32)) {
        return 0;
    }
    if (_gibentity(entity, 16)) {
        destructserverutils::destructrightarmpieces(entity);
        entity thread shared::dropaiweapon();
        level notify(#"gib", {#area:"right_arm", #attacker:self.attacker, #entity:entity});
        return 1;
    }
    return 0;
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0xdc8b3253, Offset: 0x1448
// Size: 0x98
function gibleftleg(entity) {
    if (_gibentity(entity, 256)) {
        destructserverutils::destructleftlegpieces(entity);
        level notify(#"gib", {#area:"left_leg", #attacker:self.attacker, #entity:entity});
        return 1;
    }
    return 0;
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0xba21ea7a, Offset: 0x14e8
// Size: 0x98
function gibrightleg(entity) {
    if (_gibentity(entity, 128)) {
        destructserverutils::destructrightlegpieces(entity);
        level notify(#"gib", {#area:"right_leg", #attacker:self.attacker, #entity:entity});
        return 1;
    }
    return 0;
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0x90ae34a7, Offset: 0x1588
// Size: 0xb0
function giblegs(entity) {
    if (_gibentity(entity, 384)) {
        destructserverutils::destructrightlegpieces(entity);
        destructserverutils::destructleftlegpieces(entity);
        level notify(#"gib", {#area:"both_legs", #attacker:self.attacker, #entity:entity});
        return 1;
    }
    return 0;
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x0
// Checksum 0xd036c816, Offset: 0x1640
// Size: 0x4c
function playergibleftarm(entity) {
    if (isdefined(entity.body)) {
        dir = (1, 0, 0);
        _setgibbed(entity.body, 32, dir);
    }
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x0
// Checksum 0x86612161, Offset: 0x1698
// Size: 0x4c
function playergibrightarm(entity) {
    if (isdefined(entity.body)) {
        dir = (1, 0, 0);
        _setgibbed(entity.body, 16, dir);
    }
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x0
// Checksum 0xcdc7f89f, Offset: 0x16f0
// Size: 0x4c
function playergibleftleg(entity) {
    if (isdefined(entity.body)) {
        dir = (1, 0, 0);
        _setgibbed(entity.body, 256, dir);
    }
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x0
// Checksum 0xa0337e58, Offset: 0x1748
// Size: 0x4c
function playergibrightleg(entity) {
    if (isdefined(entity.body)) {
        dir = (1, 0, 0);
        _setgibbed(entity.body, 128, dir);
    }
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x0
// Checksum 0x9353edab, Offset: 0x17a0
// Size: 0x6c
function playergiblegs(entity) {
    if (isdefined(entity.body)) {
        dir = (1, 0, 0);
        _setgibbed(entity.body, 128, dir);
        _setgibbed(entity.body, 256, dir);
    }
}

// Namespace gibserverutils/player_gibleftarmvel
// Params 1, eflags: 0x40
// Checksum 0x892a2be4, Offset: 0x1818
// Size: 0x54
function event<player_gibleftarmvel> playergibleftarmvel(var_e478675e) {
    if (isdefined(var_e478675e.player.body)) {
        _setgibbed(var_e478675e.player.body, 32, var_e478675e.direction);
    }
}

// Namespace gibserverutils/player_gibrightarmvel
// Params 1, eflags: 0x40
// Checksum 0xe3c71e0c, Offset: 0x1878
// Size: 0x54
function event<player_gibrightarmvel> playergibrightarmvel(var_e478675e) {
    if (isdefined(var_e478675e.player.body)) {
        _setgibbed(var_e478675e.player.body, 16, var_e478675e.direction);
    }
}

// Namespace gibserverutils/player_gibleftlegvel
// Params 1, eflags: 0x40
// Checksum 0xfe34b4b7, Offset: 0x18d8
// Size: 0x54
function event<player_gibleftlegvel> playergibleftlegvel(var_e478675e) {
    if (isdefined(var_e478675e.player.body)) {
        _setgibbed(var_e478675e.player.body, 256, var_e478675e.direction);
    }
}

// Namespace gibserverutils/player_gibrightlegvel
// Params 1, eflags: 0x40
// Checksum 0xca96a75a, Offset: 0x1938
// Size: 0x54
function event<player_gibrightlegvel> playergibrightlegvel(var_e478675e) {
    if (isdefined(var_e478675e.player.body)) {
        _setgibbed(var_e478675e.player.body, 128, var_e478675e.direction);
    }
}

// Namespace gibserverutils/player_gibbothlegsvel
// Params 1, eflags: 0x40
// Checksum 0x978e15bd, Offset: 0x1998
// Size: 0x84
function event<player_gibbothlegsvel> playergiblegsvel(var_e478675e) {
    if (isdefined(var_e478675e.player.body)) {
        _setgibbed(var_e478675e.player.body, 128, var_e478675e.direction);
        _setgibbed(var_e478675e.player.body, 256, var_e478675e.direction);
    }
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0x2e092198, Offset: 0x1a28
// Size: 0x170
function reapplyhiddengibpieces(entity) {
    if (!_hasgibdef(entity)) {
        return;
    }
    gibpieces = function_3aa023f1(entity.gibdef, entity);
    foreach (gibflag, gib in gibpieces) {
        if (!isgibbed(entity, gibflag)) {
            continue;
        }
        if (!isdefined(gib)) {
            continue;
        }
        if (isdefined(gib.var_7cfc4f8) && isalive(entity) && entity haspart(gib.var_7cfc4f8)) {
            if (!(isdefined(entity.skipdeath) && entity.skipdeath)) {
                entity hidepart(gib.var_7cfc4f8, "", 1);
            }
        }
    }
}

// Namespace gibserverutils/gib
// Params 1, eflags: 0x1 linked
// Checksum 0x4193165a, Offset: 0x1ba0
// Size: 0x118
function showhiddengibpieces(entity) {
    if (!_hasgibdef(entity)) {
        return;
    }
    gibpieces = function_3aa023f1(entity.gibdef, entity);
    foreach (gib in gibpieces) {
        if (!isdefined(gib)) {
            continue;
        }
        if (isdefined(gib.var_7cfc4f8) && entity haspart(gib.var_7cfc4f8)) {
            entity showpart(gib.var_7cfc4f8, "", 1);
        }
    }
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x853fd1c6, Offset: 0x1cc0
// Size: 0x94
function togglespawngibs(entity, var_519d22bc) {
    if (!var_519d22bc) {
        entity.gib_state = _getgibbedstate(entity) | 1;
    } else {
        entity.gib_state = _getgibbedstate(entity) & -2;
    }
    entity clientfield::set("gib_state", entity.gib_state);
}

