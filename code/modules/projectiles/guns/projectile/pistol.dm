/obj/item/weapon/gun/projectile/silenced
	name = "silenced pistol"
	desc = "A small, quiet,  easily concealable gun. Uses .45 rounds."
	icon_state = "silenced_pistol"
	item_state = null
	inhand_states = list("left_hand" = 'icons/mob/in-hand/left/guninhands_left.dmi', "right_hand" = 'icons/mob/in-hand/right/guninhands_right.dmi')
	w_class = W_CLASS_MEDIUM
	max_shells = 10
	caliber = list(".45"  = 1)
	silenced = 1
	origin_tech = Tc_COMBAT + "=2;" + Tc_MATERIALS + "=2;" + Tc_SYNDICATE + "=8"
	ammo_type = "/obj/item/ammo_casing/c45"
	mag_type = "/obj/item/ammo_storage/magazine/c45"
	load_method = 2


/obj/item/weapon/gun/projectile/deagle
	name = "desert eagle"
	desc = "A robust handgun that uses .50 AE ammo"
	icon_state = "deagle"
	item_state = null
	inhand_states = list("left_hand" = 'icons/mob/in-hand/left/guninhands_left.dmi', "right_hand" = 'icons/mob/in-hand/right/guninhands_right.dmi')
	force = 14.0
	max_shells = 7
	caliber = list(".50" = 1)
	ammo_type ="/obj/item/ammo_casing/a50"
	mag_type = "/obj/item/ammo_storage/magazine/a50"
	load_method = 2

	gun_flags = AUTOMAGDROP | EMPTYCASINGS

/obj/item/weapon/gun/projectile/deagle/gold
	desc = "A gold plated gun folded over a million times by superior martian gunsmiths. Uses .50 AE ammo."
	icon_state = "deagleg"
	item_state = "deagleg"


/obj/item/weapon/gun/projectile/deagle/camo
	desc = "A Deagle brand Deagle for operators operating operationally. Uses .50 AE ammo."
	icon_state = "deaglecamo"
	item_state = "deagleg"



/obj/item/weapon/gun/projectile/gyropistol
	name = "gyrojet pistol"
	desc = "A bulky pistol designed to fire self propelled rounds"
	icon_state = "gyropistol"
	item_state = null
	inhand_states = list("left_hand" = 'icons/mob/in-hand/left/guninhands_left.dmi', "right_hand" = 'icons/mob/in-hand/right/guninhands_right.dmi')
	max_shells = 8
	caliber = list("75" = 1)
	fire_sound = 'sound/weapons/elecfire.ogg'
	origin_tech = Tc_COMBAT + "=3"
	ammo_type = "/obj/item/ammo_casing/a75"
	mag_type = "/obj/item/ammo_storage/magazine/a75"
	load_method = 2

	gun_flags = AUTOMAGDROP | EMPTYCASINGS

	update_icon()
		..()
		if(stored_magazine)
			icon_state = "gyropistolloaded"
		else
			icon_state = "gyropistol"
		return

/obj/item/weapon/gun/projectile/pistol
	name = "\improper Stechtkin pistol"
	desc = "A small, easily concealable gun. Uses 9mm rounds."
	icon_state = "pistol"
	w_class = W_CLASS_SMALL
	max_shells = 8
	caliber = list("9mm" = 1)
	silenced = 0
	origin_tech = Tc_COMBAT + "=2;" + Tc_MATERIALS + "=2;" + Tc_SYNDICATE + "=2"
	ammo_type = "/obj/item/ammo_casing/c9mm"
	mag_type = "/obj/item/ammo_storage/magazine/mc9mm"
	load_method = 2

	gun_flags = AUTOMAGDROP | EMPTYCASINGS | SILENCECOMP

/obj/item/weapon/gun/projectile/pistol/update_icon()
	..()
	icon_state = "[initial(icon_state)][silenced ? "-silencer" : ""][chambered ? "" : "-e"]"
	return

/obj/item/weapon/gun/projectile/handgun //mime fingergun
	name = "hand-gun"
	desc = "This is a stickup!"
	icon_state = "handgun"
	inhand_states = list("left_hand" = null, "right_hand" = null)
	ammo_type = "/obj/item/ammo_casing/invisible"
	mag_type = "/obj/item/ammo_storage/magazine/invisible"
	cant_drop = TRUE
	gun_flags = 0
	silenced = TRUE
	fire_sound = null
	load_method = MAGAZINE


/obj/item/weapon/gun/projectile/handgun/RemoveMag(var/mob/user)
	to_chat(user, "<span class = 'warning'>Try as you might, you can't seem to find a magazine on \the [src]!</span>")

/obj/item/weapon/gun/projectile/handgun/Fire(atom/target as mob|obj|turf|area, mob/living/user as mob|obj, params, reflex = 0, struggle = 0)
	if(..())
		if(silenced)
			user.emote("me",1,"pretends to fire a gun at [target]!")
		else
			user.say(pick("BANG!", "BOOM!", "PEW!", "KAPOW!"))

/obj/item/weapon/gun/projectile/sec
	name = "\improper NT Mk58 .45 pistol"
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. Uses .45 rounds."
	icon_state = "secguncomp"
	mag_type = "/obj/item/ammo_storage/magazine/c45"
	caliber = ".45"
	origin_tech = Tc_COMBAT + "=3"
	fire_sound = 'sound/weapons/semiauto.ogg'
	load_method = MAGAZINE

/obj/item/weapon/gun/projectile/sec/update_icon()
	..()
	icon_state = "secguncomp[stored_magazine ? "" : "-e"]"

/obj/item/weapon/gun/projectile/sec/wood
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. This one has a sweet wooden grip. Uses .45 rounds."
	name = "\improper NT Mk58 .45 Custom"
	icon_state = "secgundark"

/obj/item/weapon/gun/projectile/sec/wood/update_icon()
	..()
	icon_state = "secgundark[stored_magazine ? "" : "-e"]"