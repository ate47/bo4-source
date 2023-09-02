// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;

#namespace zm_maptable;

// Namespace zm_maptable/zm_maptable
// Params 0, eflags: 0x1 linked
// Checksum 0x780a1913, Offset: 0x70
// Size: 0x14e
function function_10672567() {
    if (!isdefined(level.maptableentry)) {
        mapname = util::get_map_name();
        fields = getmapfields();
        if (!isdefined(fields)) {
            fields = getmapfields(mapname, 0);
        }
        if (!isdefined(fields)) {
            fields = getmapfields(mapname, 1);
        }
        if (!isdefined(fields)) {
            fields = getmapfields(mapname, 2);
        }
        if (!isdefined(fields)) {
            fields = getmapfields(mapname, 3);
        }
        if (!isdefined(fields)) {
            fields = getmapfields(mapname, 4);
        }
        /#
            if (!isdefined(fields)) {
                fields = getmapfields(mapname, "<unknown string>");
            }
        #/
        level.maptableentry = fields;
    }
    return level.maptableentry;
}

// Namespace zm_maptable/zm_maptable
// Params 0, eflags: 0x1 linked
// Checksum 0x53a2df7b, Offset: 0x1c8
// Size: 0x5a
function get_cast() {
    cast = #"other";
    fields = function_10672567();
    if (isdefined(fields)) {
        cast = fields.cast;
    }
    return cast;
}

// Namespace zm_maptable/zm_maptable
// Params 0, eflags: 0x1 linked
// Checksum 0x69742274, Offset: 0x230
// Size: 0x42
function get_story() {
    var_26ea2807 = get_cast();
    if (var_26ea2807 === #"story1") {
        return 1;
    }
    return 2;
}

