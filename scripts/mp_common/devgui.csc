// Atian COD Tools GSC decompiler test
#include script_5de8a8ac9320a0bf;
#include scripts/core_common/system_shared.csc;

#namespace mp_devgui;

// Namespace mp_devgui/devgui
// Params 0, eflags: 0x2
// Checksum 0x47758c37, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_devgui", &__init__, undefined, undefined);
}

// Namespace mp_devgui/devgui
// Params 0, eflags: 0x1 linked
// Checksum 0x752a5251, Offset: 0xe0
// Size: 0x26
function __init__() {
    level.var_f9f04b00 = debug_center_screen::register("debug_center_screen_instance");
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0xd0578543, Offset: 0x110
// Size: 0x4e
function remove_mp_contracts_devgui(localclientnum) {
    /#
        if (level.mp_contracts_devgui_added === 1) {
            /#
                adddebugcommand(localclientnum, "<unknown string>");
            #/
            level.mp_contracts_devgui_added = undefined;
        }
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x93f91176, Offset: 0x168
// Size: 0x112
function create_mp_contracts_devgui(localclientnum) {
    /#
        level notify(#"create_mp_contracts_devgui_singleton");
        level endon(#"create_mp_contracts_devgui_singleton");
        remove_mp_contracts_devgui(localclientnum);
        waitframe(1);
        if (0) {
            return;
        }
        frontend_slots = 3;
        for (slot = 0; slot < frontend_slots; slot++) {
            add_contract_slot(localclientnum, slot);
            wait(0.1);
        }
        wait(0.1);
        add_blackjack_contract(localclientnum);
        wait(0.1);
        add_devgui_scheduler(localclientnum);
        level thread watch_devgui();
        level.mp_contracts_devgui_added = 1;
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x453dd64b, Offset: 0x288
// Size: 0x436
function add_blackjack_contract(localclientnum) {
    /#
        root = "<unknown string>";
        next_cmd = "<unknown string>";
        add_blackjack_contract_set_count(localclientnum, root, 0);
        add_blackjack_contract_set_count(localclientnum, root, 1);
        add_blackjack_contract_set_count(localclientnum, root, 5);
        add_blackjack_contract_set_count(localclientnum, root, 10);
        add_blackjack_contract_set_count(localclientnum, root, 200);
        add_blackjack_contract_set_count(localclientnum, root, 3420);
        root = "<unknown string>";
        stat_write = "<unknown string>";
        set_blackjack = "<unknown string>";
        cmds = stat_write + "<unknown string>";
        add_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        cmds = stat_write + "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + stat_write + "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + set_blackjack + "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + set_blackjack + "<unknown string>";
        add_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        cmds = stat_write + "<unknown string>";
        add_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        cmds = stat_write + "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + stat_write + "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + set_blackjack + "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + set_blackjack + "<unknown string>";
        add_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        side_bet_root = "<unknown string>";
        stat_write_bjc = "<unknown string>";
        stat_write_bjc_master = "<unknown string>";
        for (i = 0; i <= 6; i++) {
            cmds = stat_write_bjc + "<unknown string>" + i;
            cmds = cmds + next_cmd;
            cmds = cmds + stat_write_bjc + "<unknown string>" + i;
            cmds = cmds + next_cmd;
            cmds = cmds + stat_write_bjc_master + "<unknown string>" + (i == 6 ? 1 : 0);
            cmds = cmds + next_cmd;
            cmds = cmds + stat_write_bjc_master + "<unknown string>" + (i == 6 ? 1 : 0);
            add_devgui_cmd(localclientnum, side_bet_root + "<unknown string>" + i, cmds);
        }
    #/
}

// Namespace mp_devgui/devgui
// Params 3, eflags: 0x0
// Checksum 0x3b0735a7, Offset: 0x6c8
// Size: 0xa4
function add_blackjack_contract_set_count(localclientnum, root, contract_count) {
    /#
        cmds = "<unknown string>" + contract_count;
        item_text = contract_count == 1 ? "<unknown string>" : "<unknown string>";
        add_devgui_cmd(localclientnum, root + "<unknown string>" + contract_count + item_text + "<unknown string>" + contract_count, cmds);
    #/
}

// Namespace mp_devgui/devgui
// Params 2, eflags: 0x0
// Checksum 0xf815aff8, Offset: 0x778
// Size: 0x5d4
function add_contract_slot(localclientnum, slot) {
    /#
        root = "<unknown string>" + slot;
        add_weekly = 1;
        add_daily = 1;
        switch (slot) {
        case 0:
            root = root + "<unknown string>";
            add_daily = 0;
            break;
        case 1:
            root = root + "<unknown string>";
            add_daily = 0;
            break;
        case 2:
            root = root + "<unknown string>";
            add_weekly = 0;
            break;
        default:
            root = root + "<unknown string>";
            break;
        }
        root = root + "<unknown string>" + slot + "<unknown string>";
        table = #"hash_14ee3b02a56347de";
        num_rows = tablelookuprowcount(table);
        stat_write = "<unknown string>" + slot;
        next_cmd = "<unknown string>";
        max_title_width = 30;
        ellipsis = "<unknown string>";
        truncated_title_end_index = max_title_width - ellipsis.size - 1;
        cmds_added = 0;
        max_cmd_to_add = 5;
        for (row = 1; row < num_rows; row++) {
            row_info = tablelookuprow(table, row);
            if (strisnumber(row_info[0])) {
                table_index = int(row_info[0]);
                is_daily_index = table_index >= 1000;
                is_weekly_index = !is_daily_index;
                if (is_daily_index && !add_daily) {
                    continue;
                }
                if (is_weekly_index && !add_weekly) {
                    continue;
                }
                title_str = row_info[4].size < 0 ? row_info[4] : row_info[3];
                title = makelocalizedstring(#"contract_" + title_str);
                if (title.size > max_title_width) {
                    title = getsubstr(title, 0, truncated_title_end_index) + ellipsis;
                }
                submenu_name = title + "<unknown string>" + table_index + "<unknown string>";
                challenge_type = is_weekly_index ? "<unknown string>" : "<unknown string>";
                cmds = stat_write + "<unknown string>" + table_index;
                cmds = cmds + next_cmd;
                cmds = cmds + stat_write + "<unknown string>";
                cmds = cmds + next_cmd;
                cmds = cmds + stat_write + "<unknown string>";
                cmds = cmds + next_cmd;
                cmds = cmds + stat_write + "<unknown string>";
                cmds = cmds + next_cmd;
                cmds = cmds + "<unknown string>";
                cmds = wrap_dvarconfig_cmds(cmds);
                if (add_daily && add_weekly) {
                    by_index_name = "<unknown string>";
                } else if (add_daily) {
                    by_index_name = "<unknown string>";
                } else if (add_weekly) {
                    by_index_name = "<unknown string>";
                } else {
                    by_index_name = "<unknown string>";
                }
                index_submenu_name = submenu_name + "<unknown string>" + table_index;
                add_devgui_cmd(localclientnum, root + challenge_type + submenu_name, cmds);
                add_devgui_cmd(localclientnum, root + by_index_name + index_submenu_name, cmds);
                cmds_added++;
                if (cmds_added >= max_cmd_to_add) {
                    wait(0.1);
                    cmds_added = 0;
                }
            }
        }
        cmds = stat_write + "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + stat_write + "<unknown string>";
        add_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0xb6b56ee, Offset: 0xd58
// Size: 0x29c
function add_devgui_scheduler(localclientnum) {
    /#
        root = "<unknown string>";
        root_daily = root + "<unknown string>";
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 86400);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 1);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 3);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 10);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 60);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 120);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 600);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 1800);
        add_contract_scheduler_daily_duration(localclientnum, root_daily, "<unknown string>", 3600);
        cmds = "<unknown string>";
        add_watched_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        cmds = "<unknown string>";
        add_watched_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        cmds = "<unknown string>";
        add_watched_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        cmds = "<unknown string>";
        add_watched_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
        cmds = "<unknown string>";
        add_watched_devgui_cmd(localclientnum, root + "<unknown string>", cmds);
    #/
}

// Namespace mp_devgui/devgui
// Params 3, eflags: 0x0
// Checksum 0x33b501e0, Offset: 0x1000
// Size: 0x6c
function add_watched_devgui_cmd(localclientnum, root, cmds) {
    /#
        next_cmd = "<unknown string>";
        cmds = cmds + next_cmd;
        cmds = cmds + "<unknown string>";
        add_devgui_cmd(localclientnum, root, cmds);
    #/
}

// Namespace mp_devgui/devgui
// Params 4, eflags: 0x0
// Checksum 0xf1b6cbc7, Offset: 0x1078
// Size: 0xb4
function add_contract_scheduler_daily_duration(localclientnum, root, label, daily_duration) {
    /#
        next_cmd = "<unknown string>";
        cmds = "<unknown string>" + daily_duration;
        cmds = cmds + next_cmd;
        cmds = cmds + "<unknown string>";
        cmds = wrap_dvarconfig_cmds(cmds);
        add_devgui_cmd(localclientnum, root + label, cmds);
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x6199e95c, Offset: 0x1138
// Size: 0x58
function wrap_dvarconfig_cmds(cmds) {
    /#
        next_cmd = "<unknown string>";
        newcmds = "<unknown string>";
        newcmds = newcmds + next_cmd;
        newcmds = newcmds + cmds;
        return newcmds;
    #/
}

// Namespace mp_devgui/devgui
// Params 3, eflags: 0x0
// Checksum 0x9177e5f7, Offset: 0x1198
// Size: 0x64
function add_devgui_cmd(localclientnum, menu_path, cmds) {
    /#
        /#
            adddebugcommand(localclientnum, "<unknown string>" + menu_path + "<unknown string>" + cmds + "<unknown string>");
        #/
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x8d713fb7, Offset: 0x1208
// Size: 0xe0
function calculate_schedule_start_time(ref_time) {
    /#
        new_start_time = ref_time;
        daily_duration = getdvarint(#"contracts_daily_duration", 60);
        weekly_duration = daily_duration * 7;
        schedule_duration = weekly_duration * 8;
        max_multiple = int(ref_time / schedule_duration);
        half_max_multiple = int(max_multiple / 2);
        new_start_time = new_start_time - half_max_multiple * schedule_duration;
        return new_start_time;
    #/
}

// Namespace mp_devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0x3e131207, Offset: 0x12f0
// Size: 0x2c0
function watch_devgui() {
    /#
        level notify(#"watch_devgui_client_mp_singleton");
        level endon(#"watch_devgui_client_mp_singleton");
        while (1) {
            wait(0.1);
            if (!dvar_has_value("<unknown string>")) {
                continue;
            }
            saved_dvarconfigenabled = getdvarint(#"dvarconfigenabled", 1);
            if (dvar_has_value("<unknown string>")) {
                setdvar(#"dvarconfigenabled", 0);
                now = getutc();
                setdvar(#"contracts_start_time", calculate_schedule_start_time(now));
                clear_dvar("<unknown string>");
            }
            if (dvar_has_value("<unknown string>")) {
                update_contract_start_time(-1);
                clear_dvar("<unknown string>");
            }
            if (dvar_has_value("<unknown string>")) {
                update_contract_start_time(-7);
                clear_dvar("<unknown string>");
            }
            if (dvar_has_value("<unknown string>")) {
                update_contract_start_time(1);
                clear_dvar("<unknown string>");
            }
            if (dvar_has_value("<unknown string>")) {
                update_contract_start_time(7);
                clear_dvar("<unknown string>");
            }
            if (saved_dvarconfigenabled != getdvarint(#"dvarconfigenabled", 1)) {
                setdvar(#"dvarconfigenabled", saved_dvarconfigenabled);
            }
            clear_dvar("<unknown string>");
        }
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x6ae82046, Offset: 0x15b8
// Size: 0xac
function update_contract_start_time(delta_days) {
    /#
        setdvar(#"dvarconfigenabled", 0);
        start_time = get_schedule_start_time();
        daily_duration = getdvarint(#"contracts_daily_duration", 60);
        setdvar(#"contracts_start_time", start_time + daily_duration * delta_days);
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x2e6edea0, Offset: 0x1670
// Size: 0x30
function dvar_has_value(dvar_name) {
    /#
        return getdvarint(dvar_name, 0) != 0;
    #/
}

// Namespace mp_devgui/devgui
// Params 1, eflags: 0x0
// Checksum 0x6f9372be, Offset: 0x16a8
// Size: 0x2c
function clear_dvar(dvar_name) {
    /#
        setdvar(dvar_name, 0);
    #/
}

// Namespace mp_devgui/devgui
// Params 0, eflags: 0x0
// Checksum 0xdb6474dd, Offset: 0x16e0
// Size: 0x34
function get_schedule_start_time() {
    /#
        return getdvarint(#"contracts_start_time", 1463418000);
    #/
}

