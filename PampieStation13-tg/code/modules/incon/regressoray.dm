/obj/item/gun/energy/regressoray
	name = "regression ray"
	desc = "A ray-gun that temporarily mentally regresses the target, leaving them baby-brained for a few minutes."
	icon_state = "regression_ray"
	inhand_icon_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/regression)
	ammo_x_offset = 1
	selfcharge = 1

/obj/item/ammo_casing/energy/regression
	fire_sound = 'sound/effects/stealthoff.ogg'
	harmful = FALSE
	projectile_type = /obj/projectile/energy/regression

/obj/projectile/energy/regression
	name = "psi-chronoray"
	icon_state = "energy2"
	damage = 0
	damage_type = TOX
	nodamage = TRUE
	flag = ENERGY

/obj/projectile/energy/regression/on_hit(mob/living/carbon/target, blocked = FALSE)
	. = ..()
	if(isliving(target) && (!iswizard(target) && !HAS_TRAIT(target, CHANGELING_TRAIT) && !HAS_TRAIT(target, TRAIT_MINDSHIELD)))
		if(target.regressiontimer <= 0)
			target.toggle_move_intent()
			ADD_TRAIT(target, BABYBRAINED_TRAIT, REGRESSION_TRAIT)
			ADD_TRAIT(target, TRAIT_NORUNNING, REGRESSION_TRAIT)
			SEND_SIGNAL(target, COMSIG_DIAPERCHANGE, target.ckey)
			target.statusoverlay = mutable_appearance('icons/incon/regressoray.dmi',"regressoray")
			target.overlays += target.statusoverlay
		target.regressiontimer = 5000

/obj/item/gun/energy/regressorayjb
	name = "regression ray"
	desc = "A ray-gun that temporarily mentally regresses the target, leaving them baby-brained for a few minutes."
	icon_state = "regression_ray"
	inhand_icon_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/regressionjb)
	ammo_x_offset = 1
	selfcharge = 1

/obj/item/ammo_casing/energy/regressionjb
	fire_sound = 'sound/effects/stealthoff.ogg'
	harmful = FALSE
	projectile_type = /obj/projectile/energy/regressionjb

/obj/projectile/energy/regressionjb/
	name = "psi-chronoray"
	icon_state = "energy2"
	damage = 0
	damage_type = TOX
	nodamage = TRUE
	flag = ENERGY

/obj/projectile/energy/regressionjb/on_hit(mob/living/carbon/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		if(target.regressiontimer <= 0)
			target.toggle_move_intent()
			ADD_TRAIT(target, BABYBRAINED_TRAIT, REGRESSION_TRAIT)
			ADD_TRAIT(target, TRAIT_NORUNNING, REGRESSION_TRAIT)
			SEND_SIGNAL(target, COMSIG_DIAPERCHANGE, target.ckey)
			target.statusoverlay = mutable_appearance('icons/incon/regressoray.dmi',"regressoray")
			target.overlays += target.statusoverlay
		target.regressiontimer = 5000
