this.fermented_unhold_heart_blueprint <- this.inherit("scripts/crafting/food_blueprint", {
	m = {},
	function create()
	{
		this.food_blueprint.create();
		this.m.ID = "blueprint.fermented_unhold_heart";
		this.m.PreviewCraftable = this.new("scripts/items/supplies/fermented_unhold_heart_item");
		local ingredients = [
			{
				Script = "scripts/items/supplies/wine_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/unhold_heart_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/supplies/fermented_unhold_heart_item"));
	}

});

