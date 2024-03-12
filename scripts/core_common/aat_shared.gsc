// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace aat;

// Namespace aat/aat_shared
// Params 0, eflags: 0x2
// Checksum 0xee0bfca7, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"aat", &__init__, undefined, undefined);
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x4
// Checksum 0x670565d6, Offset: 0x188
// Size: 0x1d4
function private __init__() {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    level.aat_initializing = 1;
    level.aat = [];
    level.aat[#"none"] = spawnstruct();
    level.aat[#"none"].name = "none";
    level.aat_reroll = [];
    level.var_bdba6ee8 = [];
    callback::on_connect(&on_player_connect);
    callback::function_33f0ddd3(&function_33f0ddd3);
    spawners = getspawnerarray();
    foreach (spawner in spawners) {
        spawner spawner::add_spawn_function(&aat_cooldown_init);
    }
    level.aat_exemptions = [];
    callback::on_finalize_initialization(&finalize_clientfields);
    /#
        level thread setup_devgui();
    #/
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x4
// Checksum 0x3feb439e, Offset: 0x368
// Size: 0xf8
function private on_player_connect() {
    self.aat = [];
    self.aat_cooldown_start = [];
    if (!isdefined(self.var_b01de37)) {
        self.var_b01de37 = [];
    } else if (!isarray(self.var_b01de37)) {
        self.var_b01de37 = array(self.var_b01de37);
    }
    foreach (key, v in level.aat) {
        self.aat_cooldown_start[key] = 0;
    }
    self thread watch_weapon_changes();
    /#
    #/
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x4
// Checksum 0xa7b81afc, Offset: 0x468
// Size: 0x8c
function private function_33f0ddd3(s_event) {
    if (s_event.event === "take_weapon" && isdefined(s_event.weapon)) {
        weapon = function_702fb333(s_event.weapon);
        if (isdefined(self.aat[weapon])) {
            self remove(weapon);
        }
    }
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x4
// Checksum 0x25be2dda, Offset: 0x500
// Size: 0x174
function private setup_devgui() {
    /#
        waittillframeend();
        setdvar(#"aat_acquire_devgui", "<unknown string>");
        aat_devgui_base = "<unknown string>";
        foreach (key, v in level.aat) {
            if (key != "<unknown string>") {
                name = function_9e72a96(key);
                adddebugcommand(aat_devgui_base + name + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "<unknown string>");
            }
        }
        adddebugcommand(aat_devgui_base + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>");
        level thread aat_devgui_think();
    #/
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x4
// Checksum 0xe4af2b33, Offset: 0x680
// Size: 0x170
function private aat_devgui_think() {
    /#
        for (;;) {
            aat_name = getdvarstring(#"aat_acquire_devgui");
            if (aat_name != "<unknown string>") {
                for (i = 0; i < level.players.size; i++) {
                    if (aat_name == "<unknown string>") {
                        level.players[i] thread remove(level.players[i] getcurrentweapon());
                    } else {
                        level.players[i] thread acquire(level.players[i] getcurrentweapon(), aat_name);
                    }
                    level.players[i] thread aat_set_debug_text(aat_name, 0, 0, 0);
                }
            }
            setdvar(#"aat_acquire_devgui", "<unknown string>");
            wait(0.5);
        }
    #/
}

// Namespace aat/aat_shared
// Params 4, eflags: 0x4
// Checksum 0x5a9826ca, Offset: 0x7f8
// Size: 0x202
function private aat_set_debug_text(name, success, success_reroll, fail) {
    /#
        self notify(#"aat_set_debug_text_thread");
        self endon(#"aat_set_debug_text_thread", #"disconnect");
        if (!isdefined(self.aat_debug_text)) {
            return;
        }
        percentage = "<unknown string>";
        if (isdefined(level.aat[name]) && name != "<unknown string>") {
            percentage = level.aat[name].percentage;
        }
        self.aat_debug_text fadeovertime(0.05);
        self.aat_debug_text.alpha = 1;
        self.aat_debug_text settext("<unknown string>" + name + "<unknown string>" + percentage);
        if (success) {
            self.aat_debug_text.color = (0, 1, 0);
        } else if (success_reroll) {
            self.aat_debug_text.color = vectorscale((1, 0, 1), 0.8);
        } else if (fail) {
            self.aat_debug_text.color = (1, 0, 0);
        } else {
            self.aat_debug_text.color = (1, 1, 1);
        }
        wait(1);
        self.aat_debug_text fadeovertime(1);
        self.aat_debug_text.color = (1, 1, 1);
        if ("<unknown string>" == name) {
            self.aat_debug_text.alpha = 0;
        }
    #/
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x4
// Checksum 0xabda58d5, Offset: 0xa08
// Size: 0x82
function private aat_cooldown_init() {
    self.aat_cooldown_start = [];
    foreach (key, v in level.aat) {
        self.aat_cooldown_start[key] = 0;
    }
}

// Namespace aat/aat_shared
// Params 15, eflags: 0x0
// Checksum 0x9c197a6a, Offset: 0xa98
// Size: 0x100
function aat_vehicle_damage_monitor(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    willbekilled = self.health - idamage <= 0;
    if (isdefined(level.aat_in_use) && level.aat_in_use) {
        self thread aat_response(willbekilled, einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, vsurfacenormal);
    }
    return idamage;
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0x2749f1d7, Offset: 0xba0
// Size: 0x6e
function function_3895d220(weapon) {
    if (isdefined(weapon)) {
        if (weapon.isaltmode) {
            weapon = weapon.altweapon;
        }
        if (weapon.inventorytype == "dwlefthand") {
            weapon = weapon.dualwieldweapon;
        }
        weapon = weapon.rootweapon;
    }
    return weapon;
}

// Namespace aat/aat_shared
// Params d, eflags: 0x0
// Checksum 0x762ed1e9, Offset: 0xc18
// Size: 0x6dc
function aat_response(death, inflictor, attacker, damage, flags, mod, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (!isplayer(attacker) || !isdefined(attacker.aat) || !isdefined(weapon)) {
        return;
    }
    if (mod != "MOD_PISTOL_BULLET" && mod != "MOD_RIFLE_BULLET" && mod != "MOD_GRENADE" && mod != "MOD_PROJECTILE" && mod != "MOD_EXPLOSIVE" && mod != "MOD_IMPACT" && (mod != "MOD_MELEE" || !(isdefined(level.var_9d1d502c) && level.var_9d1d502c))) {
        return;
    }
    name = attacker.aat[function_702fb333(weapon)];
    if (!isdefined(name)) {
        return;
    }
    if (isdefined(death) && death && !level.aat[name].occurs_on_death) {
        return;
    }
    if (!isdefined(self.archetype)) {
        return;
    }
    if (isdefined(self.var_dd6fe31f) && self.var_dd6fe31f) {
        return;
    }
    if (isdefined(self.var_69a981e6) && self.var_69a981e6) {
        return;
    }
    if (isdefined(self.aat_turned) && self.aat_turned) {
        return;
    }
    if (isdefined(level.aat[name].immune_trigger[self.archetype]) && level.aat[name].immune_trigger[self.archetype]) {
        return;
    }
    now = float(gettime()) / 1000;
    if (isdefined(self.aat_cooldown_start) && now <= self.aat_cooldown_start[name] + level.aat[name].cooldown_time_entity) {
        return;
    }
    if (now <= attacker.aat_cooldown_start[name] + level.aat[name].cooldown_time_attacker) {
        return;
    }
    if (now <= level.aat[name].cooldown_time_global_start + level.aat[name].cooldown_time_global) {
        return;
    }
    if (isdefined(level.aat[name].validation_func)) {
        if (![[ level.aat[name].validation_func ]]()) {
            return;
        }
    }
    success = 0;
    reroll_icon = undefined;
    percentage = level.aat[name].percentage;
    if (isdefined(level.var_bdba6ee8[weapon])) {
        if (level.var_bdba6ee8[weapon] < percentage) {
            percentage = level.var_bdba6ee8[weapon];
        }
    }
    /#
        aat_percentage_override = getdvarfloat(#"scr_aat_percentage_override", 0);
        if (aat_percentage_override > 0) {
            percentage = aat_percentage_override;
        }
    #/
    if (percentage >= randomfloat(1)) {
        success = 1;
        /#
            attacker thread aat_set_debug_text(name, 1, 0, 0);
        #/
    }
    if (!success) {
        keys = getarraykeys(level.aat_reroll);
        keys = array::randomize(keys);
        foreach (key in keys) {
            if (attacker [[ level.aat_reroll[key].active_func ]]()) {
                for (i = 0; i < level.aat_reroll[key].count; i++) {
                    if (percentage >= randomfloat(1)) {
                        success = 1;
                        reroll_icon = level.aat_reroll[key].damage_feedback_icon;
                        /#
                            attacker thread aat_set_debug_text(name, 0, 1, 0);
                        #/
                        break;
                    }
                }
            }
            if (success) {
                break;
            }
        }
    }
    if (!success) {
        /#
            attacker thread aat_set_debug_text(name, 0, 0, 1);
        #/
        return;
    }
    level.aat[name].cooldown_time_global_start = now;
    attacker.aat_cooldown_start[name] = now;
    self thread [[ level.aat[name].result_func ]](death, attacker, mod, weapon);
    if (isplayer(attacker)) {
        attacker playlocalsound(level.aat[name].damage_feedback_sound);
    }
}

// Namespace aat/aat_shared
// Params 11, eflags: 0x0
// Checksum 0xc6b5d86d, Offset: 0x1300
// Size: 0x61a
function register(name, percentage, cooldown_time_entity, cooldown_time_attacker, cooldown_time_global, occurs_on_death, result_func, damage_feedback_icon, damage_feedback_sound, validation_func, catalyst) {
    /#
        assert(isdefined(level.aat_initializing) && level.aat_initializing, "<unknown string>");
    #/
    /#
        assert(isdefined(name), "<unknown string>");
    #/
    /#
        assert("<unknown string>" != name, "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    /#
        assert(!isdefined(level.aat[name]), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(percentage), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(0 <= percentage && 1 > percentage, "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(cooldown_time_entity), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(0 <= cooldown_time_entity, "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(cooldown_time_entity), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(0 <= cooldown_time_entity, "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(cooldown_time_global), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(0 <= cooldown_time_global, "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(occurs_on_death), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(result_func), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(damage_feedback_icon), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isstring(damage_feedback_icon), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(damage_feedback_sound), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isstring(damage_feedback_sound), "<unknown string>" + name + "<unknown string>");
    #/
    level.aat[name] = spawnstruct();
    level.aat[name].name = name;
    level.aat[name].hash_id = stathash(name);
    level.aat[name].percentage = percentage;
    level.aat[name].cooldown_time_entity = cooldown_time_entity;
    level.aat[name].cooldown_time_attacker = cooldown_time_attacker;
    level.aat[name].cooldown_time_global = cooldown_time_global;
    level.aat[name].cooldown_time_global_start = 0;
    level.aat[name].occurs_on_death = occurs_on_death;
    level.aat[name].result_func = result_func;
    level.aat[name].damage_feedback_icon = damage_feedback_icon;
    level.aat[name].damage_feedback_sound = damage_feedback_sound;
    level.aat[name].validation_func = validation_func;
    level.aat[name].immune_trigger = [];
    level.aat[name].immune_result_direct = [];
    level.aat[name].immune_result_indirect = [];
    if (isdefined(catalyst)) {
        level.aat[name].catalyst = catalyst;
    }
}

// Namespace aat/aat_shared
// Params 5, eflags: 0x0
// Checksum 0xcf2d2ae0, Offset: 0x1928
// Size: 0x1f6
function register_immunity(name, archetype, immune_trigger, immune_result_direct, immune_result_indirect) {
    while (level.aat_initializing !== 0) {
        waitframe(1);
    }
    /#
        assert(isdefined(name), "<unknown string>");
    #/
    /#
        assert(isdefined(archetype), "<unknown string>");
    #/
    /#
        assert(isdefined(immune_trigger), "<unknown string>");
    #/
    /#
        assert(isdefined(immune_result_direct), "<unknown string>");
    #/
    /#
        assert(isdefined(immune_result_indirect), "<unknown string>");
    #/
    if (!isdefined(level.aat[name].immune_trigger)) {
        level.aat[name].immune_trigger = [];
    }
    if (!isdefined(level.aat[name].immune_result_direct)) {
        level.aat[name].immune_result_direct = [];
    }
    if (!isdefined(level.aat[name].immune_result_indirect)) {
        level.aat[name].immune_result_indirect = [];
    }
    level.aat[name].immune_trigger[archetype] = immune_trigger;
    level.aat[name].immune_result_direct[archetype] = immune_result_direct;
    level.aat[name].immune_result_indirect[archetype] = immune_result_indirect;
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x0
// Checksum 0x70bdb19, Offset: 0x1b28
// Size: 0x172
function finalize_clientfields() {
    /#
        println("<unknown string>");
    #/
    if (level.aat.size > 1) {
        array::alphabetize(level.aat);
        i = 0;
        foreach (aat in level.aat) {
            aat.clientfield_index = i;
            i++;
            /#
                println("<unknown string>" + aat.name);
            #/
        }
        n_bits = getminbitcountfornum(level.aat.size - 1);
        clientfield::register("toplayer", "aat_current", 1, n_bits, "int");
    }
    level.aat_initializing = 0;
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0x4dc0dd99, Offset: 0x1ca8
// Size: 0x3e
function register_aat_exemption(weapon) {
    weapon = function_702fb333(weapon);
    level.aat_exemptions[weapon] = 1;
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0x36085a03, Offset: 0x1cf0
// Size: 0x36
function is_exempt_weapon(weapon) {
    weapon = function_702fb333(weapon);
    return isdefined(level.aat_exemptions[weapon]);
}

// Namespace aat/aat_shared
// Params 4, eflags: 0x0
// Checksum 0xca71f9f9, Offset: 0x1d30
// Size: 0x25e
function register_reroll(name, count, active_func, damage_feedback_icon) {
    /#
        assert(isdefined(name), "<unknown string>");
    #/
    /#
        assert("<unknown string>" != name, "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    /#
        assert(!isdefined(level.aat[name]), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(count), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(0 < count, "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(active_func), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isdefined(damage_feedback_icon), "<unknown string>" + name + "<unknown string>");
    #/
    /#
        assert(isstring(damage_feedback_icon), "<unknown string>" + name + "<unknown string>");
    #/
    level.aat_reroll[name] = spawnstruct();
    level.aat_reroll[name].name = name;
    level.aat_reroll[name].count = count;
    level.aat_reroll[name].active_func = active_func;
    level.aat_reroll[name].damage_feedback_icon = damage_feedback_icon;
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0x4eecc1a9, Offset: 0x1f98
// Size: 0x52
function function_702fb333(weapon) {
    if (isdefined(level.var_ee5c0b6e)) {
        weapon = self [[ level.var_ee5c0b6e ]](weapon);
        return weapon;
    }
    weapon = function_3895d220(weapon);
    return weapon;
}

// Namespace aat/aat_shared
// Params 2, eflags: 0x0
// Checksum 0x92c2bad7, Offset: 0x1ff8
// Size: 0x108
function getaatonweapon(weapon, var_a217d0c1 = 0) {
    weapon = function_702fb333(weapon);
    if (weapon == level.weaponnone || !(isdefined(level.aat_in_use) && level.aat_in_use) || is_exempt_weapon(weapon) || !isdefined(self.aat) || !isdefined(self.aat[weapon]) || !isdefined(level.aat[self.aat[weapon]])) {
        return undefined;
    }
    if (var_a217d0c1) {
        return self.aat[weapon];
    }
    return level.aat[self.aat[weapon]];
}

// Namespace aat/aat_shared
// Params 3, eflags: 0x0
// Checksum 0x10046349, Offset: 0x2108
// Size: 0x392
function acquire(weapon, name, var_77cf85b7) {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    /#
        assert(isdefined(weapon), "<unknown string>");
    #/
    /#
        assert(weapon != level.weaponnone, "<unknown string>");
    #/
    weapon = function_702fb333(weapon);
    if (is_exempt_weapon(weapon)) {
        return;
    }
    if (isdefined(name)) {
        /#
            assert("<unknown string>" != name, "<unknown string>" + "<unknown string>" + "<unknown string>");
        #/
        /#
            assert(isdefined(level.aat[name]), "<unknown string>" + name + "<unknown string>");
        #/
        self.aat[weapon] = name;
    } else {
        keys = getarraykeys(level.aat);
        arrayremovevalue(keys, hash("none"));
        if (isdefined(self.aat[weapon])) {
            arrayremovevalue(keys, self.aat[weapon]);
        }
        if (isdefined(var_77cf85b7)) {
            arrayremovevalue(keys, hash(var_77cf85b7));
        }
        rand = randomint(keys.size);
        name = keys[rand];
        self.aat[weapon] = name;
    }
    if (weapon == function_702fb333(self getcurrentweapon())) {
        self clientfield::set_to_player("aat_current", level.aat[self.aat[weapon]].clientfield_index);
    }
    switch (name) {
    case #"zm_aat_brain_decay":
        self.var_b01de37[weapon] = 2;
        return;
    case #"zm_aat_plasmatic_burst":
        self.var_b01de37[weapon] = 3;
        return;
    case #"zm_aat_kill_o_watt":
        self.var_b01de37[weapon] = 4;
        return;
    case #"zm_aat_frostbite":
        self.var_b01de37[weapon] = 1;
        return;
    default:
        return;
    }
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0xc843936c, Offset: 0x24a8
// Size: 0xb4
function remove(weapon) {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    /#
        assert(isdefined(weapon), "<unknown string>");
    #/
    /#
        assert(weapon != level.weaponnone, "<unknown string>");
    #/
    weapon = function_702fb333(weapon);
    self.aat[weapon] = undefined;
    self.var_b01de37[weapon] = undefined;
}

// Namespace aat/aat_shared
// Params 0, eflags: 0x0
// Checksum 0x9e81098e, Offset: 0x2568
// Size: 0xe0
function watch_weapon_changes() {
    self endon(#"disconnect");
    while (isdefined(self)) {
        waitresult = undefined;
        waitresult = self waittill(#"weapon_change");
        weapon = waitresult.weapon;
        weapon = function_702fb333(weapon);
        name = "none";
        if (isdefined(self.aat[weapon])) {
            name = self.aat[weapon];
        }
        self clientfield::set_to_player("aat_current", level.aat[name].clientfield_index);
    }
}

// Namespace aat/aat_shared
// Params 1, eflags: 0x0
// Checksum 0xeef201f7, Offset: 0x2650
// Size: 0x50
function has_aat(w_current) {
    w_current = function_702fb333(w_current);
    if (isdefined(self.aat) && isdefined(self.aat[w_current])) {
        return 1;
    }
    return 0;
}

