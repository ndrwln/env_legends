this.kraken_shield_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.kraken_shield";
		this.m.Type = this.Const.Items.ItemType.Shield;
		this.m.PreviewCraftable = this.new("scripts/items/shields/special/craftable_kraken_shield");
		this.m.Cost = 1000;
		local ingredients = [
			{
				Script = "scripts/items/misc/kraken_horn_plate_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/glowing_resin_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/shields/special/craftable_kraken_shield"));
	}

});

