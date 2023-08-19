// Atian COD Tools GSC decompiler test
#include script_3aa0f32b70d4f7cb;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/ai_shared.gsc;

#namespace aiutility;

// Namespace aiutility/namespace_c334e59a
// Params 0, eflags: 0x2
// Checksum 0xe83a4401, Offset: 0x208
// Size: 0x112c
function autoexec registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&isatcrouchnode));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcrouchnode", &isatcrouchnode);
    /#
        assert(iscodefunctionptr(&btapi_isatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_isatcovercondition", &btapi_isatcovercondition);
    /#
        assert(isscriptfunctionptr(&isatcoverstrictcondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcoverstrictcondition", &isatcoverstrictcondition);
    /#
        assert(isscriptfunctionptr(&isatcovermodeover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcovermodeover", &isatcovermodeover);
    /#
        assert(isscriptfunctionptr(&isatcovermodenone));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcovermodenone", &isatcovermodenone);
    /#
        assert(isscriptfunctionptr(&isexposedatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isexposedatcovercondition", &isexposedatcovercondition);
    /#
        assert(isscriptfunctionptr(&keepclaimednodeandchoosecoverdirection));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"keepclaimednodeandchoosecoverdirection", &keepclaimednodeandchoosecoverdirection);
    /#
        assert(isscriptfunctionptr(&resetcoverparameters));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"resetcoverparameters", &resetcoverparameters);
    /#
        assert(isscriptfunctionptr(&cleanupcovermode));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupcovermode", &cleanupcovermode);
    /#
        assert(isscriptfunctionptr(&canbeflankedservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"canbeflankedservice", &canbeflankedservice);
    /#
        assert(isscriptfunctionptr(&shouldcoveridleonly));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldcoveridleonly", &shouldcoveridleonly);
    /#
        assert(isscriptfunctionptr(&issuppressedatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"issuppressedatcovercondition", &issuppressedatcovercondition);
    /#
        assert(isscriptfunctionptr(&coveridleinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveridleinitialize", &coveridleinitialize);
    /#
        assert(iscodefunctionptr(&btapi_coveridleupdate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_coveridleupdate", &btapi_coveridleupdate);
    /#
        assert(isscriptfunctionptr(&coveridleupdate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveridleupdate", &coveridleupdate);
    /#
        assert(isscriptfunctionptr(&coveridleterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveridleterminate", &coveridleterminate);
    /#
        assert(isscriptfunctionptr(&shouldleanatcoveridlecondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldleanatcoveridlecondition", &shouldleanatcoveridlecondition);
    /#
        assert(isscriptfunctionptr(&continueleaningatcoveridlecondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"continueleaningatcoveridlecondition", &continueleaningatcoveridlecondition, 5);
    /#
        assert(isscriptfunctionptr(&isflankedbyenemyatcover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isflankedbyenemyatcover", &isflankedbyenemyatcover);
    /#
        assert(isscriptfunctionptr(&coverflankedinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverflankedactionstart", &coverflankedinitialize);
    /#
        assert(isscriptfunctionptr(&coverflankedactionterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverflankedactionterminate", &coverflankedactionterminate);
    /#
        assert(isscriptfunctionptr(&supportsovercovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"supportsovercovercondition", &supportsovercovercondition);
    /#
        assert(isscriptfunctionptr(&shouldoveratcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldoveratcovercondition", &shouldoveratcovercondition);
    /#
        assert(isscriptfunctionptr(&coveroverinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveroverinitialize", &coveroverinitialize);
    /#
        assert(isscriptfunctionptr(&coveroverterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveroverterminate", &coveroverterminate);
    /#
        assert(isscriptfunctionptr(&function_b605a3b2));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_58ddf57d938c96a6", &function_b605a3b2);
    /#
        assert(isscriptfunctionptr(&supportsleancovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"supportsleancovercondition", &supportsleancovercondition);
    /#
        assert(isscriptfunctionptr(&shouldleanatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldleanatcovercondition", &shouldleanatcovercondition);
    /#
        assert(isscriptfunctionptr(&continueleaningatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"continueleaningatcovercondition", &continueleaningatcovercondition, 1);
    /#
        assert(isscriptfunctionptr(&coverleaninitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverleaninitialize", &coverleaninitialize);
    /#
        assert(isscriptfunctionptr(&coverleanterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverleanterminate", &coverleanterminate);
    /#
        assert(isscriptfunctionptr(&function_9e5575be));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72e14fa3a8f112e4", &function_9e5575be);
    /#
        assert(isscriptfunctionptr(&function_dc503571));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_229844e28015a254", &function_dc503571);
    /#
        assert(isscriptfunctionptr(&function_eb148f38));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_65aba356fa88122c", &function_eb148f38);
    /#
        assert(isscriptfunctionptr(&function_4c672ae3));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_35b14110efcdb018", &function_4c672ae3, 1);
    /#
        assert(isscriptfunctionptr(&function_a938cb03));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_636e311aa7ebc589", &function_a938cb03);
    /#
        assert(isscriptfunctionptr(&function_f82f8634));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2005ffaf6edd8e46", &function_f82f8634);
    /#
        assert(isscriptfunctionptr(&supportspeekcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"supportspeekcovercondition", &supportspeekcovercondition);
    /#
        assert(isscriptfunctionptr(&coverpeekinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverpeekinitialize", &coverpeekinitialize);
    /#
        assert(isscriptfunctionptr(&coverpeekterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverpeekterminate", &coverpeekterminate);
    /#
        assert(isscriptfunctionptr(&coverreloadinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverreloadinitialize", &coverreloadinitialize);
    /#
        assert(isscriptfunctionptr(&refillammoandcleanupcovermode));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"refillammoandcleanupcovermode", &refillammoandcleanupcovermode);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xba65d904, Offset: 0x1340
// Size: 0x4c
function private coverreloadinitialize(entity) {
    entity setblackboardattribute("_cover_mode", "cover_alert");
    keepclaimnode(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x64fbbd2, Offset: 0x1398
// Size: 0x54
function refillammoandcleanupcovermode(entity) {
    if (isalive(entity)) {
        refillammo(entity);
    }
    cleanupcovermode(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x7479abbc, Offset: 0x13f8
// Size: 0x18
function private supportspeekcovercondition(entity) {
    return isdefined(entity.node);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xcca411ab, Offset: 0x1418
// Size: 0x64
function private coverpeekinitialize(entity) {
    entity setblackboardattribute("_cover_mode", "cover_alert");
    keepclaimnode(entity);
    choosecoverdirection(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xdd3c7e5, Offset: 0x1488
// Size: 0x3c
function private coverpeekterminate(entity) {
    choosefrontcoverdirection(entity);
    cleanupcovermode(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x45f9396a, Offset: 0x14d0
// Size: 0x120
function private function_dc503571(entity) {
    if (isdefined(entity.node)) {
        if (entity.node.type == #"cover left" || entity.node.type == #"cover right") {
            return 1;
        } else if (entity.node.type == #"cover pillar") {
            if (!(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024) || !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xbb0eb156, Offset: 0x15f8
// Size: 0x348
function private function_eb148f38(entity) {
    if (!isdefined(entity.node) || !isdefined(entity.node.type) || !isdefined(entity.enemy) || !isdefined(entity.enemy.origin)) {
        return 0;
    }
    yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
    var_c1158761 = 0;
    if (entity.node.type == #"cover left") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_left_lean");
        var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= -10;
    } else if (entity.node.type == #"cover right") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_right_lean");
        var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= 10;
    } else if (entity.node.type == #"cover pillar") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover");
        var_e1ce43fa = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024);
        var_ae0c62b1 = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048);
        var_57540c97 = 10;
        if (var_ae0c62b1 && var_e1ce43fa) {
            var_57540c97 = 0;
        }
        if (var_e1ce43fa) {
            var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= var_57540c97 * -1;
        }
        if (!var_c1158761 && var_ae0c62b1) {
            var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= var_57540c97;
        }
    }
    return var_c1158761;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xb5df5984, Offset: 0x1948
// Size: 0x42
function private function_4c672ae3(entity) {
    if (entity asmistransitionrunning()) {
        return 1;
    }
    return function_eb148f38(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xe3fc55aa, Offset: 0x1998
// Size: 0x3c0
function private function_7353f95b(entity) {
    if (!isdefined(entity.node) || !isdefined(entity.node.type)) {
        return 0;
    }
    if (isdefined(entity.enemy)) {
        yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
    } else {
        pos = entity.node.origin + 250 * entity.node.angles;
        yawtoenemyposition = angleclamp180(vectortoangles(pos - entity.node.origin)[1] - entity.node.angles[1]);
    }
    var_c1158761 = 0;
    if (entity.node.type == #"cover left") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_left_lean");
        var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= -10;
    } else if (entity.node.type == #"cover right") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_right_lean");
        var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= 10;
    } else if (entity.node.type == #"cover pillar") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover");
        var_e1ce43fa = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024);
        var_ae0c62b1 = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048);
        var_57540c97 = 10;
        if (var_ae0c62b1 && var_e1ce43fa) {
            var_57540c97 = 0;
        }
        if (var_e1ce43fa) {
            var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= var_57540c97 * -1;
        }
        if (!var_c1158761 && var_ae0c62b1) {
            var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= var_57540c97;
        }
    }
    return var_c1158761;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x4
// Checksum 0xbd4212d3, Offset: 0x1d60
// Size: 0x42
function private function_e9788bfb(entity) {
    if (entity asmistransitionrunning()) {
        return 1;
    }
    return function_7353f95b(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xea888722, Offset: 0x1db0
// Size: 0x7c
function private function_a938cb03(entity) {
    setcovershootstarttime(entity);
    keepclaimnode(entity);
    entity setblackboardattribute("_cover_mode", "cover_lean");
    choosecoverdirection(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x18660506, Offset: 0x1e38
// Size: 0x54
function private function_f82f8634(entity) {
    choosefrontcoverdirection(entity);
    cleanupcovermode(entity);
    clearcovershootstarttime(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x52a0adc, Offset: 0x1e98
// Size: 0x120
function private supportsleancovercondition(entity) {
    if (isdefined(entity.node)) {
        if (entity.node.type == #"cover left" || entity.node.type == #"cover right") {
            return 1;
        } else if (entity.node.type == #"cover pillar") {
            if (!(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024) || !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x8d88667b, Offset: 0x1fc0
// Size: 0x348
function private shouldleanatcovercondition(entity) {
    if (!isdefined(entity.node) || !isdefined(entity.node.type) || !isdefined(entity.enemy) || !isdefined(entity.enemy.origin)) {
        return 0;
    }
    yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
    var_c1158761 = 0;
    if (entity.node.type == #"cover left") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_left_lean");
        var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= -10;
    } else if (entity.node.type == #"cover right") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_right_lean");
        var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= 10;
    } else if (entity.node.type == #"cover pillar") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover");
        var_e1ce43fa = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024);
        var_ae0c62b1 = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048);
        var_57540c97 = 10;
        if (var_ae0c62b1 && var_e1ce43fa) {
            var_57540c97 = 0;
        }
        if (var_e1ce43fa) {
            var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= var_57540c97 * -1;
        }
        if (!var_c1158761 && var_ae0c62b1) {
            var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= var_57540c97;
        }
    }
    return var_c1158761;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xd11e3c01, Offset: 0x2310
// Size: 0x42
function private continueleaningatcovercondition(entity) {
    if (entity asmistransitionrunning()) {
        return 1;
    }
    return shouldleanatcovercondition(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x372cad57, Offset: 0x2360
// Size: 0x3c0
function private shouldleanatcoveridlecondition(entity) {
    if (!isdefined(entity.node) || !isdefined(entity.node.type)) {
        return 0;
    }
    if (isdefined(entity.enemy)) {
        yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
    } else {
        pos = entity.node.origin + 250 * entity.node.angles;
        yawtoenemyposition = angleclamp180(vectortoangles(pos - entity.node.origin)[1] - entity.node.angles[1]);
    }
    var_c1158761 = 0;
    if (entity.node.type == #"cover left") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_left_lean");
        var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= -10;
    } else if (entity.node.type == #"cover right") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover_right_lean");
        var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= 10;
    } else if (entity.node.type == #"cover pillar") {
        aimlimitsforcover = entity getaimlimitsfromentry("cover");
        var_e1ce43fa = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024);
        var_ae0c62b1 = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048);
        var_57540c97 = 10;
        if (var_ae0c62b1 && var_e1ce43fa) {
            var_57540c97 = 0;
        }
        if (var_e1ce43fa) {
            var_c1158761 = yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10 && yawtoenemyposition >= var_57540c97 * -1;
        }
        if (!var_c1158761 && var_ae0c62b1) {
            var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= var_57540c97;
        }
    }
    return var_c1158761;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xd7c1d49d, Offset: 0x2728
// Size: 0x42
function private continueleaningatcoveridlecondition(entity) {
    if (entity asmistransitionrunning()) {
        return 1;
    }
    return shouldleanatcoveridlecondition(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xb0e69cac, Offset: 0x2778
// Size: 0x7c
function private coverleaninitialize(entity) {
    setcovershootstarttime(entity);
    keepclaimnode(entity);
    entity setblackboardattribute("_cover_mode", "cover_lean");
    choosecoverdirection(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xc06ba502, Offset: 0x2800
// Size: 0x54
function private coverleanterminate(entity) {
    choosefrontcoverdirection(entity);
    cleanupcovermode(entity);
    clearcovershootstarttime(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xe61f2145, Offset: 0x2860
// Size: 0x7a
function private function_9e5575be(entity) {
    choosefrontcoverdirection(entity);
    cleanupcovermode(entity);
    clearcovershootstarttime(entity);
    entity ai::gun_recall();
    entity.blockingpain = 0;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x792a8287, Offset: 0x28e8
// Size: 0x22c
function private supportsovercovercondition(entity) {
    stance = entity getblackboardattribute("_stance");
    if (isdefined(entity.node)) {
        if (entity.node.type == #"conceal crouch" || entity.node.type == #"conceal stand") {
            return 1;
        }
        if (!isinarray(getvalidcoverpeekouts(entity.node), "over")) {
            return 0;
        }
        if (entity.node.type == #"cover left" || entity.node.type == #"cover right" || entity.node.type == #"cover crouch" || entity.node.type == #"cover crouch window" || entity.node.type == #"conceal crouch") {
            if (stance == "crouch") {
                return 1;
            }
        } else if (entity.node.type == #"cover stand" || entity.node.type == #"conceal stand") {
            if (stance == "stand") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xd862bc85, Offset: 0x2b20
// Size: 0x1f6
function private shouldoveratcovercondition(entity) {
    if (!isdefined(entity.node) || !isdefined(entity.node.type) || !isdefined(entity.enemy) || !isdefined(entity.enemy.origin)) {
        return 0;
    }
    aimtable = iscoverconcealed(entity.node) ? "cover_concealed_over" : "cover_over";
    aimlimitsforcover = entity getaimlimitsfromentry(aimtable);
    yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
    var_c1158761 = yawtoenemyposition >= aimlimitsforcover[#"aim_right"] - 10 && yawtoenemyposition <= aimlimitsforcover[#"aim_left"] + 10;
    if (!var_c1158761) {
        return 0;
    }
    pitchtoenemyposition = getaimpitchtoenemyfromnode(entity, entity.node, entity.enemy);
    var_14a02de3 = pitchtoenemyposition >= aimlimitsforcover[#"aim_up"] + 10 && pitchtoenemyposition <= aimlimitsforcover[#"aim_down"] + 10;
    if (!var_14a02de3) {
        return 0;
    }
    return 1;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x3a141d1a, Offset: 0x2d20
// Size: 0x64
function private coveroverinitialize(entity) {
    setcovershootstarttime(entity);
    keepclaimnode(entity);
    entity setblackboardattribute("_cover_mode", "cover_over");
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x8ac02d04, Offset: 0x2d90
// Size: 0x3c
function private coveroverterminate(entity) {
    cleanupcovermode(entity);
    clearcovershootstarttime(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xb9f18f38, Offset: 0x2dd8
// Size: 0x4a
function private function_b605a3b2(entity) {
    coveroverterminate(entity);
    entity ai::gun_recall();
    entity.blockingpain = 0;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x7ba45de9, Offset: 0x2e30
// Size: 0x4c
function private coveridleinitialize(entity) {
    keepclaimnode(entity);
    entity setblackboardattribute("_cover_mode", "cover_alert");
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xd14f6dda, Offset: 0x2e88
// Size: 0x3c
function private coveridleupdate(entity) {
    if (!entity asmistransitionrunning()) {
        releaseclaimnode(entity);
    }
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0xa49719ab, Offset: 0x2ed0
// Size: 0x3c
function private coveridleterminate(entity) {
    releaseclaimnode(entity);
    cleanupcovermode(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x850bcaf, Offset: 0x2f18
// Size: 0x6e
function private isflankedbyenemyatcover(entity) {
    return canbeflanked(entity) && entity isatcovernodestrict() && entity isflankedatcovernode() && !entity haspath();
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x89ea2a35, Offset: 0x2f90
// Size: 0x24
function private canbeflankedservice(entity) {
    setcanbeflanked(entity, 1);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x9d203612, Offset: 0x2fc0
// Size: 0xcc
function private coverflankedinitialize(entity) {
    if (isdefined(entity.enemy)) {
        entity getperfectinfo(entity.enemy);
        entity pathmode("move delayed", 0, 2);
    }
    setcanbeflanked(entity, 0);
    cleanupcovermode(entity);
    keepclaimnode(entity);
    entity setblackboardattribute("_desired_stance", "stand");
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x5 linked
// Checksum 0x915abddc, Offset: 0x3098
// Size: 0x2c
function private coverflankedactionterminate(entity) {
    entity.newenemyreaction = 0;
    releaseclaimnode(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x53412a77, Offset: 0x30d0
// Size: 0x120
function isatcrouchnode(entity) {
    if (isdefined(entity.node) && (entity.node.type == #"exposed" || entity.node.type == #"guard" || entity.node.type == #"path")) {
        if (distancesquared(entity.origin, entity.node.origin) <= 24 * 24) {
            return (!isstanceallowedatnode("stand", entity.node) && isstanceallowedatnode("crouch", entity.node));
        }
    }
    return 0;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x8e7bd0ed, Offset: 0x31f8
// Size: 0x3e
function isatcoverstrictcondition(entity) {
    return entity isatcovernodestrict() && !entity haspath();
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0xefcc9cd5, Offset: 0x3240
// Size: 0x44
function isatcovermodeover(entity) {
    covermode = entity getblackboardattribute("_cover_mode");
    return covermode == "cover_over";
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x1d07da3c, Offset: 0x3290
// Size: 0x44
function isatcovermodenone(entity) {
    covermode = entity getblackboardattribute("_cover_mode");
    return covermode == "cover_mode_none";
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x170cd7e8, Offset: 0x32e0
// Size: 0x3e
function isexposedatcovercondition(entity) {
    return entity isatcovernodestrict() && !entity shouldusecovernode();
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x8cea5918, Offset: 0x3328
// Size: 0x6c
function shouldcoveridleonly(entity) {
    if (entity ai::get_behavior_attribute("coverIdleOnly")) {
        return 1;
    }
    if (isdefined(entity.node.var_b769e943) && entity.node.var_b769e943) {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x82f55732, Offset: 0x33a0
// Size: 0x24
function issuppressedatcovercondition(entity) {
    return entity.suppressionmeter > entity.suppressionthreshold;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0xfed67bf5, Offset: 0x33d0
// Size: 0x3c
function keepclaimednodeandchoosecoverdirection(entity) {
    keepclaimnode(entity);
    choosecoverdirection(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x669ca2bd, Offset: 0x3418
// Size: 0x54
function resetcoverparameters(entity) {
    choosefrontcoverdirection(entity);
    cleanupcovermode(entity);
    clearcovershootstarttime(entity);
}

// Namespace aiutility/namespace_c334e59a
// Params 2, eflags: 0x1 linked
// Checksum 0xc78f5804, Offset: 0x3478
// Size: 0x9c
function choosecoverdirection(entity, var_3d11d1c4) {
    if (!isdefined(entity.node)) {
        return;
    }
    coverdirection = entity getblackboardattribute("_cover_direction");
    entity setblackboardattribute("_previous_cover_direction", coverdirection);
    entity setblackboardattribute("_cover_direction", calculatecoverdirection(entity, var_3d11d1c4));
}

// Namespace aiutility/namespace_c334e59a
// Params 2, eflags: 0x1 linked
// Checksum 0x95885ec5, Offset: 0x3520
// Size: 0x452
function calculatecoverdirection(entity, var_3d11d1c4) {
    if (isdefined(entity.treatallcoversasgeneric)) {
        if (!isdefined(var_3d11d1c4)) {
            var_3d11d1c4 = 0;
        }
        coverdirection = "cover_front_direction";
        if (entity.node.type == #"cover left") {
            if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 4) == 4 || math::cointoss() || var_3d11d1c4) {
                coverdirection = "cover_left_direction";
            }
        } else if (entity.node.type == #"cover right") {
            if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 4) == 4 || math::cointoss() || var_3d11d1c4) {
                coverdirection = "cover_right_direction";
            }
        } else if (entity.node.type == #"cover pillar") {
            if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024) {
                return "cover_right_direction";
            }
            if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048) {
                return "cover_left_direction";
            }
            coverdirection = "cover_left_direction";
            if (isdefined(entity.enemy)) {
                yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
                aimlimitsfordirectionright = entity getaimlimitsfromentry("pillar_right_lean");
                legalrightdirectionyaw = yawtoenemyposition >= aimlimitsfordirectionright[#"aim_right"] - 10 && yawtoenemyposition <= 0;
                if (legalrightdirectionyaw) {
                    coverdirection = "cover_right_direction";
                }
            }
        }
        return coverdirection;
    } else {
        coverdirection = "cover_front_direction";
        if (entity.node.type == #"cover pillar") {
            if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024) {
                return "cover_right_direction";
            }
            if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048) {
                return "cover_left_direction";
            }
            coverdirection = "cover_left_direction";
            if (isdefined(entity.enemy)) {
                yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
                aimlimitsfordirectionright = entity getaimlimitsfromentry("pillar_right_lean");
                legalrightdirectionyaw = yawtoenemyposition >= aimlimitsfordirectionright[#"aim_right"] - 10 && yawtoenemyposition <= 0;
                if (legalrightdirectionyaw) {
                    coverdirection = "cover_right_direction";
                }
            }
        }
    }
    return coverdirection;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x496c3d5f, Offset: 0x3980
// Size: 0x16
function clearcovershootstarttime(entity) {
    entity.covershootstarttime = undefined;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x30a72460, Offset: 0x39a0
// Size: 0x1a
function setcovershootstarttime(entity) {
    entity.covershootstarttime = gettime();
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0x11cc409a, Offset: 0x39c8
// Size: 0x28
function canbeflanked(entity) {
    return isdefined(entity.canbeflanked) && entity.canbeflanked;
}

// Namespace aiutility/namespace_c334e59a
// Params 2, eflags: 0x1 linked
// Checksum 0x9e87794a, Offset: 0x39f8
// Size: 0x22
function setcanbeflanked(entity, canbeflanked) {
    entity.canbeflanked = canbeflanked;
}

// Namespace aiutility/namespace_c334e59a
// Params 1, eflags: 0x1 linked
// Checksum 0xe4ff5dd0, Offset: 0x3a28
// Size: 0xe4
function cleanupcovermode(entity) {
    if (btapi_isatcovercondition(entity)) {
        covermode = entity getblackboardattribute("_cover_mode");
        entity setblackboardattribute("_previous_cover_mode", covermode);
        entity setblackboardattribute("_cover_mode", "cover_mode_none");
    } else {
        entity setblackboardattribute("_previous_cover_mode", "cover_mode_none");
        entity setblackboardattribute("_cover_mode", "cover_mode_none");
    }
}

