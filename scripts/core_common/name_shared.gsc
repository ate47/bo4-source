#using scripts\core_common\util_shared;

#namespace name;

// Namespace name/name_shared
// Params 0, eflags: 0x0
// Checksum 0x7155caba, Offset: 0x5d0
// Size: 0x7c
function setup() {
    assert(!isdefined(level.names));
    level.names = [];
    level.namesindex = [];
    if (!isdefined(level.script)) {
        level.script = util::get_map_name();
    }
    initialize_nationality("american");
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0x5b079f80, Offset: 0x658
// Size: 0x8a
function initialize_nationality(str_nationality) {
    if (!isdefined(level.names[str_nationality])) {
        level.names[str_nationality] = [];
        if (str_nationality != "civilian") {
            add_nationality_names(str_nationality);
        }
        randomize_name_list(str_nationality);
        level.nameindex[str_nationality] = 0;
    }
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0x40550f6e, Offset: 0x6f0
// Size: 0x82
function add_nationality_names(str_nationality) {
    switch (str_nationality) {
    case #"american":
        american_names();
        break;
    default:
        assertmsg("<dev string:x38>" + str_nationality);
        break;
    }
}

// Namespace name/name_shared
// Params 0, eflags: 0x0
// Checksum 0x5574083b, Offset: 0x780
// Size: 0xc84
function american_names() {
    add_name("american", "Adams");
    add_name("american", "Alexander");
    add_name("american", "Allen");
    add_name("american", "Anderson");
    add_name("american", "Bailey");
    add_name("american", "Baker");
    add_name("american", "Barnes");
    add_name("american", "Bell");
    add_name("american", "Bennett");
    add_name("american", "Brooks");
    add_name("american", "Brown");
    add_name("american", "Bryant");
    add_name("american", "Butler");
    add_name("american", "Campbell");
    add_name("american", "Carter");
    add_name("american", "Clark");
    add_name("american", "Coleman");
    add_name("american", "Collins");
    add_name("american", "Cook");
    add_name("american", "Cooper");
    add_name("american", "Cox");
    add_name("american", "Davis");
    add_name("american", "Diaz");
    add_name("american", "Edwards");
    add_name("american", "Evans");
    add_name("american", "Flores");
    add_name("american", "Foster");
    add_name("american", "Garcia");
    add_name("american", "Gonzales");
    add_name("american", "Gonzalez");
    add_name("american", "Gray");
    add_name("american", "Green");
    add_name("american", "Griffin");
    add_name("american", "Hall");
    add_name("american", "Harris");
    add_name("american", "Hayes");
    add_name("american", "Henderson");
    add_name("american", "Hernandez");
    add_name("american", "Hill");
    add_name("american", "Howard");
    add_name("american", "Hughes");
    add_name("american", "Jackson");
    add_name("american", "James");
    add_name("american", "Jenkins");
    add_name("american", "Johnson");
    add_name("american", "Jones");
    add_name("american", "Kelly");
    add_name("american", "King");
    add_name("american", "Lee");
    add_name("american", "Lewis");
    add_name("american", "Long");
    add_name("american", "Lopez");
    add_name("american", "Martin");
    add_name("american", "Martinez");
    add_name("american", "Miller");
    add_name("american", "Mitchell");
    add_name("american", "Moore");
    add_name("american", "Morgan");
    add_name("american", "Morris");
    add_name("american", "Murphy");
    add_name("american", "Nelson");
    add_name("american", "Parker");
    add_name("american", "Patterson");
    add_name("american", "Perez");
    add_name("american", "Perry");
    add_name("american", "Peterson");
    add_name("american", "Phillips");
    add_name("american", "Powell");
    add_name("american", "Price");
    add_name("american", "Ramirez");
    add_name("american", "Reed");
    add_name("american", "Richardson");
    add_name("american", "Rivera");
    add_name("american", "Roberts");
    add_name("american", "Robinson");
    add_name("american", "Rodriguez");
    add_name("american", "Rogers");
    add_name("american", "Ross");
    add_name("american", "Russell");
    add_name("american", "Sanchez");
    add_name("american", "Sanders");
    add_name("american", "Scott");
    add_name("american", "Simmons");
    add_name("american", "Smith");
    add_name("american", "Stewart");
    add_name("american", "Taylor");
    add_name("american", "Thomas");
    add_name("american", "Thompson");
    add_name("american", "Torres");
    add_name("american", "Turner");
    add_name("american", "Walker");
    add_name("american", "Ward");
    add_name("american", "Washington");
    add_name("american", "Watson");
    add_name("american", "White");
    add_name("american", "Williams");
    add_name("american", "Wilson");
    add_name("american", "Wood");
    add_name("american", "Wright");
    add_name("american", "Young");
}

// Namespace name/name_shared
// Params 2, eflags: 0x0
// Checksum 0x1bfe7482, Offset: 0x1410
// Size: 0x40
function add_name(nationality, thename) {
    level.names[nationality][level.names[nationality].size] = thename;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0xc527f55, Offset: 0x1458
// Size: 0xda
function randomize_name_list(nationality) {
    size = level.names[nationality].size;
    for (i = 0; i < size; i++) {
        switchwith = randomint(size);
        temp = level.names[nationality][i];
        level.names[nationality][i] = level.names[nationality][switchwith];
        level.names[nationality][switchwith] = temp;
    }
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0xed9a1a37, Offset: 0x1540
// Size: 0x336
function get(override) {
    if (!isdefined(override) && level.script == "credits") {
        self.airank = "private";
        self notify(#"set name and rank");
        return;
    }
    if (isdefined(self.script_friendname)) {
        if (self.script_friendname == "none") {
            self.propername = "";
        } else {
            self.propername = self.script_friendname;
            getrankfromname(self.propername);
        }
        self notify(#"set name and rank");
        return;
    }
    assert(isdefined(level.names));
    str_classname = self get_ai_classname();
    str_nationality = "american";
    if (issubstr(str_classname, "_civilian_")) {
        self.airank = "none";
        str_nationality = "civilian";
    } else if (self is_special_agent_member(str_classname)) {
        str_nationality = "agent";
    } else if (issubstr(str_classname, "_sco_")) {
        self.airank = "none";
        str_nationality = "chinese";
    } else if (issubstr(str_classname, "_egypt_")) {
        str_nationality = "egyptian";
    } else if (self is_police_member(str_classname)) {
        str_nationality = "police";
    } else if (self is_seal_member(str_classname)) {
        str_nationality = "seal";
    } else if (self is_navy_member(str_classname)) {
        str_nationality = "navy";
    } else if (self is_security_member(str_classname)) {
        str_nationality = "security";
    } else if (issubstr(str_classname, "_soviet_")) {
        self.airank = "none";
        str_nationality = "russian";
    } else if (issubstr(str_classname, "_ally_sing_")) {
        str_nationality = "singapore_police";
    }
    initialize_nationality(str_nationality);
    get_name_for_nationality(str_nationality);
    self notify(#"set name and rank");
}

// Namespace name/name_shared
// Params 0, eflags: 0x0
// Checksum 0x6c5d8b7d, Offset: 0x1880
// Size: 0x5a
function get_ai_classname() {
    if (isdefined(self.dr_ai_classname)) {
        str_classname = tolower(self.dr_ai_classname);
    } else {
        str_classname = tolower(self.classname);
    }
    return str_classname;
}

// Namespace name/name_shared
// Params 2, eflags: 0x0
// Checksum 0x598b6235, Offset: 0x18e8
// Size: 0x7a
function add_override_name_func(nationality, func) {
    if (!isdefined(level._override_name_funcs)) {
        level._override_name_funcs = [];
    }
    assert(!isdefined(level._override_name_funcs[nationality]), "<dev string:x58>");
    level._override_name_funcs[nationality] = func;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0x4ef5214b, Offset: 0x1970
// Size: 0x41a
function get_name_for_nationality(nationality) {
    assert(isdefined(level.nameindex[nationality]), nationality);
    if (isdefined(level._override_name_funcs) && isdefined(level._override_name_funcs[nationality])) {
        self.propername = [[ level._override_name_funcs[nationality] ]]();
        self.airank = "";
        return;
    }
    if (nationality == "civilian") {
        self.propername = "";
        return;
    }
    level.nameindex[nationality] = (level.nameindex[nationality] + 1) % level.names[nationality].size;
    lastname = level.names[nationality][level.nameindex[nationality]];
    if (!isdefined(lastname)) {
        lastname = "";
    }
    if (isdefined(level._override_rank_func)) {
        self [[ level._override_rank_func ]](lastname);
        return;
    }
    if (isdefined(self.airank) && self.airank == "none") {
        self.propername = lastname;
        return;
    }
    rank = randomint(100);
    if (nationality == "seal") {
        if (rank > 20) {
            fullname = "PO " + lastname;
            self.airank = "petty officer";
        } else if (rank > 10) {
            fullname = "CPO " + lastname;
            self.airank = "chief petty officer";
        } else {
            fullname = "Lt. " + lastname;
            self.airank = "lieutenant";
        }
    } else if (nationality == "navy") {
        if (rank > 60) {
            fullname = "SN " + lastname;
            self.airank = "seaman";
        } else if (rank > 20) {
            fullname = "PO " + lastname;
            self.airank = "petty officer";
        } else {
            fullname = "CPO " + lastname;
            self.airank = "chief petty officer";
        }
    } else if (nationality == "police") {
        fullname = "Officer " + lastname;
        self.airank = "police officer";
    } else if (nationality == "agent") {
        fullname = "Agent " + lastname;
        self.airank = "special agent";
    } else if (nationality == "security") {
        fullname = "Officer " + lastname;
    } else if (nationality == "singapore_police") {
        fullname = "Officer " + lastname;
        self.airank = "police officer";
    } else if (rank > 20) {
        fullname = "Pvt. " + lastname;
        self.airank = "private";
    } else if (rank > 10) {
        fullname = "Cpl. " + lastname;
        self.airank = "corporal";
    } else {
        fullname = "Sgt. " + lastname;
        self.airank = "sergeant";
    }
    self.propername = fullname;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0xa0fe90b1, Offset: 0x1d98
// Size: 0x3c
function is_seal_member(str_classname) {
    if (issubstr(str_classname, "_seal_")) {
        return 1;
    }
    return 0;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0x6dda507f, Offset: 0x1de0
// Size: 0x3c
function is_navy_member(str_classname) {
    if (issubstr(str_classname, "_navy_")) {
        return 1;
    }
    return 0;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0xdfed4c51, Offset: 0x1e28
// Size: 0x5e
function is_police_member(str_classname) {
    if (issubstr(str_classname, "_lapd_") || issubstr(str_classname, "_swat_")) {
        return 1;
    }
    return 0;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0x24fbfa23, Offset: 0x1e90
// Size: 0x36
function is_security_member(str_classname) {
    if (issubstr(str_classname, "_security_")) {
        return true;
    }
    return false;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0x333f70a2, Offset: 0x1ed0
// Size: 0x3c
function is_special_agent_member(str_classname) {
    if (issubstr(str_classname, "_sstactical_")) {
        return 1;
    }
    return 0;
}

// Namespace name/name_shared
// Params 1, eflags: 0x0
// Checksum 0x810092ee, Offset: 0x1f18
// Size: 0x1b2
function getrankfromname(name) {
    if (!isdefined(name)) {
        self.airank = "private";
    }
    tokens = strtok(name, " ");
    assert(tokens.size);
    shortrank = tokens[0];
    switch (shortrank) {
    case #"hash_61c7340e20b9c509":
        self.airank = "private";
        break;
    case #"hash_5827a20dd30caea2":
        self.airank = "private";
        break;
    case #"hash_2116fd90943206f0":
        self.airank = "corporal";
        break;
    case #"hash_1b74eb18c9f1846d":
        self.airank = "sergeant";
        break;
    case #"hash_12acac191dfe13b9":
        self.airank = "lieutenant";
        break;
    case #"hash_21327d909449a828":
        self.airank = "captain";
        break;
    default:
        println("<dev string:x82>" + shortrank + "<dev string:x9f>");
        self.airank = "private";
        break;
    }
}

// Namespace name/name_shared
// Params 2, eflags: 0x0
// Checksum 0x5ff6e8c3, Offset: 0x20d8
// Size: 0xba
function issubstr_match_any(str_match, str_search_array) {
    assert(str_search_array.size, "<dev string:xa3>");
    foreach (str_search in str_search_array) {
        if (issubstr(str_match, str_search)) {
            return true;
        }
    }
    return false;
}

