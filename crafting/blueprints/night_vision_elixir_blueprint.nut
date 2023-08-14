this.night_vision_elixir_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.night_vision_elixir";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/night_vision_elixir_item");
		this.m.Cost = 350;
		local ingredients = [
			{
				Script = "scripts/items/misc/third_eye_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/witch_hair_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/night_vision_elixir_item"));
	}

});

