/datum/component/tieddir/Initialize(...)
	. = ..()
	RegisterSignal(parent, COMSIG_BUCKLED_MOB_DIRECTION, .proc/matchdir)

/datum/component/tieddir/proc/matchdir(obj/structure/chair/source, mob/living/babbu)
	if(babbu.buckled == source)
		source.setDir(babbu.dir)

/datum/component/diaperswitch/Initialize(...)
	. = ..()
	RegisterSignal(parent, COMSIG_DIAPERCHANGE, .proc/changeundies)

/datum/component/diaperswitch/proc/changeundies(source, ckey)
	if(ishuman(parent))
		var/mob/living/carbon/human/butt = parent
		var/piss = copytext_char(ckey,1,2)
		var/underwear
		var/underwear_color
		var/default_slot = 1
		if(fexists("data/player_saves/[piss]/[ckey]/preferences.sav"))
			var/savefile/S = new/savefile("data/player_saves/[piss]/[ckey]/preferences.sav")
			S.cd = "/"
			S["default_slot"] >> default_slot
			S.cd = "/character[default_slot]"
			S["underwear"] >> underwear
			S["underwear_color"] >> underwear_color
			sanitize_inlist(underwear, GLOB.underwear_list)
			sanitize_hexcolor(underwear_color)
		else
			underwear = butt.baseunderwear
			underwear_color = butt.underwear_color
		if((HAS_TRAIT(butt,TRAIT_INCONTINENT) || HAS_TRAIT(butt,TRAIT_FULLYINCONTINENT) || HAS_TRAIT(butt,TRAIT_POTTYREBEL) || HAS_TRAIT(butt,BABYBRAINED_TRAIT)))
			butt.underwear = "Diaper"
			switch(butt.brand)
				if("plain")
					butt.underwear_color = underwear_color
				if("classics")
					butt.underwear_color = "6F6"
				if("swaddles")
					butt.underwear_color = "39C"
				if("hefters_m")
					butt.underwear_color = "EEF"
				if("Princess")
					butt.underwear_color = "F9F"
				if("PwrGame")
					butt.underwear_color = "83F"
				if("StarKist")
					butt.underwear_color = "F93"
				if("Space")
					butt.underwear_color = "36C"
				if("Replica")
					butt.underwear_color = "C00"
				if("Service")
					butt.underwear_color = "999"
				if("Supply")
					butt.underwear_color = "DB2"
				if("Hydroponics")
					butt.underwear_color = "0F0"
				if("Sec")
					butt.underwear_color = "111"
				if("Engineering")
					butt.underwear_color = "FE0"
				if("Atmos")
					butt.underwear_color = "FE0"
				if("Science")
					butt.underwear_color = "609"
				if("Med")
					butt.underwear_color = "48A"
		else
			butt.underwear = underwear
			butt.underwear_color = underwear_color
		butt.update_body()
