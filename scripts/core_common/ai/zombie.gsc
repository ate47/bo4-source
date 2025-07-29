#using scripts\core_common\ai\archetype_damage_utility;
#using scripts\core_common\ai\archetype_locomotion_utility;
#using scripts\core_common\ai\archetype_utility;
#using scripts\core_common\ai\archetype_zombie_interface;
#using scripts\core_common\ai\systems\ai_blackboard;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks;
#using scripts\core_common\ai\systems\animation_state_machine_utility;
#using scripts\core_common\ai\systems\behavior_state_machine;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\spawner_shared;

#namespace zombiebehavior;

// Namespace zombiebehavior/zombie
// Params 0, eflags: 0x2
// Checksum 0xdfdc5e4c, Offset: 0x4a0
// Size: 0x17c
function autoexec init()
{
    initzombiebehaviorsandasm();
    spawner::add_archetype_spawn_function( #"zombie", &archetypezombieblackboardinit );
    spawner::add_archetype_spawn_function( #"zombie", &archetypezombiedeathoverrideinit );
    spawner::add_archetype_spawn_function( #"zombie", &archetypezombiespecialeffectsinit );
    spawner::add_archetype_spawn_function( #"zombie", &zombie_utility::zombiespawnsetup );
    
    /#
        spawner::add_archetype_spawn_function( #"zombie", &zombie_utility::updateanimationrate );
    #/
    
    clientfield::register( "actor", "zombie", 1, 1, "int" );
    clientfield::register( "actor", "zombie_special_day", 1, 1, "counter" );
    zombieinterface::registerzombieinterfaceattributes();
}

// Namespace zombiebehavior/zombie
// Params 0, eflags: 0x4
// Checksum 0xeaf1e211, Offset: 0x628
// Size: 0x14cc
function private initzombiebehaviorsandasm()
{
    assert( !isdefined( &zombiemoveactionstart ) || isscriptfunctionptr( &zombiemoveactionstart ) );
    assert( !isdefined( &zombiemoveactionupdate ) || isscriptfunctionptr( &zombiemoveactionupdate ) );
    assert( !isdefined( undefined ) || isscriptfunctionptr( undefined ) );
    behaviortreenetworkutility::registerbehaviortreeaction( #"zombiemoveaction", &zombiemoveactionstart, &zombiemoveactionupdate, undefined );
    assert( !isdefined( &function_9b6830c9 ) || isscriptfunctionptr( &function_9b6830c9 ) );
    assert( !isdefined( undefined ) || isscriptfunctionptr( undefined ) );
    assert( !isdefined( &function_fbdc2cc4 ) || isscriptfunctionptr( &function_fbdc2cc4 ) );
    behaviortreenetworkutility::registerbehaviortreeaction( #"zombiemeleeaction", &function_9b6830c9, undefined, &function_fbdc2cc4 );
    assert( isscriptfunctionptr( &zombietargetservice ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombietargetservice", &zombietargetservice );
    assert( isscriptfunctionptr( &zombiecrawlercollision ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiecrawlercollisionservice", &zombiecrawlercollision );
    assert( isscriptfunctionptr( &zombietraversalservice ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombietraversalservice", &zombietraversalservice );
    assert( isscriptfunctionptr( &zombieisatattackobject ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieisatattackobject", &zombieisatattackobject );
    assert( isscriptfunctionptr( &zombieshouldattackobject ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldattackobject", &zombieshouldattackobject );
    assert( isscriptfunctionptr( &zombieshouldmeleecondition ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldmelee", &zombieshouldmeleecondition );
    assert( isscriptfunctionptr( &zombieshouldjumpmeleecondition ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldjumpmelee", &zombieshouldjumpmeleecondition );
    assert( isscriptfunctionptr( &zombieshouldjumpunderwatermelee ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldjumpunderwatermelee", &zombieshouldjumpunderwatermelee );
    assert( isscriptfunctionptr( &zombiegiblegscondition ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiegiblegscondition", &zombiegiblegscondition );
    assert( isscriptfunctionptr( &zombieshoulddisplaypain ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshoulddisplaypain", &zombieshoulddisplaypain );
    assert( isscriptfunctionptr( &iszombiewalking ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"iszombiewalking", &iszombiewalking );
    assert( isscriptfunctionptr( &zombieshouldmovelowg ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldmovelowg", &zombieshouldmovelowg );
    assert( isscriptfunctionptr( &zombieshouldturn ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"zombieshouldturn", &zombieshouldturn );
    assert( isscriptfunctionptr( &function_a716a3af ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"hash_4ba5bc2aba9e7670", &function_a716a3af );
    assert( isscriptfunctionptr( &function_1b8c9407 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_4136381d29600bc", &function_1b8c9407 );
    assert( isscriptfunctionptr( &function_ecba5a44 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_1732367c7f780c76", &function_ecba5a44 );
    assert( isscriptfunctionptr( &zombieshouldmeleesuicide ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldmeleesuicide", &zombieshouldmeleesuicide );
    assert( isscriptfunctionptr( &zombiemeleesuicidestart ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiemeleesuicidestart", &zombiemeleesuicidestart );
    assert( isscriptfunctionptr( &zombiemeleesuicideupdate ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiemeleesuicideupdate", &zombiemeleesuicideupdate );
    assert( isscriptfunctionptr( &zombiemeleesuicideterminate ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiemeleesuicideterminate", &zombiemeleesuicideterminate );
    assert( isscriptfunctionptr( &zombieshouldjukecondition ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldjuke", &zombieshouldjukecondition );
    assert( isscriptfunctionptr( &zombiejukeactionstart ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiejukeactionstart", &zombiejukeactionstart );
    assert( isscriptfunctionptr( &zombiejukeactionterminate ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiejukeactionterminate", &zombiejukeactionterminate );
    assert( isscriptfunctionptr( &zombiedeathaction ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiedeathaction", &zombiedeathaction );
    assert( isscriptfunctionptr( &zombiejuke ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiejukeservice", &zombiejuke );
    assert( isscriptfunctionptr( &zombiestumble ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiestumbleservice", &zombiestumble );
    assert( isscriptfunctionptr( &zombieshouldstumblecondition ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiestumblecondition", &zombieshouldstumblecondition );
    assert( isscriptfunctionptr( &zombiestumbleactionstart ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiestumbleactionstart", &zombiestumbleactionstart );
    assert( isscriptfunctionptr( &zombieattackobjectstart ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieattackobjectstart", &zombieattackobjectstart );
    assert( isscriptfunctionptr( &zombieattackobjectterminate ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieattackobjectterminate", &zombieattackobjectterminate );
    assert( isscriptfunctionptr( &waskilledbyinterdimensionalguncondition ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"waskilledbyinterdimensionalgun", &waskilledbyinterdimensionalguncondition );
    assert( isscriptfunctionptr( &wascrushedbyinterdimensionalgunblackholecondition ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"wascrushedbyinterdimensionalgunblackhole", &wascrushedbyinterdimensionalgunblackholecondition );
    assert( isscriptfunctionptr( &zombieidgundeathupdate ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieidgundeathupdate", &zombieidgundeathupdate );
    assert( isscriptfunctionptr( &zombieidgundeathupdate ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombievortexpullupdate", &zombieidgundeathupdate );
    assert( isscriptfunctionptr( &zombiehaslegs ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombiehaslegs", &zombiehaslegs );
    assert( isscriptfunctionptr( &zombieshouldproceduraltraverse ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"zombieshouldproceduraltraverse", &zombieshouldproceduraltraverse );
    assert( isscriptfunctionptr( &zombiemissinglegs ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"zombiemissinglegs", &zombiemissinglegs );
    assert( isscriptfunctionptr( &function_f937377 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_31cc70f275702cf6", &function_f937377 );
    assert( isscriptfunctionptr( &function_a82068d7 ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"zombiemoveactionstart", &function_a82068d7 );
    assert( isscriptfunctionptr( &function_626edd6b ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"zombiemoveactionupdate", &function_626edd6b );
    animationstatenetwork::registernotetrackhandlerfunction( "zombie_melee", &zombienotetrackmeleefire );
    animationstatenetwork::registernotetrackhandlerfunction( "crushed", &zombienotetrackcrushfire );
    animationstatenetwork::registeranimationmocomp( "mocomp_death_idgun@zombie", &zombieidgundeathmocompstart, undefined, undefined );
    animationstatenetwork::registeranimationmocomp( "mocomp_vortex_pull@zombie", &zombieidgundeathmocompstart, undefined, undefined );
    animationstatenetwork::registeranimationmocomp( "mocomp_death_idgun_hole@zombie", &zombieidgunholedeathmocompstart, undefined, &zombieidgunholedeathmocompterminate );
    animationstatenetwork::registeranimationmocomp( "mocomp_turn@zombie", &zombieturnmocompstart, &zombieturnmocompupdate, &zombieturnmocompterminate );
    animationstatenetwork::registeranimationmocomp( "mocomp_melee_jump@zombie", &zombiemeleejumpmocompstart, &zombiemeleejumpmocompupdate, &zombiemeleejumpmocompterminate );
    animationstatenetwork::registeranimationmocomp( "mocomp_zombie_idle@zombie", &zombiezombieidlemocompstart, undefined, undefined );
    animationstatenetwork::registeranimationmocomp( "mocomp_attack_object@zombie", &zombieattackobjectmocompstart, &zombieattackobjectmocompupdate, undefined );
    animationstatenetwork::registeranimationmocomp( "mocomp_teleport_traversal@zombie", &function_cbbae5cb, undefined, undefined );
    animationstatenetwork::registeranimationmocomp( "mocomp_zombie_melee@zombie", &function_54d75299, &function_d1474842, &function_b6d297bb );
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0x9901e389, Offset: 0x1b00
// Size: 0x4a
function archetypezombieblackboardinit()
{
    blackboard::createblackboardforentity( self );
    ai::createinterfaceforentity( self );
    self.___archetypeonanimscriptedcallback = &archetypezombieonanimscriptedcallback;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0x68833b9f, Offset: 0x1b58
// Size: 0x2c
function private archetypezombieonanimscriptedcallback( entity )
{
    entity.__blackboard = undefined;
    entity archetypezombieblackboardinit();
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0xb02b7df7, Offset: 0x1b90
// Size: 0x24
function archetypezombiespecialeffectsinit()
{
    aiutility::addaioverridedamagecallback( self, &archetypezombiespecialeffectscallback );
}

// Namespace zombiebehavior/zombie
// Params 13, eflags: 0x4
// Checksum 0x8f287acb, Offset: 0x1bc0
// Size: 0x100
function private archetypezombiespecialeffectscallback( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, modelindex, partname )
{
    specialdayeffectchance = getdvarint( #"tu6_ffotd_zombiespecialdayeffectschance", 0 );
    
    if ( specialdayeffectchance && randomint( 100 ) < specialdayeffectchance )
    {
        if ( isdefined( eattacker ) && isplayer( eattacker ) )
        {
            self clientfield::increment( "zombie_special_day" );
        }
    }
    
    return idamage;
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0x9d36e6b4, Offset: 0x1cc8
// Size: 0x1a
function bb_getvarianttype()
{
    if ( isdefined( self.variant_type ) )
    {
        return self.variant_type;
    }
    
    return 0;
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0x85c97e5d, Offset: 0x1cf0
// Size: 0x1a
function bb_getlowgravityvariant()
{
    if ( isdefined( self.low_gravity_variant ) )
    {
        return self.low_gravity_variant;
    }
    
    return 0;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x670bc88d, Offset: 0x1d18
// Size: 0x2a, Type: bool
function iszombiewalking( entity )
{
    return !( isdefined( entity.missinglegs ) && entity.missinglegs );
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x507315e7, Offset: 0x1d50
// Size: 0x8e, Type: bool
function zombieshoulddisplaypain( entity )
{
    if ( isdefined( entity.suicidaldeath ) && entity.suicidaldeath )
    {
        return false;
    }
    
    if ( !hasasm( entity ) || entity function_ebbebf56() < 1 )
    {
        return false;
    }
    
    return !( isdefined( entity.missinglegs ) && entity.missinglegs );
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x9acf7dc2, Offset: 0x1de8
// Size: 0x58, Type: bool
function zombieshouldjukecondition( entity )
{
    if ( isdefined( entity.juke ) && ( entity.juke == "left" || entity.juke == "right" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x813e9294, Offset: 0x1e48
// Size: 0x24, Type: bool
function zombieshouldstumblecondition( entity )
{
    if ( isdefined( entity.stumble ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0xd50e3ef4, Offset: 0x1e78
// Size: 0xaa
function private zombiejukeactionstart( entity )
{
    entity setblackboardattribute( "_juke_direction", entity.juke );
    
    if ( isdefined( entity.jukedistance ) )
    {
        entity setblackboardattribute( "_juke_distance", entity.jukedistance );
    }
    else
    {
        entity setblackboardattribute( "_juke_distance", "short" );
    }
    
    entity.jukedistance = undefined;
    entity.juke = undefined;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0x8e1d7e19, Offset: 0x1f30
// Size: 0x24
function private zombiejukeactionterminate( entity )
{
    entity clearpath();
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0xf4cf23e9, Offset: 0x1f60
// Size: 0x16
function private zombiestumbleactionstart( entity )
{
    entity.stumble = undefined;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0x9d1c20bf, Offset: 0x1f80
// Size: 0x1a
function private zombieattackobjectstart( entity )
{
    entity.is_inert = 1;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0xbddc2ef3, Offset: 0x1fa8
// Size: 0x1a
function private zombieattackobjectterminate( entity )
{
    entity.is_inert = 0;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x6b4d6bc0, Offset: 0x1fd0
// Size: 0x44, Type: bool
function zombiegiblegscondition( entity )
{
    return gibserverutils::isgibbed( entity, 256 ) || gibserverutils::isgibbed( entity, 128 );
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xf4789346, Offset: 0x2020
// Size: 0x22
function function_f937377( entity )
{
    entity.ai.var_80045105 = gettime();
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x4aab3583, Offset: 0x2050
// Size: 0x5b4
function zombienotetrackmeleefire( entity )
{
    if ( isdefined( entity.marked_for_death ) && entity.marked_for_death )
    {
        return;
    }
    
    entity.melee_cooldown = gettime() + getdvarfloat( #"scr_zombiemeleecooldown", 1 ) * 1000;
    
    if ( isdefined( entity.aat_turned ) && entity.aat_turned )
    {
        if ( isdefined( entity.enemy ) && isalive( entity.enemy ) && !isplayer( entity.enemy ) )
        {
            if ( isdefined( entity.var_16d0eb06 ) && isdefined( entity.enemy.var_6d23c054 ) && entity.enemy.var_6d23c054 )
            {
                if ( isdefined( entity.var_443d78cc ) )
                {
                    e_attacker = entity.var_443d78cc;
                }
                else
                {
                    e_attacker = entity;
                }
                
                entity.enemy dodamage( entity.var_16d0eb06, entity.origin, e_attacker, entity );
                
                if ( !isalive( entity.enemy ) )
                {
                    gibserverutils::gibhead( entity.enemy );
                    entity.enemy zombie_utility::gib_random_parts();
                    entity.enemy.var_7105092c = 1;
                    entity.n_aat_turned_zombie_kills++;
                }
            }
            else if ( isdefined( entity.enemy.var_6d23c054 ) && entity.enemy.var_6d23c054 && isdefined( entity.enemy.allowdeath ) && entity.enemy.allowdeath )
            {
                if ( isdefined( entity.var_443d78cc ) )
                {
                    e_attacker = entity.var_443d78cc;
                }
                else
                {
                    e_attacker = entity;
                }
                
                gibserverutils::gibhead( entity.enemy );
                entity.enemy zombie_utility::gib_random_parts();
                entity.enemy.var_7105092c = 1;
                entity.enemy kill( entity.enemy.origin, e_attacker, entity, undefined, undefined, 1 );
                entity.n_aat_turned_zombie_kills++;
            }
            else if ( isdefined( entity.enemy.canbetargetedbyturnedzombies ) && entity.enemy.canbetargetedbyturnedzombies )
            {
                entity melee();
            }
            
            entity callback::callback( #"on_ai_melee" );
        }
        
        return;
    }
    
    if ( isdefined( entity.enemy ) && isdefined( entity.enemy.ignoreme ) && entity.enemy.ignoreme )
    {
        return;
    }
    
    if ( isdefined( entity.ai.var_80045105 ) )
    {
        /#
            record3dtext( "<dev string:x38>" + gettime() - entity.ai.var_80045105, self.origin, ( 1, 0, 0 ), "<dev string:x45>", entity );
        #/
    }
    
    if ( isdefined( level.custom_melee_fire ) )
    {
        entity [[ level.custom_melee_fire ]]();
    }
    else
    {
        entity melee();
    }
    
    /#
        record3dtext( "<dev string:x4e>", entity.origin, ( 1, 0, 0 ), "<dev string:x45>", entity );
        
        if ( isdefined( entity.enemy ) )
        {
            eyepos = entity geteye();
            record3dtext( "<dev string:x56>" + distance2d( eyepos, entity.enemy.origin ), entity.origin, ( 1, 0, 0 ), "<dev string:x45>", entity );
        }
    #/
    
    if ( zombieshouldattackobject( entity ) )
    {
        if ( isdefined( level.attackablecallback ) )
        {
            entity.attackable [[ level.attackablecallback ]]( entity );
        }
    }
    
    entity callback::callback( #"on_ai_melee" );
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x41d9edae, Offset: 0x2610
// Size: 0x24
function zombienotetrackcrushfire( entity )
{
    entity delete();
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xb917ecc9, Offset: 0x2640
// Size: 0x258
function zombietargetservice( entity )
{
    if ( isdefined( entity.enablepushtime ) )
    {
        if ( gettime() >= entity.enablepushtime )
        {
            entity collidewithactors( 1 );
            entity.enablepushtime = undefined;
        }
    }
    
    if ( isdefined( entity.disabletargetservice ) && entity.disabletargetservice )
    {
        return 0;
    }
    
    if ( isdefined( entity.ignoreall ) && entity.ignoreall )
    {
        return 0;
    }
    
    specifictarget = undefined;
    
    if ( isdefined( level.zombielevelspecifictargetcallback ) )
    {
        specifictarget = [[ level.zombielevelspecifictargetcallback ]]();
    }
    
    if ( isdefined( specifictarget ) )
    {
        entity setgoal( specifictarget.origin );
        return;
    }
    
    player = zombie_utility::get_closest_valid_player( self.origin, self.ignore_player );
    
    if ( !isdefined( player ) )
    {
        if ( isdefined( self.ignore_player ) )
        {
            if ( isdefined( level._should_skip_ignore_player_logic ) && [[ level._should_skip_ignore_player_logic ]]() )
            {
                return 0;
            }
            
            self.ignore_player = [];
        }
        
        self setgoal( self.origin );
        return 0;
    }
    
    if ( isdefined( player.last_valid_position ) )
    {
        if ( !( isdefined( self.zombie_do_not_update_goal ) && self.zombie_do_not_update_goal ) )
        {
            if ( isdefined( level.zombie_use_zigzag_path ) && level.zombie_use_zigzag_path )
            {
                entity zombieupdatezigzaggoal();
            }
            else
            {
                entity setgoal( player.last_valid_position );
            }
        }
        
        return 1;
    }
    
    if ( !( isdefined( self.zombie_do_not_update_goal ) && self.zombie_do_not_update_goal ) )
    {
        entity setgoal( entity.origin );
    }
    
    return 0;
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0xae922131, Offset: 0x28a0
// Size: 0x5cc
function zombieupdatezigzaggoal()
{
    aiprofile_beginentry( "zombieUpdateZigZagGoal" );
    shouldrepath = 0;
    
    if ( !shouldrepath && isdefined( self.favoriteenemy ) )
    {
        if ( !isdefined( self.nextgoalupdate ) || self.nextgoalupdate <= gettime() )
        {
            shouldrepath = 1;
        }
        else if ( distancesquared( self.origin, self.favoriteenemy.origin ) <= 250 * 250 )
        {
            shouldrepath = 1;
        }
        else if ( isdefined( self.pathgoalpos ) )
        {
            distancetogoalsqr = distancesquared( self.origin, self.pathgoalpos );
            shouldrepath = distancetogoalsqr < 72 * 72;
        }
    }
    
    if ( isdefined( self.keep_moving ) && self.keep_moving )
    {
        if ( gettime() > self.keep_moving_time )
        {
            self.keep_moving = 0;
        }
    }
    
    if ( shouldrepath )
    {
        goalpos = self.favoriteenemy.origin;
        
        if ( isdefined( self.favoriteenemy.last_valid_position ) )
        {
            goalpos = self.favoriteenemy.last_valid_position;
        }
        
        self setgoal( goalpos );
        
        if ( distancesquared( self.origin, goalpos ) > 250 * 250 )
        {
            self.keep_moving = 1;
            self.keep_moving_time = gettime() + 250;
            path = self calcapproximatepathtoposition( goalpos, 0 );
            
            /#
                if ( getdvarint( #"ai_debugzigzag", 0 ) )
                {
                    for ( index = 1; index < path.size ; index++ )
                    {
                        recordline( path[ index - 1 ], path[ index ], ( 1, 0.5, 0 ), "<dev string:x64>", self );
                    }
                }
            #/
            
            if ( isdefined( level._zombiezigzagdistancemin ) && isdefined( level._zombiezigzagdistancemax ) )
            {
                min = level._zombiezigzagdistancemin;
                max = level._zombiezigzagdistancemax;
            }
            else
            {
                min = 240;
                max = 600;
            }
            
            deviationdistance = randomintrange( min, max );
            segmentlength = 0;
            
            for ( index = 1; index < path.size ; index++ )
            {
                currentseglength = distance( path[ index - 1 ], path[ index ] );
                
                if ( segmentlength + currentseglength > deviationdistance )
                {
                    remaininglength = deviationdistance - segmentlength;
                    seedposition = path[ index - 1 ] + vectornormalize( path[ index ] - path[ index - 1 ] ) * remaininglength;
                    
                    /#
                        recordcircle( seedposition, 2, ( 1, 0.5, 0 ), "<dev string:x64>", self );
                    #/
                    
                    innerzigzagradius = 0;
                    outerzigzagradius = 96;
                    queryresult = positionquery_source_navigation( seedposition, innerzigzagradius, outerzigzagradius, 0.5 * 72, 16, self, 16 );
                    positionquery_filter_inclaimedlocation( queryresult, self );
                    
                    if ( queryresult.data.size > 0 )
                    {
                        point = queryresult.data[ randomint( queryresult.data.size ) ];
                        self setgoal( point.origin );
                    }
                    
                    break;
                }
                
                segmentlength += currentseglength;
            }
        }
        
        if ( isdefined( level._zombiezigzagtimemin ) && isdefined( level._zombiezigzagtimemax ) )
        {
            mintime = level._zombiezigzagtimemin;
            maxtime = level._zombiezigzagtimemax;
        }
        else
        {
            mintime = 2500;
            maxtime = 3500;
        }
        
        self.nextgoalupdate = gettime() + randomintrange( mintime, maxtime );
    }
    
    aiprofile_endentry();
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xf6e1c40a, Offset: 0x2e78
// Size: 0x1fe, Type: bool
function zombiecrawlercollision( entity )
{
    if ( !( isdefined( entity.missinglegs ) && entity.missinglegs ) && !( isdefined( entity.knockdown ) && entity.knockdown ) )
    {
        return false;
    }
    
    if ( isdefined( entity.dontpushtime ) )
    {
        if ( gettime() < entity.dontpushtime )
        {
            return true;
        }
    }
    
    if ( !isdefined( level.zombie_team ) )
    {
        return false;
    }
    
    zombies = getaiteamarray( level.zombie_team );
    
    foreach ( zombie in zombies )
    {
        if ( zombie == entity )
        {
            continue;
        }
        
        if ( isdefined( zombie.missinglegs ) && zombie.missinglegs || isdefined( zombie.knockdown ) && zombie.knockdown )
        {
            continue;
        }
        
        dist_sq = distancesquared( entity.origin, zombie.origin );
        
        if ( dist_sq < 14400 )
        {
            entity collidewithactors( 0 );
            entity.dontpushtime = gettime() + 2000;
            return true;
        }
    }
    
    entity collidewithactors( 1 );
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x7809087c, Offset: 0x3080
// Size: 0x3c, Type: bool
function zombietraversalservice( entity )
{
    if ( isdefined( entity.traversestartnode ) )
    {
        entity collidewithactors( 0 );
        return true;
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x7c4a5f3, Offset: 0x30c8
// Size: 0x1ca, Type: bool
function zombieisatattackobject( entity )
{
    if ( isdefined( entity.missinglegs ) && entity.missinglegs )
    {
        return false;
    }
    
    if ( isdefined( entity.enemyoverride ) && isdefined( entity.enemyoverride[ 1 ] ) )
    {
        return false;
    }
    
    if ( isdefined( entity.favoriteenemy ) && isdefined( entity.favoriteenemy.b_is_designated_target ) && entity.favoriteenemy.b_is_designated_target )
    {
        return false;
    }
    
    if ( isdefined( entity.aat_turned ) && entity.aat_turned )
    {
        return false;
    }
    
    if ( isdefined( entity.attackable ) && isdefined( entity.attackable.is_active ) && entity.attackable.is_active )
    {
        if ( !isdefined( entity.attackable_slot ) )
        {
            return false;
        }
        
        dist = distance2dsquared( entity.origin, entity.attackable_slot.origin );
        
        if ( dist < 256 )
        {
            height_offset = abs( entity.origin[ 2 ] - entity.attackable_slot.origin[ 2 ] );
            
            if ( height_offset < 32 )
            {
                entity.is_at_attackable = 1;
                return true;
            }
        }
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xc59fcd36, Offset: 0x32a0
// Size: 0x134, Type: bool
function zombieshouldattackobject( entity )
{
    if ( isdefined( entity.missinglegs ) && entity.missinglegs )
    {
        return false;
    }
    
    if ( isdefined( entity.enemyoverride ) && isdefined( entity.enemyoverride[ 1 ] ) )
    {
        return false;
    }
    
    if ( isdefined( entity.favoriteenemy ) && isdefined( entity.favoriteenemy.b_is_designated_target ) && entity.favoriteenemy.b_is_designated_target )
    {
        return false;
    }
    
    if ( isdefined( entity.aat_turned ) && entity.aat_turned )
    {
        return false;
    }
    
    if ( isdefined( entity.attackable ) && isdefined( entity.attackable.is_active ) && entity.attackable.is_active )
    {
        if ( isdefined( entity.is_at_attackable ) && entity.is_at_attackable )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xbce76067, Offset: 0x33e0
// Size: 0x128
function function_997f1224( entity )
{
    if ( entity.archetype == #"zombie" && !isdefined( entity.subarchetype ) && !( isdefined( self.missinglegs ) && self.missinglegs ) )
    {
        if ( entity.zombie_move_speed == "walk" )
        {
            return ( 100 * 100 );
        }
        else if ( entity.zombie_move_speed == "run" )
        {
            return ( 120 * 120 );
        }
        
        return ( 90 * 90 );
    }
    
    if ( isdefined( entity.meleeweapon ) && entity.meleeweapon !== level.weaponnone )
    {
        meleedistsq = entity.meleeweapon.aimeleerange * entity.meleeweapon.aimeleerange;
    }
    
    if ( !isdefined( meleedistsq ) )
    {
        return ( 100 * 100 );
    }
    
    return meleedistsq;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x621550c1, Offset: 0x3510
// Size: 0x396, Type: bool
function zombieshouldmeleecondition( entity )
{
    if ( isdefined( entity.enemyoverride ) && isdefined( entity.enemyoverride[ 1 ] ) )
    {
        return false;
    }
    
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( isdefined( entity.marked_for_death ) && entity.marked_for_death )
    {
        return false;
    }
    
    if ( isdefined( entity.ignoremelee ) && entity.ignoremelee )
    {
        return false;
    }
    
    if ( abs( entity.origin[ 2 ] - entity.enemy.origin[ 2 ] ) > ( isdefined( entity.var_737e8510 ) ? entity.var_737e8510 : 64 ) )
    {
        return false;
    }
    
    meleedistsq = function_997f1224( entity );
    
    if ( distancesquared( entity.origin, entity.enemy.origin ) > meleedistsq )
    {
        return false;
    }
    
    var_7b871a7d = 1;
    dist2d = distance2dsquared( entity.origin, entity.enemy.origin );
    
    if ( dist2d < 576 )
    {
        height = entity.origin[ 2 ] - entity.enemy.origin[ 2 ];
        
        if ( height < 64 )
        {
            var_7b871a7d = 0;
        }
    }
    
    if ( var_7b871a7d )
    {
        yawtoenemy = angleclamp180( entity.angles[ 1 ] - vectortoangles( entity.enemy.origin - entity.origin )[ 1 ] );
        
        if ( abs( yawtoenemy ) > ( isdefined( entity.var_1c0eb62a ) ? entity.var_1c0eb62a : 60 ) )
        {
            return false;
        }
        
        if ( !entity cansee( entity.enemy ) )
        {
            return false;
        }
    }
    
    if ( distancesquared( entity.origin, entity.enemy.origin ) < 40 * 40 )
    {
        return true;
    }
    
    if ( var_7b871a7d )
    {
        if ( !tracepassedonnavmesh( entity.origin, isdefined( entity.enemy.last_valid_position ) ? entity.enemy.last_valid_position : entity.enemy.origin, entity.enemy getpathfindingradius() ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0xf12e261b, Offset: 0x38b0
// Size: 0xa6, Type: bool
function private function_1b8c9407( entity )
{
    /#
        if ( getdvarint( #"hash_1a5939d8c37a2e07", 0 ) )
        {
            return false;
        }
    #/
    
    var_9fce1294 = blackboard::getblackboardevents( "zombie_full_pain" );
    
    if ( isdefined( var_9fce1294 ) && var_9fce1294.size )
    {
        return false;
    }
    
    if ( isdefined( level.var_eeb66e64 ) && ![[ level.var_eeb66e64 ]]( entity ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0x29695e6e, Offset: 0x3960
// Size: 0x74
function private function_ecba5a44( entity )
{
    var_1e466fbb = spawnstruct();
    var_1e466fbb.enemy = entity.enemy;
    blackboard::addblackboardevent( "zombie_full_pain", var_1e466fbb, randomintrange( 6000, 9000 ) );
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0x45d0d8b7, Offset: 0x39e0
// Size: 0x28, Type: bool
function private zombieshouldmovelowg( entity )
{
    return isdefined( entity.low_gravity ) && entity.low_gravity;
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0x28707d07, Offset: 0x3a10
// Size: 0x30, Type: bool
function private zombieshouldturn( entity )
{
    return !isdefined( entity.turn_cooldown ) || entity.turn_cooldown < gettime();
}

// Namespace zombiebehavior/zombie
// Params 1, eflags: 0x4
// Checksum 0x90b5e14e, Offset: 0x3a48
// Size: 0x22, Type: bool
function private function_a716a3af( entity )
{
    entity.turn_cooldown = gettime() + 1000;
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x10060c84, Offset: 0x3a78
// Size: 0x390, Type: bool
function zombieshouldjumpmeleecondition( entity )
{
    if ( !( isdefined( entity.low_gravity ) && entity.low_gravity ) )
    {
        return false;
    }
    
    if ( isdefined( entity.enemyoverride ) && isdefined( entity.enemyoverride[ 1 ] ) )
    {
        return false;
    }
    
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( isdefined( entity.marked_for_death ) )
    {
        return false;
    }
    
    if ( isdefined( entity.ignoremelee ) && entity.ignoremelee )
    {
        return false;
    }
    
    if ( entity.enemy isonground() )
    {
        if ( isplayer( entity.enemy ) && entity.enemy isplayerswimming() )
        {
            waterheight = getwaterheight( entity.enemy.origin );
            
            if ( waterheight - entity.enemy.origin[ 2 ] < 24 )
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
    
    jumpchance = getdvarfloat( #"zmmeleejumpchance", 0.5 );
    
    if ( entity getentitynumber() % 10 / 10 > jumpchance )
    {
        return false;
    }
    
    predictedposition = entity.enemy.origin + entity.enemy getvelocity() * float( function_60d95f53() ) / 1000 * 2;
    jumpdistancesq = pow( getdvarint( #"zmmeleejumpdistance", 180 ), 2 );
    
    if ( distance2dsquared( entity.origin, predictedposition ) > jumpdistancesq )
    {
        return false;
    }
    
    yawtoenemy = angleclamp180( entity.angles[ 1 ] - vectortoangles( entity.enemy.origin - entity.origin )[ 1 ] );
    
    if ( abs( yawtoenemy ) > 60 )
    {
        return false;
    }
    
    heighttoenemy = entity.enemy.origin[ 2 ] - entity.origin[ 2 ];
    
    if ( heighttoenemy <= getdvarint( #"zmmeleejumpheightdifference", 60 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x113841dc, Offset: 0x3e10
// Size: 0x250, Type: bool
function zombieshouldjumpunderwatermelee( entity )
{
    if ( isdefined( entity.enemyoverride ) && isdefined( entity.enemyoverride[ 1 ] ) )
    {
        return false;
    }
    
    if ( isdefined( entity.ignoreall ) && entity.ignoreall )
    {
        return false;
    }
    
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( isdefined( entity.marked_for_death ) )
    {
        return false;
    }
    
    if ( isdefined( entity.ignoremelee ) && entity.ignoremelee )
    {
        return false;
    }
    
    if ( entity.enemy isonground() )
    {
        return false;
    }
    
    if ( entity depthinwater() < 48 )
    {
        return false;
    }
    
    jumpdistancesq = pow( getdvarint( #"zmmeleewaterjumpdistance", 64 ), 2 );
    
    if ( distance2dsquared( entity.origin, entity.enemy.origin ) > jumpdistancesq )
    {
        return false;
    }
    
    yawtoenemy = angleclamp180( entity.angles[ 1 ] - vectortoangles( entity.enemy.origin - entity.origin )[ 1 ] );
    
    if ( abs( yawtoenemy ) > 60 )
    {
        return false;
    }
    
    heighttoenemy = entity.enemy.origin[ 2 ] - entity.origin[ 2 ];
    
    if ( heighttoenemy <= getdvarint( #"zmmeleejumpunderwaterheightdifference", 48 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x81a54cd3, Offset: 0x4068
// Size: 0x1a2, Type: bool
function zombiestumble( entity )
{
    if ( isdefined( entity.missinglegs ) && entity.missinglegs )
    {
        return false;
    }
    
    if ( !( isdefined( entity.canstumble ) && entity.canstumble ) )
    {
        return false;
    }
    
    if ( !isdefined( entity.zombie_move_speed ) || entity.zombie_move_speed != "sprint" )
    {
        return false;
    }
    
    if ( isdefined( entity.stumble ) )
    {
        return false;
    }
    
    if ( !isdefined( entity.next_stumble_time ) )
    {
        entity.next_stumble_time = gettime() + randomintrange( 9000, 12000 );
    }
    
    if ( gettime() > entity.next_stumble_time )
    {
        if ( randomint( 100 ) < 5 )
        {
            closestplayer = arraygetclosest( entity.origin, level.players );
            
            if ( distancesquared( closestplayer.origin, entity.origin ) > 50000 )
            {
                if ( isdefined( entity.next_juke_time ) )
                {
                    entity.next_juke_time = undefined;
                }
                
                entity.next_stumble_time = undefined;
                entity.stumble = 1;
                return true;
            }
        }
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xfd31ce50, Offset: 0x4218
// Size: 0x3c2
function zombiejuke( entity )
{
    if ( !entity ai::has_behavior_attribute( "can_juke" ) )
    {
        return 0;
    }
    
    if ( !entity ai::get_behavior_attribute( "can_juke" ) )
    {
        return 0;
    }
    
    if ( isdefined( entity.missinglegs ) && entity.missinglegs )
    {
        return 0;
    }
    
    if ( entity aiutility::function_cc26899f() != "locomotion_speed_walk" )
    {
        if ( entity ai::has_behavior_attribute( "spark_behavior" ) && !entity ai::get_behavior_attribute( "spark_behavior" ) )
        {
            return 0;
        }
    }
    
    if ( isdefined( entity.juke ) )
    {
        return 0;
    }
    
    if ( !isdefined( entity.next_juke_time ) )
    {
        entity.next_juke_time = gettime() + randomintrange( 7500, 9500 );
    }
    
    if ( gettime() > entity.next_juke_time )
    {
        entity.next_juke_time = undefined;
        
        if ( randomint( 100 ) < 25 || entity ai::has_behavior_attribute( "spark_behavior" ) && entity ai::get_behavior_attribute( "spark_behavior" ) )
        {
            if ( isdefined( entity.next_stumble_time ) )
            {
                entity.next_stumble_time = undefined;
            }
            
            forwardoffset = 15;
            entity.ignorebackwardposition = 1;
            
            if ( math::cointoss() )
            {
                jukedistance = 101;
                entity.jukedistance = "long";
                
                switch ( entity aiutility::function_cc26899f() )
                {
                    case #"locomotion_speed_run":
                    case #"locomotion_speed_walk":
                        forwardoffset = 122;
                        break;
                    case #"locomotion_speed_sprint":
                        forwardoffset = 129;
                        break;
                }
                
                entity.juke = aiutility::calculatejukedirection( entity, forwardoffset, jukedistance );
            }
            
            if ( !isdefined( entity.juke ) || entity.juke == "forward" )
            {
                jukedistance = 69;
                entity.jukedistance = "short";
                
                switch ( entity aiutility::function_cc26899f() )
                {
                    case #"locomotion_speed_run":
                    case #"locomotion_speed_walk":
                        forwardoffset = 127;
                        break;
                    case #"locomotion_speed_sprint":
                        forwardoffset = 148;
                        break;
                }
                
                entity.juke = aiutility::calculatejukedirection( entity, forwardoffset, jukedistance );
                
                if ( entity.juke == "forward" )
                {
                    entity.juke = undefined;
                    entity.jukedistance = undefined;
                    return 0;
                }
            }
        }
    }
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x46571bb9, Offset: 0x45e8
// Size: 0xc
function zombiedeathaction( entity )
{
    
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xfc010571, Offset: 0x4600
// Size: 0x50, Type: bool
function waskilledbyinterdimensionalguncondition( entity )
{
    if ( isdefined( entity.interdimensional_gun_kill ) && !isdefined( entity.killby_interdimensional_gun_hole ) && isalive( entity ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x6058643e, Offset: 0x4658
// Size: 0x24, Type: bool
function wascrushedbyinterdimensionalgunblackholecondition( entity )
{
    if ( isdefined( entity.killby_interdimensional_gun_hole ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zombiebehavior/zombie
// Params 5
// Checksum 0xe62dddc6, Offset: 0x4688
// Size: 0xc2
function zombieidgundeathmocompstart( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity orientmode( "face angle", entity.angles[ 1 ] );
    entity animmode( "noclip" );
    entity.pushable = 0;
    entity.blockingpain = 1;
    entity pathmode( "dont move" );
    entity.hole_pull_speed = 0;
}

// Namespace zombiebehavior/zombie
// Params 5
// Checksum 0x9446512a, Offset: 0x4758
// Size: 0xc2
function zombiemeleejumpmocompstart( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity orientmode( "face enemy" );
    entity animmode( "noclip", 0 );
    entity.pushable = 0;
    entity.blockingpain = 1;
    entity.clamptonavmesh = 0;
    entity collidewithactors( 0 );
    entity.jumpstartposition = entity.origin;
}

// Namespace zombiebehavior/zombie
// Params 5
// Checksum 0xdaf700cd, Offset: 0x4828
// Size: 0x32c
function zombiemeleejumpmocompupdate( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    normalizedtime = ( entity getanimtime( mocompanim ) * getanimlength( mocompanim ) + mocompanimblendouttime ) / mocompduration;
    
    if ( normalizedtime > 0.5 )
    {
        entity orientmode( "face angle", entity.angles[ 1 ] );
    }
    
    speed = 5;
    
    if ( isdefined( entity.zombie_move_speed ) )
    {
        switch ( entity.zombie_move_speed )
        {
            case #"walk":
                speed = 5;
                break;
            case #"run":
                speed = 6;
                break;
            case #"sprint":
                speed = 7;
                break;
        }
    }
    
    newposition = entity.origin + anglestoforward( entity.angles ) * speed;
    newtestposition = ( newposition[ 0 ], newposition[ 1 ], entity.jumpstartposition[ 2 ] );
    newvalidposition = getclosestpointonnavmesh( newtestposition, 12, 20 );
    
    if ( isdefined( newvalidposition ) )
    {
        newvalidposition = ( newvalidposition[ 0 ], newvalidposition[ 1 ], entity.origin[ 2 ] );
    }
    else
    {
        newvalidposition = entity.origin;
    }
    
    if ( !( isdefined( entity.var_7c16e514 ) && entity.var_7c16e514 ) )
    {
        waterheight = getwaterheight( entity.origin );
        
        if ( newvalidposition[ 2 ] + entity function_6a9ae71() > waterheight )
        {
            newvalidposition = ( newvalidposition[ 0 ], newvalidposition[ 1 ], waterheight - entity function_6a9ae71() );
        }
    }
    
    groundpoint = getclosestpointonnavmesh( newvalidposition, 12, 20 );
    
    if ( isdefined( groundpoint ) && groundpoint[ 2 ] > newvalidposition[ 2 ] )
    {
        newvalidposition = ( newvalidposition[ 0 ], newvalidposition[ 1 ], groundpoint[ 2 ] );
    }
    
    entity forceteleport( newvalidposition );
}

// Namespace zombiebehavior/zombie
// Params 5
// Checksum 0xd1e3efb7, Offset: 0x4b60
// Size: 0xbc
function zombiemeleejumpmocompterminate( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity.pushable = 1;
    entity.blockingpain = 0;
    entity.clamptonavmesh = 1;
    entity collidewithactors( 1 );
    groundpoint = getclosestpointonnavmesh( entity.origin, 12 );
    
    if ( isdefined( groundpoint ) )
    {
        entity forceteleport( groundpoint );
    }
}

// Namespace zombiebehavior/zombie
// Params 5
// Checksum 0xd418f273, Offset: 0x4c28
// Size: 0x334
function zombieidgundeathupdate( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    if ( !isdefined( entity.killby_interdimensional_gun_hole ) )
    {
        entity_eye = entity geteye();
        
        if ( entity.b_vortex_repositioned !== 1 )
        {
            entity.b_vortex_repositioned = 1;
            v_nearest_navmesh_point = getclosestpointonnavmesh( entity.damageorigin, 36, 15 );
            
            if ( isdefined( v_nearest_navmesh_point ) )
            {
                f_distance = distance( entity.damageorigin, v_nearest_navmesh_point );
                
                if ( f_distance < 41 )
                {
                    entity.damageorigin += ( 0, 0, 36 );
                }
            }
        }
        
        entity_center = entity.origin + ( entity_eye - entity.origin ) / 2;
        flyingdir = entity.damageorigin - entity_center;
        lengthfromhole = length( flyingdir );
        
        if ( lengthfromhole < entity.hole_pull_speed )
        {
            entity.killby_interdimensional_gun_hole = 1;
            entity.allowdeath = 1;
            entity.takedamage = 1;
            entity.aioverridedamage = undefined;
            entity.magic_bullet_shield = 0;
            level notify( #"interdimensional_kill", { #entity:entity } );
            
            if ( isdefined( entity.interdimensional_gun_weapon ) && isdefined( entity.interdimensional_gun_attacker ) )
            {
                entity kill( entity.origin, entity.interdimensional_gun_attacker, entity.interdimensional_gun_attacker, entity.interdimensional_gun_weapon );
            }
            else
            {
                entity kill( entity.origin );
            }
            
            return;
        }
        
        if ( entity.hole_pull_speed < 12 )
        {
            entity.hole_pull_speed += 0.5;
            
            if ( entity.hole_pull_speed > 12 )
            {
                entity.hole_pull_speed = 12;
            }
        }
        
        flyingdir = vectornormalize( flyingdir );
        entity forceteleport( entity.origin + flyingdir * entity.hole_pull_speed );
    }
}

// Namespace zombiebehavior/zombie
// Params 5
// Checksum 0x76bda959, Offset: 0x4f68
// Size: 0x8a
function zombieidgunholedeathmocompstart( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity orientmode( "face angle", entity.angles[ 1 ] );
    entity animmode( "noclip" );
    entity.pushable = 0;
}

// Namespace zombiebehavior/zombie
// Params 5
// Checksum 0x2bfc2944, Offset: 0x5000
// Size: 0x64
function zombieidgunholedeathmocompterminate( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    if ( !( isdefined( entity.interdimensional_gun_kill_vortex_explosion ) && entity.interdimensional_gun_kill_vortex_explosion ) )
    {
        entity hide();
    }
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0x319f4447, Offset: 0x5070
// Size: 0x7c
function private zombieturnmocompstart( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity orientmode( "face angle", entity.angles[ 1 ] );
    entity animmode( "angle deltas", 0 );
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0xb14c8283, Offset: 0x50f8
// Size: 0xa4
function private zombieturnmocompupdate( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    normalizedtime = ( entity getanimtime( mocompanim ) + mocompanimblendouttime ) / mocompduration;
    
    if ( normalizedtime > 0.25 )
    {
        entity orientmode( "face motion" );
        entity animmode( "normal", 0 );
    }
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0x55d3b94a, Offset: 0x51a8
// Size: 0x6c
function private zombieturnmocompterminate( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity orientmode( "face motion" );
    entity animmode( "normal", 0 );
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xf5015f93, Offset: 0x5220
// Size: 0x28, Type: bool
function zombiehaslegs( entity )
{
    if ( entity.missinglegs === 1 )
    {
        return false;
    }
    
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xee686a56, Offset: 0x5250
// Size: 0x24, Type: bool
function zombiemissinglegs( entity )
{
    return !zombiehaslegs( entity );
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xd391154f, Offset: 0x5280
// Size: 0x6a, Type: bool
function zombieshouldproceduraltraverse( entity )
{
    return isdefined( entity.traversestartnode ) && isdefined( entity.traverseendnode ) && entity.traversestartnode.spawnflags & 1024 && entity.traverseendnode.spawnflags & 1024;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x2a2ee388, Offset: 0x52f8
// Size: 0xba, Type: bool
function zombieshouldmeleesuicide( entity )
{
    if ( !entity ai::get_behavior_attribute( "suicidal_behavior" ) )
    {
        return false;
    }
    
    if ( isdefined( entity.magic_bullet_shield ) && entity.magic_bullet_shield )
    {
        return false;
    }
    
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( isdefined( entity.marked_for_death ) )
    {
        return false;
    }
    
    if ( distancesquared( entity.origin, entity.enemy.origin ) > 40000 )
    {
        return false;
    }
    
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x8192506, Offset: 0x53c0
// Size: 0x40
function zombiemeleesuicidestart( entity )
{
    entity.blockingpain = 1;
    
    if ( isdefined( level.zombiemeleesuicidecallback ) )
    {
        entity thread [[ level.zombiemeleesuicidecallback ]]( entity );
    }
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0xbf79ed3f, Offset: 0x5408
// Size: 0xc
function zombiemeleesuicideupdate( entity )
{
    
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x5ea2f16, Offset: 0x5420
// Size: 0x84
function zombiemeleesuicideterminate( entity )
{
    if ( isalive( entity ) && zombieshouldmeleesuicide( entity ) )
    {
        entity.takedamage = 1;
        entity.allowdeath = 1;
        
        if ( isdefined( level.zombiemeleesuicidedonecallback ) )
        {
            entity thread [[ level.zombiemeleesuicidedonecallback ]]( entity );
        }
    }
}

// Namespace zombiebehavior/zombie
// Params 2
// Checksum 0xc97f5ef3, Offset: 0x54b0
// Size: 0xea
function zombiemoveactionstart( entity, asmstatename )
{
    function_ec25b529( entity );
    animationstatenetworkutility::requeststate( entity, asmstatename );
    
    if ( isdefined( entity.stumble ) && !isdefined( entity.move_anim_end_time ) )
    {
        stumbleactionresult = entity astsearch( asmstatename );
        stumbleactionanimation = animationstatenetworkutility::searchanimationmap( entity, stumbleactionresult[ #"animation" ] );
        entity.move_anim_end_time = entity.movetime + getanimlength( stumbleactionanimation );
    }
    
    return 5;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x414de296, Offset: 0x55a8
// Size: 0x28, Type: bool
function function_a82068d7( entity )
{
    function_ec25b529( entity );
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x337ee1b, Offset: 0x55d8
// Size: 0x32
function function_ec25b529( entity )
{
    entity.movetime = gettime();
    entity.moveorigin = entity.origin;
}

// Namespace zombiebehavior/zombie
// Params 2
// Checksum 0x5f606371, Offset: 0x5618
// Size: 0xc2
function zombiemoveactionupdate( entity, asmstatename )
{
    if ( isdefined( entity.move_anim_end_time ) && gettime() >= entity.move_anim_end_time )
    {
        entity.move_anim_end_time = undefined;
        return 4;
    }
    
    function_26f9b8b1( entity );
    
    if ( entity asmgetstatus() == "asm_status_complete" )
    {
        if ( entity iscurrentbtactionlooping() )
        {
            return zombiemoveactionstart( entity, asmstatename );
        }
        else
        {
            return 4;
        }
    }
    
    return 5;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x151dd79d, Offset: 0x56e8
// Size: 0x28, Type: bool
function function_626edd6b( entity )
{
    function_26f9b8b1( entity );
    return true;
}

// Namespace zombiebehavior/zombie
// Params 1
// Checksum 0x402c3b1a, Offset: 0x5718
// Size: 0x186
function function_26f9b8b1( entity )
{
    if ( !( isdefined( entity.missinglegs ) && entity.missinglegs ) && gettime() - entity.movetime > 1000 )
    {
        distsq = distance2dsquared( entity.origin, entity.moveorigin );
        
        if ( distsq < 144 )
        {
            entity setavoidancemask( "avoid all" );
            entity.cant_move = 1;
            
            /#
                record3dtext( "<dev string:x71>", entity.origin, ( 0, 0, 1 ), "<dev string:x45>", entity );
            #/
            
            if ( isdefined( entity.cant_move_cb ) )
            {
                entity thread [[ entity.cant_move_cb ]]();
            }
        }
        else
        {
            entity setavoidancemask( "avoid none" );
            entity.cant_move = 0;
            
            if ( isdefined( entity.var_63d2fce2 ) )
            {
                entity thread [[ entity.var_63d2fce2 ]]();
            }
        }
        
        entity.movetime = gettime();
        entity.moveorigin = entity.origin;
    }
}

// Namespace zombiebehavior/zombie
// Params 2
// Checksum 0x40b45b08, Offset: 0x58a8
// Size: 0x58
function zombiemoveactionterminate( entity, asmstatename )
{
    if ( !( isdefined( entity.missinglegs ) && entity.missinglegs ) )
    {
        entity setavoidancemask( "avoid none" );
    }
    
    return 4;
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0xcdff4726, Offset: 0x5908
// Size: 0xae
function function_79fe956f()
{
    self notify( "2360c9f36a377896" );
    self endon( "2360c9f36a377896" );
    self endon( #"death" );
    
    if ( !isdefined( self.var_9ed3cc11 ) )
    {
        self.var_9ed3cc11 = self function_e827fc0e();
    }
    
    self pushplayer( 1 );
    wait 2;
    
    if ( isdefined( self.var_9ed3cc11 ) )
    {
        self pushplayer( self.var_9ed3cc11 );
        self.var_9ed3cc11 = undefined;
    }
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0x7327382a, Offset: 0x59c0
// Size: 0x17e
function function_22762653()
{
    self notify( "333a3e1bcad60a56" );
    self endon( "333a3e1bcad60a56" );
    self endon( #"death" );
    var_159fa617 = 0;
    
    foreach ( player in getplayers() )
    {
        if ( player laststand::player_is_in_laststand() )
        {
            if ( distancesquared( self.origin, player.origin ) < 14400 )
            {
                var_159fa617 = 1;
                break;
            }
        }
    }
    
    if ( !var_159fa617 )
    {
        return;
    }
    
    if ( !isdefined( self.var_9ed3cc11 ) )
    {
        self.var_9ed3cc11 = self function_e827fc0e();
    }
    
    self pushplayer( 1 );
    wait 2;
    
    if ( isdefined( self.var_9ed3cc11 ) )
    {
        self pushplayer( self.var_9ed3cc11 );
        self.var_9ed3cc11 = undefined;
    }
}

// Namespace zombiebehavior/zombie
// Params 2
// Checksum 0x3bd94843, Offset: 0x5b48
// Size: 0x50
function function_9b6830c9( entity, asmstatename )
{
    animationstatenetworkutility::requeststate( entity, asmstatename );
    entity pathmode( "dont move", 1 );
    return 5;
}

// Namespace zombiebehavior/zombie
// Params 2
// Checksum 0xabdbcce5, Offset: 0x5ba0
// Size: 0x38
function function_fbdc2cc4( entity, asmstatename )
{
    entity pathmode( "move allowed" );
    return 4;
}

// Namespace zombiebehavior/zombie
// Params 0
// Checksum 0x2fd0aba0, Offset: 0x5be0
// Size: 0x24
function archetypezombiedeathoverrideinit()
{
    aiutility::addaioverridekilledcallback( self, &zombiegibkilledanhilateoverride );
}

// Namespace zombiebehavior/zombie
// Params 8, eflags: 0x4
// Checksum 0x3a8f8936, Offset: 0x5c10
// Size: 0x2f8
function private zombiegibkilledanhilateoverride( inflictor, attacker, damage, meansofdeath, weapon, dir, hitloc, offsettime )
{
    if ( !( isdefined( level.zombieanhilationenabled ) && level.zombieanhilationenabled ) )
    {
        return damage;
    }
    
    if ( isdefined( self.forceanhilateondeath ) && self.forceanhilateondeath )
    {
        self zombie_utility::gib_random_parts();
        gibserverutils::annihilate( self );
        return damage;
    }
    
    if ( isdefined( attacker ) && isplayer( attacker ) && ( isdefined( attacker.forceanhilateondeath ) && attacker.forceanhilateondeath || isdefined( level.forceanhilateondeath ) && level.forceanhilateondeath ) )
    {
        self zombie_utility::gib_random_parts();
        gibserverutils::annihilate( self );
        return damage;
    }
    
    attackerdistance = 0;
    
    if ( isdefined( attacker ) )
    {
        attackerdistance = distancesquared( attacker.origin, self.origin );
    }
    
    isexplosive = isinarray( array( "MOD_CRUSH", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE" ), meansofdeath );
    
    if ( isdefined( weapon.weapclass ) && weapon.weapclass == "turret" )
    {
        if ( isdefined( inflictor ) )
        {
            isdirectexplosive = isinarray( array( "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE" ), meansofdeath );
            iscloseexplosive = distancesquared( inflictor.origin, self.origin ) <= 60 * 60;
            
            if ( isdirectexplosive && iscloseexplosive )
            {
                self zombie_utility::gib_random_parts();
                gibserverutils::annihilate( self );
            }
        }
    }
    
    return damage;
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0x1a45ca9c, Offset: 0x5f10
// Size: 0x114
function private zombiezombieidlemocompstart( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    if ( isdefined( entity.enemyoverride ) && isdefined( entity.enemyoverride[ 1 ] ) && entity != entity.enemyoverride[ 1 ] )
    {
        entity orientmode( "face direction", entity.enemyoverride[ 1 ].origin - entity.origin );
        entity animmode( "zonly_physics", 0 );
        return;
    }
    
    entity orientmode( "face current" );
    entity animmode( "zonly_physics", 0 );
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0xb545a985, Offset: 0x6030
// Size: 0xd4
function private zombieattackobjectmocompstart( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    if ( isdefined( entity.attackable_slot ) )
    {
        entity orientmode( "face angle", entity.attackable_slot.angles[ 1 ] );
        entity animmode( "zonly_physics", 0 );
        return;
    }
    
    entity orientmode( "face current" );
    entity animmode( "zonly_physics", 0 );
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0xd8478e5c, Offset: 0x6110
// Size: 0x64
function private zombieattackobjectmocompupdate( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    if ( isdefined( entity.attackable_slot ) )
    {
        entity forceteleport( entity.attackable_slot.origin );
    }
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0x93718d69, Offset: 0x6180
// Size: 0x1a4
function private function_54d75299( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    if ( isdefined( entity.enemy ) )
    {
        entity orientmode( "face enemy" );
    }
    
    entity animmode( "zonly_physics", 1 );
    entity pathmode( "dont move" );
    localdeltahalfvector = getmovedelta( mocompanim, 0, 0.9, entity );
    endpoint = entity localtoworldcoords( localdeltahalfvector );
    
    /#
        recordcircle( endpoint, 3, ( 1, 0, 0 ), "<dev string:x98>" );
        recordline( entity.origin, endpoint, ( 1, 0, 0 ), "<dev string:x98>" );
        record3dtext( "<dev string:xa1>" + distance( entity.origin, endpoint ) + "<dev string:xa9>" + function_9e72a96( mocompanim ), endpoint, ( 1, 0, 0 ), "<dev string:x45>" );
    #/
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0x3528e392, Offset: 0x6330
// Size: 0x4c
function private function_d1474842( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity pathmode( "dont move" );
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0xc57fb532, Offset: 0x6388
// Size: 0x4c
function private function_b6d297bb( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity pathmode( "move allowed" );
}

// Namespace zombiebehavior/zombie
// Params 5, eflags: 0x4
// Checksum 0x45f2d578, Offset: 0x63e0
// Size: 0x194
function private function_cbbae5cb( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity orientmode( "face angle", entity.angles[ 1 ] );
    entity animmode( "normal" );
    
    if ( isdefined( entity.traverseendnode ) )
    {
        /#
            print3d( entity.traversestartnode.origin, "<dev string:xb2>", ( 1, 0, 0 ), 1, 1, 60 );
            print3d( entity.traverseendnode.origin, "<dev string:xb2>", ( 0, 1, 0 ), 1, 1, 60 );
            line( entity.traversestartnode.origin, entity.traverseendnode.origin, ( 0, 1, 0 ), 1, 0, 60 );
        #/
        
        entity forceteleport( entity.traverseendnode.origin, entity.traverseendnode.angles, 0 );
    }
}

// Namespace zombiebehavior/zombie
// Params 4
// Checksum 0x6c04ff43, Offset: 0x6580
// Size: 0x11c
function zombiegravity( entity, attribute, oldvalue, value )
{
    if ( value == "low" )
    {
        self.low_gravity = 1;
        
        if ( !isdefined( self.low_gravity_variant ) && isdefined( level.var_d9ffddf4 ) )
        {
            if ( isdefined( self.missinglegs ) && self.missinglegs )
            {
                self.low_gravity_variant = randomint( level.var_d9ffddf4[ #"crawl" ] );
            }
            else
            {
                self.low_gravity_variant = randomint( level.var_d9ffddf4[ self.zombie_move_speed ] );
            }
        }
    }
    else if ( value == "normal" )
    {
        self.low_gravity = 0;
    }
    
    entity setblackboardattribute( "_low_gravity", value );
}

