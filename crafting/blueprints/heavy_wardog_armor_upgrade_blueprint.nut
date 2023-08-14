this.heavy_wardog_armor_upgrade_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.heavy_wardog_armor_upgrade";
		this.m.Type = this.Const.Items.ItemType.Armor;
		this.m.PreviewCraftable = this.new("scripts/items/misc/wardog_heavy_armor_upgrade_item");
		this.m.Cost = 150;
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
		_stash.add(this.new("scripts/items/misc/wardog_heavy_armor_upgrade_item"));
	}

});

