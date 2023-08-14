this.miracle_drug_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.miracle_drug";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/misc/miracle_drug_item");
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/misc/unhold_heart_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/mysterious_herbs_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/miracle_drug_item"));
	}

});

