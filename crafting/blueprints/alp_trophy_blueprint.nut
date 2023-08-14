this.alp_trophy_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.alp_trophy";
		this.m.Type = this.Const.Items.ItemType.Accessory;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/alp_trophy_item");
		this.m.Cost = 300;
		local ingredients = [
			{
				Script = "scripts/items/misc/parched_skin_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/third_eye_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/petrified_scream_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/alp_trophy_item"));
	}

});

