#using scripts\core_common\clientfield_shared;

#namespace archetype_human;

// Namespace archetype_human/archetype_human
// Params 0, eflags: 0x2
// Checksum 0x80f724d1, Offset: 0x90
// Size: 0x4
function autoexec precache()
{
    
}

// Namespace archetype_human/archetype_human
// Params 0, eflags: 0x2
// Checksum 0xa3a30b1f, Offset: 0xa0
// Size: 0x4c
function autoexec main()
{
    clientfield::register( "actor", "facial_dial", 1, 1, "int", &humanclientutils::facialdialoguehandler, 0, 1 );
}

#namespace humanclientutils;

// Namespace humanclientutils/archetype_human
// Params 7
// Checksum 0xa6b5609a, Offset: 0xf8
// Size: 0x94
function facialdialoguehandler( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue )
    {
        self.facialdialogueactive = 1;
        return;
    }
    
    if ( isdefined( self.facialdialogueactive ) && self.facialdialogueactive )
    {
        self clearanim( #"faces", 0 );
    }
}

