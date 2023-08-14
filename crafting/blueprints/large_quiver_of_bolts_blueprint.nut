this.large_quiver_of_bolts_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.large_quiver_of_bolts";
		this.m.Type = this.Const.Items.ItemType.Accessory;
		this.m.PreviewCraftable = this.new("scripts/items/ammo/large_quiver_of_bolts");
		this.m.Cost = 350;
		local ingredients = [
			{
				Script = "scripts/items/misc/unhold_hide_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/ammo/large_quiver_of_bolts"));
	}

});

