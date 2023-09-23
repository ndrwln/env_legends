this.scenario_advanced_combat <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioAdvancedCombat::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
		this.m.Music = this.Const.Music.BeastsTracks;
		local weather = this.Tactical.getWeather();
		local rain = weather.createRainSettings();
		rain.MinDrops = 20;
		rain.MaxDrops = 20;
		rain.DropLifetime = 7000;
		rain.NumSplats = 0;
		rain.MinVelocity = 50.0;
		rain.MaxVelocity = 100.0;
		rain.MinAlpha = 1.0;
		rain.MaxAlpha = 1.0;
		rain.MinScale = 0.3;
		rain.MaxScale = 0.5;
		rain.ScaleDropsWithTime = true;
		rain.clearDropBrushes();
		rain.addDropBrush("leaf_01");
		rain.addDropBrush("leaf_02");
		rain.addDropBrush("leaf_03");
		rain.addDropBrush("leaf_04");
		weather.buildRain(rain);
		this.Tactical.getWeather().setAmbientLightingPreset(2);
		this.Tactical.CameraDirector.addJumpToTileEvent(0, this.Tactical.getTile(14, 12 - 5 / 2), 1, null, null, 0, 0);
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.autumn");
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

		for( local x = 12; x <= 16; x = x )
		{
			for( local y = 13; y <= 18; y = y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				tile.removeObject();
				y = ++y;
			}

			x = ++x;
		}

		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 15, 14, 17);
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"full_helm"
			]
		]));
		items.equip(this.new("scripts/items/armor/coat_of_plates"));
		items.equip(this.new("scripts/items/weapons/greatsword"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 15, 14, 17);
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"flat_top_helmet"
			]
		]));
		items.equip(this.new("scripts/items/armor/lamellar_harness"));
		items.equip(this.new("scripts/items/weapons/winged_mace"));
		items.equip(this.new("scripts/items/shields/kite_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 15, 14, 17);
		this.World.getPlayerRoster().add(entity);
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
		items.equip(this.new("scripts/items/weapons/noble_sword"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 15, 14, 17);
		this.World.getPlayerRoster().add(entity);
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
		items.equip(this.new("scripts/items/weapons/hand_axe"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 15, 14, 17);
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/named/golden_scale_armor"));
		items.equip(this.new("scripts/items/weapons/fighting_spear"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 15, 14, 17);
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"named/wolf_helmet"
			]
		]));
		items.equip(this.new("scripts/items/armor/named/black_leather_armor"));
		items.equip(this.new("scripts/items/weapons/crossbow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		items.addToBag(this.new("scripts/items/weapons/dagger"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 15, 14, 17);
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/padded_leather"));
		items.equip(this.new("scripts/items/weapons/war_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		items.addToBag(this.new("scripts/items/weapons/hatchet"));
		local e;
		e = this.spawnEnemy("scripts/entity/tactical/enemies/vampire");
		e.setFaction(this.Const.Faction.Undead);
		e.assignRandomEquipment();
		e = this.spawnEnemy("scripts/entity/tactical/enemies/vampire");
		e.setFaction(this.Const.Faction.Undead);
		e.assignRandomEquipment();
		e = this.spawnEnemy("scripts/entity/tactical/enemies/vampire_low");
		e.setFaction(this.Const.Faction.Undead);
		e.assignRandomEquipment();
		e = this.spawnEnemy("scripts/entity/tactical/enemies/vampire_low");
		e.setFaction(this.Const.Faction.Undead);
		e.assignRandomEquipment();
	}

	function spawnEntity( _script, _minX = 14, _maxX = 28, _minY = 2, _maxY = 28 )
	{
		local x = 0;
		local y = 0;

		while (1)
		{
			x = this.Math.rand(_minX, _maxX);
			y = this.Math.rand(_minY, _maxY) - x / 2;

			if (x < _minX && y < _minY - x / 2)
			{
				continue;
			}

			if (this.Tactical.getTile(x, y).Level == 3)
			{
				continue;
			}

			if (this.Tactical.getTile(x, y).IsEmpty)
			{
				break;
			}
		}

		return this.Tactical.spawnEntity(_script, x, y);
	}

	function spawnEnemy( _script, _minX = 5, _maxX = 27, _minY = 5, _maxY = 27 )
	{
		local x = 0;
		local y = 0;

		while (1)
		{
			x = this.Math.rand(_minX, _maxX);
			y = this.Math.rand(_minY, _maxY);

			if (x > 6 && x < 18 && y > 8 && y < 20)
			{
				continue;
			}

			y = y - x / 2;

			if (this.Tactical.getTile(x, y).Level == 3)
			{
				continue;
			}

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
		this.Stash.add(this.new("scripts/items/weapons/dagger"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/warhammer"));
		this.Stash.add(this.new("scripts/items/weapons/warhammer"));
		this.Stash.add(this.new("scripts/items/weapons/warhammer"));
		this.Stash.add(this.new("scripts/items/weapons/noble_sword"));
		this.Stash.add(this.new("scripts/items/weapons/noble_sword"));
		this.Stash.add(this.new("scripts/items/weapons/noble_sword"));
		this.Stash.add(this.new("scripts/items/weapons/noble_sword"));
		this.Stash.add(this.new("scripts/items/weapons/military_cleaver"));
		this.Stash.add(this.new("scripts/items/weapons/military_cleaver"));
		this.Stash.add(this.new("scripts/items/weapons/military_cleaver"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/tools/throwing_net"));
		this.Stash.add(this.new("scripts/items/tools/throwing_net"));
		this.Stash.add(this.new("scripts/items/tools/throwing_net"));
		this.Stash.add(this.new("scripts/items/tools/throwing_net"));
		this.Stash.add(this.new("scripts/items/tools/throwing_net"));
		this.Stash.add(this.new("scripts/items/tools/throwing_net"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/shields/wooden_shield"));
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
		this.Stash.add(this.new("scripts/items/armor/padded_leather"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/lamellar_harness"));
		this.Stash.add(this.new("scripts/items/armor/coat_of_plates"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
	}

});

