this.gold_mine_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Gold Mine";
		this.m.ID = "attached_location.gold_mine";
		this.m.Description = "A deep mine build atop a gold ore vein. This rare metal has a tendency to bring out the worst in people. Contributes gold ingots, miners, caravan hands, sellswords and thieves to the local town";
		this.m.Sprite = "world_gold_mine_01";
		this.m.SpriteDestroyed = "world_gold_mine_01_ruins";
	}

	function getSounds( _all = true )
	{
		local r = [];

		if (this.World.getTime().IsDaytime)
		{
			r = [
				{
					File = "ambience/settlement/mines_00.wav",
					Volume = 1.25,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/mines_01.wav",
					Volume = 1.25,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/mines_shoveling_00.wav",
					Volume = 1.25,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/mines_shoveling_01.wav",
					Volume = 1.25,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/mines_shoveling_02.wav",
					Volume = 1.25,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/mines_shoveling_03.wav",
					Volume = 1.25,
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

	function onUpdateProduce( _list )
	{
		_list.push("trade/legend_gold_dust_item");
		_list.push("trade/legend_gold_nugget_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("miner_background");
		_list.push("miner_background");
		_list.push("miner_background");
		_list.push("legend_ironmonger_background");
		_list.push("sellsword_background");
		_list.push("caravan_hand_background");
		_list.push("thief_background");
		_list.push("peddler_background");
	}

	function onUpdateShopList( _id, _list )
	{
		switch(_id)
		{
		case "building.marketplace":
			_list.push({
				R = 0,
				P = 1.0,
				S = "weapons/pickaxe"
			});
			_list.push({
				R = 40,
				P = 1.0,
				S = "weapons/military_pick"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "weapons/legend_hammer"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "trade/legend_gold_nugget_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/legend_gold_dust_item"
			});
			_list.push({
				R = 95,
				P = 1.0,
				S = "trade/gold_ingots_item"
			});
			_list.push({
				R = 90,
				P = 1.0,
				S = "loot/golden_chalice_item"
			});
			break;

		default:
			if (_id == "building.specialized_trader")
			{
			}
		}
	}

	function getNewResources()
	{
		return 2;
	}

});

