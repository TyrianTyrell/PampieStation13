/mob/living/carbon/var/pee = 0
/mob/living/carbon/var/poop = 0
/mob/living/carbon/var/wetness = 0
/mob/living/carbon/var/stinkiness = 0
/mob/living/carbon/var/fluids = 0
/mob/living/carbon/var/max_continence = 100
/mob/living/carbon/var/on_purpose = 0
/mob/living/carbon/var/brand = "plain"
/mob/living/carbon/var/heftersbonus = 0
/mob/living/carbon/var/needpee = 0
/mob/living/carbon/var/needpoo = 0
/mob/living/carbon/var/regressiontimer = 0
/mob/living/carbon/var/statusoverlay = null
/mob/var/rollbonus = 0

/mob/living/carbon/human/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/diaperswitch)

/mob/living/carbon/proc/Wetting()
	if (pee > 0 && stat != DEAD)
		needpee = 0
		playsound(loc, 'sound/effects/pee-diaper.wav', 50, 1)
		if (!HAS_TRAIT(src,TRAIT_FULLYINCONTINENT))
			if (on_purpose == 1)
				src.visible_message("<span class='notice'>[src] scrunches [src.p_their()] legs and lets the floodgates open.</span>","<span class='notice'>You scrunch your legs and let the floodgates open.</span>")
			else
				src.visible_message("<span class='notice'>[src]'s legs buckle as [src.p_they()] are unable to stop [src.p_their()] bladder from leaking into [src.p_their()] pants!</span>","<span class='notice'>Your legs buckle as you are unable to stop your bladder from leaking into your pants!</span>")
		if(wetness + pee < 500 + heftersbonus)
			wetness = wetness + pee
			pee = 0
		else
			wetness = 500 + heftersbonus
			pee = 0
			new /obj/effect/decal/cleanable/waste/peepee(loc)
		on_purpose = 0
	else if (stat == DEAD)
		to_chat(src,"You can't pee, you're dead!")

/mob/living/carbon/proc/Pooping()
	if (poop > 0 && stat != DEAD)
		needpoo = 0
		playsound(loc, 'sound/effects/uhoh.ogg', 50, 1)
		if (!HAS_TRAIT(src,TRAIT_FULLYINCONTINENT))
			if (on_purpose == 1)
				src.visible_message("<span class='notice'>An odor pervades the room as [src] dumps [src.p_their()] drawers.</span>","<span class='notice'>An odor pervades the room as you dump your drawers.</span>")
			else
				src.visible_message("<span class='notice'>[src] takes a squat and winces as [src.p_their()] seat sags just a little more.</span>","<span class='notice'>That tight feeling in your gut is gone. But your diaper seems a bit saggier- and stinkier.</span>")
		if(stinkiness + poop < 500 + heftersbonus)
			stinkiness = stinkiness + poop
			poop = 0
		else
			stinkiness = 500 + heftersbonus
			poop = 0
		on_purpose = 0
	else if (stat == DEAD)
		to_chat(src,"You can't poop, you're dead!")

/mob/living/carbon/proc/PampUpdate()
	if(stat != DEAD && (HAS_TRAIT(src,TRAIT_INCONTINENT) || HAS_TRAIT(src,TRAIT_FULLYINCONTINENT) || HAS_TRAIT(src,TRAIT_POTTYREBEL) || HAS_TRAIT(src,BABYBRAINED_TRAIT)) && src.client != null)
		if(src.client.prefs.accident_types != "Poop Only")
			pee = pee + 0.8 + (fluids/200)
		if(src.client.prefs.accident_types != "Pee Only")
			poop = poop + 0.45 + (satiety/200)
	if (wetness >= 1)
		if (HAS_TRAIT(src,TRAIT_POTTYREBEL))
			SEND_SIGNAL(src,COMSIG_ADD_MOOD_EVENT,"peepee",/datum/mood_event/soggyhappy)
		else
			SEND_SIGNAL(src,COMSIG_ADD_MOOD_EVENT,"peepee",/datum/mood_event/soggysad)
	else
		SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"peepee")
	if (stinkiness >= 1)
		if (HAS_TRAIT(src,TRAIT_POTTYREBEL))
			SEND_SIGNAL(src,COMSIG_ADD_MOOD_EVENT,"poopy",/datum/mood_event/stinkyhappy)
		else
			SEND_SIGNAL(src,COMSIG_ADD_MOOD_EVENT,"poopy",/datum/mood_event/stinkysad)
	else
		SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"poopy")
	if (fluids > 0)
		fluids = fluids - 10
	if (fluids < 0)
		fluids = 0
	if (pee >= max_continence * 0.5 && needpee <= 0 && !HAS_TRAIT(src,TRAIT_FULLYINCONTINENT))
		to_chat(src,"You start feeling the need to pee.")
		needpee += 1
	if (pee >= max_continence * 0.8 && needpee <= 1 && !HAS_TRAIT(src,TRAIT_FULLYINCONTINENT))
		to_chat(src,"You really need to pee!")
		needpee += 1
	if (poop >= max_continence * 0.5 && needpoo <= 0 && !HAS_TRAIT(src,TRAIT_FULLYINCONTINENT))
		to_chat(src,"You start feeling the need to poop.")
		needpoo += 1
	if (poop >= max_continence * 0.8 && needpoo <= 1 && !HAS_TRAIT(src,TRAIT_FULLYINCONTINENT))
		to_chat(src,"You really need to poop!")
		needpoo += 1
	if (pee >= max_continence)
		Wetting()
	if (poop >= max_continence)
		Pooping()
	switch(brand)
		if ("plain")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("classics")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("swaddles")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_ADD_MOOD_EVENT,"sanshield",/datum/mood_event/sanitydiaper)
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("hefters_m")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Princess")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = TRUE
			rollbonus = 0
		if ("PwrGame")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 1
		if ("StarKist")
			set_light(3)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Space")
			set_light(0)
			ADD_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Replica")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
			adjustBruteLoss(-0.5)
		if ("Service")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Supply")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Hydroponics")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Sec")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Engineering")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Atmos")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
		if ("Science")
			set_light(0)
			REMOVE_TRAIT(src,TRAIT_NOBREATH,INNATE_TRAIT)
			SEND_SIGNAL(src,COMSIG_CLEAR_MOOD_EVENT,"sanshield")
			if (ishuman(src))
				var/mob/living/carbon/human/H = src
				var/datum/bank_account/D = H.get_bank_account()
				if (D)
					D.princessbonus = FALSE
			rollbonus = 0
	spawn(60)
	PampUpdate()

/mob/living/carbon/proc/DiaperAppearance()
	SEND_SIGNAL(src,COMSIG_DIAPERCHANGE, ckey(src.mind.key))

/mob/living/carbon/proc/DiaperChange()
	var/turf/cuckold = null
	switch(src.dir)
		if(1)
			cuckold = locate(src.loc.x + 1,src.loc.y,src.loc.z)
		if(2)
			cuckold = locate(src.loc.x - 1,src.loc.y,src.loc.z)
		if(4)
			cuckold = locate(src.loc.x,src.loc.y - 1,src.loc.z)
		if(8)
			cuckold = locate(src.loc.x,src.loc.y + 1,src.loc.z)
	if (wetness >= 1)
		if (stinkiness >= 1)
			switch(brand)
				if("plain")
					new /obj/item/useddiap/plain(cuckold)
				if("classics")
					new /obj/item/useddiap/classic(cuckold)
				if("swaddles")
					new /obj/item/useddiap/swaddles(cuckold)
				if("hefters_m")
					new /obj/item/useddiap/hefters_m(cuckold)
				if("Princess")
					new /obj/item/useddiap/princess(cuckold)
				if("PwrGame")
					new /obj/item/useddiap/pwrgame(cuckold)
				if("StarKist")
					new /obj/item/useddiap/starkist(cuckold)
				if("Space")
					new /obj/item/useddiap/space(cuckold)
				if("Replica")
					new /obj/item/useddiap/plain(cuckold)
				if("Service")
					new /obj/item/useddiap/service(cuckold)
				if("Supply")
					new /obj/item/useddiap/supply(cuckold)
				if("Hydroponics")
					new /obj/item/useddiap/hydro(cuckold)
				if("Sec")
					new /obj/item/useddiap/sec(cuckold)
				if("Engineering")
					new /obj/item/useddiap/engi(cuckold)
				if("Atmos")
					new /obj/item/useddiap/atmos(cuckold)
				if("Science")
					new /obj/item/useddiap/sci(cuckold)
				if("Med")
					new /obj/item/useddiap/med(cuckold)

		else
			switch(brand)
				if("plain")
					new /obj/item/wetdiap/plain(cuckold)
				if("classics")
					new /obj/item/wetdiap/classic(cuckold)
				if("swaddles")
					new /obj/item/wetdiap/swaddles(cuckold)
				if("hefters_m")
					new /obj/item/wetdiap/hefters_m(cuckold)
				if("Princess")
					new /obj/item/wetdiap/princess(cuckold)
				if("PwrGame")
					new /obj/item/wetdiap/pwrgame(cuckold)
				if("StarKist")
					new /obj/item/wetdiap/starkist(cuckold)
				if("Space")
					new /obj/item/wetdiap/space(cuckold)
				if("Replica")
					new /obj/item/wetdiap/plain(cuckold)
				if("Service")
					new /obj/item/wetdiap/service(cuckold)
				if("Supply")
					new /obj/item/wetdiap/supply(cuckold)
				if("Hydroponics")
					new /obj/item/wetdiap/hydro(cuckold)
				if("Sec")
					new /obj/item/wetdiap/sec(cuckold)
				if("Engineering")
					new /obj/item/wetdiap/engi(cuckold)
				if("Atmos")
					new /obj/item/wetdiap/atmos(cuckold)
				if("Science")
					new /obj/item/wetdiap/sci(cuckold)
				if("Med")
					new /obj/item/wetdiap/med(cuckold)
	else
		if (stinkiness >= 1)
			switch(brand)
				if("plain")
					new /obj/item/poopydiap/plain(cuckold)
				if("classics")
					new /obj/item/poopydiap/classic(cuckold)
				if("swaddles")
					new /obj/item/poopydiap/swaddles(cuckold)
				if("hefters_m")
					new /obj/item/poopydiap/hefters_m(cuckold)
				if("Princess")
					new /obj/item/poopydiap/princess(cuckold)
				if("PwrGame")
					new /obj/item/poopydiap/pwrgame(cuckold)
				if("StarKist")
					new /obj/item/poopydiap/starkist(cuckold)
				if("Space")
					new /obj/item/poopydiap/space(cuckold)
				if("Replica")
					new /obj/item/poopydiap/plain(cuckold)
				if("Service")
					new /obj/item/poopydiap/service(cuckold)
				if("Supply")
					new /obj/item/poopydiap/supply(cuckold)
				if("Hydroponics")
					new /obj/item/poopydiap/hydro(cuckold)
				if("Sec")
					new /obj/item/poopydiap/sec(cuckold)
				if("Engineering")
					new /obj/item/poopydiap/engi(cuckold)
				if("Atmos")
					new /obj/item/poopydiap/atmos(cuckold)
				if("Science")
					new /obj/item/poopydiap/sci(cuckold)
				if("Med")
					new /obj/item/poopydiap/med(cuckold)
		else
			switch(brand)
				if("plain")
					new /obj/item/diaper/plain(cuckold)
				if("classics")
					new /obj/item/diaper/classic(cuckold)
				if("swaddles")
					new /obj/item/diaper/swaddles(cuckold)
				if("hefters_m")
					new /obj/item/diaper/hefters_m(cuckold)
				if("Princess")
					new /obj/item/diaper/princess(cuckold)
				if("PwrGame")
					new /obj/item/diaper/pwrgame(cuckold)
				if("StarKist")
					new /obj/item/diaper/starkist(cuckold)
				if("Space")
					new /obj/item/diaper/space(cuckold)
				if("Replica")
					new /obj/item/diaper/syndi(cuckold)
				if("Service")
					new /obj/item/diaper/service(cuckold)
				if("Supply")
					new /obj/item/diaper/supply(cuckold)
				if("Hydroponics")
					new /obj/item/diaper/hydro(cuckold)
				if("Sec")
					new /obj/item/diaper/sec(cuckold)
				if("Engineering")
					new /obj/item/diaper/engi(cuckold)
				if("Atmos")
					new /obj/item/diaper/atmos(cuckold)
				if("Science")
					new /obj/item/diaper/sci(cuckold)
				if("Med")
					new /obj/item/diaper/med(cuckold)
	wetness = 0
	stinkiness = 0

/mob/living/carbon/verb/Pee()
	if(usr.client.prefs.accident_types != "Poop Only")
		set category = "IC"
	if((HAS_TRAIT(usr,TRAIT_INCONTINENT) || HAS_TRAIT(usr,TRAIT_POTTYREBEL) || HAS_TRAIT(usr,BABYBRAINED_TRAIT)) && !HAS_TRAIT(usr,TRAIT_FULLYINCONTINENT))
		on_purpose = 1
		Wetting()
	else
		to_chat(usr, "<span class='warning'>You cannot pee right now.</span>")

/mob/living/carbon/verb/Poop()
	if(usr.client.prefs.accident_types != "Pee Only")
		set category = "IC"
	if((HAS_TRAIT(usr,TRAIT_INCONTINENT) || HAS_TRAIT(usr,TRAIT_POTTYREBEL) || HAS_TRAIT(usr,BABYBRAINED_TRAIT)) && !HAS_TRAIT(usr,TRAIT_FULLYINCONTINENT))
		on_purpose = 1
		Pooping()
	else
		to_chat(usr, "<span class='warning'>You cannot poop right now.</span>")

/mob/living/carbon/New()
	..()
	PampUpdate()

/obj/item/reagent_containers/food/snacks/attack(mob/living/carbon/human/M, mob/living/user, def_zone)
	..()
	M.poop = M.poop + 1

/obj/item/reagent_containers/food/drinks/attack(mob/living/carbon/human/M, mob/living/user, def_zone)
	..()
	M.pee = M.pee + 2
	M.fluids = M.fluids + 25
	if (M.fluids > 300)
		M.fluids = 300

/atom/movable/screen/diaperstatus
	name = "diaper state"
	icon = 'icons/incon/diapercondition.dmi'
	icon_state = "hud_plain"
	screen_loc = ui_diaper

/atom/movable/screen/diaperstatus/proc/DiaperUpdate(mob/living/carbon/owner)
	if(HAS_TRAIT(owner,BABYBRAINED_TRAIT))
		if(owner.regressiontimer > 0)
			owner.regressiontimer--
		else
			REMOVE_TRAIT(owner,BABYBRAINED_TRAIT,REGRESSION_TRAIT)
			REMOVE_TRAIT(owner,TRAIT_NORUNNING,REGRESSION_TRAIT)
			SEND_SIGNAL(owner,COMSIG_DIAPERCHANGE,owner.ckey)
			owner.overlays -= owner.statusoverlay
			owner.statusoverlay = null
	if(HAS_TRAIT(owner,TRAIT_POTTYREBEL || TRAIT_INCONTINENT || BABYBRAINED_TRAIT) && !HAS_TRAIT(owner,TRAIT_FULLYINCONTINENT))
		if (owner.wetness >= 1)
			if (owner.stinkiness >= 1)
				icon_state = "hud_plain_used"
			else
				icon_state = "hud_plain_wet"
		else
			if (owner.stinkiness >= 1)
				icon_state = "hud_plain_poopy"
			else
				icon_state = "hud_plain"
	else
		icon_state = null
	spawn(1)
	DiaperUpdate(owner)

/atom/movable/screen/diaperstatus/New(mob/living/carbon/owner)
	DiaperUpdate(owner)


/datum/hud/human/New(mob/living/carbon/owner)
	..()
	var/atom/movable/screen/diapstats = new /atom/movable/screen/diaperstatus(owner)
	if (HAS_TRAIT(owner,TRAIT_INCONTINENT))
		owner.max_continence = 50
	else
		owner.max_continence = 100
	diapstats.hud = src
	infodisplay += diapstats

/obj/effect/decal/cleanable/waste
	icon = 'icons/incon/accidents.dmi'
	gender = NEUTER

/obj/effect/decal/cleanable/waste/peepee
	name = "urine"
	desc = "A puddle of urine. Looks like we have a leaker."
	icon_state = "peepee"

/obj/machinery/vending/diaper
	name = "\improper Big Dipper diaper dispenser"
	desc = "A diaper vendor, here courtesy of Big Dipper Babies Inc."
	product_slogans = "Here to help babies big and small!"
	product_ads = "Does someone need a change? Big Dipper is here for the soggers and the stinkers~"
	icon = 'icons/incon/diaper.dmi'
	icon_state = "dvend_big"
	products = list(/obj/item/diaper/plain = 60,
					/obj/item/diaper/classic = 45,
					/obj/item/diaper/swaddles = 45,
					/obj/item/diaper/princess = 45,
					/obj/item/diaper/pwrgame = 45,
					/obj/item/diaper/starkist = 45,
					/obj/item/diaper/space = 45)
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/medical
	default_price = 10
	extra_price = 100
	payment_department = ACCOUNT_MED

/datum/mood_event/soggysad
	description = "<span class='warning'>Aw man, my pants are wet...\n</span>"
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/soggyhappy
	description = "<span class='nicegreen'>A wet diaper is always comfy!\n</span>"
	mood_change = 3
	timeout = 2 MINUTES

/datum/mood_event/stinkysad
	description = "<span class='warning'>Ew... I need a change.\n</span>"
	mood_change = -5
	timeout = 5 MINUTES

/datum/mood_event/stinkyhappy
	description = "<span class='nicegreen'>Heh, take that, potty!\n</span>"
	mood_change = 5
	timeout = 5 MINUTES

/datum/mood_event/sanitydiaper
	description = "<span class='nicegreen'>I can't describe it- this diaper makes me feel safe!\n</span>"
	mood_change = "INFINITE"
