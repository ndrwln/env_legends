this.fishing_huts_oriental_location <- this.inherit("scripts/entity/world/attached_location/fishing_huts_location", {
	m = {},
	function create()
	{
		this.fishing_huts_location.create();
		this.m.Sprite = "world_southern_fishing_huts";
		this.m.SpriteDestroyed = "world_southern_fishing_huts_ruins";
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/dried_fish_item");
		_list.push("supplies/legend_fresh_fish_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("fisherman_southern_background");
		_list.push("fisherman_southern_background");
		_list.push("fisherman_southern_background");
		_list.push("fisherman_southern_background");

		if (_gender)
		{
			_list.push("legend_qiyan_background");
		}
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/dried_fish_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/legend_fresh_fish_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/armor_parts_small_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/militia_spear"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "tools/throwing_net"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "tools/throwing_net"
			});
		}
	}

});

