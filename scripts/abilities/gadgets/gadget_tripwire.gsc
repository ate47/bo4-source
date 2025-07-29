#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\damage;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\weapons_shared;
#using scripts\weapons\weaponobjects;

#namespace gadget_tripwire;

// Namespace gadget_tripwire/gadget_tripwire
// Params 0, eflags: 0x2
// Checksum 0x90763abb, Offset: 0x200
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"gadget_tripwire", &__init__, undefined, undefined );
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0xf02224cf, Offset: 0x248
// Size: 0x204
function __init__()
{
    clientfield::register( "missile", "tripwire_state", 1, 2, "int" );
    clientfield::register( "scriptmover", "tripwire_solo_beam_fx", 1, 1, "int" );
    callback::on_connect( &function_d863663f );
    weaponobjects::function_e6400478( #"eq_tripwire", &function_9f97e1a3, 1 );
    level.tripwireweapon = getweapon( "eq_tripwire" );
    
    if ( getgametypesetting( #"competitivesettings" ) === 1 )
    {
        level.var_c72e8c51 = getscriptbundle( "tripwire_custom_settings_comp" );
    }
    else if ( isdefined( level.tripwireweapon.customsettings ) )
    {
        level.var_c72e8c51 = getscriptbundle( level.tripwireweapon.customsettings );
    }
    else
    {
        level.var_c72e8c51 = getscriptbundle( "tripwire_custom_settings" );
    }
    
    if ( !isdefined( level.tripwires ) )
    {
        level.tripwires = [];
    }
    
    if ( !isdefined( level.var_5f6cceae ) )
    {
        level.var_5f6cceae = [];
    }
    
    level.var_2e06b76a = &function_9e546fb3;
    callback::on_finalize_initialization( &function_3675de8b );
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0xb65f2cac, Offset: 0x458
// Size: 0x90
function function_3675de8b()
{
    if ( isdefined( level.var_1b900c1d ) )
    {
        [[ level.var_1b900c1d ]]( getweapon( "eq_tripwire" ), &function_bff5c062 );
    }
    
    if ( isdefined( level.var_a5dacbea ) )
    {
        [[ level.var_a5dacbea ]]( getweapon( "eq_tripwire" ), &weaponobjects::function_127fb8f3 );
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 2
// Checksum 0x2147e381, Offset: 0x4f0
// Size: 0x1c4
function function_bff5c062( tripwire, attackingplayer )
{
    if ( !isdefined( tripwire ) || !isdefined( tripwire.watcher ) )
    {
        return;
    }
    
    tripwire.owner weaponobjects::hackerremoveweapon( tripwire );
    tripwire notify( #"hacked" );
    tripwire.owner = attackingplayer;
    tripwire setowner( attackingplayer );
    tripwire setteam( attackingplayer getteam() );
    
    if ( isdefined( tripwire.hacked ) )
    {
        tripwire clientfield::set( "tripwire_state", 3 );
        tripwire.hacked = undefined;
    }
    else
    {
        tripwire clientfield::set( "tripwire_state", 2 );
        tripwire.hacked = 1;
    }
    
    if ( isdefined( tripwire.entityenemyinfluencer ) )
    {
        tripwire influencers::remove_influencer( tripwire.entityenemyinfluencer );
    }
    
    tripwire.entityenemyinfluencer = tripwire influencers::create_entity_enemy_influencer( "claymore", attackingplayer.team );
    tripwire thread weaponobjects::function_6d8aa6a0( attackingplayer, tripwire.watcher );
    level function_d77f9442();
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0x80f724d1, Offset: 0x6c0
// Size: 0x4
function function_d863663f()
{
    
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0x90693e40, Offset: 0x6d0
// Size: 0x11e
function function_9f97e1a3( watcher )
{
    watcher.watchforfire = 1;
    watcher.ondetonatecallback = &function_9e546fb3;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.immediatedetonation = 0;
    watcher.onspawn = &on_tripwire_spawn;
    watcher.ondamage = &function_7a905654;
    watcher.ondestroyed = &function_9b3a657f;
    watcher.var_994b472b = &function_9a98f669;
    watcher.deleteonplayerspawn = 0;
    watcher.activatesound = #"hash_3185e3ad37d8b947";
    watcher.ontimeout = &function_9b3a657f;
    watcher.onfizzleout = &function_9b3a657f;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0x88095d19, Offset: 0x7f8
// Size: 0x184
function function_ec88b3b9( pos )
{
    newx = pos[ 0 ] - int( pos[ 0 ] ) >= 0.5 ? ceil( pos[ 0 ] ) : floor( pos[ 0 ] );
    newy = pos[ 1 ] - int( pos[ 1 ] ) >= 0.5 ? ceil( pos[ 1 ] ) : floor( pos[ 1 ] );
    newz = pos[ 2 ] - int( pos[ 2 ] ) >= 0.5 ? ceil( pos[ 2 ] ) : floor( pos[ 2 ] );
    pos = ( newx, newy, newz );
    return pos;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 2
// Checksum 0x25f8d01d, Offset: 0x988
// Size: 0x16a
function function_9366bdf9( tripwire, owner )
{
    if ( !isdefined( level.var_ac6052e9 ) )
    {
        return;
    }
    
    enemyplayers = owner getenemiesinradius( tripwire.origin, [[ level.var_ac6052e9 ]]( "tripwireThreatRadius", 500 ) );
    
    foreach ( enemy in enemyplayers )
    {
        if ( !isplayer( enemy ) )
        {
            continue;
        }
        
        enemyeye = enemy geteyeapprox();
        
        if ( !sighttracepassed( enemyeye, tripwire.origin, 0, enemy ) )
        {
            continue;
        }
        
        if ( isdefined( level.var_ddfd70d ) )
        {
            enemy [[ level.var_ddfd70d ]]( getweapon( "eq_tripwire" ), 0 );
            return;
        }
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 2
// Checksum 0xabb77fb8, Offset: 0xb00
// Size: 0x3ac
function on_tripwire_spawn( watcher, player )
{
    player endon( #"disconnect" );
    level endon( #"game_ended" );
    self endon( #"death" );
    weaponobjects::onspawnuseweaponobject( watcher, player );
    self.var_2d045452 = watcher;
    self.weapon = level.tripwireweapon;
    self setweapon( level.tripwireweapon );
    waitresult = self waittill( #"stationary" );
    self util::make_sentient();
    self.hitnormal = waitresult.normal;
    self.origin = function_ec88b3b9( waitresult.position );
    killcament = spawn( "script_model", self.origin + self.hitnormal * 5 );
    killcament.targetname = "gadget_tripwire_killcament";
    self.killcament = killcament;
    
    if ( isdefined( waitresult.target ) && ( isvehicle( waitresult.target ) || waitresult.target ismovingplatform() || waitresult.target.dynamicent === 1 ) )
    {
        self thread function_15566346( waitresult.target );
    }
    
    self.var_db7f2def = self gettagorigin( "tag_fx" ) + self.hitnormal * 2;
    self.owner = player;
    self.team = player.team;
    self.watcher = watcher;
    self clientfield::set( "friendlyequip", 1 );
    self.entityenemyinfluencer = self influencers::create_entity_enemy_influencer( "claymore", player.team );
    self.destroyablebytrophysystem = 0;
    self.detonating = 0;
    wait level.var_c72e8c51.var_e14f5fca;
    player notify( #"tripwire_spawn", { #tripwire:self } );
    self clientfield::set( "tripwire_state", 1 );
    arrayinsert( level.tripwires, self, level.tripwires.size );
    level function_d77f9442();
    function_9366bdf9( self, player );
    self thread function_15de8daf();
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0x7ecdf8fc, Offset: 0xeb8
// Size: 0xe2
function function_15566346( ent )
{
    self endon( #"death" );
    oldpos = ent.origin;
    
    while ( true )
    {
        if ( !isdefined( ent ) )
        {
            return;
        }
        
        curpos = ent.origin;
        
        if ( isdefined( curpos ) && distancesquared( oldpos, curpos ) )
        {
            self thread function_9e546fb3( undefined, self.weapon, undefined, undefined );
        }
        
        oldpos = curpos;
        wait float( function_60d95f53() ) / 1000;
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0x7287aa25, Offset: 0xfa8
// Size: 0x178
function function_d77f9442()
{
    foreach ( tripwire in level.tripwires )
    {
        if ( !isdefined( tripwire ) )
        {
            continue;
        }
        
        tripwire thread function_55c50f15();
    }
    
    foreach ( tripwire in level.tripwires )
    {
        if ( !isdefined( tripwire ) )
        {
            continue;
        }
        
        if ( tripwire.var_c2f0f6da )
        {
            tripwire thread function_6c66b650();
            continue;
        }
        
        if ( !isdefined( tripwire.var_886bd8dc ) )
        {
            tripwire function_b9549a9();
        }
        else
        {
            tripwire function_684adc9();
        }
        
        tripwire.var_886bd8dc clientfield::set( "tripwire_solo_beam_fx", 1 );
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0xf6cf2c1d, Offset: 0x1128
// Size: 0x84
function function_684adc9()
{
    if ( isdefined( self.owner ) )
    {
        self.var_886bd8dc setowner( self.owner );
        self.var_886bd8dc setteam( self.owner.team );
        return;
    }
    
    self.var_886bd8dc setteam( self.team );
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0x72ff36f0, Offset: 0x11b8
// Size: 0x174
function function_b9549a9()
{
    self endon( #"death" );
    angles = vectortoangles( self.hitnormal );
    pos = self gettagorigin( "tag_fx" );
    fxorg = spawn( "script_model", pos, 0, angles );
    fxorg.targetname = "gadget_tripwire_fxorg";
    fxorg.angles = angles;
    fxorg setmodel( #"tag_origin" );
    self.var_886bd8dc = fxorg;
    fxorg linkto( self );
    
    if ( !isdefined( self.activated ) )
    {
        self playsound( #"hash_58a0696fb1726978" );
        self playloopsound( #"hash_3e09d676ac6291c1", 0.25 );
        self.activated = 1;
    }
    
    self function_684adc9();
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0xc455470d, Offset: 0x1338
// Size: 0x34
function function_6c66b650()
{
    if ( isdefined( self.var_886bd8dc ) )
    {
        self.var_886bd8dc clientfield::set( "tripwire_solo_beam_fx", 0 );
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0x92369f7b, Offset: 0x1378
// Size: 0x30, Type: bool
function function_a4b3da97( trace )
{
    if ( trace[ #"fraction" ] < 1 )
    {
        return false;
    }
    
    return true;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0x283d16ee, Offset: 0x13b0
// Size: 0x28e
function function_55c50f15()
{
    self endon( #"death" );
    self.var_c2f0f6da = 0;
    self.var_5cbe5bde = [];
    
    foreach ( tripwire in level.tripwires )
    {
        if ( !isdefined( tripwire ) )
        {
            continue;
        }
        
        if ( self.owner != tripwire.owner )
        {
            continue;
        }
        
        if ( self == tripwire )
        {
            continue;
        }
        
        if ( distancesquared( tripwire.origin, self.origin ) >= 100 && distancesquared( tripwire.origin, self.origin ) <= level.var_c72e8c51.var_831055cb * level.var_c72e8c51.var_831055cb )
        {
            trace = beamtrace( tripwire.var_db7f2def, self.var_db7f2def, 0, self, 0, 0, tripwire );
            var_f2edf308 = beamtrace( self.var_db7f2def, tripwire.var_db7f2def, 0, self, 0, 0, tripwire );
            
            if ( self function_a4b3da97( trace ) && self function_a4b3da97( var_f2edf308 ) )
            {
                arrayinsert( self.var_5cbe5bde, tripwire, self.var_5cbe5bde.size );
                self.var_c2f0f6da = 1;
                
                if ( !isdefined( self.activated ) )
                {
                    self playsound( #"hash_58a0696fb1726978" );
                    self playloopsound( #"hash_3e09d676ac6291c1", 0.25 );
                    self.activated = 1;
                }
            }
        }
    }
    
    return self.var_c2f0f6da;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0xd18896eb, Offset: 0x1648
// Size: 0x5e, Type: bool
function function_55e95173( hitent )
{
    if ( sessionmodeiswarzonegame() )
    {
        return false;
    }
    
    if ( !isdefined( hitent ) )
    {
        return false;
    }
    
    if ( util::function_fbce7263( self.team, hitent.team ) )
    {
        return false;
    }
    
    return true;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 2
// Checksum 0xdf145ab8, Offset: 0x16b0
// Size: 0x250, Type: bool
function function_430b5b99( entity, tripmine )
{
    if ( sessionmodeiswarzonegame() && isdefined( self.var_c2f0f6da ) && self.var_c2f0f6da && !isdefined( entity ) )
    {
        return true;
    }
    
    if ( !isdefined( entity ) )
    {
        return false;
    }
    
    if ( !util::function_fbce7263( entity.team, tripmine.team ) )
    {
        return false;
    }
    
    if ( !isplayer( entity ) && !isvehicle( entity ) && !isai( entity ) && !entity ismovingplatform() && !( isdefined( entity.var_4f564337 ) && entity.var_4f564337 ) )
    {
        return false;
    }
    
    if ( isvehicle( entity ) )
    {
        if ( entity isremotecontrol() )
        {
            owner = entity getvehicleowner();
            
            if ( !isdefined( owner ) )
            {
                return false;
            }
        }
        else
        {
            owner = entity getseatoccupant( 0 );
        }
        
        if ( isplayer( owner ) && !util::function_fbce7263( owner.team, tripmine.team ) )
        {
            return false;
        }
    }
    
    if ( isplayer( entity ) && entity hasperk( #"specialty_nottargetedbytripwire" ) )
    {
        return false;
    }
    
    if ( isplayer( entity ) && entity isjuking() )
    {
        return false;
    }
    
    return true;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0xa38aa2d6, Offset: 0x1908
// Size: 0xb2, Type: bool
function function_5b8dea90( player )
{
    if ( !player isgrappling() )
    {
        return false;
    }
    
    if ( !util::function_fbce7263( player.team, self.team ) )
    {
        return false;
    }
    
    if ( player hasperk( #"specialty_nottargetedbytripwire" ) )
    {
        return false;
    }
    
    if ( distancesquared( player.origin, player.prev_origin ) == 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0x9e0347b7, Offset: 0x19c8
// Size: 0x22a
function function_d334c3fa( endpoint )
{
    self endon( #"death" );
    
    if ( !isdefined( self.owner ) )
    {
        return 0;
    }
    
    result = 0;
    enemyplayers = getplayers( "all", self.origin, level.var_c72e8c51.var_831055cb );
    
    foreach ( player in enemyplayers )
    {
        if ( !isdefined( player.prev_origin ) )
        {
            player.prev_origin = player.origin;
        }
        
        if ( !function_5b8dea90( player ) )
        {
            player.prev_origin = player.origin;
            continue;
        }
        
        points = math::function_f16fbd66( self.var_db7f2def, endpoint, player.origin, player.prev_origin, 1 );
        
        if ( !isdefined( points ) )
        {
            return 0;
        }
        
        mins = player getmins() + points.pointb;
        maxs = player getmaxs() + points.pointb;
        result = function_fc3f770b( mins, maxs, points.pointa );
        
        if ( result )
        {
            return result;
        }
        
        player.prev_origin = player.origin;
    }
    
    return result;
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 0
// Checksum 0xc9166d5b, Offset: 0x1c00
// Size: 0x4e6
function function_15de8daf()
{
    self endoncallback( &function_84101bb5, #"death" );
    self.var_d33355ff = [];
    
    while ( true )
    {
        if ( self.var_c2f0f6da )
        {
            foreach ( tripwire in self.var_5cbe5bde )
            {
                if ( !isdefined( tripwire ) )
                {
                    continue;
                }
                
                if ( self.var_d33355ff.size > 0 && isinarray( self.var_d33355ff, tripwire ) )
                {
                    continue;
                }
                
                if ( !self.detonating && !tripwire.detonating )
                {
                    dotrace = 1;
                    
                    if ( function_d334c3fa( tripwire.var_db7f2def ) )
                    {
                        self thread function_9e546fb3( undefined, self.weapon, undefined, tripwire );
                        dotrace = 0;
                        break;
                    }
                    
                    if ( dotrace )
                    {
                        tripwire.var_d33355ff[ tripwire.var_d33355ff.size ] = self;
                        trace = beamtrace( tripwire.var_db7f2def, self.var_db7f2def, 1, self, 0, 0, tripwire, 1 );
                        
                        if ( trace[ #"fraction" ] < 0.99 )
                        {
                            if ( function_430b5b99( trace[ #"entity" ], self ) )
                            {
                                level notify( #"tripwire_detonation", { #entity:trace[ #"entity" ] } );
                                self thread function_9e546fb3( undefined, self.weapon, undefined, tripwire, trace[ #"entity" ] );
                            }
                            
                            if ( function_55e95173( trace[ #"entity" ] ) )
                            {
                                trace = beamtrace( self.var_db7f2def, tripwire.var_db7f2def, 1, self, 0, 0, tripwire, 1 );
                                
                                if ( trace[ #"fraction" ] < 0.99 )
                                {
                                    if ( function_430b5b99( trace[ #"entity" ], self ) )
                                    {
                                        level notify( #"tripwire_detonation", { #entity:trace[ #"entity" ] } );
                                        self thread function_9e546fb3( undefined, self.weapon, undefined, tripwire, trace[ #"entity" ] );
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            self.var_d33355ff = [];
        }
        else if ( self.detonating == 0 )
        {
            endpos = self.var_db7f2def + self.hitnormal * level.var_c72e8c51.var_9e266f9b;
            dotrace = 1;
            
            if ( function_d334c3fa( endpos ) )
            {
                self thread function_9e546fb3( undefined, self.weapon, undefined, undefined );
                dotrace = 0;
                break;
            }
            
            if ( dotrace )
            {
                trace = beamtrace( self.var_db7f2def - self.hitnormal * 5, endpos, 1, self );
                
                if ( trace[ #"fraction" ] < 0.95 )
                {
                    if ( function_430b5b99( trace[ #"entity" ], self ) )
                    {
                        self thread function_9e546fb3( undefined, self.weapon, undefined, undefined );
                    }
                }
            }
        }
        
        waitframe( 2 );
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1, eflags: 0x4
// Checksum 0x828298f3, Offset: 0x20f0
// Size: 0xbc
function private function_84101bb5( notifyhash )
{
    beamfx = self.var_886bd8dc;
    killcament = self.killcament;
    self.var_886bd8dc = undefined;
    self.killcament = undefined;
    waitframe( 1 );
    
    if ( isdefined( beamfx ) )
    {
        beamfx clientfield::set( "tripwire_solo_beam_fx", 0 );
        util::wait_network_frame();
        
        if ( isdefined( beamfx ) )
        {
            beamfx delete();
        }
    }
    
    if ( isdefined( killcament ) )
    {
        killcament delete();
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 5
// Checksum 0x8c1ad763, Offset: 0x21b8
// Size: 0xa44
function function_9e546fb3( attacker, weapon, target, var_2f6adbe3, tripper )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( #"death" );
    
    if ( isdefined( attacker ) )
    {
        if ( self.owner util::isenemyplayer( attacker ) )
        {
            self.owner globallogic_score::function_5829abe3( attacker, weapon, self.weapon );
        }
        
        self radiusdamage( self.origin, 55, 10, 10, self.owner, "MOD_UNKNOWN" );
        
        if ( isdefined( level.var_d2600afc ) )
        {
            self [[ level.var_d2600afc ]]( attacker, self.owner, self.weapon, weapon );
        }
        
        self thread function_9b3a657f( weapon );
    }
    else
    {
        self playsound( #"hash_1f0de5f27d29d3aa" );
        self.detonating = 1;
        
        if ( isdefined( var_2f6adbe3 ) )
        {
            var_2f6adbe3.detonating = 1;
        }
        
        wait level.var_c72e8c51.var_7f1fc1ee;
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( isdefined( var_2f6adbe3 ) )
        {
            explosiondist = isdefined( level.var_c72e8c51.var_e44a7667 ) ? level.var_c72e8c51.var_e44a7667 : 0;
            nearradius = isdefined( level.var_c72e8c51.var_b1f240d7 ) ? level.var_c72e8c51.var_b1f240d7 : 0;
            farradius = isdefined( level.var_c72e8c51.var_d484364c ) ? level.var_c72e8c51.var_d484364c : 0;
            maxdamage = isdefined( level.var_c72e8c51.var_89d80d88 ) ? level.var_c72e8c51.var_89d80d88 : 0;
            mindamage = isdefined( level.var_c72e8c51.var_cd9b7eaf ) ? level.var_c72e8c51.var_cd9b7eaf : 0;
        }
        else
        {
            explosiondist = isdefined( level.var_c72e8c51.var_13e9ceba ) ? level.var_c72e8c51.var_13e9ceba : 0;
            nearradius = isdefined( level.var_c72e8c51.var_d0a598a5 ) ? level.var_c72e8c51.var_d0a598a5 : 0;
            farradius = isdefined( level.var_c72e8c51.var_fcb3348e ) ? level.var_c72e8c51.var_fcb3348e : 0;
            maxdamage = isdefined( level.var_c72e8c51.var_aebac5e5 ) ? level.var_c72e8c51.var_aebac5e5 : 0;
            mindamage = isdefined( level.var_c72e8c51.var_69bf01c2 ) ? level.var_c72e8c51.var_69bf01c2 : 0;
        }
        
        explosiondir = self.hitnormal;
        explosionsound = #"exp_tripwire";
        
        if ( isdefined( var_2f6adbe3 ) )
        {
            explosionsound = #"exp_tripwire";
            explosiondir = self.origin - var_2f6adbe3.origin;
            explosiondir = vectornormalize( explosiondir );
            perpvec = perpendicularvector( explosiondir );
            owner = isdefined( var_2f6adbe3.owner ) && isentity( var_2f6adbe3.owner ) ? var_2f6adbe3.owner : undefined;
            var_2f6adbe3 cylinderdamage( explosiondir * explosiondist, var_2f6adbe3.origin, nearradius, farradius, maxdamage, mindamage, owner, "MOD_EXPLOSIVE", self.weapon );
            playfx( #"hash_69455dfeef0311c2", var_2f6adbe3.origin, explosiondir, perpvec );
            playsoundatposition( explosionsound, self.origin );
            playsoundatposition( explosionsound, var_2f6adbe3.origin );
            var_2f6adbe3 ghost();
            explosiondir = var_2f6adbe3.origin - self.origin;
            explosiondir = vectornormalize( explosiondir );
        }
        
        if ( isdefined( self ) && isdefined( self.owner ) )
        {
            if ( !isdefined( explosiondir ) )
            {
                ang = self.angles;
                
                if ( isdefined( ang ) )
                {
                    explosiondir = anglestoforward( ang );
                }
                else
                {
                    explosiondir = ( 1, 0, 0 );
                }
            }
            
            perpvec = perpendicularvector( explosiondir );
            playfx( #"hash_69455dfeef0311c2", self.origin, explosiondir, perpvec );
            self playsound( explosionsound );
            
            if ( !isdefined( self.hitnormal ) )
            {
                self.hitnormal = ( 0, 0, 1 );
            }
            
            if ( isdefined( tripper ) && isvehicle( tripper ) )
            {
                if ( isdefined( var_2f6adbe3 ) )
                {
                    maxdamage *= 1.5;
                    mindamage *= 1.5;
                }
                
                self radiusdamage( self.origin + self.hitnormal * 5, explosiondist * 0.75, maxdamage, mindamage, self.owner, "MOD_EXPLOSIVE", self.weapon );
            }
            else if ( !isdefined( var_2f6adbe3 ) )
            {
                self radiusdamage( self.origin + self.hitnormal * 5, explosiondist / 2, maxdamage, mindamage, self.owner, "MOD_EXPLOSIVE", self.weapon );
            }
            else
            {
                self cylinderdamage( explosiondir * explosiondist, self.origin, nearradius, farradius, maxdamage, mindamage, self.owner, "MOD_EXPLOSIVE", self.weapon );
            }
        }
    }
    
    self ghost();
    wait 0.1;
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isdefined( var_2f6adbe3 ) )
    {
        arrayremovevalue( level.tripwires, var_2f6adbe3 );
        
        if ( isdefined( var_2f6adbe3.var_886bd8dc ) )
        {
            var_2f6adbe3.var_886bd8dc clientfield::set( "tripwire_solo_beam_fx", 0 );
            util::wait_network_frame();
            
            if ( isdefined( var_2f6adbe3 ) && isdefined( var_2f6adbe3.var_886bd8dc ) )
            {
                var_2f6adbe3.var_886bd8dc delete();
                var_2f6adbe3.var_886bd8dc = undefined;
            }
        }
        
        if ( isdefined( self.killcament ) )
        {
            self.killcament delete();
            self.killcament = undefined;
        }
        
        if ( isdefined( var_2f6adbe3 ) )
        {
            if ( isdefined( var_2f6adbe3.killcament ) )
            {
                var_2f6adbe3.killcament delete();
            }
            
            var_2f6adbe3 delete();
        }
    }
    
    self stoploopsound( 0.5 );
    arrayremovevalue( level.tripwires, self );
    
    if ( isdefined( self.var_886bd8dc ) )
    {
        self.var_886bd8dc clientfield::set( "tripwire_solo_beam_fx", 0 );
        util::wait_network_frame();
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( isdefined( self.var_886bd8dc ) )
        {
            self.var_886bd8dc delete();
            self.var_886bd8dc = undefined;
        }
    }
    
    if ( isdefined( self.killcament ) )
    {
        self.killcament delete();
        self.killcament = undefined;
    }
    
    level thread function_d77f9442();
    self delete();
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0x357da5fa, Offset: 0x2c08
// Size: 0x24
function function_9a98f669( player )
{
    self function_9b3a657f( undefined );
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0x779e77c, Offset: 0x2c38
// Size: 0x22c
function function_9b3a657f( weapon )
{
    self clientfield::set( "friendlyequip", 1 );
    playfx( #"hash_65c5042becfbaa7d", self.origin );
    
    if ( isdefined( level.var_c72e8c51.var_bb6c29b4 ) && isdefined( weapon ) && weapon == getweapon( #"shock_rifle" ) )
    {
        playfx( level.var_c72e8c51.var_bb6c29b4, self.origin );
    }
    
    playsoundatposition( #"hash_5a530df2bd2b027c", self.origin );
    self stoploopsound( 0.5 );
    arrayremovevalue( level.tripwires, self );
    var_886bd8dc = self.var_886bd8dc;
    killcament = self.killcament;
    
    if ( isdefined( var_886bd8dc ) )
    {
        var_886bd8dc clientfield::set( "tripwire_solo_beam_fx", 0 );
        util::wait_network_frame();
        
        if ( isdefined( var_886bd8dc ) )
        {
            var_886bd8dc delete();
            
            if ( isdefined( self ) )
            {
                self.var_886bd8dc = undefined;
            }
        }
    }
    
    if ( isdefined( killcament ) )
    {
        killcament delete();
        
        if ( isdefined( self ) )
        {
            self.killcament = undefined;
        }
    }
    
    level thread function_d77f9442();
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace gadget_tripwire/gadget_tripwire
// Params 1
// Checksum 0xaff43b68, Offset: 0x2e70
// Size: 0x362
function function_7a905654( watcher )
{
    self endon( #"death" );
    self setcandamage( 1 );
    damagemax = 20;
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    self.damagetaken = 0;
    attacker = undefined;
    
    while ( true )
    {
        waitresult = self waittill( #"damage" );
        attacker = waitresult.attacker;
        weapon = waitresult.weapon;
        damage = waitresult.amount;
        type = waitresult.mod;
        idflags = waitresult.flags;
        
        if ( weapon == getweapon( "eq_tripwire" ) )
        {
            continue;
        }
        
        damage = weapons::function_74bbb3fa( damage, weapon, self.weapon );
        attacker = self [[ level.figure_out_attacker ]]( waitresult.attacker );
        
        if ( !isdefined( self.owner ) )
        {
            continue;
        }
        
        if ( level.teambased && isplayer( attacker ) )
        {
            if ( !( isdefined( level.hardcoremode ) && level.hardcoremode ) && !util::function_fbce7263( self.owner.team, attacker.pers[ #"team" ] ) && self.owner !== attacker )
            {
                continue;
            }
        }
        
        if ( watcher.stuntime > 0 && weapon.dostun )
        {
            self thread weaponobjects::stunstart( watcher, watcher.stuntime );
        }
        
        if ( damage::friendlyfirecheck( self.owner, attacker ) )
        {
            if ( damagefeedback::dodamagefeedback( weapon, attacker ) )
            {
                attacker damagefeedback::update();
            }
        }
        
        if ( type == "MOD_MELEE" || weapon.isemp || weapon.destroysequipment )
        {
            self.damagetaken = damagemax;
        }
        else
        {
            self.damagetaken += damage;
        }
        
        if ( self.damagetaken >= damagemax )
        {
            watcher thread weaponobjects::waitanddetonate( self, 0.05, attacker, weapon );
            return;
        }
    }
}

