/datum/game_mode/nuclear/clown_ops
	name = "clown ops"
	config_tag = "clownops"
	chaos = 8
	announce_span = "danger"
	announce_text = "Войско Хонкоматери затеяло набег на станцию с целью ХОНКНУТЬ её!\n\
	<span class='danger'>Operatives</span>: Secure the nuclear authentication disk and use your bananium fission explosive to HONK the station.\n\
	<span class='notice'>Crew</span>: Defend the nuclear authentication disk and ensure that it leaves with you on the emergency shuttle."

	operative_antag_datum_type = /datum/antagonist/nukeop/clownop
	leader_antag_datum_type = /datum/antagonist/nukeop/leader/clownop

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

/datum/game_mode/nuclear/clown_ops/pre_setup()
	. = ..()
	if(.)
		for(var/obj/machinery/nuclearbomb/syndicate/S in GLOB.nuke_list)
			var/turf/T = get_turf(S)
			if(T)
				qdel(S)
				new /obj/machinery/nuclearbomb/syndicate/bananium(T)
		for(var/V in pre_nukeops)
			var/datum/mind/the_op = V
			the_op.assigned_role = "Clown Operative"
			the_op.special_role = "Clown Operative"

/datum/game_mode/nuclear/clown_ops/generate_report()
	return "One of Central Command's trading routes was recently disrupted by a raid carried out by the Gorlex Marauders. They seemed to only be after one ship - a highly-sensitive \
			transport containing a bananium fission explosive, although it is useless without the proper code and authorization disk. While the code was likely found in minutes, the only disk that \
			can activate this explosive is on your station. Ensure that it is protected at all times, and remain alert for possible intruders."


/datum/outfit/syndicate/clownop
	name = "Clown Operative - Basic"
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/clown_shoes/combat
	mask = /obj/item/clothing/mask/gas/clown_hat
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack/clown
	ears = /obj/item/radio/headset/syndicate/alt
	l_pocket = /obj/item/pinpointer/nuke/syndicate
	r_pocket = /obj/item/bikehorn
	id = /obj/item/card/id/syndicate
	backpack_contents = list(/obj/item/storage/box/survival/syndie=1,\
		/obj/item/kitchen/knife/combat/survival,
		/obj/item/reagent_containers/spray/waterflower/lube)
	implants = list(/obj/item/implant/sad_trombone)

	uplink_type = /obj/item/uplink/clownop
	give_space_cooler_if_synth = TRUE // BLUEMOON ADD

/datum/outfit/syndicate/clownop/no_crystals
	tc = 0

/datum/outfit/syndicate/clownop/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()
	if(visualsOnly)
		return
	H.dna.add_mutation(SMILE)
	H.faction |= "clown"

/datum/outfit/syndicate/clownop/leader
	name = "Clown Operative Leader - Basic"
	id = /obj/item/card/id/syndicate/nuke_leader
	gloves = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	r_hand = /obj/item/nuclear_challenge/clownops
	command_radio = TRUE
