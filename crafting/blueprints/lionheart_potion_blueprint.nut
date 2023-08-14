this.lionheart_potion_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.lionheart_potion";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/lionheart_potion_item");
		this.m.Cost = 150;
		local ingredients = [
			{
				Script = "scripts/items/misc/ghoul_teeth_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/poison_gland_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/parched_skin_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/lionheart_potion_item"));
	}

});

