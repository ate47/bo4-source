// Atian COD Tools GSC decompiler test
#using script_7edb54aca54e9a2b;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace devgui;

// Namespace devgui/devgui
// Params 0, eflags: 0x2
// Checksum 0xaa84cec, Offset: 0xd0
// Size: 0x4c
function autoexec __init__system__() {
    /#
        system::register(#"devgui", &__init__, undefined, #"load");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xeb8b6f6b, Offset: 0x128
// Size: 0x36c
function __init__() {
    /#
        level.var_f9f04b00 = debug_center_screen::register("<unknown string>");
        util::set_dvar_if_unset("<unknown string>", "<unknown string>");
        util::set_dvar_if_unset("<unknown string>", 0);
        util::set_dvar_if_unset("<unknown string>", "<unknown string>");
        util::set_dvar_if_unset("<unknown string>", 0);
        util::set_dvar_if_unset("<unknown string>", 0);
        util::set_dvar_if_unset("<unknown string>", "<unknown string>");
        level.attachment_cycling_dvars = [];
        level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "<unknown string>";
        level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "<unknown string>";
        level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "<unknown string>";
        level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "<unknown string>";
        level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "<unknown string>";
        level.attachment_cycling_dvars[level.attachment_cycling_dvars.size] = "<unknown string>";
        level thread devgui_weapon_think();
        level thread devgui_weapon_asset_name_display_think();
        level thread devgui_player_weapons();
        level thread function_cb7cee87();
        level thread dev::devgui_test_chart_think();
        level thread devgui_player_spawn_think();
        level thread devgui_vehicle_spawn_think();
        level thread function_7bef8d25();
        level thread function_be0f9897();
        level thread dev::function_487bf571();
        level thread function_46b22d99();
        level thread function_773432e2();
        level thread function_6a24e58f();
        level thread function_57edec18();
        thread init_debug_center_screen();
        level thread dev::body_customization_devgui(currentsessionmode());
        callback::on_connect(&hero_art_on_player_connect);
        callback::on_connect(&on_player_connect);
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x53cd3ab4, Offset: 0x4a0
// Size: 0x24
function on_player_connect() {
    /#
        self.devguilockspawn = 0;
        self thread devgui_player_spawn();
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xdf54d33a, Offset: 0x4d0
// Size: 0x148
function devgui_player_spawn() {
    /#
        wait(1);
        player_devgui_base_mp = "<unknown string>";
        waitframe(1);
        players = getplayers();
        foreach (player in players) {
            if (player != self) {
                continue;
            }
            temp = player_devgui_base_mp + player.playername + "<unknown string>" + "<unknown string>" + "<unknown string>" + player.playername + "<unknown string>";
            adddebugcommand(player_devgui_base_mp + player.playername + "<unknown string>" + "<unknown string>" + "<unknown string>" + player.playername + "<unknown string>");
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x1e6b110, Offset: 0x620
// Size: 0x170
function devgui_player_spawn_think() {
    /#
        for (;;) {
            playername = getdvarstring(#"mp_lockspawn_command_devgui");
            if (playername == "<unknown string>") {
                waitframe(1);
                continue;
            }
            players = getplayers();
            foreach (player in players) {
                if (player.playername != playername) {
                    continue;
                }
                player.devguilockspawn = !player.devguilockspawn;
                if (player.devguilockspawn) {
                    player.resurrect_origin = player.origin;
                    player.resurrect_angles = player.angles;
                }
            }
            setdvar(#"mp_lockspawn_command_devgui", "<unknown string>");
            wait(0.5);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xe3721393, Offset: 0x798
// Size: 0xee
function devgui_vehicle_spawn_think() {
    /#
        waitframe(1);
        for (;;) {
            val = getdvarint(#"scr_spawnvehicle", 0);
            if (val != 0) {
                if (val == 1) {
                    add_vehicle_at_eye_trace("<unknown string>");
                } else if (val == 2) {
                    add_vehicle_at_eye_trace("<unknown string>");
                } else if (val == 3) {
                    add_vehicle_at_eye_trace("<unknown string>");
                }
                setdvar(#"scr_spawnvehicle", 0);
            }
            waitframe(1);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x62ecf555, Offset: 0x890
// Size: 0x2e4
function function_cb7cee87() {
    /#
        if (isdefined(game.var_461b2589) && game.var_461b2589) {
            return;
        }
        self notify("<unknown string>");
        self endon("<unknown string>");
        level endon(#"game_ended");
        player_devgui_base = "<unknown string>";
        setdvar(#"scr_boast_gesture", "<unknown string>");
        util::add_devgui(player_devgui_base + "<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>");
        while (getdvarstring(#"scr_boast_gesture", "<unknown string>") == "<unknown string>") {
            wait(1);
        }
        game.var_461b2589 = 1;
        setdvar(#"scr_boast_gesture", "<unknown string>");
        var_fca60300 = function_5e2d2d9b();
        foreach (item_hash, boasts in var_fca60300) {
            item_root = player_devgui_base + function_9e72a96(item_hash) + "<unknown string>";
            foreach (boast in boasts) {
                util::add_devgui(item_root + function_9e72a96(boast), "<unknown string>" + "<unknown string>" + "<unknown string>" + function_9e72a96(boast));
            }
            waitframe(1);
        }
        util::remove_devgui(player_devgui_base + "<unknown string>");
        level thread function_42644f29();
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x88815e7e, Offset: 0xb80
// Size: 0x156
function function_42644f29() {
    /#
        while (1) {
            level.boastplayer = getdvarint(#"scr_boast_player", 0);
            gesture = getdvarstring(#"scr_boast_gesture");
            if (gesture != "<unknown string>") {
                setdvar(#"bg_boastenabled", 1);
                players = getplayers();
                if (isdefined(level.boastplayer) && isdefined(players[level.boastplayer])) {
                    players[level.boastplayer] function_c6775cf9(gesture);
                } else {
                    players[0] function_c6775cf9(gesture);
                }
                setdvar(#"scr_boast_gesture", "<unknown string>");
            }
            waitframe(1);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xdee78245, Offset: 0xce0
// Size: 0x60c
function devgui_player_weapons() {
    /#
        level endon(#"game_ended");
        if (isdefined(game.devgui_weapons_added) && game.devgui_weapons_added) {
            return;
        }
        level flag::wait_till("<unknown string>");
        a_weapons = enumerateweapons("<unknown string>");
        a_weapons_mp = [];
        a_grenades_mp = [];
        a_misc_mp = [];
        var_ef946ce8 = [];
        for (i = 0; i < a_weapons.size; i++) {
            if (strstartswith(getweaponname(a_weapons[i]), "<unknown string>")) {
                arrayinsert(var_ef946ce8, a_weapons[i], 0);
                continue;
            }
            if ((weapons::is_primary_weapon(a_weapons[i]) || weapons::is_side_arm(a_weapons[i])) && !killstreaks::is_killstreak_weapon(a_weapons[i])) {
                arrayinsert(a_weapons_mp, a_weapons[i], 0);
                continue;
            }
            if (weapons::is_grenade(a_weapons[i])) {
                arrayinsert(a_grenades_mp, a_weapons[i], 0);
                continue;
            }
            arrayinsert(a_misc_mp, a_weapons[i], 0);
        }
        player_devgui_base_mp = "<unknown string>";
        menu_index = 1;
        level thread devgui_add_player_weapons(player_devgui_base_mp, "<unknown string>", 0, a_weapons_mp, "<unknown string>", menu_index);
        menu_index++;
        level thread devgui_add_player_weapons(player_devgui_base_mp, "<unknown string>", 0, a_grenades_mp, "<unknown string>", menu_index);
        menu_index++;
        level thread devgui_add_player_weapons(player_devgui_base_mp, "<unknown string>", 0, a_misc_mp, "<unknown string>", menu_index);
        menu_index++;
        level thread devgui_add_player_weapons(player_devgui_base_mp, "<unknown string>", 0, var_ef946ce8, "<unknown string>", menu_index);
        menu_index++;
        game.devgui_weapons_added = 1;
        waitframe(1);
        adddebugcommand(player_devgui_base_mp + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>");
        menu_index++;
        adddebugcommand(player_devgui_base_mp + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>");
        menu_index++;
        adddebugcommand(player_devgui_base_mp + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>");
        menu_index++;
        waitframe(1);
        attachment_cycling_devgui_base_mp = player_devgui_base_mp + "<unknown string>" + "<unknown string>";
        adddebugcommand(attachment_cycling_devgui_base_mp + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand(attachment_cycling_devgui_base_mp + "<unknown string>" + "<unknown string>" + "<unknown string>");
        attachmentnames = getattachmentnames();
        for (i = 0; i < 6; i++) {
            attachment_cycling_sub_menu_index = 1;
            adddebugcommand(attachment_cycling_devgui_base_mp + "<unknown string>" + i + 1 + "<unknown string>" + "<unknown string>" + "<unknown string>" + i + "<unknown string>");
            for (attachmentname = 0; attachmentname < attachmentnames.size; attachmentname++) {
                util::waittill_can_add_debug_command();
                adddebugcommand(attachment_cycling_devgui_base_mp + "<unknown string>" + i + 1 + "<unknown string>" + attachmentnames[attachmentname] + "<unknown string>" + "<unknown string>" + "<unknown string>" + level.attachment_cycling_dvars[i] + "<unknown string>" + attachmentnames[attachmentname] + "<unknown string>");
                attachment_cycling_sub_menu_index++;
            }
            if (i % 4) {
                waitframe(1);
            }
        }
        level thread devgui_attachment_cycling_think();
    #/
}

// Namespace devgui/devgui
// Params 6, eflags: 0x0
// Checksum 0x620bc48a, Offset: 0x12f8
// Size: 0x20e
function devgui_add_player_weapons(root, pname, index, a_weapons, weapon_type, mindex) {
    /#
        level endon(#"game_ended");
        if (isdedicated()) {
            return;
        }
        devgui_root = root + weapon_type + "<unknown string>";
        if (isdefined(a_weapons)) {
            for (i = 0; i < a_weapons.size; i++) {
                attachments = a_weapons[i].supportedattachments;
                name = getweaponname(a_weapons[i]);
                if (attachments.size) {
                    devgui_add_player_weap_command(devgui_root + name + "<unknown string>", index, name, i + 1);
                    foreach (att in attachments) {
                        if (att != "<unknown string>") {
                            devgui_add_player_weap_command(devgui_root + name + "<unknown string>", index, name + "<unknown string>" + att, i + 1);
                        }
                    }
                    continue;
                }
                devgui_add_player_weap_command(devgui_root, index, name, i + 1);
            }
        }
    #/
}

// Namespace devgui/devgui
// Params 4, eflags: 0x0
// Checksum 0xaaa6b14a, Offset: 0x1510
// Size: 0x84
function devgui_add_player_weap_command(root, pid, weap_name, cmdindex) {
    /#
        util::waittill_can_add_debug_command();
        adddebugcommand(root + weap_name + "<unknown string>" + "<unknown string>" + "<unknown string>" + weap_name + "<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x17f5f220, Offset: 0x15a0
// Size: 0xa0
function devgui_weapon_think() {
    /#
        for (;;) {
            weapon_name = getdvarstring(#"mp_weap_devgui");
            if (weapon_name != "<unknown string>") {
                devgui_handle_player_command(&devgui_give_weapon, weapon_name);
            }
            setdvar(#"mp_weap_devgui", "<unknown string>");
            wait(0.5);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x84431a11, Offset: 0x1648
// Size: 0x22
function hero_art_on_player_connect() {
    /#
        self._debugheromodels = spawnstruct();
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x8f431c8f, Offset: 0x1678
// Size: 0x42e
function devgui_weapon_asset_name_display_think() {
    /#
        update_time = 1;
        print_duration = int(update_time / float(function_60d95f53()) / 1000);
        printlnbold_update = int(1 / update_time);
        printlnbold_counter = 0;
        colors = [];
        colors[colors.size] = (1, 1, 1);
        colors[colors.size] = (1, 0, 0);
        colors[colors.size] = (0, 1, 0);
        colors[colors.size] = (1, 1, 0);
        colors[colors.size] = (1, 0, 1);
        colors[colors.size] = (0, 1, 1);
        for (;;) {
            wait(update_time);
            display = getdvarint(#"mp_weap_asset_name_display_devgui", 0);
            if (!display) {
                continue;
            }
            if (!printlnbold_counter) {
                iprintlnbold(getweaponname(level.players[0] getcurrentweapon()));
            }
            printlnbold_counter++;
            if (printlnbold_counter >= printlnbold_update) {
                printlnbold_counter = 0;
            }
            color_index = 0;
            for (i = 1; i < level.players.size; i++) {
                player = level.players[i];
                weapon = player getcurrentweapon();
                if (!isdefined(weapon) || level.weaponnone == weapon) {
                    continue;
                }
                var_9643e38d = player gettagorigin("<unknown string>");
                if (!isdefined(var_9643e38d)) {
                    continue;
                }
                print3d(var_9643e38d, getweaponname(weapon), colors[color_index], 1, 0.15, print_duration);
                color_index++;
                if (color_index >= colors.size) {
                    color_index = 0;
                }
            }
            color_index = 0;
            ai_list = getaiarray();
            for (i = 0; i < ai_list.size; i++) {
                ai = ai_list[i];
                if (isvehicle(ai)) {
                    weapon = ai.turretweapon;
                } else {
                    weapon = ai.weapon;
                }
                if (!isdefined(weapon) || level.weaponnone == weapon) {
                    continue;
                }
                var_9643e38d = ai gettagorigin("<unknown string>");
                if (!isdefined(var_9643e38d)) {
                    continue;
                }
                print3d(var_9643e38d, getweaponname(weapon), colors[color_index], 1, 0.15, print_duration);
                color_index++;
                if (color_index >= colors.size) {
                    color_index = 0;
                }
            }
        }
    #/
}

// Namespace devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x35fae323, Offset: 0x1ab0
// Size: 0x3c
function devgui_attachment_cycling_clear(index) {
    /#
        setdvar(level.attachment_cycling_dvars[index], "<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xbc92c754, Offset: 0x1af8
// Size: 0x3a4
function devgui_attachment_cycling_update() {
    /#
        currentweapon = self getcurrentweapon();
        rootweapon = currentweapon.rootweapon;
        supportedattachments = currentweapon.supportedattachments;
        textcolors = [];
        attachments = [];
        originalattachments = [];
        for (i = 0; i < 6; i++) {
            originalattachments[i] = getdvarstring(level.attachment_cycling_dvars[i]);
            textcolor[i] = "<unknown string>";
            attachments[i] = "<unknown string>";
            name = originalattachments[i];
            if ("<unknown string>" == name) {
                continue;
            }
            textcolor[i] = "<unknown string>";
            for (supportedindex = 0; supportedindex < supportedattachments.size; supportedindex++) {
                if (name == supportedattachments[supportedindex]) {
                    textcolor[i] = "<unknown string>";
                    attachments[i] = name;
                    continue;
                }
            }
        }
        for (i = 0; i < 6; i++) {
            if ("<unknown string>" == originalattachments[i]) {
                continue;
            }
            for (j = i + 1; j < 6; j++) {
                if (originalattachments[i] == originalattachments[j]) {
                    textcolor[j] = "<unknown string>";
                    attachments[j] = "<unknown string>";
                }
            }
        }
        msg = "<unknown string>";
        for (i = 0; i < 6; i++) {
            if ("<unknown string>" == originalattachments[i]) {
                continue;
            }
            msg = msg + textcolor[i];
            msg = msg + i;
            msg = msg + "<unknown string>";
            msg = msg + originalattachments[i];
            msg = msg + "<unknown string>";
        }
        iprintlnbold(msg);
        self takeweapon(currentweapon);
        currentweapon = getweapon(rootweapon.name, attachments[0], attachments[1], attachments[2], attachments[3], attachments[4], attachments[5]);
        wait(0.25);
        self giveweapon(currentweapon, undefined);
        self switchtoweapon(currentweapon);
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x869b7077, Offset: 0x1ea8
// Size: 0x178
function devgui_attachment_cycling_think() {
    /#
        for (;;) {
            state = getdvarstring(#"mp_attachment_cycling_state_devgui");
            setdvar(#"mp_attachment_cycling_state_devgui", "<unknown string>");
            if (issubstr(state, "<unknown string>")) {
                if ("<unknown string>" == state) {
                    for (i = 0; i < 6; i++) {
                        devgui_attachment_cycling_clear(i);
                    }
                } else {
                    index = int(getsubstr(state, 6, 7));
                    devgui_attachment_cycling_clear(index);
                }
                state = "<unknown string>";
            }
            if ("<unknown string>" == state) {
                array::thread_all(getplayers(), &devgui_attachment_cycling_update);
            }
            wait(0.5);
        }
    #/
}

// Namespace devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x4715a566, Offset: 0x2028
// Size: 0x84c
function devgui_give_weapon(weapon_name) {
    /#
        /#
            assert(isdefined(self));
        #/
        /#
            assert(isplayer(self));
        #/
        self notify(#"devgui_give_ammo");
        self endon(#"devgui_give_ammo");
        endtime = gettime() + 10000;
        while (!isalive(self) && gettime() < endtime) {
            wait(0.25);
        }
        if (!isalive(self)) {
            util::warning("<unknown string>" + weapon_name + "<unknown string>" + self.name + "<unknown string>" + self.name + "<unknown string>");
            return;
        }
        takeweapon = undefined;
        currentweapon = self getcurrentweapon();
        if (strstartswith(weapon_name, "<unknown string>")) {
            split = strtok(weapon_name, "<unknown string>");
            if (isdefined(split[2])) {
                if (split[2] == "<unknown string>") {
                    var_18a8ed6e = 1;
                } else if (split[2] == "<unknown string>") {
                    var_18a8ed6e = -1;
                }
                currentweaponname = currentweapon.name;
                currentattachment = "<unknown string>";
                if (isdefined(currentweapon.attachments) && isdefined(currentweapon.attachments[0]) && currentweapon.attachments[0] != "<unknown string>") {
                    currentattachment = currentweapon.attachments[0];
                }
                supportedattachments = currentweapon.supportedattachments;
                var_a67ed7c5 = -1;
                if (supportedattachments.size) {
                    var_a67ed7c5 = supportedattachments.size;
                    for (i = 0; i < supportedattachments.size; i++) {
                        if (supportedattachments[i] == currentattachment) {
                            var_a67ed7c5 = i;
                            break;
                        }
                    }
                }
                weapon = currentweapon;
                nextindex = -1;
                if (var_a67ed7c5 == supportedattachments.size) {
                    if (var_18a8ed6e > 0) {
                        nextindex = 0;
                    } else {
                        nextindex = supportedattachments.size - 1;
                    }
                } else if (var_a67ed7c5 >= 0) {
                    nextindex = (supportedattachments.size + var_a67ed7c5 + var_18a8ed6e) % supportedattachments.size;
                }
                if (nextindex >= 0 && nextindex < supportedattachments.size) {
                    if (isdefined(supportedattachments[nextindex])) {
                        attachment = supportedattachments[nextindex];
                        takeweapon = currentweapon;
                        weapon = getweapon(currentweaponname, attachment);
                    }
                }
            }
        } else {
            split = strtok(weapon_name, "<unknown string>");
            switch (split.size) {
            case 1:
            default:
                weapon = getweapon(split[0]);
                break;
            case 2:
                weapon = getweapon(split[0], split[1]);
                break;
            case 3:
                weapon = getweapon(split[0], split[1], split[2]);
                break;
            case 4:
                weapon = getweapon(split[0], split[1], split[2], split[3]);
                break;
            case 5:
                weapon = getweapon(split[0], split[1], split[2], split[3], split[4]);
                break;
            }
        }
        if (currentweapon != weapon) {
            if (weapon.isgrenadeweapon && !getdvarint(#"hash_1fce8e806b5356fc", 0)) {
                grenades = 0;
                pweapons = self getweaponslist();
                foreach (pweapon in pweapons) {
                    if (pweapon != weapon && pweapon.isgrenadeweapon) {
                        grenades++;
                    }
                }
                if (grenades > 1) {
                    foreach (pweapon in pweapons) {
                        if (pweapon != weapon && pweapon.isgrenadeweapon) {
                            grenades--;
                            self takeweapon(pweapon);
                            if (grenades < 2) {
                                break;
                            }
                        }
                    }
                }
            }
            if (isdefined(takeweapon)) {
                self takeweapon(takeweapon);
            }
            if (getdvarint(#"mp_weap_use_give_console_command_devgui", 0)) {
                adddebugcommand("<unknown string>" + weapon_name);
                waitframe(1);
            } else {
                self giveweapon(weapon);
                if (!weapon.isgrenadeweapon) {
                    self switchtoweapon(weapon);
                }
            }
            max = weapon.maxammo;
            if (max) {
                self setweaponammostock(weapon, max);
                return;
            }
            clipammo = self getweaponammoclip(weapon);
            if (clipammo == 0) {
                self setweaponammoclip(weapon, 1);
            }
        }
    #/
}

// Namespace devgui/devgui
// Params 3, eflags: 0x0
// Checksum 0xb55aaeff, Offset: 0x2880
// Size: 0x134
function devgui_handle_player_command(playercallback, pcb_param_1, pcb_param_2) {
    /#
        pid = getdvarint(#"mp_weap_devgui", 0);
        if (pid > 0) {
            player = getplayers()[pid - 1];
            if (isdefined(player)) {
                if (isdefined(pcb_param_2)) {
                    player thread [[ playercallback ]](pcb_param_1, pcb_param_2);
                } else if (isdefined(pcb_param_1)) {
                    player thread [[ playercallback ]](pcb_param_1);
                } else {
                    player thread [[ playercallback ]]();
                }
            }
        } else {
            array::thread_all(getplayers(), playercallback, pcb_param_1, pcb_param_2);
        }
        setdvar(#"mp_weap_devgui", "<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x9e4a07ea, Offset: 0x29c0
// Size: 0x12c
function init_debug_center_screen() {
    /#
        zero_idle_movement = 0;
        for (;;) {
            if (getdvarint(#"debug_center_screen", 0)) {
                if (!isdefined(level.var_7929a046) || level.var_7929a046 == 0) {
                    thread debug_center_screen();
                    zero_idle_movement = getdvarint(#"zero_idle_movement", 0);
                    if (zero_idle_movement == 0) {
                        setdvar(#"zero_idle_movement", 1);
                        zero_idle_movement = 1;
                    }
                }
            } else {
                level notify(#"stop center screen debug");
                if (zero_idle_movement == 1) {
                    setdvar(#"zero_idle_movement", 0);
                    zero_idle_movement = 0;
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x8a2325b2, Offset: 0x2af8
// Size: 0x9a
function debug_center_screen() {
    /#
        level.var_7929a046 = 1;
        wait(0.1);
        level.var_f9f04b00 debug_center_screen::open(level.players[0], 1);
        level waittill(#"stop center screen debug");
        level.var_f9f04b00 debug_center_screen::close(level.players[0]);
        level.var_7929a046 = 0;
    #/
}

// Namespace devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x73e1087f, Offset: 0x2ba0
// Size: 0x12a
function add_vehicle_at_eye_trace(vehiclename) {
    /#
        host = util::gethostplayer();
        trace = host bot::eye_trace();
        veh_spawner = getent(vehiclename + "<unknown string>", "<unknown string>");
        vehicle = veh_spawner spawnfromspawner(vehiclename, 1, 1, 1);
        vehicle asmrequestsubstate(#"locomotion@movement");
        waitframe(1);
        vehicle makevehicleusable();
        vehicle.origin = trace[#"position"];
        vehicle.nojumping = 1;
        vehicle thread watch_player_death();
        return vehicle;
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xf940376, Offset: 0x2cd8
// Size: 0x8e
function watch_player_death() {
    /#
        self endon(#"death");
        vehicle = self;
        while (1) {
            driver = self getseatoccupant(0);
            if (isdefined(driver) && !isalive(driver)) {
                driver unlink();
            }
            waitframe(1);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x420464e6, Offset: 0x2d70
// Size: 0x54
function devgui_add_ve_map_switches() {
    /#
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x64dc6feb, Offset: 0x2dd0
// Size: 0x65e
function function_6a24e58f() {
    /#
        level notify(#"hash_254f5df0e8f1d66");
        level endon(#"hash_254f5df0e8f1d66");
        setdvar(#"hash_3a3f995b08f2b9b8", -1);
        setdvar(#"hash_2aab28ebf600b8c7", -1);
        setdvar(#"hash_4874e2dd28221d6c", -1);
        wait(0.5);
        path = "<unknown string>";
        cmd = "<unknown string>";
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        for (minutes = 0; minutes < 10; minutes++) {
            for (seconds = 0; seconds < 60; seconds = seconds + 15) {
                var_99cfbb07 = "<unknown string>" + seconds;
                totalseconds = minutes * 60 + seconds;
                if (seconds == 0) {
                    if (minutes == 0) {
                        totalseconds = 1;
                        var_99cfbb07 = "<unknown string>";
                    } else {
                        var_99cfbb07 = "<unknown string>";
                    }
                }
                util::add_devgui(path + minutes + "<unknown string>" + var_99cfbb07, cmd + totalseconds);
            }
            waitframe(1);
        }
        var_a11730e4 = "<unknown string>";
        var_eb72e2d3 = "<unknown string>";
        var_3b0a5dad = "<unknown string>";
        var_5f2cb965 = "<unknown string>";
        if (util::isroundbased()) {
            var_ca373442 = level.roundlimit * level.roundscorelimit;
        } else {
            var_ca373442 = level.scorelimit;
        }
        var_ca373442 = math::clamp(var_ca373442, 0, 300);
        wait(0.5);
        for (score = 0; score <= var_ca373442; score++) {
            var_8acb4d22 = int(score / 10) * 10;
            var_daf8d664 = int(score / 10) * 10 + 10;
            util::add_devgui(var_a11730e4 + var_8acb4d22 + "<unknown string>" + var_daf8d664 + "<unknown string>" + var_8acb4d22 + "<unknown string>" + score, var_eb72e2d3 + score);
            util::add_devgui(var_3b0a5dad + var_8acb4d22 + "<unknown string>" + var_daf8d664 + "<unknown string>" + var_8acb4d22 + "<unknown string>" + score, var_5f2cb965 + score);
            if (score == var_daf8d664) {
                waitframe(1);
            }
        }
        while (1) {
            if (getdvarint(#"hash_3a3f995b08f2b9b8", -1) != -1) {
                var_6d2040ea = getdvarint(#"hash_3a3f995b08f2b9b8", -1);
                var_14f1a63 = (int(var_6d2040ea * 1000) + globallogic_utils::gettimepassed()) / int(60 * 1000);
                if (var_6d2040ea == 0) {
                    var_14f1a63 = 0;
                }
                setdvar(#"timelimit_override", var_14f1a63);
                setdvar(#"hash_3a3f995b08f2b9b8", -1);
            }
            if (getdvarint(#"hash_2aab28ebf600b8c7", -1) != -1) {
                var_168b7d5 = getdvarint(#"hash_2aab28ebf600b8c7", -1);
                [[ level._setteamscore ]](#"allies", var_168b7d5);
                setdvar(#"hash_2aab28ebf600b8c7", -1);
            }
            if (getdvarint(#"hash_4874e2dd28221d6c", -1) != -1) {
                var_46c53e6e = getdvarint(#"hash_4874e2dd28221d6c", -1);
                [[ level._setteamscore ]](#"axis", var_46c53e6e);
                setdvar(#"hash_4874e2dd28221d6c", -1);
            }
            wait(1);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xb5557b13, Offset: 0x3438
// Size: 0x1a0
function function_7bef8d25() {
    /#
        level notify(#"hash_6a8b1c9e1485919d");
        level endon(#"hash_6a8b1c9e1485919d");
        wait(5);
        function_e4b86469();
        wait(1);
        while (1) {
            wait(0.25);
            remaining_health = getdvarint(#"hash_28af507d964c5802", 0);
            if (remaining_health <= 0) {
                continue;
            }
            player = level.players[0];
            if (isplayer(player)) {
                remaining_health = math::clamp(remaining_health, 0, isdefined(player.maxhealth) ? player.maxhealth : 100);
                damage = player.health - remaining_health;
                if (damage <= 0) {
                    player.health = remaining_health;
                } else {
                    player dodamage(damage, player.origin + vectorscale((1, 0, 0), 100));
                }
            }
            setdvar(#"hash_28af507d964c5802", 0);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x817ce5ea, Offset: 0x35e0
// Size: 0x1b8
function function_46b22d99() {
    /#
        level notify(#"hash_4c09c9d01060d7ad");
        level endon(#"hash_4c09c9d01060d7ad");
        wait(2);
        function_9fb69cba();
        wait(0.5);
        while (1) {
            wait(0.5);
            if (level.gameended) {
                continue;
            }
            var_7442b0e6 = getdvarint(#"scr_end_round", 0);
            if (var_7442b0e6 == 0) {
                continue;
            }
            setdvar(#"scr_end_round", 0);
            var_53b4c3ae = getgametypesetting(#"timelimit");
            var_c585681e = 0.25;
            setgametypesetting("<unknown string>", var_c585681e);
            for (aborted = 0; !level.gameended && !aborted; aborted = getgametypesetting(#"timelimit") != var_c585681e) {
                wait(0.5);
            }
            if (!aborted) {
                setgametypesetting("<unknown string>", var_53b4c3ae);
            }
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x961260c6, Offset: 0x37a0
// Size: 0x1d8
function function_be0f9897() {
    /#
        level notify(#"hash_7528b3262d076f59");
        level endon(#"hash_7528b3262d076f59");
        wait(5.5);
        function_51cc2292();
        wait(1);
        while (1) {
            wait(0.25);
            damage = getdvarint(#"scr_damage_health", 0);
            if (damage == 0) {
                continue;
            }
            player = level.players[0];
            if (isplayer(player)) {
                if (damage <= 0) {
                    heal = damage * -1;
                    var_66cb03ad = player.var_66cb03ad < 0 ? player.var_66cb03ad : player.maxhealth;
                    if (!isdefined(var_66cb03ad)) {
                        var_66cb03ad = 100;
                    }
                    if (player.health + heal > var_66cb03ad) {
                        player.health = var_66cb03ad;
                    } else {
                        player.health = player.health + heal;
                    }
                } else {
                    player dodamage(damage, player.origin + vectorscale((1, 0, 0), 100));
                }
            }
            setdvar(#"scr_damage_health", 0);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xc2c84576, Offset: 0x3980
// Size: 0x250
function function_773432e2() {
    /#
        level notify(#"hash_6534754fb1d75ea7");
        level endon(#"hash_6534754fb1d75ea7");
        while (!isdefined(level.scoreinfo)) {
            wait(1);
        }
        function_354e12a4();
        while (1) {
            wait(0.1);
            actionid = getdvarint(#"hash_649ea18bd5e55893", -1);
            var_97c83f66 = getdvarint(#"hash_6ad3f58a8e0a1e59", -1);
            hotstreakstage = getdvarint(#"scr_hotstreak_stage", -1);
            if (actionid == -1 && var_97c83f66 == -1 && hotstreakstage == -1) {
                continue;
            }
            player = level.players[0];
            if (isplayer(player)) {
                if (actionid != -1) {
                    player luinotifyevent(#"challenge_coin_received", 1, actionid);
                }
                if (var_97c83f66 != -1) {
                    player luinotifyevent(#"end_sustaining_action", 1, var_97c83f66);
                }
                if (hotstreakstage != -1) {
                    player clientfield::set_player_uimodel("<unknown string>", hotstreakstage);
                }
            }
            setdvar(#"hash_649ea18bd5e55893", -1);
            setdvar(#"hash_6ad3f58a8e0a1e59", -1);
        }
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x79c9e1ff, Offset: 0x3bd8
// Size: 0x124
function function_e4b86469() {
    /#
        path = "<unknown string>";
        cmd = "<unknown string>";
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x8f3c157f, Offset: 0x3d08
// Size: 0x174
function function_51cc2292() {
    /#
        path = "<unknown string>";
        cmd = "<unknown string>";
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
        util::add_devgui(path + "<unknown string>", cmd + "<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x8933067f, Offset: 0x3e88
// Size: 0x2c
function function_9fb69cba() {
    /#
        util::add_devgui("<unknown string>", "<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xdbf706a0, Offset: 0x3ec0
// Size: 0x2cc
function function_354e12a4() {
    /#
        path = "<unknown string>";
        cmd = "<unknown string>";
        var_ab79c6df = "<unknown string>";
        var_b917e8e0 = getarraykeys(level.scoreinfo);
        for (i = 0; i < var_b917e8e0.size; i++) {
            key = var_b917e8e0[i];
            action = level.scoreinfo[key];
            if (isdefined(action) && isdefined(action[#"row"])) {
                if (isdefined(action[#"job_type"])) {
                    keystring = function_9e72a96(key);
                    util::add_devgui(path + "<unknown string>" + keystring[0] + "<unknown string>" + keystring, cmd + action[#"row"]);
                    if (isdefined(action[#"hash_401b1493e5188252"]) && action[#"hash_401b1493e5188252"] == #"ender") {
                        util::add_devgui(path + "<unknown string>" + keystring[0] + "<unknown string>" + keystring, var_ab79c6df + action[#"row"]);
                    }
                }
            }
        }
        var_e625686f = path + "<unknown string>";
        var_f99507b8 = "<unknown string>";
        util::add_devgui(var_e625686f + "<unknown string>", var_f99507b8 + "<unknown string>");
        util::add_devgui(var_e625686f + "<unknown string>", var_f99507b8 + "<unknown string>");
        util::add_devgui(var_e625686f + "<unknown string>", var_f99507b8 + "<unknown string>");
        util::add_devgui(var_e625686f + "<unknown string>", var_f99507b8 + "<unknown string>");
    #/
}

// Namespace devgui/devgui
// Params 0, eflags: 0x4
// Checksum 0x8d8af454, Offset: 0x4198
// Size: 0x1de
function private function_57edec18() {
    /#
        if (isnavvolumeloaded()) {
        }
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        while (1) {
            if (getdvarint(#"scr_drone_camera", 0)) {
                if (isdefined(level.drone_camera)) {
                    waitframe(1);
                    continue;
                }
                player = getplayers()[0];
                if (!isdefined(player)) {
                    waitframe(1);
                    continue;
                }
                drone_camera = spawnvehicle("<unknown string>", player.origin + vectorscale((0, 0, 1), 150), player.angles, "<unknown string>");
                drone_camera.ignoreme = 1;
                drone_camera usevehicle(player, 0);
                level.drone_camera = drone_camera;
            } else if (isdefined(level.drone_camera)) {
                driver = level.drone_camera getseatoccupant(0);
                if (isdefined(driver)) {
                    driver unlink();
                }
                level.drone_camera delete();
            }
            waitframe(1);
        }
    #/
}

