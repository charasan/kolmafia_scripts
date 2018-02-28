# KoLMafia ASH Scripts
Some ASH scripts for KOLMafia I whipped up based on my style of play.
If they suite you as well, feel free to use them.

The syntax highlighting script (for Notepad++) is one I found and updated from an old forum post.
I adjusted it to work with a dark theme - it was painful to look at otherwise.

The scripts here work as follows:
### AutoAutosellAvatarPotions.ash
This one is usually a mess, as I sometimes alter to go along with a current whim.

The original is supposed to autosell all avatar potions, gained from owning a Monster Manuel, in your inventory. I got annoyed at stockpiling these up with no easy sell, since they're not separate in the main sell page. You either have to go to the bottom of your (sometimes very large) inventory page and right-click to autosell them easily, or know them by name on the sell page.

This script knows how to pick them out from your inventory and sells them for you. Easy cleanup!

_**This one needs some work to make it universal. Currently adapted for my personal use**_

### CheckDisplayCase.ash
A friend in my clan got me hooked on being a Display Case completionist. When I first started, I easily spent a whole day just filtering through my owned items, checking them vs another screen that showed my display case to see if I had the item yet. Annoying, and who has the time? Some scripts exist that help with this, but the ones I've seen make you create a database of ALL items to decide the rule for handling them.

My script simply compares what's in your inventory to what's in your display case. If you don't have it in the DC yet, you get a message in the gCLI telling you what you can add. It purposely does not add them for you, though. Currently takes a boolean arguement, true will include armor and weapons tab items, false will not. Also filters out several item categories for various reasons, as well specific IotM and other rare items for my case.

_**This one needs some work to make it universal. Currently adapted for my personal use**_

### ClipArtMall.ash
This is for people with the Tome of Clip Art. Assuming you have access to the skill (out of standard), and you have a mall, this script checks how many castings you have for the day. If it's more than 1, it will check each possible item vs its current mall value, select the current highest selling item, summon the item in question for you, and automatically put it up for sale in the mall at the current high price.

This script checks beforehand how many castings you have left, so you can summon one or two items manually and still use this without worry. Also, it only sells the items you summon - if you have more than in your inventory, those will be ignored.
