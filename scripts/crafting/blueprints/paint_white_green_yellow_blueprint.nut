this.paint_white_green_yellow_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.paint_white_green_yellow";
		this.m.PreviewCraftable = this.new("scripts/items/misc/paint_white_green_yellow_item");
		this.m.Cost = 25;
		local ingredients = [
			{
				Script = "scripts/items/misc/ghoul_horn_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/poison_gland_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/paint_white_green_yellow_item"));
	}

});

