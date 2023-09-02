// Atian COD Tools GSC decompiler test
#using scripts\core_common\throttle_shared.gsc;
#using scripts\zm\perk\zm_perk_death_dash.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;

#namespace zm_perk_mod_death_dash;

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x2
// Checksum 0xf5908b87, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_death_dash", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x14a8c56, Offset: 0x140
// Size: 0x14
function __init__() {
    function_27473e44();
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x9a25c8e3, Offset: 0x160
// Size: 0xd4
function function_27473e44() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_death_dash", "mod_death_dash", #"perk_death_dash", #"specialty_death_dash", 3000);
    zm_perks::register_perk_clientfields(#"specialty_mod_death_dash", &register_clientfield, &set_clientfield);
    zm_perks::register_perk_threads(#"specialty_mod_death_dash", &give_perk, &take_perk);
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x1b05fcd, Offset: 0x240
// Size: 0x34
function register_clientfield() {
    clientfield::register("allplayers", "death_dash_pulse", 24000, 1, "counter");
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 1, eflags: 0x1 linked
// Checksum 0x3979dbeb, Offset: 0x280
// Size: 0xc
function set_clientfield(state) {
    
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xb1661d50, Offset: 0x298
// Size: 0x60
function give_perk() {
    self thread function_6607df78();
    if (!isdefined(self.var_3dd38cd4)) {
        self.var_3dd38cd4 = new throttle();
        [[ self.var_3dd38cd4 ]]->initialize(4, 0.05);
    }
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 4, eflags: 0x1 linked
// Checksum 0x9b01e485, Offset: 0x300
// Size: 0x36
function take_perk(b_pause, str_perk, str_result, n_slot) {
    self notify(#"hash_3e32f308aae32783");
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x19c45182, Offset: 0x340
// Size: 0x2b2
function function_6607df78() {
    self endon(#"death", #"hash_3e32f308aae32783");
    level endon(#"end_game");
    while (1) {
        self waittill(#"hash_6e2a731bbdb686b8");
        self clientfield::increment("death_dash_pulse", 1);
        self playrumbleonentity("talon_spike");
        var_baf7d060 = getaiteamarray(level.zombie_team);
        a_ai_zombies = array::get_all_closest(self.origin, var_baf7d060, undefined, undefined, 256);
        foreach (ai_zombie in a_ai_zombies) {
            if (!isalive(ai_zombie) || isdefined(ai_zombie.marked_for_death) && ai_zombie.marked_for_death) {
                continue;
            }
            if (!isdefined(ai_zombie.var_6f84b820)) {
                continue;
            }
            switch (ai_zombie.var_6f84b820) {
            case #"heavy":
            case #"miniboss":
            case #"enhanced":
                if (!(isdefined(ai_zombie.knockdown) && ai_zombie.knockdown)) {
                    ai_zombie ai::stun();
                }
                break;
            case #"popcorn":
                ai_zombie.var_96d5504c = 1;
                [[ self.var_3dd38cd4 ]]->waitinqueue(ai_zombie);
                ai_zombie thread zm_perk_death_dash::function_c1c51837(self);
                ai_zombie.var_96d5504c = undefined;
                break;
            case #"basic":
                ai_zombie zombie_utility::setup_zombie_knockdown(self);
                break;
            }
        }
    }
}

