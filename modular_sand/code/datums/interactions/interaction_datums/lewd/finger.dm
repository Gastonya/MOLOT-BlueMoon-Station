/datum/interaction/lewd/finger
	description = "Пальчики. Поиграться с вагиной."
	require_user_hands = TRUE
	require_target_vagina = REQUIRE_EXPOSED
	interaction_sound = null
	max_distance = 1

	additional_details = list(
		list(
			"info" = "You can fill a container if you hold it in your hand or pull it",
			"icon" = "flask",
			"color" = "transparent"
			)
	)

/datum/interaction/lewd/finger/display_interaction(mob/living/user, mob/living/partner)
	var/obj/item/reagent_containers/liquid_container

	var/obj/item/cached_item = user.get_active_held_item()
	if(istype(cached_item, /obj/item/reagent_containers))
		liquid_container = cached_item
	else
		cached_item = user.pulling
		if(istype(cached_item, /obj/item/reagent_containers))
			liquid_container = cached_item

	var/message = "[pick("охотно играется с киской <b>[partner]</b>",
		"играется с киской <b>[partner]</b>",
		"фингерит киску \the <b>[partner]</b>",
		"разрабатывает влагалище <b>[partner]</b>",
		"грубо играется с киской <b>[partner]</b>")]"

	if(!partner.is_fucking(user, CUM_TARGET_HAND, partner.getorganslot(ORGAN_SLOT_VAGINA)))
		partner.set_is_fucking(user, CUM_TARGET_HAND, partner.getorganslot(ORGAN_SLOT_VAGINA))

	if(liquid_container)
		message += " над [liquid_container]"

	user.visible_message(span_lewd("<b>\The [user]</b> [message]."), ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_HAND, liquid_container ? liquid_container : user, ORGAN_SLOT_VAGINA) //SPLURT edit

/datum/interaction/lewd/fingerass
	description = "Пальчики. Поиграться с попкой."
	interaction_sound = null
	require_user_hands = TRUE
	require_target_anus = REQUIRE_EXPOSED
	max_distance = 1

/datum/interaction/lewd/fingerass/display_interaction(mob/living/user, mob/living/partner)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [pick("погружает палец в сфинктер <b>[partner]</b>.",
		"суёт палец в анальное колечко <b>[partner]</b>.",
		"разрабатывает анальное кольцо <b>[partner]</b> при помощи собственного пальца.")]</span>", ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)
	partner.handle_post_sex(NORMAL_LUST, null, user, ORGAN_SLOT_ANUS) //SPLURT edit
