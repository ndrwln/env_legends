this.herbal_poison_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.herbal_poison";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/poison_item");
		this.m.Cost = 30;
		local ingredients = [
			{
				Script = "scripts/items/supplies/roots_and_berries_item",
				Num = 2
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_herbcraft"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/poison_item"));
	}

});

