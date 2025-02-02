/obj/effect/proc_holder/spell/targeted/conjure_item/summon_pie
	name = "Summon Creampie"
	desc = "A clown's weapon of choice.  Use this to summon a fresh pie, just waiting to acquaintain itself with someone's face."
	invocation_type = "none"
	include_user = 1
	range = -1
	item_type = /obj/item/reagent_containers/food/snacks/pie/cream

	charge_max = 10 SECONDS
	cooldown_min = 10 SECONDS
	action_icon = 'icons/obj/food/piecake.dmi'
	action_icon_state = "pie"
	antimagic_allowed = TRUE

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/targeted/conjure_item/summon_cumburger
	name = "Summon Cumburger"
	desc = "Завтрак Ассистента всего за сто девятнадцать кредитов. Очень вкусный."
	invocation_type = "none"
	include_user = 1
	range = -1
	item_type = /obj/item/reagent_containers/food/snacks/burger/cumburger

	charge_max = 10 SECONDS
	cooldown_min = 10 SECONDS
	icon = 'modular_splurt/icons/obj/food/burgerbread.dmi'
	icon_state = "cumburger"
	antimagic_allowed = TRUE

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/book/granter/spell/summon_pie
	spell = /obj/effect/proc_holder/spell/targeted/conjure_item/summon_pie
	spellname = "Summon Creampie"
	icon_state ="cooking_learing_illegal"
	desc = "Эта книга ощущается тёплой..."
	remarks = list("Кремовый пирог...", "Просто поймай его...", "Если кинуть пирог, произойдёт взрыв... правда?", "Кажется, книга запачкана в чём-то белом...", "Что за дела? Почему страницы слиплись...", "О... МОЙ... БОГ... ЧТО?", "В чём разница между кремом, молоком и бананами...")

/obj/item/book/granter/spell/summon_cumburger
	spell = /obj/effect/proc_holder/spell/targeted/conjure_item/summon_cumburger
	spellname = "Summon Cumburger"
	icon_state ="cooking_learing_illegal"
	desc = "Эта книга ощущается тёплой..."
	remarks = list("Кремовый пирог...", "Просто поймай его...", "Если кинуть пирог, произойдёт взрыв... правда?", "Кажется, книга запачкана в чём-то белом...", "Что за дела? Почему страницы слиплись...", "О... МОЙ... БОГ... ЧТО?", "В чём разница между кремом, молоком и бананами...")

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/aimed/banana_peel
	name = "Conjure Banana Peel"
	desc = "Make a banana peel appear out of thin air right under someone's feet!"
	charge_type = "recharge"
	charge_max	= 100
	cooldown_min = 100
	clothes_req = NONE
	invocation_type = "none"
	range = 7
	selection_type = "view"
	projectile_type = null
	antimagic_allowed = TRUE

	active_msg = "You focus, your mind reaching to the clown dimension, ready to make a peel matrialize wherever you want!"
	deactive_msg = "You relax, the peel remaining right in the \"thin air\" it would appear out of."
	action_icon = 'icons/obj/hydroponics/harvest.dmi'
	base_icon_state = "banana_peel"
	action_icon_state = "banana"


/obj/effect/proc_holder/spell/aimed/banana_peel/cast(list/targets, mob/user = usr)
	var/target = get_turf(targets[1])

	if(get_dist(user,target)>range)
		to_chat(user, "<span class='notice'>\The [target] is too far away!</span>")
		return

	. = ..()
	if(!.)
		return
	new /obj/item/grown/bananapeel(target)

/obj/effect/proc_holder/spell/aimed/banana_peel/update_icon()
	if(!action)
		return
	if(active)
		action.button_icon_state = base_icon_state
	else
		action.button_icon_state = action_icon_state

	action.UpdateButtonIcon()
	return
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/targeted/touch/megahonk
	name = "Mega HoNk"
	desc = "This spell channels your inner clown powers, concentrating them into one massive HONK."
	hand_path = /obj/item/melee/touch_attack/megahonk

	charge_max = 100
	clothes_req = NONE
	cooldown_min = 100
	antimagic_allowed = TRUE

	action_icon = 'icons/mecha/mecha_equipment.dmi'
	action_icon_state = "mecha_honker"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/targeted/touch/bspie
	name = "Bluespace Banana Pie"
	desc = "An entire body would fit in there!"
	hand_path = /obj/item/melee/touch_attack/bspie

	charge_max = 450
	clothes_req = NONE
	cooldown_min = 450
	antimagic_allowed = TRUE

	action_icon = 'icons/obj/food/piecake.dmi'
	action_icon_state = "frostypie"




