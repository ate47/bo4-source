#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace mp_revive_prompt;

// Namespace mp_revive_prompt
// Method(s) 8 Total 15
class cmp_revive_prompt : cluielem {

    var var_47e79fc;

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x578d9f07, Offset: 0x430
    // Size: 0x3c
    function set_reviveprogress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "reviveProgress", value);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x395535ff, Offset: 0x3e8
    // Size: 0x3c
    function set_health(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "health", value);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 2, eflags: 0x0
    // Checksum 0xd95b448d, Offset: 0x3a0
    // Size: 0x3c
    function set_clientnum(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "clientnum", value);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x5ce0a74b, Offset: 0x370
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x368cc272, Offset: 0x320
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "mp_revive_prompt", persistent);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 1, eflags: 0x0
    // Checksum 0xd2df4b9f, Offset: 0x278
    // Size: 0x9c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int", 0);
        cluielem::add_clientfield("health", 1, 5, "float", 0);
        cluielem::add_clientfield("reviveProgress", 1, 5, "float", 0);
    }

}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x30dc56ac, Offset: 0xf0
// Size: 0x40
function register(uid) {
    elem = new cmp_revive_prompt();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x26876b00, Offset: 0x138
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0xe4fd9a76, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x9ee86b32, Offset: 0x1a0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x505d0e79, Offset: 0x1c8
// Size: 0x28
function set_clientnum(player, value) {
    [[ self ]]->set_clientnum(player, value);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0xf625634f, Offset: 0x1f8
// Size: 0x28
function set_health(player, value) {
    [[ self ]]->set_health(player, value);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0xeb3352b2, Offset: 0x228
// Size: 0x28
function set_reviveprogress(player, value) {
    [[ self ]]->set_reviveprogress(player, value);
}

