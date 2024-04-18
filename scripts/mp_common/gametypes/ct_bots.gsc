// Atian COD Tools GSC decompiler test
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_core.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace ct_bots;

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x2
// Checksum 0x210533a3, Offset: 0x208
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ct_bots", &__init__, undefined, undefined);
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xaa5109f2, Offset: 0x250
// Size: 0x76
function __init__() {
    level.mayspawn = &function_72be4f1b;
    level.var_b8d30546 = 1;
    level.var_32ae304 = &function_32ae304;
    level.var_bddfddcf = &function_bddfddcf;
    level.onrespawndelay = &function_5b28ef38;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x3cde43ef, Offset: 0x2d0
// Size: 0x26
function function_5b28ef38() {
    if (self.team == "allies") {
        return 0;
    }
    return 0.1;
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x77d05a5, Offset: 0x300
// Size: 0x7a
function function_32ae304(lefthand) {
    var_51cee2ad = gettime() + randomintrange(self.bot.var_b2b8f0b6, self.bot.var_e8c941d6);
    if (lefthand) {
        self.bot.var_af11e334 = var_51cee2ad;
        return;
    }
    self.bot.var_51cee2ad = var_51cee2ad;
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x470be099, Offset: 0x388
// Size: 0x74
function function_bddfddcf(lefthand) {
    if (self function_a39f313c(lefthand) || self isplayerswimming()) {
        return (gettime() > (lefthand ? self.bot.var_af11e334 : self.bot.var_51cee2ad));
    }
    return false;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xc6b73e56, Offset: 0x408
// Size: 0xac
function function_72be4f1b() {
    if (isdefined(level.var_e6db911d) && level.var_e6db911d && self.team == "axis") {
        return false;
    }
    if (isdefined(level.var_6a0c3e3e) && level.var_6a0c3e3e && self.team == "allies" && isbot(self)) {
        return false;
    }
    if (isdefined(self.disablespawning) && self.disablespawning) {
        return false;
    }
    return true;
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0xe8ee9676, Offset: 0x4c0
// Size: 0x274
function function_fa0d912f(var_7b4ae7d1) {
    level.var_6e246fb7 = "bot_tacstate_friendly_mp_ct";
    level.var_258cdebb = "bot_tacstate_mp_laststand_ct";
    level.var_b8d30546 = 1;
    if (!isdefined(var_7b4ae7d1)) {
        var_7b4ae7d1 = 17;
    }
    /#
        thread debug_bots(var_7b4ae7d1);
    #/
    for (i = 0; i < var_7b4ae7d1; i++) {
        bot = bot::add_bot(#"spectator");
        if (!isdefined(bot)) {
            break;
        }
        if (isdefined(level.var_7cab580)) {
            bot.var_29b433bd = level.var_7cab580;
        } else {
            var_5ec2386a = getplayerroletemplatecount(currentsessionmode());
            count = 0;
            do {
                role_index = randomintrange(1, var_5ec2386a);
                fields = getcharacterfields(role_index, currentsessionmode());
                count += 1;
                if (isdefined(fields) && isdefined(fields.var_49a55967) && fields.var_49a55967) {
                    break;
                }
            } while (count < var_5ec2386a);
            if (!isdefined(fields) || !(isdefined(fields.var_49a55967) && fields.var_49a55967)) {
                role_index = 1;
            }
            bot.var_29b433bd = role_index;
        }
        bot.pers[#"class"] = level.defaultclass;
        bot.curclass = level.defaultclass;
        bot.var_71a70093 = level.var_eea9be19;
        waitframe(1);
    }
    level flag::set("bot_init_complete");
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x9f3cd1db, Offset: 0x740
// Size: 0xe2
function function_2a8fc6b2() {
    entities = bot::get_bots();
    currentactivecount = 0;
    foreach (entity in entities) {
        if (!isdefined(entity.bot)) {
            continue;
        }
        if (entity.sessionstate == "spectator") {
            continue;
        }
        if (entity.sessionstate == "dead") {
            continue;
        }
        currentactivecount++;
    }
    return currentactivecount;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xc632e0b7, Offset: 0x830
// Size: 0xee
function function_fbe3dcbb() {
    entities = bot::get_bots();
    a_bots = [];
    foreach (entity in entities) {
        if (!isdefined(entity.bot)) {
            continue;
        }
        if (entity.sessionstate == "spectator") {
            continue;
        }
        if (entity.sessionstate == "dead") {
            continue;
        }
        a_bots[a_bots.size] = entity;
    }
    return a_bots;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xcb4bf0ac, Offset: 0x928
// Size: 0xee
function function_dde6edbd() {
    entities = bot::get_enemy_bots();
    a_bots = [];
    foreach (entity in entities) {
        if (!isdefined(entity.bot)) {
            continue;
        }
        if (entity.sessionstate == "spectator") {
            continue;
        }
        if (entity.sessionstate == "dead") {
            continue;
        }
        a_bots[a_bots.size] = entity;
    }
    return a_bots;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x3206724, Offset: 0xa20
// Size: 0x4a
function function_46ea4a64() {
    return isdefined(self.bot) && isdefined(self.sessionstate) && self.sessionstate != "spectator" && self.sessionstate != "dead";
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xdcedab33, Offset: 0xa78
// Size: 0xee
function function_71ec2b36() {
    entities = bot::get_friendly_bots();
    a_bots = [];
    foreach (entity in entities) {
        if (!isdefined(entity.bot)) {
            continue;
        }
        if (entity.sessionstate == "spectator") {
            continue;
        }
        if (entity.sessionstate == "dead") {
            continue;
        }
        a_bots[a_bots.size] = entity;
    }
    return a_bots;
}

// Namespace ct_bots/ct_bots
// Params 4, eflags: 0x0
// Checksum 0xa5f3806b, Offset: 0xb70
// Size: 0x84
function function_aa870283(n_delay, var_4406a529 = 0, var_8c5f03d7 = 1, var_dd200d99 = 1) {
    if (n_delay) {
        wait(n_delay);
    } else {
        waitframe(1);
    }
    function_26d45f32(var_4406a529, var_8c5f03d7, var_dd200d99);
}

// Namespace ct_bots/ct_bots
// Params 3, eflags: 0x0
// Checksum 0xb311c8f4, Offset: 0xc00
// Size: 0x240
function function_26d45f32(var_4406a529 = 0, var_8c5f03d7 = 1, var_dd200d99 = 1) {
    if (!var_4406a529) {
        weapons = self getweaponslist();
    } else {
        weapons = self getweaponslistprimaries();
    }
    var_46ccfe18 = ct_utils::function_84adcd1f();
    arrayremovevalue(weapons, var_46ccfe18);
    if (var_8c5f03d7) {
        level.b_bare_hands = 1;
        if (!self hasweapon(var_46ccfe18)) {
            self giveweapon(var_46ccfe18);
            while (!self hasweapon(var_46ccfe18)) {
                waitframe(1);
            }
            wait(0.1);
        }
        self switchtoweapon(var_46ccfe18);
        do {
            wpn_current = self getcurrentweapon();
            waitframe(1);
        } while (isdefined(self) && wpn_current != var_46ccfe18);
    }
    if (weapons.size > 0 && isdefined(self)) {
        if (var_dd200d99) {
            self.var_de9764de = weapons;
        }
        foreach (weapon in weapons) {
            if (!var_8c5f03d7 || weapon != var_46ccfe18) {
                self takeweapon(weapon);
            }
        }
    }
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0xe2304c96, Offset: 0xe48
// Size: 0x4c
function function_52dff030(w_gadget) {
    player = self;
    player giveweapon(w_gadget);
    player givemaxammo(w_gadget);
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x159bc3fa, Offset: 0xea0
// Size: 0x10e
function function_fd2d220e(var_742b083e = undefined) {
    if (!isdefined(self.var_560765bb)) {
        setdvar(#"hash_48162cd174e3034d", 0);
        return;
    }
    if (isdefined(var_742b083e)) {
        wait(var_742b083e);
    }
    if (isdefined(self.var_de9764de)) {
        foreach (weapon in self.var_de9764de) {
            self giveweapon(weapon);
        }
        self takeweapon(ct_utils::function_84adcd1f());
        self.var_de9764de = undefined;
    }
}

// Namespace ct_bots/ct_bots
// Params 2, eflags: 0x0
// Checksum 0xce350f6f, Offset: 0xfb8
// Size: 0xb4
function function_35e77034(weapon, var_dd200d99) {
    self function_26d45f32(0, 1, var_dd200d99);
    if (!isdefined(weapon) || weapon == level.weaponnone) {
        return;
    }
    self giveweapon(weapon);
    self givemaxammo(weapon);
    self switchtoweaponimmediate(weapon);
    self setspawnweapon(weapon);
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x4e2c7820, Offset: 0x1078
// Size: 0x7c
function function_e31c5d7a() {
    self endon(#"death");
    if (isdefined(level.var_d6d98fbe) && level.var_d6d98fbe) {
        if (self.team == #"axis") {
            self thread ct_utils::function_8963dae3();
        }
    }
    self thread function_7d86a450();
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xc6bc3be3, Offset: 0x1100
// Size: 0xba
function function_7d86a450() {
    self endon(#"disconnect", #"death");
    for (;;) {
        wait(1);
        primary_weapons = self getweaponslistprimaries();
        for (i = 0; i < primary_weapons.size; i++) {
            weapon = primary_weapons[i];
            if (weapon == level.weaponnone) {
                continue;
            }
            self givemaxammo(weapon);
        }
    }
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0xff071362, Offset: 0x11c8
// Size: 0xd02
function debug_bots(var_841324bd) {
    /#
        if (!(isdefined(level.debugbots) && level.debugbots)) {
            return;
        }
        level.debug_xpos = 20;
        level.debug_ypos = 250;
        level.debug_yinc = 18;
        level.debug_fontscale = 1.5;
        level.white = (1, 1, 1);
        level.green = (0, 1, 0);
        level.yellow = (1, 1, 0);
        level.red = (1, 0, 0);
        ypos = level.debug_ypos;
        level.var_20ec3e3a = newdebughudelem();
        level.var_20ec3e3a.alignx = "<unknown string>";
        level.var_20ec3e3a.fontscale = level.debug_fontscale;
        level.var_20ec3e3a.x = level.debug_xpos;
        level.var_20ec3e3a.y = ypos;
        level.var_20ec3e3a.color = level.white;
        level.var_20ec3e3a settext("<unknown string>");
        level.var_6414a791 = newdebughudelem();
        level.var_6414a791.alignx = "<unknown string>";
        level.var_6414a791.fontscale = level.debug_fontscale;
        level.var_6414a791.x = level.debug_xpos;
        level.var_6414a791.y = ypos;
        level.var_6414a791.color = level.red;
        level.var_6414a791 setvalue(var_841324bd);
        ypos += level.debug_yinc;
        level.var_ef165a8f = newdebughudelem();
        level.var_ef165a8f.alignx = "<unknown string>";
        level.var_ef165a8f.fontscale = level.debug_fontscale;
        level.var_ef165a8f.x = level.debug_xpos;
        level.var_ef165a8f.y = ypos;
        level.var_ef165a8f.color = level.white;
        level.var_ef165a8f settext("<unknown string>");
        level.var_82bc4b98 = newdebughudelem();
        level.var_82bc4b98.alignx = "<unknown string>";
        level.var_82bc4b98.fontscale = level.debug_fontscale;
        level.var_82bc4b98.x = level.debug_xpos;
        level.var_82bc4b98.y = ypos;
        level.var_82bc4b98.color = level.red;
        level.var_82bc4b98 setvalue(0);
        ypos += level.debug_yinc;
        level.var_c55c071b = newdebughudelem();
        level.var_c55c071b.alignx = "<unknown string>";
        level.var_c55c071b.fontscale = level.debug_fontscale;
        level.var_c55c071b.x = level.debug_xpos;
        level.var_c55c071b.y = ypos;
        level.var_c55c071b.color = level.white;
        level.var_c55c071b settext("<unknown string>");
        level.var_1eafa2a3 = newdebughudelem();
        level.var_1eafa2a3.alignx = "<unknown string>";
        level.var_1eafa2a3.fontscale = level.debug_fontscale;
        level.var_1eafa2a3.x = level.debug_xpos;
        level.var_1eafa2a3.y = ypos;
        level.var_1eafa2a3.color = level.red;
        level.var_1eafa2a3 setvalue(0);
        level.var_105dad71 = 0;
        level.var_486b7db0 = [];
        level.var_486b7db0[0] = "<unknown string>";
        level.var_486b7db0[1] = "<unknown string>";
        level.var_486b7db0[2] = "<unknown string>";
        level.var_486b7db0[3] = "<unknown string>";
        level.var_486b7db0[4] = "<unknown string>";
        level.var_486b7db0[5] = "<unknown string>";
        level.var_486b7db0[6] = "<unknown string>";
        level.var_f4f73ef7 = [];
        level.var_f4f73ef7[0] = "<unknown string>";
        level.var_f4f73ef7[1] = "<unknown string>";
        level.var_f4f73ef7[2] = "<unknown string>";
        level.var_f4f73ef7[3] = "<unknown string>";
        while (!level.gameended) {
            level.var_82bc4b98 setvalue(level.var_105dad71);
            level.var_1eafa2a3 setvalue(function_2a8fc6b2());
            entities = bot::get_bots();
            foreach (entity in entities) {
                if (!isdefined(entity.bot) || !isalive(entity)) {
                    continue;
                }
                org = entity.origin + (0, 0, 100);
                print3d(org, "<unknown string>", (1, 0.5, 0), 1, 1);
                if (isdefined(entity.var_10a6d7df)) {
                    org = entity.origin + (0, 0, 85);
                    print3d(org, level.var_486b7db0[entity.var_10a6d7df], (1, 0.5, 0), 1, 1);
                }
                if (isdefined(entity.var_3c5a5d29)) {
                    org = entity.origin + (0, 0, 70);
                    print3d(org, level.var_f4f73ef7[entity.var_3c5a5d29], (0, 1, 0), 1, 0.75);
                }
                ai_cansee = 0;
                if (isdefined(entity.enemy) && entity cansee(entity.enemy)) {
                    ai_cansee = 1;
                }
                if (isdefined(entity.canseeplayer)) {
                    org = entity.origin + (0, 0, 60);
                    print3d(org, "<unknown string>" + entity.canseeplayer + "<unknown string>" + ai_cansee + "<unknown string>", (1, 0.5, 0), 1, 0.75);
                }
            }
            axis = getaiteamarray(#"axis");
            foreach (entity in axis) {
                if (!isalive(entity)) {
                    continue;
                }
                org = entity.origin + (0, 0, 100);
                print3d(org, "<unknown string>", (1, 0.5, 0), 1, 1);
                if (isdefined(entity.var_10a6d7df)) {
                    org = entity.origin + (0, 0, 85);
                    print3d(org, level.var_486b7db0[entity.var_10a6d7df], (1, 0.5, 0), 1, 1);
                }
                ai_cansee = 0;
                if (isdefined(entity.enemy) && entity cansee(entity.enemy)) {
                    ai_cansee = 1;
                }
                if (isdefined(entity.canseeplayer)) {
                    org = entity.origin + (0, 0, 70);
                    print3d(org, "<unknown string>" + entity.canseeplayer + "<unknown string>" + ai_cansee + "<unknown string>", (1, 0.5, 0), 1, 1);
                }
                if (isdefined(entity.var_9a79d89d)) {
                    print3d(entity.var_9a79d89d + (0, 0, 10), "<unknown string>", (0, 0, 1), 1, 1);
                }
            }
            if (isdefined(level.var_5ec2d86e)) {
                foreach (nd in level.var_5ec2d86e) {
                    if (!isdefined(nd.e_occupant)) {
                        print3d(nd.origin + (0, 0, 10), "<unknown string>", (1, 0, 0), 1, 1);
                        continue;
                    }
                    print3d(nd.origin + (0, 0, 10), "<unknown string>", (0, 0, 1), 1, 1);
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace ct_bots/ct_bots
// Params 2, eflags: 0x0
// Checksum 0x2f87e7cb, Offset: 0x1ed8
// Size: 0x352
function function_3895c193(team = "axis", str_targetname) {
    self.team = team;
    self.pers[#"team"] = team;
    self.sessionteam = team;
    self.disablespawning = 0;
    self.isinuse = 1;
    self.bot.var_b2b8f0b6 = level.var_b0436df5;
    self.bot.var_e8c941d6 = level.var_30675389;
    self.targetname = str_targetname;
    self setmovespeedscale(1);
    if (isarray(self.values)) {
        if (isarray(self.values[#"ignoreall"])) {
            while (isdefined(self.values[#"ignoreall"]) && self.values[#"ignoreall"].size > 0) {
                for (i = 0; i < self.values[#"ignoreall"].size; i++) {
                    v = self.values[#"ignoreall"][i];
                    self val::reset(v.str_id, "ignoreall");
                    break;
                }
            }
        }
    }
    if (isarray(self.values)) {
        if (isarray(self.values[#"ignoreme"])) {
            while (isdefined(self.values[#"ignoreme"]) && self.values[#"ignoreme"].size > 0) {
                for (i = 0; i < self.values[#"ignoreme"].size; i++) {
                    v = self.values[#"ignoreme"][i];
                    self val::reset(v.str_id, "ignoreme");
                    break;
                }
            }
        }
    }
    self callback::on_death(&on_death);
    if (isdefined(level.prespawnplayer)) {
        self [[ level.prespawnplayer ]]();
    }
    self [[ level.spawnplayer ]]();
    self.var_911100f4 = 1;
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0xee10988b, Offset: 0x2238
// Size: 0x34
function on_death(params) {
    self.isinuse = 0;
    callback::remove_on_death(&on_death);
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xe2c7f572, Offset: 0x2278
// Size: 0x54
function disablebot() {
    self.disablespawning = 1;
    self.isinuse = 0;
    self dodamage(self.health + 1000, self.origin, undefined, undefined, undefined, "MOD_META");
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xaa2a4dbc, Offset: 0x22d8
// Size: 0x12c
function function_66ced330() {
    entities = bot::get_bots();
    bots = [];
    foreach (entity in entities) {
        if (!isdefined(entity.bot)) {
            continue;
        }
        if (isdefined(entity.isinuse) && entity.isinuse) {
            continue;
        }
        for (i = 0; i < bots.size; i++) {
            if (entity.deathtime <= bots[i].deathtime) {
                break;
            }
        }
        arrayinsert(bots, entity, i);
    }
    return bots;
}

// Namespace ct_bots/ct_bots
// Params 4, eflags: 0x0
// Checksum 0x5576314c, Offset: 0x2410
// Size: 0x180
function activate_bot(str_team, str_targetname, var_216e25ba = 0, var_29b433bd) {
    entities = function_66ced330();
    var_e8d6f89 = 0;
    foreach (entity in entities) {
        if (!(isdefined(var_216e25ba) && var_216e25ba) || !entity util::is_female()) {
            if (isdefined(var_29b433bd)) {
                entity player_role::set(var_29b433bd);
                entity.var_d6c52b74 = 1;
                entity callback::on_death(&function_c03a6bb8);
            }
            entity function_3895c193(str_team, str_targetname);
            entity.dontdropweapon = 1;
            break;
        }
    }
    level notify(#"hash_5de15de451493f4a");
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x32077f3f, Offset: 0x2598
// Size: 0x34
function function_c03a6bb8(params) {
    self.var_d6c52b74 = undefined;
    self callback::remove_on_death(&function_c03a6bb8);
}

// Namespace ct_bots/ct_bots
// Params 4, eflags: 0x0
// Checksum 0xe10dd1e5, Offset: 0x25d8
// Size: 0x160
function activate_bots(var_9bff2467, str_team, str_targetname, var_216e25ba = 0) {
    level endon(#"combattraining_logic_finished");
    entities = function_66ced330();
    var_e8d6f89 = 0;
    foreach (entity in entities) {
        if (isdefined(entity)) {
            if (!(isdefined(var_216e25ba) && var_216e25ba) || !entity util::is_female()) {
                entity function_3895c193(str_team, str_targetname);
                entity.dontdropweapon = 1;
                var_e8d6f89++;
                if (var_e8d6f89 >= var_9bff2467) {
                    break;
                }
                waitframe(1);
            }
        }
    }
    level notify(#"hash_5de15de451493f4a");
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xa6535fa3, Offset: 0x2740
// Size: 0xae
function deactivate_bots() {
    entities = bot::get_bots();
    foreach (entity in entities) {
        if (isdefined(entity) && isdefined(entity.bot)) {
            entity disablebot();
            waitframe(1);
        }
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xb259debc, Offset: 0x27f8
// Size: 0x18e
function on_bot_spawned() {
    if (!isbot(self) || isdefined(self.var_27284f5a) && self.var_27284f5a) {
        return;
    }
    self.var_10a6d7df = 0;
    self.var_3c5a5d29 = 0;
    self.navmeshpoint = undefined;
    self.var_86ba7e6d = 0;
    self ai::set_behavior_attribute("control", "autonomous");
    self thread function_956b904a();
    if (!(isdefined(self.var_d6c52b74) && self.var_d6c52b74)) {
        if (randomfloatrange(0, 1) < (isdefined(level.fx_warlord_igc_) ? level.fx_warlord_igc_ : level.var_abdff161)) {
            self thread function_35e77034(getweapon(#"pistol_standard_t8", 1));
        } else {
            self thread function_35e77034(getweapon(#"ar_accurate_t8", 1));
        }
    }
    self.canseeplayer = undefined;
    self.var_ea34ab74 = undefined;
    self.var_f38f922 = undefined;
}

// Namespace ct_bots/ct_bots
// Params 2, eflags: 0x0
// Checksum 0x71cf0178, Offset: 0x2990
// Size: 0x148
function function_82675316(vdir, limit) {
    if (isplayer(self)) {
        orientation = self getplayerangles();
    } else {
        orientation = self getangles();
    }
    forwardvec = anglestoforward(orientation);
    forwardvec2d = (forwardvec[0], forwardvec[1], 0);
    unitforwardvec2d = vectornormalize(forwardvec2d);
    tofaceevec = vdir * -1;
    tofaceevec2d = (tofaceevec[0], tofaceevec[1], 0);
    unittofaceevec2d = vectornormalize(tofaceevec2d);
    dotproduct = vectordot(unitforwardvec2d, unittofaceevec2d);
    return dotproduct > limit;
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x9bb8915a, Offset: 0x2ae0
// Size: 0x15a
function function_fe3c676a(enemy) {
    if (isdefined(self.canseeplayer) && gettime() < self.var_ea34ab74) {
        return self.canseeplayer;
    }
    if (!self function_82675316(anglestoforward(enemy.angles), 0.2)) {
        self.canseeplayer = 0;
        self.var_ea34ab74 = gettime() + 500;
    } else {
        targetpoint = isdefined(enemy.var_88f8feeb) ? enemy.var_88f8feeb : enemy getcentroid();
        if (bullettracepassed(self geteye(), targetpoint, 0, enemy)) {
            self clearentitytarget();
            self.canseeplayer = 1;
            self.var_ea34ab74 = gettime() + 2000;
        } else {
            self.canseeplayer = 0;
            self.var_ea34ab74 = gettime() + 500;
        }
    }
    return self.canseeplayer;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x93cea409, Offset: 0x2c48
// Size: 0x254
function function_956b904a() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
    if (!isdefined(self.var_ef59b90)) {
        self.var_ef59b90 = 1;
    }
    while (true) {
        if (isdefined(self.var_ef59b90) && self.var_10a6d7df != self.var_ef59b90) {
            self function_cc9c6a13(self.var_10a6d7df);
            self.var_10a6d7df = self.var_ef59b90;
            self function_b8eff92a(self.var_10a6d7df);
            self notify(#"reset_pathing");
            self.navmeshpoint = undefined;
            self.var_86ba7e6d = 0;
            self.var_ef59b90 = undefined;
        }
        switch (self.var_10a6d7df) {
        case 4:
            self thread function_3abfdc6b();
            break;
        case 2:
            self thread function_eca43db6();
            break;
        case 1:
            self thread function_4b111722();
            break;
        case 3:
            self thread bot_chase_state();
            break;
        case 5:
            self thread function_9125af5f();
            break;
        case 6:
            break;
        case 0:
        default:
            break;
        }
        if (isdefined(level.var_415a467a) && level.var_415a467a) {
            self.var_ef59b90 = level.var_415a467a;
        }
        waitframe(1);
    }
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x844c7d0c, Offset: 0x2ea8
// Size: 0xda
function function_cc9c6a13(current_state) {
    switch (current_state) {
    case 2:
        self.var_2925fedc = undefined;
        break;
    case 1:
        self.var_153a632a = undefined;
        break;
    case 3:
        self.var_f38f922 = undefined;
        self.var_e4cd1c19 = undefined;
        break;
    case 5:
        break;
    case 6:
        self thread function_fad5456d();
        break;
    case 0:
    default:
        break;
    }
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x73d19f60, Offset: 0x2f90
// Size: 0x1fa
function function_b8eff92a(var_edab5327) {
    if (isai(self)) {
        self.ignoreall = 0;
    }
    switch (var_edab5327) {
    case 2:
        self.var_2925fedc = undefined;
        if (isai(self)) {
            self.ignoreall = 1;
        }
        break;
    case 4:
        if (isai(self)) {
            self.ignoreall = 1;
        }
        self.var_8549731d = gettime();
        self.var_c6e7438 = randomfloatrange(self.var_59860ee1, self.var_dd940df3);
        break;
    case 1:
        if (isai(self)) {
            self.ignoreall = 1;
        }
        self.var_153a632a = gettime();
        self.var_c6e7438 = randomfloatrange(10000, 15000);
        break;
    case 3:
        self.var_f38f922 = gettime();
        self.var_e4cd1c19 = undefined;
        break;
    case 6:
        break;
    case 5:
        self dodamage(self.health + 100, (0, 0, 0));
        self.var_3c5a5d29 = 1;
        break;
    case 0:
    default:
        break;
    }
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0x538537e1, Offset: 0x3198
// Size: 0x92
function checkfortimeout(waittime) {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"reset_pathing");
    if (isdefined(waittime)) {
        wait(waittime);
    }
    self.navmeshpoint = undefined;
    self.var_86ba7e6d = 0;
    self.var_ef59b90 = self.prevstate;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xb2d62062, Offset: 0x3238
// Size: 0xda
function registerspecialty_earnmoremomentumspawnstart() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"bot_goal_reached", #"reset_pathing");
    if (isdefined(self.var_fc5b0b7f)) {
        wait(self.var_fc5b0b7f);
    } else {
        wait(randomfloatrange(0.01, 0.5));
    }
    self notify(#"hash_1213d70444c626d4", "stop_wander");
    self.navmeshpoint = undefined;
    self.var_86ba7e6d = 0;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x3b1ae3ec, Offset: 0x3320
// Size: 0xc6
function function_eff20434() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"hash_1213d70444c626d4", #"reset_pathing");
    self thread registerspecialty_earnmoremomentumspawnstart();
    self waittill(#"bot_goal_reached", #"stop_wander", #"stop_chase");
    self.navmeshpoint = undefined;
    self.var_86ba7e6d = 0;
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xd2afa105, Offset: 0x33f0
// Size: 0xf4
function function_6390598e() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"hash_1213d70444c626d4", #"reset_pathing");
    self waittill(#"bot_goal_reached", #"stop_wander", #"stop_chase");
    self val::set(#"revived_bot", "ignoreme", 1);
    self val::set(#"revived_bot", "ignoreall", 1);
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x1c23c39f, Offset: 0x34f0
// Size: 0x132
function function_f83f2862() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"hash_1213d70444c626d4", #"reset_pathing");
    self waittill(#"hash_69dbfbd660f8c53e");
    if (!(isdefined(self.var_9f73d035) && self.var_9f73d035)) {
        e_player = getplayers()[0];
        e_player thread ct_utils::function_d471f8fa(5, undefined, 1);
        self.var_9f73d035 = 1;
    }
    self thread function_35e77034(getweapon(#"pistol_standard"), 1);
    self.var_3c5a5d29 = 3;
}

// Namespace ct_bots/ct_bots
// Params 1, eflags: 0x0
// Checksum 0xbd40d7, Offset: 0x3630
// Size: 0xd6
function function_6c89913a(var_daa4b90a = 1) {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"reset_pathing");
    self.var_2925fedc = self.origin + (10, 0, 0);
    wait(var_daa4b90a);
    self.var_2925fedc = self.origin + (-10, 0, 0);
    wait(var_daa4b90a);
    self.var_2925fedc = self.origin + (0, 0, 10);
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xc9caf72b, Offset: 0x3710
// Size: 0x26
function function_fad5456d() {
    self notify(#"hash_5613bfe5339362f3");
    self notify(#"hash_658257c9e391c92c");
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x9519b9b8, Offset: 0x3740
// Size: 0x18e
function function_eca43db6() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"stop_lookaround", #"reset_pathing", #"hash_658257c9e391c92c");
    self notify(#"hash_12a5c1fba387d037");
    if (!isdefined(self.navmeshpoint)) {
        self.navmeshpoint = self.origin;
        self setgoal(self.navmeshpoint, 1);
        self thread checkfortimeout(self.var_daa4b90a);
        self thread function_6c89913a(self.var_daa4b90a);
    }
    enemy = self get_enemy();
    self.canseeplayer = self function_fe3c676a(enemy);
    if (self.canseeplayer && !(isdefined(self.var_4c7240f1) && self.var_4c7240f1)) {
        self.prevstate = 2;
        self.var_ef59b90 = 3;
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x58a2dcce, Offset: 0x38d8
// Size: 0x60
function get_enemy() {
    if (isalive(self.enemy_override)) {
        return self.enemy_override;
    }
    a_players = util::get_players(#"allies");
    return a_players[0];
}

// Namespace ct_bots/ct_bots
// Params 2, eflags: 0x0
// Checksum 0x363b1bf4, Offset: 0x3940
// Size: 0x8c
function function_911f9e8f(var_dfb36d05, n_threat = 0.5) {
    if (isalive(var_dfb36d05)) {
        self.enemy_override = var_dfb36d05;
        if (!issentient(var_dfb36d05)) {
            var_dfb36d05 makesentient();
        }
        self setentitytarget(var_dfb36d05, n_threat);
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xbdadd482, Offset: 0x39d8
// Size: 0x2b6
function function_3abfdc6b() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"stop_lookaround", #"reset_pathing", #"hash_658257c9e391c92c");
    self notify(#"hash_42a76c06b057248e");
    if (!isdefined(self.navmeshpoint) && isdefined(self.var_9a79d89d)) {
        self.navmeshpoint = self.var_9a79d89d;
        if (isdefined(self.navmeshpoint)) {
            cylinder = ai::t_cylinder(self.navmeshpoint, self.var_bab91f2, 100);
            points = tacticalquery(#"stratcom_tacquery_position", cylinder);
            if (points.size > 0) {
                if (points.size > 1) {
                    self.navmeshpoint = points[randomintrange(0, points.size - 1)].origin;
                } else {
                    self.navmeshpoint = points[0].origin;
                }
            }
            self setgoal(self.navmeshpoint, 1);
            self thread function_eff20434();
        }
    }
    n_time = gettime();
    if (n_time > self.var_8549731d + self.var_c6e7438) {
        if (isdefined(self.var_1574ae06) && self.var_1574ae06) {
            self.var_8549731d = n_time;
        } else {
            self.prevstate = 4;
            self.var_ef59b90 = 2;
        }
    }
    enemy = self get_enemy();
    self.canseeplayer = self function_fe3c676a(enemy);
    if (self.canseeplayer && !(isdefined(self.var_4c7240f1) && self.var_4c7240f1)) {
        self.prevstate = 4;
        self.var_ef59b90 = 3;
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xfe03145b, Offset: 0x3c98
// Size: 0x2ce
function function_4b111722() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"stop_wander", #"reset_pathing", #"hash_658257c9e391c92c");
    self notify(#"hash_37ed6c252b08c1a4");
    if (!isdefined(self.navmeshpoint)) {
        searchradius = 1024;
        if (isdefined(self.var_9a79d89d)) {
            if (isdefined(self.var_bab91f2)) {
                searchradius = self.var_bab91f2;
            }
            self.navmeshpoint = getclosestpointonnavmesh(self.var_9a79d89d, searchradius);
        } else {
            self.navmeshpoint = getclosestpointonnavmesh(self.origin, 200);
        }
        if (isdefined(self.navmeshpoint)) {
            forward = anglestoforward(self getangles());
            forwardpos = self.origin + forward * searchradius;
            cylinder = ai::t_cylinder(self.origin, searchradius, searchradius);
            points = tacticalquery(#"stratcom_tacquery_wander", self.navmeshpoint, cylinder, forwardpos, self);
            if (points.size > 0) {
                self.navmeshpoint = points[0].origin;
            }
            self setgoal(self.navmeshpoint, 1);
            self thread function_eff20434();
        }
    }
    if (gettime() > self.var_153a632a + self.var_c6e7438) {
        self.prevstate = 1;
        self.var_ef59b90 = 2;
    }
    enemy = self get_enemy();
    self.canseeplayer = self function_fe3c676a(enemy);
    if (self.canseeplayer) {
        self.prevstate = 1;
        self.var_ef59b90 = 3;
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0xb2c29dcf, Offset: 0x3f70
// Size: 0x33a
function bot_chase_state() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"stop_chase", #"reset_pathing", #"hash_658257c9e391c92c");
    self notify(#"bot_chase_state");
    a_players = util::get_players(#"allies");
    e_enemy = self get_enemy();
    distancesq = distancesquared(self.origin, e_enemy.origin);
    var_398bc5bf = 0;
    if (distancesq < 22500) {
        var_398bc5bf = 1;
    }
    if (!(isdefined(self.var_86ba7e6d) && self.var_86ba7e6d) || var_398bc5bf) {
        if (var_398bc5bf) {
            self.navmeshpoint = self.origin;
        } else if (ispointonnavmesh(e_enemy.origin, self)) {
            self.navmeshpoint = e_enemy.origin;
        } else {
            self.navmeshpoint = getclosestpointonnavmesh(e_enemy.origin, 512, 30);
        }
        if (isdefined(self.navmeshpoint)) {
            self setgoal(self.navmeshpoint, 1);
            self.var_86ba7e6d = 1;
            self thread function_eff20434();
        }
    }
    if (!(isdefined(self.var_38b6161f) && self.var_38b6161f)) {
        enemy = self get_enemy();
        self.canseeplayer = self function_fe3c676a(enemy);
        self.var_2925fedc = enemy.origin;
        if (!self.canseeplayer) {
            if (!isdefined(self.var_e4cd1c19)) {
                self.var_e4cd1c19 = gettime();
            }
        } else {
            self.var_e4cd1c19 = undefined;
        }
        if (isdefined(self.var_e4cd1c19) && gettime() > self.var_e4cd1c19 + 3000) {
            if (isdefined(self.prevstate)) {
                self.var_ef59b90 = self.prevstate;
            }
            if (self.var_ef59b90 === 2) {
                if (isdefined(self.var_9a79d89d)) {
                    self.var_ef59b90 = 4;
                    return;
                }
                self.var_ef59b90 = 1;
            }
        }
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x758d32df, Offset: 0x42b8
// Size: 0x5b2
function function_9125af5f() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"stop_lookaround", #"reset_pathing", #"hash_658257c9e391c92c");
    switch (self.var_3c5a5d29) {
    case 1:
        if (!isdefined(self.navmeshpoint) && isdefined(self.var_9a79d89d)) {
            self.navmeshpoint = self.var_9a79d89d;
            self setgoal(self.navmeshpoint, 1);
            self thread function_eff20434();
        }
        break;
    case 2:
        self.resurrect_not_allowed_by = 1;
        level.var_986d14aa = undefined;
        level notify(#"friendly_revived");
        friendlies = getplayers(self.team);
        foreach (player in friendlies) {
            pods = level.var_934fb97.var_27fce4c0[player.clientid];
            if (isdefined(pods)) {
                foreach (pod in pods) {
                    var_321183ba = pod getteam();
                    if (var_321183ba == self.team && isdefined(pod.gameobject)) {
                        n_dist = distance(pod.origin, self.origin);
                        if (n_dist <= 700) {
                            level.var_986d14aa = pod.gameobject;
                            pod.gameobject.trigger setvisibletoplayer(self);
                        }
                    }
                }
            }
        }
        if (!isdefined(self.navmeshpoint) && isdefined(level.var_986d14aa)) {
            self thread function_ae20926a();
            self.navmeshpoint = level.var_986d14aa.origin;
            self setgoal(self.navmeshpoint, 1);
            self thread function_eff20434();
            self bot::set_interact(level.var_986d14aa);
            self thread function_f83f2862();
        } else if (!(isdefined(self.var_9f73d035) && self.var_9f73d035)) {
            if (!isdefined(self.var_8618a8fc)) {
                self.var_8618a8fc = -25;
            }
            n_time = gettime() / 1000;
            dt = n_time - self.var_8618a8fc;
            if (dt >= 25) {
                e_player = getplayers()[0];
                n_dist = distance(e_player.origin, self.origin);
                if (n_dist < 1000) {
                    e_player thread ct_utils::function_329f9ba6(#"hash_2d1a463cfe8da8e2", 4, "green", 1);
                    self.var_8618a8fc = n_time;
                }
            }
        }
        break;
    case 3:
        if (!isdefined(self.navmeshpoint)) {
            self notify(#"hash_5c9e0bd318ff091e");
            self.navmeshpoint = level.var_caeb46b7.origin;
            if (!(isdefined(self.var_224386e9) && self.var_224386e9)) {
                self setgoal(self.navmeshpoint, 1);
            }
            self thread function_eff20434();
            self thread function_6390598e();
        }
        break;
    case 0:
    default:
        break;
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x20ca82f8, Offset: 0x4878
// Size: 0x380
function function_ae20926a() {
    self endon(#"death");
    if (isdefined(self.var_2a7a9ac7) && self.var_2a7a9ac7) {
        return;
    }
    self.var_2a7a9ac7 = 1;
    e_player = getplayers()[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_28f3ed7e8d30dfff", 5, "green", 2);
    self.health = 650;
    self thread function_b7307ff();
    level notify(#"hash_4974b99613386da1");
    level.var_88024dd9++;
    self clientfield::set("player_keyline_render", 1);
    self waittill(#"hash_5c9e0bd318ff091e");
    while (true) {
        e_player = getplayers()[0];
        n_dist = distance(e_player.origin, self.origin);
        if (n_dist > 900) {
            self.var_224386e9 = 1;
            self setgoal(self.origin, 1);
            while (n_dist > 800) {
                n_time = gettime() / 1000;
                if (!isdefined(self.var_5fc84f68) || n_time - self.var_5fc84f68 > 15) {
                    level thread function_4afb85fd();
                    self.var_5fc84f68 = n_time;
                }
                e_player = getplayers()[0];
                n_dist = distance(e_player.origin, self.origin);
                waitframe(1);
            }
            self.var_224386e9 = 0;
            self setgoal(self.navmeshpoint, 1);
        }
        n_dist = distance(self.navmeshpoint, self.origin);
        if (n_dist < 250) {
            break;
        }
        waitframe(1);
    }
    self clientfield::set("player_keyline_render", 0);
    self.v_train_inbound_igc = 1;
    level.var_88024dd9--;
    level thread ct_utils::function_bfa522d1(0);
    e_player = getplayers()[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_30cf2650faf0b7fb", 4, "green", 2);
    e_player thread ct_utils::function_d471f8fa(30, undefined, 1);
    level notify(#"hash_4467c8999d018835");
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x7065a859, Offset: 0x4c00
// Size: 0x74
function function_4afb85fd() {
    e_player = getplayers(#"allies")[0];
    e_player endon(#"death");
    e_player ct_utils::function_329f9ba6(#"hash_5a1802aa5de6267f", 5, "green", 2);
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x6a812421, Offset: 0x4c80
// Size: 0xbc
function function_b7307ff() {
    self waittill(#"death");
    level.var_88024dd9--;
    level thread ct_utils::function_bfa522d1(0);
    e_player = getplayers()[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_9d6017f6c7829ad", 4, "red", 2);
    e_player thread ct_utils::function_d471f8fa(-30, undefined, 1);
}

// Namespace ct_bots/ct_bots
// Params 2, eflags: 0x0
// Checksum 0x3bca23c6, Offset: 0x4d48
// Size: 0x1e6
function function_a64b7003(var_bf0bb02d = 0, var_61e27031) {
    level.var_5ec2d86e = getnodearray("node_guard", "targetname");
    if (level.var_5ec2d86e.size == 0) {
        return;
    }
    foreach (nd_guard in level.var_5ec2d86e) {
        nd_guard.e_occupant = undefined;
    }
    if (var_bf0bb02d) {
        var_d27f913e = array::filter(level.var_5ec2d86e, 0, &ct_utils::function_e928f210);
        if (var_d27f913e.size > 0) {
            level.var_5ec2d86e = var_d27f913e;
        }
    }
    if (isdefined(level.var_5ec2d86e[0].script_int)) {
        level.var_5ec2d86e = array::sort_by_script_int(level.var_5ec2d86e, 1);
    }
    if (!isdefined(level.prespawnplayer)) {
        level.prespawnplayer = &function_c2cfffdd;
        player::function_cf3aa03d(&function_82569431);
    }
    if (isdefined(var_61e27031) && var_61e27031 <= 17) {
        level.var_4940e931 = var_61e27031;
        return;
    }
    level.var_4940e931 = 17;
}

// Namespace ct_bots/ct_bots
// Params 3, eflags: 0x0
// Checksum 0xd65df8ff, Offset: 0x4f38
// Size: 0x262
function function_c2cfffdd(nd_guard, var_2fd67dea = 0, var_1d1ab17 = 0) {
    if (level flag::get("combat_training_started") && isbot(self) && !isdefined(self.nd_guard) && (var_2fd67dea || level.var_4940e931 > 0)) {
        if (!var_2fd67dea) {
            level.var_4940e931--;
        }
        if (!isdefined(nd_guard)) {
            nd_guard = function_c9c5ed36();
        }
        assert(isdefined(nd_guard), "<unknown string>");
        nd_guard.e_occupant = self;
        self.nd_guard = nd_guard;
        self.var_9a79d89d = nd_guard.origin;
        self.var_5ab7c19c = nd_guard.angles;
        if (!var_1d1ab17) {
            self setorigin(nd_guard.origin);
            self setplayerangles(nd_guard.angles);
        }
        if (isdefined(nd_guard.radius) && nd_guard.radius > 0) {
            self.var_bab91f2 = nd_guard.radius;
        } else {
            self.var_bab91f2 = 640;
        }
        if (isdefined(nd_guard.var_cb374b88)) {
            self.var_59860ee1 = nd_guard.var_cb374b88;
        } else {
            self.var_59860ee1 = 8000;
        }
        if (isdefined(nd_guard.var_2623f860)) {
            self.var_dd940df3 = nd_guard.var_2623f860;
        } else {
            self.var_dd940df3 = 12000;
        }
        if (isdefined(nd_guard.var_31305b37)) {
            self.var_daa4b90a = nd_guard.var_31305b37;
        } else {
            self.var_daa4b90a = 2;
        }
        self.var_ef59b90 = 4;
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x5204bcf6, Offset: 0x51a8
// Size: 0x4e
function function_623c7cae() {
    if (isdefined(self.nd_guard)) {
        self.nd_guard.e_occupant = undefined;
        self.nd_guard = undefined;
        self.var_bab91f2 = undefined;
        self.var_daa4b90a = undefined;
        self.navmeshpoint = undefined;
        self.var_9a79d89d = undefined;
        self.var_5ab7c19c = undefined;
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x16918399, Offset: 0x5200
// Size: 0x80
function function_c9c5ed36() {
    foreach (nd in level.var_5ec2d86e) {
        if (!isdefined(nd.e_occupant)) {
            return nd;
        }
    }
    return undefined;
}

// Namespace ct_bots/ct_bots
// Params 9, eflags: 0x0
// Checksum 0x9723a01f, Offset: 0x5288
// Size: 0x7e
function function_82569431(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isdefined(self.nd_guard)) {
        self.nd_guard.e_occupant = undefined;
        self.nd_guard = undefined;
        self.var_9a79d89d = undefined;
        self.var_5ab7c19c = undefined;
    }
}

// Namespace ct_bots/ct_bots
// Params 2, eflags: 0x0
// Checksum 0x92cbcab3, Offset: 0x5310
// Size: 0xee
function function_7e8fcca2(nd_spawn, n_state = 4) {
    entities = function_66ced330();
    var_e8d6f89 = 0;
    foreach (entity in entities) {
        entity function_3895c193(#"axis");
        entity thread function_59458966(nd_spawn, n_state);
        return entity;
    }
}

// Namespace ct_bots/ct_bots
// Params 2, eflags: 0x0
// Checksum 0x29b422d, Offset: 0x5408
// Size: 0x222
function function_59458966(nd_spawn, n_state) {
    self endon(#"death");
    self setorigin(nd_spawn.origin);
    self setplayerangles(nd_spawn.angles);
    self.waypoint = self ct_utils::create_waypoint(#"hash_4b08047cf5e74f2e", self.origin, self.angles, #"any", undefined, 0, undefined);
    while (isdefined(nd_spawn.target)) {
        a_nd_targets = getnodearray(nd_spawn.target, "targetname");
        if (a_nd_targets.size > 0) {
            nd_spawn = array::random(a_nd_targets);
        } else {
            nd_spawn = a_nd_targets[0];
        }
        self setgoal(nd_spawn, 1, 1);
        self waittill(#"goal");
        if (isdefined(nd_spawn.script_wait) && nd_spawn.script_wait > 0) {
            self thread function_abe81a6b();
            wait(nd_spawn.script_wait);
            self notify(#"stop_end");
        }
    }
    self setgoal(self.origin);
    waitframe(1);
    switch (n_state) {
    case 4:
        self thread function_c2cfffdd(nd_spawn, 1, 1);
        break;
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x298f767e, Offset: 0x5638
// Size: 0x5e
function function_abe81a6b() {
    self endon(#"death", #"stop_end");
    while (true) {
        self setgoal(self.origin, 1, 1);
        waitframe(1);
    }
}

// Namespace ct_bots/ct_bots
// Params 0, eflags: 0x0
// Checksum 0x9e446a85, Offset: 0x56a0
// Size: 0x94
function function_43df30a8() {
    self function_623c7cae();
    if (isdefined(self.waypoint)) {
        self.waypoint ct_utils::function_f9ed304d();
    }
    self.disablespawning = 1;
    self.isinuse = 0;
    if (self.health > 0) {
        self dodamage(self.health + 100, self.origin);
    }
}

