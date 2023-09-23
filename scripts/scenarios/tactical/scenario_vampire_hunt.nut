this.scenario_vampire_hunt <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioLineBattle::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
		this.Tactical.Entities.makeEnemiesKnownToAI();
		local clouds = this.Tactical.getWeather().createCloudSettings();
		clouds.Type = this.getconsttable().CloudType.StaticFog;
		clouds.MinClouds = 12;
		clouds.MaxClouds = 18;
		clouds.MinAlpha = 0.25;
		clouds.MaxAlpha = 0.5;
		clouds.MinScale = 2.0;
		clouds.MaxScale = 3.0;
		this.Tactical.getWeather().buildCloudCover(clouds);
		local rain = this.Tactical.getWeather().createRainSettings();
		rain.MinDrops = 150;
		rain.MaxDrops = 150;
		rain.NumSplats = 50;
		rain.MinVelocity = 400.0;
		rain.MaxVelocity = 500.0;
		rain.MinAlpha = 0.75;
		rain.MaxAlpha = 1.0;
		rain.MinScale = 0.75;
		rain.MaxScale = 1.0;
		this.Tactical.getWeather().buildRain(rain);
		this.Tactical.getWeather().setAmbientLightingPreset(6);
		this.Tactical.getCamera().Level = 3;
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.test_hunting_grounds");
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
		entity = this.spawnEntity("scripts/entity/tactical/player", 12, 12, 14, 14);
		entity.setName(this.getRandomPlayerName());
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"kettle_hat"
			]
		]));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/greatsword"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 12, 12);
		entity.setName(this.getRandomPlayerName());
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
			]
		]));
		items.equip(this.new("scripts/items/armor/padded_leather"));
		items.equip(this.new("scripts/items/weapons/noble_sword"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 16, 16, 13, 13);
		entity.setName(this.getRandomPlayerName());
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"aketon_cap"
			]
		]));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/hand_axe"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 14, 14, 15, 15);
		entity.setName(this.getRandomPlayerName());
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"hood"
			]
		]));
		items.equip(this.new("scripts/items/armor/padded_surcoat"));
		items.equip(this.new("scripts/items/weapons/hunting_bow"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 16, 16, 16, 16);
		entity.setName(this.getRandomPlayerName());
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
			]
		]));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/warhammer"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 17, 17);
		entity.setName(this.getRandomPlayerName());
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"mail_coif"
			]
		]));
		items.equip(this.new("scripts/items/armor/coat_of_plates"));
		items.equip(this.new("scripts/items/weapons/winged_mace"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/enemies/skeleton_knight", 7, 7, 8, 17);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/skeleton_knight", 7, 7, 8, 17);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/skeleton_knight", 7, 7, 8, 17);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost", 25, 25, 10, 20);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost", 25, 25, 10, 20);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost", 25, 25, 10, 20);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost", 25, 25, 10, 20);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/withered_vampire", 2, 6, 26, 28);
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
		this.Stash.setLocked(false);
		this.Stash.add(this.new("scripts/items/weapons/dagger"));
		this.Stash.add(this.new("scripts/items/weapons/scramasax"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
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
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
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
				"aketon_cap"
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
				"aketon_cap"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
			]
		]));
		this.Stash.add(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
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
				"mail_coif"
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
				"kettle_hat"
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
				"kettle_hat"
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
				"flat_top_helmet"
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
	}

});

