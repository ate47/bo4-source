#using scripts\core_common\ai\systems\ai_interface;
#using scripts\zm\ai\zm_ai_gladiator;

#namespace zm_ai_gladiator_interface;

// Namespace zm_ai_gladiator_interface/zm_ai_gladiator_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x8e01950c, Offset: 0x78
// Size: 0xd4
function registergladiatorinterfaceattributes() {
    ai::registermatchedinterface(#"gladiator", #"run", 0, array(1, 0));
    ai::registermatchedinterface(#"gladiator", #"axe_throw", 1, array(1, 0));
    ai::registernumericinterface(#"gladiator", #"damage_multiplier", 1, 0, 100);
}

