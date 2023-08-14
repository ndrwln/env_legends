this.legend_cooking_spices_blueprint <- this.inherit("scripts/crafting/food_blueprint", {
	m = {},
	function create()
	{
		this.food_blueprint.create();
		this.m.ID = "blueprint.legend_cooking_spices";
		this.m.Type = this.Const.Items.ItemType.TradeGood | this.Const.Items.ItemType.Misc;
		this.m.PreviewCraftable = this.new("scripts/items/trade/legend_cooking_spices_trade_item");
		local ingredients = [
			{
				Script = "scripts/items/supplies/roots_and_berries_item",
				Num = 1
			},
			{
				Script = "scripts/items/trade/salt_item",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_camp_cook"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/trade/legend_cooking_spices_trade_item"));
		_stash.add(this.new("scripts/items/trade/legend_cooking_spices_trade_item"));
		_stash.add(this.new("scripts/items/trade/legend_cooking_spices_trade_item"));
		_stash.add(this.new("scripts/items/trade/legend_cooking_spices_trade_item"));
		_stash.add(this.new("scripts/items/trade/legend_cooking_spices_trade_item"));
		_stash.add(this.new("scripts/items/trade/legend_cooking_spices_trade_item"));
		_stash.add(this.new("scripts/items/trade/legend_cooking_spices_trade_item"));
	}

});

