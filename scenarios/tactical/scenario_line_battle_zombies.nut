this.scenario_line_battle_zombies <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioLineBattle::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
		this.m.Music = this.Const.Music.UndeadTracks;
		local weather = this.Tactical.getWeather();
		this.Tactical.Entities.makeEnemiesKnownToAI();
		local rain = weather.createRainSettings();
		rain.MinDrops = 300;
		rain.MaxDrops = 300;
		rain.NumSplats = 0;
		rain.MinVelocity = 900.0;
		rain.MaxVelocity = 1200.0;
		rain.MinAlpha = 0.5;
		rain.MaxAlpha = 1.0;
		rain.MinScale = 0.5;
		rain.MaxScale = 1.0;
		rain.clearDropBrushes();
		rain.addDropBrush("rain_03");
		rain.Direction = this.createVec(-0.45, -0.55);
		weather.buildRain(rain);
		local clouds = weather.createCloudSettings();
		clouds.Type = this.getconsttable().CloudType.Custom;
		clouds.MinClouds = 150;
		clouds.MaxClouds = 150;
		clouds.MinVelocity = 400.0;
		clouds.MaxVelocity = 500.0;
		clouds.MinAlpha = 0.6;
		clouds.MaxAlpha = 1.0;
		clouds.MinScale = 1.0;
		clouds.MaxScale = 4.0;
		clouds.Sprite = "wind_01";
		clouds.RandomizeDirection = false;
		clouds.RandomizeRotation = false;
		clouds.Direction = this.createVec(-1.0, -0.7);
		weather.buildCloudCover(clouds);
		this.Sound.setAmbience(0, this.Const.SoundAmbience.Blizzard, this.Const.Sound.Volume.Ambience, 0);
		this.Tactical.getCamera().Level = 1;
		this.Tactical.CameraDirector.addMoveToTileEvent(0, this.Tactical.getTile(15, 14 - 15 / 2), 1, null, null, 0, 100);
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.snow");
		local minX = testMap.getMinX();
		local minY = testMap.getMinY();
		this.Tactical.resizeScene(minX, minY);
		testMap.fill({
			X = 0,
			Y = 0,
			W = minX,
			H = minY
		}, null);
	}

	function initEntities()
	{
		local entity;
		local items;
		entity = this.spawnEntity("scripts/entity/tactical/player", 12, 12, 15, 15);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"kettle_hat"
			]
		]));
		items.equip(this.new("scripts/items/armor/padded_leather"));
		items.equip(this.new("scripts/items/weapons/billhook"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 12, 12, 13, 13);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/leather_tunic"));
		items.equip(this.new("scripts/items/weapons/billhook"));
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"hood"
			]
		]));
		items.addToBag(this.new("scripts/items/weapons/dagger"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 11, 11, 14, 14);
		entity.setFaction(this.Const.Faction.Player);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/sackcloth"));
		items.equip(this.new("scripts/items/weapons/short_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		items.addToBag(this.new("scripts/items/weapons/dagger"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 11, 11, 15, 15);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"aketon_cap"
			]
		]));
		items.equip(this.new("scripts/items/armor/gambeson"));
		items.equip(this.new("scripts/items/weapons/crossbow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		items.addToBag(this.new("scripts/items/weapons/dagger"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 11, 11);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"kettle_hat"
			]
		]));
		items.equip(this.new("scripts/items/armor/lamellar_harness"));
		items.equip(this.new("scripts/items/weapons/greatsword"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 12, 12);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"nasal_helmet"
			]
		]));
		items.equip(this.new("scripts/items/armor/padded_leather"));
		items.equip(this.new("scripts/items/weapons/noble_sword"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 13, 13);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/hand_axe"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 14, 14);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"hood"
			]
		]));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/boar_spear"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 15, 15);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"nasal_helmet"
			]
		]));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/warhammer"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 16, 16);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"hood"
			]
		]));
		items.equip(this.new("scripts/items/armor/padded_surcoat"));
		items.equip(this.new("scripts/items/weapons/winged_mace"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 17, 17);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"mail_coif"
			]
		]));
		items.equip(this.new("scripts/items/armor/coat_of_plates"));
		items.equip(this.new("scripts/items/weapons/greatsword"));
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie", 19, 19, 11, 11);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 19, 19, 12, 12);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 19, 19, 13, 13);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie", 19, 19, 14, 14);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_knight", 19, 19, 15, 15);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie", 19, 19, 16, 16);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 19, 19, 17, 17);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 20, 20, 11, 11);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 20, 20, 12, 12);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 20, 20, 13, 13);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie", 20, 20, 14, 14);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_knight", 20, 20, 15, 15);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 20, 20, 16, 16);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie", 20, 20, 17, 17);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/necromancer", 21, 21, 14, 14);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_yeoman", 21, 21, 15, 15);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_knight_bodyguard", 21, 21, 16, 16);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/zombie_knight_bodyguard", 21, 21, 13, 13);
		entity.setFaction(this.Const.Faction.Undead);
		entity.assignRandomEquipment();
	}

	function spawnEntity( _script, _minX = 10, _maxX = 28, _minY = 3, _maxY = 28 )
	{
		local x = 0;
		local y = 0;
		local n = 0;

		while (1)
		{
			x = this.Math.rand(_minX, _maxX);
			y = this.Math.rand(_minY, _maxY) - x / 2;

			if (this.Tactical.getTile(x, y).IsOccupiedByActor)
			{
				continue;
			}

			this.Tactical.getTile(x, y).removeObject();

			if (this.Tactical.getTile(x, y).IsEmpty)
			{
				break;
			}
		}

		return this.Tactical.spawnEntity(_script, x, y);
	}

	function initStash()
	{
		this.Stash.clear();
		this.Stash.resize(117);
		this.Stash.setLocked(false);
		this.Stash.add(this.new("scripts/items/weapons/dagger"));
		this.Stash.add(this.new("scripts/items/weapons/scramasax"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/throwing_axe"));
		this.Stash.add(this.new("scripts/items/weapons/throwing_axe"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/warhammer"));
		this.Stash.add(this.new("scripts/items/weapons/warhammer"));
		this.Stash.add(this.new("scripts/items/weapons/shortsword"));
		this.Stash.add(this.new("scripts/items/weapons/shortsword"));
		this.Stash.add(this.new("scripts/items/weapons/falchion"));
		this.Stash.add(this.new("scripts/items/weapons/falchion"));
		this.Stash.add(this.new("scripts/items/weapons/arming_sword"));
		this.Stash.add(this.new("scripts/items/weapons/arming_sword"));
		this.Stash.add(this.new("scripts/items/weapons/military_cleaver"));
		this.Stash.add(this.new("scripts/items/weapons/military_cleaver"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/militia_spear"));
		this.Stash.add(this.new("scripts/items/weapons/militia_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/flail"));
		this.Stash.add(this.new("scripts/items/weapons/flail"));
		this.Stash.add(this.new("scripts/items/weapons/flail"));
		this.Stash.add(this.new("scripts/items/weapons/short_bow"));
		this.Stash.add(this.new("scripts/items/weapons/short_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/shields/wooden_shield"));
		this.Stash.add(this.new("scripts/items/shields/wooden_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"hood"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"aketon_cap"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"full_aketon_cap"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"nasal_helmet"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"padded_nasal_helmet"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"nasal_helmet_with_mail"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"mail_coif"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"closed_mail_coif"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"reinforced_mail_coif"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"kettle_hat"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"padded_kettle_hat"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"kettle_hat_with_mail"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"flat_top_helmet"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"flat_top_with_mail"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"full_helm"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"full_helm"
			]
		]));
		this.Stash.add(this.new("scripts/items/armor/padded_surcoat"));
		this.Stash.add(this.new("scripts/items/armor/gambeson"));
		this.Stash.add(this.new("scripts/items/armor/gambeson"));
		this.Stash.add(this.new("scripts/items/armor/padded_leather"));
		this.Stash.add(this.new("scripts/items/armor/padded_leather"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/lamellar_harness"));
		this.Stash.add(this.new("scripts/items/armor/coat_of_plates"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
	}

});

