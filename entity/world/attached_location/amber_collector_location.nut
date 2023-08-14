this.amber_collector_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Amber Collector";
		this.m.ID = "attached_location.amber_collector";
		this.m.Description = "The collectors living in these huts search for valuable amber shards along the shore. Contributes amber and peddlers to the local town";
		this.m.Sprite = "world_amber_collector_01";
		this.m.SpriteDestroyed = "world_amber_collector_01_ruins";
		this.m.IsConnected = false;
	}

	function onUpdateProduce( _list )
	{
		_list.push("trade/amber_shards_item");
		_list.push("trade/legend_seashells_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("peddler_background");
		_list.push("caravan_hand_background");
		_list.push("thief_background");
		_list.push("peddler_background");
		_list.push("caravan_hand_background");
		_list.push("thief_background");
	}

	function onUpdateShopList( _id, _list )
	{
		switch(_id)
		{
		case "building.marketplace":
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/amber_shards_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/legend_seashells_item"
			});
			_list.push({
				R = 95,
				P = 1.0,
				S = "tents/tent_enchant"
			});
			break;

		default:
			if (_id == "building.specialized_trader")
			{
			}
		}
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
	}

});

