this.ghoul_trophy_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.ghoul_trophy";
		this.m.Type = this.Const.Items.ItemType.Accessory;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/ghoul_trophy_item");
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/misc/ghoul_teeth_item",
				Num = 2
			},
			{
				Script = "scripts/items/misc/ghoul_horn_item",
				Num = 2
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/ghoul_trophy_item"));
	}

});

