// Atian COD Tools GSC decompiler test
#include script_16d00590b7ac9e6;

#namespace animation_selector_table_evaluators;

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 0, eflags: 0x2
// Checksum 0x7f3720d, Offset: 0x150
// Size: 0x11c
function autoexec registerastscriptfunctions() {
    animationselectortable::registeranimationselectortableevaluator("testFunction", &testfunction);
    animationselectortable::registeranimationselectortableevaluator("evaluateBlockedAnimations", &evaluateblockedanimations);
    animationselectortable::registeranimationselectortableevaluator("evaluateBlockedAnimationsRelaxed", &evaluateblockedanimationsrelaxed);
    animationselectortable::registeranimationselectortableevaluator("evaluateBlockedAnimationsOffNavmesh", &evaluateblockedanimationsoffnavmesh);
    animationselectortable::registeranimationselectortableevaluator("evaluateHumanTurnAnimations", &evaluatehumanturnanimations);
    animationselectortable::registeranimationselectortableevaluator("evaluateHumanExposedArrivalAnimations", &evaluatehumanexposedarrivalanimations);
    animationselectortable::registeranimationselectortableevaluator("evaluateJukeBlockedAnimations", &evaluatejukeblockedanimations);
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x1 linked
// Checksum 0x3bc6c447, Offset: 0x278
// Size: 0x48
function testfunction(entity, animations) {
    if (isarray(animations) && animations.size > 0) {
        return animations[0];
    }
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0xb4efb203, Offset: 0x2c8
// Size: 0x19e
function private function_aa7530df(entity, animation) {
    pixbeginevent(#"evaluator_checkanimationagainstgeo");
    /#
        assert(isactor(entity));
    #/
    forwarddir = anglestoforward(entity.angles);
    localdeltavector = getmovedelta(animation, 0, 1, entity);
    endpoint = entity localtoworldcoords(localdeltavector);
    var_4d6925d3 = endpoint + vectorscale(forwarddir, 100);
    /#
        recordline(entity.origin, endpoint, (0, 0, 1), "<unknown string>", entity);
        recordline(endpoint, var_4d6925d3, (1, 0.5, 0), "<unknown string>", entity);
    #/
    if (entity maymovefrompointtopoint(endpoint, var_4d6925d3, 1, 1)) {
        pixendevent();
        return 1;
    }
    pixendevent();
    return 0;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0xdb568b1, Offset: 0x470
// Size: 0x7c
function private evaluatejukeblockedanimations(entity, animations) {
    if (animations.size > 0) {
        return evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstnavmesh, &function_aa7530df, &evaluator_checkanimationforovershootinggoal));
    }
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0x837f2393, Offset: 0x4f8
// Size: 0x22e
function private evaluator_checkanimationagainstgeo(entity, animation) {
    pixbeginevent(#"evaluator_checkanimationagainstgeo");
    /#
        assert(isactor(entity));
    #/
    localdeltahalfvector = getmovedelta(animation, 0, 0.5, entity);
    midpoint = entity localtoworldcoords(localdeltahalfvector);
    midpoint = (midpoint[0], midpoint[1], entity.origin[2]);
    /#
        recordline(entity.origin, midpoint, (1, 0.5, 0), "<unknown string>", entity);
    #/
    if (entity maymovetopoint(midpoint, 1, 1)) {
        localdeltavector = getmovedelta(animation, 0, 1, entity);
        endpoint = entity localtoworldcoords(localdeltavector);
        endpoint = (endpoint[0], endpoint[1], entity.origin[2]);
        /#
            recordline(midpoint, endpoint, (1, 0.5, 0), "<unknown string>", entity);
        #/
        if (entity maymovefrompointtopoint(midpoint, endpoint, 1, 1)) {
            pixendevent();
            return 1;
        }
    }
    pixendevent();
    return 0;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x696e3b83, Offset: 0x730
// Size: 0x11e
function private evaluator_checkanimationendpointagainstgeo(entity, animation) {
    pixbeginevent(#"evaluator_checkanimationendpointagainstgeo");
    /#
        assert(isactor(entity));
    #/
    localdeltavector = getmovedelta(animation, 0, 1, entity);
    endpoint = entity localtoworldcoords(localdeltavector);
    endpoint = (endpoint[0], endpoint[1], entity.origin[2]);
    if (entity maymovetopoint(endpoint, 0, 0)) {
        pixendevent();
        return 1;
    }
    pixendevent();
    return 0;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0x64d63bd, Offset: 0x858
// Size: 0x1ce
function private evaluator_checkanimationforovershootinggoal(entity, animation) {
    pixbeginevent(#"evaluator_checkanimationforovershootinggoal");
    /#
        assert(isactor(entity));
    #/
    localdeltavector = getmovedelta(animation, 0, 1, entity);
    endpoint = entity localtoworldcoords(localdeltavector);
    var_9896d8af = lengthsquared(localdeltavector);
    if (entity haspath()) {
        startpos = entity.origin;
        goalpos = entity.pathgoalpos;
        /#
            assert(isdefined(goalpos));
        #/
        var_e1d2d0ef = distancesquared(startpos, goalpos);
        if (var_9896d8af < var_e1d2d0ef * 0.9) {
            pixendevent();
            return 1;
        }
    }
    /#
        record3dtext("<unknown string>", entity.origin, (1, 0.5, 0), "<unknown string>", entity);
    #/
    pixendevent();
    return 0;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0x13a7ab2b, Offset: 0xa30
// Size: 0xe6
function private evaluator_checkanimationagainstnavmesh(entity, animation) {
    /#
        assert(isactor(entity));
    #/
    localdeltavector = getmovedelta(animation, 0, 1, entity);
    endpoint = entity localtoworldcoords(localdeltavector);
    if (ispointonnavmesh(endpoint, entity)) {
        return 1;
    }
    /#
        record3dtext("<unknown string>", entity.origin, (1, 0.5, 0), "<unknown string>", entity);
    #/
    return 0;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0xf312bc75, Offset: 0xb20
// Size: 0x136
function private evaluator_checkanimationarrivalposition(entity, animation) {
    localdeltavector = getmovedelta(animation, 0, 1, entity);
    endpoint = entity localtoworldcoords(localdeltavector);
    var_9896d8af = lengthsquared(localdeltavector);
    startpos = entity.origin;
    goalpos = entity.pathgoalpos;
    var_e1d2d0ef = distancesquared(startpos, goalpos);
    if (var_e1d2d0ef < var_9896d8af) {
        if (isdefined(entity.ai.var_a5dabb8b) && entity.ai.var_a5dabb8b) {
            return 1;
        }
        if (entity isposatgoal(endpoint)) {
            return 1;
        }
    }
    return 0;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 3, eflags: 0x5 linked
// Checksum 0xeae94b3d, Offset: 0xc60
// Size: 0x194
function private evaluator_findfirstvalidanimation(entity, animations, tests) {
    /#
        assert(isarray(animations), "<unknown string>");
    #/
    /#
        assert(isarray(tests), "<unknown string>");
    #/
    foreach (var_ab70c60 in animations) {
        if (var_ab70c60.size > 0) {
            valid = 1;
            animation = var_ab70c60[0];
            foreach (test in tests) {
                if (![[ test ]](entity, animation)) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                return animation;
            }
        }
    }
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0xd3e56763, Offset: 0xe00
// Size: 0x6e
function private evaluateblockedanimations(entity, animations) {
    if (animations.size > 0) {
        return evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstnavmesh, &evaluator_checkanimationforovershootinggoal));
    }
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0x49b8628b, Offset: 0xe78
// Size: 0x5e
function private evaluateblockedanimationsrelaxed(entity, animations) {
    if (animations.size > 0) {
        return evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationforovershootinggoal));
    }
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0x2bbb7af3, Offset: 0xee0
// Size: 0x5e
function private evaluateblockedanimationsoffnavmesh(entity, animations) {
    if (animations.size > 0) {
        return evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstgeo));
    }
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0x9b637584, Offset: 0xf48
// Size: 0xf6
function private evaluatehumanturnanimations(entity, animations) {
    /#
        if (isdefined(level.var_75ded41a) && level.var_75ded41a) {
            return undefined;
        }
    #/
    /#
        record3dtext("<unknown string>" + gettime() + "<unknown string>", entity.origin, (1, 0.5, 0), "<unknown string>", entity);
    #/
    if (animations.size > 0) {
        return evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationforovershootinggoal, &evaluator_checkanimationagainstgeo, &evaluator_checkanimationagainstnavmesh));
    }
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x5 linked
// Checksum 0x706ad130, Offset: 0x1048
// Size: 0x6e
function private evaluatehumanexposedarrivalanimations(entity, animations) {
    if (!isdefined(entity.pathgoalpos)) {
        return undefined;
    }
    if (animations.size > 0) {
        return evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationarrivalposition));
    }
    return undefined;
}

