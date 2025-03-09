#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_deadshot;

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x2
// Checksum 0x1dbefe40, Offset: 0x138
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_deadshot", &__init__, undefined, undefined);
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0xb50a0d8, Offset: 0x180
// Size: 0x14
function __init__() {
    enable_deadshot_perk_for_level();
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0x7c6eb943, Offset: 0x1a0
// Size: 0x104
function enable_deadshot_perk_for_level() {
    zm_perks::register_perk_clientfields(#"specialty_deadshot", &deadshot_client_field_func, &deadshot_code_callback_func);
    zm_perks::register_perk_effects(#"specialty_deadshot", "deadshot_light");
    zm_perks::register_perk_init_thread(#"specialty_deadshot", &init_deadshot);
    zm_perks::function_b60f4a9f(#"specialty_deadshot", #"p8_zm_vapor_altar_icon_01_deadshot", "zombie/fx8_perk_altar_symbol_ambient_dead_shot", #"zmperksdeadshot");
    zm_perks::function_f3c80d73("zombie_perk_bottle_deadshot", "zombie_perk_totem_deadshot");
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0x89831933, Offset: 0x2b0
// Size: 0x52
function init_deadshot() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
        level._effect[#"deadshot_light"] = #"hash_2225287695ddf9c9";
    }
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0x13302762, Offset: 0x310
// Size: 0x4c
function deadshot_client_field_func() {
    clientfield::register("toplayer", "deadshot_perk", 1, 1, "int", &player_deadshot_perk_handler, 0, 1);
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x368
// Size: 0x4
function deadshot_code_callback_func() {
    
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 7, eflags: 0x0
// Checksum 0x96a0e80f, Offset: 0x378
// Size: 0xcc
function player_deadshot_perk_handler(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!is_local_player(self)) {
        return;
    }
    self endon(#"death");
    if (self util::function_50ed1561(localclientnum)) {
        if (is_local_player(self)) {
            if (newval) {
                self usealternateaimparams();
                return;
            }
            self clearalternateaimparams();
        }
    }
}

// Namespace zm_perk_deadshot/zm_perk_deadshot
// Params 1, eflags: 0x4
// Checksum 0xcff8fbb2, Offset: 0x450
// Size: 0x6a
function private is_local_player(player) {
    if (!isdefined(player) || !isplayer(player)) {
        return 0;
    }
    a_players = getlocalplayers();
    return isinarray(a_players, player);
}

