this.mushroom_grove_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Mushroom Grove";
		this.m.ID = "attached_location.mushroom_grove";
		this.m.Description = "Hidden in the mud and reed, the expert gatherer can find groves and caves full of precious mushrooms like these.";
		this.m.Sprite = "world_mushroom_grove_01";
		this.m.SpriteDestroyed = "world_mushroom_grove_01_ruins";
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/pickled_mushrooms_item");
		_list.push("trade/legend_cooking_spices_trade_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("cultist_background");
		_list.push("cultist_background");
		_list.push("flagellant_background");
		_list.push("wildman_background");
		_list.push("legend_herbalist_background");
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/pickled_mushrooms_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "armor/apron"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "weapons/legend_sickle"
			});
			_list.push({
				R = 90,
				P = 1.0,
				S = "tents/tent_gather"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/legend_shovel"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "supplies/medicine_item"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "accessory/berserker_mushrooms_item"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "accessory/legend_apothecary_mushrooms_item"
			});

			if (this.Const.DLC.Wildmen)
			{
				_list.push({
					R = 30,
					P = 1.0,
					S = "weapons/legend_cat_o_nine_tails"
				});
			}

			if (_id == "building.weaponsmith")
			{
				_list.push({
					R = 30,
					P = 1.0,
					S = "weapons/named/legend_named_sickle"
				});
				_list.push({
					R = 30,
					P = 1.0,
					S = "weapons/named/legend_named_shovel"
				});
			}
		}
	}

});

