this.wheat_fields_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Wheat Fields";
		this.m.ID = "attached_location.wheat_fields";
		this.m.Description = "Golden wheat can be seen glistening in the sun from afar. Many people from the nearby settlement work here. Contributes bread, grains, poridge, farmhands, daytalers, millers and bakers to the local town.";
		this.m.Sprite = "world_wheat_farm_01";
		this.m.SpriteDestroyed = "world_wheat_farm_01_ruins";
	}

	function getSounds( _all = true )
	{
		local r = [];

		if (this.World.getTime().IsDaytime)
		{
			r = [
				{
					File = "ambience/buildings/market_chicken_00.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/buildings/market_chicken_01.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/buildings/market_chicken_02.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/buildings/market_chicken_04.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/buildings/market_chicken_05.wav",
					Volume = 1.0,
					Pitch = 1.0
				}
			];

			foreach( s in r )
			{
				s.Volume *= this.Const.Sound.Volume.Ambience / this.Const.Sound.Volume.AmbienceOutsideSettlement;
			}
		}

		return r;
	}

	function onBuild()
	{
		local myTile = this.getTile();
		local num = 0;

		for( local i = 0; i != 6; i = i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(i);

				if (nextTile.IsOccupied || nextTile.HasRoad)
				{
				}
				else if (nextTile.Type != this.Const.World.TerrainType.Plains && nextTile.Type != this.Const.World.TerrainType.Tundra && nextTile.Type != this.Const.World.TerrainType.Steppe)
				{
				}
				else
				{
					if (this.Math.rand(1, 100) <= 50)
					{
						nextTile.clear();
						nextTile.spawnDetail("world_wheat_field_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
						num = ++num;
						num = num;
					}

					if (num >= 2)
					{
						break;
					}
				}
			}

			i = ++i;
		}

		return true;
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/ground_grains_item");
		_list.push("supplies/bread_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("farmhand_background");
		_list.push("farmhand_background");
		_list.push("daytaler_background");
		_list.push("daytaler_background");
		_list.push("miller_background");
		_list.push("miller_background");

		if (_gender)
		{
			_list.push("female_farmhand_background");
			_list.push("female_daytaler_background");
			_list.push("female_miller_background");
		}
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/bread_item"
			});
			_list.push({
				R = 1,
				P = 1.0,
				S = "supplies/ground_grains_item"
			});
			_list.push({
				R = 5,
				P = 1.0,
				S = "supplies/legend_porridge_item"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/straw_hat"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/pitchfork"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "weapons/legend_wooden_pitchfork"
			});
			_list.push({
				R = 25,
				P = 1.0,
				S = "weapons/legend_scythe"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "weapons/hooked_blade"
			});
		}
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
	}

	function getNewResources()
	{
		return 2;
	}

});

