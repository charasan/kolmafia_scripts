/*
 *	A small script by Charasan to autosell annoying avatar potions.
 *  Adapted to autosell and/or use items from Mr. Screege's spectacles
 */
script "autoAutosellAvatarPotions.ash"
notify charasan;
since r18480;
 
boolean isAvatarPotion( item it ) {
	return it.effect_modifier( "Effect" ).string_modifier( "Avatar" ) != "";
}

boolean isMoneyItem( item it ) {
	return (
			(it.name == "leather bookmark")
		 || (it.name == "1952 Mickey Mantle card")
		 || (it.name == "stolen meatpouch")
		 || (it.name == "decomposed boot")
		 || (it.name == "old leather wallet")
		 || (it.name == "dollar-sign bag")
		 || (it.name == "CSA discount card")
		 || (it.name == "massive gemstone")
		 || (it.name == "pile of gold coins")
		 || (it.name == "huge gold coin")
		 || (it.name == "shiny stones")
		 || (it.name == "fat wallet")
		 || (it.name == "pixel coin")
		 || (it.name == "duct tape wallet")
		 || (it.name == "half of a gold tooth")
		 || (it.name == "pixellated moneybag")
		 || (it.name == "solid gold jewel")
		 || (it.name == "ancient vinyl coin purse")
		 || (it.name == "old coin purse")
		   );
}

void main() {
	int[item] inventory = get_inventory();
	int amount = 0;
	
	foreach it in inventory	{
		if (isAvatarPotion(it)) {
			amount = item_amount(it);
			print("Selling " + amount + " of avatar potion: " + it + ".");
			autosell(amount, it);
		}

		// Some money items need to used, not autosold
		if (isMoneyItem(it)) {
			if (it.name == "stolen meatpouch" 
			 || it.name == "old leather wallet"
			 || it.name == "old coin purse"
			 || it.name == "shiny stones"
			 || it.name == "fat wallet"
			 || it.name == "pixel coin"
			 || it.name == "pixellated moneybag"
			 || it.name == "duct tape wallet"
			 || it.name == "solid gold jewel"
			 || it.name == "ancient vinyl coin purse"
			 || it.name == "CSA discount card") {
				use(1, it);
			}
			else {
				autosell(1, it);
				print("Selling 1 item: " + it + ".");
			}
		
		}
	}
}
