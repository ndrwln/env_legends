this.large_mountains_fort <- this.inherit("scripts/entity/world/settlement", {
	m = {},
	function create()
	{
		this.settlement.create();
		this.m.Name = this.getRandomName([
			"Hohenfeste",
			"Wolfenfeste",
			"Wolfenstein",
			"Felsfeste",
			"Eisenfeste",
			"Grollfeste",
			"Grubenfeste",
			"Donnerfeste",
			"Erzfeste",
			"Gronenfeste",
			"Sattelfeste",
			"Kammfeste",
			"Turmfeste",
			"Windfeste",
			"Adlerfeste",
			"Brunwald",
			"Heldenfeste",
			"Wurmfeste",
			"Schwertfeste",
			"Lanzenfeste",
			"Falkenstein",
			"Flechtenstein",
			"Himmelsfeste",
			"Steinturm",
			"Gipfelfeste",
			"Zugfeste",
			"Granitfeste",
			"Zinnenfeste",
			"Wackersfeste",
			"Fernsichtfeste",
			"Wildbergfeste"
		]);
		this.m.DraftList = [
			"apprentice_background",
			"apprentice_background",
			"brawler_background",
			"caravan_hand_background",
			"caravan_hand_background",
			"gambler_background",
			"gravedigger_background",
			"graverobber_background",
			"juggler_background",
			"mason_background",
			"mason_background",
			"messenger_background",
			"militia_background",
			"militia_background",
			"militia_background",
			"miner_background",
			"miner_background",
			"miner_background",
			"ratcatcher_background",
			"vagabond_background",
			"witchhunter_background",
			"adventurous_noble_background",
			"bastard_background",
			"deserter_background",
			"deserter_background",
			"disowned_noble_background",
			"retired_soldier_background",
			"retired_soldier_background",
			"sellsword_background",
			"sellsword_background",
			"sellsword_background",
			"squire_background",
			"squire_background",
			"swordmaster_background",
			"cripple_background",
			"hedge_knight_background",
			"hedge_knight_background",
			"paladin_background",
			"apprentice_background",
			"apprentice_background",
			"brawler_background",
			"caravan_hand_background",
			"caravan_hand_background",
			"gambler_background",
			"gravedigger_background",
			"graverobber_background",
			"juggler_background",
			"mason_background",
			"mason_background",
			"messenger_background",
			"militia_background",
			"militia_background",
			"militia_background",
			"miner_background",
			"miner_background",
			"miner_background",
			"ratcatcher_background",
			"vagabond_background",
			"witchhunter_background",
			"female_adventurous_noble_background",
			"bastard_background",
			"deserter_background",
			"deserter_background",
			"disowned_noble_background",
			"retired_soldier_background",
			"retired_soldier_background",
			"sellsword_background",
			"sellsword_background",
			"sellsword_background",
			"squire_background",
			"squire_background",
			"swordmaster_background",
			"cripple_background",
			"hedge_knight_background",
			"hedge_knight_background",
			"legend_ironmonger_background",
			"legend_blacksmith_background",
			"assassin_background"
		];
		this.m.StablesList = [
			"legend_donkey_background",
			"legend_horse_rouncey",
			"legend_horse_destrier",
			"legend_horse_courser"
		];
		this.m.UIDescription = "A massive stone citadel built into the steep mountains";
		this.m.Description = "This massive stone citadel is built into the steep mountains. A large number of men are stationed here to hold a firm grip on the land.";
		this.m.UIBackgroundCenter = "ui/settlements/stronghold_03";
		this.m.UIBackgroundLeft = "ui/settlements/bg_houses_03_left";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_03_right";
		this.m.UIRampPathway = "ui/settlements/ramp_01_cobblestone";
		this.m.UISprite = "ui/settlement_sprites/stronghold_03.png";
		this.m.Sprite = "world_stronghold_03";
		this.m.Lighting = "world_stronghold_03_light";
		this.m.Rumors = this.Const.Strings.RumorsMiningSettlement;
		this.m.Culture = this.Const.World.Culture.Neutral;
		this.m.IsMilitary = true;
		this.m.Size = 3;
		this.m.HousesType = 3;
		this.m.HousesMin = 3;
		this.m.HousesMax = 4;
		this.m.AttachedLocationsMax = 5;
	}

	function onBuild( _settings )
	{
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/crowd_building"), 5);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/marketplace_building"), 2);

		if (::Legends.Mod.ModSettings.getSetting("StackCitadels").getValue())
		{
			local ALL = [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest
			];
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/training_hall_building"));
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/fletcher_building"));
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/stone_watchtower_location", ALL, [], 5, true, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fortified_outpost_location", ALL, [], 1, true, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fletchers_hut_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/ore_smelters_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/blast_furnace_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/workshop_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/goat_herd_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/wheat_fields_location", [
				this.Const.World.TerrainType.Plains
			], [], 0, false, true, true);
			return;
		}

		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/tavern_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/training_hall_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));

		if (this.Math.rand(1, 100) <= 60)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/workshop_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 1, true);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/workshop_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 1, true);
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/goat_herd_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 1);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/wheat_fields_location", [
				this.Const.World.TerrainType.Plains
			], [], 1);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/goat_herd_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 1);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/wheat_fields_location", [
				this.Const.World.TerrainType.Plains
			], [], 1);
		}

		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/ore_smelters_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], [
			this.Const.World.TerrainType.Hills
		]);
		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/blast_furnace_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], [
			this.Const.World.TerrainType.Hills
		]);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/workshop_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], []);
	}

});

