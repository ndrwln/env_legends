this.legend_beer_blueprint <- this.inherit("scripts/crafting/food_blueprint", {
	m = {},
	function create()
	{
		this.food_blueprint.create();
		this.m.ID = "blueprint.legend_beer";
		this.m.PreviewCraftable = this.new("scripts/items/supplies/beer_item");
		local ingredients = [
			{
				Script = "scripts/items/supplies/ground_grains_item",
				Num = 2
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_alcohol_brewing"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/supplies/beer_item"));
	}

});

