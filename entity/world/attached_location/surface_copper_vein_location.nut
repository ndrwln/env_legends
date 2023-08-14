this.surface_copper_vein_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Surface Copper Vein";
		this.m.ID = "attached_location.surface_copper_vein";
		this.m.Description = "A mining camp has been set up to mine a surfaced copper vein and smelt the ore into ingots on the spot.";
		this.m.Sprite = "world_copper_vein_01";
		this.m.SpriteDestroyed = "world_copper_vein_01_ruins";
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
		_list.push("trade/copper_ingots_item");
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
		_list.push("caravan_hand_background");
	}

	function onUpdateShopList( _id, _list )
	{
		switch(_id)
		{
		case "building.marketplace":
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/pickaxe"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/legend_hammer"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/copper_ingots_item"
			});
			_list.push({
				R = 25,
				P = 1.0,
				S = "supplies/armor_parts_small_item"
			});
			_list.push({
				R = 25,
				P = 1.0,
				S = "supplies/armor_parts_item"
			});
			break;

		default:
			if (_id == "building.specialized_trader")
			{
			}
		}
	}

});

