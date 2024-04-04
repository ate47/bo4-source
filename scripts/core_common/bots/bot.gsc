// Atian COD Tools GSC decompiler test
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot_stance.gsc;
#using scripts\core_common\bots\bot_position.gsc;
#using scripts\core_common\bots\bot_interface.gsc;
#using scripts\core_common\bots\bot_chain.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;

#namespace bot;

// Namespace bot/bot
// Params 0, eflags: 0x2
// Checksum 0xd73825aa, Offset: 0x260
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bot", &__init__, undefined, undefined);
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xa2cc84a3, Offset: 0x2a8
// Size: 0x134
function __init__() {
    callback::on_connect(&on_player_connect);
    callback::on_spawned(&on_player_spawned);
    callback::on_player_damage(&on_player_damage);
    callback::on_player_killed(&on_player_killed);
    callback::on_disconnect(&on_player_disconnect);
    level.var_fa5cacde = getgametypesetting(#"hash_77b7734750cd75e9");
    setdvar(#"bot_maxmantleheight", 200);
    /#
        level thread devgui_bot_loop();
        level thread bot_joinleave_loop();
    #/
    botinterface::registerbotinterfaceattributes();
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x23a38c27, Offset: 0x3e8
// Size: 0x6
function is_bot_ranked_match() {
    return false;
}

// Namespace bot/bot
// Params 3, eflags: 0x1 linked
// Checksum 0xd8515869, Offset: 0x3f8
// Size: 0x182
function add_bot(team, name = undefined, clanabbrev = undefined) {
    bot = addtestclient(name, clanabbrev);
    if (!isdefined(bot)) {
        return undefined;
    }
    bot init_bot();
    bot.goalradius = 512;
    if (isdefined(level.disableclassselection) && level.disableclassselection) {
        bot.pers[#"class"] = level.defaultclass;
        bot.curclass = level.defaultclass;
    }
    if (level.teambased && isdefined(team) && isdefined(level.teams[team])) {
        bot.botteam = team;
    } else if (isdefined(team) && team == #"spectator") {
        bot.botteam = #"spectator";
    } else {
        bot.botteam = "autoassign";
    }
    return bot;
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0xe7c8ea5a, Offset: 0x588
// Size: 0x90
function add_bots(count = 1, team) {
    level endon(#"game_ended");
    for (i = 0; i < count; i++) {
        bot = add_bot(team);
        if (!isdefined(bot)) {
            return;
        }
        waitframe(1);
    }
}

// Namespace bot/bot
// Params 4, eflags: 0x1 linked
// Checksum 0xb32b69de, Offset: 0x620
// Size: 0xe8
function add_fixed_spawn_bot(team, origin, yaw, roleindex = undefined) {
    bot = add_bot(team);
    if (isdefined(bot)) {
        if (isdefined(roleindex) && roleindex >= 0) {
            bot.var_29b433bd = int(roleindex);
        }
        bot allow_all(0);
        node = bot get_nearest_node(origin);
        bot thread fixed_spawn_override(origin, yaw, node);
    }
    return bot;
}

// Namespace bot/bot
// Params 4, eflags: 0x1 linked
// Checksum 0xdfc7de07, Offset: 0x710
// Size: 0xca
function add_balanced_bot(allies, maxallies, axis, maxaxis) {
    bot = undefined;
    if (allies.size < maxallies && (allies.size <= axis.size || axis.size >= maxaxis)) {
        bot = add_bot(#"allies");
    } else if (axis.size < maxaxis) {
        bot = add_bot(#"axis");
    }
    return isdefined(bot);
}

// Namespace bot/bot
// Params 4, eflags: 0x1 linked
// Checksum 0x6b134f9e, Offset: 0x7e8
// Size: 0x158
function fixed_spawn_override(origin, yaw, node = undefined, force = 1) {
    self endon(#"disconnect");
    angles = (0, yaw, 0);
    while (isdefined(self.bot)) {
        self waittill(#"spawned_player");
        if (isdefined(node)) {
            self setorigin(node.origin);
            self setplayerangles(node.angles);
            self setgoal(node, force);
        } else {
            self setorigin(origin);
            self setplayerangles(angles);
            self setgoal(origin, force);
        }
        self dontinterpolate();
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0x2c7731d4, Offset: 0x948
// Size: 0x16e
function function_7dc6049e(vehicle, seatindex = undefined) {
    self endon(#"disconnect");
    level endon(#"game_ended");
    while (isdefined(vehicle)) {
        self waittill(#"spawned_player");
        if (isdefined(vehicle) && isdefined(seatindex) && !vehicle isvehicleseatoccupied(seatindex)) {
            vehicle usevehicle(self, seatindex);
            continue;
        }
        for (i = 0; i < 11; i++) {
            if (vehicle function_dcef0ba1(i)) {
                var_3693c73b = vehicle function_defc91b2(i);
                if (isdefined(var_3693c73b) && var_3693c73b >= 0 && !vehicle isvehicleseatoccupied(i)) {
                    vehicle usevehicle(self, i);
                    break;
                }
            }
        }
    }
}

// Namespace bot/bot
// Params 1, eflags: 0x0
// Checksum 0x9e94787a, Offset: 0xac0
// Size: 0xd8
function remove_bots(team) {
    players = getplayers();
    foreach (player in players) {
        if (!player istestclient()) {
            continue;
        }
        if (isdefined(team) && player.team != team) {
            continue;
        }
        remove_bot(player);
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0x4b674af7, Offset: 0xba0
// Size: 0x6c
function remove_random_bot() {
    bots = get_bots();
    if (!bots.size) {
        return;
    }
    bot = bots[randomint(bots.size)];
    remove_bot(bot);
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0xccb4b0fa, Offset: 0xc18
// Size: 0x64
function remove_bot(bot) {
    if (!bot istestclient()) {
        return;
    }
    if (isdefined(level.onbotremove)) {
        bot [[ level.onbotremove ]]();
    }
    bot botdropclient();
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x66760ed4, Offset: 0xc88
// Size: 0x32
function get_bots() {
    players = getplayers();
    return filter_bots(players);
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0xff414cbd, Offset: 0xcc8
// Size: 0xa8
function filter_bots(players) {
    bots = [];
    foreach (player in players) {
        if (isbot(player)) {
            bots[bots.size] = player;
        }
    }
    return bots;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x299dfd0, Offset: 0xd78
// Size: 0xc4
function get_friendly_bots() {
    players = getplayers(self.team);
    bots = [];
    foreach (player in players) {
        if (!isbot(player)) {
            continue;
        }
        bots[bots.size] = player;
    }
    return bots;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x7dcf7d67, Offset: 0xe48
// Size: 0xe0
function get_enemy_bots() {
    players = getplayers();
    bots = [];
    foreach (player in players) {
        if (!isbot(player)) {
            continue;
        }
        if (util::function_fbce7263(player.team, self.team)) {
            bots[bots.size] = player;
        }
    }
    return bots;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x30d5ac2f, Offset: 0xf30
// Size: 0xcc
function function_a0f5b7f5(team) {
    players = getplayers(team);
    bots = [];
    foreach (player in players) {
        if (!isbot(player)) {
            continue;
        }
        bots[bots.size] = player;
    }
    return bots;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x53818c07, Offset: 0x1008
// Size: 0xc0
function get_bot_by_entity_number(entnum) {
    players = getplayers();
    foreach (player in players) {
        if (!isbot(player)) {
            continue;
        }
        if (player getentitynumber() == entnum) {
            return player;
        }
    }
    return undefined;
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0x46dad34, Offset: 0x10d0
// Size: 0x94
function bot_count() {
    count = 0;
    foreach (player in level.players) {
        if (player istestclient()) {
            count++;
        }
    }
    return count;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x87dc5e15, Offset: 0x1170
// Size: 0xf6
function on_player_connect() {
    if (!self istestclient()) {
        return;
    }
    self endon(#"disconnect");
    /#
        self thread add_bot_devgui_menu();
    #/
    if (!self initialized()) {
        self init_bot();
    }
    waitframe(1);
    if (isdefined(level.onbotconnect)) {
        self thread [[ level.onbotconnect ]]();
    }
    if (isdefined(self.var_29b433bd) && player_role::is_valid(self.var_29b433bd)) {
        player_role::set(self.var_29b433bd);
        self.var_29b433bd = undefined;
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xe029aeff, Offset: 0x1270
// Size: 0x27a
function on_player_spawned() {
    if (!isbot(self)) {
        return;
    }
    /#
        weapon = undefined;
        if (getdvarstring(#"bot_spawn_weapon", "<unknown string>") != "<unknown string>") {
            weapon = util::get_weapon_by_name(getdvarstring(#"bot_spawn_weapon"), getdvarstring(#"hash_c6e51858c88a5ee"));
            if (isdefined(weapon)) {
                self function_35e77034(weapon);
            }
        }
    #/
    self.var_2925fedc = undefined;
    if (self bot_chain::function_58b429fb()) {
        self bot_chain::function_34a84039();
    } else if (ai::getaiattribute(self, "control") === "autonomous" && isdefined(self.bot.var_bd883a25)) {
        self setgoal(self.bot.var_bd883a25, self.bot.var_4e3a654);
    } else {
        self setgoal(self.origin);
    }
    self function_acc4267f();
    if (isdefined(level.onbotspawned)) {
        self thread [[ level.onbotspawned ]]();
    }
    self thread update_loop();
    if (getdvarint(#"bots_invulnerable", 0)) {
        self val::set(#"devgui", "takedamage", 0);
    }
    self.bot.var_f9954cf6 = undefined;
    self.bot.var_44114a0e = undefined;
    self.bot.currentflag = undefined;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x401a9d9b, Offset: 0x14f8
// Size: 0x6e
function on_player_damage(params) {
    if (!isbot(self)) {
        return;
    }
    if (function_ffa5b184(self.enemy)) {
        self clearentitytarget();
        self.bot.var_2a98e9ea = 0;
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xed5fd305, Offset: 0x1570
// Size: 0xac
function on_player_killed() {
    if (!isbot(self)) {
        return;
    }
    self clear_interact();
    self clear_revive_target();
    if (isdefined(level.onbotkilled)) {
        self thread [[ level.onbotkilled ]]();
    }
    self clearentitytarget();
    self.bot.var_2a98e9ea = 0;
    self botreleasemanualcontrol();
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x67817d38, Offset: 0x1628
// Size: 0x3c
function on_player_disconnect() {
    if (!self istestclient()) {
        return;
    }
    /#
        self clear_bot_devgui_menu();
    #/
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x5f8d6fde, Offset: 0x1670
// Size: 0x90
function function_c6e29bdf() {
    /#
        self thread add_bot_devgui_menu();
    #/
    if (!self initialized()) {
        self init_bot();
    }
    self.goalradius = 512;
    self thread update_loop();
    if (isdefined(level.onbotspawned)) {
        self thread [[ level.onbotspawned ]]();
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x9b00dc40, Offset: 0x1708
// Size: 0x36
function function_3d575aa3() {
    /#
        self clear_bot_devgui_menu();
    #/
    self notify(#"hash_a729d7d4c6847f6");
    self.bot = undefined;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xac23186, Offset: 0x1748
// Size: 0x556
function update_loop() {
    /#
        if (getdvarint(#"hash_40d23c5b73e8bad4", 0)) {
            waitframe(1);
            self bottakemanualcontrol();
            return;
        }
    #/
    self endon(#"death", #"bled_out");
    level endon(#"game_ended");
    if (isdefined(level.var_fa5cacde) && level.var_fa5cacde) {
        waitframe(1);
        self bottakemanualcontrol();
        return;
    }
    self bot_action::start();
    self bot_position::start();
    self bot_stance::start();
    while (isdefined(self.bot)) {
        if (!isbot(self) || !self initialized()) {
            self bot_action::stop();
            self bot_position::stop();
            self bot_stance::stop();
            return;
        }
        tacbundle = self function_d473f7de();
        /#
            if (!isdefined(tacbundle)) {
                record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>", self, 0.5);
                waitframe(1);
                continue;
            }
            record3dtext("<unknown string>" + tacbundle.name + "<unknown string>", self.origin, (1, 1, 1), "<unknown string>", self, 0.5);
            if (isdefined(self get_revive_target())) {
                target = self get_revive_target().origin;
                recordline(self.origin, target, (0, 1, 1), "<unknown string>", self);
                recordcircle(target, 32, (0, 1, 1), "<unknown string>", self);
            }
            if (self should_record(#"hash_16eb77415dcf6054")) {
                self function_d45e8714();
            }
        #/
        self function_ec403901();
        self function_23c46f6e();
        self function_92b0ec6b();
        if (!self isplayinganimscripted() && !self arecontrolsfrozen() && !self function_5972c3cf() && !self isinvehicle() && !self util::isflashed() && isdefined(self.sessionstate) && self.sessionstate == "playing") {
            self bot_action::update();
            self thread bot_position::update(tacbundle);
            self bot_stance::update(tacbundle);
            self update_swim();
        } else {
            self bot_action::reset();
            self bot_position::reset();
            self bot_stance::reset();
            if (self function_dd750ead()) {
                gameobject = self get_interact();
                if (isdefined(gameobject.inuse) && gameobject.inuse && isdefined(gameobject.trigger) && self.claimtrigger === gameobject.trigger) {
                    self bottapbutton(3);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x2f54362e, Offset: 0x1ca8
// Size: 0x174
function function_23c46f6e() {
    if (self function_dd750ead()) {
        gameobject = self get_interact();
        if (!isdefined(gameobject.trigger) || !gameobject.trigger istriggerenabled() || !gameobject gameobjects::can_interact_with(self)) {
            self clear_interact();
        } else if (isdefined(gameobject.inuse) && gameobject.inuse && self.claimtrigger !== gameobject.trigger) {
            self clear_interact();
        }
        return;
    }
    if (self function_914feddd()) {
        return;
    }
    if (self function_43a720c7()) {
        return;
    }
    if (self has_interact()) {
        /#
            self botprinterror("<unknown string>");
        #/
        self clear_interact();
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x5b5a2466, Offset: 0x1e28
// Size: 0xd6
function function_92b0ec6b() {
    if (!has_visible_enemy()) {
        self.bot.var_ea5b64df = isdefined(self.bot.tacbundle.inaccuracy) ? self.bot.tacbundle.inaccuracy : 0;
        self.bot.aimoffset = (0, 0, 0);
        self.bot.var_9492fdcb = (0, 0, 0);
        self.bot.var_67b4ea54 = undefined;
    }
    if (self playerads() < 1) {
        self.bot.var_ddc0e12b = undefined;
        self.bot.var_f2b47a08 = undefined;
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x26226b8b, Offset: 0x1f08
// Size: 0xbc
function function_ec403901() {
    if (isdefined(self.revivetrigger)) {
        if (isstring(level.var_258cdebb) && self.bot.tacbundle.name != level.var_258cdebb) {
            self function_678e7c0(level.var_258cdebb);
        }
        return;
    }
    if (isdefined(self.var_81c43c)) {
        self function_678e7c0(self.var_81c43c);
        return;
    }
    self function_acc4267f();
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xee441e2, Offset: 0x1fd0
// Size: 0x19c
function function_ffbfd83b() {
    if (isdefined(self.bot.var_2a98e9ea) && self.bot.var_2a98e9ea && !function_ffa5b184(self.enemy)) {
        self.bot.var_2a98e9ea = 0;
        self clearentitytarget();
        return;
    }
    if (!isdefined(self.enemy) || !function_ffa5b184(self.enemy)) {
        return;
    }
    if (self.ignoreall || isdefined(self.enemy.var_becd4d91) && self.enemy.var_becd4d91 || self.enemy ai::function_41b04632()) {
        self clearentitytarget();
        return;
    }
    targetpoint = isdefined(self.enemy.var_88f8feeb) ? self.enemy.var_88f8feeb : self.enemy getcentroid();
    if (!sighttracepassed(self geteye(), targetpoint, 0, self.enemy)) {
        self clearentitytarget();
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xfebaa879, Offset: 0x2178
// Size: 0x2e4
function update_swim() {
    if (!self isplayerswimming()) {
        self.bot.resurfacetime = undefined;
        return;
    }
    if (isdefined(self.drownstage) && self.drownstage != 0) {
        self bottapbutton(67);
        return;
    }
    if (self isplayerunderwater()) {
        if (!isdefined(self.bot.resurfacetime)) {
            self.bot.resurfacetime = gettime() + int((self.playerrole.swimtime - 1) * 1000);
        }
    } else {
        if (isdefined(self.bot.resurfacetime) && gettime() - self.bot.resurfacetime < int(2 * 1000)) {
            self bottapbutton(67);
            return;
        }
        self.bot.resurfacetime = undefined;
    }
    if (self botundermanualcontrol()) {
        return;
    }
    goalposition = self.goalpos;
    if (distance2dsquared(goalposition, self.origin) <= 16384 && getwaterheight(goalposition) > 0) {
        self bottapbutton(68);
        return;
    }
    if (isdefined(self.bot.resurfacetime) && self.bot.resurfacetime <= gettime()) {
        self bottapbutton(67);
        return;
    }
    bottomtrace = groundtrace(self.origin, self.origin + (0, 0, -1000), 0, self, 1);
    swimheight = self.origin[2] - bottomtrace[#"position"][2];
    if (swimheight < 25) {
        self bottapbutton(67);
        return;
    }
    if (swimheight > 45) {
        self bottapbutton(68);
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x6fee2bde, Offset: 0x2468
// Size: 0xfc
function init_bot() {
    self.bot = spawnstruct();
    ai::createinterfaceforentity(self);
    self function_acc4267f();
    self.bot.var_b2b8f0b6 = 300;
    self.bot.var_e8c941d6 = 470;
    self.bot.var_51cee2ad = 0;
    self.bot.var_af11e334 = 0;
    self.bot.var_bdbba2cd = 0;
    self.bot.var_18fa994c = 0;
    self.bot.var_857c5ea8 = 0;
    blackboard::createblackboardforentity(self);
    self function_eaf7ef38(#"hash_1b029888c4965031", #"hash_41b1340b7efb3261");
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x94f8ffb1, Offset: 0x2570
// Size: 0xc
function initialized() {
    return isdefined(self.bot);
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xaa03328f, Offset: 0x2588
// Size: 0x3c
function function_acc4267f() {
    self function_678e7c0(isdefined(level.var_df0a0911) ? level.var_df0a0911 : "bot_tacstate_default");
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0xf8f3c092, Offset: 0x25d0
// Size: 0x32e
function function_678e7c0(bundlename) {
    tacbundle = getscriptbundle(bundlename);
    if (!isdefined(tacbundle)) {
        /#
            self botprinterror("<unknown string>" + bundlename);
        #/
        return;
    }
    if (self.bot.tacbundle === tacbundle) {
        return;
    }
    maxsightdist = isdefined(tacbundle.maxsightdist) ? tacbundle.maxsightdist : 0;
    self.maxsightdistsqrd = maxsightdist * maxsightdist;
    self.highlyawareradius = isdefined(tacbundle.highlyawareradius) ? tacbundle.highlyawareradius : 0;
    self.fovcosine = fov_angle_to_cosine(tacbundle.fov);
    self.fovcosinebusy = fov_angle_to_cosine(tacbundle.fovbusy);
    self.perfectaim = isdefined(tacbundle.perfectaim) ? tacbundle.perfectaim : 0;
    self.accuracy = isdefined(tacbundle.accuracy) ? tacbundle.accuracy : 0;
    self.pacifist = isdefined(tacbundle.pacifist) ? tacbundle.pacifist : 0;
    self.pacifistwait = isdefined(tacbundle.pacifistwait) ? tacbundle.pacifistwait : 0;
    self botsetlooksensitivity(isdefined(tacbundle.pitchsensitivity) ? tacbundle.pitchsensitivity : 0, isdefined(tacbundle.yawsensitivity) ? tacbundle.yawsensitivity : 0);
    self function_4f0b9564(isdefined(tacbundle.pitchacceleration) ? tacbundle.pitchacceleration : 0, isdefined(tacbundle.yawacceleration) ? tacbundle.yawacceleration : 0);
    self function_a6b577cd(isdefined(tacbundle.var_2b02e26a) ? tacbundle.var_2b02e26a : 0, isdefined(tacbundle.var_69610dbe) ? tacbundle.var_69610dbe : 0);
    self function_400c9c63(isdefined(tacbundle.var_4333f343) ? tacbundle.var_4333f343 : 0, isdefined(tacbundle.var_b392418) ? tacbundle.var_b392418 : 0);
    self.bot.tacbundle = tacbundle;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x39f1deb0, Offset: 0x2908
// Size: 0x42
function fov_angle_to_cosine(fovangle = 0) {
    if (fovangle >= 180) {
        return 0;
    }
    return cos(fovangle / 2);
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xfb1f0f10, Offset: 0x2958
// Size: 0x12
function function_d473f7de() {
    return self.bot.tacbundle;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0xac3c2021, Offset: 0x2978
// Size: 0x1e
function set_interact(interact) {
    self.bot.interact = interact;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xfa3d73bf, Offset: 0x29a0
// Size: 0x12
function clear_interact() {
    self.bot.interact = undefined;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x2cfa3d3b, Offset: 0x29c0
// Size: 0x12
function get_interact() {
    return self.bot.interact;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xda4370ec, Offset: 0x29e0
// Size: 0x14
function has_interact() {
    return isdefined(self.bot.interact);
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x27cfc214, Offset: 0x2a00
// Size: 0x5a
function function_dd750ead() {
    return isdefined(self.bot.interact) && isdefined(self.bot.interact.trigger) && self.bot.interact.triggertype === "use";
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xb72802c0, Offset: 0x2a68
// Size: 0x32
function function_914feddd() {
    return isdefined(self.bot.interact) && isdefined(self.bot.interact.zombie_weapon_upgrade);
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xa2fcf993, Offset: 0x2aa8
// Size: 0x56
function function_e8a17817() {
    return isdefined(self.bot.interact) && isdefined(self.bot.interact.zombie_cost) && self.bot.interact._door_open !== 1;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xa91962d7, Offset: 0x2b08
// Size: 0x5e
function function_2d99e476() {
    return isdefined(self.bot.interact) && self.bot.interact.objectid === "magicbox_struct" && self.bot.interact.hidden !== 1;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x40344f49, Offset: 0x2b70
// Size: 0x3a
function function_4e55eb5d() {
    return isdefined(self.bot.interact) && self.bot.interact.targetname === "use_elec_switch";
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x1ea96b45, Offset: 0x2bb8
// Size: 0x3a
function function_ca9fb875() {
    return isdefined(self.bot.interact) && self.bot.interact.script_unitrigger_type === "unitrigger_box_use";
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xb635e87c, Offset: 0x2c00
// Size: 0x5c
function function_43a720c7() {
    return function_e8a17817() || function_2d99e476() || function_4e55eb5d() || function_ca9fb875();
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0x44625ed6, Offset: 0x2c68
// Size: 0x19c
function function_bba89736() {
    if (!self has_interact()) {
        return undefined;
    }
    interact = self get_interact();
    if (self function_dd750ead()) {
        return interact.trigger;
    } else if (self function_914feddd() || self function_43a720c7()) {
        if (isentity(interact)) {
            return interact;
        } else if (isdefined(interact.trigger_stub) && isdefined(interact.trigger_stub.playertrigger)) {
            return interact.trigger_stub.playertrigger[self getentitynumber()];
        } else if (isdefined(interact.unitrigger_stub) && isdefined(interact.unitrigger_stub.playertrigger)) {
            return interact.unitrigger_stub.playertrigger[self getentitynumber()];
        } else if (isdefined(interact.playertrigger)) {
            return interact.playertrigger[self getentitynumber()];
        }
    }
    return undefined;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x19491280, Offset: 0x2e10
// Size: 0x12
function get_revive_target() {
    return self.bot.revivetarget;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0xf2015d70, Offset: 0x2e30
// Size: 0x1e
function set_revive_target(target) {
    self.bot.revivetarget = target;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x7d1c27e, Offset: 0x2e58
// Size: 0x1c
function clear_revive_target() {
    self set_revive_target(undefined);
}

// Namespace bot/bot
// Params 1, eflags: 0x0
// Checksum 0x41c8131f, Offset: 0x2e80
// Size: 0x6e
function menu_cancel(menukey) {
    self notify(#"menuresponse", {#menu:game.menu[menukey], #response:"cancel", #intpayload:0});
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xcd535d9b, Offset: 0x2ef8
// Size: 0x58
function has_visible_enemy() {
    if (self in_combat()) {
        return (isalive(self.enemy) && self cansee(self.enemy));
    }
    return false;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x659e418b, Offset: 0x2f58
// Size: 0x64
function in_combat() {
    if (!isdefined(self.enemy)) {
        return false;
    }
    switch (self.combatstate) {
    case #"combat_state_aware_of_enemies":
    case #"combat_state_in_combat":
    case #"combat_state_has_visible_enemy":
        return true;
    }
    return false;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x7511f9a8, Offset: 0x2fc8
// Size: 0xc2
function fwd_dot(point) {
    angles = self getplayerangles();
    fwd = anglestoforward(angles);
    eye = self geteye();
    dir = point - eye;
    dir = vectornormalize(dir);
    dot = vectordot(fwd, dir);
    return dot;
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0x889b737f, Offset: 0x3098
// Size: 0x36
function function_7aeb27f1(smin, smax) {
    return gettime() + 1000 * randomfloatrange(smin, smax);
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x85519224, Offset: 0x30d8
// Size: 0xe2
function eye_trace(hitents = 0) {
    direction = self getplayerangles();
    direction_vec = anglestoforward(direction);
    eye = self geteye();
    scale = 8000;
    direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
    return bullettrace(eye, eye + direction_vec, hitents, self);
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xfe0c65dd, Offset: 0x31c8
// Size: 0xb6
function function_343d7ef4() {
    if (!isbot(self)) {
        return false;
    }
    if (self isinvehicle()) {
        vehicle = self getvehicleoccupied();
        if (isdefined(vehicle.goalforced) && vehicle.goalforced || isdefined(vehicle.ignoreall) && vehicle.ignoreall) {
            return false;
        }
    } else if (self.ignoreall) {
        return false;
    }
    return true;
}

// Namespace bot/bot
// Params 4, eflags: 0x1 linked
// Checksum 0xc021a5e5, Offset: 0x3288
// Size: 0x24
function function_b5dd2fd2(entity, attribute, oldvalue, value) {
    
}

// Namespace bot/bot
// Params 4, eflags: 0x1 linked
// Checksum 0x227a77de, Offset: 0x32b8
// Size: 0x11e
function get_nearest_node(pos, maxradius = 24, minradius = 0, height = 64) {
    nodes = getnodesinradiussorted(pos, maxradius, minradius, height, "Scripted");
    if (nodes.size > 0) {
        return nodes[0];
    }
    nodes = getnodesinradiussorted(pos, maxradius, minradius, height, "Cover");
    if (nodes.size > 0) {
        return nodes[0];
    }
    nodes = getnodesinradiussorted(pos, maxradius, minradius, height, "Path");
    if (nodes.size > 0) {
        return nodes[0];
    }
    return undefined;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x46f5715b, Offset: 0x33e0
// Size: 0x46
function get_position_node() {
    if (isdefined(self.node)) {
        return self.node;
    } else if (!isdefined(self.overridegoalpos) && isdefined(self.goalnode)) {
        return self.goalnode;
    }
    return undefined;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x3bab689, Offset: 0x3430
// Size: 0x12c
function allow_all(allow) {
    self.ignoreall = !allow;
    self ai::set_behavior_attribute("allowprimaryoffhand", allow);
    self ai::set_behavior_attribute("allowsecondaryoffhand", allow);
    self ai::set_behavior_attribute("allowspecialoffhand", allow);
    self ai::set_behavior_attribute("allowscorestreak", allow);
    if (allow) {
        self ai::set_behavior_attribute("control", "commander");
        self clearforcedgoal();
        return;
    }
    self ai::set_behavior_attribute("control", "autonomous");
    self setgoal(self.origin, 1);
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x1292514a, Offset: 0x3568
// Size: 0x11a
function function_f0c35734(trigger) {
    assert(isbot(self));
    assert(isdefined(trigger));
    radius = self getpathfindingradius();
    height = self function_6a9ae71();
    heightoffset = (0, 0, height * -1 / 2);
    var_e790dc87 = (radius, radius, height / 2);
    obb = ai::function_470c0597(trigger.origin + heightoffset, trigger.maxs + var_e790dc87, trigger.angles);
    return obb;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x89ca3795, Offset: 0x3690
// Size: 0x152
function function_52947b70(trigger) {
    assert(isbot(self));
    assert(isstruct(trigger));
    radius = self getpathfindingradius();
    height = self function_6a9ae71();
    heightoffset = (0, 0, height * -1 / 2);
    var_e790dc87 = (radius, radius, height / 2);
    maxs = (trigger.script_width, trigger.script_length, trigger.script_height);
    obb = ai::function_470c0597(trigger.origin + heightoffset, maxs + var_e790dc87, trigger.angles);
    return obb;
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0x7b5c1dcf, Offset: 0x37f0
// Size: 0x12c
function function_e0aceb0c(tacbundle, dvarstr) {
    healthratio = self.health / self.maxhealth;
    if (healthratio <= tacbundle.var_ac1c818f) {
        /#
            self record_text("<unknown string>", (1, 0, 0), dvarstr);
        #/
        return false;
    }
    if (self isreloading()) {
        /#
            self record_text("<unknown string>", (1, 0, 0), dvarstr);
        #/
        return false;
    }
    weapon = self getcurrentweapon();
    if (weapon != level.weaponnone && self getweaponammoclip(weapon) <= 0) {
        /#
            self record_text("<unknown string>", (1, 0, 0), dvarstr);
        #/
        return false;
    }
    return true;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x97ee327, Offset: 0x3928
// Size: 0x12a
function function_b78e1ebf(lefthand = 0) {
    weapon = self get_current_weapon(lefthand);
    buttonbit = lefthand ? 24 : 0;
    self bottapbutton(buttonbit);
    if (isdefined(level.var_32ae304)) {
        self [[ level.var_32ae304 ]](lefthand);
        return;
    }
    if (weapon function_7f23578e()) {
        var_51cee2ad = gettime() + randomintrange(self.bot.var_b2b8f0b6, self.bot.var_e8c941d6);
        if (lefthand) {
            self.bot.var_af11e334 = var_51cee2ad;
            return;
        }
        self.bot.var_51cee2ad = var_51cee2ad;
    }
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x87741f51, Offset: 0x3a60
// Size: 0x4c
function function_e2c892a5(lefthand = 0) {
    if (function_a7106162(lefthand)) {
        function_b78e1ebf(lefthand);
        return true;
    }
    return false;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x685f09aa, Offset: 0x3ab8
// Size: 0x162
function function_a7106162(lefthand = 0) {
    weapon = get_current_weapon(lefthand);
    if (weapon == level.weaponnone) {
        return 0;
    }
    if (self getweaponammoclip(weapon) <= 0) {
        return 0;
    }
    if (isdefined(level.var_bddfddcf)) {
        return self [[ level.var_bddfddcf ]](lefthand);
    } else if (weapon function_7f23578e()) {
        if (self function_a39f313c(lefthand) || self isplayerswimming()) {
            return (gettime() > (lefthand ? self.bot.var_af11e334 : self.bot.var_51cee2ad));
        }
        return 0;
    } else if (weapon function_903ea2a5()) {
        return (self function_a39f313c(lefthand) || self isplayerswimming());
    }
    return 1;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x27512a3b, Offset: 0x3c28
// Size: 0x50
function get_current_weapon(lefthand = 0) {
    weapon = self getcurrentweapon();
    if (lefthand) {
        return weapon.dualwieldweapon;
    }
    return weapon;
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0xe08646e1, Offset: 0x3c80
// Size: 0x50
function weapon_loaded(weapon) {
    return self getweaponammoclip(weapon) > 0 || self getweaponammoclip(weapon.dualwieldweapon) > 0;
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0xc7422e33, Offset: 0x3cd8
// Size: 0x14
function function_7f23578e() {
    return self.firetype == "Single Shot";
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x5ea81388, Offset: 0x3cf8
// Size: 0x14
function function_903ea2a5() {
    return self.firetype == "Burst";
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0x11ad72b5, Offset: 0x3d18
// Size: 0x828
function devgui_bot_loop() {
    /#
        sessionmode = currentsessionmode();
        if (sessionmode != 4) {
            var_48c9cde3 = getallcharacterbodies(sessionmode);
            foreach (index in var_48c9cde3) {
                if (index == 0) {
                    continue;
                }
                displayname = makelocalizedstring(getcharacterdisplayname(index, sessionmode));
                assetname = function_9e72a96(getcharacterassetname(index, sessionmode));
                name = displayname + "<unknown string>" + assetname + "<unknown string>";
                cmd = "<unknown string>" + name + "<unknown string>" + index + "<unknown string>" + index + "<unknown string>";
                adddebugcommand(cmd);
                cmd = "<unknown string>" + name + "<unknown string>" + index + "<unknown string>" + index + "<unknown string>";
                adddebugcommand(cmd);
            }
        }
        while (true) {
            wait(0.25);
            dvarstr = getdvarstring(#"devgui_bot", "<unknown string>");
            if (dvarstr == "<unknown string>") {
                continue;
            }
            args = strtok(dvarstr, "<unknown string>");
            host = util::gethostplayerforbots();
            switch (args[0]) {
            case #"add":
                level devgui_add_bots(host, args[1], int(args[2]));
                break;
            case #"spawn_enemy":
                level devgui_add_bots(host, #"enemy", 1);
                break;
            case #"remove":
                level devgui_remove_bots(host, args[1]);
                break;
            case #"kill":
                level devgui_kill_bots(host, args[1]);
                break;
            case #"invulnerable":
                level devgui_invulnerable(host, args[1], args[2]);
                break;
            case #"ignoreall":
                level devgui_ignoreall(host, args[1], int(args[2]));
                break;
            case #"primaryoffhand":
                level devgui_attribute(host, "<unknown string>", args[1], int(args[2]));
                break;
            case #"secondaryoffhand":
                level devgui_attribute(host, "<unknown string>", args[1], int(args[2]));
                break;
            case #"specialoffhand":
                level devgui_attribute(host, "<unknown string>", args[1], int(args[2]));
                break;
            case #"scorestreak":
                level devgui_attribute(host, "<unknown string>", args[1], int(args[2]));
                break;
            case #"usegadget":
                level devgui_use_gadget(host, args[1], int(args[2]));
                break;
            case #"usekillstreak":
                level function_8042b78a(host, args[1]);
                break;
            case #"tpose":
                level devgui_tpose(host, args[1]);
                break;
            }
            if (isdefined(host)) {
                switch (args[0]) {
                case #"add_fixed_spawn":
                    host devgui_add_fixed_spawn_bots(args[1], args[2], args[3]);
                    break;
                case #"set_target":
                    host devgui_set_target(args[1], args[2]);
                    break;
                case #"goal":
                    host devgui_goal(args[1], args[2]);
                    break;
                case #"companion":
                    host function_5524bfd5(args[1]);
                    break;
                case #"hash_7d471b297adb925d":
                    host function_263ca697();
                    break;
                }
            }
            level notify(#"devgui_bot", {#host:host, #args:args});
            setdvar(#"devgui_bot", "<unknown string>");
        }
    #/
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0x56e27836, Offset: 0x4548
// Size: 0x492
function add_bot_devgui_menu() {
    /#
        entnum = self getentitynumber();
        if (level.var_fa5cacde && entnum > 12) {
            return;
        }
        i = 0;
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 0, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 1, "<unknown string>", "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 0, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 1, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 2, "<unknown string>", "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 0, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 1, "<unknown string>", "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 0, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 1, "<unknown string>", "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 0, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 1, "<unknown string>", "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 0, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 1, "<unknown string>", "<unknown string>");
        self add_bot_devgui_cmd(entnum, "<unknown string>" + i + "<unknown string>", 2, "<unknown string>", "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>", i, "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>", i, "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>", i, "<unknown string>");
        i++;
        self add_bot_devgui_cmd(entnum, "<unknown string>", i, "<unknown string>");
        i++;
    #/
}

// Namespace bot/bot
// Params 5, eflags: 0x0
// Checksum 0xf444d8dd, Offset: 0x49e8
// Size: 0xec
function add_bot_devgui_cmd(entnum, path, sortkey, devguiarg, cmdargs) {
    /#
        if (!isdefined(cmdargs)) {
            cmdargs = "<unknown string>";
        }
        cmd = "<unknown string>" + entnum + "<unknown string>" + self.name + "<unknown string>" + entnum + "<unknown string>" + path + "<unknown string>" + sortkey + "<unknown string>" + devguiarg + "<unknown string>" + entnum + "<unknown string>" + cmdargs + "<unknown string>";
        util::add_debug_command(cmd);
    #/
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0xa08f7a33, Offset: 0x4ae0
// Size: 0x8c
function clear_bot_devgui_menu() {
    /#
        entnum = self getentitynumber();
        if (level.var_fa5cacde && entnum > 12) {
            return;
        }
        cmd = "<unknown string>" + entnum + "<unknown string>" + self.name + "<unknown string>";
        util::add_debug_command(cmd);
    #/
}

// Namespace bot/bot
// Params 3, eflags: 0x0
// Checksum 0x67ee064, Offset: 0x4b78
// Size: 0x5c
function devgui_add_bots(host, botarg, count) {
    team = devgui_relative_team(host, botarg);
    level thread add_bots(count, team);
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0xe4aa6169, Offset: 0x4be0
// Size: 0x248
function function_2d5436be(origin, spiral) {
    spacing = getdvarint(#"hash_6053b2f7b8096ff5", 75);
    a = getdvarint(#"hash_451261221fa2d2d7", 14);
    b = getdvarint(#"hash_451262221fa2d48a", 35);
    c = getdvarfloat(#"hash_451263221fa2d63d", 1);
    min = getdvarfloat(#"hash_6eab9c95ab563fcb", 50);
    radius = max(spiral.radius, min);
    degrees = spacing * 360 / 6.28319 * radius;
    spiral.angle = spiral.angle + degrees;
    spiral.radius = math::function_b1820790(a, b, c, spiral.angle);
    var_17e94d83 = rotatepointaroundaxis((spiral.radius, 0, 0), (0, 0, 1), spiral.angle + spiral.var_2b9d3922);
    spawn_point = var_17e94d83 + origin;
    trace = bullettrace(spawn_point + (0, 0, 100), spawn_point, 0, self);
    return trace[#"position"];
}

// Namespace bot/bot
// Params 3, eflags: 0x0
// Checksum 0x160d609a, Offset: 0x4e30
// Size: 0x520
function devgui_add_fixed_spawn_bots(botarg, var_b27e53da, countarg) {
    team = devgui_relative_team(self, botarg);
    trace = self eye_trace();
    spawndir = self.origin - trace[#"position"];
    spawnangles = vectortoangles(spawndir);
    if (!isdefined(countarg)) {
        countarg = 1;
    }
    count = max(int(countarg), 1);
    bots = [];
    offset = (0, 0, 5);
    origin = trace[#"position"] + offset;
    if (!isdefined(bots)) {
        bots = [];
    } else if (!isarray(bots)) {
        bots = array(bots);
    }
    bots[bots.size] = self add_fixed_spawn_bot(team, origin, spawnangles[1], var_b27e53da);
    spiral = {#var_2b9d3922:spawnangles[1], #angle:0, #radius:100};
    spiral.angle = getdvarint(#"hash_6d616a1ec2c5b8f0", 0);
    spiral.radius = getdvarint(#"hash_64cb6c7e56b66cab", 0);
    for (i = 0; i < count - 1; i++) {
        origin = function_2d5436be(trace[#"position"] + offset, spiral);
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = self add_fixed_spawn_bot(team, origin, spiral.angle + spiral.var_2b9d3922, var_b27e53da);
    }
    if (isvehicle(trace[#"entity"])) {
        foreach (bot in bots) {
            if (isdefined(bot)) {
                vehicle = trace[#"entity"];
                pos = trace[#"position"];
                seatindex = undefined;
                var_d64c5caf = undefined;
                for (i = 0; i < 11; i++) {
                    if (vehicle function_dcef0ba1(i)) {
                        var_3693c73b = vehicle function_defc91b2(i);
                        if (isdefined(var_3693c73b) && var_3693c73b >= 0 && !vehicle isvehicleseatoccupied(i)) {
                            dist = distance(pos, vehicle function_5051cc0c(i));
                            if (!isdefined(seatindex) || var_d64c5caf > dist) {
                                seatindex = i;
                                var_d64c5caf = dist;
                            }
                        }
                    }
                }
                bot thread function_7dc6049e(vehicle, seatindex);
            }
        }
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0x9b61216b, Offset: 0x5358
// Size: 0xda
function devgui_relative_team(host, botarg) {
    if (isdefined(host)) {
        team = host.team != #"spectator" ? host.team : #"allies";
        if (botarg == "enemy") {
            team = team == #"allies" ? #"axis" : #"allies";
        }
        return team;
    }
    if (botarg == "friendly") {
        return #"allies";
    }
    return #"axis";
}

// Namespace bot/bot
// Params 2, eflags: 0x0
// Checksum 0x2624abc1, Offset: 0x5440
// Size: 0xc8
function devgui_remove_bots(host, botarg) {
    level notify(#"hash_d3e36871aa6829f");
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        level thread remove_bot(bot);
    }
}

// Namespace bot/bot
// Params 3, eflags: 0x0
// Checksum 0xa5f0999c, Offset: 0x5510
// Size: 0xb8
function devgui_ignoreall(host, botarg, cmdarg) {
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        bot allow_all(cmdarg);
    }
}

// Namespace bot/bot
// Params 4, eflags: 0x0
// Checksum 0x358f53e1, Offset: 0x55d0
// Size: 0x114
function devgui_attribute(host, attribute, botarg, cmdarg) {
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        foreach (bot in bots) {
            bot ai::set_behavior_attribute(attribute, cmdarg);
        }
    }
}

// Namespace bot/bot
// Params 3, eflags: 0x0
// Checksum 0x1d47a057, Offset: 0x56f0
// Size: 0xb8
function devgui_use_gadget(host, botarg, cmdarg) {
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        bot bot_action::function_ee2eaccc(cmdarg);
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x0
// Checksum 0xbec3a2cf, Offset: 0x57b0
// Size: 0xa8
function function_8042b78a(host, botarg) {
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        bot bot_action::function_4a53ae1f();
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x0
// Checksum 0x50a9cad0, Offset: 0x5860
// Size: 0xd8
function devgui_tpose(host, botarg) {
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        setdvar(#"bg_boastenabled", 1);
        bot function_c6775cf9("dev_boast_tpose");
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x0
// Checksum 0x60923093, Offset: 0x5940
// Size: 0x130
function devgui_kill_bots(host, botarg) {
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        if (!isalive(bot)) {
            continue;
        }
        bot val::set(#"devgui_kill", "takedamage", 1);
        bot dodamage(bot.health + 1000, bot.origin);
        bot val::reset(#"devgui_kill", "takedamage");
    }
}

// Namespace bot/bot
// Params 3, eflags: 0x0
// Checksum 0x96b2832e, Offset: 0x5a78
// Size: 0x108
function devgui_invulnerable(host, botarg, cmdarg) {
    bots = devgui_get_bots(host, botarg);
    foreach (bot in bots) {
        if (cmdarg == "on") {
            bot val::set(#"devgui", "takedamage", 0);
            continue;
        }
        bot val::reset(#"devgui", "takedamage");
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x0
// Checksum 0x9501804d, Offset: 0x5b88
// Size: 0x168
function devgui_set_target(botarg, cmdarg) {
    target = undefined;
    switch (cmdarg) {
    case #"crosshair":
        target = self function_7090aa98();
        break;
    case #"me":
        target = self;
        break;
    case #"clear":
        break;
    default:
        return;
    }
    bots = devgui_get_bots(self, botarg);
    foreach (bot in bots) {
        if (isdefined(target)) {
            if (target != bot) {
                bot setentitytarget(target);
            }
            continue;
        }
        bot clearentitytarget();
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x0
// Checksum 0x9818aee, Offset: 0x5cf8
// Size: 0xda
function devgui_goal(botarg, cmdarg) {
    switch (cmdarg) {
    case #"set":
        self function_bbc3f17e(botarg, 0);
        return;
    case #"me":
        self devgui_goal_me(botarg);
        return;
    case #"force":
        self function_bbc3f17e(botarg, 1);
        return;
    case #"clear":
        self devgui_goal_clear(botarg);
        return;
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0xa56d2452, Offset: 0x5de0
// Size: 0x158
function function_bbc3f17e(botarg, force = 0) {
    trace = self eye_trace(1);
    bots = devgui_get_bots(self, botarg);
    pos = trace[#"position"];
    node = self get_nearest_node(pos);
    if (isdefined(node)) {
        pos = node;
    }
    foreach (bot in bots) {
        bot ai::set_behavior_attribute("control", "autonomous");
        bot setgoal(pos, force);
    }
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x4eb8067d, Offset: 0x5f40
// Size: 0xc8
function devgui_goal_clear(botarg) {
    bots = devgui_get_bots(self, botarg);
    foreach (bot in bots) {
        bot ai::set_behavior_attribute("control", "commander");
        bot clearforcedgoal();
    }
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x5c75acc1, Offset: 0x6010
// Size: 0xc8
function devgui_goal_me(botarg) {
    bots = devgui_get_bots(self, botarg);
    foreach (bot in bots) {
        bot ai::set_behavior_attribute("control", "autonomous");
        bot setgoal(self);
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0x802bce4d, Offset: 0x60e0
// Size: 0x15a
function devgui_get_bots(host, botarg) {
    if (strisnumber(botarg)) {
        bots = [];
        bot = get_bot_by_entity_number(int(botarg));
        if (isdefined(bot)) {
            bots[0] = bot;
        }
        return bots;
    }
    if (isdefined(host)) {
        if (botarg == "friendly") {
            return host get_friendly_bots();
        }
        if (botarg == "enemy") {
            return host get_enemy_bots();
        }
    } else if (level.teambased) {
        if (botarg == "friendly") {
            return function_a0f5b7f5(#"allies");
        }
        return function_a0f5b7f5(#"axis");
    }
    return get_bots();
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x710ed5cd, Offset: 0x6248
// Size: 0x1b2
function function_7090aa98() {
    targetentity = undefined;
    targetdot = undefined;
    players = getplayers();
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        dot = self fwd_dot(player.origin);
        if (dot < 0.997) {
            continue;
        }
        if (!self cansee(player)) {
            continue;
        }
        if (!isdefined(targetentity) || dot > targetdot) {
            targetentity = player;
            targetdot = dot;
        }
    }
    if (!isdefined(targetentity)) {
        trace = self eye_trace(1);
        targetentity = trace[#"entity"];
    }
    if (isdefined(targetentity) && !isalive(targetentity)) {
        return undefined;
    }
    return targetentity;
}

// Namespace bot/bot
// Params 1, eflags: 0x0
// Checksum 0x82f9879b, Offset: 0x6408
// Size: 0x2c
function function_5524bfd5(companionname) {
    setdvar(#"companion", companionname);
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0xf210f6eb, Offset: 0x6440
// Size: 0x130
function function_263ca697() {
    /#
        weapon = self getcurrentweapon();
        setdvar(#"bot_spawn_weapon", getweaponname(weapon.rootweapon));
        setdvar(#"hash_c6e51858c88a5ee", util::function_2146bd83(weapon));
        bots = get_bots();
        foreach (bot in bots) {
            bot function_35e77034(weapon);
        }
    #/
}

// Namespace bot/bot
// Params 1, eflags: 0x0
// Checksum 0xf6080bb4, Offset: 0x6578
// Size: 0xa4
function function_35e77034(weapon) {
    if (!isdefined(weapon) || weapon == level.weaponnone) {
        return;
    }
    self function_85e7342b();
    self giveweapon(weapon);
    self givemaxammo(weapon);
    self switchtoweaponimmediate(weapon);
    self setspawnweapon(weapon);
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x5fe5a91f, Offset: 0x6628
// Size: 0x98
function function_85e7342b() {
    weapons = self getweaponslistprimaries();
    foreach (weapon in weapons) {
        self takeweapon(weapon);
    }
}

// Namespace bot/bot
// Params 1, eflags: 0x0
// Checksum 0xe6358bef, Offset: 0x66c8
// Size: 0xba
function should_record(dvarstr) {
    /#
        if (getdvarint(dvarstr, 0) <= 0) {
            return 0;
        }
        if (self == level) {
            return 1;
        }
        botnum = getdvarint(#"hash_457b3d0b71e0fd8a", 0);
        if (botnum < 0) {
            return 1;
        }
        ent = getentbynum(botnum);
        return isdefined(ent) && ent == self;
    #/
}

// Namespace bot/bot
// Params 3, eflags: 0x0
// Checksum 0xe568615, Offset: 0x6790
// Size: 0x64
function record_text(text, textcolor, dvarstr) {
    /#
        if (self should_record(dvarstr)) {
            record3dtext(text, self.origin, textcolor, "<unknown string>", self, 0.5);
        }
    #/
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0xb774f98f, Offset: 0x6800
// Size: 0x214
function function_d45e8714() {
    /#
        if (!self has_interact()) {
            return;
        }
        interact = self get_interact();
        var_dda174e9 = self function_bba89736();
        origin = interact.origin;
        desc = "<unknown string>";
        if (self function_dd750ead()) {
            desc = "<unknown string>";
        } else if (self function_914feddd()) {
            desc = "<unknown string>";
        } else if (self function_e8a17817()) {
            desc = "<unknown string>";
        } else if (self function_ca9fb875()) {
            desc = "<unknown string>";
        }
        if (isdefined(var_dda174e9)) {
            self function_1744d303(var_dda174e9, (0, 1, 0), "<unknown string>");
        }
        if (!isvec(origin)) {
            if (isdefined(var_dda174e9)) {
                origin = var_dda174e9.origin;
            } else {
                origin = self.origin;
            }
        }
        recordline(self.origin, origin, (0, 1, 0), "<unknown string>", self);
        recordsphere(origin, 8, (0, 1, 0), "<unknown string>", self);
        record3dtext(desc, origin, (1, 1, 1), "<unknown string>", undefined, 0.5);
    #/
}

// Namespace bot/bot
// Params 3, eflags: 0x0
// Checksum 0x44fe3581, Offset: 0x6a20
// Size: 0x1bc
function function_1744d303(trigger, color, channel) {
    /#
        maxs = trigger getmaxs();
        mins = trigger getmins();
        if (issubstr(trigger.classname, "<unknown string>")) {
            radius = max(maxs[0], maxs[1]);
            top = trigger.origin + (0, 0, maxs[2]);
            bottom = trigger.origin + (0, 0, mins[2]);
            recordcircle(bottom, radius, color, channel, self);
            recordcircle(top, radius, color, channel, self);
            recordline(bottom, top, color, channel, self);
            return;
        }
        function_af72dbc5(trigger.origin, mins, maxs, trigger.angles[0], color, channel, self);
    #/
}

// Namespace bot/bot
// Params 0, eflags: 0x0
// Checksum 0xd404e147, Offset: 0x6be8
// Size: 0x150
function bot_joinleave_loop() {
    /#
        active = 0;
        while (true) {
            wait(1);
            joinleavecount = getdvarint(#"debug_bot_joinleave", 0);
            if (!joinleavecount) {
                if (active) {
                    active = 0;
                    remove_bots();
                }
                continue;
            }
            if (!active) {
                adddebugcommand("<unknown string>");
                active = 1;
            }
            botcount = bot_count();
            if (botcount > 0 && randomint(100) < 30) {
                remove_random_bot();
                wait(2);
            } else if (botcount < joinleavecount) {
                add_bot();
                wait(2);
            }
            wait(randomintrange(1, 3));
        }
    #/
}

// Namespace bot/bot
// Params 1, eflags: 0x0
// Checksum 0xdcaccbf, Offset: 0x6d40
// Size: 0x640
function function_301f229d(team) {
    var_9e7013f = [];
    var_52e61055 = [];
    players = getplayers(team);
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        if (isdefined(player.revivetrigger)) {
            if (!(isdefined(player.revivetrigger.beingrevived) && player.revivetrigger.beingrevived)) {
                var_9e7013f[var_9e7013f.size] = player;
            }
            continue;
        }
        if (isbot(player)) {
            if (!(isdefined(player.is_reviving_any) && player.is_reviving_any) && player ai::get_behavior_attribute("revive")) {
                var_52e61055[var_52e61055.size] = player;
            }
        }
    }
    assignments = [];
    foreach (bot in var_52e61055) {
        radius = bot getpathfindingradius();
        foreach (player in var_9e7013f) {
            distance = undefined;
            navmeshpoint = getclosestpointonnavmesh(player.origin, 64, radius);
            if (!isdefined(navmeshpoint)) {
                continue;
            }
            if (tracepassedonnavmesh(bot.origin, navmeshpoint, 15)) {
                distance = distance2d(bot.origin, navmeshpoint);
            } else {
                var_65c8979b = getclosestpointonnavmesh(bot.origin, 64, radius);
                if (!isdefined(var_65c8979b)) {
                    continue;
                }
                path = generatenavmeshpath(var_65c8979b, navmeshpoint, bot);
                if (!isdefined(path) || !isdefined(path.pathpoints) || path.pathpoints.size == 0) {
                    continue;
                }
                distance = path.pathdistance;
            }
            if (distance > 2000) {
                continue;
            }
            for (i = 0; i < assignments.size; i++) {
                if (distance < assignments[i].distance) {
                    break;
                }
            }
            arrayinsert(assignments, {#bot:bot, #target:player, #distance:distance}, i);
        }
    }
    for (i = 0; i < assignments.size; i++) {
        assignment = assignments[i];
        if (assignment.bot get_revive_target() !== assignment.target) {
            assignment.bot set_revive_target(assignment.target);
            assignment.bot bot_position::reset();
        }
        arrayremovevalue(var_52e61055, assignment.bot);
        for (j = i + 1; j < assignments.size; j++) {
            var_ecf75b21 = assignments[j];
            if (var_ecf75b21.bot == assignment.bot || var_ecf75b21.target == assignment.target) {
                arrayremoveindex(assignments, j);
                continue;
            }
        }
    }
    foreach (bot in var_52e61055) {
        if (isdefined(bot get_revive_target())) {
            bot clear_revive_target();
            bot bot_position::reset();
        }
    }
}

// Namespace bot/bot
// Params 0, eflags: 0x1 linked
// Checksum 0x921fd392, Offset: 0x7388
// Size: 0x184
function populate_bots() {
    level endon(#"game_ended", #"hash_d3e36871aa6829f");
    botfill = getdvarint(#"botfill", 0);
    if (botfill > 0) {
        for (i = 0; i < botfill; i++) {
            bot = add_bot();
            if (!isdefined(bot)) {
                return;
            }
            wait(0.5);
        }
        return;
    }
    if (level.teambased) {
        maxallies = getdvarint(#"bot_maxallies", 0);
        maxaxis = getdvarint(#"bot_maxaxis", 0);
        level thread monitor_bot_team_population(maxallies, maxaxis);
        return;
    }
    maxfree = getdvarint(#"bot_maxfree", 0);
    level thread monitor_bot_population(maxfree);
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0x9c0d9387, Offset: 0x7518
// Size: 0x170
function monitor_bot_team_population(maxallies, maxaxis) {
    level endon(#"game_ended", #"hash_d3e36871aa6829f");
    if (!maxallies && !maxaxis) {
        return;
    }
    fill_balanced_teams(maxallies, maxaxis);
    while (true) {
        wait(3);
        allies = getplayers(#"allies");
        axis = getplayers(#"axis");
        if (allies.size > maxallies && remove_best_bot(allies)) {
            continue;
        }
        if (axis.size > maxaxis && remove_best_bot(axis)) {
            continue;
        }
        if (allies.size < maxallies || axis.size < maxaxis) {
            add_balanced_bot(allies, maxallies, axis, maxaxis);
        }
    }
}

// Namespace bot/bot
// Params 2, eflags: 0x1 linked
// Checksum 0xe10c1ffd, Offset: 0x7690
// Size: 0xfa
function fill_balanced_teams(maxallies, maxaxis) {
    allies = getplayers(#"allies");
    for (axis = getplayers(#"axis"); (allies.size < maxallies || axis.size < maxaxis) && add_balanced_bot(allies, maxallies, axis, maxaxis); axis = getplayers(#"axis")) {
        waitframe(1);
        allies = getplayers(#"allies");
    }
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0xf65da7b2, Offset: 0x7798
// Size: 0x100
function monitor_bot_population(maxfree) {
    level endon(#"game_ended", #"hash_d3e36871aa6829f");
    if (!maxfree) {
        return;
    }
    for (players = getplayers(); players.size < maxfree; players = getplayers()) {
        add_bot();
        waitframe(1);
    }
    while (true) {
        wait(3);
        players = getplayers();
        if (players.size < maxfree) {
            add_bot();
            continue;
        }
        if (players.size > maxfree) {
            remove_best_bot(players);
        }
    }
}

// Namespace bot/bot
// Params 1, eflags: 0x1 linked
// Checksum 0x863f42c, Offset: 0x78a0
// Size: 0x168
function remove_best_bot(players) {
    bots = filter_bots(players);
    if (!bots.size) {
        return false;
    }
    bestbots = [];
    foreach (bot in bots) {
        if (bot.sessionstate == "spectator") {
            continue;
        }
        if (bot.sessionstate == "dead") {
            bestbots[bestbots.size] = bot;
        }
    }
    if (bestbots.size) {
        remove_bot(bestbots[randomint(bestbots.size)]);
    } else {
        remove_bot(bots[randomint(bots.size)]);
    }
    return true;
}

