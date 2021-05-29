/mob/living/keybind_face_direction(direction)
	. = ..()
	if(buckled != null)
		SEND_SIGNAL(buckled, COMSIG_BUCKLED_MOB_DIRECTION, src)

/obj/structure/chair/bouncer
	name = "bouncer"
	desc = "For big babies to bounce in!"
	icon = 'icons/incon/bouncy.dmi'
	icon_state = "boun_SOUTH"
	buildstacktype = /obj/item/stack/sheet/cloth
	buildstackamount = 3
	item_chair = null
	var/bouncey = 0
	var/basey = 0
	var/bounceoverlay = null

/obj/structure/chair/bouncer/proc/bounceranimation(mob/living/M)
	spawn(6)
	if(has_buckled_mobs())
		bouncey = bouncey + 2
		if(bouncey >= 4)
			bouncey = 0
		var/currenty = basey + bouncey
		if(bouncey == 0)
			icon_state = "boun_SOUTH"
			if(iscarbon(M))
				var/mob/living/carbon/N = M
				if(N.stinkiness > 0)
					to_chat(M,"<span class='warning'>Squish!</span>")
		else
			icon_state = "boun_SOUTH2"
		M.pixel_y = currenty
		src.pixel_y = currenty
		bounceranimation(M)

/obj/structure/chair/bouncer/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/tieddir)

/obj/structure/chair/bouncer/post_buckle_mob(mob/living/M)
	. = ..()
	basey = M.pixel_y
	bounceoverlay = mutable_appearance('icons/incon/bounceroverlay.dmi',"boun_SOUTH")
	M.overlays+= bounceoverlay
	bounceranimation(M)
	bouncerrotation(M)

/obj/structure/chair/bouncer/proc/bouncerrotation(mob/living/M)
	if(has_buckled_mobs())
		M.overlays-= bounceoverlay
		if(bouncey == 0)
			bounceoverlay = mutable_appearance('icons/incon/bounceroverlay.dmi',"boun_SOUTH")
		else
			bounceoverlay = mutable_appearance('icons/incon/bounceroverlay.dmi',"boun_SOUTH2")
		M.overlays+= bounceoverlay
		M.update_overlays()
		spawn(1)
		bouncerrotation(M)

/obj/structure/chair/bouncer/post_unbuckle_mob(mob/living/M)
	. = ..()
	src.pixel_y = 0
	M.pixel_y = 0
	basey = 0
	bouncey = 0
	M.overlays-= bounceoverlay
	bounceoverlay = null
	M.update_overlays()
	icon_state = "boun_SOUTH"

