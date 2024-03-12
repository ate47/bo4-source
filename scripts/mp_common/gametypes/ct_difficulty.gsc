// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_ui.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace ct_difficulty;

// Namespace ct_difficulty/ct_difficulty
// Params 0, eflags: 0x0
// Checksum 0x24585b2, Offset: 0xf8
// Size: 0x242
function function_be562a72() {
    level.ctdifficulty = 0;
    switch (level.ctdifficulty) {
    case 0:
        level.var_90bb9821 = 0;
        level.var_df0a0911 = "bot_tacstate_easy_mp_ct";
        level.var_eea9be19 = 150;
        level.var_1ecfe3a2 = 150;
        level.var_abdff161 = 1;
        level.var_b0436df5 = 2000;
        level.var_30675389 = 3000;
        level.var_39c7b92c = 1;
        return;
    case 1:
        level.var_df0a0911 = "bot_tacstate_easy_mp_ct";
        level.var_eea9be19 = 50;
        level.var_1ecfe3a2 = 250;
        level.var_abdff161 = 1;
        level.var_b0436df5 = 2000;
        level.var_30675389 = 3000;
        level.var_39c7b92c = 1;
        return;
    case 2:
        level.var_df0a0911 = "bot_tacstate_mp_ct";
        level.var_eea9be19 = 100;
        level.var_abdff161 = 0.35;
        level.var_b0436df5 = 500;
        level.var_30675389 = 1000;
        level.var_39c7b92c = 0;
        return;
    case 3:
        level.var_df0a0911 = "bot_tacstate_mp_ct";
        level.var_eea9be19 = 150;
        level.var_abdff161 = 0;
        level.var_b0436df5 = 400;
        level.var_30675389 = 500;
        level.var_39c7b92c = 0;
        return;
    }
}

// Namespace ct_difficulty/ct_difficulty
// Params 3, eflags: 0x0
// Checksum 0xc9721e51, Offset: 0x348
// Size: 0x4e
function bot_set_difficulty(var_29e78c21, var_daab64c2, var_de2ce1d3) {
    self.bot.var_b2b8f0b6 = var_29e78c21;
    self.bot.var_e8c941d6 = var_daab64c2;
    self.var_abdff161 = var_de2ce1d3;
}

