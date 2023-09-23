this.paint_orange_red_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.paint_orange_red";
		this.m.PreviewCraftable = this.new("scripts/items/misc/paint_orange_red_item");
		this.m.Cost = 25;
		local ingredients = [
			{
				Script = "scripts/items/misc/unhold_heart_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/paint_orange_red_item"));
	}

});

