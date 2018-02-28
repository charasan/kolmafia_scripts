/*
 *	A small script by Charasan to auto-autosell annoying avatar potions.
 */
script "autoAutosellAvatarPotions.ash"
since r18480;
notify charasan;
 
boolean isAvatarPotion( item it ) {
	return it.effect_modifier( "Effect" ).string_modifier( "Avatar" ) != "";
}

boolean isMiningItem( item it ) {
	return ( 
			   (it.name == "pointed stick")
			|| (it.name == "adder")
			|| (it.name == "briefcase")
			|| (it.name == "pygmy briefs")
			|| (it.name == "attorney's badge")
			|| (it.name == "short calculator")
//			|| (it.name == "bone abacus")
			|| (it.name == "world's smallest violin")
			|| (it.name == "headhunter necktie")
			|| (it.name == "short writ of habeas corpus")
			
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
		/*
		if (isMiningItem(it)) {
			if (it.name == "briefcase") {
				use(1, it);
			}
			else {
				autosell(1, it);
				print("Selling 1 item: " + it + ".");
			}
		
		}
		*/
	}
}
