#using scripts\core_common\ai\archetype_human_rpg_interface;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai_shared;
#using scripts\core_common\spawner_shared;

#namespace archetype_human_rpg;

// Namespace archetype_human_rpg/archetype_human_rpg
// Params 0, eflags: 0x2
// Checksum 0x48767c17, Offset: 0x98
// Size: 0x84
function autoexec main()
{
    spawner::add_archetype_spawn_function( #"human_rpg", &humanrpgbehavior::archetypehumanrpgblackboardinit );
    spawner::add_archetype_spawn_function( #"human", &humanrpgbehavior::function_daf99f58 );
    humanrpgbehavior::registerbehaviorscriptfunctions();
    humanrpginterface::registerhumanrpginterfaceattributes();
}

#namespace humanrpgbehavior;

// Namespace humanrpgbehavior/archetype_human_rpg
// Params 0
// Checksum 0x80f724d1, Offset: 0x128
// Size: 0x4
function registerbehaviorscriptfunctions()
{
    
}

// Namespace humanrpgbehavior/archetype_human_rpg
// Params 0, eflags: 0x4
// Checksum 0xe6d4962a, Offset: 0x138
// Size: 0x6c
function private archetypehumanrpgblackboardinit()
{
    entity = self;
    blackboard::createblackboardforentity( entity );
    ai::createinterfaceforentity( entity );
    self.___archetypeonanimscriptedcallback = &archetypehumanrpgonanimscriptedcallback;
    entity asmchangeanimmappingtable( 1 );
}

// Namespace humanrpgbehavior/archetype_human_rpg
// Params 1, eflags: 0x4
// Checksum 0x4633ee61, Offset: 0x1b0
// Size: 0x2c
function private archetypehumanrpgonanimscriptedcallback( entity )
{
    entity.__blackboard = undefined;
    entity archetypehumanrpgblackboardinit();
}

// Namespace humanrpgbehavior/archetype_human_rpg
// Params 0, eflags: 0x4
// Checksum 0x5ab0dc9e, Offset: 0x1e8
// Size: 0x94
function private function_daf99f58()
{
    if ( self.subarchetype === #"human_rpg" )
    {
        self.var_b3aacd00 = getweapon( #"hash_3b5610f58856b4ea" );
        self.var_2fcec084 = getweapon( #"hash_1d8ec79043d16eb" );
        self.var_b999a026 = 0;
        self thread function_567e5a33();
    }
}

// Namespace humanrpgbehavior/archetype_human_rpg
// Params 0, eflags: 0x4
// Checksum 0xf8bb3f77, Offset: 0x288
// Size: 0x218
function private function_567e5a33()
{
    self endon( #"death" );
    self ai::gun_remove();
    self ai::gun_switchto( self.var_b3aacd00, "right" );
    
    while ( self.weapon !== self.var_b3aacd00 )
    {
        waitframe( 1 );
    }
    
    while ( isalive( self ) )
    {
        var_70a33a38 = self ai::function_63734291( self.enemy );
        
        if ( isdefined( var_70a33a38 ) && var_70a33a38 && !( isdefined( self.var_b999a026 ) && self.var_b999a026 ) )
        {
            self ai::gun_remove();
            self ai::gun_switchto( self.var_2fcec084, "right" );
            
            while ( self.weapon !== self.var_2fcec084 )
            {
                waitframe( 1 );
            }
            
            self.var_b999a026 = 1;
            self waittill( #"weapon_fired", #"enemy", #"missile_fire" );
        }
        
        if ( !( isdefined( var_70a33a38 ) && var_70a33a38 ) && isdefined( self.var_b999a026 ) && self.var_b999a026 )
        {
            self ai::gun_remove();
            self ai::gun_switchto( self.var_b3aacd00, "right" );
            
            while ( self.weapon !== self.var_b3aacd00 )
            {
                waitframe( 1 );
            }
            
            self.var_b999a026 = 0;
        }
        
        waitframe( 1 );
    }
}

