#namespace gun;

// Namespace gun/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x897fd68b, Offset: 0x68
// Size: 0x6c
function event_handler[gametype_init] main( eventstruct )
{
    level.isgungame = 1;
    setdvar( #"hash_137c8b2b96ac6c72", 0.2 );
    setdvar( #"compassradarpingfadetime", 0.75 );
}

