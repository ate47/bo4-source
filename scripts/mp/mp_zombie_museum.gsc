// Atian COD Tools GSC decompiler test
#include scripts/mp_common/load.gsc;
#include scripts/core_common/compass.gsc;

#namespace mp_zombie_museum;

// Namespace mp_zombie_museum/level_init
// Params 1, eflags: 0x40
// Checksum 0x72191b6a, Offset: 0xf0
// Size: 0x234
function event_handler[level_init] main(eventstruct) {
    load::main();
    level.cleandepositpoints = array((-1664, 716, 134), (1996, 0, 14), (-696, -168, 110), (2208, -2240, 78), (-36, -2084, 78));
    compass::setupminimap("");
    var_6ed52f9d = spawn("script_model", (-11, -1843, 71.5));
    var_6ed52f9d.angles = vectorscale((0, 1, 0), 281.427);
    var_6ed52f9d setmodel("p7_mou_flat_tarp_01_blue");
    var_869bfc5f = spawn("script_model", (62.5, -1891, 74));
    var_869bfc5f.angles = (0, 48.96, -180);
    var_869bfc5f setmodel("p8_col_board_plywood_old_large_01");
    var_68cdc0c3 = spawn("script_model", (46.5, -1939, 73));
    var_68cdc0c3.angles = vectorscale((0, 1, 0), 31.36);
    var_68cdc0c3 setmodel("p8_col_board_plywood_old_large_01");
    carpet = spawn("script_model", (111.5, -2010, 72));
    carpet.angles = vectorscale((0, 1, 0), 339.9);
    carpet setmodel("p8_zm_esc_rug_rectangle_02_crooked");
}

