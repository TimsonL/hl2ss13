/datum/job/assistant
	title = "Citizen"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Civil Protection Cadet")

/datum/job/assistant/equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H)
		return 0

	if(visualsOnly)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/citizen(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
		return

	if (H.mind.role_alt_title)
		switch(H.mind.role_alt_title)
			/*if("Civil Protection Cadet")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/cadet(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)*/
			if("Citizen")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/citizen(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
	return 1

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
