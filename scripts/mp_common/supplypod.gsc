#using scripts\abilities\ability_player;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\oob;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\weapons_shared;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\mp_common\draft;
#using scripts\mp_common\gametypes\battlechatter;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\weapons\deployable;
#using scripts\weapons\weaponobjects;

#namespace supplypod;

// Namespace supplypod/supplypod
// Params 0, eflags: 0x2
// Checksum 0x1464f568, Offset: 0x330
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"supplypod", &__init__, undefined, #"killstreaks" );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x17320a71, Offset: 0x380
// Size: 0x1fc
function __init__()
{
    if ( !isdefined( game.var_6ccfdacd ) )
    {
        game.var_6ccfdacd = 0;
    }
    
    level.var_934fb97 = spawnstruct();
    level.var_934fb97.var_27fce4c0 = [];
    level.var_934fb97.audiothrottletracker = [];
    level.var_934fb97.bundle = getscriptbundle( "killstreak_supplypod" );
    level.var_934fb97.weapon = getweapon( "gadget_supplypod" );
    level.var_934fb97.var_ff101fac = getweapon( #"supplypod_catch" );
    
    if ( !isdefined( level.killstreakbundle ) )
    {
        level.killstreakbundle = [];
    }
    
    level.killstreakbundle[ #"killstreak_supplypod" ] = level.var_934fb97.bundle;
    level.var_dc8edcba = &function_827486aa;
    setupcallbacks();
    setupclientfields();
    deployable::register_deployable( level.var_934fb97.weapon, &function_1f8cd247 );
    globallogic_score::register_kill_callback( getweapon( #"gadget_supplypod" ), &function_92856c6 );
    callback::on_finalize_initialization( &function_1c601b99 );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0xb0c51fab, Offset: 0x588
// Size: 0x40
function function_1c601b99()
{
    if ( isdefined( level.var_1b900c1d ) )
    {
        [[ level.var_1b900c1d ]]( level.var_934fb97.weapon, &function_bff5c062 );
    }
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0xc3964f87, Offset: 0x5d0
// Size: 0xb4
function function_127fb8f3( supplypod, attackingplayer )
{
    supplypod.gameobject gameobjects::allow_use( #"none" );
    
    if ( isdefined( level.var_86e3d17a ) )
    {
        _station_up_to_detention_center_triggers = [[ level.var_86e3d17a ]]();
        
        if ( ( isdefined( _station_up_to_detention_center_triggers ) ? _station_up_to_detention_center_triggers : 0 ) > 0 )
        {
            supplypod notify( #"cancel_timeout" );
            supplypod thread weaponobjects::weapon_object_timeout( supplypod.var_2d045452, _station_up_to_detention_center_triggers );
        }
    }
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0x3eddd0fe, Offset: 0x690
// Size: 0x44c
function function_bff5c062( supplypod, attackingplayer )
{
    if ( !isdefined( supplypod.gameobject ) )
    {
        return;
    }
    
    original_owner = supplypod.owner;
    supplypod.owner weaponobjects::hackerremoveweapon( supplypod );
    supplypod.owner function_890b2784();
    supplypod.owner = attackingplayer;
    supplypod setowner( attackingplayer );
    supplypod setteam( attackingplayer getteam() );
    supplypod.team = attackingplayer getteam();
    supplypod.gameobject gameobjects::set_owner_team( attackingplayer.team );
    supplypod.gameobject gameobjects::set_visible_team( #"friendly" );
    supplypod.gameobject gameobjects::allow_use( #"friendly" );
    supplypod notify( #"hash_523ddcbd662010e5" );
    supplypod notify( #"hacked" );
    
    if ( isdefined( supplypod.var_2d045452 ) )
    {
        supplypod.var_2d045452 notify( #"hacked" );
    }
    
    supplypod thread function_b44dec0b( attackingplayer );
    supplypod thread function_a2c40499( attackingplayer );
    supplypod thread watchfordamage();
    supplypod thread watchfordeath();
    var_a87deb22 = 1;
    
    if ( !level.teambased )
    {
        supplypod.gameobject.trigger setteamfortrigger( supplypod.team );
    }
    
    if ( isdefined( level.var_f1edf93f ) && isdefined( supplypod.var_2d045452 ) )
    {
        _station_up_to_detention_center_triggers = [[ level.var_f1edf93f ]]();
        
        if ( isdefined( _station_up_to_detention_center_triggers ) ? _station_up_to_detention_center_triggers : 0 )
        {
            supplypod.var_2d045452 notify( #"cancel_timeout" );
            
            if ( isdefined( original_owner ) )
            {
                watcher = original_owner weaponobjects::getweaponobjectwatcherbyweapon( supplypod.var_2d045452.weapon );
                
                if ( isdefined( watcher ) )
                {
                    supplypod.var_2d045452 thread weaponobjects::weapon_object_timeout( watcher, _station_up_to_detention_center_triggers );
                    var_a87deb22 = 0;
                }
            }
        }
    }
    
    if ( isdefined( level.var_fc1bbaef ) )
    {
        [[ level.var_fc1bbaef ]]( supplypod );
    }
    
    level.var_934fb97.supplypods[ supplypod.objectiveid ] = supplypod;
    
    if ( !isdefined( level.var_934fb97.var_27fce4c0[ attackingplayer.clientid ] ) )
    {
        level.var_934fb97.var_27fce4c0[ attackingplayer.clientid ] = [];
    }
    
    var_a7edcaed = level.var_934fb97.var_27fce4c0.size + 1;
    array::push( level.var_934fb97.var_27fce4c0[ attackingplayer.clientid ], supplypod, var_a7edcaed );
    
    if ( var_a87deb22 )
    {
        supplypod thread function_827486aa( 0 );
    }
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0xb44b423b, Offset: 0xae8
// Size: 0x154, Type: bool
function function_29de6f1f( weapon, meansofdeath = undefined )
{
    baseweapon = weapons::getbaseweapon( weapon );
    var_a489f56 = isdefined( baseweapon.issignatureweapon ) && baseweapon.issignatureweapon || isdefined( baseweapon.var_76ce72e8 ) && baseweapon.var_76ce72e8;
    iskillstreak = isdefined( killstreaks::get_from_weapon( weapon ) );
    ismelee = isdefined( meansofdeath ) && ( meansofdeath == #"mod_melee" || meansofdeath == #"mod_melee_weapon_butt" );
    var_4ea2a976 = weapon.name == "launcher_standard_t8" || weapon.name == "sig_buckler_dw";
    
    if ( var_a489f56 || iskillstreak || var_4ea2a976 || ismelee )
    {
        return false;
    }
    
    return true;
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x1377e18b, Offset: 0xc48
// Size: 0x42, Type: bool
function function_49ef5263()
{
    if ( isdefined( self.var_48107b1c ) && self.var_48107b1c || isdefined( self.var_17d74a5c ) && self.var_17d74a5c > gettime() )
    {
        return true;
    }
    
    return false;
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0xf92b096f, Offset: 0xc98
// Size: 0x144
function hintobjectivehint_updat( weapon )
{
    if ( !isdefined( self ) || !isplayer( self ) || !self function_49ef5263() || !isdefined( weapon ) || weapon.name != "launcher_standard_t8" )
    {
        return;
    }
    
    scoreevents::processscoreevent( #"golden_kill_bonus", self, undefined, level.var_934fb97.weapon );
    
    if ( isdefined( self.var_bfeea3dd ) && isalive( self.var_bfeea3dd ) && self != self.var_bfeea3dd )
    {
        scoreevents::processscoreevent( #"hash_131b23d720fc82c3", self.var_bfeea3dd, undefined, level.var_934fb97.weapon );
    }
    
    self playlocalsound( #"hash_6c2a2fee191330a0" );
}

// Namespace supplypod/supplypod
// Params 5
// Checksum 0xea92015e, Offset: 0xde8
// Size: 0x134, Type: bool
function function_92856c6( attacker, victim, weapon, attackerweapon, meansofdeath )
{
    if ( !isdefined( attacker ) || !isdefined( weapon ) || !isdefined( meansofdeath ) )
    {
        return false;
    }
    
    if ( !function_29de6f1f( attackerweapon, meansofdeath ) )
    {
        return false;
    }
    
    if ( attacker function_49ef5263() )
    {
        if ( isdefined( attacker.var_bfeea3dd ) && isalive( attacker.var_bfeea3dd ) && attacker != attacker.var_bfeea3dd )
        {
            scoreevents::processscoreevent( #"hash_131b23d720fc82c3", attacker.var_bfeea3dd, undefined, level.var_934fb97.weapon );
        }
        
        attacker playlocalsound( #"hash_6c2a2fee191330a0" );
        return true;
    }
    
    return false;
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x96525df0, Offset: 0xf28
// Size: 0xb2
function function_f579e72b( watcher )
{
    watcher.watchforfire = 1;
    watcher.onspawn = &supplypod_spawned;
    watcher.timeout = float( level.var_934fb97.bundle.ksduration ) / 1000;
    watcher.ontimeout = &function_7c0d095c;
    watcher.var_994b472b = &function_f7d9ebce;
    watcher.deleteonplayerspawn = 0;
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x7ff9a8a7, Offset: 0xfe8
// Size: 0x34
function function_f7d9ebce( player )
{
    if ( !isdefined( self.supplypod ) )
    {
        return;
    }
    
    self.supplypod thread function_827486aa( 0 );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0xab9e05c9, Offset: 0x1028
// Size: 0x2c
function function_7c0d095c()
{
    if ( !isdefined( self.supplypod ) )
    {
        return;
    }
    
    self.supplypod thread function_827486aa( 0 );
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0xb292f2da, Offset: 0x1060
// Size: 0x1ac
function supplypod_spawned( watcher, owner )
{
    self endon( #"death" );
    self thread weaponobjects::onspawnuseweaponobject( watcher, owner );
    self hide();
    self.canthack = 1;
    self.ignoreemp = 1;
    
    if ( !( isdefined( self.previouslyhacked ) && self.previouslyhacked ) )
    {
        if ( isdefined( owner ) )
        {
            owner stats::function_e24eec31( self.weapon, #"used", 1 );
            owner notify( #"supplypod" );
        }
        
        self waittilltimeout( 0.05, #"stationary" );
        
        if ( !owner deployable::location_valid() )
        {
            owner setriotshieldfailhint();
            self delete();
            return;
        }
        
        self deployable::function_dd266e08( owner );
        self.var_3823265d = owner.var_3823265d;
        owner.var_3823265d = undefined;
        owner function_63c23d02( self );
        supplypod = self.supplypod;
        supplypod util::make_sentient();
    }
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0xb4b92ae8, Offset: 0x1218
// Size: 0xce
function playcommanderaudio( soundbank, team )
{
    if ( !isdefined( soundbank ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_934fb97.audiothrottletracker[ soundbank ] ) )
    {
        level.var_934fb97.audiothrottletracker[ soundbank ] = 0;
    }
    
    lasttimeplayed = level.var_934fb97.audiothrottletracker[ soundbank ];
    
    if ( lasttimeplayed != 0 && gettime() < int( 5 * 1000 ) + lasttimeplayed )
    {
        return;
    }
    
    level.var_934fb97.audiothrottletracker[ soundbank ] = gettime();
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x3d25cb73, Offset: 0x12f0
// Size: 0x64
function setupclientfields()
{
    clientfield::register( "scriptmover", "supplypod_placed", 1, 1, "int" );
    clientfield::register( "clientuimodel", "hudItems.goldenBullet", 1, 1, "int" );
}

// Namespace supplypod/supplypod
// Params 0, eflags: 0x4
// Checksum 0x837325f8, Offset: 0x1360
// Size: 0xac
function private setupcallbacks()
{
    ability_player::register_gadget_activation_callbacks( 35, &supplypod_on, &supplypod_off );
    callback::on_player_killed_with_params( &on_player_killed );
    callback::on_spawned( &on_player_spawned );
    weaponobjects::function_e6400478( #"gadget_supplypod", &function_f579e72b, 1 );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x93643df3, Offset: 0x1418
// Size: 0x54
function function_577ff80b()
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    waitresult = self waittill( #"loadout_given" );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x9508bc3b, Offset: 0x1478
// Size: 0x23c
function on_player_spawned()
{
    player = self;
    
    if ( level.inprematchperiod && draft::is_draft_this_round() )
    {
        player thread function_577ff80b();
    }
    
    self function_46d74bb7( 0 );
    changedteam = isdefined( player.var_29fdd9dd ) && player.team != player.var_29fdd9dd;
    
    if ( ( isdefined( player.var_228b6835 ) ? player.var_228b6835 : 0 ) || changedteam || ( isdefined( level.var_934fb97.bundle.var_18ede0bb ) ? level.var_934fb97.bundle.var_18ede0bb : 0 ) )
    {
        player.var_17d74a5c = undefined;
        player.var_57de9100 = undefined;
        player.var_29fdd9dd = undefined;
        player.var_48107b1c = undefined;
        player clientfield::set_player_uimodel( "hudItems.goldenBullet", 0 );
    }
    
    if ( isdefined( player.var_17d74a5c ) )
    {
        if ( isdefined( player.var_57de9100 ) )
        {
            player.var_57de9100 gameobjects::hide_waypoint( player );
            player.var_57de9100.trigger setinvisibletoplayer( player );
        }
        
        player thread function_18f999b5( float( player.var_17d74a5c ) / 1000 );
        player.var_17d74a5c += gettime();
        player clientfield::set_player_uimodel( "hudItems.goldenBullet", 1 );
    }
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x457fe3aa, Offset: 0x16c0
// Size: 0x264
function function_46d74bb7( var_70150641 )
{
    if ( isdefined( var_70150641 ) ? var_70150641 : 0 )
    {
        players = getplayers( self.team );
    }
    else
    {
        players = getplayers();
    }
    
    foreach ( player in players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        assert( isdefined( player.clientid ) );
        
        if ( !isdefined( player.clientid ) )
        {
            continue;
        }
        
        pods = level.var_934fb97.var_27fce4c0[ player.clientid ];
        
        if ( isdefined( pods ) )
        {
            foreach ( pod in pods )
            {
                if ( !isdefined( pod ) )
                {
                    continue;
                }
                
                if ( isdefined( pod.gameobject ) )
                {
                    var_321183ba = pod getteam();
                    
                    if ( var_321183ba == self.team )
                    {
                        pod.gameobject gameobjects::show_waypoint( self );
                        pod.gameobject.trigger setvisibletoplayer( self );
                        continue;
                    }
                    
                    pod.gameobject gameobjects::hide_waypoint( self );
                    pod.gameobject.trigger setinvisibletoplayer( self );
                }
            }
        }
    }
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0x787d25d9, Offset: 0x1930
// Size: 0x66
function supplypod_on( slot, playerweapon )
{
    assert( isplayer( self ) );
    self notify( #"start_killstreak", { #weapon:playerweapon } );
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0xf9d39eb1, Offset: 0x19a0
// Size: 0x14
function supplypod_off( slot, weapon )
{
    
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x7b4b0cfe, Offset: 0x19c0
// Size: 0xc
function on_player_killed( s_params )
{
    
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x24b2ce04, Offset: 0x19d8
// Size: 0x12
function getobjectiveid()
{
    return gameobjects::get_next_obj_id();
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x8c0e334b, Offset: 0x19f8
// Size: 0x44
function deleteobjective( objectiveid )
{
    if ( isdefined( objectiveid ) )
    {
        objective_delete( objectiveid );
        gameobjects::release_obj_id( objectiveid );
    }
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x3fd2323c, Offset: 0x1a48
// Size: 0xce
function function_890b2784()
{
    indextoremove = undefined;
    
    for ( index = 0; index < level.var_934fb97.var_27fce4c0[ self.clientid ].size ; index++ )
    {
        if ( level.var_934fb97.var_27fce4c0[ self.clientid ][ index ] == self )
        {
            indextoremove = index;
        }
    }
    
    if ( isdefined( indextoremove ) )
    {
        level.var_934fb97.var_27fce4c0[ self.clientid ] = array::remove_index( level.var_934fb97.var_27fce4c0[ self.clientid ], indextoremove, 0 );
    }
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0x6eb07, Offset: 0x1b20
// Size: 0x1fe
function function_827486aa( destroyedbyenemy, var_7497ba51 = 1 )
{
    self notify( #"hash_523ddcbd662010e5" );
    self.var_ab0875aa = 1;
    
    if ( isdefined( self.var_83d9bfb5 ) && self.var_83d9bfb5 )
    {
        return;
    }
    
    deleteobjective( self.objectiveid );
    deleteobjective( self.var_134eefb9 );
    self.var_83d9bfb5 = 1;
    level.var_934fb97.supplypods[ self.objectiveid ] = undefined;
    self clientfield::set( "enemyequip", 0 );
    
    if ( isdefined( self.gameobject ) )
    {
        self.gameobject thread gameobjects::destroy_object( 1, 1 );
    }
    
    self function_890b2784();
    
    if ( isdefined( self.owner ) )
    {
        if ( game.state == "playing" )
        {
            if ( isdefined( destroyedbyenemy ) && destroyedbyenemy )
            {
                self.owner globallogic_score::function_5829abe3( self.var_846acfcf, self.var_d02ddb8e, level.var_934fb97.weapon );
            }
        }
    }
    
    if ( var_7497ba51 && !destroyedbyenemy )
    {
        wait ( isdefined( level.var_934fb97.bundle.var_fd663ee0 ) ? level.var_934fb97.bundle.var_fd663ee0 : 0 ) / 1000;
    }
    
    profilestart();
    function_9d4aabb9( destroyedbyenemy );
    profilestop();
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x924c7ccc, Offset: 0x1d28
// Size: 0x42c
function function_9d4aabb9( destroyedbyenemy )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    player = self.owner;
    
    if ( isdefined( level.var_d2600afc ) && isdefined( self.var_846acfcf ) && isdefined( player ) && self.var_846acfcf != player )
    {
        self [[ level.var_d2600afc ]]( self.var_846acfcf, player, level.var_934fb97.weapon, self.var_d02ddb8e );
    }
    
    if ( game.state == "playing" )
    {
        if ( self.health <= 0 )
        {
            if ( isdefined( level.var_934fb97.bundle.destructionaudio ) )
            {
                self playsound( level.var_934fb97.bundle.destructionaudio );
            }
        }
        
        if ( isdefined( destroyedbyenemy ) && destroyedbyenemy )
        {
            if ( isdefined( player ) )
            {
                if ( isdefined( level.var_934fb97.var_27fce4c0[ player.clientid ] ) && level.var_934fb97.var_27fce4c0[ player.clientid ].size > 1 )
                {
                    player thread globallogic_audio::play_taacom_dialog( "supplyPodWeaponDestroyedFriendlyMultiple" );
                }
                else
                {
                    player thread globallogic_audio::play_taacom_dialog( "supplyPodWeaponDestroyedFriendly" );
                }
            }
            
            playcommanderaudio( level.var_934fb97.bundle.var_2ee73347, self.team );
            playcommanderaudio( level.var_934fb97.bundle.var_79efc1, util::getotherteam( self.team ) );
        }
        else
        {
            playcommanderaudio( level.var_934fb97.bundle.var_10c9ba2d, self.team );
            playcommanderaudio( level.var_934fb97.bundle.var_f29e64de, util::getotherteam( self.team ) );
        }
    }
    
    if ( isdefined( level.var_934fb97.bundle.ksexplosionfx ) )
    {
        playfx( level.var_934fb97.bundle.ksexplosionfx, self.origin );
        self playsound( level.var_934fb97.bundle.destructionaudio );
    }
    
    if ( isdefined( level.var_934fb97.bundle.var_bb6c29b4 ) && isdefined( self.var_d02ddb8e ) && self.var_d02ddb8e == getweapon( #"shock_rifle" ) )
    {
        playfx( level.var_934fb97.bundle.var_bb6c29b4, self.origin );
    }
    
    deployable::function_81598103( self );
    
    if ( isdefined( self.var_2d045452 ) )
    {
        self.var_2d045452 delete();
    }
    
    self stoploopsound();
    self notify( #"supplypod_removed" );
    self delete();
}

// Namespace supplypod/supplypod
// Params 1, eflags: 0x4
// Checksum 0x69a619fe, Offset: 0x2160
// Size: 0x174
function private function_5761966a( supplypod )
{
    player = self;
    player endon( #"disconnect" );
    level endon( #"game_ended" );
    supplypod endon( #"supplypod_removed" );
    
    if ( !isdefined( supplypod.var_7b7607df[ player.clientid ] ) )
    {
        return;
    }
    
    objective_setvisibletoplayer( supplypod.var_134eefb9, player );
    
    while ( isdefined( supplypod.var_7b7607df[ player.clientid ] ) && supplypod.var_7b7607df[ player.clientid ] > gettime() )
    {
        timeremaining = float( supplypod.var_7b7607df[ player.clientid ] - gettime() ) / 1000;
        
        if ( timeremaining > 0 )
        {
            wait timeremaining;
        }
    }
    
    objective_setinvisibletoplayer( supplypod.var_134eefb9, player );
    supplypod.var_7b7607df[ player.clientid ] = undefined;
}

// Namespace supplypod/supplypod
// Params 2, eflags: 0x4
// Checksum 0x84dbc22e, Offset: 0x22e0
// Size: 0x4a
function private function_3c4843e3( supplypod, timetoadd )
{
    supplypod.var_7b7607df[ self.clientid ] = gettime() + int( timetoadd * 1000 );
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0xaf80bcd6, Offset: 0x2338
// Size: 0xac
function function_a2c40499( player )
{
    level endon( #"game_ended" );
    self endon( #"hash_523ddcbd662010e5" );
    waitresult = player waittill( #"disconnect", #"joined_team", #"changed_specialist" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    var_b08a3652 = 0;
    self thread function_827486aa( var_b08a3652 );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x9be517c5, Offset: 0x23f0
// Size: 0x144
function watchfordeath()
{
    level endon( #"game_ended" );
    self.owner endon( #"disconnect", #"joined_team", #"changed_specialist" );
    self endon( #"hash_523ddcbd662010e5" );
    waitresult = self waittill( #"death" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    var_b08a3652 = 1;
    self.var_846acfcf = waitresult.attacker;
    self.var_d02ddb8e = waitresult.weapon;
    
    if ( isdefined( waitresult.attacker ) && isdefined( self ) && isdefined( self.owner ) && waitresult.attacker.team == self.owner.team )
    {
        var_b08a3652 = 0;
    }
    
    self thread function_827486aa( var_b08a3652 );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0xea56d978, Offset: 0x2540
// Size: 0x2a0
function watchfordamage()
{
    self endon( #"death" );
    level endon( #"game_ended" );
    self endon( #"hash_523ddcbd662010e5" );
    supplypod = self;
    supplypod endon( #"death" );
    supplypod.health = level.var_934fb97.bundle.kshealth;
    startinghealth = supplypod.health;
    
    while ( true )
    {
        waitresult = self waittill( #"damage" );
        
        if ( ( isdefined( level.var_934fb97.bundle.var_4f845dc4 ) ? level.var_934fb97.bundle.var_4f845dc4 : 0 ) && isdefined( waitresult.attacker ) && isplayer( waitresult.attacker ) )
        {
            healthprct = supplypod.health / startinghealth;
            objective_setprogress( supplypod.var_134eefb9, healthprct );
            var_adb78fe4 = isdefined( supplypod.var_7b7607df[ waitresult.attacker.clientid ] );
            waitresult.attacker function_3c4843e3( supplypod, level.var_934fb97.bundle.var_c14832cd );
            
            if ( !var_adb78fe4 )
            {
                waitresult.attacker thread function_5761966a( supplypod );
            }
        }
        
        if ( isdefined( waitresult.attacker ) && waitresult.amount > 0 && damagefeedback::dodamagefeedback( waitresult.weapon, waitresult.attacker ) )
        {
            waitresult.attacker damagefeedback::update( waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self );
        }
    }
}

// Namespace supplypod/supplypod
// Params 12
// Checksum 0x6d713fe5, Offset: 0x27e8
// Size: 0x11a
function function_8d362deb( einflictor, attacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex )
{
    bundle = level.var_934fb97.bundle;
    chargelevel = 0;
    weapon_damage = killstreak_bundles::get_weapon_damage( "killstreak_supplypod", bundle.kshealth, attacker, weapon, smeansofdeath, idamage, idflags, chargelevel );
    
    if ( !isdefined( weapon_damage ) )
    {
        weapon_damage = killstreaks::get_old_damage( attacker, weapon, smeansofdeath, idamage, 1 );
    }
    
    return int( weapon_damage );
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x8ef7b3b2, Offset: 0x2910
// Size: 0x82
function function_438ca4e0()
{
    supplypod = self;
    supplypod endon( #"supplypod_removed", #"death" );
    level waittill( #"game_ended" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self thread function_827486aa( 0, 0 );
    supplypod.var_648955e6 = 1;
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x534f1f4a, Offset: 0x29a0
// Size: 0x36
function function_fec0924()
{
    currentid = game.var_6ccfdacd;
    game.var_6ccfdacd += 1;
    return currentid;
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0xcc259edb, Offset: 0x29e0
// Size: 0xa8c
function function_9abdee8c( object )
{
    player = self;
    
    if ( isdefined( level.var_934fb97.var_27fce4c0[ player.clientid ] ) && level.var_934fb97.var_27fce4c0[ player.clientid ].size >= ( isdefined( level.var_934fb97.bundle.var_cbe1e532 ) ? level.var_934fb97.bundle.var_cbe1e532 : 1 ) )
    {
        obj = level.var_934fb97.var_27fce4c0[ player.clientid ][ 0 ];
        
        if ( isdefined( obj ) )
        {
            obj thread function_827486aa( 0 );
        }
        else
        {
            level.var_934fb97.var_27fce4c0[ self.clientid ] = undefined;
        }
    }
    
    slot = player gadgetgetslot( level.var_934fb97.weapon );
    player gadgetpowerreset( slot );
    player gadgetpowerset( slot, 0 );
    supplypod = spawn( "script_model", object.origin );
    supplypod setmodel( level.var_934fb97.weapon.var_22082a57 );
    object.supplypod = supplypod;
    supplypod.var_2d045452 = object;
    supplypod setdestructibledef( "wpn_t8_eqp_supply_pod_destructible" );
    supplypod useanimtree( "generic" );
    supplypod.owner = player;
    supplypod.clientid = supplypod.owner.clientid;
    supplypod.angles = player.angles;
    supplypod clientfield::set( "supplypod_placed", 1 );
    supplypod setteam( player getteam() );
    supplypod.var_86a21346 = &function_8d362deb;
    supplypod solid();
    supplypod show();
    supplypod.victimsoundmod = "vehicle";
    supplypod.weapon = level.var_934fb97.weapon;
    supplypod setweapon( supplypod.weapon );
    supplypod.maxusecount = isdefined( level.var_934fb97.bundle.var_5a0d87e0 ) ? level.var_934fb97.bundle.var_5a0d87e0 : 20;
    supplypod.usecount = 0;
    supplypod.objectiveid = getobjectiveid();
    level.var_934fb97.supplypods[ supplypod.objectiveid ] = supplypod;
    
    if ( !isdefined( level.var_934fb97.var_27fce4c0[ player.clientid ] ) )
    {
        level.var_934fb97.var_27fce4c0[ player.clientid ] = [];
    }
    
    var_a7edcaed = level.var_934fb97.var_27fce4c0.size + 1;
    array::push( level.var_934fb97.var_27fce4c0[ player.clientid ], supplypod, var_a7edcaed );
    supplypod setcandamage( 1 );
    supplypod clientfield::set( "enemyequip", 1 );
    supplypod.builttime = gettime();
    supplypod.uniqueid = function_fec0924();
    playcommanderaudio( level.var_934fb97.bundle.var_69b1ff7, player getteam() );
    playcommanderaudio( level.var_934fb97.bundle.deployedenemy, util::getotherteam( player getteam() ) );
    
    if ( isdefined( level.var_934fb97.bundle.ambientaudio ) )
    {
        supplypod playloopsound( level.var_934fb97.bundle.ambientaudio );
    }
    
    if ( isdefined( level.var_934fb97.bundle.var_4f845dc4 ) ? level.var_934fb97.bundle.var_4f845dc4 : 0 )
    {
        supplypod.var_134eefb9 = getobjectiveid();
        supplypod.var_7b7607df = [];
        objective_add( supplypod.var_134eefb9, "active", supplypod.origin, level.var_934fb97.bundle.var_ce75f65c );
        objective_setprogress( supplypod.var_134eefb9, 1 );
        function_da7940a3( supplypod.var_134eefb9, 1 );
        objective_setinvisibletoall( supplypod.var_134eefb9 );
    }
    
    triggerradius = level.var_934fb97.bundle.var_366f43e9;
    triggerheight = level.var_934fb97.bundle.var_2f1567fb;
    var_b1a6d849 = level.var_934fb97.bundle.var_2d890f85;
    upangle = vectorscale( vectornormalize( anglestoup( supplypod.angles ) ), 5 );
    var_40989bda = supplypod.origin + upangle;
    usetrigger = spawn( "trigger_radius_use", var_40989bda, 0, triggerradius, triggerheight );
    usetrigger setcursorhint( "HINT_INTERACTIVE_PROMPT" );
    usetrigger function_49462027( 1, 1 | 4096 | 2 | 8388608 | 2048 );
    supplypod.gameobject = gameobjects::create_use_object( player getteam(), usetrigger, [], undefined, level.var_934fb97.bundle.var_9333131b, 1, 1 );
    supplypod.gameobject gameobjects::set_visible_team( #"friendly" );
    supplypod.gameobject gameobjects::allow_use( #"friendly" );
    supplypod.gameobject gameobjects::set_use_time( var_b1a6d849 );
    supplypod.gameobject.onbeginuse = &function_8c8fb7b5;
    supplypod.gameobject.onenduse = &function_a1434496;
    supplypod.gameobject.parentobj = supplypod;
    supplypod.gameobject.var_33d50507 = 1;
    supplypod.gameobject.dontlinkplayertotrigger = 1;
    supplypod.gameobject.keepweapon = 1;
    supplypod.gameobject.requireslos = 1;
    supplypod.gameobject.var_d647eb08 = 1;
    player deployable::function_6ec9ee30( supplypod, level.var_934fb97.weapon );
    supplypod.gameobject function_1446053f( player );
    supplypod thread function_b44dec0b( player );
    supplypod thread function_438ca4e0();
    supplypod thread watchfordamage();
    supplypod thread watchfordeath();
    supplypod thread function_a2c40499( player );
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x4399efd, Offset: 0x3478
// Size: 0x6c
function function_1446053f( player )
{
    self endon( #"death" );
    player endon( #"death" );
    wait 0.2;
    
    if ( isdefined( self ) && isdefined( player ) )
    {
        self function_a1434496( undefined, player, 1 );
    }
}

// Namespace supplypod/supplypod
// Params 1, eflags: 0x4
// Checksum 0xb2cc47d2, Offset: 0x34f0
// Size: 0xc
function private function_8c8fb7b5( player )
{
    
}

// Namespace supplypod/supplypod
// Params 2, eflags: 0x4
// Checksum 0xab89a67, Offset: 0x3508
// Size: 0x14
function private function_a143899c( player, waittime )
{
    
}

// Namespace supplypod/supplypod
// Params 3, eflags: 0x4
// Checksum 0x6e6c736f, Offset: 0x3528
// Size: 0x4b4
function private function_a1434496( team, player, result )
{
    supplypod = self.parentobj;
    
    if ( !isdefined( supplypod ) )
    {
        return;
    }
    
    supplypod.isdisabled = 0;
    
    if ( isdefined( result ) && result )
    {
        supplypod.usecount++;
        
        if ( isdefined( player ) && isplayer( player ) )
        {
            if ( supplypod.owner != player )
            {
                scoreevents::processscoreevent( #"hash_69dbfbd660f8c53e", supplypod.owner, undefined, level.var_934fb97.weapon );
                relativepos = vectornormalize( player.origin - supplypod.owner.origin );
                dir = anglestoforward( supplypod.owner getplayerangles() );
                dotproduct = vectordot( dir, relativepos );
                
                if ( isdefined( level.playgadgetsuccess ) && supplypod.usecount >= 1 && !isdefined( self.var_25db02aa ) && dotproduct > 0 && sighttracepassed( supplypod.owner geteye(), self.origin, 1, supplypod.owner, self ) )
                {
                    self.var_25db02aa = 1;
                    supplypod.owner [[ level.playgadgetsuccess ]]( level.var_934fb97.weapon, undefined, undefined, player );
                }
            }
            
            supplypod.owner battlechatter::function_bd715920( level.var_934fb97.weapon, undefined, self.origin, self );
        }
        
        thread function_a143899c( player, 1.5 );
        player thread gestures::function_f3e2696f( supplypod, level.var_934fb97.var_ff101fac, undefined, 0.5, &supplypod_catch, undefined, undefined );
        player function_bcf0dd99();
        self gameobjects::hide_waypoint( player );
        self.trigger setinvisibletoplayer( player );
        player.var_57de9100 = self;
        player.var_29fdd9dd = self.team;
        player.var_bfeea3dd = supplypod.owner;
        player notify( #"hash_69dbfbd660f8c53e" );
        
        if ( !( isdefined( level.var_934fb97.bundle.var_18ede0bb ) ? level.var_934fb97.bundle.var_18ede0bb : 0 ) )
        {
            duration = isdefined( level.var_934fb97.bundle.var_84471829 ) ? level.var_934fb97.bundle.var_84471829 : 30;
            player.var_17d74a5c = gettime() + int( duration * 1000 );
            player thread function_18f999b5( duration );
        }
        else
        {
            player.var_48107b1c = 1;
        }
        
        if ( supplypod.usecount == supplypod.maxusecount )
        {
            supplypod thread function_827486aa( 0 );
        }
        
        return;
    }
    
    thread function_a143899c( player, 0 );
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0xf7142102, Offset: 0x39e8
// Size: 0x10c
function supplypod_catch( supplypod )
{
    if ( isdefined( supplypod ) )
    {
        playfxontag( "weapon/fx8_equip_supplypod_canister_launch", supplypod, "tag_canister_smoke" );
        var_715428d3 = "j_wrist_le";
        weapon = self getcurrentweapon();
        stancetype = weapon.var_6566504b;
        
        if ( stancetype >= 5 && stancetype <= 9 )
        {
            var_715428d3 = "j_wrist_ri";
        }
        
        beamlaunch( supplypod, self, "tag_origin_animate", var_715428d3, level.var_934fb97.weapon );
        playsoundatposition( #"hash_f70797817dfefdb", supplypod.origin );
    }
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x7d3f5b58, Offset: 0x3b00
// Size: 0x134
function function_18f999b5( waittime )
{
    self notify( #"hash_10cd6a20d4e45365" );
    self endon( #"hash_10cd6a20d4e45365", #"disconnect" );
    result = self waittilltimeout( waittime, #"death" );
    
    if ( result._notify == #"timeout" )
    {
        self function_46d74bb7( 1 );
    }
    else if ( isdefined( level.var_934fb97.bundle.var_98da26d ) ? level.var_934fb97.bundle.var_98da26d : 0 )
    {
        self.var_17d74a5c -= gettime();
    }
    else
    {
        self.var_17d74a5c = undefined;
        self.var_bfeea3dd = undefined;
    }
    
    self clientfield::set_player_uimodel( "hudItems.goldenBullet", 0 );
}

// Namespace supplypod/supplypod
// Params 3
// Checksum 0x8267348a, Offset: 0x3c40
// Size: 0x21c, Type: bool
function function_1f8cd247( origin, angles, player )
{
    if ( !isdefined( player.var_3823265d ) )
    {
        player.var_3823265d = spawnstruct();
    }
    
    var_1898acdc = isdefined( level.var_934fb97.bundle.var_bdc8276 ) ? level.var_934fb97.bundle.var_bdc8276 : 0;
    testdistance = var_1898acdc * var_1898acdc;
    ids = getarraykeys( level.var_934fb97.var_27fce4c0 );
    
    foreach ( id in ids )
    {
        if ( id == player.clientid )
        {
            continue;
        }
        
        pods = level.var_934fb97.var_27fce4c0[ id ];
        
        foreach ( pod in pods )
        {
            if ( !isdefined( pod ) )
            {
                continue;
            }
            
            distsqr = distancesquared( origin, pod.origin );
            
            if ( distsqr <= testdistance )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0xb989b3bb, Offset: 0x3e68
// Size: 0xd6
function function_63c23d02( supplypod )
{
    supplypod setvisibletoall();
    
    if ( isdefined( supplypod.othermodel ) )
    {
        supplypod.othermodel setinvisibletoall();
    }
    
    if ( isdefined( supplypod.var_3823265d ) )
    {
        self function_9abdee8c( supplypod );
        playsoundatposition( #"hash_66e85d590b4f4b8", supplypod.origin );
    }
    
    if ( isdefined( level.var_84bf013e ) )
    {
        self notify( #"supplypod_placed", { #pod:supplypod } );
    }
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0xa8b615f0, Offset: 0x3f48
// Size: 0x8c
function oncancelplacement( supplypod )
{
    slot = self gadgetgetslot( level.var_934fb97.weapon );
    self gadgetdeactivate( slot, level.var_934fb97.weapon, 0 );
    self gadgetpowerset( slot, 100 );
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x58e87358, Offset: 0x3fe0
// Size: 0x4c
function onshutdown( supplypod )
{
    if ( isdefined( supplypod.var_ab0875aa ) ? supplypod.var_ab0875aa : 0 )
    {
        return;
    }
    
    supplypod thread function_827486aa( 0 );
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0xe7b01312, Offset: 0x4038
// Size: 0x9c
function function_b44dec0b( player )
{
    supplypod = self;
    player endon( #"disconnect" );
    supplypod endon( #"death", #"hacked" );
    player waittill( #"joined_team", #"changed_specialist" );
    supplypod thread function_827486aa( 0 );
}

// Namespace supplypod/supplypod
// Params 2
// Checksum 0xb16246af, Offset: 0x40e0
// Size: 0xb6
function function_452147b1( weapon, weaponindex )
{
    player = self;
    level endon( #"game_ended" );
    player notify( "on_death_ammon_backup" + weaponindex );
    player endon( "on_death_ammon_backup" + weaponindex, #"disconnect" );
    player waittill( #"death" );
    player.pers[ "pod_ammo" + weaponindex ] = player getweaponammostock( weapon );
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x72edfbe0, Offset: 0x41a0
// Size: 0x1b6
function function_5bc9564e( weapon )
{
    player = self;
    level endon( #"game_ended" );
    player notify( #"hash_620e9c8ce0a79cf7" );
    player endon( #"hash_620e9c8ce0a79cf7", #"disconnect" );
    
    while ( isdefined( player.pod_ammo ) && player.pod_ammo.size > 0 )
    {
        weapon = player getcurrentweapon();
        var_2f9ea2b9 = weapons::getbaseweapon( weapon );
        baseweaponindex = getbaseweaponitemindex( var_2f9ea2b9 );
        
        if ( isdefined( player.pod_ammo[ baseweaponindex ] ) && player.pod_ammo[ baseweaponindex ] )
        {
            curammo = player getweaponammostock( weapon );
            
            if ( curammo == 0 )
            {
                player setweaponammostock( weapon, int( player.pod_ammo[ baseweaponindex ] ) );
                player.pod_ammo[ baseweaponindex ] = undefined;
                player thread function_452147b1( weapon, baseweaponindex );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0xff8c36d3, Offset: 0x4360
// Size: 0x13c
function function_740ec27e()
{
    player = self;
    primary_weapons = player getweaponslistprimaries();
    
    foreach ( weapon in primary_weapons )
    {
        var_2f9ea2b9 = weapons::getbaseweapon( weapon );
        baseweaponindex = getbaseweaponitemindex( var_2f9ea2b9 );
        player.pod_ammo[ baseweaponindex ] = ( isdefined( level.var_934fb97.bundle.var_8e002961 ) ? level.var_934fb97.bundle.var_8e002961 : 0 ) * weapon.clipsize;
    }
    
    player thread function_5bc9564e();
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x505631c4, Offset: 0x44a8
// Size: 0x164
function function_bcf0dd99()
{
    player = self;
    primary_weapons = player getweaponslistprimaries();
    
    foreach ( weapon in primary_weapons )
    {
        curammo = player getweaponammostock( weapon );
        bonusammo = ( isdefined( level.var_934fb97.bundle.var_8e002961 ) ? level.var_934fb97.bundle.var_8e002961 : 0 ) * weapon.clipsize;
        player setweaponammostock( weapon, int( curammo + bonusammo ) );
    }
    
    player clientfield::set_player_uimodel( "hudItems.goldenBullet", 1 );
}

// Namespace supplypod/supplypod
// Params 1
// Checksum 0x1ec5325e, Offset: 0x4618
// Size: 0x1a6
function function_b8a25634( owner )
{
    player = self;
    cooldowns[ 0 ] = level.var_934fb97.bundle.var_b9443d6b;
    cooldowns[ 1 ] = level.var_934fb97.bundle.var_ea340924;
    cooldowns[ 2 ] = level.var_934fb97.bundle.var_ff3d4d40;
    
    for ( slot = 0; slot < 3 ; slot++ )
    {
        if ( !isdefined( cooldowns[ slot ] ) )
        {
            continue;
        }
        
        if ( !isdefined( player._gadgets_player[ slot ] ) )
        {
            continue;
        }
        
        cooldown = cooldowns[ slot ] * ( isdefined( player._gadgets_player[ slot ].var_e4d4fa7e ) ? player._gadgets_player[ slot ].var_e4d4fa7e : 0 );
        
        if ( isdefined( owner ) && owner )
        {
            cooldown *= isdefined( level.var_934fb97.bundle.var_44a195ff ) ? level.var_934fb97.bundle.var_44a195ff : 0;
        }
        
        player gadgetpowerchange( slot, cooldown );
    }
}

// Namespace supplypod/supplypod
// Params 0
// Checksum 0x2c5fc8b6, Offset: 0x47c8
// Size: 0x20c
function function_de737a35()
{
    player = self;
    
    for ( weapon = player getcurrentweapon(); weapon == level.weaponnone ; weapon = player getcurrentweapon() )
    {
        waitframe( 1 );
    }
    
    slot = player gadgetgetslot( weapon );
    
    if ( slot == 2 || weapon == getweapon( #"sig_buckler_turret" ) )
    {
        if ( isdefined( weapon.var_7a93ed37 ) )
        {
            player gadgetpowerchange( slot, weapon.var_7a93ed37 );
        }
        
        if ( isdefined( weapon.var_60563796 ) )
        {
            if ( weapon == getweapon( #"sig_buckler_turret" ) || weapon == getweapon( #"sig_buckler_dw" ) )
            {
                stockammo = player getweaponammoclip( weapon );
                player setweaponammoclip( weapon, stockammo + int( weapon.var_60563796 ) );
                return;
            }
            
            stockammo = player getweaponammostock( weapon );
            player setweaponammostock( weapon, stockammo + int( weapon.var_60563796 ) );
        }
    }
}

