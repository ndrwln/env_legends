this.legend_tower_shield_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_tower_shield_blueprint";
		this.m.Type = this.Const.Items.ItemType.Shield;
		this.m.PreviewCraftable = this.new("scripts/items/shields/legend_tower_shield");
		this.m.PreviewCraftable.m.Name = "Company Tower Shield";
		this.m.Cost = 200;
		local ingredients = [
			{
				Script = "scripts/items/trade/quality_wood_item",
				Num = 3
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_woodworking"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/shields/legend_tower_shield");
		item.onPaintInCompanyColors();
		_stash.add(item);
	}

});

