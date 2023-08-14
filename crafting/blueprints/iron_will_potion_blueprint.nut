this.iron_will_potion_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.iron_will_potion";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/iron_will_potion_item");
		this.m.Cost = 200;
		local ingredients = [
			{
				Script = "scripts/items/misc/adrenaline_gland_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/ghoul_brain_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/iron_will_potion_item"));
	}

});

