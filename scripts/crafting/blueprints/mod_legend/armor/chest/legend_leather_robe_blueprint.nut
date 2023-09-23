this.legend_leather_robe_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_leather_robe_blueprint";
		this.m.Type = this.Const.Items.ItemType.Armor;
		this.m.PreviewCraftable = this.new("scripts/items/legend_armor/plate/legend_armor_cult_armor");
		this.m.Cost = 150;
		local ingredients = [
			{
				Script = "scripts/items/trade/furs_item",
				Num = 1
			},
			{
				Script = "scripts/items/trade/cloth_rolls_item",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_specialist_cult_armor"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/legend_armor/plate/legend_armor_cult_armor");
		item.setVariant(this.m.PreviewCraftable.m.Variant);
		_stash.add(item);
	}

});

