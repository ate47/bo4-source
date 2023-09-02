// Atian COD Tools GSC decompiler test
#using scripts\mp_common\player\player_killed.gsc;
#using scripts\mp_common\player\player_damage.gsc;
#using scripts\mp_common\player\player_disconnect.gsc;
#using scripts\mp_common\player\player_connect.gsc;
#using scripts\mp_common\player\player_callbacks.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\bots\bot_traversals.gsc;
#using scripts\mp_common\gametypes\hostmigration.gsc;
#using scripts\mp_common\gametypes\globallogic_scriptmover.gsc;
#using scripts\mp_common\gametypes\globallogic_actor.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace callback;

// Namespace callback/callbacks
// Params 0, eflags: 0x2
// Checksum 0xb3f9e0cb, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"callback", &__init__, undefined, undefined);
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x6a37f4a0, Offset: 0x130
// Size: 0x14
function __init__() {
    set_default_callbacks();
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0x67dba939, Offset: 0x150
// Size: 0x6c
function on_prematch_end(func, obj) {
    if (self == level) {
        add_callback(#"prematch_end", func, obj);
    } else {
        function_d8abfc3d(#"prematch_end", func, obj);
    }
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0x79c8a58c, Offset: 0x1c8
// Size: 0x3c
function on_changed_specialist(func, obj) {
    add_callback(#"changed_specialist", func, obj);
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0xc8e2adec, Offset: 0x210
// Size: 0x302
function set_default_callbacks() {
    level.callbackstartgametype = &globallogic::callback_startgametype;
    level.callbackplayerconnect = &player::callback_playerconnect;
    level.callbackplayerdisconnect = &player::callback_playerdisconnect;
    level.callbackplayerdamage = &player::callback_playerdamage;
    level.callbackplayerkilled = &player::callback_playerkilled;
    level.var_3a9881cb = &player::function_74b6d714;
    level.callbackplayershielddamageblocked = &player::callback_playershielddamageblocked;
    level.callbackplayermelee = &player::callback_playermelee;
    level.callbackplayerlaststand = &player::callback_playerlaststand;
    level.callbackactorspawned = &globallogic_actor::callback_actorspawned;
    level.callbackactordamage = &globallogic_actor::callback_actordamage;
    level.callbackactorkilled = &globallogic_actor::callback_actorkilled;
    level.callbackactorcloned = &globallogic_actor::callback_actorcloned;
    level.var_6788bf11 = &globallogic_scriptmover::function_8c7ec52f;
    level.callbackvehiclespawned = &globallogic_vehicle::callback_vehiclespawned;
    level.callbackvehicledamage = &globallogic_vehicle::callback_vehicledamage;
    level.callbackvehiclekilled = &globallogic_vehicle::callback_vehiclekilled;
    level.callbackvehicleradiusdamage = &globallogic_vehicle::callback_vehicleradiusdamage;
    level.callbackplayermigrated = &player::callback_playermigrated;
    level.callbackhostmigration = &hostmigration::callback_hostmigration;
    level.callbackhostmigrationsave = &hostmigration::callback_hostmigrationsave;
    level.callbackprehostmigrationsave = &hostmigration::callback_prehostmigrationsave;
    level.callbackbotentereduseredge = &bot::callback_botentereduseredge;
    level.callbackbotcreateplayerbot = &bot::function_c6e29bdf;
    level.callbackbotshutdown = &bot::function_3d575aa3;
    level.var_69959686 = &deployable::function_209fda28;
    level.var_bb1ea3f1 = &deployable::function_84fa8d39;
    level.var_2f64d35 = &deployable::function_cf538621;
    level.var_a28be0a5 = &globallogic::function_991daa12;
    level.var_bd0b5fc1 = &globallogic::function_ec7cf015;
    level._custom_weapon_damage_func = &callback_weapon_damage;
    level._gametype_default = "tdm";
}

