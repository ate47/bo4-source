// Atian COD Tools GSC decompiler test
#include scripts/zm/perk/zm_perk_stronghold.gsc;
#include scripts/zm_common/zm_perks.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace zm_perk_mod_stronghold;

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x2
// Checksum 0x61063eef, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_stronghold", &__init__, &__main__, undefined);
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x1209dc81, Offset: 0xf8
// Size: 0x14
function __init__() {
    function_8afdc221();
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x118
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0xbe4ebff9, Offset: 0x128
// Size: 0x94
function function_8afdc221() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_camper", "mod_stronghold", #"perk_stronghold", #"specialty_camper", 3000);
    zm_perks::register_perk_threads(#"specialty_mod_camper", &function_1076eef9, &function_20b5dc19);
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x4ccf5211, Offset: 0x1c8
// Size: 0x24
function function_1076eef9() {
    level callback::on_ai_killed(&function_1c4f9c3f);
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 4, eflags: 0x1 linked
// Checksum 0xb14d15b0, Offset: 0x1f8
// Size: 0x44
function function_20b5dc19(b_pause, str_perk, str_result, n_slot) {
    level callback::remove_on_ai_killed(&function_1c4f9c3f);
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 1, eflags: 0x1 linked
// Checksum 0x8a1837cb, Offset: 0x248
// Size: 0xe4
function function_1c4f9c3f(s_params) {
    player = s_params.eattacker;
    if (isplayer(player) && player hasperk(#"specialty_mod_camper")) {
        if (!(isdefined(player.var_7d0e99f3) && player.var_7d0e99f3)) {
            return;
        }
        n_dist = distance(player.var_3748ec02, self.origin);
        if (n_dist <= 130) {
            player zm_perk_stronghold::add_armor();
            player zm_perk_stronghold::function_c25b980c();
        }
    }
}

