// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace spectrerisingindicator;

// Namespace spectrerisingindicator
// Method(s) 8 Total 14
class cspectrerisingindicator : cluielem {

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 2, eflags: 0x1 linked
    // Checksum 0x31406b6d, Offset: 0x3f0
    // Size: 0x30
    function set_isalive(localclientnum, value) {
        set_data(localclientnum, "isAlive", value);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 2, eflags: 0x1 linked
    // Checksum 0x9fbe7107, Offset: 0x3b8
    // Size: 0x30
    function set_clientnum(localclientnum, value) {
        set_data(localclientnum, "clientnum", value);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 1, eflags: 0x1 linked
    // Checksum 0x20f9d129, Offset: 0x380
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"spectrerisingindicator");
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 1, eflags: 0x1 linked
    // Checksum 0x277eb428, Offset: 0x318
    // Size: 0x5c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "clientnum", 0);
        set_data(localclientnum, "isAlive", 0);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1ae94536, Offset: 0x2e8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cspectrerisingindicator/spectrerisingindicator
    // Params 3, eflags: 0x1 linked
    // Checksum 0x65364c7b, Offset: 0x258
    // Size: 0x84
    function setup_clientfields(uid, var_c05c67e2, var_f25b9f45) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int", var_c05c67e2);
        cluielem::add_clientfield("isAlive", 1, 1, "int", var_f25b9f45);
    }

}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 3, eflags: 0x1 linked
// Checksum 0x213f0b2b, Offset: 0xb8
// Size: 0x58
function register(uid, var_c05c67e2, var_f25b9f45) {
    elem = new cspectrerisingindicator();
    [[ elem ]]->setup_clientfields(uid, var_c05c67e2, var_f25b9f45);
    return elem;
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 1, eflags: 0x0
// Checksum 0xd275265a, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new cspectrerisingindicator();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 1, eflags: 0x0
// Checksum 0x8fc4912a, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 1, eflags: 0x0
// Checksum 0x480b25d4, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 1, eflags: 0x0
// Checksum 0x188e232b, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 2, eflags: 0x0
// Checksum 0x32292a5e, Offset: 0x1d8
// Size: 0x28
function set_clientnum(localclientnum, value) {
    [[ self ]]->set_clientnum(localclientnum, value);
}

// Namespace spectrerisingindicator/spectrerisingindicator
// Params 2, eflags: 0x0
// Checksum 0xf2c22be4, Offset: 0x208
// Size: 0x28
function set_isalive(localclientnum, value) {
    [[ self ]]->set_isalive(localclientnum, value);
}

