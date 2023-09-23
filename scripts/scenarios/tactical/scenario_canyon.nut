this.scenario_canyon <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioLineBattle::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
		this.m.Music = "music/undead_01.music";
		local entity;

		for( local i = 0; i != 9; i = i )
		{
			entity = this.spawnEntity("scripts/entity/tactical/player");
			entity.assignRandomEquipment();
			entity.kill();
			i = ++i;
		}

		local clouds = this.Tactical.getWeather().createCloudSettings();
		clouds.Type = this.getconsttable().CloudType.StaticFog;
		clouds.MinClouds = 12;
		clouds.MaxClouds = 18;
		clouds.MinAlpha = 0.25;
		clouds.MaxAlpha = 0.5;
		clouds.MinScale = 2.0;
		clouds.MaxScale = 3.0;
		clouds.Color = this.createColor("#cfb693");
		this.Tactical.getWeather().buildCloudCover(clouds);
		this.Tactical.getCamera().Level = 3;
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.canyon");
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
		entity = this.spawnEntity("scripts/entity/tactical/player", 3, 7, 3, 7);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"kettle_hat"
			]
		]));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/greatsword"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 3, 7, 3, 7);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
			]
		]));
		items.equip(this.new("scripts/items/armor/padded_leather"));
		items.equip(this.new("scripts/items/weapons/falchion"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 3, 7, 3, 7);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
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
		entity = this.spawnEntity("scripts/entity/tactical/player", 3, 7, 3, 7);
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
		items.equip(this.new("scripts/items/weapons/hunting_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 3, 7, 3, 7);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"helmet_with_neckguard"
			]
		]));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/military_cleaver"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 3, 7, 3, 7);
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
		items.equip(this.new("scripts/items/weapons/winged_mace"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghost");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul");
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
			local tile = this.Tactical.getTile(x, y);

			if (tile.Level > 1)
			{
				continue;
			}

			if (tile.IsEmpty)
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
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
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
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
	}

});

