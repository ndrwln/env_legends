this.legend_pie_blueprint <- this.inherit("scripts/crafting/food_blueprint", {
	m = {},
	function create()
	{
		this.food_blueprint.create();
		this.m.ID = "blueprint.legend_pie";
		this.m.PreviewCraftable = this.new("scripts/items/supplies/legend_pie_item");
		local ingredients = [
			{
				Script = "scripts/items/supplies/legend_fresh_fruit_item",
				Num = 1
			},
			{
				Script = "scripts/items/trade/legend_cooking_spices_trade_item",
				Num = 1
			},
			{
				Script = "scripts/items/supplies/legend_fresh_meat_item",
				Num = 1
			},
			{
				Script = "scripts/items/supplies/ground_grains_item",
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
		_stash.add(this.new("scripts/items/supplies/legend_pie_item"));
	}

});

