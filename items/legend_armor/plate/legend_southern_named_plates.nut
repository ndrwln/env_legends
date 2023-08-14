this.legend_southern_named_plates <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_southern_named_plates";
		this.m.Name = "Famed Southern plates";
		this.m.NameList = [
			"Beast",
			"Berserker",
			"Wolf",
			"Predator",
			"Hunter\'s Mask",
			"Hag Bane",
			"Witch\'s Doom",
			"Hag\'s End",
			"Curse Lifter",
			"Jinx Helm",
			"Decorated",
			"Ribboned",
			"Splinted",
			"Blazing Dome",
			"Nomad\'s Crown",
			"Clan Helmet",
			"Highland Helm",
			"Faceguard",
			"Owl",
			"Ward",
			"Headguard",
			"Protector",
			"Sea Raider",
			"Chieftain",
			"Engraved",
			"Face of the North",
			"Metal Skull",
			"Tribal Visage",
			"Pillager Gaze",
			"Bladed",
			"Horned",
			"Protector",
			"Steel Countenance",
			"Lizard",
			"Dragon\'s Dome",
			"Ward",
			"Dead Man\'s Head",
			"Seance\'s Skull",
			"Faith",
			"Redemption",
			"Pennance",
			"Rapture",
			"Guardian",
			"Hope",
			"Bullwark",
			"Bastion",
			"Breakers End",
			"The Summit",
			"The Wall",
			"The Halo",
			"The Swan Toad",
			"Bufo Bufo",
			"Treefrog",
			"Spadefoot",
			"Stechhelm",
			"Newt",
			"Triturust",
			"Ranid",
			"The Play",
			"Folly\'s Friend",
			"Fool\'s crown",
			"Jolly Folly",
			"Knightly",
			"Golden Crest",
			"Vizier\'s Pride",
			"Sun Veil",
			"Gilder\'s Pride",
			"Gilder\'s Visage",
			"The Masque",
			"Harlequin\'s Visage",
			"The Silent Shroud",
			"Reaper\'s Mirth",
			"The Dawning Hope",
			"Shattered Mirage",
			"Maker\'s Mark",
			"Gluttonous",
			"King\'s Bane",
			"Purifier\'s",
			"Long Grasp",
			"The Settling",
			"The Quickening",
			"Mother\'s Loss",
			"Noble\'s Demise",
			"Kingslayer",
			"Deathmark",
			"Fearblocker",
			"Deathgrip",
			"Fecund",
			"Sanctified",
			"Witch Hammer",
			"Lumbering",
			"Proctor\'s Gaze",
			"All Seeing",
			"Watchful",
			"The Rising",
			"Trinity",
			"Diabolica",
			"Warthirst",
			"Marshall\'s Cry",
			"Hopeless",
			"Struggling",
			"Umbra",
			"Optimist\'s Demise",
			"Death\'s Clutch",
			"Purified",
			"Hardpoint",
			"Shattering",
			"Begger\'s",
			"Gothic",
			"Noble\'s Burden",
			"Dark Veil",
			"Insurmountable",
			"Afflicted",
			"Lucem",
			"Martyr\'s Call",
			"Builder\'s",
			"Gambler\'s Pride",
			"Shieldmaiden\'s",
			"Godbane",
			"Madman\'s Unitatis",
			"Stalwart",
			"Mistwalker\'s",
			"Stalker\'s",
			"Mithering Doom",
			"Stonewall",
			"The Setting",
			"Crypt Keeper\'s",
			"Last Gasp",
			"Calor",
			"Putrid",
			"Doloris Capere",
			"The Falling",
			"Solemn Vow",
			"Deacon\'s Lament",
			"Agile",
			"Curse Bringer",
			"Plague Bringer",
			"Tamer\'s",
			"Chalice",
			"Handmaiden\'s",
			"Slayer\'s",
			"Deathmarch",
			"Bountiful",
			"Mindfire",
			"Swatter",
			"Ancient",
			"Wanderer\'s",
			"Riposte",
			"Profiteer\'s",
			"Bane",
			"Stonewatcher\'s",
			"The Shattering",
			"Dishonoured",
			"Martial",
			"Cataclysmic",
			"Mind\'s Cloister",
			"Bloated",
			"Beacon",
			"Temple",
			"Chant",
			"Chanter\'s",
			"Pessimist\'s Blight",
			"Crusader\'s Redoubt",
			"Gilder\'s Shining Ward",
			"Gilder\'s Skin",
			"Suncloak",
			"Snakeskin",
			"Blazing Mail",
			"Suntouched Harness",
			"Shining Hauberk",
			"Armor of the Scorpion King"
		];
		this.m.Description = "Ancient knowledge has been used when smithing this unique set of armor. Its light mail overlapped with golden splints offers high protection with manageable encumberment.";
		this.m.ArmorDescription = "overlapped with golden splints offering high protection with manageable encumberment.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 9000;
		this.m.Condition = 210;
		this.m.ConditionMax = 210;
		this.m.StaminaModifier = -25;
		this.m.ItemType = this.m.ItemType;
		this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_named_plate" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_named_plate" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_named_plate" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_named_plate" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_named_plate" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_named_plate" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(23, 26) * -1;
		this.m.Condition = this.Math.rand(210, 230);
		this.m.ConditionMax = this.m.Condition;
	}

});

