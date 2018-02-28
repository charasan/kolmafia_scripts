script "clipArtMall.ash"
notify charasan;
since r18480;

// Borrowed from Ezandora's Guide script
boolean skill_is_usable(skill s)
{
    if (!s.have_skill())
        return false;
    if (!s.is_unrestricted())
        return false;
    if ($skills[rapid prototyping] contains s)
        return $item[hand turkey outline].is_unrestricted();
    return true;
}
void main() {
	int [item] availableClipArt;
	item highestMallItem = $item[Ur-Donut];
	int highestMallValue = 0;
	int currentMallValue = 0;
	
	int usesLeft = 3;
	skill SCA = $skill[Summon Clip Art];
	
	availableClipArt[$item[Ur-Donut]] = 0;
	availableClipArt[$item[The Bomb]] = 0;
	availableClipArt[$item[box of Familiar Jacks]] = 0;
	availableClipArt[$item[bucket of wine]] = 0;
	availableClipArt[$item[ultrafondue]] = 0;
	availableClipArt[$item[oversized snowflake]] = 0;
	availableClipArt[$item[unbearable light]] = 0;
	availableClipArt[$item[crystal skull]] = 0;
	availableClipArt[$item[borrowed time]] = 0;
	availableClipArt[$item[box of hammers]] = 0;
	availableClipArt[$item[shining halo]] = 0;
	availableClipArt[$item[furry halo]] = 0;
	availableClipArt[$item[frosty halo]] = 0;
	availableClipArt[$item[time halo]] = 0;
	availableClipArt[$item[Lumineux Limnio]] = 0;
	availableClipArt[$item[Morto Moreto]] = 0;
	availableClipArt[$item[Temps Tempranillo]] = 0;
	availableClipArt[$item[Bordeaux Marteaux]] = 0;
	availableClipArt[$item[Fromage Pinotage]] = 0;
	availableClipArt[$item[Beignet Milgranet]] = 0;
	availableClipArt[$item[Muschat]] = 0;
	availableClipArt[$item[cool jelly donut]] = 0;
	availableClipArt[$item[shrapnel jelly donut]] = 0;
	availableClipArt[$item[occult jelly donut]] = 0;
	availableClipArt[$item[thyme jelly donut]] = 0;
	availableClipArt[$item[frozen danish]] = 0;
	availableClipArt[$item[smashed danish]] = 0;
	availableClipArt[$item[forbidden danish]] = 0;
	availableClipArt[$item[cool cat claw]] = 0;
	availableClipArt[$item[blunt cat claw]] = 0;
	availableClipArt[$item[shadowy cat claw]] = 0;
	availableClipArt[$item[cheezburger]] = 0;
	availableClipArt[$item[toasted brie]] = 0;
	availableClipArt[$item[potion of the field gar]] = 0;
	availableClipArt[$item[too legit potion]] = 0;
	availableClipArt[$item[Bright Water]] = 0;
	availableClipArt[$item[cold-filtered water]] = 0;
	availableClipArt[$item[graveyard snowglobe]] = 0;
	availableClipArt[$item[cool cat elixir]] = 0;
	availableClipArt[$item[potion of the captain's hammer]] = 0;
	availableClipArt[$item[potion of X-ray vision]] = 0;
	availableClipArt[$item[potion of the litterbox]] = 0;
	availableClipArt[$item[potion of animal rage]] = 0;
	availableClipArt[$item[potion of punctual companionship]] = 0;
	availableClipArt[$item[holy bomb, batman]] = 0;
	availableClipArt[$item[bobcat grenade]] = 0;
	availableClipArt[$item[chocolate frosted sugar bomb]] = 0;
	availableClipArt[$item[broken glass grenade]] = 0;
	availableClipArt[$item[noxious gas grenade]] = 0;
	availableClipArt[$item[skull with a fuse in it]] = 0;
	availableClipArt[$item[boozebomb]] = 0;
	availableClipArt[$item[4:20 bomb]] = 0;
	availableClipArt[$item[blunt icepick]] = 0;
	availableClipArt[$item[fluorescent lightbulb]] = 0;
	availableClipArt[$item[blammer]] = 0;
	availableClipArt[$item[clock-cleaning hammer]] = 0;
	availableClipArt[$item[hammerus]] = 0;
	availableClipArt[$item[broken clock]] = 0;
	availableClipArt[$item[dethklok]] = 0;
	availableClipArt[$item[glacial clock]] = 0;
	
	if(!have_skill(SCA)) {
		print("You don't have or have access to that skill at this time.");
		return;
	}
	
	if(!have_shop()) {
		print("You don't have a mall currently.");
		return;
	}
	
	if(!SCA.skill_is_usable()) {
		usesLeft = 0;
	}
	
	usesLeft = usesLeft - get_property("_clipartSummons").to_int();
	
	if(usesLeft == 0) {
		print("You have no more uses of 'Summon Clip Art' left for today.");
		return;
	}
	
	print("You have " + usesLeft + " uses of Summon Clip Art left today.");
	
    foreach it in availableClipArt
    {
        if (highestMallItem.mall_price() < currentMallValue = it.mall_price()) {
            highestMallItem = it;
			highestMallValue = currentMallValue;
		}
    }
	
	if (my_mp() < 6) {
		restore_mp(6);
	}
	
	for(int x = 0; x < usesLeft; x++) {
		cli_execute("create " + highestMallItem.name);
	}

	put_shop(highestMallValue, 0, usesLeft, highestMallItem);


	print("You put " + usesLeft + " " + highestMallItem.name + " in your mall at " + highestMallValue + " a piece.");
	return;
}