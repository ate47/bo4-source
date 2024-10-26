#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_frontend_zm_bgb_chance;

/#

    // Namespace zm_frontend_zm_bgb_chance/frontend_zm_bgb_chance
    // Params 0, eflags: 0x0
    // Checksum 0x22244d81, Offset: 0x70
    // Size: 0x1c
    function zm_frontend_bgb_slots_logic() {
        level thread zm_frontend_bgb_devgui();
    }

    // Namespace zm_frontend_zm_bgb_chance/frontend_zm_bgb_chance
    // Params 0, eflags: 0x0
    // Checksum 0x84a7543, Offset: 0x98
    // Size: 0x1c4
    function zm_frontend_bgb_devgui() {
        setdvar(#"bgb_test_power_boost_devgui", "<dev string:x38>");
        setdvar(#"bgb_test_success_fail_devgui", "<dev string:x38>");
        bgb_devgui_base = "<dev string:x3b>";
        a_n_amounts = array(1, 5, 10, 100);
        for (i = 0; i < a_n_amounts.size; i++) {
            n_amount = a_n_amounts[i];
            adddebugcommand(bgb_devgui_base + i + "<dev string:x57>" + n_amount + "<dev string:x61>" + n_amount + "<dev string:x74>");
        }
        adddebugcommand("<dev string:x7a>" + "<dev string:xa9>" + "<dev string:xaf>" + "<dev string:xcd>" + 1 + "<dev string:xd1>");
        adddebugcommand("<dev string:xd6>" + "<dev string:xa9>" + "<dev string:x106>" + "<dev string:xcd>" + 1 + "<dev string:xd1>");
        level thread bgb_devgui_think();
    }

    // Namespace zm_frontend_zm_bgb_chance/frontend_zm_bgb_chance
    // Params 0, eflags: 0x0
    // Checksum 0x95bea787, Offset: 0x268
    // Size: 0x1c8
    function bgb_devgui_think() {
        b_powerboost_toggle = 0;
        b_successfail_toggle = 0;
        for (;;) {
            n_val_powerboost = getdvarstring(#"bgb_test_power_boost_devgui");
            n_val_successfail = getdvarstring(#"bgb_test_success_fail_devgui");
            if (n_val_powerboost != "<dev string:x38>") {
                b_powerboost_toggle = !b_powerboost_toggle;
                level clientfield::set("<dev string:x125>", b_powerboost_toggle);
                if (b_powerboost_toggle) {
                    iprintlnbold("<dev string:x142>");
                } else {
                    iprintlnbold("<dev string:x15a>");
                }
            }
            if (n_val_successfail != "<dev string:x38>") {
                b_successfail_toggle = !b_successfail_toggle;
                level clientfield::set("<dev string:x173>", b_successfail_toggle);
                if (b_successfail_toggle) {
                    iprintlnbold("<dev string:x191>");
                } else {
                    iprintlnbold("<dev string:x1a0>");
                }
            }
            setdvar(#"bgb_test_power_boost_devgui", "<dev string:x38>");
            setdvar(#"bgb_test_success_fail_devgui", "<dev string:x38>");
            wait 0.5;
        }
    }

#/
