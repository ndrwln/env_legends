local gt = this.getroottable();

if (!("DLC" in gt.Const))
{
	gt.Const.DLC <- {};
	gt.Const.DLC.Mask <- 0;
}

if (!("Unhold" in gt.Const.DLC) || !this.Const.DLC.Unhold)
{
	this.Const.DLC.Unhold <- this.hasDLC(961930) && this.Const.Serialization.Version >= 46;

	if (this.Const.DLC.Unhold)
	{
		this.Const.DLC.Mask = this.Const.DLC.Mask | 4;
		this.Const.LoadingScreens.push("ui/screens/loading_screen_06.jpg");
		local tips = [
			"The frozen wasteland of the north is home to a giant beast not seen anywhere else.",
			"A Lindwurm is a wingless bipedal dragon resembling a large snake.",
			"There are different regional variants of the Unhold.",
			"Unholds can heal wounds quickly, even in combat.",
			"Trees move slowly.",
			"Alps feed on the fear and agony of people having nightmares.",
			"Explore the world to find legendary locations with legendary treasure.",
			"Two-handed maces excel in disabling single opponents.",
			"Axes are particularly effective against trees.",
			"A Schrat is a living tree, a being of bark and wood, with a mind truly alien.",
			"Use armor attachments to further improve and specialize the equipment of your men.",
			"A Hexe appears as a youthful lady with radiant beauty to those she enthralls.",
			"Hexen are known to strike ill-omened deals that people come to regret.",
			"A Hexe can curse one of your men to suffer the same wounds as she does.",
			"Webknechts inflict additional damage to targets trapped in their webs.",
			"Webknechts are more confident, the larger the group they are in.",
			"The Webknecht is a large arachnid that lives in sizable colonies in the dark areas of forests throughout the world.",
			"Collect trophies from slain beasts and have the taxidermist craft useful items from them.",
			"Selling trophies from slain beasts can be lucrative. You can always get new ones.",
			"Fencing swords are most powerful in the hands of characters with high initiative.",
			"Use throwing spears to destroy the shields of your most dangerous opponents from afar.",
			"Nachzehrers are found more often in the southern parts of the world.",
			"Alps are almost exclusively encountered at night.",
			"The further away from civilization, the more dangerous the beasts that roam the land.",
			"Potions, despite their colorful descriptions, are essentially drugs, and characters can get addicted to them.",
			"Overdosing on potions can lead to characters vomiting and getting sick.",
			"With the \'Beast Slayers\' origin you\'ll have an easier time tracking beasts and get more trophies from any of those you slay."
		];
		this.Const.TipOfTheDay.extend(tips);
		this.Const.Music.BeastsTracks.push("music/beasts_03.ogg");
		this.Const.Music.BattleTracks[7].push("music/beasts_03.ogg");
		this.Const.Music.WorldmapTracks.push("music/worldmap_10.ogg");
		this.Const.Music.WorldmapTracksGreaterEvil.push("music/worldmap_10.ogg");
		this.Const.Items.NamedWeapons.push("weapons/named/named_polehammer");
		this.Const.Items.NamedWeapons.push("weapons/named/named_fencing_sword");
		this.Const.Items.NamedWeapons.push("weapons/named/named_two_handed_mace");
		this.Const.Items.NamedWeapons.push("weapons/named/named_two_handed_flail");
		this.Const.Items.NamedWeapons.push("weapons/named/named_three_headed_flail");
		this.Const.Items.NamedWeapons.push("weapons/named/named_spetum");
		this.Const.Items.NamedMeleeWeapons.push("weapons/named/named_polehammer");
		this.Const.Items.NamedMeleeWeapons.push("weapons/named/named_fencing_sword");
		this.Const.Items.NamedMeleeWeapons.push("weapons/named/named_two_handed_mace");
		this.Const.Items.NamedMeleeWeapons.push("weapons/named/named_two_handed_flail");
		this.Const.Items.NamedMeleeWeapons.push("weapons/named/named_three_headed_flail");
		this.Const.Items.NamedMeleeWeapons.push("weapons/named/named_spetum");
	}
}

