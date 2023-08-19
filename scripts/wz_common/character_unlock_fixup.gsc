// Atian COD Tools GSC decompiler test
#include scripts/mp_common/item_world_fixup.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace character_unlock_fixup;

// Namespace character_unlock_fixup/character_unlock_fixup
// Params 0, eflags: 0x2
// Checksum 0x244307d2, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"character_unlock_fixup", &__init__, undefined, undefined);
}

// Namespace character_unlock_fixup/character_unlock_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0xd98e4f39, Offset: 0xe8
// Size: 0x44
function __init__() {
    level.var_7d8da246 = [];
    level callback::add_callback(#"hash_11bd48298bde44a4", &function_c67a5089);
}

// Namespace character_unlock_fixup/character_unlock_fixup
// Params 5, eflags: 0x21 linked
// Checksum 0x2b076203, Offset: 0x138
// Size: 0x20e
function register_character_unlock(unlock_name, unlock_stat, item, var_f27097cc, vararg...) {
    /#
        assert(vararg.size > 0, "<unknown string>");
    #/
    var_9ba1646c = {#activation_func:undefined, #var_849d923d:var_f27097cc, #var_3845495:[], #required_item:item, #var_2b469a7d:unlock_stat};
    for (i = 0; i < vararg.size; i++) {
        if (!isdefined(var_9ba1646c.var_3845495)) {
            var_9ba1646c.var_3845495 = [];
        } else if (!isarray(var_9ba1646c.var_3845495)) {
            var_9ba1646c.var_3845495 = array(var_9ba1646c.var_3845495);
        }
        var_9ba1646c.var_3845495[var_9ba1646c.var_3845495.size] = vararg[i];
    }
    if (!isdefined(var_9ba1646c.var_3845495)) {
        var_9ba1646c.var_3845495 = [];
    } else if (!isarray(var_9ba1646c.var_3845495)) {
        var_9ba1646c.var_3845495 = array(var_9ba1646c.var_3845495);
    }
    var_9ba1646c.var_3845495[var_9ba1646c.var_3845495.size] = #"hash_3f07579f66b464e8";
    level.var_7d8da246[unlock_name] = var_9ba1646c;
}

// Namespace character_unlock_fixup/character_unlock_fixup
// Params 2, eflags: 0x1 linked
// Checksum 0x3be5933a, Offset: 0x350
// Size: 0xae
function function_90ee7a97(unlock_name, activation_func) {
    var_9ba1646c = level.var_7d8da246[unlock_name];
    if (!isdefined(var_9ba1646c)) {
        /#
            /#
                assertmsg("<unknown string>" + function_9e72a96(unlock_name) + "<unknown string>");
            #/
        #/
        return;
    }
    if (!isdefined(activation_func)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    var_9ba1646c.activation_func = activation_func;
}

// Namespace character_unlock_fixup/character_unlock_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0xa7be59eb, Offset: 0x408
// Size: 0xa50
function function_c67a5089() {
    if (!isdefined(level.var_7d8da246) || level.var_7d8da246.size == 0) {
        return;
    }
    level.var_4c71ec6c = [];
    foreach (unlock_name, var_9ba1646c in level.var_7d8da246) {
        array::add_sorted(level.var_4c71ec6c, unlock_name, 0, &function_f53ec921);
    }
    var_743d50f5 = [];
    foreach (index, unlock_name in level.var_4c71ec6c) {
        if (!isdefined(level.var_7d8da246[unlock_name])) {
            continue;
        }
        var_9ba1646c = level.var_7d8da246[unlock_name];
        if (isdefined(var_9ba1646c.var_849d923d) && [[ var_9ba1646c.var_849d923d ]]()) {
            if (!isdefined(var_743d50f5)) {
                var_743d50f5 = [];
            } else if (!isarray(var_743d50f5)) {
                var_743d50f5 = array(var_743d50f5);
            }
            var_743d50f5[var_743d50f5.size] = unlock_name;
        }
    }
    level.var_755e455a = [];
    level.var_c70f02d7 = undefined;
    sprays = [];
    for (i = 0; i < var_743d50f5.size; i++) {
        if (var_743d50f5[i] == #"hash_178221dd8299137b" || var_743d50f5[i] == #"hash_3532d912b12917c9" || var_743d50f5[i] == #"hash_517bb26004a9c12b" || var_743d50f5[i] == #"hash_263de5e9fa6d16ea" || var_743d50f5[i] == #"hash_74709eb5a08139fb" || var_743d50f5[i] == #"hash_8c7045e78561cf4") {
            if (!isdefined(sprays)) {
                sprays = [];
            } else if (!isarray(sprays)) {
                sprays = array(sprays);
            }
            sprays[sprays.size] = var_743d50f5[i];
        }
    }
    for (i = 0; i < var_743d50f5.size; i++) {
        if (var_743d50f5[i] == #"hash_178221dd8299137b" || var_743d50f5[i] == #"hash_3532d912b12917c9" || var_743d50f5[i] == #"hash_517bb26004a9c12b" || var_743d50f5[i] == #"hash_263de5e9fa6d16ea" || var_743d50f5[i] == #"hash_74709eb5a08139fb" || var_743d50f5[i] == #"hash_8c7045e78561cf4") {
            arrayremoveindex(var_743d50f5, i);
        }
    }
    if (isdefined(getgametypesetting(#"wzblightfather")) && getgametypesetting(#"wzblightfather")) {
        var_f279f28f = [];
        for (i = 0; i < var_743d50f5.size; i++) {
            if (var_743d50f5[i] == #"stanton_unlock" || var_743d50f5[i] == #"scarlett_unlock" || var_743d50f5[i] == #"diego_unlock" || var_743d50f5[i] == #"bruno_unlock" || var_743d50f5[i] == "#dempsey_unlock" || var_743d50f5[i] == #"nikolai_unlock" || var_743d50f5[i] == #"richtofen_unlock" || var_743d50f5[i] == #"takeo_unlock") {
                if (!isdefined(var_f279f28f)) {
                    var_f279f28f = [];
                } else if (!isarray(var_f279f28f)) {
                    var_f279f28f = array(var_f279f28f);
                }
                var_f279f28f[var_f279f28f.size] = var_743d50f5[i];
            }
        }
        if (var_f279f28f.size > 0) {
            random_index = function_d59c2d03(var_f279f28f.size);
            if (!isdefined(level.var_755e455a)) {
                level.var_755e455a = [];
            } else if (!isarray(level.var_755e455a)) {
                level.var_755e455a = array(level.var_755e455a);
            }
            level.var_755e455a[level.var_755e455a.size] = var_f279f28f[random_index];
            level.var_c70f02d7 = var_f279f28f[random_index];
        }
    }
    while (var_743d50f5.size > 0 && level.var_755e455a.size < (isdefined(getgametypesetting(#"hash_221008a2c793dfa1")) ? getgametypesetting(#"hash_221008a2c793dfa1") : 14)) {
        var_b844743b = function_d59c2d03(var_743d50f5.size);
        if (!isdefined(level.var_755e455a)) {
            level.var_755e455a = [];
        } else if (!isarray(level.var_755e455a)) {
            level.var_755e455a = array(level.var_755e455a);
        }
        level.var_755e455a[level.var_755e455a.size] = var_743d50f5[var_b844743b];
        arrayremoveindex(var_743d50f5, var_b844743b);
    }
    foreach (index, spray in sprays) {
        if (!isdefined(level.var_755e455a)) {
            level.var_755e455a = [];
        } else if (!isarray(level.var_755e455a)) {
            level.var_755e455a = array(level.var_755e455a);
        }
        level.var_755e455a[level.var_755e455a.size] = spray;
    }
    foreach (unlock_name in level.var_4c71ec6c) {
        if (!isdefined(level.var_7d8da246[unlock_name])) {
            continue;
        }
        var_9ba1646c = level.var_7d8da246[unlock_name];
        enabled = 0;
        if (isinarray(level.var_755e455a, unlock_name)) {
            enabled = 1;
        }
        if (gamemodeismode(1) || gamemodeismode(7)) {
            enabled = 0;
        }
        if (!enabled) {
            item_name = var_9ba1646c.required_item;
            var_a6762160 = getscriptbundle(item_name);
            if (isdefined(var_a6762160)) {
                item_world_fixup::remove_item(item_name);
            }
        }
        if (isdefined(var_9ba1646c.activation_func)) {
            level [[ var_9ba1646c.activation_func ]](enabled);
        }
    }
}

// Namespace character_unlock_fixup/character_unlock_fixup
// Params 2, eflags: 0x1 linked
// Checksum 0x350db4f0, Offset: 0xe60
// Size: 0x3c
function function_f53ec921(a, b) {
    return int(a) < int(b);
}

