// Atian COD Tools GSC decompiler test
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_frontend_zm_bgb_chance;

// Namespace zm_frontend_zm_bgb_chance/frontend_zm_bgb_chance
// Params 0, eflags: 0x0
// Checksum 0x22244d81, Offset: 0x70
// Size: 0x1c
function zm_frontend_bgb_slots_logic() {
    /#
        level thread zm_frontend_bgb_devgui();
    #/
}

// Namespace zm_frontend_zm_bgb_chance/frontend_zm_bgb_chance
// Params 0, eflags: 0x0
// Checksum 0x84a7543, Offset: 0x98
// Size: 0x1c4
function zm_frontend_bgb_devgui() {
    /#
        setdvar(#"bgb_test_power_boost_devgui", "<unknown string>");
        setdvar(#"bgb_test_success_fail_devgui", "<unknown string>");
        bgb_devgui_base = "<unknown string>";
        a_n_amounts = array(1, 5, 10, 100);
        for (i = 0; i < a_n_amounts.size; i++) {
            n_amount = a_n_amounts[i];
            adddebugcommand(bgb_devgui_base + i + "<unknown string>" + n_amount + "<unknown string>" + n_amount + "<unknown string>");
        }
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + 1 + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + 1 + "<unknown string>");
        level thread bgb_devgui_think();
    #/
}

// Namespace zm_frontend_zm_bgb_chance/frontend_zm_bgb_chance
// Params 0, eflags: 0x0
// Checksum 0x95bea787, Offset: 0x268
// Size: 0x1c8
function bgb_devgui_think() {
    /#
        b_powerboost_toggle = 0;
        b_successfail_toggle = 0;
        for (;;) {
            n_val_powerboost = getdvarstring(#"bgb_test_power_boost_devgui");
            n_val_successfail = getdvarstring(#"bgb_test_success_fail_devgui");
            if (n_val_powerboost != "<unknown string>") {
                b_powerboost_toggle = !b_powerboost_toggle;
                level clientfield::set("<unknown string>", b_powerboost_toggle);
                if (b_powerboost_toggle) {
                    iprintlnbold("<unknown string>");
                } else {
                    iprintlnbold("<unknown string>");
                }
            }
            if (n_val_successfail != "<unknown string>") {
                b_successfail_toggle = !b_successfail_toggle;
                level clientfield::set("<unknown string>", b_successfail_toggle);
                if (b_successfail_toggle) {
                    iprintlnbold("<unknown string>");
                } else {
                    iprintlnbold("<unknown string>");
                }
            }
            setdvar(#"bgb_test_power_boost_devgui", "<unknown string>");
            setdvar(#"bgb_test_success_fail_devgui", "<unknown string>");
            wait(0.5);
        }
    #/
}

