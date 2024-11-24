#using scripts\zm_common\zm_utility;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\callbacks_shared;

#namespace mansion_achievements;

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x30682a78, Offset: 0x230
// Size: 0xc4
function init() {
    level thread function_51e43f4f();
    level thread function_f4b6212();
    level thread function_c91cfd5a();
    level thread function_a46f4413();
    callback::on_connect(&on_player_connect);
    callback::on_player_damage(&on_player_damage);
    callback::on_ai_killed(&on_ai_killed);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x5d3af9b7, Offset: 0x300
// Size: 0x94
function on_player_connect() {
    self thread function_51328dc2();
    self thread function_783dcd31();
    self thread function_87a4fba4();
    self thread function_e1ae38eb();
    self thread function_dd592c16();
    self thread function_18c92a4f();
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0x42479c63, Offset: 0x3a0
// Size: 0xe6
function on_player_damage(params) {
    if (isdefined(params.einflictor) && isdefined(params.einflictor.var_9fde8624)) {
        var_e72cb811 = params.einflictor.var_9fde8624;
    }
    if (isdefined(params.einflictor) && isdefined(params.einflictor.str_current_anim)) {
        str_current_anim = params.einflictor.str_current_anim;
    }
    if (var_e72cb811 === #"crimson_nosferatu" && str_current_anim === #"hash_30a3ae992c453f0c") {
        self notify(#"hash_6938bc311a1a893e");
    }
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0xa2276ea, Offset: 0x490
// Size: 0x280
function on_ai_killed(params) {
    e_attacker = params.eattacker;
    if (isplayer(e_attacker)) {
        if (self.archetype == #"nosferatu") {
            str_zone = self zm_utility::get_current_zone();
            if (isdefined(params.weapon) && isdefined(params.weapon.name)) {
                str_weapon = params.weapon.name;
            }
            if (str_zone === "zone_dining_room" && str_weapon === #"stake_knife") {
                e_attacker notify(#"hash_4505abb76e48700a");
            }
            return;
        }
        if (self.archetype == #"werewolf") {
            str_zone = self zm_utility::get_current_zone();
            if (isdefined(params.weapon) && isdefined(params.weapon.name)) {
                str_weapon = params.weapon.name;
            }
            a_revolvers = array(#"pistol_topbreak_t8", #"pistol_topbreak_t8_upgraded", #"pistol_revolver_t8", #"pistol_revolver_t8_gold", #"pistol_revolver_t8_upgraded", #"ww_random_ray_gun1", #"ww_random_ray_gun2", #"ww_random_ray_gun2_charged", #"ww_random_ray_gun3", #"ww_random_ray_gun3_charged");
            if (str_zone === "zone_library" && isdefined(str_weapon) && isinarray(a_revolvers, str_weapon)) {
                e_attacker notify(#"hash_1ac06d8c0149a66c");
            }
        }
    }
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0xaf1b0485, Offset: 0x718
// Size: 0x7c
function function_51e43f4f() {
    level endon(#"end_game");
    level flagsys::wait_till(#"hash_25d8c88ff3f91ee5");
    /#
        iprintlnbold("<dev string:x38>");
    #/
    zm_utility::giveachievement_wrapper("ZM_MANSION_ARTIFACT", 1);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x1d77b38c, Offset: 0x7a0
// Size: 0x94
function function_783dcd31() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hash_4505abb76e48700a");
    /#
        iprintlnbold("<dev string:x57>" + self getentnum());
    #/
    self zm_utility::giveachievement_wrapper("ZM_MANSION_STAKE", 0);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0xb1ea89cf, Offset: 0x840
// Size: 0x94
function function_87a4fba4() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hash_1ac06d8c0149a66c");
    /#
        iprintlnbold("<dev string:x7b>" + self getentnum());
    #/
    self zm_utility::giveachievement_wrapper("ZM_MANSION_BOARD", 0);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0xeea03f78, Offset: 0x8e0
// Size: 0x94
function function_51328dc2() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hash_6938bc311a1a893e");
    /#
        iprintlnbold("<dev string:xa1>" + self getentnum());
    #/
    self zm_utility::giveachievement_wrapper("ZM_MANSION_BITE", 0);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x7f79b755, Offset: 0x980
// Size: 0x84
function function_f4b6212() {
    level endon(#"end_game", #"hash_691d769f8aa3dcbd");
    level waittill(#"hash_3464fd1132f34721");
    /#
        iprintlnbold("<dev string:xc5>");
    #/
    zm_utility::giveachievement_wrapper("ZM_MANSION_QUICK", 1);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x479ccd84, Offset: 0xa10
// Size: 0x9c
function function_c91cfd5a() {
    level endon(#"end_game");
    for (var_532a9491 = 0; var_532a9491 < 3; var_532a9491++) {
        level waittill(#"hash_144b3192f03325f3");
    }
    /#
        iprintlnbold("<dev string:xe3>");
    #/
    zm_utility::giveachievement_wrapper("ZM_MANSION_ALCHEMICAL", 1);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0xcf8c0904, Offset: 0xab8
// Size: 0x164
function function_a46f4413() {
    level endon(#"end_game");
    level.var_f5ad5bac = 0;
    level thread function_8dc740fa("zblueprint_mansion_silver_molten");
    level thread function_8dc740fa("zblueprint_mansion_ww_lvl2");
    level thread function_8dc740fa("zblueprint_chaos_lvl3");
    level thread function_8dc740fa("zblueprint_shield_dual_wield");
    level thread function_8dc740fa("zblueprint_mansion_silver_bullet");
    level thread function_8dc740fa("zblueprint_mansion_a_skeet_fink");
    while (true) {
        level waittill(#"crafting_table_completed");
        if (level.var_f5ad5bac >= 6) {
            /#
                iprintlnbold("<dev string:x102>");
            #/
            zm_utility::giveachievement_wrapper("ZM_MANSION_CRAFTING", 1);
            break;
        }
    }
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 1, eflags: 0x1 linked
// Checksum 0xc803cfbd, Offset: 0xc28
// Size: 0x88
function function_8dc740fa(str_blueprint) {
    while (true) {
        waitresult = level waittill(#"blueprint_completed");
        if (waitresult.blueprint.name === str_blueprint) {
            level.var_f5ad5bac++;
            level notify(#"crafting_table_completed");
            break;
        }
    }
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x64218d85, Offset: 0xcb8
// Size: 0x94
function function_e1ae38eb() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hash_510f9114e7a6300c");
    /#
        iprintlnbold("<dev string:x123>" + self getentnum());
    #/
    self zm_utility::giveachievement_wrapper("ZM_MANSION_SHOCKING", 0);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x280bed59, Offset: 0xd58
// Size: 0x94
function function_dd592c16() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hash_305ca852d958a7e1");
    /#
        iprintlnbold("<dev string:x152>" + self getentnum());
    #/
    self zm_utility::giveachievement_wrapper("ZM_MANSION_CLOCK", 0);
}

// Namespace mansion_achievements/zm_mansion_achievements
// Params 0, eflags: 0x1 linked
// Checksum 0x5b3cd14c, Offset: 0xdf8
// Size: 0x94
function function_18c92a4f() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hash_148a0d55a59ee6a3");
    /#
        iprintlnbold("<dev string:x16f>" + self getentnum());
    #/
    self zm_utility::giveachievement_wrapper("ZM_MANSION_SHRINKING", 0);
}

