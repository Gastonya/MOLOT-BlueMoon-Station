/obj/effect/mob_spawn/human/ash_walker
	var/gender_bias

/obj/effect/mob_spawn/human/ash_walker/equip(mob/living/carbon/human/H)
	if(!isnull(gender_bias) && prob(90))
		H.gender = gender_bias
	return ..()

/obj/effect/mob_spawn/human/ash_walker/western
	job_description = "Western Ashwalker's"
	short_desc = "Вы магмовый скиталец женского пола. Ваше племя поклоняется материнскому Тендрилу."
	flavour_text = "Ваш прошлый дом и материнский Тендрил были разрушены чужаками с Холодных Звёзд и те из ваших сородичей, кто остались \
	в живых, покинули южные моря на поиски нового дома. Эти земли хороши для вашего нового дома, ибо обилие Тендрилов дарует этим землям \
	изобилие пищи и материалов для выживания, а также восстановления утерянных знаний и взращивание нового потомства. Однако вы здесь не \
	одни, туземные сородичи обеспокоены вашим присутствием, а особенно знаниями, которыми вы обладаете. Может есть возможность с ними \
	договорится? При этом всём чужаки с Небесных Крепостей добрались и до этих земель. \n\n\
	Будьте на чеку, не дайте трудам потомков, отдавших свои жизни ради вас, пасть Пеплом за зря. Цикл должен продолжаться!"
	mob_species = /datum/species/lizard/ashwalker/western
	gender_bias = FEMALE
	canloadappearance = TRUE

/obj/effect/mob_spawn/human/ash_walker/eastern
	job_description = "Eastern Ashwalker's"
	short_desc = "Вы магмовый скиталец мужского пола. Ваше племя поклоняется материнскому Тендрилу."
	flavour_text = "Ваше племя поклоняется матери Некрополю, как вашей Спасительнице и Наставнице. Священные стены дворца Некрополя \
	дали вашему Тендрилу и вашему Роду защиту. Испокон веков, ваша священная обитель дарует вам Дар Перерождения, из цикла в цикл за \
	жертвоприношения матери Некрополю, ради продолжения Великой Охоты. Однако не так давно на ваши земли вторглось Чужеродное Племя. \
	Несмотря на ваше кровное родство в поклонении Великой Матери, не дайте иноземцам осквернить ваше святилище их изуверскими традициями. \
	Сверх этого, с небесных крепостей из Холодного Камня, на ваши земли спустились скитальцы с далёких Звёзд. Их рудокопы накладывают \
	священные пальцы на Некрополь, свои грязные лапы. Не дайте им украсть дары великой матери и лишить вас пищи. \n\n\
	Охота должна быть здравой, цикл должен продолжаться, грядущие поколения должны жить!"
	mob_species = /datum/species/lizard/ashwalker/eastern
	gender_bias = MALE
	canloadappearance = TRUE

//Portable dangerous-environment sleepers: Spawns in exposed to ash storms shelter.
//Characters in this role could have been conscious for a long time, surviving on the planet. They may also know Draconic language by contacting with ashwalkers.
/obj/effect/mob_spawn/human/wandering_hermit
	name = "portable dangerous-environment sleeper"
	desc = "The glass is slightly cracked, but there is still air inside. You can see somebody inside. They seems to be sleeping deeply."
	job_description = "Wandering Hermit"
	icon = 'icons/obj/lavaland/spawners.dmi'
	icon_state = "cryostasis_sleeper"
	roundstart = FALSE
	death = FALSE
	random = TRUE
	mob_species = /datum/species/human
	mob_name = "a wandering hermit"
	short_desc = "You are a hermit abandoned by fate."
	flavour_text = "You've survived weeks in this hellish place. Maybe you want to live here with ash tribe or return to civilisation. \
	Only you know how you got to this planetoid, whether this place in which you woke up was one of your shelters, or you just stumbled upon it."
	canloadappearance = TRUE

/obj/effect/mob_spawn/human/wandering_hermit/Destroy()
	var/obj/structure/fluff/empty_sleeper/S = new(drop_location())
	S.setDir(dir)
	return ..()

/obj/effect/mob_spawn/human/wandering_hermit/special(mob/living/carbon/human/new_spawn)
	. = ..()
	ADD_TRAIT(new_spawn,TRAIT_EXEMPT_HEALTH_EVENTS,GHOSTROLE_TRAIT)
	new_spawn.language_holder.understood_languages += /datum/language/draconic
	new_spawn.language_holder.spoken_languages += /datum/language/draconic

//Splurt-Specific Space Hotel Staff
/obj/effect/mob_spawn/human/hotel_staff/splurt
	name = "Staff Sleeper"
	desc = "A sleeper designed for long-term stasis between guest visits."
	mob_name = "hotel staff member"
	job_description = "Hotel Staff"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	objectives = "Обслуживайте приезжающих гостей вместе со своими сотрудниками. Не бросайте отель - вы можете рекламировать его и налаживать связи с потенциальными гостями, но всегда помните, кто подписывает ваши чеки! Клиент всегда прав!!"
	short_desc = "Вы сотрудник Космического Отеля!"
	flavour_text = "Вы - сотрудник первоклассного космического отеля! Ухаживайте за гостями и следите за тем, чтобы менеджер не уволил вас."
	important_info = "Не покидайте Космический Отель ни в коем случае! Не конфликтуйте с кем бы то не было, вы в первую очередь мирняк!"
	assignedrole = "Hotel Staff"
	death = FALSE
	roundstart = FALSE
	random = TRUE
	loadout_enabled = TRUE
	canloadappearance = TRUE
	id_job = "Hotel Staff"
	id = /obj/item/card/id/away/hotel/splurt
	uniform = /obj/item/clothing/under/suit/red
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/hotel
	r_pocket = /obj/item/pda
	back = /obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset/headset_srv/hotel
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
						/obj/item/storage/ifak=1)

/obj/effect/mob_spawn/human/hotel_staff/splurt/security
	name = "Hotel Security Sleeper"
	mob_name = "hotel security member"
	job_description = "Hotel Security"
	short_desc = "Вы Миротворец."
	flavour_text = "Вы были назначены в этот отель, чтобы защищать интересы компании, сохраняя мир между гостями и персоналом."
	important_info = "Не покидайте Космический Отель ни в коем случае! Не конфликтуйте с кем бы то не было, вы в первую очередь мирняк!"
	objectives = "Не покидайте Ваше Рабочее Место в виде Космического Отеля. Постарайтесь сохранить мир между персоналом и гостями, по возможности используйте язык и/или нелетальную силу."
	id_job = "Hotel Security"
	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	head = /obj/item/clothing/head/helmet/blueshirt
	back = /obj/item/storage/backpack/satchel/sec
	belt = /obj/item/storage/belt/security/full
	id = /obj/item/card/id/away/hotel/splurt/security

/obj/effect/mob_spawn/human/hotel_staff/splurt/manager
	name = "Hotel Manager Sleeper"
	mob_name = "hotel manager"
	job_description = "Hotel Manager"
	short_desc = "Вы Менеджер Космического Отеля."
	flavour_text = "Вы управляете одним из объектов успешной сети Космических Отелей. Недавно ваша материнская компания была выкуплена Nanotrasen и вам поручили обслуживать некоторые из их станций; в результате вы получили в свое распоряжение набор модных технологий! Защищайте интересы своей материнской компании и следите за тем, чтобы ваш персонал работал на должном уровне, и постарайтесь сделать так, чтобы ваши гости были довольны!"
	important_info = "Staff, including you, are NOT to abandon the hotel."
	objectives = "Don't abandon your assigned hotel. Cater to visiting guests. Maintain good corporate relations and remember: The customer is always right!"
	id_job = "Hotel Manager"
	uniform = /obj/item/clothing/under/suit/black
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	head = /obj/item/clothing/head/beret/black
	ears = /obj/item/radio/headset/headset_srv/hotel/manager
	id = /obj/item/card/id/away/hotel/splurt/manager
	l_pocket = /obj/item/door_remote/away

/obj/effect/mob_spawn/human/hotel_staff/splurt/guest
	name = "Guest Sleeper"
	desc = "Телепортационная штука для гостей."
	uses = -1
	icon = 'icons/obj/telescience.dmi'
	icon_state = "lpad-idle"
	objectives = "Вы заплатили кучу денег за пребывание в этом месте и вы ДОЛЖНЫ оторваться по полной!"
	short_desc = "Вы гость дорогого Космического Отеля!"
	flavour_text = "Вы - гость первоклассного космического отеля! Развлекайтесь!"
	important_info = "Развлекайтесь, как только можете!"
	job_description = "Hotel Tourist"
	id_job = "Hotel Tourist"
	id = /obj/item/card/id/away
	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/rank/civilian/util
	shoes = /obj/item/clothing/shoes/jackboots/tall_default
	head = /obj/item/clothing/head/beret/black
	r_pocket = /obj/item/pda
	back = /obj/item/storage/backpack
	r_hand = /obj/item/storage/secure/briefcase/syndie
