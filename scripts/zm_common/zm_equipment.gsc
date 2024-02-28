// Atian COD Tools GSC decompiler test
#using script_2cb831533cab2794;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_equipment;

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x2
// Checksum 0x82633d7b, Offset: 0x1e8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_equipment", &__init__, &__main__, undefined);
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0x204b8196, Offset: 0x238
// Size: 0xae
function __init__() {
    level.buildable_piece_count = 24;
    /#
        level.abilities_devgui_add_gadgets_custom = &abilities_devgui_add_gadgets_custom;
    #/
    level.placeable_equipment_destroy_fn = [];
    if (!(isdefined(level._no_equipment_activated_clientfield) && level._no_equipment_activated_clientfield)) {
        clientfield::register("scriptmover", "equipment_activated", 1, 4, "int");
    }
    level.zm_hint_text = zm_hint_text::register("zm_hint_text");
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0x50adc020, Offset: 0x2f0
// Size: 0x14
function __main__() {
    init_upgrade();
}

// Namespace zm_equipment/zm_equipment
// Params 4, eflags: 0x0
// Checksum 0x161867ab, Offset: 0x310
// Size: 0xd62
function abilities_devgui_add_gadgets_custom(root, pname, pid, menu_index) {
    /#
        var_61b8f8fb = "<unknown string>";
        add_cmd_with_root = "<unknown string>" + var_61b8f8fb + pname + "<unknown string>";
        a_abilities = [];
        arrayinsert(a_abilities, getweapon(#"eq_frag_grenade"), 0);
        arrayinsert(a_abilities, getweapon(#"incendiary_grenade"), 0);
        arrayinsert(a_abilities, getweapon(#"sticky_grenade"), 0);
        arrayinsert(a_abilities, getweapon(#"proximity_grenade"), 0);
        arrayinsert(a_abilities, getweapon(#"incendiary_fire"), 0);
        arrayinsert(a_abilities, getweapon(#"concussion_grenade"), 0);
        arrayinsert(a_abilities, getweapon(#"flash_grenade"), 0);
        arrayinsert(a_abilities, getweapon(#"emp_grenade"), 0);
        arrayinsert(a_abilities, getweapon(#"cymbal_monkey"), 0);
        arrayinsert(a_abilities, getweapon(#"tesla_coil"), 0);
        arrayinsert(a_abilities, getweapon(#"tomahawk_t8"), 0);
        ability_player::function_174037fe(add_cmd_with_root, pid, a_abilities, "<unknown string>", menu_index);
        a_hero_weapons = [];
        arrayinsert(a_hero_weapons, getweapon(#"hero_gravityspikes"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_lightninggun"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_minigun"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_pineapplegun"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_chemicalgelgun"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_bowlauncher"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_armblade"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_annihilator"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_flamethrower"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_chakram_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_chakram_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_chakram_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_hammer_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_hammer_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_hammer_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_scepter_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_scepter_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_scepter_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_sword_pistol_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_sword_pistol_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_sword_pistol_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_chakram_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_chakram_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_chakram_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_hammer_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_hammer_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_hammer_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_scepter_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_scepter_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_scepter_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_sword_pistol_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_sword_pistol_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_sword_pistol_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_flamethrower_t8_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_flamethrower_t8_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_flamethrower_t8_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_gravityspikes_t8_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_gravityspikes_t8_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_gravityspikes_t8_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_katana_t8_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_katana_t8_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_katana_t8_lv3"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_minigun_t8_lv1"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_minigun_t8_lv2"), 0);
        arrayinsert(a_hero_weapons, getweapon(#"hero_minigun_t8_lv3"), 0);
        ability_player::function_a40d04ca(add_cmd_with_root, pid, a_hero_weapons, "<unknown string>", menu_index);
        menu_index++;
        menu_index = ability_player::abilities_devgui_add_power(add_cmd_with_root, pid, menu_index);
        menu_index = ability_player::function_2e0162e9(add_cmd_with_root, pid, menu_index);
        adddebugcommand("<unknown string>");
        return menu_index;
    #/
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0xfbfeb987, Offset: 0x1080
// Size: 0xc4
function signal_activated(val = 1) {
    if (isdefined(level._no_equipment_activated_clientfield) && level._no_equipment_activated_clientfield) {
        return;
    }
    self endon(#"death");
    self clientfield::set("equipment_activated", val);
    for (i = 0; i < 2; i++) {
        util::wait_network_frame();
    }
    self clientfield::set("equipment_activated", 0);
}

// Namespace zm_equipment/zm_equipment
// Params 5, eflags: 0x0
// Checksum 0xef7b71dc, Offset: 0x1150
// Size: 0x1e4
function register(equipment_name, hint, howto_hint, hint_icon, equipmentvo) {
    equipment = getweapon(equipment_name);
    struct = spawnstruct();
    if (!isdefined(level.zombie_equipment)) {
        level.zombie_equipment = [];
    }
    struct.equipment = equipment;
    struct.hint = hint;
    struct.howto_hint = howto_hint;
    struct.hint_icon = hint_icon;
    struct.vox = equipmentvo;
    struct.triggers = [];
    struct.models = [];
    struct.notify_strings = spawnstruct();
    struct.notify_strings.activate = equipment.name + "_activate";
    struct.notify_strings.deactivate = equipment.name + "_deactivate";
    struct.notify_strings.taken = equipment.name + "_taken";
    struct.notify_strings.pickup = equipment.name + "_pickup";
    level.zombie_equipment[equipment] = struct;
    /#
        level thread function_1d34b98d(equipment);
    #/
}

// Namespace zm_equipment/zm_equipment
// Params 2, eflags: 0x0
// Checksum 0x1fd76761, Offset: 0x1340
// Size: 0x2a
function register_slot_watcher_override(str_equipment, func_slot_watcher_override) {
    level.a_func_equipment_slot_watcher_override[str_equipment] = func_slot_watcher_override;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0x8307ee42, Offset: 0x1378
// Size: 0x66
function is_included(equipment) {
    if (!isdefined(level.zombie_include_equipment)) {
        return 0;
    }
    if (isstring(equipment)) {
        equipment = getweapon(equipment);
    }
    return isdefined(level.zombie_include_equipment[equipment.rootweapon]);
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0xb64259a7, Offset: 0x13e8
// Size: 0x52
function include(equipment_name) {
    if (!isdefined(level.zombie_include_equipment)) {
        level.zombie_include_equipment = [];
    }
    level.zombie_include_equipment[getweapon(equipment_name)] = 1;
}

// Namespace zm_equipment/zm_equipment
// Params 3, eflags: 0x0
// Checksum 0x4d06c965, Offset: 0x1448
// Size: 0xa6
function set_ammo_driven(equipment_name, start, refill_max_ammo = 0) {
    level.zombie_equipment[getweapon(equipment_name)].notake = 1;
    level.zombie_equipment[getweapon(equipment_name)].start_ammo = start;
    level.zombie_equipment[getweapon(equipment_name)].refill_max_ammo = refill_max_ammo;
}

// Namespace zm_equipment/zm_equipment
// Params 2, eflags: 0x0
// Checksum 0xe2db8578, Offset: 0x14f8
// Size: 0x94
function limit(equipment_name, limited) {
    if (!isdefined(level._limited_equipment)) {
        level._limited_equipment = [];
    }
    if (limited) {
        level._limited_equipment[level._limited_equipment.size] = getweapon(equipment_name);
    } else {
        arrayremovevalue(level._limited_equipment, getweapon(equipment_name), 0);
    }
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0x9d425a1b, Offset: 0x1598
// Size: 0x15e
function init_upgrade() {
    equipment_spawns = [];
    equipment_spawns = getentarray("zombie_equipment_upgrade", "targetname");
    for (i = 0; i < equipment_spawns.size; i++) {
        equipment_spawns[i].equipment = getweapon(equipment_spawns[i].zombie_equipment_upgrade);
        hint_string = get_hint(equipment_spawns[i].equipment);
        equipment_spawns[i] sethintstring(hint_string);
        equipment_spawns[i] setcursorhint("HINT_NOICON");
        equipment_spawns[i] usetriggerrequirelookat();
        equipment_spawns[i] add_to_trigger_list(equipment_spawns[i].equipment);
        equipment_spawns[i] thread equipment_spawn_think();
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x3f2b4d36, Offset: 0x1700
// Size: 0x5a
function get_hint(equipment) {
    /#
        assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "<unknown string>");
    #/
    return level.zombie_equipment[equipment].hint;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x45c40936, Offset: 0x1768
// Size: 0x5a
function get_howto_hint(equipment) {
    /#
        assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "<unknown string>");
    #/
    return level.zombie_equipment[equipment].howto_hint;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0x6f7fb347, Offset: 0x17d0
// Size: 0x5a
function get_icon(equipment) {
    /#
        assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "<unknown string>");
    #/
    return level.zombie_equipment[equipment].hint_icon;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x56329eba, Offset: 0x1838
// Size: 0x5a
function get_notify_strings(equipment) {
    /#
        assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "<unknown string>");
    #/
    return level.zombie_equipment[equipment].notify_strings;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x62127ed3, Offset: 0x18a0
// Size: 0xce
function add_to_trigger_list(equipment) {
    /#
        assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "<unknown string>");
    #/
    level.zombie_equipment[equipment].triggers[level.zombie_equipment[equipment].triggers.size] = self;
    level.zombie_equipment[equipment].models[level.zombie_equipment[equipment].models.size] = getent(self.target, "targetname");
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0x86b68686, Offset: 0x1978
// Size: 0x1c4
function equipment_spawn_think() {
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (player zm_utility::in_revive_trigger() || player zm_utility::is_drinking()) {
            wait(0.1);
        } else if (!is_limited(self.equipment) || !limited_in_use(self.equipment)) {
            if (is_limited(self.equipment)) {
                player setup_limited(self.equipment);
                if (isdefined(level.hacker_tool_positions)) {
                    new_pos = array::random(level.hacker_tool_positions);
                    self.origin = new_pos.trigger_org;
                    model = getent(self.target, "targetname");
                    model.origin = new_pos.model_org;
                    model.angles = new_pos.model_ang;
                }
            }
            player give(self.equipment);
        } else {
            wait(0.1);
        }
    }
}

// Namespace zm_equipment/zm_equipment
// Params 2, eflags: 0x1 linked
// Checksum 0x23555719, Offset: 0x1b48
// Size: 0xfe
function set_equipment_invisibility_to_player(equipment, invisible) {
    triggers = level.zombie_equipment[equipment].triggers;
    for (i = 0; i < triggers.size; i++) {
        if (isdefined(triggers[i])) {
            triggers[i] setinvisibletoplayer(self, invisible);
        }
    }
    models = level.zombie_equipment[equipment].models;
    for (i = 0; i < models.size; i++) {
        if (isdefined(models[i])) {
            models[i] setinvisibletoplayer(self, invisible);
        }
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x9d6710de, Offset: 0x1c50
// Size: 0x2d4
function take(equipment = self get_player_equipment()) {
    if (!isdefined(equipment)) {
        return;
    }
    if (equipment == level.weaponnone) {
        return;
    }
    if (!self has_player_equipment(equipment)) {
        return;
    }
    current = 0;
    current_weapon = 0;
    if (isdefined(self get_player_equipment()) && equipment == self get_player_equipment()) {
        current = 1;
    }
    if (equipment == self getcurrentweapon()) {
        current_weapon = 1;
    }
    /#
        println("<unknown string>" + self.name + "<unknown string>" + function_a16a090d(equipment) + "<unknown string>");
    #/
    notify_strings = get_notify_strings(equipment);
    if (isdefined(self.current_equipment_active[equipment]) && self.current_equipment_active[equipment]) {
        self.current_equipment_active[equipment] = 0;
        self notify(notify_strings.deactivate);
    }
    self notify(notify_strings.taken);
    if (!is_limited(equipment) || is_limited(equipment) && !limited_in_use(equipment)) {
        self set_equipment_invisibility_to_player(equipment, 0);
    }
    if (current) {
        self set_player_equipment(level.weaponnone);
        self setactionslot(2, "");
    } else {
        arrayremovevalue(self.deployed_equipment, equipment);
    }
    if (self hasweapon(equipment)) {
        self takeweapon(equipment);
    }
    if (current_weapon) {
        self zm_weapons::switch_back_primary_weapon();
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x62e43110, Offset: 0x1f30
// Size: 0x1ee
function give(equipment) {
    if (!isdefined(equipment)) {
        return;
    }
    if (!isdefined(level.zombie_equipment[equipment])) {
        return;
    }
    if (self has_player_equipment(equipment)) {
        return;
    }
    /#
        println("<unknown string>" + self.name + "<unknown string>" + function_a16a090d(equipment) + "<unknown string>");
    #/
    curr_weapon = self getcurrentweapon();
    curr_weapon_was_curr_equipment = self is_player_equipment(curr_weapon);
    self take();
    self set_player_equipment(equipment);
    self giveweapon(equipment);
    self start_ammo(equipment);
    self thread show_hint(equipment);
    self set_equipment_invisibility_to_player(equipment, 1);
    self setactionslot(2, "weapon", equipment);
    self thread slot_watcher(equipment);
    self zm_audio::create_and_play_dialog(#"weapon_pickup", level.zombie_equipment[equipment].vox);
    self notify(#"player_given", equipment);
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0x7518f3b5, Offset: 0x2128
// Size: 0x134
function buy(equipment) {
    if (isstring(equipment)) {
        equipment = getweapon(equipment);
    }
    /#
        println("<unknown string>" + self.name + "<unknown string>" + function_a16a090d(equipment) + "<unknown string>");
    #/
    if (isdefined(self.current_equipment) && equipment != self.current_equipment && self.current_equipment != level.weaponnone) {
        self take(self.current_equipment);
    }
    self notify(#"player_bought", equipment);
    self give(equipment);
    if (equipment.isriotshield && isdefined(self.player_shield_reset_health)) {
        self [[ self.player_shield_reset_health ]](equipment);
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x881bd8bf, Offset: 0x2268
// Size: 0x21e
function slot_watcher(equipment) {
    self notify(#"kill_equipment_slot_watcher");
    self endon(#"kill_equipment_slot_watcher", #"disconnect");
    notify_strings = get_notify_strings(equipment);
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"weapon_change");
        prev_weapon = waitresult.last_weapon;
        curr_weapon = waitresult.weapon;
        self.prev_weapon_before_equipment_change = undefined;
        if (isdefined(prev_weapon) && level.weaponnone != prev_weapon) {
            prev_weapon_type = prev_weapon.inventorytype;
            if ("primary" == prev_weapon_type || "altmode" == prev_weapon_type) {
                self.prev_weapon_before_equipment_change = prev_weapon;
            }
        }
        if (!isdefined(level.a_func_equipment_slot_watcher_override)) {
            level.a_func_equipment_slot_watcher_override = [];
        }
        if (isdefined(level.a_func_equipment_slot_watcher_override[equipment.name])) {
            self [[ level.a_func_equipment_slot_watcher_override[equipment.name] ]](equipment, curr_weapon, prev_weapon, notify_strings);
        } else if (curr_weapon == equipment && !self.current_equipment_active[equipment]) {
            self notify(notify_strings.activate);
            self.current_equipment_active[equipment] = 1;
        } else if (curr_weapon != equipment && self.current_equipment_active[equipment]) {
            self notify(notify_strings.deactivate);
            self.current_equipment_active[equipment] = 0;
        }
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x5f00398e, Offset: 0x2490
// Size: 0x68
function is_limited(equipment) {
    if (isdefined(level._limited_equipment)) {
        for (i = 0; i < level._limited_equipment.size; i++) {
            if (level._limited_equipment[i] == equipment) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0xf70f3f9a, Offset: 0x2500
// Size: 0xbc
function limited_in_use(equipment) {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        current_equipment = players[i] get_player_equipment();
        if (isdefined(current_equipment) && current_equipment == equipment) {
            return 1;
        }
    }
    if (isdefined(level.dropped_equipment) && isdefined(level.dropped_equipment[equipment])) {
        return 1;
    }
    return 0;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x88095b08, Offset: 0x25c8
// Size: 0x9c
function setup_limited(equipment) {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] set_equipment_invisibility_to_player(equipment, 1);
    }
    self thread release_limited_on_disconnect(equipment);
    self thread release_limited_on_taken(equipment);
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0xae1a98ee, Offset: 0x2670
// Size: 0xc6
function release_limited_on_taken(equipment) {
    self endon(#"disconnect");
    notify_strings = get_notify_strings(equipment);
    self util::waittill_either(notify_strings.taken, "spawned_spectator");
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] set_equipment_invisibility_to_player(equipment, 0);
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0xc4df0da1, Offset: 0x2740
// Size: 0xd6
function release_limited_on_disconnect(equipment) {
    notify_strings = get_notify_strings(equipment);
    self endon(notify_strings.taken);
    self waittill(#"disconnect");
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (isalive(players[i])) {
            players[i] set_equipment_invisibility_to_player(equipment, 0);
        }
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x437eaac2, Offset: 0x2820
// Size: 0x44
function is_active(equipment) {
    if (!isdefined(self.current_equipment_active) || !isdefined(self.current_equipment_active[equipment])) {
        return 0;
    }
    return self.current_equipment_active[equipment];
}

// Namespace zm_equipment/zm_equipment
// Params 6, eflags: 0x0
// Checksum 0x9d94fbe6, Offset: 0x2870
// Size: 0x8a
function init_hint_hudelem(x, y, alignx, aligny, fontscale, alpha) {
    self.x = x;
    self.y = y;
    self.alignx = alignx;
    self.aligny = aligny;
    self.fontscale = fontscale;
    self.alpha = alpha;
    self.sort = 20;
}

// Namespace zm_equipment/zm_equipment
// Params 2, eflags: 0x0
// Checksum 0x124ad65a, Offset: 0x2908
// Size: 0x184
function setup_client_hintelem(ypos, font_scale) {
    /#
        if (!isdefined(ypos)) {
            ypos = 220;
        }
        if (!isdefined(font_scale)) {
            font_scale = 1.25;
        }
        self endon(#"death");
        if (!isdefined(self.hintelem)) {
            self.hintelem = newdebughudelem(self);
        }
        if (self issplitscreen()) {
            if (getdvarint(#"splitscreen_playercount", 0) >= 3) {
                self.hintelem init_hint_hudelem(160, 90, "<unknown string>", "<unknown string>", font_scale * 0.8, 1);
            } else {
                self.hintelem init_hint_hudelem(160, 90, "<unknown string>", "<unknown string>", font_scale, 1);
            }
        } else {
            self.hintelem init_hint_hudelem(320, ypos, "<unknown string>", "<unknown string>", font_scale, 1);
        }
    #/
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0xe6213c83, Offset: 0x2a98
// Size: 0x9c
function show_hint(equipment) {
    self notify(#"kill_previous_show_equipment_hint_thread");
    self endon(#"kill_previous_show_equipment_hint_thread", #"death");
    if (isdefined(self.do_not_display_equipment_pickup_hint) && self.do_not_display_equipment_pickup_hint) {
        return;
    }
    wait(0.5);
    text = get_howto_hint(equipment);
    self show_hint_text(text);
}

// Namespace zm_equipment/zm_equipment
// Params 4, eflags: 0x1 linked
// Checksum 0xfd7de478, Offset: 0x2b40
// Size: 0x25c
function show_hint_text(text, show_for_time = 3.2, font_scale = 1.25, ypos = 220) {
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    self notify("1caf49f0db5051c");
    self endon("1caf49f0db5051c");
    self endon(#"disconnect");
    level endoncallback(&function_57fbff5c, #"end_game");
    if (!level.zm_hint_text zm_hint_text::is_open(self)) {
        level.zm_hint_text zm_hint_text::open(self);
    }
    level.zm_hint_text zm_hint_text::set_text(self, text);
    level.zm_hint_text zm_hint_text::set_state(self, #"visible");
    time = undefined;
    time = self waittilltimeout(show_for_time, #"hide_equipment_hint_text", #"death", #"disconnect");
    if (isdefined(time) && isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self)) {
        level.zm_hint_text zm_hint_text::set_state(self, #"defaultstate");
        self waittilltimeout(1, #"hide_equipment_hint_text");
    }
    if (isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self)) {
        level.zm_hint_text zm_hint_text::close(self);
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x9d034914, Offset: 0x2da8
// Size: 0xb8
function function_57fbff5c(str_notify) {
    foreach (player in level.players) {
        if (isdefined(player) && level.zm_hint_text zm_hint_text::is_open(player)) {
            level.zm_hint_text zm_hint_text::close(player);
        }
    }
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x82a52645, Offset: 0x2e68
// Size: 0xd6
function start_ammo(equipment) {
    if (self hasweapon(equipment)) {
        maxammo = 1;
        if (isdefined(level.zombie_equipment[equipment].notake) && level.zombie_equipment[equipment].notake) {
            maxammo = level.zombie_equipment[equipment].start_ammo;
        }
        self setweaponammoclip(equipment, maxammo);
        self notify(#"equipment_ammo_changed", {#equipment:equipment});
        return maxammo;
    }
    return 0;
}

// Namespace zm_equipment/zm_equipment
// Params 2, eflags: 0x0
// Checksum 0x50ad69ce, Offset: 0x2f48
// Size: 0x146
function change_ammo(equipment, change) {
    if (self hasweapon(equipment)) {
        oldammo = self getweaponammoclip(equipment);
        maxammo = 1;
        if (isdefined(level.zombie_equipment[equipment].notake) && level.zombie_equipment[equipment].notake) {
            maxammo = level.zombie_equipment[equipment].start_ammo;
        }
        newammo = int(min(maxammo, max(0, oldammo + change)));
        self setweaponammoclip(equipment, newammo);
        self notify(#"equipment_ammo_changed", {#equipment:equipment});
        return newammo;
    }
    return 0;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0x7ff3b188, Offset: 0x3098
// Size: 0x7e
function register_for_level(weaponname) {
    weapon = getweapon(weaponname);
    if (is_equipment(weapon)) {
        return;
    }
    if (!isdefined(level.zombie_equipment_list)) {
        level.zombie_equipment_list = [];
    }
    level.zombie_equipment_list[weapon] = weapon;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x2cf65096, Offset: 0x3120
// Size: 0x3e
function is_equipment(weapon) {
    if (!isdefined(weapon) || !isdefined(level.zombie_equipment_list)) {
        return 0;
    }
    return isdefined(level.zombie_equipment_list[weapon]);
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x5b3a7b91, Offset: 0x3168
// Size: 0x22
function is_equipment_that_blocks_purchase(weapon) {
    return is_equipment(weapon);
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x9bda1477, Offset: 0x3198
// Size: 0x38
function is_player_equipment(weapon) {
    if (!isdefined(weapon) || !isdefined(self.current_equipment)) {
        return 0;
    }
    return self.current_equipment == weapon;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x83859315, Offset: 0x31d8
// Size: 0x88
function has_deployed_equipment(weapon) {
    if (!isdefined(weapon) || !isdefined(self.deployed_equipment) || self.deployed_equipment.size < 1) {
        return 0;
    }
    for (i = 0; i < self.deployed_equipment.size; i++) {
        if (self.deployed_equipment[i] == weapon) {
            return 1;
        }
    }
    return 0;
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0xc2ea3664, Offset: 0x3268
// Size: 0x3c
function has_player_equipment(weapon) {
    return self is_player_equipment(weapon) || self has_deployed_equipment(weapon);
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0x8a101a5e, Offset: 0x32b0
// Size: 0x36
function get_player_equipment() {
    equipment = level.weaponnone;
    if (isdefined(self.current_equipment)) {
        equipment = self.current_equipment;
    }
    return equipment;
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0xdc210434, Offset: 0x32f0
// Size: 0x32
function hacker_active() {
    return self is_active(getweapon(#"equip_hacker"));
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x1 linked
// Checksum 0x6a152df5, Offset: 0x3330
// Size: 0x9a
function set_player_equipment(weapon) {
    if (!isdefined(self.current_equipment_active)) {
        self.current_equipment_active = [];
    }
    if (isdefined(weapon)) {
        self.current_equipment_active[weapon] = 0;
    }
    if (!isdefined(self.equipment_got_in_round)) {
        self.equipment_got_in_round = [];
    }
    if (isdefined(weapon)) {
        self.equipment_got_in_round[weapon] = level.round_number;
    }
    self notify(#"new_equipment", weapon);
    self.current_equipment = weapon;
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x1 linked
// Checksum 0xf64a1d84, Offset: 0x33d8
// Size: 0x24
function init_player_equipment() {
    self set_player_equipment(level.zombie_equipment_player_init);
}

// Namespace zm_equipment/zm_equipment
// Params 4, eflags: 0x1 linked
// Checksum 0xf6717638, Offset: 0x3408
// Size: 0xac
function function_7d948481(n_boss = 0.1, n_miniboss = 0.25, n_heavy = 0.5, n_basic = 1) {
    if (!isdefined(self.var_6f84b820)) {
        return 1;
    }
    switch (self.var_6f84b820) {
    case #"boss":
        return n_boss;
    case #"miniboss":
        return n_miniboss;
    case #"heavy":
        return n_heavy;
    default:
        return n_basic;
    }
}

// Namespace zm_equipment/zm_equipment
// Params 5, eflags: 0x1 linked
// Checksum 0x10e122f5, Offset: 0x3510
// Size: 0xc2
function function_379f6b5d(n_base_damage, var_177ec733 = 1, var_b68e56de = 1, var_694e2cee = 4, var_f14e81ea = 30) {
    n_base_damage = n_base_damage * var_177ec733;
    var_5d7b4163 = n_base_damage * var_b68e56de * math::clamp(level.round_number, var_694e2cee, var_f14e81ea);
    return int(var_5d7b4163);
}

// Namespace zm_equipment/zm_equipment
// Params 0, eflags: 0x0
// Checksum 0x6f6385f6, Offset: 0x35e0
// Size: 0x1ce
function function_e418901e() {
    /#
        setdvar(#"give_equipment", "<unknown string>");
        waitframe(1);
        level flag::wait_till("<unknown string>");
        waitframe(1);
        str_cmd = "<unknown string>" + "<unknown string>" + "<unknown string>";
        adddebugcommand(str_cmd);
        while (1) {
            equipment_id = getdvarstring(#"give_equipment");
            if (equipment_id != "<unknown string>") {
                foreach (player in getplayers()) {
                    if (equipment_id == "<unknown string>") {
                        player take();
                    } else if (is_included(equipment_id)) {
                        player buy(equipment_id);
                    }
                }
                setdvar(#"give_equipment", "<unknown string>");
            }
            waitframe(1);
        }
    #/
}

// Namespace zm_equipment/zm_equipment
// Params 1, eflags: 0x0
// Checksum 0x58006ec8, Offset: 0x37b8
// Size: 0xa4
function function_1d34b98d(equipment) {
    /#
        waitframe(1);
        level flag::wait_till("<unknown string>");
        waitframe(1);
        if (isdefined(equipment)) {
            equipment_id = function_a16a090d(equipment);
            str_cmd = "<unknown string>" + equipment_id + "<unknown string>" + equipment_id + "<unknown string>";
            adddebugcommand(str_cmd);
        }
    #/
}

