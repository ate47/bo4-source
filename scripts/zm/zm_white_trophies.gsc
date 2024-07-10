#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_white_trophies;

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0xc25303a0, Offset: 0x188
// Size: 0x124
function init() {
    callback::on_connect(&on_player_connect);
    callback::on_ai_killed(&function_48f916b);
    callback::on_ai_killed(&function_bde94bdf);
    level thread function_df71a9b9();
    level thread shard_watcher();
    level thread function_9785ebce();
    level thread pap_watcher();
    level.n_electric_trap_kills = 0;
    level.var_36067f1f = 0;
    level.var_8265e44f = 0;
    level.var_4b81bb64 = 0;
    level.var_9e22ff45 = 0;
    callback::on_ai_killed(&function_2c104547);
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0x90717a9d, Offset: 0x2b8
// Size: 0x92
function on_player_connect() {
    self thread function_e0aaa050();
    self thread function_f37ba127();
    self thread function_5e1138a2();
    self.var_f50a2a9b = 0;
    self.var_5e47a087 = 0;
    self.var_31ce05fd = 0;
    self.var_c9f12812 = array(0, 0, 0, 0);
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0xe0d1b5b, Offset: 0x358
// Size: 0x7c
function shard_watcher() {
    level endon(#"game_ended");
    self waittill(#"hash_5aa1c9627e8626e0");
    /#
        iprintlnbold("<dev string:x38>" + "<dev string:x4b>");
    #/
    self zm_utility::giveachievement_wrapper("zm_white_shard", 1);
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0x5d078bbf, Offset: 0x3e0
// Size: 0xec
function function_e0aaa050() {
    level endon(#"game_ended", #"hash_5aa1c9627e8626e0");
    self endon(#"death", #"disconnect");
    for (i = 0; i < 20; i++) {
        level waittill(#"end_of_round");
        if (self.zone_name !== "zone_security_checkpoint") {
            return;
        }
    }
    /#
        iprintlnbold("<dev string:x38>" + "<dev string:x5c>");
    #/
    self zm_utility::giveachievement_wrapper("zm_white_starting", 0);
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0xf84ec0aa, Offset: 0x4d8
// Size: 0xd4
function function_f37ba127() {
    level endon(#"game_ended", #"hash_5aa1c9627e8626e0");
    self endon(#"disconnect");
    while (true) {
        waitresult = self waittill(#"hash_13f3f231b45420ef");
        if (waitresult.e_player === self) {
            /#
                iprintlnbold("<dev string:x38>" + "<dev string:x70>");
            #/
            self zm_utility::giveachievement_wrapper("zm_white_unlock", 0);
            return;
        }
        wait(0.5);
    }
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0x7ce9b3e9, Offset: 0x5b8
// Size: 0xac
function function_9785ebce() {
    level endon(#"game_ended", #"hash_5aa1c9627e8626e0");
    for (i = 0; i < 4; i++) {
        level waittill(#"hash_13f3f231b45420ef");
    }
    /#
        iprintlnbold("<dev string:x38>" + "<dev string:x82>");
    #/
    self zm_utility::giveachievement_wrapper("zm_white_mod", 1);
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 1, eflags: 0x1 linked
// Checksum 0xcbb34caf, Offset: 0x670
// Size: 0x304
function function_2c104547(s_params) {
    e_attacker = s_params.eattacker;
    if (!isdefined(e_attacker) || !isdefined(e_attacker._trap_type)) {
        return;
    }
    switch (e_attacker._trap_type) {
    case #"electric":
        if (level.n_electric_trap_kills < 12) {
            level.n_electric_trap_kills++;
            /#
                iprintln("<dev string:x91>" + level.n_electric_trap_kills);
            #/
        }
        break;
    case #"rotating":
        if (level.var_36067f1f < 12) {
            level.var_36067f1f++;
            /#
                iprintln("<dev string:xa9>" + level.var_36067f1f);
            #/
        }
        break;
    case #"acid":
        if (level.var_8265e44f < 12) {
            level.var_8265e44f++;
            /#
                iprintln("<dev string:xbc>" + level.var_8265e44f);
            #/
        }
        break;
    case #"fire":
        if (level.var_4b81bb64 < 12) {
            level.var_4b81bb64++;
            /#
                iprintln("<dev string:xd2>" + level.var_4b81bb64);
            #/
        }
        break;
    case #"soul":
        if (level.var_9e22ff45 < 12) {
            level.var_9e22ff45++;
            /#
                iprintln("<dev string:xe6>" + level.var_9e22ff45);
            #/
        }
        break;
    }
    if (level.n_electric_trap_kills > 11 && level.var_36067f1f > 11 && level.var_8265e44f > 11 && level.var_4b81bb64 > 11 && level.var_9e22ff45 > 11) {
        /#
            iprintlnbold("<dev string:x38>" + "<dev string:xf9>");
        #/
        self zm_utility::giveachievement_wrapper("zm_white_trap", 1);
        callback::remove_on_ai_killed(&function_2c104547);
    }
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0xd70c5169, Offset: 0x980
// Size: 0xa4
function pap_watcher() {
    level endon(#"game_ended", #"hash_5aa1c9627e8626e0");
    level waittill(#"pap_power_ready");
    if (level.round_number <= 5) {
        /#
            iprintlnbold("<dev string:x38>" + "<dev string:x109>");
        #/
        zm_utility::giveachievement_wrapper("zm_white_pap", 1);
    }
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 1, eflags: 0x1 linked
// Checksum 0xf71501a6, Offset: 0xa30
// Size: 0x11e
function function_48f916b(params) {
    e_attacker = params.eattacker;
    if (!isplayer(e_attacker) || !isdefined(e_attacker.var_f50a2a9b)) {
        return;
    }
    if (params.weapon.name != #"galvaknuckles_t8") {
        return;
    }
    e_attacker.var_f50a2a9b++;
    /#
        iprintln("<dev string:x118>" + e_attacker.var_f50a2a9b);
    #/
    if (e_attacker.var_f50a2a9b >= 115) {
        /#
            iprintlnbold("<dev string:x38>" + "<dev string:x12f>");
        #/
        e_attacker zm_utility::giveachievement_wrapper("zm_white_knuckles", 0);
        e_attacker.var_f50a2a9b = undefined;
    }
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0x163ab6ea, Offset: 0xb58
// Size: 0x19e
function function_5e1138a2() {
    level endon(#"hash_5aa1c9627e8626e0");
    self endon(#"disconnect");
    while (true) {
        waitresult = self waittill(#"perk_bought");
        if (isdefined(waitresult.n_slot)) {
            self.var_c9f12812[waitresult.n_slot] = 1;
            self thread perk_watcher();
            for (i = 0; i < 35; i++) {
                wait(1);
                if (self function_91cfddc4()) {
                    /#
                        iprintlnbold("<dev string:x143>" + i + 1);
                    #/
                    /#
                        iprintlnbold("<dev string:x38>" + "<dev string:x154>");
                    #/
                    self zm_utility::giveachievement_wrapper("zm_white_perk", 0);
                    self notify(#"hash_1305a28597a2e439");
                    return;
                }
            }
            self notify(#"hash_1305a28597a2e439");
            self.var_c9f12812 = array(0, 0, 0, 0);
        }
    }
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0xd03674e3, Offset: 0xd00
// Size: 0x82
function perk_watcher() {
    self endon(#"hash_1305a28597a2e439", #"disconnect");
    while (true) {
        waitresult = self waittill(#"perk_bought");
        if (isdefined(waitresult.n_slot)) {
            self.var_c9f12812[waitresult.n_slot] = 1;
        }
    }
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0x848f8d5c, Offset: 0xd90
// Size: 0x74
function function_91cfddc4() {
    foreach (bought in self.var_c9f12812) {
        if (!bought) {
            return false;
        }
    }
    return true;
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 0, eflags: 0x1 linked
// Checksum 0xa5a8c03d, Offset: 0xe10
// Size: 0x1e2
function function_df71a9b9() {
    level endon(#"game_ended", #"hash_5aa1c9627e8626e0");
    while (true) {
        waitresults = level waittill(#"hash_4543ba0bff75332e");
        e_attacker = waitresults.e_player;
        if (isplayer(e_attacker) && isdefined(e_attacker.var_5e47a087)) {
            a_e_zombies = getaiteamarray(level.zombie_team);
            e_attacker.var_5e47a087 = 0;
            foreach (e_zombie in a_e_zombies) {
                if (e_zombie.var_6ee03e9a === 1) {
                    e_attacker.var_5e47a087++;
                }
            }
            /#
                iprintln("<dev string:x164>" + e_attacker.var_5e47a087);
            #/
            if (e_attacker.var_5e47a087 >= 10) {
                /#
                    iprintlnbold("<dev string:x38>" + "<dev string:x17e>");
                #/
                e_attacker zm_utility::giveachievement_wrapper("zm_white_stun", 0);
                e_attacker.var_5e47a087 = undefined;
            }
        }
    }
}

// Namespace zm_white_trophies/zm_white_trophies
// Params 1, eflags: 0x1 linked
// Checksum 0xe4a18c39, Offset: 0x1000
// Size: 0x146
function function_bde94bdf(params) {
    e_attacker = params.eattacker;
    if (!(isdefined(self.var_b421bafe) && self.var_b421bafe)) {
        return;
    }
    if (!isplayer(e_attacker) || !isdefined(e_attacker.var_31ce05fd)) {
        return;
    }
    if (params.smeansofdeath === "MOD_GRENADE_SPLASH" || params.smeansofdeath === "MOD_GRENADE") {
        e_attacker.var_31ce05fd++;
        /#
            iprintln("<dev string:x18e>" + e_attacker.var_31ce05fd);
        #/
        if (e_attacker.var_31ce05fd >= 15) {
            /#
                iprintlnbold("<dev string:x38>" + "<dev string:x1ad>");
            #/
            e_attacker zm_utility::giveachievement_wrapper("zm_white_roof", 0);
            e_attacker.var_31ce05fd = undefined;
        }
    }
}

