/*
 *	Reads inventory, and spits out a list of items you have not yet in your display case
 */
script "checkDisplayCase.ash"
since r18480;
notify charasan;

boolean inDisplayCase( item it ) {
	return (display_amount(it) > 0);
}

/*
 * Items you can only have one of, or items you don't
 * want appearing in the final list.
 * Customize to your case.
 */
boolean omitItem( item it ) {
	return (  it.name != "protonic accelerator pack"
	       && it.name != "Time-Spinner"
	       && it.name != "Camp Scout backpack"
	       && it.name != "Buddy Bjorn"
	       && it.name != "over-the-shoulder Folder Holder"
	       && it.name != "Jarlsberg's pan"
	       && it.name != "Sneaky Pete's leather jacket"
	       && it.name != "genie bottle"
	       && it.name != "portable pantogram"
	       && it.name != "Greatest American Pants"
	       && it.name != "Kremlin's Greatest Briefcase"
	       && it.name != "mumming trunk"
	       && it.name != "Asdon Martin keyfob"
	       && it.name != "January's Garbage Tote"
	       && it.name != "Frosty's iceball"
	       && it.name != "Clan VIP Lounge key"
	       && it.name != "warbear jackhammer drill press"
	       && it.name != "warbear induction oven"
	       && it.name != "warbear chemistry lab"
	       && it.name != "warbear LP-ROM burner"
	       && it.name != "warbear breakfast machine"
	       && it.name != "warbear soda machine"
	       && it.name != "The Cocktail Shaker"
	       && it.name != "bindle of joy"
	       && it.name != "flickering pixel"
	       && it.name != "KoL Con 13 snowglobe"
	       && it.name != "Spellbook: Walberg's Dim Bulb"
	       && it.name != "Spellbook: Singer's Faithful Ocelot"
	       && it.name != "Spellbook: Drescher's Annoying Noise"
	       && it.name != "solid shifting time weirdness"
	       && it.name != "infinite BACON machine"
		   );
}

/*
 * Currently this filter is here to filter OUT
 * equipment. Removing this filter from main()
 * should show EVERYTHING not in the case.
 * For a full list of possible item_types, see this page:
 * http://wiki.kolmafia.us/index.php?title=Item_type
 */
boolean filterItemTypes( item it ) {
	return ( item_type(it) == "" // misc inventory item
		  || item_type(it) == "food"
		  || item_type(it) == "booze"
		  || item_type(it) == "spleen item"
		  || item_type(it) == "card"
		  || item_type(it) == "artsything"
		  || item_type(it) == "avatar potion"
		  || item_type(it) == "book"
		  || item_type(it) == "can of beans"
		  || item_type(it) == "euphemisms"
		  || item_type(it) == "drink helper"
		  || item_type(it) == "folder"
		  || item_type(it) == "pasta guardian"
		  || item_type(it) == "radio"
		  || item_type(it) == "sticker"
		  || item_type(it) == "superball"
		  || item_type(it) == "familiar larva"
		  || item_type(it) == "familiar equipment"
		  );
}

void main(boolean showAllDisplayable) {
	int[item] inventory = get_inventory();
	boolean found = false;

	foreach it in inventory	{
		if (!inDisplayCase(it) && is_displayable(it) && omitItem(it)) {
			if(it.name == "raffle ticket") continue; // raffle tickets are displayable, but disappear each day regardless
			if(showAllDisplayable) {
				found = true;
				print(it + " is not in your display case.");
			} else {
				if(filterItemTypes(it)) {
					found = true;
					print(it + " is not in your display case.");
				} else {
					continue;
				}
			}
		}
	}
	
	if(!found) {
		print("No unique displayable items found.");
	}
}
