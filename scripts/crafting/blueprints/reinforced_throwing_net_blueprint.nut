this.reinforced_throwing_net_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.reinforced_net";
		this.m.Type = this.Const.Items.ItemType.Weapon;
		this.m.PreviewCraftable = this.new("scripts/items/tools/reinforced_throwing_net");
		this.m.Cost = 50;
		local ingredients = [
			{
				Script = "scripts/items/tools/throwing_net",
				Num = 1
			},
			{
				Script = "scripts/items/misc/spider_silk_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/reinforced_throwing_net"));
	}

});

