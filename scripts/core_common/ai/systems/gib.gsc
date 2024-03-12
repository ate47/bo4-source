// Atian COD Tools GSC decompiler test
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\ai\systems\shared.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace gib;

// Namespace gib/gib
// Params 0, eflags: 0x2
// Checksum 0xcd6f89e8, Offset: 0x1b0
// Size: 0xb8
function autoexec main() {
    clientfield::register("actor", "gib_state", 1, 9, "int");
    clientfield::register("playercorpse", "gib_state", 1, 15, "int");
    level.var_ad0f5efa = [];
    if (!isdefined(level.gib_throttle)) {
        level.gib_throttle = new throttle();
        [[ level.gib_throttle ]]->initialize(2, 0.2);
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
    definition = struct::get_script_bundle("gibcharacterdef", name);
    if (!isdefined(definition)) {
        /#
            assertmsg("<unknown string>" + name);
        #/
        return undefined;
    }
    gibpiecelookup = [];
    gibpiecelookup[2] = "annihilate";
    gibpiecelookup[8] = "head";
    gibpiecelookup[16] = "rightarm";
    gibpiecelookup[32] = "leftarm";
    gibpiecelookup[128] = "rightleg";
    gibpiecelookup[256] = "leftleg";
    gibpieces = [];
    foreach (gibflag, gibpiece in gibpiecelookup) {
        if (!isdefined(gibpiece)) {
            /#
                assertmsg("<unknown string>" + gibflag);
            #/
            continue;
        }
        gibstruct = spawnstruct();
        gibstruct.gibmodel = definition.(gibpiece + "_gibmodel");
        gibstruct.gibtag = definition.(gibpiece + "_gibtag");
        gibstruct.gibfx = definition.(gibpiece + "_gibfx");
        gibstruct.gibfxtag = definition.(gibpiece + "_gibeffecttag");
        gibstruct.gibdynentfx = definition.(gibpiece + "_gibdynentfx");
        gibstruct.var_42c89fa1 = definition.(gibpiece + "_gibcinematicfx");
        gibstruct.gibsound = definition.(gibpiece + "_gibsound");
        gibstruct.gibhidetag = definition.(gibpiece + "_gibhidetag");
        gibpieces[gibflag] = gibstruct;
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
        return (isdefined(entity.gib_data) ? entity.gib_data.hatmodel : entity.hatmodel);
    }
    if (gibflag == 8) {
        return (isdefined(entity.gib_data) ? entity.gib_data.head : entity.head);
    }
    /#
        assertmsg("<unknown string>");
    #/
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
    if (entity.gib_time !== gettime()) {
        [[ level.gib_throttle ]]->waitinqueue(entity);
    }
    if (!isdefined(entity)) {
        return;
    }
    entity.gib_time = gettime();
    if (isgibbed(entity, gibflag)) {
        return 0;
    }
    if (gibflag == 8) {
        if (isdefined(isdefined(entity.gib_data) ? entity.gib_data.torsodmg5 : entity.torsodmg5)) {
            entity attach(isdefined(entity.gib_data) ? entity.gib_data.torsodmg5 : entity.torsodmg5, "", 1);
        }
    }
    _setgibbed(entity, gibflag, undefined);
    destructserverutils::showdestructedpieces(entity);
    showhiddengibpieces(entity);
    gibmodel = _getgibextramodel(entity, gibflag);
    if (isdefined(gibmodel) && entity isattached(gibmodel)) {
        entity detach(gibmodel, "");
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
    if (entity.gib_time !== gettime()) {
        [[ level.gib_throttle ]]->waitinqueue(entity);
    }
    if (!isdefined(entity)) {
        return;
    }
    entity.gib_time = gettime();
    if (isgibbed(entity, gibflag)) {
        return;
    }
    destructserverutils::showdestructedpieces(entity);
    showhiddengibpieces(entity);
    if (!(_getgibbedstate(entity) < 16)) {
        legmodel = _getgibbedlegmodel(entity);
        entity detach(legmodel);
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
    gibstate = _getgibbedstate(entity);
    rightleggibbed = gibstate & 128;
    leftleggibbed = gibstate & 256;
    if (rightleggibbed && leftleggibbed) {
        return (isdefined(entity.gib_data) ? entity.gib_data.legdmg4 : entity.legdmg4);
    } else if (rightleggibbed) {
        return (isdefined(entity.gib_data) ? entity.gib_data.legdmg2 : entity.legdmg2);
    } else if (leftleggibbed) {
        return (isdefined(entity.gib_data) ? entity.gib_data.legdmg3 : entity.legdmg3);
    }
    return isdefined(entity.gib_data) ? entity.gib_data.legdmg1 : entity.legdmg1;
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
    gibstate = _getgibbedstate(entity);
    rightarmgibbed = gibstate & 16;
    leftarmgibbed = gibstate & 32;
    if (rightarmgibbed && leftarmgibbed) {
        return (isdefined(entity.gib_data) ? entity.gib_data.torsodmg2 : entity.torsodmg2);
    } else if (rightarmgibbed) {
        return (isdefined(entity.gib_data) ? entity.gib_data.torsodmg2 : entity.torsodmg2);
    } else if (leftarmgibbed) {
        return (isdefined(entity.gib_data) ? entity.gib_data.torsodmg3 : entity.torsodmg3);
    }
    return isdefined(entity.gib_data) ? entity.gib_data.torsodmg1 : entity.torsodmg1;
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
    hasgibpieces = 0;
    gibstate = _getgibbedstate(entity);
    entity.gib_state = gibstate | gibflag & 512 - 1;
    if (isdefined(_getgibbedtorsomodel(entity)) && isdefined(_getgibbedlegmodel(entity))) {
        hasgibpieces = 1;
    }
    entity.gib_state = gibstate;
    return hasgibpieces;
}

// Namespace gibserverutils/gib
// Params 3, eflags: 0x5 linked
// Checksum 0xd96be9ce, Offset: 0xf50
// Size: 0x124
function private _setgibbed(entity, gibflag, gibdir) {
    if (isdefined(gibdir)) {
        angles = vectortoangles(gibdir);
        yaw = angles[1];
        yaw_bits = getbitsforangle(yaw, 3);
        entity.gib_state = (_getgibbedstate(entity) | gibflag & 512 - 1) + (yaw_bits << 9);
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
    gibpiecestruct = function_69db754(entity.gibdef, 2, entity);
    if (isdefined(gibpiecestruct)) {
        if (isdefined(gibpiecestruct.gibfx)) {
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
function copygibstate(originalentity, newentity) {
    newentity.gib_state = _getgibbedstate(originalentity);
    togglespawngibs(newentity, 0);
    reapplyhiddengibpieces(newentity);
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
function event_handler[player_gibleftarmvel] playergibleftarmvel(entitystruct) {
    if (isdefined(entitystruct.player.body)) {
        _setgibbed(entitystruct.player.body, 32, entitystruct.direction);
    }
}

// Namespace gibserverutils/player_gibrightarmvel
// Params 1, eflags: 0x40
// Checksum 0xe3c71e0c, Offset: 0x1878
// Size: 0x54
function event_handler[player_gibrightarmvel] playergibrightarmvel(entitystruct) {
    if (isdefined(entitystruct.player.body)) {
        _setgibbed(entitystruct.player.body, 16, entitystruct.direction);
    }
}

// Namespace gibserverutils/player_gibleftlegvel
// Params 1, eflags: 0x40
// Checksum 0xfe34b4b7, Offset: 0x18d8
// Size: 0x54
function event_handler[player_gibleftlegvel] playergibleftlegvel(entitystruct) {
    if (isdefined(entitystruct.player.body)) {
        _setgibbed(entitystruct.player.body, 256, entitystruct.direction);
    }
}

// Namespace gibserverutils/player_gibrightlegvel
// Params 1, eflags: 0x40
// Checksum 0xca96a75a, Offset: 0x1938
// Size: 0x54
function event_handler[player_gibrightlegvel] playergibrightlegvel(entitystruct) {
    if (isdefined(entitystruct.player.body)) {
        _setgibbed(entitystruct.player.body, 128, entitystruct.direction);
    }
}

// Namespace gibserverutils/player_gibbothlegsvel
// Params 1, eflags: 0x40
// Checksum 0x978e15bd, Offset: 0x1998
// Size: 0x84
function event_handler[player_gibbothlegsvel] playergiblegsvel(entitystruct) {
    if (isdefined(entitystruct.player.body)) {
        _setgibbed(entitystruct.player.body, 128, entitystruct.direction);
        _setgibbed(entitystruct.player.body, 256, entitystruct.direction);
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
        if (isdefined(gib.gibhidetag) && isalive(entity) && entity haspart(gib.gibhidetag)) {
            if (!(isdefined(entity.skipdeath) && entity.skipdeath)) {
                entity hidepart(gib.gibhidetag, "", 1);
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
        if (isdefined(gib.gibhidetag) && entity haspart(gib.gibhidetag)) {
            entity showpart(gib.gibhidetag, "", 1);
        }
    }
}

// Namespace gibserverutils/gib
// Params 2, eflags: 0x1 linked
// Checksum 0x853fd1c6, Offset: 0x1cc0
// Size: 0x94
function togglespawngibs(entity, shouldspawngibs) {
    if (!shouldspawngibs) {
        entity.gib_state = _getgibbedstate(entity) | 1;
    } else {
        entity.gib_state = _getgibbedstate(entity) & -2;
    }
    entity clientfield::set("gib_state", entity.gib_state);
}

