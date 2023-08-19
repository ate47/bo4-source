// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_perks.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_perk_mod_bandolier;

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0, eflags: 0x2
// Checksum 0xa0c67529, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_bandolier", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0x587397e, Offset: 0xe0
// Size: 0x14
function __init__() {
    function_27473e44();
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0xd1c36d04, Offset: 0x100
// Size: 0x94
function function_27473e44() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_extraammo", "mod_bandolier", #"perk_bandolier", #"specialty_extraammo", 3500);
    zm_perks::register_perk_threads(#"specialty_mod_extraammo", &give_mod_perk, &function_3781ff37);
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0xbcae9e91, Offset: 0x1a0
// Size: 0x1c
function give_mod_perk() {
    self thread function_9335851();
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 4, eflags: 0x1 linked
// Checksum 0x2246689c, Offset: 0x1c8
// Size: 0x36
function function_3781ff37(b_pause, str_perk, str_result, n_slot) {
    self notify(#"hash_73b1e35c66a4e898");
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0, eflags: 0x1 linked
// Checksum 0xa79f56a, Offset: 0x208
// Size: 0x354
function function_9335851() {
    self endon(#"disconnect", #"hash_73b1e35c66a4e898");
    while (1) {
        wait(1);
        a_weapons = self getweaponslistprimaries();
        foreach (weapon in a_weapons) {
            w_current = self getcurrentweapon();
            var_911fad7c = zm_weapons::function_af29d744(w_current);
            w_root = zm_weapons::function_386dacbc(weapon);
            if (var_911fad7c == w_root) {
                continue;
            } else if (weaponhasattachment(weapon, "uber") && w_root == getweapon(#"smg_capacity_t8")) {
                continue;
            } else {
                n_clip = self getweaponammoclip(weapon);
                n_clip_size = weapon.clipsize;
                n_stock_size = self getweaponammostock(weapon);
                if (isdefined(n_clip) && isdefined(n_clip_size) && n_clip < n_clip_size) {
                    var_8e477029 = int(ceil(n_clip_size * 0.05));
                    if (weapon.iscliponly) {
                        continue;
                    } else if (n_stock_size >= var_8e477029) {
                        self setweaponammoclip(weapon, n_clip + var_8e477029);
                        self setweaponammostock(weapon, n_stock_size - var_8e477029);
                        if (n_clip + var_8e477029 >= n_clip_size) {
                            self playsoundtoplayer(#"hash_1306cd3cf0ce7b64", self);
                        }
                    } else if (n_stock_size > 0) {
                        self setweaponammoclip(weapon, n_clip + 1);
                        self setweaponammostock(weapon, n_stock_size - 1);
                        self playsoundtoplayer(#"hash_1306cd3cf0ce7b64", self);
                    }
                }
            }
        }
    }
}

