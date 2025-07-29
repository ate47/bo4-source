#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\dialog_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;

#namespace battlechatter;

// Namespace battlechatter/battlechatter
// Params 0, eflags: 0x2
// Checksum 0xe5ae67f5, Offset: 0x418
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"battlechatter", &__init__, undefined, undefined );
}

// Namespace battlechatter/battlechatter
// Params 0
// Checksum 0x1f4aa679, Offset: 0x460
// Size: 0x114
function __init__()
{
    level.var_2829c23d = &function_50e36ba7;
    level.var_44e74ef4 = &function_f1d27638;
    level.allowbattlechatter[ #"bc" ] = isdefined( getgametypesetting( #"allowbattlechatter" ) ) && getgametypesetting( #"allowbattlechatter" );
    level.allowspecialistdialog = dialog_shared::mpdialog_value( "enableHeroDialog", 0 ) && isdefined( level.allowbattlechatter[ #"bc" ] ) && level.allowbattlechatter[ #"bc" ];
    level thread function_4bc12499();
}

// Namespace battlechatter/battlechatter
// Params 1
// Checksum 0xaf8aa12f, Offset: 0x580
// Size: 0x84
function function_b79dc4e7( player )
{
    teammask = getteammask( player.team );
    
    for ( teamindex = 0; teammask > 1 ; teamindex++ )
    {
        teammask >>= 1;
    }
    
    if ( teamindex % 2 )
    {
        return "blops_taacom";
    }
    
    return "cdp_taacom";
}

// Namespace battlechatter/battlechatter
// Params 0
// Checksum 0x13552c9b, Offset: 0x610
// Size: 0xf8
function function_4bc12499()
{
    level endon( #"death" );
    
    while ( true )
    {
        wait_result = level waittill( #"play_death_vox" );
        players = getlocalplayers();
        player = players[ 0 ];
        
        if ( isdefined( player ) )
        {
            dialogkey = player get_death_vox( wait_result.mod, wait_result.roleindex );
            
            if ( isdefined( dialogkey ) && isdefined( wait_result.body ) )
            {
                wait_result.body playsound( 0, dialogkey );
            }
        }
    }
}

// Namespace battlechatter/battlechatter
// Params 2
// Checksum 0xcd3ae2da, Offset: 0x710
// Size: 0x86
function mpdialog_value( mpdialogkey, defaultvalue )
{
    if ( !isdefined( mpdialogkey ) )
    {
        return defaultvalue;
    }
    
    mpdialog = struct::get_script_bundle( "mpdialog", "mpdialog_default" );
    
    if ( !isdefined( mpdialog ) )
    {
        return defaultvalue;
    }
    
    structvalue = mpdialog.( mpdialogkey );
    
    if ( !isdefined( structvalue ) )
    {
        return defaultvalue;
    }
    
    return structvalue;
}

// Namespace battlechatter/battlechatter
// Params 1
// Checksum 0x7e721adf, Offset: 0x7a0
// Size: 0x142
function function_f1d27638( var_f7f4481f )
{
    if ( !isdefined( var_f7f4481f ) || !isdefined( var_f7f4481f.eventid ) )
    {
        return;
    }
    
    switch ( var_f7f4481f.eventid )
    {
        case 0:
            thread function_50e36ba7( var_f7f4481f.var_40209f44, var_f7f4481f.weapon, var_f7f4481f.var_3d136cd9, var_f7f4481f.var_7e98b410 );
            break;
        case 2:
            thread function_ee8935da( var_f7f4481f.var_3d136cd9 );
            break;
        case 3:
        case 4:
        case 5:
            thread function_bf569dab( var_f7f4481f.var_40209f44, var_f7f4481f.var_3d136cd9, var_f7f4481f.eventid, var_f7f4481f.weapon );
            break;
    }
}

// Namespace battlechatter/battlechatter
// Params 2
// Checksum 0x35005870, Offset: 0x8f0
// Size: 0x256
function get_death_vox( meansofdeath, roleindex )
{
    bundlename = function_361aa16d( roleindex );
    
    if ( !isdefined( bundlename ) )
    {
        return;
    }
    
    if ( isdefined( meansofdeath ) && meansofdeath == "MOD_META" && ( isdefined( self.pers[ #"changed_specialist" ] ) ? self.pers[ #"changed_specialist" ] : 0 ) )
    {
        bundlename = self.var_89c4a60f;
    }
    
    playerbundle = struct::get_script_bundle( "mpdialog_player", bundlename );
    
    if ( !isdefined( playerbundle ) )
    {
        return;
    }
    
    if ( isdefined( meansofdeath ) )
    {
        switch ( meansofdeath )
        {
            case #"mod_unknown":
                return playerbundle.exertdeath;
            case #"mod_burned":
                if ( function_fc261b83() )
                {
                    return "";
                }
                else
                {
                    return playerbundle.exertdeathburned;
                }
            case #"mod_melee_weapon_butt":
                return playerbundle.exertdeathstabbed;
            case #"mod_head_shot":
                return playerbundle.var_207908de;
            case #"mod_falling":
                return playerbundle.var_1dfcabbd;
            case #"mod_drown":
                return playerbundle.exertdeathdrowned;
            case #"mod_explosive":
                return playerbundle.var_44d86dec;
            case #"mod_dot_self":
                return playerbundle.var_48305ed9;
            case #"mod_dot":
                return playerbundle.var_f8b4bcc1;
            case #"mod_melee_assassinate":
                return playerbundle.exertdeathstabbed;
            case #"mod_electrocuted":
                return playerbundle.exertdeathelectrocuted;
        }
    }
    
    return playerbundle.exertdeath;
}

// Namespace battlechatter/battlechatter
// Params 4
// Checksum 0xeb82a991, Offset: 0xb50
// Size: 0x192, Type: bool
function function_d804d2f0( localclientnum, speakingplayer, player, allyradiussq )
{
    if ( !isdefined( player ) )
    {
        return false;
    }
    
    if ( !isdefined( player.origin ) )
    {
        return false;
    }
    
    if ( !isalive( player ) )
    {
        return false;
    }
    
    if ( player underwater() )
    {
        return false;
    }
    
    if ( player isdriving( localclientnum ) )
    {
        return false;
    }
    
    if ( function_e75c64a4( localclientnum ) )
    {
        return false;
    }
    
    if ( !isdefined( speakingplayer ) )
    {
        return false;
    }
    
    if ( !isdefined( speakingplayer.origin ) )
    {
        return false;
    }
    
    if ( player == speakingplayer || player.team != speakingplayer.team )
    {
        return false;
    }
    
    if ( player function_715f2ffc( speakingplayer ) )
    {
        return false;
    }
    
    if ( player hasperk( localclientnum, "specialty_quieter" ) )
    {
        return false;
    }
    
    distsq = distancesquared( speakingplayer.origin, player.origin );
    
    if ( distsq > allyradiussq )
    {
        return false;
    }
    
    return true;
}

// Namespace battlechatter/battlechatter
// Params 3
// Checksum 0x4630b0ec, Offset: 0xcf0
// Size: 0x114
function function_db89c38f( localclientnum, speakingplayer, allyradiussq )
{
    allies = [];
    
    foreach ( player in getplayers( localclientnum ) )
    {
        if ( !function_d804d2f0( localclientnum, speakingplayer, player, allyradiussq ) )
        {
            continue;
        }
        
        allies[ allies.size ] = player;
    }
    
    allies = arraysort( allies, speakingplayer.origin );
    
    if ( !isdefined( allies ) || allies.size == 0 )
    {
        return undefined;
    }
    
    return allies[ 0 ];
}

// Namespace battlechatter/battlechatter
// Params 6
// Checksum 0xa22c03f5, Offset: 0xe10
// Size: 0x1ec
function function_d2f35e13( localclientnum, successplayer, weapon, var_6ac148bc, var_5d738b56, seed )
{
    while ( isdefined( var_6ac148bc ) && soundplaying( var_6ac148bc ) )
    {
        waitframe( 1 );
    }
    
    wait 0.4;
    
    if ( !isdefined( successplayer ) )
    {
        return;
    }
    
    successreactionradius = mpdialog_value( "SuccessReactionRadius", 500 );
    
    if ( function_506f762f( weapon ) && isdefined( var_5d738b56 ) && isplayer( var_5d738b56 ) )
    {
        if ( function_d804d2f0( localclientnum, successplayer, var_5d738b56, successreactionradius * successreactionradius ) )
        {
            var_8a6b001a = var_5d738b56;
        }
    }
    else
    {
        var_8a6b001a = function_db89c38f( localclientnum, successplayer, successreactionradius * successreactionradius );
    }
    
    if ( !isdefined( var_8a6b001a ) )
    {
        return;
    }
    
    bundlename = var_8a6b001a getmpdialogname();
    
    if ( !isdefined( bundlename ) )
    {
        return;
    }
    
    playerbundle = struct::get_script_bundle( "mpdialog_player", bundlename );
    
    if ( !isdefined( playerbundle ) )
    {
        return;
    }
    
    var_81485093 = function_6bb302ba( weapon, playerbundle );
    
    if ( !isdefined( var_81485093 ) )
    {
        return;
    }
    
    var_8a6b001a function_4b126e4c( localclientnum, var_81485093, seed );
}

// Namespace battlechatter/battlechatter
// Params 2
// Checksum 0xc0062c72, Offset: 0x1008
// Size: 0x6f2
function function_20edb636( weapon, playerbundle )
{
    returnstruct = spawnstruct();
    
    switch ( weapon.name )
    {
        case #"hero_annihilator":
            returnstruct.var_17a094cf = playerbundle.annihilatorweaponsuccess;
            break;
        case #"sig_buckler_dw":
        case #"sig_buckler_turret":
            returnstruct.var_17a094cf = playerbundle.var_b8e59ed0;
            returnstruct.startdelay = mpdialog_value( "battleshieldSuccessDialogBuffer", 0 );
            break;
        case #"claymore":
            returnstruct.var_17a094cf = playerbundle.var_b4d5ca8f;
            break;
        case #"dog_ai_defaultmelee":
            returnstruct.var_17a094cf = playerbundle.var_67888352;
            returnstruct.startdelay = playerbundle.var_aaf0d901;
            break;
        case #"hero_flamethrower":
            returnstruct.var_17a094cf = playerbundle.purifierweaponsuccess;
            returnstruct.startdelay = playerbundle.var_f88f40a;
            break;
        case #"eq_gravityslam":
            returnstruct.var_17a094cf = playerbundle.var_d1c8dc4;
            break;
        case #"gun_mini_turret":
            returnstruct.var_17a094cf = playerbundle.var_3755ba19;
            break;
        case #"sig_bow_quickshot":
            returnstruct.var_17a094cf = playerbundle.sparrowweaponsuccess;
            break;
        case #"hash_5a4932f4b8d8b37a":
            returnstruct.var_17a094cf = playerbundle.var_dc2e66f;
            break;
        case #"shock_rifle":
            returnstruct.var_17a094cf = playerbundle.tempestweaponsuccess;
            break;
        case #"eq_tripwire":
            returnstruct.var_17a094cf = playerbundle.var_eb8b9d7a;
            break;
        case #"hero_pineapplegun":
            returnstruct.var_17a094cf = playerbundle.warmachineweaponsuccess;
            returnstruct.startdelay = mpdialog_value( "pineappleGunSuccessDialogBuffer", 0 );
            break;
        case #"gadget_health_boost":
        case #"gadget_cleanse":
            returnstruct.var_17a094cf = playerbundle.var_febcf0b;
            break;
        case #"eq_concertina_wire":
            returnstruct.var_17a094cf = playerbundle.var_d5983ddb;
            break;
        case #"eq_swat_grenade":
        case #"hash_3f62a872201cd1ce":
        case #"hash_5825488ac68418af":
            returnstruct.var_17a094cf = playerbundle.var_bd81e586;
            returnstruct.startdelay = mpdialog_value( "nineBangSuccessDialogBuffer", 0 );
            break;
        case #"eq_grapple":
            returnstruct.var_17a094cf = playerbundle.var_390929f1;
            break;
        case #"molotov_fire":
        case #"eq_molotov":
            returnstruct.var_17a094cf = playerbundle.var_e64f9f9a;
            returnstruct.startdelay = mpdialog_value( "playerDialogBuffer", 0 );
            break;
        case #"gadget_radiation_field":
            returnstruct.var_17a094cf = playerbundle.var_ad1379f5;
            returnstruct.startdelay = mpdialog_value( "radiationFieldPodSuccessDialogBuffer", 0 );
            break;
        case #"eq_sensor":
            returnstruct.var_17a094cf = playerbundle.var_ef10cbc3;
            break;
        case #"gadget_supplypod":
            returnstruct.var_17a094cf = playerbundle.var_383d5df3;
            returnstruct.startdelay = mpdialog_value( "supplyPodSuccessDialogBuffer", 0 );
            break;
        case #"gadget_vision_pulse":
            returnstruct.var_17a094cf = playerbundle.visionpulseabilitysuccess;
            break;
        case #"eq_localheal":
            returnstruct.var_17a094cf = playerbundle.var_74dd2839;
            break;
        case #"gadget_icepick":
            returnstruct.var_17a094cf = playerbundle.var_e870e40c;
            break;
        case #"eq_hawk":
            returnstruct.var_17a094cf = playerbundle.var_bcaf7574;
            returnstruct.startdelay = 1;
            break;
        case #"sig_blade":
            returnstruct.var_17a094cf = playerbundle.var_eb02a29a;
            break;
        case #"eq_smoke":
            returnstruct.var_17a094cf = playerbundle.var_c6ad4957;
            break;
        case #"sig_lmg_alt":
        case #"sig_lmg":
            returnstruct.var_17a094cf = playerbundle.scytheweaponsuccess;
            break;
        case #"eq_shroud":
            returnstruct.var_17a094cf = playerbundle.var_be9a9d3f;
            break;
        default:
            break;
    }
    
    if ( !isdefined( returnstruct.startdelay ) )
    {
        returnstruct.startdelay = mpdialog_value( "defaultSuccessResponseBuffer", 0 );
    }
    
    return returnstruct;
}

// Namespace battlechatter/battlechatter
// Params 2
// Checksum 0xec275ac6, Offset: 0x1708
// Size: 0x3a6
function function_6bb302ba( weapon, playerbundle )
{
    switch ( weapon.name )
    {
        case #"hero_annihilator":
            var_cf38843b = playerbundle.var_fc5812eb;
            break;
        case #"sig_buckler_dw":
        case #"sig_buckler_turret":
            var_cf38843b = playerbundle.var_4fa3c4aa;
            break;
        case #"dog_ai_defaultmelee":
            var_cf38843b = playerbundle.var_4ea15dd3;
            break;
        case #"hero_flamethrower":
            var_cf38843b = playerbundle.var_772dbd73;
            break;
        case #"eq_gravityslam":
            var_cf38843b = playerbundle.var_3e1a4fb8;
            break;
        case #"gun_mini_turret":
            var_cf38843b = playerbundle.var_dbd1897a;
            break;
        case #"sig_bow_quickshot4":
            var_cf38843b = playerbundle.var_3841aa5a;
            break;
        case #"hash_5a4932f4b8d8b37a":
            var_cf38843b = playerbundle.var_c518a57;
            break;
        case #"shock_rifle":
        case #"hero_lightninggun":
            var_cf38843b = playerbundle.var_c7859303;
            break;
        case #"eq_tripwire":
            var_cf38843b = playerbundle.var_23b68936;
            break;
        case #"hero_pineapplegun":
            var_cf38843b = playerbundle.var_bbf7c71f;
            break;
        case #"gadget_health_boost":
        case #"gadget_cleanse":
            var_cf38843b = playerbundle.var_26d4d8b3;
            break;
        case #"eq_concertina_wire":
            var_cf38843b = playerbundle.var_54475e1e;
            break;
        case #"gadget_radiation_field":
            var_cf38843b = playerbundle.var_f613c4d1;
            break;
        case #"eq_sensor":
            var_cf38843b = playerbundle.var_f3b38bf6;
            break;
        case #"gadget_supplypod":
            var_cf38843b = playerbundle.var_54c097dc;
            break;
        case #"gadget_vision_pulse":
            var_cf38843b = playerbundle.var_cf906c68;
            break;
        case #"eq_localheal":
            var_cf38843b = playerbundle.var_d32aca42;
            break;
        case #"molotov_fire":
        case #"eq_molotov":
            var_cf38843b = playerbundle.var_140be686;
            break;
        case #"gadget_icepick":
            var_cf38843b = playerbundle.var_c62c0c00;
            break;
        case #"sig_blade":
            var_cf38843b = playerbundle.var_c5a434fd;
            break;
        case #"eq_smoke":
            var_cf38843b = playerbundle.var_568ad856;
            break;
        default:
            break;
    }
    
    return var_cf38843b;
}

// Namespace battlechatter/battlechatter
// Params 1
// Checksum 0xb37e5e9c, Offset: 0x1ab8
// Size: 0x6c, Type: bool
function function_506f762f( weapon )
{
    switch ( weapon.name )
    {
        case #"gadget_supplypod":
        case #"eq_localheal":
        case #"gadget_health_boost":
        case #"gadget_cleanse":
            return true;
    }
    
    return false;
}

// Namespace battlechatter/battlechatter
// Params 4
// Checksum 0x3e7795a7, Offset: 0x1b30
// Size: 0x18c
function function_50e36ba7( attacker, weapon, var_5d738b56, seed )
{
    if ( !isdefined( attacker ) || !isplayer( attacker ) )
    {
        return;
    }
    
    bundlename = attacker getmpdialogname();
    
    if ( !isdefined( bundlename ) )
    {
        return;
    }
    
    playerbundle = struct::get_script_bundle( "mpdialog_player", bundlename );
    
    if ( !isdefined( playerbundle ) )
    {
        return;
    }
    
    var_39344278 = function_20edb636( weapon, playerbundle );
    
    if ( !isdefined( var_39344278 ) )
    {
        return;
    }
    
    wait var_39344278.startdelay;
    
    if ( !isdefined( var_39344278 ) || !isdefined( var_39344278.var_17a094cf ) || !isdefined( attacker ) || !isplayer( attacker ) )
    {
        return;
    }
    
    var_a874c58 = attacker function_4b126e4c( 0, var_39344278.var_17a094cf, seed );
    
    if ( !isdefined( var_a874c58 ) )
    {
        return;
    }
    
    thread function_d2f35e13( 0, attacker, weapon, var_a874c58, var_5d738b56, seed );
}

// Namespace battlechatter/battlechatter
// Params 2
// Checksum 0xf35793a6, Offset: 0x1cc8
// Size: 0x9a, Type: bool
function function_5d7ad9a9( hacker, originalowner )
{
    if ( !isdefined( originalowner ) || !isplayer( originalowner ) || !originalowner function_21c0fa55() )
    {
        return false;
    }
    
    if ( !isdefined( hacker ) || !isplayer( hacker ) || !isalive( hacker ) )
    {
        return false;
    }
    
    return true;
}

// Namespace battlechatter/battlechatter
// Params 2
// Checksum 0x6dc4b86f, Offset: 0x1d70
// Size: 0x49a
function function_c8663dbc( weapon, player )
{
    taacombundle = function_84eb6127( player );
    
    if ( !isdefined( taacombundle ) )
    {
        return undefined;
    }
    
    switch ( weapon.name )
    {
        case #"eq_emp_grenade":
            taacomdialog = "jammerWeaponHacked";
            break;
        case #"eq_tripwire":
            taacomdialog = "meshMineWeaponHacked";
            var_b3fe42a9 = 1;
            break;
        case #"eq_seeker_mine":
            taacomdialog = "seekerMineWeaponHacked";
            var_b3fe42a9 = 1;
            break;
        case #"eq_sensor":
            taacomdialog = "sensorDartHacked";
            var_b3fe42a9 = 1;
            break;
        case #"ability_smart_cover":
        case #"gadget_smart_cover":
            taacomdialog = "smartCoverHacked";
            var_b3fe42a9 = 1;
            break;
        case #"gadget_spawnbeacon":
            taacomdialog = "spawnBeaconHacked";
            break;
        case #"gadget_supplypod":
            taacomdialog = "supplyPodHacked";
            var_b3fe42a9 = 1;
            break;
        case #"trophy_system":
            taacomdialog = "trophyWeaponHacked";
            var_b3fe42a9 = 1;
            break;
        case #"ac130":
        case #"inventory_ac130":
            taacomdialog = "ac130Hacked";
            break;
        case #"ai_tank_marker":
        case #"tank_robot":
        case #"inventory_tank_robot":
            taacomdialog = "aiTankHacked";
            var_b3fe42a9 = 1;
            break;
        case #"helicopter_comlink":
        case #"inventory_helicopter_comlink":
        case #"cobra_20mm_comlink":
            taacomdialog = "attackChopperHacked";
            break;
        case #"counteruav":
            taacomdialog = "cuavHacked";
            var_b3fe42a9 = 1;
            break;
        case #"dart":
        case #"inventory_dart":
            taacomdialog = "dartHacked";
            break;
        case #"inventory_drone_squadron":
        case #"drone_squadron":
            taacomdialog = "droneSquadHacked";
            var_b3fe42a9 = 1;
            break;
        case #"recon_car":
        case #"inventory_recon_car":
            taacomdialog = "reconCarHacked";
            break;
        case #"inventory_remote_missile":
        case #"remote_missile":
            taacomdialog = "hellstormHacked";
            break;
        case #"inventory_planemortar":
        case #"planemortar":
            taacomdialog = "lightningStrikeHacked";
            break;
        case #"overwatch_helicopter":
        case #"inventory_overwatch_helicopter":
            taacomdialog = "overwatchHelicopterHacked";
            break;
        case #"straferun":
        case #"inventory_straferun":
            taacomdialog = "strafeRunHacked";
            break;
        case #"supplydrop":
            taacomdialog = "supplyDropHacked";
            var_b3fe42a9 = 1;
            break;
        case #"uav":
            taacomdialog = "uavHacked";
            var_b3fe42a9 = 1;
            break;
        case #"ultimate_turret":
        case #"inventory_ultimate_turret":
            taacomdialog = "sentryHacked";
            var_b3fe42a9 = 1;
            break;
    }
    
    if ( !isdefined( taacomdialog ) )
    {
        return undefined;
    }
    
    dialogalias = taacombundle.( taacomdialog );
    return dialogalias;
}

// Namespace battlechatter/battlechatter
// Params 1
// Checksum 0x7d109321, Offset: 0x2218
// Size: 0x3a
function function_84eb6127( player )
{
    return struct::get_script_bundle( "mpdialog_taacom", function_b79dc4e7( player ) );
}

// Namespace battlechatter/battlechatter
// Params 4
// Checksum 0xb5490790, Offset: 0x2260
// Size: 0x1cc
function function_bf569dab( hacker, originalowner, eventid, weapon )
{
    if ( !function_5d7ad9a9( hacker, originalowner ) )
    {
        return;
    }
    
    var_a8aa2745 = function_c8663dbc( weapon, originalowner );
    
    if ( !isdefined( var_a8aa2745 ) )
    {
        return;
    }
    
    var_6ae4c5af = playsound( 0, var_a8aa2745 );
    
    if ( !isdefined( var_6ae4c5af ) )
    {
        return;
    }
    
    while ( isdefined( var_6ae4c5af ) && soundplaying( var_6ae4c5af ) )
    {
        waitframe( 1 );
    }
    
    wait 0.1;
    
    if ( !function_5d7ad9a9( hacker, originalowner ) )
    {
        return;
    }
    
    bundlename = hacker getmpdialogname();
    
    if ( !isdefined( bundlename ) )
    {
        return;
    }
    
    playerbundle = struct::get_script_bundle( "mpdialog_player", bundlename );
    
    if ( !isdefined( playerbundle ) )
    {
        return;
    }
    
    if ( eventid === 3 )
    {
        var_2131493 = playerbundle.var_489ef66b;
    }
    else if ( eventid === 4 )
    {
        var_2131493 = playerbundle.var_5545b3a1;
    }
    else if ( eventid === 5 )
    {
        var_2131493 = playerbundle.var_1037850d;
    }
    
    if ( !isdefined( var_2131493 ) )
    {
        return;
    }
    
    originalowner playsound( 0, var_2131493 );
}

// Namespace battlechatter/battlechatter
// Params 1
// Checksum 0xf17c469, Offset: 0x2438
// Size: 0x114
function function_ee8935da( player )
{
    if ( function_fc261b83() )
    {
        return;
    }
    
    commander = "blops_commander";
    
    if ( player.team === #"axis" )
    {
        commander = "cdp_commander";
    }
    
    commanderbundle = struct::get_script_bundle( "mpdialog_commander", commander );
    
    if ( !isdefined( commanderbundle ) || !isdefined( "gamePlayerKicked" ) )
    {
        return;
    }
    
    dialogalias = commanderbundle.( "gamePlayerKicked" );
    
    if ( !isdefined( dialogalias ) )
    {
        return;
    }
    
    voiceprefix = commanderbundle.( "voiceprefix" );
    
    if ( isdefined( voiceprefix ) )
    {
        dialogalias = voiceprefix + dialogalias;
    }
    
    if ( isdefined( dialogalias ) )
    {
        player playsound( 0, dialogalias );
    }
}

