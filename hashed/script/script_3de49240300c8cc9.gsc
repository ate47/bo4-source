// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace wz_revive_prompt;

// Namespace wz_revive_prompt
// Method(s) 9 Total 16
class cwz_revive_prompt : cluielem {

    var var_47e79fc;

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0x4e3f5dd1, Offset: 0x4d8
    // Size: 0x3c
    function set_cowardsway(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "cowardsWay", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2cf071a9, Offset: 0x490
    // Size: 0x3c
    function set_reviveprogress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "reviveProgress", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbfc54322, Offset: 0x448
    // Size: 0x3c
    function set_health(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "health", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbca400cc, Offset: 0x400
    // Size: 0x3c
    function set_clientnum(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "clientnum", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3ab05ea6, Offset: 0x3d0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa46f2a8, Offset: 0x380
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "wz_revive_prompt", persistent);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 1, eflags: 0x1 linked
    // Checksum 0xe01e272, Offset: 0x2b0
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int");
        cluielem::add_clientfield("health", 1, 5, "float");
        cluielem::add_clientfield("reviveProgress", 1, 5, "float");
        cluielem::add_clientfield("cowardsWay", 17000, 1, "int");
    }

}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 1, eflags: 0x1 linked
// Checksum 0xc2c72f5f, Offset: 0xf8
// Size: 0x40
function register(uid) {
    elem = new cwz_revive_prompt();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x3c528d6f, Offset: 0x140
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x85bbacf6, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0xaf235ee0, Offset: 0x1a8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x24199459, Offset: 0x1d0
// Size: 0x28
function set_clientnum(player, value) {
    [[ self ]]->set_clientnum(player, value);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x545c2c21, Offset: 0x200
// Size: 0x28
function set_health(player, value) {
    [[ self ]]->set_health(player, value);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x4f8599fe, Offset: 0x230
// Size: 0x28
function set_reviveprogress(player, value) {
    [[ self ]]->set_reviveprogress(player, value);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x202a5ece, Offset: 0x260
// Size: 0x28
function set_cowardsway(player, value) {
    [[ self ]]->set_cowardsway(player, value);
}

