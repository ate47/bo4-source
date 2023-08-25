// Atian COD Tools GSC decompiler test
#namespace animationstatenetwork;

// Namespace animationstatenetwork/namespace_25ba93c
// Params 0, eflags: 0x2
// Checksum 0x471e5283, Offset: 0xb0
// Size: 0x12
function autoexec initanimationmocomps() {
    level.var_a03bcb07 = [];
}

// Namespace animationstatenetwork/runanimationmocomp
// Params 1, eflags: 0x41 linked
// Checksum 0x6d517fe6, Offset: 0xd0
// Size: 0x192
function event<runanimationmocomp> runanimationmocomp(eventstruct) {
    /#
        assert(eventstruct.status >= 0 && eventstruct.status <= 2, "<unknown string>" + eventstruct.status + "<unknown string>");
    #/
    /#
        assert(isdefined(level.var_a03bcb07[eventstruct.name]), "<unknown string>" + eventstruct.name + "<unknown string>");
    #/
    if (eventstruct.status == 0) {
        eventstruct.status = "asm_mocomp_start";
    } else if (eventstruct.status == 1) {
        eventstruct.status = "asm_mocomp_update";
    } else {
        eventstruct.status = "asm_mocomp_terminate";
    }
    animationmocompresult = eventstruct.entity [[ level.var_a03bcb07[eventstruct.name][eventstruct.status] ]](eventstruct.entity, eventstruct.delta_anim, eventstruct.blend_out_time, "", eventstruct.duration);
    return animationmocompresult;
}

// Namespace animationstatenetwork/namespace_25ba93c
// Params 4, eflags: 0x1 linked
// Checksum 0x989a5922, Offset: 0x270
// Size: 0x258
function registeranimationmocomp(mocompname, var_be53f38d, var_2990edef, var_c9501750) {
    mocompname = tolower(mocompname);
    /#
        assert(isstring(mocompname), "<unknown string>");
    #/
    /#
        assert(!isdefined(level.var_a03bcb07[mocompname]), "<unknown string>" + mocompname + "<unknown string>");
    #/
    level.var_a03bcb07[mocompname] = array();
    /#
        assert(isdefined(var_be53f38d) && isfunctionptr(var_be53f38d), "<unknown string>");
    #/
    level.var_a03bcb07[mocompname][#"asm_mocomp_start"] = var_be53f38d;
    if (isdefined(var_2990edef)) {
        /#
            assert(isfunctionptr(var_2990edef), "<unknown string>");
        #/
        level.var_a03bcb07[mocompname][#"asm_mocomp_update"] = var_2990edef;
    } else {
        level.var_a03bcb07[mocompname][#"asm_mocomp_update"] = &animationmocompemptyfunc;
    }
    if (isdefined(var_c9501750)) {
        /#
            assert(isfunctionptr(var_c9501750), "<unknown string>");
        #/
        level.var_a03bcb07[mocompname][#"asm_mocomp_terminate"] = var_c9501750;
    } else {
        level.var_a03bcb07[mocompname][#"asm_mocomp_terminate"] = &animationmocompemptyfunc;
    }
}

// Namespace animationstatenetwork/namespace_25ba93c
// Params 5, eflags: 0x1 linked
// Checksum 0x1e41624b, Offset: 0x4d0
// Size: 0x2c
function animationmocompemptyfunc(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    
}

