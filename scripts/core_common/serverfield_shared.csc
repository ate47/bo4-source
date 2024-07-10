#namespace serverfield;

// Namespace serverfield/serverfield_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x4f160982, Offset: 0x68
// Size: 0x44
function register(str_name, n_version, n_bits, str_type) {
    serverfieldregister(str_name, n_version, n_bits, str_type);
}

// Namespace serverfield/serverfield_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb5633523, Offset: 0xb8
// Size: 0x2c
function set(str_field_name, n_value) {
    serverfieldsetval(self, str_field_name, n_value);
}

// Namespace serverfield/serverfield_shared
// Params 1, eflags: 0x0
// Checksum 0x78ecbef5, Offset: 0xf0
// Size: 0x22
function get(field_name) {
    return serverfieldgetvalue(self, field_name);
}

