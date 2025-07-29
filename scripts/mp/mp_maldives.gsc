#using scripts\core_common\compass;
#using scripts\core_common\doors_shared;
#using scripts\mp_common\load;

#namespace mp_maldives;

// Namespace mp_maldives/level_init
// Params 1, eflags: 0x40
// Checksum 0x5b2df0cf, Offset: 0x88
// Size: 0x76
function event_handler[level_init] main( eventstruct )
{
    load::main();
    compass::setupminimap( "" );
    level.var_cddcf1e3 = &function_261b0d99;
    level.var_abaf1ec9 = &function_eda70d10;
    level.var_6e8625fe = 1;
}

// Namespace mp_maldives/mp_maldives
// Params 0
// Checksum 0x7fa04089, Offset: 0x108
// Size: 0x2e
function function_261b0d99()
{
    self.pers[ #"mpcommander" ] = #"blops_commander_maldives";
}

// Namespace mp_maldives/mp_maldives
// Params 0
// Checksum 0x4a0501b9, Offset: 0x140
// Size: 0x2e
function function_eda70d10()
{
    self.pers[ #"mpcommander" ] = #"cdp_commander_maldives";
}

