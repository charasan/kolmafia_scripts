/*
 *	A small script by Charasan to auto-autosell annoying avatar potions.
 */

boolean isAvatarPotion( item it ) {
	return it.effect_modifier( "Effect" ).string_modifier( "Avatar" ) != "";
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
	}
}
