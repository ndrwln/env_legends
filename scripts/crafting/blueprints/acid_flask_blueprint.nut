this.acid_flask_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.acid_flask";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/tools/acid_flask_item");
		this.m.Cost = 50;
		local ingredients = [
			{
				Script = "scripts/items/misc/lindwurm_blood_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/acid_flask_item"));
	}

});

