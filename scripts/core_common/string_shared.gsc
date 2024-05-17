// Atian COD Tools GSC decompiler test
#namespace string;

/#

    // Namespace string/string_shared
    // Params 3, eflags: 0x0
    // Checksum 0x81475491, Offset: 0x68
    // Size: 0x92
    function rjust(str_input, n_length, str_fill) {
        if (!isdefined(str_fill)) {
            str_fill = "<unknown string>";
        }
        str_input = isdefined(str_input) ? "<unknown string>" + str_input : "<unknown string>";
        n_fill_length = n_length - str_input.size;
        str_fill = fill(n_fill_length, str_fill);
        return str_fill + str_input;
    }

    // Namespace string/string_shared
    // Params 3, eflags: 0x0
    // Checksum 0x4fe19ed2, Offset: 0x108
    // Size: 0x92
    function ljust(str_input, n_length, str_fill) {
        if (!isdefined(str_fill)) {
            str_fill = "<unknown string>";
        }
        str_input = isdefined(str_input) ? "<unknown string>" + str_input : "<unknown string>";
        n_fill_length = n_length - str_input.size;
        str_fill = fill(n_fill_length, str_fill);
        return str_input + str_fill;
    }

    // Namespace string/string_shared
    // Params 2, eflags: 0x0
    // Checksum 0x1b87dcf, Offset: 0x1a8
    // Size: 0xae
    function fill(n_length, str_fill) {
        if (!isdefined(str_fill) || str_fill == "<unknown string>") {
            str_fill = "<unknown string>";
        }
        for (str_return = "<unknown string>"; n_length > 0; str_return += str) {
            str = getsubstr(str_fill, 0, n_length);
            n_length -= str.size;
        }
        return str_return;
    }

#/
