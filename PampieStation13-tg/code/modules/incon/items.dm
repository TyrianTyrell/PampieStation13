/obj/item/diaper
	w_class = 1

/obj/item/wetdiap
	w_class = 1

/obj/item/poopydiap
	w_class = 1

/obj/item/useddiap
	w_class = 1

/obj/item/diaper/plain
	name = "diaper"
	desc = "Keeps accidents at bay!"
	icon = 'icons/incon/diaper.dmi'
	icon_state = "plain"

/obj/item/diaper/attack(mob/living/carbon/human/M as mob, mob/usr as mob)
	if(HAS_TRAIT(M,TRAIT_FULLYINCONTINENT) || HAS_TRAIT(M,TRAIT_INCONTINENT) || HAS_TRAIT(M,TRAIT_POTTYREBEL))
		playsound(M.loc,'sound/effects/Diapertape.wav',50,1)
		if(do_after_mob(usr,M))
			M.DiaperChange()
			M.brand = icon_state
			M.DiaperAppearance()
			if (M.brand == "hefters_m" || M.brand == "hefters_f")
				M.heftersbonus = 200
			else
				M.heftersbonus = 0
			Del()

/obj/item/wetdiap/plain
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "plain_wet"

/obj/item/poopydiap/plain
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "plain_messy"

/obj/item/useddiap/plain
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "plain_full"

/obj/item/diaper/classic
	name = "\improper CuddleCom Classic"
	desc = "A diaper from Nanotransen's own design brand. Used ones can be used as fertilizer."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "classics"
	custom_price = 20

/obj/item/wetdiap/classic
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "classics_wet"

/obj/item/poopydiap/classic
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "classics_messy"

/obj/item/useddiap/classic
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "classics_full"

/obj/item/wetdiap/classic/attack_self(mob/living/carbon/human/M as mob, mob/usr as mob)


/obj/item/diaper/swaddles
	name = "\improper Star Spawn Swaddlers"
	desc = "Popular among cultists, this diaper is enchanted to protect innocent minds from going insane."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "swaddles"
	custom_price = 25

/obj/item/wetdiap/swaddles
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "swaddles_wet"

/obj/item/poopydiap/swaddles
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "swaddles_messy"

/obj/item/useddiap/swaddles
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "swaddles_full"

/obj/item/diaper/hefters_m
	name = "\improper Hefters"
	desc = "Geared for long-term and night-time use, this brand can handle more accidents."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_m"
	custom_price = 15

/obj/item/wetdiap/hefters_m
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_m_wet"

/obj/item/poopydiap/hefters_m
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_m_messy"

/obj/item/useddiap/hefters_m
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_m_full"

/obj/item/diaper/hefters_f
	name = "\improper Hefters"
	desc = "Geared for long-term and night-time use, this brand can handle more accidents."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_f"
	custom_price = 15

/obj/item/wetdiap/hefters_f
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_f_wet"

/obj/item/poopydiap/hefters_f
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_f_messy"

/obj/item/useddiap/hefters_f
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "hefters_f_full"

/obj/item/diaper/princess
	name = "\improper SnuggleSpace Princess"
	desc = "A diaper for the elegant and charismatic. You're sure to get a raise if you wear these!"
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Princess"
	custom_price = 40

/obj/item/wetdiap/princess
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Princess_wet"

/obj/item/poopydiap/princess
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Princess_messy"

/obj/item/useddiap/princess
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Princess_full"

/obj/item/diaper/pwrgame
	name = "\improper PwrGame Gamerpants"
	desc = "A diaper for both epic streamers and casual players. Wear this, and any dice you roll are rigged in your favor slightly."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "PwrGame"
	custom_price = 15

/obj/item/wetdiap/pwrgame
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "PwrGame_wet"

/obj/item/poopydiap/pwrgame
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "PwrGame_messy"

/obj/item/useddiap/pwrgame
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "PwrGame_full"

/obj/item/diaper/starkist
	name = "\improper StarKist Nightlights"
	desc = "For little ones afraid of the monsters under their bed. Glows in the dark."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "StarKist"
	custom_price = 20

/obj/item/wetdiap/starkist
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "StarKist_wet"

/obj/item/poopydiap/starkist
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "StarKist_messy"

/obj/item/useddiap/starkist
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "StarKist_full"

/obj/item/diaper/space
	name = "\improper CuddleCom Cadets"
	desc = "For brave babies, unflinchingly facing the void. Reduces your need for oxygen."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Space"
	custom_price = 25

/obj/item/wetdiap/space
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Space_wet"

/obj/item/poopydiap/space
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Space_messy"

/obj/item/useddiap/space
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Space_full"

/obj/item/diaper/hydro
	name = "\improper GreenBeans"
	desc = "For stinkers with a green thumb."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Hydroponics"
	custom_price = 10

/obj/item/wetdiap/hydro
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Hydroponics_wet"

/obj/item/poopydiap/hydro
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Hydroponics_messy"

/obj/item/useddiap/hydro
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Hydroponics_full"

/obj/item/diaper/sci
	name = "\improper SmartiePamps"
	desc = "A diaper for brainy babies."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Science"
	custom_price = 10

/obj/item/wetdiap/sci
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Science_wet"

/obj/item/poopydiap/sci
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Science_messy"

/obj/item/useddiap/sci
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Science_full"

/obj/item/diaper/atmos
	name = "\improper Gassies"
	desc = "A diaper with exemplary odor locking."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Atmos"
	custom_price = 10

/obj/item/wetdiap/atmos
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Atmos_wet"

/obj/item/poopydiap/atmos
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Atmos_messy"

/obj/item/useddiap/atmos
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Atmos_full"

/obj/item/diaper/engi
	name = "\improper Girders"
	desc = "Durable diapers that won't come off until you change."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Engineering"
	custom_price = 10

/obj/item/wetdiap/engi
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Engineering_wet"

/obj/item/poopydiap/engi
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Engineering_messy"

/obj/item/useddiap/engi
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Engineering_full"

/obj/item/diaper/sec
	name = "\improper Briggies"
	desc = "Keeps accidents locked away!"
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Sec"
	custom_price = 10

/obj/item/wetdiap/sec
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Sec_wet"

/obj/item/poopydiap/sec
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Sec_messy"

/obj/item/useddiap/sec
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Sec_full"

/obj/item/diaper/supply
	name = "\improper Packers"
	desc = "Pack cargo without worrying about your packed pants!"
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Supply"
	custom_price = 10

/obj/item/wetdiap/supply
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Supply_wet"

/obj/item/poopydiap/supply
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Supply_messy"

/obj/item/useddiap/supply
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Supply_full"

/obj/item/diaper/service
	name = "\improper GreyWaves"
	desc = "For assistants who need a little help with their accidents."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Service"
	custom_price = 10

/obj/item/wetdiap/service
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Service_wet"

/obj/item/poopydiap/service
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Service_messy"

/obj/item/useddiap/service
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Service_full"

/obj/item/diaper/med
	name = "\improper Caries"
	desc = "Sometimes, caregivers need help too!"
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Med"
	custom_price = 10

/obj/item/wetdiap/med
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Med_wet"

/obj/item/poopydiap/med
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Med_messy"

/obj/item/useddiap/med
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Med_full"

/obj/item/diaper/nt
	name = "\improper CommandSeats"
	desc = "A diaper with an aura of prestige and command!"
	icon = 'icons/incon/diaper.dmi'
	icon_state = "NT"
	custom_price = 10

/obj/item/wetdiap/nt
	name = "wet diaper"
	desc = "Thoroughly soaked."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "NT_wet"

/obj/item/poopydiap/nt
	name = "poopy diaper"
	desc = "Can be smelled from across the room."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "NT_messy"

/obj/item/useddiap/nt
	name = "used diaper"
	desc = "Whoever had this on obviously needed it."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "NT_full"

/obj/item/diaper/syndi
	name = "\improper SyndiStinker Chameleons"
	desc = "For when you need to leave no evidence behind. Heals brute damage, and disguises itself as a plain diaper when changed."
	icon = 'icons/incon/diaper.dmi'
	icon_state = "Replica"

/datum/reagent/medicine/laxative
	name = "Space Lax"
	taste_description = "charcoal"
	ph = 7.5
	color = "#543400"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	metabolization_rate = 1.5 * REAGENTS_METABOLISM

/datum/reagent/medicine/laxative/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.poop += (10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	metabolization_rate = 1.5 * REAGENTS_METABOLISM
	..()

/datum/chemical_reaction/medicine/laxative
	results = list(/datum/reagent/medicine/laxative = 10)
	required_reagents = list(/datum/reagent/carbon = 2, /datum/reagent/phenol = 3, /datum/reagent/nitrogen = 1, /datum/reagent/consumable/ethanol = 4)
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_OTHER

/obj/item/seeds/marshmallow
	name = "pack of marshmallow seeds"
	desc = "They're seeds that grow marshmallow root."
	icon_state = "seed-marshmallow"
	species = "marshmallow"
	plantname = "Marshmallow Root"
	product = /obj/item/food/grown/marshmallowroot
	lifespan = 35
	maturation = 5
	production = 5
	yield = 4
	endurance = 45
	instability = 5
	growthstages = 3
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "marshmallow-grow"
	icon_dead = "marshmallow-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/marshmallow/laxative)
	reagents_add = list(/datum/reagent/medicine/laxative = 0.01, /datum/reagent/consumable/nutriment/vitamin = 0.06, /datum/reagent/consumable/nutriment = 0.03)

/obj/item/food/grown/marshmallowroot
	seed = /obj/item/seeds/marshmallow
	name = "marshmallow root"
	desc = "A root of the marshmallow plant. Can be used to make marshmallows."
	icon_state = "marshroot"
	bite_consumption = 25
	tastes = list("bitterness" = 1)
	can_distill = FALSE

/obj/item/seeds/marshmallow/laxative
	name = "pack of marshmallax seeds"
	desc = "They're seeds that grow marshmallax root."
	icon_state = "seed-marshmallax"
	species = "marshmallax"
	plantname = "Marshmallax Root"
	product = /obj/item/food/grown/marshmallax
	yield = 2
	icon_grow = "marshmallax-grow"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/marshmallow)
	reagents_add = list(/datum/reagent/medicine/laxative = 0.1)

/obj/item/food/grown/marshmallax
	seed = /obj/item/seeds/marshmallow/laxative
	name = "marshmallax root"
	desc = "A root of the marshmallax plant. Extremely potent laxative."
	icon_state = "marshlax"
	bite_consumption = 25
	tastes = list("bitterness" = 1)
	can_distill = FALSE

/datum/food_processor_process/marshmallow
	input = /obj/item/food/grown/marshmallowroot
	output = /obj/item/food/marshmallow
	preserve_materials = FALSE

/obj/item/food/marshmallow
	name = "marshmallows"
	desc = "It's a handful of marshmallows. Don't eat too many!"
	icon_state = "marshmallows"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 2, /datum/reagent/medicine/laxative = 1)
	tastes = list("marshmallow" = 1)
	foodtypes = SUGAR
	w_class = WEIGHT_CLASS_TINY
