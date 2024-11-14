#using scripts\zm_common\zm_trial;
#using scripts\core_common\system_shared;

#namespace zm_trial_disable_buys;

// Namespace zm_trial_disable_buys/zm_trial_disable_buys
// Params 0, eflags: 0x2
// Checksum 0xbd0449b4, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_disable_buys", &__init__, undefined, undefined);
}

// Namespace zm_trial_disable_buys/zm_trial_disable_buys
// Params 0, eflags: 0x0
// Checksum 0xace5a132, Offset: 0xc0
// Size: 0x33c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_buys", &on_begin, &on_end);
    forcestreamxmodel(#"p8_zm_wall_buy_ar_accurate");
    forcestreamxmodel(#"p8_zm_wall_buy_ar_fastfire");
    forcestreamxmodel(#"p8_zm_wall_buy_ar_modular");
    forcestreamxmodel(#"p8_zm_wall_buy_ar_stealth");
    forcestreamxmodel(#"hash_6af4a0ff3d4ea44c");
    forcestreamxmodel(#"p8_zm_wall_buy_lmg_titan");
    forcestreamxmodel(#"p8_zm_wall_buy_pistol_burst");
    forcestreamxmodel(#"p8_zm_wall_buy_pistol_standard");
    forcestreamxmodel(#"p8_zm_wall_buy_shotgun_pump");
    forcestreamxmodel(#"p8_zm_wall_buy_shotgun_trenchgun");
    forcestreamxmodel(#"p8_zm_wall_buy_smg_accurate");
    forcestreamxmodel(#"p8_zm_wall_buy_smg_mp9");
    forcestreamxmodel(#"p8_zm_wall_buy_smg_drum_pistol");
    forcestreamxmodel(#"p8_zm_wall_buy_smg_fastfire");
    forcestreamxmodel(#"p8_zm_wall_buy_smg_handling");
    forcestreamxmodel(#"hash_1e826c91e070af89");
    forcestreamxmodel(#"p8_zm_wall_buy_tr_leveraction");
    forcestreamxmodel(#"p8_zm_wall_buy_tr_longburst");
    forcestreamxmodel(#"p8_zm_wall_buy_tr_powersemi");
    forcestreamxmodel(#"p8_zm_wall_buy_symbol_01");
    forcestreamxmodel(#"p8_zm_wall_buy_symbol_01_middle");
    forcestreamxmodel(#"p8_zm_wall_buy_symbol_01_reverse");
    forcestreamxmodel(#"hash_38b107b1b645837d");
}

// Namespace zm_trial_disable_buys/zm_trial_disable_buys
// Params 2, eflags: 0x4
// Checksum 0xcb56358f, Offset: 0x408
// Size: 0x14
function private on_begin(local_client_num, params) {
    
}

// Namespace zm_trial_disable_buys/zm_trial_disable_buys
// Params 1, eflags: 0x4
// Checksum 0x613fd966, Offset: 0x428
// Size: 0xc
function private on_end(local_client_num) {
    
}

