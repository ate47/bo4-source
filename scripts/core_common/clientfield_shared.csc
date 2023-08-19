// Atian COD Tools GSC decompiler test
#namespace clientfield;

// Namespace clientfield/clientfield_shared
// Params 8, eflags: 0x1 linked
// Checksum 0xfff629ec, Offset: 0x90
// Size: 0x74
function register(str_pool_name, str_name, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new) {
    registerclientfield(str_pool_name, str_name, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

// Namespace clientfield/clientfield_shared
// Params 8, eflags: 0x1 linked
// Checksum 0x3d67865a, Offset: 0x110
// Size: 0x8c
function register_luielem(unique_name, field_name, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new) {
    registerclientfield("clientuimodel", "luielement." + unique_name + "." + field_name, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

// Namespace clientfield/clientfield_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xc0d5c26f, Offset: 0x1a8
// Size: 0x6c
function register_bgcache(poolname, var_b693fec6, uniqueid, version, func_callback, b_host, b_callback_for_zero_when_new) {
    function_3ff577e6(poolname, var_b693fec6, uniqueid, version, func_callback, b_host, b_callback_for_zero_when_new);
}

// Namespace clientfield/clientfield_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x8946ca47, Offset: 0x220
// Size: 0x44
function get(field_name) {
    if (self == level) {
        return codegetworldclientfield(field_name);
    } else {
        return codegetclientfield(self, field_name);
    }
}

// Namespace clientfield/clientfield_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x497546df, Offset: 0x270
// Size: 0x22
function get_to_player(field_name) {
    return codegetplayerstateclientfield(self, field_name);
}

// Namespace clientfield/clientfield_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xcb9a60c7, Offset: 0x2a0
// Size: 0x22
function get_player_uimodel(field_name) {
    return codegetuimodelclientfield(self, field_name);
}

// Namespace clientfield/clientfield_shared
// Params 2, eflags: 0x0
// Checksum 0x271a755b, Offset: 0x2d0
// Size: 0x42
function function_f7ae6994(unique_name, str_field_name) {
    return codegetuimodelclientfield(self, "luielement." + unique_name + "." + str_field_name);
}

