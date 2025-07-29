#using scripts\core_common\ai\archetype_nova_crawler_interface;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\spawner_shared;

#namespace archetypenovacrawler;

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 0, eflags: 0x2
// Checksum 0x31908c24, Offset: 0x88
// Size: 0x54
function autoexec init()
{
    novacrawlerinterface::registernovacrawlerinterfaceattributes();
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function( #"nova_crawler", &function_ea4610a7 );
}

/#

    // Namespace archetypenovacrawler/archetype_nova_crawler
    // Params 0, eflags: 0x4
    // Checksum 0xedab19b3, Offset: 0xe8
    // Size: 0x24, Type: dev
    function private function_32107b12()
    {
        assert( isdefined( self.ai ) );
    }

#/

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 0, eflags: 0x4
// Checksum 0x28b8c8ec, Offset: 0x118
// Size: 0x62
function private function_ea4610a7()
{
    blackboard::createblackboardforentity( self );
    ai::createinterfaceforentity( self );
    self.___archetypeonanimscriptedcallback = &function_80f18700;
    self.___archetypeonbehavecallback = &function_b11c2bcd;
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0xc0325b70, Offset: 0x188
// Size: 0xc
function private function_b11c2bcd( entity )
{
    
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0x559853c3, Offset: 0x1a0
// Size: 0x2c
function private function_80f18700( entity )
{
    self.__blackboard = undefined;
    self function_ea4610a7();
}

// Namespace archetypenovacrawler/archetype_nova_crawler
// Params 0, eflags: 0x4
// Checksum 0x80f724d1, Offset: 0x1d8
// Size: 0x4
function private registerbehaviorscriptfunctions()
{
    
}

/#

    // Namespace archetypenovacrawler/archetype_nova_crawler
    // Params 1, eflags: 0x4
    // Checksum 0xdb541c6a, Offset: 0x1e8
    // Size: 0x54, Type: dev
    function private function_3d50e4d0( message )
    {
        if ( getdvarint( #"hash_35bebcc5f50d2641", 0 ) )
        {
            println( "<dev string:x38>" + message );
        }
    }

#/
