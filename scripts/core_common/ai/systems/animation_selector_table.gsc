// Atian COD Tools GSC decompiler test
#namespace animationselectortable;

// Namespace animationselectortable/animation_selector_table
// Params 2, eflags: 0x1 linked
// Checksum 0xc110799f, Offset: 0x68
// Size: 0xaa
function registeranimationselectortableevaluator(functionname, functionptr) {
    if (!isdefined(level._astevaluatorscriptfunctions)) {
        level._astevaluatorscriptfunctions = [];
    }
    functionname = tolower(functionname);
    assert(isdefined(functionname) && isdefined(functionptr));
    assert(!isdefined(level._astevaluatorscriptfunctions[functionname]));
    level._astevaluatorscriptfunctions[functionname] = functionptr;
}

