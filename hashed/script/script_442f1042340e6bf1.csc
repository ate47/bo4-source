#using scripts\core_common\lui_shared;

#namespace zm_zod_wonderweapon_quest;

// Namespace zm_zod_wonderweapon_quest
// Method(s) 10 Total 16
class czm_zod_wonderweapon_quest : cluielem {

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0x7d953140, Offset: 0x580
    // Size: 0x30
    function set_decay(localclientnum, value) {
        set_data(localclientnum, "decay", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0x3d73eea, Offset: 0x548
    // Size: 0x30
    function set_purity(localclientnum, value) {
        set_data(localclientnum, "purity", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0x1abc56f0, Offset: 0x510
    // Size: 0x30
    function set_plasma(localclientnum, value) {
        set_data(localclientnum, "plasma", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 2, eflags: 0x0
    // Checksum 0x642752f1, Offset: 0x4d8
    // Size: 0x30
    function set_radiance(localclientnum, value) {
        set_data(localclientnum, "radiance", value);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 1, eflags: 0x0
    // Checksum 0x87a220ae, Offset: 0x4a0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_zod_wonderweapon_quest");
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 1, eflags: 0x0
    // Checksum 0x57114ea3, Offset: 0x400
    // Size: 0x94
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "radiance", 0);
        set_data(localclientnum, "plasma", 0);
        set_data(localclientnum, "purity", 0);
        set_data(localclientnum, "decay", 0);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 1, eflags: 0x0
    // Checksum 0x58321293, Offset: 0x3d0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
    // Params 5, eflags: 0x0
    // Checksum 0x198c67c4, Offset: 0x2e0
    // Size: 0xe4
    function setup_clientfields(uid, var_89b4773e, var_703a7074, var_599a1ebc, var_c47850b) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("radiance", 1, 1, "int", var_89b4773e);
        cluielem::add_clientfield("plasma", 1, 1, "int", var_703a7074);
        cluielem::add_clientfield("purity", 1, 1, "int", var_599a1ebc);
        cluielem::add_clientfield("decay", 1, 1, "int", var_c47850b);
    }

}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 5, eflags: 0x0
// Checksum 0xfedb0e50, Offset: 0xc8
// Size: 0x70
function register(uid, var_89b4773e, var_703a7074, var_599a1ebc, var_c47850b) {
    elem = new czm_zod_wonderweapon_quest();
    [[ elem ]]->setup_clientfields(uid, var_89b4773e, var_703a7074, var_599a1ebc, var_c47850b);
    return elem;
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 1, eflags: 0x0
// Checksum 0xc77e6931, Offset: 0x140
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_zod_wonderweapon_quest();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 1, eflags: 0x0
// Checksum 0xe2a2d486, Offset: 0x188
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 1, eflags: 0x0
// Checksum 0x68eef353, Offset: 0x1b0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 1, eflags: 0x0
// Checksum 0x28cd2cbc, Offset: 0x1d8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0xd6569038, Offset: 0x200
// Size: 0x28
function set_radiance(localclientnum, value) {
    [[ self ]]->set_radiance(localclientnum, value);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0xbe223f5b, Offset: 0x230
// Size: 0x28
function set_plasma(localclientnum, value) {
    [[ self ]]->set_plasma(localclientnum, value);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0x8a405c92, Offset: 0x260
// Size: 0x28
function set_purity(localclientnum, value) {
    [[ self ]]->set_purity(localclientnum, value);
}

// Namespace zm_zod_wonderweapon_quest/zm_zod_wonderweapon_quest
// Params 2, eflags: 0x0
// Checksum 0x79b4923f, Offset: 0x290
// Size: 0x28
function set_decay(localclientnum, value) {
    [[ self ]]->set_decay(localclientnum, value);
}

