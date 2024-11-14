#using scripts\abilities\ability_util;
#using scripts\abilities\ability_power;
#using scripts\core_common\match_record;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\player\player_role;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\array_shared;

#namespace ability_player;

// Namespace ability_player/ability_player
// Params 0, eflags: 0x2
// Checksum 0x23e136a2, Offset: 0x190
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ability_player", &__init__, undefined, undefined);
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0x21f63a83, Offset: 0x1d8
// Size: 0xcc
function __init__() {
    level callback::add_callback(#"on_end_game", &on_end_game);
    callback::on_connect(&on_player_connect);
    callback::on_spawned(&on_player_spawned);
    callback::on_disconnect(&on_player_disconnect);
    if (!isdefined(level._gadgets_level)) {
        level._gadgets_level = [];
    }
    /#
        level thread abilities_devgui_init();
    #/
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0x5f14d1bb, Offset: 0x2b0
// Size: 0x104
function on_player_connect() {
    if (!isdefined(self._gadgets_player)) {
        self._gadgets_player = [];
    }
    if (!isdefined(self.var_aec4af05)) {
        self.var_aec4af05 = [];
    }
    if (!isdefined(self.pers[#"herogadgetnotified"])) {
        self.pers[#"herogadgetnotified"] = [];
    }
    for (slot = 0; slot < 3; slot++) {
        self.pers[#"herogadgetnotified"][slot] = 0;
    }
    self callback::on_death(&function_32e782df);
    /#
        if (self getentnum() < 10) {
            self thread abilities_devgui_player_connect();
        }
    #/
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0xb000ee57, Offset: 0x3c0
// Size: 0x2ce
function on_player_spawned() {
    var_aa960fc9 = self getweaponslist();
    foreach (weapon in var_aa960fc9) {
        if (isdefined(weapon.gadget_power_reset_on_spawn) ? weapon.gadget_power_reset_on_spawn : 0) {
            slot = self gadgetgetslot(weapon);
            isfirstspawn = isdefined(self.firstspawn) ? self.firstspawn : 1;
            self gadgetpowerreset(slot, isfirstspawn);
        }
    }
    if ((isdefined(self.var_36546d49) ? self.var_36546d49 : 1) && game.state == "playing") {
        self.var_36546d49 = 0;
        for (slot = 0; slot < 3; slot++) {
            if (isdefined(self._gadgets_player) && isdefined(self._gadgets_player[slot])) {
                gadgetweapon = self._gadgets_player[slot];
                if (isdefined(gadgetweapon.var_ddaa57f2) ? gadgetweapon.var_ddaa57f2 : 0) {
                    self gadgetpowerset(slot, isdefined(gadgetweapon.var_6a864cad) ? gadgetweapon.var_6a864cad : 100);
                }
            }
        }
    } else if (game.state != "playing") {
        self.var_36546d49 = 0;
    }
    if (!(isdefined(self.pers[#"changed_class"]) && self.pers[#"changed_class"])) {
        self.pers[#"held_gadgets_power"] = [];
        self.pers[#"hash_7a954c017d693f69"] = [];
        self.pers[#"hash_68cdf8807cfaabff"] = [];
    }
    self.heroabilityactivatetime = undefined;
    self.heroabilitydectivatetime = undefined;
    self.heroabilityactive = undefined;
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0xddc2ced4, Offset: 0x698
// Size: 0x1c
function on_player_disconnect() {
    /#
        self thread abilities_devgui_player_disconnect();
    #/
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0xb08c988d, Offset: 0x6c0
// Size: 0x68
function is_using_any_gadget() {
    if (!isplayer(self)) {
        return false;
    }
    for (i = 0; i < 3; i++) {
        if (self util::gadget_is_in_use(i)) {
            return true;
        }
    }
    return false;
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x1 linked
// Checksum 0x2d931daf, Offset: 0x730
// Size: 0x1aa
function gadgets_save_power(game_ended) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        if (!isdefined(self._gadgets_player[slot])) {
            continue;
        }
        gadgetweapon = self._gadgets_player[slot];
        powerleft = self gadgetpowerchange(slot, 0);
        var_51ec1787 = self function_adc6203f(slot);
        deployed = self function_36dfc05f(slot);
        if (game_ended && (deployed || util::gadget_is_in_use(slot))) {
            if (gadgetweapon.gadget_power_round_end_active_penalty > 0) {
                powerleft -= gadgetweapon.gadget_power_round_end_active_penalty;
                powerleft = max(0, powerleft);
            }
        }
        self.pers[#"held_gadgets_power"][gadgetweapon] = powerleft;
        self.pers[#"hash_7a954c017d693f69"][gadgetweapon] = var_51ec1787;
        self.pers[#"hash_68cdf8807cfaabff"][gadgetweapon] = deployed;
    }
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0xcd936784, Offset: 0x8e8
// Size: 0x66
function function_c9b950e3() {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        if (!isdefined(self._gadgets_player[slot])) {
            continue;
        }
        self function_19ed70ca(slot, 0);
    }
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0x24d9e723, Offset: 0x958
// Size: 0x96
function function_116ec442() {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        if (!isdefined(self._gadgets_player[slot])) {
            continue;
        }
        if (self._gadgets_player[slot].statname == #"gadget_health_regen") {
            continue;
        }
        self function_19ed70ca(slot, 1);
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x5bbb9620, Offset: 0x9f8
// Size: 0x7c
function function_c22f319e(weapon, var_4dd90b81 = 0) {
    slot = self gadgetgetslot(weapon);
    self gadgetdeactivate(slot, weapon, var_4dd90b81);
    self function_ac25fc1f(slot, weapon);
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x13bab8fb, Offset: 0xa80
// Size: 0x1bc
function function_f2250880(weapon, var_4dd90b81 = 0) {
    if (!isdefined(self) || !isdefined(weapon)) {
        return;
    }
    if (isalive(self)) {
        slot = self gadgetgetslot(weapon);
        self function_95218c27(slot, var_4dd90b81);
        return;
    }
    if (!isdefined(self.var_8912d8d9)) {
        self.var_8912d8d9 = [];
        self.var_41ea5be4 = [];
    }
    if (!isdefined(self.var_8912d8d9)) {
        self.var_8912d8d9 = [];
    } else if (!isarray(self.var_8912d8d9)) {
        self.var_8912d8d9 = array(self.var_8912d8d9);
    }
    self.var_8912d8d9[self.var_8912d8d9.size] = weapon;
    if (!isdefined(self.var_41ea5be4)) {
        self.var_41ea5be4 = [];
    } else if (!isarray(self.var_41ea5be4)) {
        self.var_41ea5be4 = array(self.var_41ea5be4);
    }
    self.var_41ea5be4[self.var_41ea5be4.size] = var_4dd90b81;
    callback::function_d8abfc3d(#"on_player_spawned", &function_9c46835d);
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x1 linked
// Checksum 0x2c5b0287, Offset: 0xc48
// Size: 0xcc
function function_9c46835d(params) {
    if (isdefined(self.var_8912d8d9)) {
        for (i = 0; i < self.var_8912d8d9.size; i++) {
            slot = self gadgetgetslot(self.var_8912d8d9[i]);
            self function_95218c27(slot, self.var_41ea5be4[i]);
        }
    }
    self.var_8912d8d9 = undefined;
    self.var_41ea5be4 = undefined;
    callback::function_52ac9652(#"on_player_spawned", &function_9c46835d);
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0xf06b7935, Offset: 0xd20
// Size: 0x94
function function_95218c27(slot, var_4dd90b81 = 0) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    self.pers[#"hash_68cdf8807cfaabff"][self._gadgets_player[slot]] = 0;
    self function_48e08b4(slot, self._gadgets_player[slot], var_4dd90b81);
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x0
// Checksum 0x5bb93f7f, Offset: 0xdc0
// Size: 0x3e
function function_c2d9d3e1() {
    for (slot = 0; slot < 3; slot++) {
        self function_95218c27(slot);
    }
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x1 linked
// Checksum 0x55ea0bd5, Offset: 0xe08
// Size: 0x4c
function function_32e782df(params) {
    if (game.state != "playing") {
        return;
    }
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    self gadgets_save_power(0);
}

// Namespace ability_player/ability_player
// Params 0, eflags: 0x1 linked
// Checksum 0xebbb8b59, Offset: 0xe60
// Size: 0xc8
function on_end_game() {
    players = getplayers();
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        if (!isdefined(player._gadgets_player)) {
            continue;
        }
        player gadgets_save_power(1);
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x0
// Checksum 0xa28562ab, Offset: 0xf30
// Size: 0x24
function script_set_cclass(cclass, save = 1) {
    
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x1 linked
// Checksum 0x145cc765, Offset: 0xf60
// Size: 0x82
function register_gadget(type) {
    if (!isdefined(level._gadgets_level)) {
        level._gadgets_level = [];
    }
    if (!isdefined(level._gadgets_level[type])) {
        level._gadgets_level[type] = spawnstruct();
        level._gadgets_level[type].should_notify = 1;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x2627f1e8, Offset: 0xff0
// Size: 0x52
function register_gadget_should_notify(type, should_notify) {
    register_gadget(type);
    if (isdefined(should_notify)) {
        level._gadgets_level[type].should_notify = should_notify;
    }
}

// Namespace ability_player/ability_player
// Params 3, eflags: 0x1 linked
// Checksum 0x92eb8e1b, Offset: 0x1050
// Size: 0x252
function register_gadget_possession_callbacks(type, on_give, on_take) {
    register_gadget(type);
    if (!isdefined(level._gadgets_level[type].on_give)) {
        level._gadgets_level[type].on_give = [];
    }
    if (!isdefined(level._gadgets_level[type].on_take)) {
        level._gadgets_level[type].on_take = [];
    }
    if (isdefined(on_give)) {
        if (!isdefined(level._gadgets_level[type].on_give)) {
            level._gadgets_level[type].on_give = [];
        } else if (!isarray(level._gadgets_level[type].on_give)) {
            level._gadgets_level[type].on_give = array(level._gadgets_level[type].on_give);
        }
        level._gadgets_level[type].on_give[level._gadgets_level[type].on_give.size] = on_give;
    }
    if (isdefined(on_take)) {
        if (!isdefined(level._gadgets_level[type].on_take)) {
            level._gadgets_level[type].on_take = [];
        } else if (!isarray(level._gadgets_level[type].on_take)) {
            level._gadgets_level[type].on_take = array(level._gadgets_level[type].on_take);
        }
        level._gadgets_level[type].on_take[level._gadgets_level[type].on_take.size] = on_take;
    }
}

// Namespace ability_player/ability_player
// Params 3, eflags: 0x1 linked
// Checksum 0x6f4c7e0a, Offset: 0x12b0
// Size: 0x252
function register_gadget_activation_callbacks(type, turn_on, turn_off) {
    register_gadget(type);
    if (!isdefined(level._gadgets_level[type].turn_on)) {
        level._gadgets_level[type].turn_on = [];
    }
    if (!isdefined(level._gadgets_level[type].turn_off)) {
        level._gadgets_level[type].turn_off = [];
    }
    if (isdefined(turn_on)) {
        if (!isdefined(level._gadgets_level[type].turn_on)) {
            level._gadgets_level[type].turn_on = [];
        } else if (!isarray(level._gadgets_level[type].turn_on)) {
            level._gadgets_level[type].turn_on = array(level._gadgets_level[type].turn_on);
        }
        level._gadgets_level[type].turn_on[level._gadgets_level[type].turn_on.size] = turn_on;
    }
    if (isdefined(turn_off)) {
        if (!isdefined(level._gadgets_level[type].turn_off)) {
            level._gadgets_level[type].turn_off = [];
        } else if (!isarray(level._gadgets_level[type].turn_off)) {
            level._gadgets_level[type].turn_off = array(level._gadgets_level[type].turn_off);
        }
        level._gadgets_level[type].turn_off[level._gadgets_level[type].turn_off.size] = turn_off;
    }
}

// Namespace ability_player/ability_player
// Params 3, eflags: 0x1 linked
// Checksum 0x1e25ab41, Offset: 0x1510
// Size: 0x252
function function_92292af6(type, deployed_on, deployed_off) {
    register_gadget(type);
    if (!isdefined(level._gadgets_level[type].deployed_on)) {
        level._gadgets_level[type].deployed_on = [];
    }
    if (!isdefined(level._gadgets_level[type].deployed_off)) {
        level._gadgets_level[type].deployed_off = [];
    }
    if (isdefined(deployed_on)) {
        if (!isdefined(level._gadgets_level[type].deployed_on)) {
            level._gadgets_level[type].deployed_on = [];
        } else if (!isarray(level._gadgets_level[type].deployed_on)) {
            level._gadgets_level[type].deployed_on = array(level._gadgets_level[type].deployed_on);
        }
        level._gadgets_level[type].deployed_on[level._gadgets_level[type].deployed_on.size] = deployed_on;
    }
    if (isdefined(deployed_off)) {
        if (!isdefined(level._gadgets_level[type].deployed_off)) {
            level._gadgets_level[type].deployed_off = [];
        } else if (!isarray(level._gadgets_level[type].deployed_off)) {
            level._gadgets_level[type].deployed_off = array(level._gadgets_level[type].deployed_off);
        }
        level._gadgets_level[type].deployed_off[level._gadgets_level[type].deployed_off.size] = deployed_off;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x2a8612a9, Offset: 0x1770
// Size: 0x13a
function register_gadget_flicker_callbacks(type, on_flicker) {
    register_gadget(type);
    if (!isdefined(level._gadgets_level[type].on_flicker)) {
        level._gadgets_level[type].on_flicker = [];
    }
    if (isdefined(on_flicker)) {
        if (!isdefined(level._gadgets_level[type].on_flicker)) {
            level._gadgets_level[type].on_flicker = [];
        } else if (!isarray(level._gadgets_level[type].on_flicker)) {
            level._gadgets_level[type].on_flicker = array(level._gadgets_level[type].on_flicker);
        }
        level._gadgets_level[type].on_flicker[level._gadgets_level[type].on_flicker.size] = on_flicker;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x30386d6d, Offset: 0x18b8
// Size: 0x13a
function register_gadget_ready_callbacks(type, ready_func) {
    register_gadget(type);
    if (!isdefined(level._gadgets_level[type].on_ready)) {
        level._gadgets_level[type].on_ready = [];
    }
    if (isdefined(ready_func)) {
        if (!isdefined(level._gadgets_level[type].on_ready)) {
            level._gadgets_level[type].on_ready = [];
        } else if (!isarray(level._gadgets_level[type].on_ready)) {
            level._gadgets_level[type].on_ready = array(level._gadgets_level[type].on_ready);
        }
        level._gadgets_level[type].on_ready[level._gadgets_level[type].on_ready.size] = ready_func;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x0
// Checksum 0x58e749a1, Offset: 0x1a00
// Size: 0x13a
function register_gadget_primed_callbacks(type, primed_func) {
    register_gadget(type);
    if (!isdefined(level._gadgets_level[type].on_primed)) {
        level._gadgets_level[type].on_primed = [];
    }
    if (isdefined(primed_func)) {
        if (!isdefined(level._gadgets_level[type].on_primed)) {
            level._gadgets_level[type].on_primed = [];
        } else if (!isarray(level._gadgets_level[type].on_primed)) {
            level._gadgets_level[type].on_primed = array(level._gadgets_level[type].on_primed);
        }
        level._gadgets_level[type].on_primed[level._gadgets_level[type].on_primed.size] = primed_func;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x1f8ac6a1, Offset: 0x1b48
// Size: 0x52
function register_gadget_is_inuse_callbacks(type, inuse_func) {
    register_gadget(type);
    if (isdefined(inuse_func)) {
        level._gadgets_level[type].isinuse = inuse_func;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0xe306265d, Offset: 0x1ba8
// Size: 0x52
function register_gadget_is_flickering_callbacks(type, flickering_func) {
    register_gadget(type);
    if (isdefined(flickering_func)) {
        level._gadgets_level[type].isflickering = flickering_func;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x0
// Checksum 0xf2d977fd, Offset: 0x1c08
// Size: 0x13a
function register_gadget_failed_activate_callback(type, failed_activate) {
    register_gadget(type);
    if (!isdefined(level._gadgets_level[type].failed_activate)) {
        level._gadgets_level[type].failed_activate = [];
    }
    if (isdefined(failed_activate)) {
        if (!isdefined(level._gadgets_level[type].failed_activate)) {
            level._gadgets_level[type].failed_activate = [];
        } else if (!isarray(level._gadgets_level[type].failed_activate)) {
            level._gadgets_level[type].failed_activate = array(level._gadgets_level[type].failed_activate);
        }
        level._gadgets_level[type].failed_activate[level._gadgets_level[type].failed_activate.size] = failed_activate;
    }
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x0
// Checksum 0x568d691f, Offset: 0x1d50
// Size: 0x8e
function gadget_is_flickering(slot) {
    if (!isdefined(self._gadgets_player)) {
        return 0;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return 0;
    }
    if (!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].isflickering)) {
        return 0;
    }
    return self [[ level._gadgets_level[self._gadgets_player[slot].gadget_type].isflickering ]](slot);
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x4cfd3653, Offset: 0x1de8
// Size: 0x28a
function give_gadget(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (isdefined(self._gadgets_player[slot])) {
        if (self._gadgets_player[slot] != weapon) {
            self.pers[#"hash_68cdf8807cfaabff"][self._gadgets_player[slot]] = 0;
        }
        self take_gadget(slot, self._gadgets_player[slot]);
    }
    for (eslot = 0; eslot < 3; eslot++) {
        existinggadget = self._gadgets_player[eslot];
        if (isdefined(existinggadget) && existinggadget == weapon) {
            self take_gadget(eslot, existinggadget);
        }
    }
    self._gadgets_player[slot] = weapon;
    if (!isdefined(self.var_aec4af05[slot])) {
        self.var_aec4af05[slot] = 0;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_give)) {
            foreach (on_give in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_give) {
                self thread [[ on_give ]](slot, weapon);
            }
        }
    }
    if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
        self.heroabilityname = isdefined(weapon) ? weapon.name : undefined;
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x700016aa, Offset: 0x2080
// Size: 0x12c
function take_gadget(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_take)) {
            foreach (on_take in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_take) {
                if (isdefined(on_take)) {
                    self thread [[ on_take ]](slot, weapon);
                }
            }
        }
    }
    self._gadgets_player[slot] = undefined;
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x672cbfc6, Offset: 0x21b8
// Size: 0x60c
function turn_gadget_on(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    if (weapon != self._gadgets_player[slot]) {
        return;
    }
    self.var_aec4af05[slot] = 0;
    self gadgetsetactivatetime(slot, gettime());
    self.playedgadgetsuccess = 0;
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_on)) {
            self function_2c464c28(weapon);
            var_ef2d7dfd = self function_880f27a7();
            players = util::get_active_players(self.team);
            clientnum = self getentitynumber();
            foreach (player in players) {
                player luinotifyevent(#"ability_callout", 2, var_ef2d7dfd, clientnum);
            }
            foreach (turn_on in level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_on) {
                self thread [[ turn_on ]](slot, weapon);
            }
        }
    }
    if (sessionmodeismultiplayergame()) {
        if (weapon.name == #"gadget_health_regen") {
            var_f8e6b703 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
            if (isdefined(var_f8e6b703)) {
                self match_record::inc_stat(#"lives", var_f8e6b703, #"hash_2380fc76594e930d", 1);
            }
        } else {
            self function_33644ff2(game.timepassed, weapon.name);
        }
    } else {
        self function_33644ff2(game.timepassed, weapon.name);
    }
    level notify(#"hero_gadget_activated", {#player:self, #weapon:weapon});
    self notify(#"hero_gadget_activated", {#weapon:weapon});
    if (isdefined(level.cybercom) && isdefined(level.cybercom._ability_turn_on)) {
        self thread [[ level.cybercom._ability_turn_on ]](slot, weapon);
    }
    self.pers[#"herogadgetnotified"][slot] = 0;
    xuid = int(self getxuid(1));
    if (sessionmodeismultiplayergame()) {
        mpheropowerevents = {#spawnid:getplayerspawnid(self), #gametime:function_f8d53445(), #name:self._gadgets_player[slot].name, #powerstate:"activated", #playername:self.name, #xuid:xuid};
        function_92d1707f(#"hash_2d561b2f8bbe1aac", mpheropowerevents);
    }
    if (isdefined(level.playgadgetactivate)) {
        self thread [[ level.playgadgetactivate ]](weapon);
    }
    if (weapon.gadget_type != 11) {
        if (isdefined(self.isneardeath) && self.isneardeath == 1) {
            if (isdefined(level.heroabilityactivateneardeath)) {
                self thread [[ level.heroabilityactivateneardeath ]]();
            }
        }
        self.heroabilityactivatetime = gettime();
        self.heroabilityactive = 1;
        self.heroability = weapon;
    }
    self thread ability_power::power_consume_timer_think(slot, weapon);
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0xf9f8f2d8, Offset: 0x27d0
// Size: 0x43c
function turn_gadget_off(slot, weapon) {
    if (!isdefined(self) || !isdefined(self._gadgets_player) || !isdefined(self._gadgets_player[slot])) {
        return;
    }
    self.var_aec4af05[slot] = 0;
    if (!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        return;
    }
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_off)) {
        self function_3e8bb406(0);
        foreach (turn_off in level._gadgets_level[self._gadgets_player[slot].gadget_type].turn_off) {
            self thread [[ turn_off ]](slot, weapon);
            self globallogic_score::function_61254438(weapon);
        }
    }
    if (isdefined(level.cybercom) && isdefined(level.cybercom._ability_turn_off)) {
        self thread [[ level.cybercom._ability_turn_off ]](slot, weapon);
    }
    if (weapon.gadget_type != 11) {
        self.heroabilitydectivatetime = gettime();
        self.heroabilityactive = undefined;
        self.heroability = weapon;
    }
    dead = self.health <= 0;
    if (sessionmodeismultiplayergame()) {
        if (weapon.name != #"gadget_health_regen") {
            self function_79cd8cd6(game.timepassed, weapon.name, dead, self.heavyweaponshots, self.heavyweaponhits);
        }
    } else {
        self function_79cd8cd6(game.timepassed, weapon.name, dead, self.heavyweaponshots, self.heavyweaponhits);
    }
    self notify(#"heroability_off", {#weapon:weapon});
    xuid = int(self getxuid(1));
    if (sessionmodeismultiplayergame()) {
        mpheropowerevents = {#spawnid:getplayerspawnid(self), #gametime:function_f8d53445(), #name:self._gadgets_player[slot].name, #powerstate:"expired", #playername:self.name, #xuid:xuid};
        function_92d1707f(#"hash_2d561b2f8bbe1aac", mpheropowerevents);
    }
    if (isdefined(level.oldschool) && level.oldschool) {
        self takeweapon(weapon);
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x1be09dc0, Offset: 0x2c18
// Size: 0x154
function function_50557027(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    self.var_aec4af05[slot] = 0;
    self gadgetsetactivatetime(slot, gettime());
    if (!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        return;
    }
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_on)) {
        self function_3e8bb406(0);
        foreach (deployed_on in level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_on) {
            self thread [[ deployed_on ]](slot, weapon);
        }
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x93f829cd, Offset: 0x2d78
// Size: 0x13c
function function_d5260ebe(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    self.var_aec4af05[slot] = 0;
    if (!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        return;
    }
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_off)) {
        self function_3e8bb406(0);
        foreach (deployed_off in level._gadgets_level[self._gadgets_player[slot].gadget_type].deployed_off) {
            self thread [[ deployed_off ]](slot, weapon);
        }
    }
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x1 linked
// Checksum 0xf9391d7d, Offset: 0x2ec0
// Size: 0x286
function gadget_checkheroabilitykill(attacker) {
    heroabilitystat = 0;
    if (isdefined(attacker.heroability)) {
        switch (attacker.heroability.name) {
        case #"gadget_clone":
        case #"gadget_heat_wave":
        case #"gadget_armor":
        case #"gadget_speed_burst":
            if (isdefined(attacker.heroabilityactive) || isdefined(attacker.heroabilitydectivatetime) && attacker.heroabilitydectivatetime > gettime() - 100) {
                heroabilitystat = 1;
            }
            break;
        case #"gadget_resurrect":
        case #"gadget_camo":
            if (isdefined(attacker.heroabilityactive) || isdefined(attacker.heroabilitydectivatetime) && attacker.heroabilitydectivatetime > gettime() - 6000) {
                heroabilitystat = 1;
            }
            break;
        case #"gadget_vision_pulse":
            if (isdefined(attacker.visionpulsespottedenemytime)) {
                timecutoff = gettime();
                if (attacker.visionpulsespottedenemytime + 10000 > timecutoff) {
                    for (i = 0; i < attacker.visionpulsespottedenemy.size; i++) {
                        spottedenemy = attacker.visionpulsespottedenemy[i];
                        if (spottedenemy == self) {
                            if (self.lastspawntime < attacker.visionpulsespottedenemytime) {
                                heroabilitystat = 1;
                                break;
                            }
                        }
                    }
                }
            }
        case #"gadget_combat_efficiency":
            if (isdefined(attacker._gadget_combat_efficiency) && attacker._gadget_combat_efficiency == 1) {
                heroabilitystat = 1;
                break;
            } else if (isdefined(attacker.combatefficiencylastontime) && attacker.combatefficiencylastontime > gettime() - 100) {
                heroabilitystat = 1;
                break;
            }
            break;
        }
    }
    return heroabilitystat;
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0xb9bbd4f2, Offset: 0x3150
// Size: 0x114
function gadget_flicker(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    if (!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        return;
    }
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_flicker)) {
        foreach (on_flicker in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_flicker) {
            self thread [[ on_flicker ]](slot, weapon);
        }
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0x15fac4c0, Offset: 0x3270
// Size: 0x51c
function gadget_ready(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    type = self._gadgets_player[slot].gadget_type;
    if (isdefined(type) && isdefined(level._gadgets_level[type]) && isdefined(level._gadgets_level[type].should_notify) && level._gadgets_level[type].should_notify) {
        gadget_index = getitemindexfromref(self._gadgets_player[slot].name);
        if (gadget_index > 0) {
            iteminfo = getunlockableiteminfofromindex(gadget_index, 1);
            if (iteminfo.itemgroupname === "killstreak") {
                return;
            }
            if (isdefined(iteminfo)) {
                loadoutslotname = iteminfo.loadoutslotname;
                if (isdefined(loadoutslotname) && loadoutslotname == "herogadget") {
                    self luinotifyevent(#"hero_weapon_received", 1, gadget_index);
                    self function_b552ffa9(#"hero_weapon_received", 1, gadget_index);
                }
            }
        }
    }
    if (!isdefined(level.gameended) || !level.gameended) {
        if (!self.pers[#"herogadgetnotified"][slot]) {
            self.pers[#"herogadgetnotified"][slot] = 1;
            if (isdefined(level.playgadgetready)) {
                self thread [[ level.playgadgetready ]](weapon);
            }
        }
    }
    if (sessionmodeismultiplayergame()) {
        if (weapon.name == #"gadget_health_regen") {
            var_f8e6b703 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
            if (isdefined(var_f8e6b703)) {
                self match_record::inc_stat(#"lives", var_f8e6b703, #"hash_656f3981134db095", 1);
            }
        } else {
            self function_ac24127(game.timepassed, weapon.name);
        }
    } else {
        self function_ac24127(game.timepassed, weapon.name);
    }
    xuid = int(self getxuid(1));
    if (sessionmodeismultiplayergame()) {
        mpheropowerevents = {#spawnid:getplayerspawnid(self), #gametime:function_f8d53445(), #name:self._gadgets_player[slot].name, #powerstate:"ready", #playername:self.name, #xuid:xuid};
        function_92d1707f(#"hash_2d561b2f8bbe1aac", mpheropowerevents);
    }
    if (isdefined(type) && isdefined(level._gadgets_level[type]) && isdefined(level._gadgets_level[type].on_ready)) {
        foreach (on_ready in level._gadgets_level[type].on_ready) {
            self thread [[ on_ready ]](slot, weapon);
        }
    }
}

// Namespace ability_player/ability_player
// Params 2, eflags: 0x1 linked
// Checksum 0xa13d8f50, Offset: 0x3798
// Size: 0x114
function gadget_primed(slot, weapon) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    if (!isdefined(self._gadgets_player[slot])) {
        return;
    }
    if (!isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
        return;
    }
    if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].on_primed)) {
        foreach (on_primed in level._gadgets_level[self._gadgets_player[slot].gadget_type].on_primed) {
            self thread [[ on_primed ]](slot, weapon);
        }
    }
}

// Namespace ability_player/ability_player
// Params 3, eflags: 0x1 linked
// Checksum 0xce21df03, Offset: 0x38b8
// Size: 0xfe
function tutorial_timer(weapon, var_8be5aa55, var_de825ec6) {
    assert(isdefined(var_8be5aa55) && isstring(var_8be5aa55));
    if (isdefined(var_de825ec6)) {
        tutorial_init(weapon);
        self.pers[#"ability_tutorial"][weapon].(var_8be5aa55) = gettime() + var_de825ec6 * 1000;
    }
    return isdefined(self.pers[#"ability_tutorial"][weapon].(var_8be5aa55)) && self.pers[#"ability_tutorial"][weapon].(var_8be5aa55) > gettime();
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x1 linked
// Checksum 0x6d7830e4, Offset: 0x39c0
// Size: 0x98
function tutorial_init(weapon) {
    if (!isdefined(self.pers[#"ability_tutorial"])) {
        self.pers[#"ability_tutorial"] = [];
    }
    if (!isdefined(self.pers[#"ability_tutorial"][weapon])) {
        self.pers[#"ability_tutorial"][weapon] = spawnstruct();
    }
}

// Namespace ability_player/ability_player
// Params 6, eflags: 0x0
// Checksum 0xa7346c82, Offset: 0x3a60
// Size: 0x388
function tutorial_hints(slot, weapon, var_8430d11b, var_6c65cb8d, var_eadf8864, var_be7c29a3) {
    self notify("equip_tutorial_text_" + weapon.name);
    self endon(#"disconnect", #"death", "equip_tutorial_text_" + weapon.name);
    self tutorial_init(weapon);
    while (true) {
        if (!self hasweapon(weapon)) {
            break;
        }
        currentslot = self gadgetgetslot(weapon);
        if (currentslot != slot) {
            break;
        }
        if (!self gadgetisready(slot)) {
            break;
        }
        if (self gadgetisprimed(slot)) {
            break;
        }
        if (self util::gadget_is_in_use(slot)) {
            break;
        }
        if (self isinvehicle() || self function_8bc54983() || self scene::is_igc_active() || self isplayinganimscripted()) {
            wait 5;
            continue;
        }
        if (self tutorial_timer(weapon, "recentlyUsed")) {
            wait 5;
            continue;
        }
        if (self tutorial_timer(weapon, "recentlyEquip")) {
            wait 5;
            continue;
        }
        if (self tutorial_timer(weapon, "recentlyReady")) {
            wait 5;
            continue;
        }
        if (!self tutorial_timer(weapon, "recentlyEquipText") && isdefined(var_6c65cb8d) && isdefined(var_be7c29a3) && self [[ var_be7c29a3 ]](slot, weapon)) {
            self tutorial_timer(weapon, "recentlyEquipText", 60);
            self thread [[ var_6c65cb8d ]](var_8430d11b, 0, "hide_gadget_equip_hint", 7);
            /#
                self function_374c4352(var_8430d11b);
            #/
        }
        if (!self tutorial_timer(weapon, "recentlyReadyVoice") && isdefined(var_eadf8864)) {
            self tutorial_timer(weapon, "recentlyReadyVoice", 60);
            voiceevent(var_eadf8864, self, undefined);
            /#
                self function_374c4352(var_eadf8864);
            #/
        }
        wait 5;
    }
}

// Namespace ability_player/ability_player
// Params 1, eflags: 0x1 linked
// Checksum 0x4984f208, Offset: 0x3df0
// Size: 0xcc
function function_fc4dc54(var_6fcde3b6 = 0) {
    if (!isdefined(self._gadgets_player)) {
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        if (!isdefined(self._gadgets_player[slot])) {
            continue;
        }
        gadgetweapon = self._gadgets_player[slot];
        if (ability_util::is_hero_weapon(gadgetweapon)) {
            continue;
        }
        self gadgetdeactivate(slot, gadgetweapon);
    }
    self forceoffhandend();
}

/#

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0xaafaf4c4, Offset: 0x3ec8
    // Size: 0x6c
    function function_374c4352(str) {
        if (ishash(str)) {
            str = function_9e72a96(str);
        }
        toprint = "<dev string:x38>" + str;
        println(toprint);
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0x5900fbcb, Offset: 0x3f40
    // Size: 0x3c
    function abilities_print(str) {
        toprint = "<dev string:x4f>" + str;
        println(toprint);
    }

    // Namespace ability_player/ability_player
    // Params 0, eflags: 0x0
    // Checksum 0x9ca97cdf, Offset: 0x3f88
    // Size: 0xec
    function abilities_devgui_init() {
        setdvar(#"scr_abilities_devgui_cmd", "<dev string:x64>");
        setdvar(#"scr_abilities_devgui_arg", "<dev string:x64>");
        setdvar(#"scr_abilities_devgui_player", 0);
        if (isdedicated()) {
            return;
        }
        level.abilities_devgui_base = "<dev string:x67>";
        level.abilities_devgui_player_connect = &abilities_devgui_player_connect;
        level.abilities_devgui_player_disconnect = &abilities_devgui_player_disconnect;
        level thread abilities_devgui_think();
    }

    // Namespace ability_player/ability_player
    // Params 0, eflags: 0x0
    // Checksum 0x88da8b34, Offset: 0x4080
    // Size: 0xb0
    function abilities_devgui_player_connect() {
        if (!isdefined(level.abilities_devgui_base)) {
            return;
        }
        wait 2;
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (players[i] != self) {
                continue;
            }
            thread abilities_devgui_add_player_commands(level.abilities_devgui_base, players[i].playername, i + 1);
            return;
        }
    }

    // Namespace ability_player/ability_player
    // Params 3, eflags: 0x0
    // Checksum 0xfd79c642, Offset: 0x4138
    // Size: 0x14e
    function abilities_devgui_add_player_commands(root, pname, index) {
        add_cmd_with_root = "<dev string:x7a>" + root + pname + "<dev string:x88>";
        pid = "<dev string:x64>" + index;
        menu_index = 1;
        if (isdefined(level.abilities_devgui_add_gadgets_custom)) {
            menu_index = self thread [[ level.abilities_devgui_add_gadgets_custom ]](root, pname, pid, menu_index);
            return;
        }
        util::waittill_can_add_debug_command();
        menu_index = abilities_devgui_add_gadgets(add_cmd_with_root, pid, menu_index);
        util::waittill_can_add_debug_command();
        menu_index = abilities_devgui_add_power(add_cmd_with_root, pid, menu_index);
        util::waittill_can_add_debug_command();
        menu_index = function_2e0162e9(add_cmd_with_root, pid, menu_index);
    }

    // Namespace ability_player/ability_player
    // Params 6, eflags: 0x0
    // Checksum 0x4a0089ef, Offset: 0x4290
    // Size: 0x104
    function abilities_devgui_add_player_command(root, pid, cmdname, menu_index, cmddvar, argdvar) {
        if (!isdefined(argdvar)) {
            argdvar = "<dev string:x8c>";
        }
        var_eece3d04 = "<dev string:x96>" + "<dev string:xa0>" + "<dev string:xbe>" + pid;
        var_9b1fa683 = "<dev string:xc2>" + "<dev string:xca>" + "<dev string:xbe>" + cmddvar;
        var_dc0fa12c = "<dev string:xc2>" + "<dev string:xe5>" + "<dev string:xbe>" + argdvar + "<dev string:x100>";
        util::add_queued_debug_command(root + cmdname + var_eece3d04 + var_9b1fa683 + var_dc0fa12c);
    }

    // Namespace ability_player/ability_player
    // Params 3, eflags: 0x0
    // Checksum 0x2805f421, Offset: 0x43a0
    // Size: 0x17c
    function abilities_devgui_add_power(add_cmd_with_root, pid, menu_index) {
        root = add_cmd_with_root + "<dev string:x106>" + menu_index + "<dev string:x88>";
        abilities_devgui_add_player_command(root, pid, "<dev string:x10f>", 1, "<dev string:x11c>", "<dev string:x64>");
        abilities_devgui_add_player_command(root, pid, "<dev string:x126>", 2, "<dev string:x139>", "<dev string:x64>");
        for (power = 0; power <= 1; power += 0.25) {
            abilities_devgui_add_player_command(root, pid, "<dev string:x146>" + power, 2, "<dev string:x15d>", "<dev string:x64>" + power);
            abilities_devgui_add_player_command(root, pid, "<dev string:x171>" + power, 2, "<dev string:x186>", "<dev string:x64>" + power);
        }
        menu_index++;
        return menu_index;
    }

    // Namespace ability_player/ability_player
    // Params 3, eflags: 0x0
    // Checksum 0x693f841f, Offset: 0x4528
    // Size: 0x282
    function function_2e0162e9(add_cmd_with_root, pid, menu_index) {
        if (sessionmodeiszombiesgame() || sessionmodeiswarzonegame()) {
            return;
        }
        root = add_cmd_with_root + "<dev string:x198>" + menu_index + "<dev string:x88>";
        session_mode = currentsessionmode();
        var_a2865de6 = getplayerroletemplatecount(session_mode);
        for (i = 1; i < var_a2865de6; i++) {
            var_854a6ba2 = getplayerrolecategory(i, session_mode);
            if (!isdefined(var_854a6ba2)) {
                continue;
            }
            var_d59b8ebf = getplayerrolecategoryinfo(var_854a6ba2);
            var_1a27a47a = makelocalizedstring(getcharacterdisplayname(i, session_mode));
            var_1a27a47a = strreplace(var_1a27a47a, "<dev string:x1a0>", "<dev string:x64>");
            if (var_1a27a47a == "<dev string:x1a4>") {
                var_1a27a47a = "<dev string:x1b3>";
            }
            var_eb49090f = function_9e72a96(function_b14806c6(i, session_mode));
            var_4f6b7b98 = var_1a27a47a + "<dev string:x1c2>" + (isdefined(var_eb49090f) ? var_eb49090f : "<dev string:x1c8>") + "<dev string:x1cf>";
            if (!isdefined(var_d59b8ebf.enabled) || var_d59b8ebf.enabled == 0) {
                var_4f6b7b98 += "<dev string:x1d3>";
            }
            abilities_devgui_add_player_command(root, pid, var_4f6b7b98, i, "<dev string:x1e1>", i);
        }
        menu_index++;
        return menu_index;
    }

    // Namespace ability_player/ability_player
    // Params 3, eflags: 0x0
    // Checksum 0x9bba2972, Offset: 0x47b8
    // Size: 0xec
    function function_2ced294(&a_weapons, &a_array, weaponname) {
        weapon = getweapon(weaponname);
        if (!isdefined(weapon)) {
            return;
        }
        if (!isinarray(a_weapons, weapon)) {
            return;
        }
        if (!isdefined(a_array)) {
            a_array = [];
        } else if (!isarray(a_array)) {
            a_array = array(a_array);
        }
        if (!isinarray(a_array, weapon)) {
            a_array[a_array.size] = weapon;
        }
        arrayremovevalue(a_weapons, weapon);
    }

    // Namespace ability_player/ability_player
    // Params 4, eflags: 0x0
    // Checksum 0x44a899d5, Offset: 0x48b0
    // Size: 0x166
    function function_60b82b68(&a_weapons, &a_equipment, &var_c5b1a23e, &a_ultimates) {
        if (sessionmodeiszombiesgame()) {
            return;
        }
        session_mode = currentsessionmode();
        var_a2865de6 = getplayerroletemplatecount(session_mode);
        for (i = 1; i < var_a2865de6; i++) {
            fields = function_934db9a0(i, session_mode);
            if (!isdefined(fields)) {
                continue;
            }
            if (isdefined(fields.primaryequipment)) {
                function_2ced294(a_weapons, a_equipment, fields.primaryequipment);
            }
            if (isdefined(fields.var_c21d61e9)) {
                function_2ced294(a_weapons, var_c5b1a23e, fields.var_c21d61e9);
            }
            if (isdefined(fields.ultimateweapon)) {
                function_2ced294(a_weapons, a_ultimates, fields.ultimateweapon);
            }
        }
    }

    // Namespace ability_player/ability_player
    // Params 2, eflags: 0x0
    // Checksum 0x5ea19e9b, Offset: 0x4a20
    // Size: 0xc6
    function function_1c3e8791(&a_weapons, &var_dd06e779) {
        for (i = 0; i < 1024; i++) {
            iteminfo = getunlockableiteminfofromindex(i, 0);
            if (isdefined(iteminfo)) {
                reference_s = iteminfo.namehash;
                loadoutslotname = iteminfo.loadoutslotname;
                if (loadoutslotname == "<dev string:x1f2>") {
                    function_2ced294(a_weapons, var_dd06e779, reference_s);
                }
            }
        }
    }

    // Namespace ability_player/ability_player
    // Params 3, eflags: 0x0
    // Checksum 0x8f93a2d2, Offset: 0x4af0
    // Size: 0x5f8
    function abilities_devgui_add_gadgets(add_cmd_with_root, pid, menu_index) {
        a_weapons = enumerateweapons("<dev string:x203>");
        a_gadgetweapons = [];
        for (i = 0; i < a_weapons.size; i++) {
            if (isdefined(a_weapons[i]) && a_weapons[i].isgadget) {
                if (!isdefined(a_gadgetweapons)) {
                    a_gadgetweapons = [];
                } else if (!isarray(a_gadgetweapons)) {
                    a_gadgetweapons = array(a_gadgetweapons);
                }
                if (!isinarray(a_gadgetweapons, a_weapons[i])) {
                    a_gadgetweapons[a_gadgetweapons.size] = a_weapons[i];
                }
            }
        }
        a_equipment = [];
        var_c5b1a23e = [];
        a_ultimates = [];
        function_60b82b68(a_gadgetweapons, a_equipment, var_c5b1a23e, a_ultimates);
        var_dd06e779 = [];
        function_1c3e8791(a_gadgetweapons, var_dd06e779);
        var_ef060ee3 = [];
        var_cdbfed45 = [];
        var_7e367d09 = [];
        var_4557f227 = [];
        a_heal = [];
        for (i = 0; i < a_gadgetweapons.size; i++) {
            if (a_gadgetweapons[i].gadget_type == 11 && a_gadgetweapons[i].issignatureweapon) {
                if (!isdefined(var_ef060ee3)) {
                    var_ef060ee3 = [];
                } else if (!isarray(var_ef060ee3)) {
                    var_ef060ee3 = array(var_ef060ee3);
                }
                if (!isinarray(var_ef060ee3, a_gadgetweapons[i])) {
                    var_ef060ee3[var_ef060ee3.size] = a_gadgetweapons[i];
                }
                continue;
            }
            if (a_gadgetweapons[i].gadget_type == 11) {
                if (!isdefined(var_cdbfed45)) {
                    var_cdbfed45 = [];
                } else if (!isarray(var_cdbfed45)) {
                    var_cdbfed45 = array(var_cdbfed45);
                }
                if (!isinarray(var_cdbfed45, a_gadgetweapons[i])) {
                    var_cdbfed45[var_cdbfed45.size] = a_gadgetweapons[i];
                }
                continue;
            }
            if (a_gadgetweapons[i].isheavyweapon) {
                if (!isdefined(var_7e367d09)) {
                    var_7e367d09 = [];
                } else if (!isarray(var_7e367d09)) {
                    var_7e367d09 = array(var_7e367d09);
                }
                if (!isinarray(var_7e367d09, a_gadgetweapons[i])) {
                    var_7e367d09[var_7e367d09.size] = a_gadgetweapons[i];
                }
                continue;
            }
            if (a_gadgetweapons[i].gadget_type == 23) {
                if (!isdefined(a_heal)) {
                    a_heal = [];
                } else if (!isarray(a_heal)) {
                    a_heal = array(a_heal);
                }
                if (!isinarray(a_heal, a_gadgetweapons[i])) {
                    a_heal[a_heal.size] = a_gadgetweapons[i];
                }
                continue;
            }
            if (!isdefined(var_4557f227)) {
                var_4557f227 = [];
            } else if (!isarray(var_4557f227)) {
                var_4557f227 = array(var_4557f227);
            }
            if (!isinarray(var_4557f227, a_gadgetweapons[i])) {
                var_4557f227[var_4557f227.size] = a_gadgetweapons[i];
            }
        }
        function_174037fe(add_cmd_with_root, pid, a_equipment, "<dev string:x20c>", menu_index);
        menu_index++;
        function_76032a31(add_cmd_with_root, pid, a_heal, "<dev string:x21d>", menu_index);
        menu_index++;
        function_a40d04ca(add_cmd_with_root, pid, var_c5b1a23e, "<dev string:x236>", menu_index);
        menu_index++;
        function_174037fe(add_cmd_with_root, pid, var_dd06e779, "<dev string:x247>", menu_index);
        menu_index++;
        function_174037fe(add_cmd_with_root, pid, var_4557f227, "<dev string:x25b>", menu_index);
        menu_index++;
        function_a40d04ca(add_cmd_with_root, pid, var_ef060ee3, "<dev string:x275>", menu_index);
        menu_index++;
        return menu_index;
    }

    // Namespace ability_player/ability_player
    // Params 5, eflags: 0x0
    // Checksum 0xcb8a6de1, Offset: 0x50f0
    // Size: 0xbe
    function function_174037fe(root, pid, a_weapons, weapon_type, menu_index) {
        if (isdefined(a_weapons)) {
            player_devgui_root = root + weapon_type + "<dev string:x88>";
            for (i = 0; i < a_weapons.size; i++) {
                function_b04fbf27(player_devgui_root, pid, getweaponname(a_weapons[i]), i + 1);
            }
        }
    }

    // Namespace ability_player/ability_player
    // Params 5, eflags: 0x0
    // Checksum 0xf8d18c25, Offset: 0x51b8
    // Size: 0xbe
    function function_76032a31(root, pid, a_weapons, weapon_type, menu_index) {
        if (isdefined(a_weapons)) {
            player_devgui_root = root + weapon_type + "<dev string:x88>";
            for (i = 0; i < a_weapons.size; i++) {
                function_50543efb(player_devgui_root, pid, getweaponname(a_weapons[i]), i + 1);
            }
        }
    }

    // Namespace ability_player/ability_player
    // Params 5, eflags: 0x0
    // Checksum 0xbce880a7, Offset: 0x5280
    // Size: 0xbe
    function function_a40d04ca(root, pid, a_weapons, weapon_type, menu_index) {
        if (isdefined(a_weapons)) {
            player_devgui_root = root + weapon_type + "<dev string:x88>";
            for (i = 0; i < a_weapons.size; i++) {
                function_90502d72(player_devgui_root, pid, getweaponname(a_weapons[i]), i + 1);
            }
        }
    }

    // Namespace ability_player/ability_player
    // Params 4, eflags: 0x0
    // Checksum 0xdfc7e4b7, Offset: 0x5348
    // Size: 0xac
    function function_b04fbf27(root, pid, weap_name, cmdindex) {
        util::add_queued_debug_command(root + weap_name + "<dev string:x96>" + "<dev string:xa0>" + "<dev string:xbe>" + pid + "<dev string:xc2>" + "<dev string:xca>" + "<dev string:xbe>" + "<dev string:x28f>" + "<dev string:xc2>" + "<dev string:xe5>" + "<dev string:xbe>" + weap_name + "<dev string:x100>");
    }

    // Namespace ability_player/ability_player
    // Params 4, eflags: 0x0
    // Checksum 0x4e3032be, Offset: 0x5400
    // Size: 0xac
    function function_50543efb(root, pid, weap_name, cmdindex) {
        util::add_queued_debug_command(root + weap_name + "<dev string:x96>" + "<dev string:xa0>" + "<dev string:xbe>" + pid + "<dev string:xc2>" + "<dev string:xca>" + "<dev string:xbe>" + "<dev string:x2ab>" + "<dev string:xc2>" + "<dev string:xe5>" + "<dev string:xbe>" + weap_name + "<dev string:x100>");
    }

    // Namespace ability_player/ability_player
    // Params 4, eflags: 0x0
    // Checksum 0x7bc91ee0, Offset: 0x54b8
    // Size: 0xac
    function function_90502d72(root, pid, weap_name, cmdindex) {
        util::add_queued_debug_command(root + weap_name + "<dev string:x96>" + "<dev string:xa0>" + "<dev string:xbe>" + pid + "<dev string:xc2>" + "<dev string:xca>" + "<dev string:xbe>" + "<dev string:x2c9>" + "<dev string:xc2>" + "<dev string:xe5>" + "<dev string:xbe>" + weap_name + "<dev string:x100>");
    }

    // Namespace ability_player/ability_player
    // Params 0, eflags: 0x0
    // Checksum 0xd37ba103, Offset: 0x5570
    // Size: 0x5c
    function abilities_devgui_player_disconnect() {
        if (!isdefined(level.abilities_devgui_base)) {
            return;
        }
        remove_cmd_with_root = "<dev string:x2e5>" + level.abilities_devgui_base + self.playername + "<dev string:x100>";
        util::add_queued_debug_command(remove_cmd_with_root);
    }

    // Namespace ability_player/ability_player
    // Params 0, eflags: 0x0
    // Checksum 0x5833d8b3, Offset: 0x55d8
    // Size: 0x368
    function abilities_devgui_think() {
        setdvar(#"hash_67d528f29bfc7c97", "<dev string:x64>");
        for (;;) {
            cmd = "<dev string:x1e1>";
            arg = getdvarstring(#"hash_67d528f29bfc7c97", "<dev string:x64>");
            if (arg == "<dev string:x64>") {
                cmd = getdvarstring(#"scr_abilities_devgui_cmd");
                arg = getdvarstring(#"scr_abilities_devgui_arg");
            }
            if (cmd == "<dev string:x64>") {
                waitframe(1);
                continue;
            }
            switch (cmd) {
            case #"power_f":
                abilities_devgui_handle_player_command(cmd, &abilities_devgui_power_fill);
                break;
            case #"power_t_af":
                abilities_devgui_handle_player_command(cmd, &abilities_devgui_power_toggle_auto_fill);
                break;
            case #"ability_power_f":
                abilities_devgui_handle_player_command(cmd, &function_3db3dc4f, arg);
                break;
            case #"hash_5b8a32e219f9ae64":
                abilities_devgui_handle_player_command(cmd, &function_626f2cd1, arg);
                break;
            case #"hash_2d2f6f2bb98a38b3":
                abilities_devgui_handle_player_command(cmd, &function_9a0f80b1, arg);
                break;
            case #"hash_5ddbad8870b98e93":
                abilities_devgui_handle_player_command(cmd, &function_ce4e80a7, arg);
                break;
            case #"hash_5515835378aa90c8":
                abilities_devgui_handle_player_command(cmd, &function_4f50aea3, arg);
                break;
            case #"hash_67d528f29bfc7c97":
                abilities_devgui_handle_player_command(cmd, &function_b4f43681, arg);
                break;
            case 0:
                break;
            default:
                break;
            }
            setdvar(#"hash_67d528f29bfc7c97", "<dev string:x64>");
            setdvar(#"scr_abilities_devgui_cmd", "<dev string:x64>");
            setdvar(#"scr_abilities_devgui_player", "<dev string:x2f6>");
            wait 0.5;
        }
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0x9fe7e0a, Offset: 0x5948
    // Size: 0x114
    function function_c94ba490(weapon) {
        self notify(#"gadget_devgui_give");
        self giveweapon(weapon);
        waitframe(1);
        slot = self gadgetgetslot(weapon);
        self gadgetpowerreset(slot, 1);
        self gadgetpowerset(slot, 100);
        self gadgetcharging(slot, 0);
        if (isbot(self)) {
            self bot_action::function_ee2eaccc(slot);
        }
        self iprintlnbold(getweaponname(weapon));
    }

    // Namespace ability_player/ability_player
    // Params 3, eflags: 0x0
    // Checksum 0xf0e6dd05, Offset: 0x5a68
    // Size: 0xe6
    function abilities_devgui_give(weapon_name, slot, var_1d6918cf) {
        level.devgui_giving_abilities = 1;
        if (isdefined(self._gadgets_player[slot]) && self hasweapon(self._gadgets_player[slot])) {
            self gadgetpowerreset(slot, 1);
            self takeweapon(self._gadgets_player[slot]);
        }
        weapon = getweapon(weapon_name);
        self thread function_c94ba490(weapon);
        level.devgui_giving_abilities = undefined;
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0x630dc8b0, Offset: 0x5b58
    // Size: 0xc4
    function function_4f50aea3(weapon_name) {
        if (isdefined(level.var_124446e) && isarray(level.var_124446e) && isdefined(level.var_124446e[weapon_name])) {
            self [[ level.var_124446e[weapon_name] ]](self, 2);
            return;
        }
        if (isdefined(level.var_124446e)) {
            self [[ level.var_124446e ]](weapon_name, 2);
            return;
        }
        self abilities_devgui_give(weapon_name, 2);
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0xb0256fe1, Offset: 0x5c28
    // Size: 0x74
    function function_ce4e80a7(weapon_name) {
        if (isdefined(level.var_c49b362f) && isdefined(level.var_c49b362f[weapon_name])) {
            self [[ level.var_c49b362f[weapon_name] ]](self, 1);
            return;
        }
        self abilities_devgui_give(weapon_name, 1);
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0x74fa9703, Offset: 0x5ca8
    // Size: 0x74
    function function_9a0f80b1(weapon_name) {
        if (isdefined(level.var_fdfc376e) && isdefined(level.var_fdfc376e[weapon_name])) {
            self [[ level.var_fdfc376e[weapon_name] ]](self, 0);
            return;
        }
        self abilities_devgui_give(weapon_name, 0);
    }

    // Namespace ability_player/ability_player
    // Params 2, eflags: 0x0
    // Checksum 0x8570c495, Offset: 0x5d28
    // Size: 0x134
    function function_f3fa2789(offhandslot, ability_list) {
        if (!isdefined(ability_list)) {
            ability_list = level.var_29d4fb5b;
        }
        if (!isdefined(ability_list)) {
            return;
        }
        weapon = undefined;
        if (isdefined(self._gadgets_player[offhandslot])) {
            weapon = self._gadgets_player[offhandslot];
        }
        weapon_name = undefined;
        if (isdefined(weapon)) {
            var_29bc3853 = 0;
            for (i = 0; i < ability_list.size; i++) {
                ability_name = ability_list[i];
                if (weapon.name == ability_name) {
                    var_29bc3853 = i;
                    break;
                }
            }
            var_29bc3853 = (var_29bc3853 + 1) % ability_list.size;
            weapon_name = ability_list[var_29bc3853];
        }
        if (2 == offhandslot) {
            self function_4f50aea3(weapon_name);
        }
    }

    // Namespace ability_player/ability_player
    // Params 3, eflags: 0x0
    // Checksum 0xc3708a52, Offset: 0x5e68
    // Size: 0xe4
    function abilities_devgui_handle_player_command(cmd, playercallback, pcb_param) {
        pid = getdvarint(#"scr_abilities_devgui_player", 0);
        if (pid > 0) {
            player = getplayers()[pid - 1];
            if (isdefined(player)) {
                if (isdefined(pcb_param)) {
                    player thread [[ playercallback ]](pcb_param);
                } else {
                    player thread [[ playercallback ]]();
                }
            }
            return;
        }
        array::thread_all(getplayers(), playercallback, pcb_param);
    }

    // Namespace ability_player/ability_player
    // Params 0, eflags: 0x0
    // Checksum 0x608e1b25, Offset: 0x5f58
    // Size: 0xae
    function abilities_devgui_power_fill() {
        if (!isdefined(self) || !isdefined(self._gadgets_player)) {
            return;
        }
        for (i = 0; i < 3; i++) {
            if (isdefined(self._gadgets_player[i]) && self hasweapon(self._gadgets_player[i])) {
                self gadgetpowerset(i, self._gadgets_player[i].gadget_powermax);
            }
        }
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0x593fd4bb, Offset: 0x6010
    // Size: 0x9c
    function function_626f2cd1(var_44b235) {
        if (!isdefined(self) || !isdefined(self._gadgets_player)) {
            return;
        }
        if (isdefined(self._gadgets_player[0]) && self hasweapon(self._gadgets_player[0])) {
            self gadgetpowerset(0, self._gadgets_player[0].gadget_powermax * float(var_44b235));
        }
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0x6cdbcb0a, Offset: 0x60b8
    // Size: 0xac
    function function_3db3dc4f(var_44b235) {
        if (!isdefined(self) || !isdefined(self._gadgets_player)) {
            return;
        }
        if (isdefined(self._gadgets_player[2]) && self hasweapon(self._gadgets_player[2])) {
            self gadgetpowerset(2, self._gadgets_player[2].gadget_powermax * float(var_44b235));
        }
    }

    // Namespace ability_player/ability_player
    // Params 0, eflags: 0x0
    // Checksum 0xb9b96759, Offset: 0x6170
    // Size: 0x5c
    function abilities_devgui_power_toggle_auto_fill() {
        if (!isdefined(self) || !isdefined(self._gadgets_player)) {
            return;
        }
        self.abilities_devgui_power_toggle_auto_fill = !(isdefined(self.abilities_devgui_power_toggle_auto_fill) && self.abilities_devgui_power_toggle_auto_fill);
        self thread abilities_devgui_power_toggle_auto_fill_think();
    }

    // Namespace ability_player/ability_player
    // Params 0, eflags: 0x0
    // Checksum 0xac18b77a, Offset: 0x61d8
    // Size: 0x178
    function abilities_devgui_power_toggle_auto_fill_think() {
        self endon(#"disconnect");
        self notify(#"auto_fill_think");
        self endon(#"auto_fill_think");
        for (;;) {
            if (!isdefined(self) || !isdefined(self._gadgets_player)) {
                return;
            }
            if (!(isdefined(self.abilities_devgui_power_toggle_auto_fill) && self.abilities_devgui_power_toggle_auto_fill)) {
                return;
            }
            for (i = 0; i < 3; i++) {
                if (isdefined(self._gadgets_player[i]) && self hasweapon(self._gadgets_player[i])) {
                    n_power = self gadgetpowerget(i);
                    if (!self util::gadget_is_in_use(i) && !self function_36dfc05f(i) && n_power < self._gadgets_player[i].gadget_powermax) {
                        self gadgetpowerset(i, self._gadgets_player[i].gadget_powermax);
                    }
                }
            }
            wait 1;
        }
    }

    // Namespace ability_player/ability_player
    // Params 1, eflags: 0x0
    // Checksum 0xb7e57a02, Offset: 0x6358
    // Size: 0x378
    function function_b4f43681(var_a5c8eb94) {
        if (sessionmodeiszombiesgame()) {
            return;
        }
        if (self isinmovemode("<dev string:x2fb>")) {
            adddebugcommand("<dev string:x2fb>");
            wait 0.5;
        }
        if (self isinmovemode("<dev string:x301>")) {
            adddebugcommand("<dev string:x301>");
            wait 0.5;
        }
        if (var_a5c8eb94 == "<dev string:x30a>") {
            startindex = self player_role::get();
            index = startindex;
            do {
                index += 1;
                if (index == startindex) {
                    return;
                }
                if (index >= getplayerroletemplatecount(currentsessionmode())) {
                    index = 0;
                }
            } while (!self player_role::is_valid(index));
        } else if (var_a5c8eb94 == "<dev string:x30e>") {
            startindex = self player_role::get();
            index = startindex;
            do {
                index -= 1;
                if (index == startindex) {
                    return;
                }
                if (index == 0) {
                    index = getplayerroletemplatecount(currentsessionmode());
                }
            } while (!self player_role::is_valid(index));
        } else {
            index = int(var_a5c8eb94);
        }
        self function_c9b950e3();
        self function_c2d9d3e1();
        self player_role::set(index);
        if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
            spawnselect = level.spawnselectenabled;
            level.spawnselectenabled = 0;
            if (level.numlives) {
                self.pers[#"lives"]++;
            }
            self suicide("<dev string:x312>");
            waitframe(1);
            if (isdefined(self)) {
                self luinotifyevent(#"hash_2dddf8559f5b304d", 1, 1);
            }
            level.spawnselectenabled = spawnselect;
            return;
        }
        if (sessionmodeiscampaigngame()) {
            if (isdefined(level.var_86734d48)) {
                self thread [[ level.var_86734d48 ]](self.team, self.curclass);
            }
        }
    }

#/
