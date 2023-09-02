// Atian COD Tools GSC decompiler test
#using scripts\core_common\doors_shared.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_maldives;

// Namespace mp_maldives/level_init
// Params 1, eflags: 0x40
// Checksum 0x5b2df0cf, Offset: 0x88
// Size: 0x76
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
    level.var_cddcf1e3 = &function_261b0d99;
    level.var_abaf1ec9 = &function_eda70d10;
    level.var_6e8625fe = 1;
}

// Namespace mp_maldives/mp_maldives
// Params 0, eflags: 0x1 linked
// Checksum 0x7fa04089, Offset: 0x108
// Size: 0x2e
function function_261b0d99() {
    self.pers[#"mpcommander"] = #"hash_635efe14dd896b10";
}

// Namespace mp_maldives/mp_maldives
// Params 0, eflags: 0x1 linked
// Checksum 0x4a0501b9, Offset: 0x140
// Size: 0x2e
function function_eda70d10() {
    self.pers[#"mpcommander"] = #"hash_5e95a759ec5f8381";
}

