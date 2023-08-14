this.scenario_combat_basics_orcs <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioBasicCombat::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
		this.m.Music = "music/credits.music";
		local clouds = this.Tactical.getWeather().createCloudSettings();
		clouds.MinClouds = 5;
		clouds.MaxClouds = 5;
		clouds.MinVelocity = 30.0;
		clouds.MaxVelocity = 50.0;
		clouds.MinAlpha = 0.66;
		clouds.MaxAlpha = 0.9;
		clouds.MinScale = 1.5;
		clouds.MaxScale = 3.0;
		this.Tactical.getWeather().buildCloudCover(clouds);
		this.Tactical.CameraDirector.addMoveToTileEvent(0, this.Tactical.getTile(16, 15 - 16 / 2), 0, null, null, 0, 2000);
		this.Sound.playAtmosphere("sounds/atmosphere/forest_01.wav", 0.75);
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.combat_basics");
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
		this.Tactical.getTileSquare(13, 15).removeObject();
		entity = this.Tactical.spawnEntity("scripts/entity/tactical/player", 13, 15 - 13 / 2);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/sackcloth"));
		items.equip(this.new("scripts/items/weapons/boar_spear"));
		this.Tactical.getTileSquare(13, 16).removeObject();
		entity = this.Tactical.spawnEntity("scripts/entity/tactical/player", 13, 16 - 13 / 2);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[
				1,
				"nasal_helmet"
			]
		]));
		items.equip(this.new("scripts/items/armor/leather_tunic"));
		items.equip(this.new("scripts/items/weapons/hand_axe"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		this.Tactical.getTileSquare(13, 14).removeObject();
		entity = this.Tactical.spawnEntity("scripts/entity/tactical/player", 13, 14 - 13 / 2);
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
		items.equip(this.new("scripts/items/weapons/noble_sword"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/orc_berserker", 19, 15 - 19 / 2);
		items = entity.getItems();
		items.equip(this.new("scripts/items/weapons/greenskins/orc_flail_2h"));
	}

	function initStash()
	{
		this.Stash.clear();
		this.Stash.setLocked(true);
	}

});

