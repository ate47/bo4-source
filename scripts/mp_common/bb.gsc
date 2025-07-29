#using scripts\core_common\bb_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;

#namespace bb;

// Namespace bb/bb
// Params 0, eflags: 0x2
// Checksum 0xb7f399c1, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"bb", &__init__, undefined, undefined );
}

// Namespace bb/bb
// Params 0
// Checksum 0x66495e8c, Offset: 0xf0
// Size: 0x34
function __init__()
{
    init_shared();
    callback::on_spawned( &on_player_spawned );
}

// Namespace bb/bb
// Params 0
// Checksum 0x843731dd, Offset: 0x130
// Size: 0xa4
function on_player_spawned()
{
    self._bbdata = [];
    self._bbdata[ #"score" ] = 0;
    self._bbdata[ #"momentum" ] = 0;
    self._bbdata[ #"spawntime" ] = gettime();
    self._bbdata[ #"shots" ] = 0;
    self._bbdata[ #"hits" ] = 0;
    callback::on_death( &on_player_death );
}

// Namespace bb/bb
// Params 1
// Checksum 0x127471fa, Offset: 0x1e0
// Size: 0x2cc
function function_bf5cad4e( gamemodedata )
{
    matchtime = ( isdefined( level.var_8a3a9ca4.roundend ) ? level.var_8a3a9ca4.roundend : 0 ) - ( isdefined( level.var_8a3a9ca4.roundstart ) ? level.var_8a3a9ca4.roundstart : 0 );
    firstblood = ( isdefined( level.var_8a3a9ca4.firstblood ) ? level.var_8a3a9ca4.firstblood : 0 ) - ( isdefined( level.var_8a3a9ca4.roundstart ) ? level.var_8a3a9ca4.roundstart : 0 );
    alliesscore = isdefined( [[ level._getteamscore ]]( #"allies" ) ) ? [[ level._getteamscore ]]( #"allies" ) : 0;
    axisscore = isdefined( [[ level._getteamscore ]]( #"axis" ) ) ? [[ level._getteamscore ]]( #"axis" ) : 0;
    var_5e25b17b = abs( alliesscore - axisscore );
    gamemodedata = {};
    gamemodedata.gamemode = level.gametype;
    gamemodedata.wintype = isdefined( gamemodedata.wintype ) ? gamemodedata.wintype : "NA";
    gamemodedata.matchtime = matchtime;
    gamemodedata.firstblood = firstblood;
    gamemodedata.var_5e25b17b = var_5e25b17b;
    gamemodedata.timeremaining = isdefined( gamemodedata.remainingtime ) ? gamemodedata.remainingtime : 0;
    gamemodedata.var_20de6a02 = isdefined( gamemodedata.var_20de6a02 ) ? gamemodedata.var_20de6a02 : 0;
    gamemodedata.var_be1de2ab = isdefined( gamemodedata.var_be1de2ab ) ? gamemodedata.var_be1de2ab : 0;
    function_92d1707f( #"hash_1a63efe7c6121b24", gamemodedata );
}

// Namespace bb/bb
// Params 5
// Checksum 0x51934d89, Offset: 0x4b8
// Size: 0x18c
function function_95a5b5c2( obj_type, label, team, origin, player )
{
    if ( sessionmodeismultiplayergame() )
    {
        var_cfad67d4 = ishash( team ) ? team : hash( team );
        clientid = isdefined( player ) && isdefined( player.clientid ) ? player.clientid : -1;
        function_92d1707f( #"hash_d424efe4db1dff7", { #gametime:function_f8d53445(), #objtype:obj_type, #label:label, #team:var_cfad67d4, #playerx:origin[ 0 ], #playery:origin[ 1 ], #playerz:origin[ 2 ], #clientid:clientid } );
    }
}

// Namespace bb/bb
// Params 14
// Checksum 0xdba94d71, Offset: 0x650
// Size: 0x24c
function function_c3b9e07f( eattacker, attackerorigin, attackerspecialist, attackerweapon, evictim, victimorigin, victimspecialist, victimweapon, idamage, smeansofdeath, shitloc, death, isusingheropower, killstreak )
{
    if ( !sessionmodeismultiplayergame() )
    {
        return;
    }
    
    mpattacks = {};
    mpattacks.gametime = function_f8d53445();
    
    if ( isdefined( eattacker ) )
    {
        mpattacks.attackerspawnid = getplayerspawnid( eattacker );
    }
    
    if ( isdefined( attackerorigin ) )
    {
        mpattacks.attackerx = attackerorigin[ 0 ];
        mpattacks.attackery = attackerorigin[ 1 ];
        mpattacks.attackerz = attackerorigin[ 2 ];
    }
    
    mpattacks.attackerspecialist = attackerspecialist;
    mpattacks.attackerweapon = attackerweapon;
    
    if ( isdefined( evictim ) )
    {
        mpattacks.victimspawnid = getplayerspawnid( evictim );
    }
    
    if ( isdefined( victimorigin ) )
    {
        mpattacks.victimx = victimorigin[ 0 ];
        mpattacks.victimy = victimorigin[ 1 ];
        mpattacks.victimz = victimorigin[ 2 ];
    }
    
    mpattacks.victimspecialist = victimspecialist;
    mpattacks.victimweapon = victimweapon;
    mpattacks.damage = idamage;
    mpattacks.damagetype = smeansofdeath;
    mpattacks.damagelocation = shitloc;
    mpattacks.death = death;
    mpattacks.isusingheropower = isusingheropower;
    mpattacks.killstreak = killstreak;
    function_92d1707f( #"hash_67e3a427b7ec1819", mpattacks );
}

// Namespace bb/bb
// Params 1
// Checksum 0x25490e69, Offset: 0x8a8
// Size: 0x54
function on_player_death( params )
{
    if ( isbot( self ) )
    {
        return;
    }
    
    if ( game.state == "playing" )
    {
        self commit_spawn_data();
    }
}

// Namespace bb/bb
// Params 0
// Checksum 0xaecf71e2, Offset: 0x908
// Size: 0x71c
function function_6661621a()
{
    if ( isbot( self ) )
    {
        return;
    }
    
    assert( isdefined( self._bbdata ) );
    
    if ( !isdefined( self.class_num ) )
    {
        return;
    }
    
    if ( !sessionmodeismultiplayergame() )
    {
        return;
    }
    
    mploadout = spawnstruct();
    mploadout.gametime = function_f8d53445();
    mploadout.spawnid = getplayerspawnid( self );
    primaryweapon = self getloadoutweapon( self.class_num, "primary" );
    mploadout.primary = primaryweapon.name;
    primaryattachments = function_285f8efd( primaryweapon );
    mploadout.primaryattachment1 = primaryattachments.attachment0;
    mploadout.primaryattachment2 = primaryattachments.attachment1;
    mploadout.primaryattachment3 = primaryattachments.attachment2;
    mploadout.primaryattachment4 = primaryattachments.attachment3;
    mploadout.primaryattachment5 = primaryattachments.attachment4;
    mploadout.primaryreticle = hash( self getweaponoptic( primaryweapon ) );
    mploadout.var_b3cb3732 = self function_9b237966( self.class_num, 1 );
    mploadout.var_5f2a5b01 = self function_73182cb6( self.class_num, 1 );
    secondaryweapon = self getloadoutweapon( self.class_num, "secondary" );
    mploadout.secondary = secondaryweapon.name;
    secondaryattachments = function_285f8efd( secondaryweapon );
    mploadout.secondaryattachment1 = secondaryattachments.attachment0;
    mploadout.secondaryattachment2 = secondaryattachments.attachment1;
    mploadout.secondaryattachment3 = secondaryattachments.attachment2;
    mploadout.secondaryattachment4 = secondaryattachments.attachment3;
    mploadout.secondaryattachment5 = secondaryattachments.attachment4;
    mploadout.secondaryreticle = hash( self getweaponoptic( secondaryweapon ) );
    mploadout.var_37fdd840 = self function_9b237966( self.class_num, 0 );
    mploadout.var_f27f3a24 = self function_73182cb6( self.class_num, 0 );
    mploadout.tacticalgear = self function_d78e0e04( self.class_num );
    mploadout.killstreak1 = self.killstreak.size < 0 ? 0 : hash( self.killstreak[ 0 ] );
    mploadout.killstreak2 = self.killstreak.size < 1 ? 0 : hash( self.killstreak[ 1 ] );
    mploadout.killstreak3 = self.killstreak.size < 2 ? 0 : hash( self.killstreak[ 2 ] );
    talents = self function_4a9f1384( self.class_num );
    mploadout.var_942f949 = talents.size < 0 ? 0 : talents[ 0 ];
    mploadout.talent1 = talents.size < 1 ? 0 : talents[ 1 ];
    mploadout.talent2 = talents.size < 2 ? 0 : talents[ 2 ];
    mploadout.talent3 = talents.size < 3 ? 0 : talents[ 3 ];
    mploadout.talent4 = talents.size < 4 ? 0 : talents[ 4 ];
    mploadout.talent5 = talents.size < 5 ? 0 : talents[ 5 ];
    wildcards = self function_6f2c0492( self.class_num );
    mploadout.wildcard0 = wildcards.size < 0 ? 0 : wildcards[ 0 ];
    mploadout.wildcard1 = wildcards.size < 1 ? 0 : wildcards[ 1 ];
    mploadout.var_13573300 = wildcards.size < 2 ? 0 : wildcards[ 2 ];
    
    if ( isdefined( self.playerrole ) && isdefined( self.playerrole.var_c21d61e9 ) )
    {
        var_c0f05cbb = getweapon( isdefined( self.playerrole.var_c21d61e9 ) ? self.playerrole.var_c21d61e9 : level.weaponnone );
    }
    else
    {
        var_c0f05cbb = level.weaponnone;
    }
    
    mploadout.var_9911e1f2 = var_c0f05cbb.name;
    mploadout.specialistindex = isdefined( self getspecialistindex() ) ? self getspecialistindex() : -1;
    function_92d1707f( #"hash_30b542620e21966d", #"mploadouts", mploadout );
}

// Namespace bb/bb
// Params 0
// Checksum 0xab1d5a32, Offset: 0x1030
// Size: 0x1dc
function commit_spawn_data()
{
    if ( isbot( self ) )
    {
        return;
    }
    
    assert( isdefined( self._bbdata ) );
    
    if ( !isdefined( self._bbdata ) )
    {
        return;
    }
    
    if ( !sessionmodeismultiplayergame() )
    {
        return;
    }
    
    specialistindex = isdefined( self getspecialistindex() ) ? self getspecialistindex() : -1;
    mpplayerlives = { #gametime:function_f8d53445(), #spawnid:getplayerspawnid( self ), #lifescore:self._bbdata[ #"score" ], #lifemomentum:self._bbdata[ #"momentum" ], #lifetime:gettime() - self._bbdata[ #"spawntime" ], #name:self.name, #specialist:specialistindex };
    function_92d1707f( #"hash_6fc210ad5f081ce8", mpplayerlives );
    self function_6661621a();
}

// Namespace bb/bb
// Params 1
// Checksum 0x9143ab7c, Offset: 0x1218
// Size: 0x2b2
function function_285f8efd( weapon )
{
    var_e38a0464 = spawnstruct();
    var_e38a0464.attachment0 = 0;
    var_e38a0464.attachment1 = 0;
    var_e38a0464.attachment2 = 0;
    var_e38a0464.attachment3 = 0;
    var_e38a0464.attachment4 = 0;
    var_e38a0464.attachment5 = 0;
    var_e38a0464.attachment6 = 0;
    
    if ( !isdefined( weapon ) || weapon.attachments.size == 0 )
    {
        return var_e38a0464;
    }
    
    var_e38a0464.attachment0 = hash( weapon.attachments[ 0 ] );
    
    if ( weapon.attachments.size == 1 )
    {
        return var_e38a0464;
    }
    
    var_e38a0464.attachment1 = hash( weapon.attachments[ 1 ] );
    
    if ( weapon.attachments.size == 2 )
    {
        return var_e38a0464;
    }
    
    var_e38a0464.attachment2 = hash( weapon.attachments[ 2 ] );
    
    if ( weapon.attachments.size == 3 )
    {
        return var_e38a0464;
    }
    
    var_e38a0464.attachment3 = hash( weapon.attachments[ 3 ] );
    
    if ( weapon.attachments.size == 4 )
    {
        return var_e38a0464;
    }
    
    var_e38a0464.attachment4 = hash( weapon.attachments[ 4 ] );
    
    if ( weapon.attachments.size == 5 )
    {
        return var_e38a0464;
    }
    
    var_e38a0464.attachment5 = hash( weapon.attachments[ 5 ] );
    
    if ( weapon.attachments.size == 6 )
    {
        return var_e38a0464;
    }
    
    var_e38a0464.attachment6 = hash( weapon.attachments[ 6 ] );
    return var_e38a0464;
}

