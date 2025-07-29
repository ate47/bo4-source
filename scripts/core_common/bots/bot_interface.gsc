#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\bots\bot;

#namespace botinterface;

// Namespace botinterface/bot_interface
// Params 0
// Checksum 0x66209cc, Offset: 0x98
// Size: 0x2ec
function registerbotinterfaceattributes()
{
    ai::registermatchedinterface( #"bot", #"control", "commander", array( "commander", "autonomous" ), &bot::function_b5dd2fd2 );
    ai::registermatchedinterface( #"bot", #"sprint", 0, array( 1, 0 ), undefined );
    ai::registermatchedinterface( #"bot", #"revive", 1, array( 1, 0 ), undefined );
    ai::registermatchedinterface( #"bot", #"slide", 1, array( 1, 0 ), undefined );
    ai::registermatchedinterface( #"bot", #"ignorepathenemyfightdist", 0, array( 1, 0 ), undefined );
    ai::registermatchedinterface( #"bot", #"allowprimaryoffhand", 1, array( 1, 0 ), undefined );
    ai::registermatchedinterface( #"bot", #"allowsecondaryoffhand", 1, array( 1, 0 ), undefined );
    ai::registermatchedinterface( #"bot", #"allowspecialoffhand", 1, array( 1, 0 ), undefined );
    ai::registermatchedinterface( #"bot", #"allowscorestreak", 1, array( 1, 0 ), undefined );
}

