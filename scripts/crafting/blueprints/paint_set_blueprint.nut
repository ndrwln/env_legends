this.paint_set_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.paint_set";
		this.m.PreviewCraftable = this.new("scripts/items/misc/paint_set_item");
		this.m.Cost = 50;
		local ingredients = [
			{
				Script = "scripts/items/misc/paint_black_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/paint_white_green_yellow_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/paint_orange_red_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/paint_set_item"));
	}

});

